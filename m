Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50A2C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 11:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=loJQQ4pqZ47nrjW4300ckgAvNibzSRJeQXViPmPbc+8=; b=s1vhkj6CpLgiiDwGWnlf2iI4fL
	/X6ZWL+Eg+TVgdbOsoMBahXkFINy9Aea9sHwDgwal+xPr9IZYdEWhuroXhf4Zz8Ml/NSJ5NkduIfN
	AsdAu64xUct8YESlhbZmqOkZcLyQGqbeNlOt9Ctfp9kWbPWps3hHZhPFsLi3bXVt+HbMKx8QGEIdu
	YMjAPMKtTSZsvEUM+e9jlvdaH1JGQ8nSX2Cs+PQceFN3X/1qdrDYQDxC7HYoEW+Dxqaak9ICSv/9h
	CjXnD2alEQf4mL8SpmjgfDWNhksVJuNWQm5IP5lrrIO7fQz7I4uVbQIUf/y2P2UbO1brd+swTw8kX
	mISWiK1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdpGl-0000000AVzC-276h;
	Fri, 31 Jan 2025 11:33:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdp95-0000000ATpp-3QV9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 11:25:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E16F2FEC;
	Fri, 31 Jan 2025 03:25:36 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCCBD3F63F;
	Fri, 31 Jan 2025 03:25:10 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:05 +0000
Subject: [PATCH v2 05/18] firmware: arm_ffa: Fix big-endian support in
 __ffa_partition_info_regs_get()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-5-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2970; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=8PoYp80YnxCA99g/OmQlLeeIzCDfYeP4snzLnAUmwtk=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMPF3AwbZPpDnrAK4QCNPF48Pwgb7Ddgyfwj
 ery7HTg8GCJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzDwAKCRAAQbq8MX7i
 mEKpEACGGMhs9IiGXnsVEw18BL1U9sImXyJ7pzdVolX7K9YpyZ7q9B1YoVpSDXyn5qftYgdFuec
 4q+Kt0bPJlMO2fEonRfhu6lKwdAd0hl4BF8UNqIr4QQpClxQcJh1TfoY2sf5Fv0LwokK11ZEcgJ
 juvhpxT6poK21pRWBkpc8hPGipeyQilieDRrzQf90xVap1HNgBsTZiO8FVdTrNgHN5J/eCqILld
 LRaa1uGOBAt7syDbwa8h3Gxbez2hwwuMF5pw0Cra2qF41ZO+KHl/xs5P6YMGb4g1/RkVHIn7Rl7
 WpEjks7Em6DZUGo7RWf4cUHxlSqXOzAwTc9wCZWRDCM+MBvREwVVR8Sf4bwGB0MoVAIQgN3aBur
 1PVOHiOuWJCjMfutp2J0N0wgVLqOXAEmD9Fxzwa/SfcBPRG1fXb21smqFHQnW/mtXmx5Uvq36Mq
 8VeTCvc1sHpnecLYX1GC68TWTmmU3SocYBPNVFotiJQPyQxbXmaCpt1Pz1S1prSmPuKr+c7VekG
 DfkzijcHeOTaobE2KmWcSqrHSX/hcg7FPo1Iygf97OPJQQSHsNPzXJIL73Y9Rd6yJqDlEAhb4SP
 zdc+vcMU1O/GQwtT+uluZK4LshUHQlMPWWuPbw6Xn24rZGHqQL2ViR4NdzZJZ4yxqUpfMuNl/s/
 L0YTBxzAZWQc9MQ==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_032511_945959_A70BD06E 
X-CRM114-Status: GOOD (  14.72  )
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

Currently the FF-A driver doesn't support big-endian correctly. It is
hard to regularly test the setup due to lack of test infrastructure and
tools.

In order to support full stack, we need to take small steps in getting
the support for big-endian kernel added slowly. This change fixes the
support in __ffa_partition_info_regs_get() so that the response from the
firmware are converted correctly as required. With this change, we can
enumerate all the FF-A devices correctly in the big-endian kernel if the
FFA_PARTITION_INFO_REGS_GET is supported.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index bc6ffd25ad2e2fea0fe3610cf896718dbed8f0ad..87e106c728b89f3ce7c11219cf7cad9cc166dda2 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -307,14 +307,24 @@ __ffa_partition_info_get(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 #define CURRENT_INDEX(x)	((u16)(FIELD_GET(CURRENT_INDEX_MASK, (x))))
 #define UUID_INFO_TAG(x)	((u16)(FIELD_GET(UUID_INFO_TAG_MASK, (x))))
 #define PARTITION_INFO_SZ(x)	((u16)(FIELD_GET(PARTITION_INFO_SZ_MASK, (x))))
+#define PART_INFO_ID_MASK	GENMASK(15, 0)
+#define PART_INFO_EXEC_CXT_MASK	GENMASK(31, 16)
+#define PART_INFO_PROPS_MASK	GENMASK(63, 32)
+#define PART_INFO_ID(x)		((u16)(FIELD_GET(PART_INFO_ID_MASK, (x))))
+#define PART_INFO_EXEC_CXT(x)	((u16)(FIELD_GET(PART_INFO_EXEC_CXT_MASK, (x))))
+#define PART_INFO_PROPERTIES(x)	((u32)(FIELD_GET(PART_INFO_PROPS_MASK, (x))))
 static int
 __ffa_partition_info_get_regs(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 			      struct ffa_partition_info *buffer, int num_parts)
 {
 	u16 buf_sz, start_idx, cur_idx, count = 0, prev_idx = 0, tag = 0;
+	struct ffa_partition_info *buf = buffer;
 	ffa_value_t partition_info;
 
 	do {
+		__le64 *regs;
+		int idx;
+
 		start_idx = prev_idx ? prev_idx + 1 : 0;
 
 		invoke_ffa_fn((ffa_value_t){
@@ -338,8 +348,25 @@ __ffa_partition_info_get_regs(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 		if (buf_sz > sizeof(*buffer))
 			buf_sz = sizeof(*buffer);
 
-		memcpy(buffer + prev_idx * buf_sz, &partition_info.a3,
-		       (cur_idx - start_idx + 1) * buf_sz);
+		regs = (void *)&partition_info.a3;
+		for (idx = 0; idx < cur_idx - start_idx + 1; idx++, buf++) {
+			union {
+				uuid_t uuid;
+				u64 regs[2];
+			} uuid_regs = {
+				.regs = {
+					le64_to_cpu(*(regs + 1)),
+					le64_to_cpu(*(regs + 2)),
+					}
+			};
+			u64 val = *(u64 *)regs;
+
+			buf->id = PART_INFO_ID(val);
+			buf->exec_ctxt = PART_INFO_EXEC_CXT(val);
+			buf->properties = PART_INFO_PROPERTIES(val);
+			uuid_copy(&buf->uuid, &uuid_regs.uuid);
+			regs += 3;
+		}
 		prev_idx = cur_idx;
 
 	} while (cur_idx < (count - 1));

-- 
2.34.1


