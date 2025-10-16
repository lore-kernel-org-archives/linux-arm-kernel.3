Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13D8CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 09:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hMLsxaL3DzYEVhuTA3fWJD3Eqrts1fjvXTyVEV7xq+Y=; b=GacHa2H4w9I3J9zJHp/Q+aFpiH
	usIoaNBAtS4gpyUMSuSM4lrAMHSefFByGoVdFLv6lB8ZQRBFPZCcTK4JGhBIZnWCCYPnIY+JegZ0Y
	aI1msd/BKJwWOvB7oiSNIZdIAPrWIpvEXX6V5A11dwHO9hUru5/17WFkhQMGylfUbv/Azd8A13zM0
	/TS/WBVQryUw4dgjLUjEVSrXoRI7j5rSr/dQRSOsb2sJ5ZiBZWNrtbzG7TOSPOjzKBwWB8tVi8dti
	DyBWH3NZ2sHWwrKR2pI7aKXnKj7f/lrz4VhH1LW8cqUhVo+icsV87kQu/bds7z66k4HAE83bj1aU+
	SMKyuqCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KUB-00000004Fpv-2WPt;
	Thu, 16 Oct 2025 09:41:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KU9-00000004Fp4-18wF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 09:41:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF0591688;
	Thu, 16 Oct 2025 02:41:16 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 212983F6A8;
	Thu, 16 Oct 2025 02:41:23 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH] firmware: arm_ffa: Tie FF-A version checks to specific features
Date: Thu, 16 Oct 2025 10:41:11 +0100
Message-Id: <20251016094111.946236-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_024125_376458_141F5448 
X-CRM114-Status: GOOD (  11.14  )
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

The FF-A driver currently performs loose comparisons when checking the
supported FF-A feature, which can inadvertently treat future or
intermediate revisions as compatible.

Replace generic `version {>,<} FFA_VERSION_1_*` pattern checks with
feature-specific macros that clearly express which functionality
depends on FF-A versioning.

This improves readability and future maintainability by tying each
feature (e.g. GET_COUNT_ONLY, size/UUID/exec state in responses) to
explicit version requirements instead of relying on generic version
comparisons. This improves robustness and clarity as the FF-A
specification evolves.

No functional change, only improves code readability.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index c72ee4756585..cf620c1a7692 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -246,6 +246,11 @@ static int ffa_features(u32 func_feat_id, u32 input_props,
 }
 
 #define PARTITION_INFO_GET_RETURN_COUNT_ONLY	BIT(0)
+#define FFA_SUPPORTS_GET_COUNT_ONLY(version)	((version) > FFA_VERSION_1_0)
+#define FFA_PART_INFO_HAS_SIZE_IN_RESP(version)	((version) > FFA_VERSION_1_0)
+#define FFA_PART_INFO_HAS_UUID_IN_RESP(version)	((version) > FFA_VERSION_1_0)
+#define FFA_PART_INFO_HAS_EXEC_STATE_IN_RESP(version)	\
+	((version) > FFA_VERSION_1_0)
 
 /* buffer must be sizeof(struct ffa_partition_info) * num_partitions */
 static int
@@ -255,7 +260,7 @@ __ffa_partition_info_get(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 	int idx, count, flags = 0, sz, buf_sz;
 	ffa_value_t partition_info;
 
-	if (drv_info->version > FFA_VERSION_1_0 &&
+	if (FFA_SUPPORTS_GET_COUNT_ONLY(drv_info->version) &&
 	    (!buffer || !num_partitions)) /* Just get the count for now */
 		flags = PARTITION_INFO_GET_RETURN_COUNT_ONLY;
 
@@ -273,12 +278,11 @@ __ffa_partition_info_get(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 
 	count = partition_info.a2;
 
-	if (drv_info->version > FFA_VERSION_1_0) {
+	if (FFA_PART_INFO_HAS_SIZE_IN_RESP(drv_info->version)) {
 		buf_sz = sz = partition_info.a3;
 		if (sz > sizeof(*buffer))
 			buf_sz = sizeof(*buffer);
 	} else {
-		/* FFA_VERSION_1_0 lacks size in the response */
 		buf_sz = sz = 8;
 	}
 
@@ -1706,7 +1710,7 @@ static int ffa_setup_partitions(void)
 	struct ffa_device *ffa_dev;
 	struct ffa_partition_info *pbuf, *tpbuf;
 
-	if (drv_info->version == FFA_VERSION_1_0) {
+	if (!FFA_PART_INFO_HAS_UUID_IN_RESP(drv_info->version)) {
 		ret = bus_register_notifier(&ffa_bus_type, &ffa_bus_nb);
 		if (ret)
 			pr_err("Failed to register FF-A bus notifiers\n");
@@ -1733,7 +1737,7 @@ static int ffa_setup_partitions(void)
 			continue;
 		}
 
-		if (drv_info->version > FFA_VERSION_1_0 &&
+		if (FFA_PART_INFO_HAS_EXEC_STATE_IN_RESP(drv_info->version) &&
 		    !(tpbuf->properties & FFA_PARTITION_AARCH64_EXEC))
 			ffa_mode_32bit_set(ffa_dev);
 
-- 
2.34.1


