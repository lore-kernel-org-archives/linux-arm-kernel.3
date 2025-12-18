Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D73D6D226
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 14:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+ZyLhve6b3HQ8pj4r0VcpIDaxWnAuDooGGmEmmxKJIE=; b=s0xk5HJcxNUNGONtEf7Q6p9wSY
	wdxZEd9paFmDnIIv/ezaAuMQ/K36TDcnhgVZrBBlkb5aZuOLNAzS7s4bBsopBOywmYe/1b2bPPmR1
	bXDBVISq5vMcRlBJmGRzA7wi2q3T3ukPxpiFZ+uBDWISBbi8STXNV38GmqzzcswLzfrX7WdWD9aim
	3EKbCCcRT27O+O3okQtasUWDsB0tI2GTOcvsuF9MApKDg7acxBp9wdll0janrp4LjbON9jgldNOeA
	EepDYxP7WII71wdSmX9QXMBOFPzoTWCGgEyyryOD9TNnvgO9hf01vVaLhTOpuGJTpErK2OXv882n+
	A5rFCDzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWErT-00000008bfh-3dw9;
	Thu, 18 Dec 2025 14:20:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWErR-00000008bfG-1ZIs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 14:20:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 778D5FEC;
	Thu, 18 Dec 2025 06:20:01 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AD2573F762;
	Thu, 18 Dec 2025 06:20:07 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Sourav Mohapatra <sourav.mohapatra@arm.com>
Subject: [PATCH] firmware: arm_ffa: Correct 32-bit response handling in NOTIFICATION_INFO_GET
Date: Thu, 18 Dec 2025 14:20:01 +0000
Message-Id: <20251218142001.2457111-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_062009_550921_08594447 
X-CRM114-Status: GOOD (  13.47  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The FF-A specification allows NOTIFICATION_INFO_GET to return either a
64-bit (FFA_FN64_SUCCESS) or a 32-bit (FFA_SUCCESS) response, depending on
whether the firmware chooses the SMC64 or SMC32 calling convention.

The driver previously detected the response format by checking ret.a0, but
still interpreted the returned ID lists (x3..x17 or w3..w7) as if they always
followed the 64-bit SMC64 layout. In the SMC32 case, the upper 32 bits of
each argument register are undefined by the calling convention, meaning the
driver could read stale or garbage values when parsing notification IDs.

This resulted in incorrectly decoded partition/VCPU IDs whenever the FF-A
firmware used an SMC32 return path.

Fix the issue by:

- Introducing logic to map list indices to the correct u16 offsets,
  depending on whether the response width matches the kernel word size
  or is a 32-bit response on a 64-bit kernel.
- Ensuring that the packed ID list is parsed using the proper layout,
  avoiding reads from undefined upper halves in the SMC32 case.

With this change, NOTIFICATION_INFO_GET now correctly interprets ID list
entries regardless of the response width, aligning the driver with the FF-A
specification.

Fixes: 3522be48d82b ("firmware: arm_ffa: Implement the NOTIFICATION_INFO_GET interface")
Reported-by: Sourav Mohapatra <sourav.mohapatra@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 33 +++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index c3f7062d6159..911a1d49498d 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -981,10 +981,27 @@ static void __do_sched_recv_cb(u16 part_id, u16 vcpu, bool is_per_vcpu)
 	}
 }
 
+/*
+ * Map logical ID index to the u16 index within the packed ID list.
+ *
+ * For native responses (FF-A width == kernel word size), IDs are
+ * tightly packed: idx -> idx.
+ *
+ * For 32-bit responses on a 64-bit kernel, each 64-bit register
+ * contributes 4 x u16 values but only the lower 2 are defined; the
+ * upper 2 are garbage. This mapping skips those upper halves:
+ *   0,1,2,3,4,5,... -> 0,1,4,5,8,9,...
+ */
+static int list_idx_to_u16_idx(int idx, bool is_native_resp)
+{
+	return is_native_resp ? idx : idx + 2 * (idx >> 1);
+}
+
 static void ffa_notification_info_get(void)
 {
-	int idx, list, max_ids, lists_cnt, ids_processed, ids_count[MAX_IDS_64];
-	bool is_64b_resp;
+	int ids_processed, ids_count[MAX_IDS_64];
+	int idx, list, max_ids, lists_cnt;
+	bool is_64b_resp, is_native_resp;
 	ffa_value_t ret;
 	u64 id_list;
 
@@ -1001,6 +1018,7 @@ static void ffa_notification_info_get(void)
 		}
 
 		is_64b_resp = (ret.a0 == FFA_FN64_SUCCESS);
+		is_native_resp = (ret.a0 == FFA_FN_NATIVE(SUCCESS));
 
 		ids_processed = 0;
 		lists_cnt = FIELD_GET(NOTIFICATION_INFO_GET_ID_COUNT, ret.a2);
@@ -1017,12 +1035,16 @@ static void ffa_notification_info_get(void)
 
 		/* Process IDs */
 		for (list = 0; list < lists_cnt; list++) {
+			int u16_idx;
 			u16 vcpu_id, part_id, *packed_id_list = (u16 *)&ret.a3;
 
 			if (ids_processed >= max_ids - 1)
 				break;
 
-			part_id = packed_id_list[ids_processed++];
+			u16_idx = list_idx_to_u16_idx(ids_processed,
+						      is_native_resp);
+			part_id = packed_id_list[u16_idx];
+			ids_processed++;
 
 			if (ids_count[list] == 1) { /* Global Notification */
 				__do_sched_recv_cb(part_id, 0, false);
@@ -1034,7 +1056,10 @@ static void ffa_notification_info_get(void)
 				if (ids_processed >= max_ids - 1)
 					break;
 
-				vcpu_id = packed_id_list[ids_processed++];
+				u16_idx = list_idx_to_u16_idx(ids_processed,
+							      is_native_resp);
+				vcpu_id = packed_id_list[u16_idx];
+				ids_processed++;
 
 				__do_sched_recv_cb(part_id, vcpu_id, true);
 			}
-- 
2.34.1


