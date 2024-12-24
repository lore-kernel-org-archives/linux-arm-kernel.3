Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AF2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 14:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=loJQQ4pqZ47nrjW4300ckgAvNibzSRJeQXViPmPbc+8=; b=K6m6ke3lEncCMhN33OR6FoJdIV
	zeacBTq2e8YwdMPaJEINpRR3Kw5s38Vv/CuUERnep0D+0jKT7i/rbLjkA3HMMv81lHmQZ/y9HCCSa
	csDSGmJxQMrwxODGDU8lsDuoanah/apD6+1mSmBVgIeGJ02eGHLFvwQuJFXXunTfuyRvBpWGLv1Hm
	yrEhfP/bgroYfNR5DTH3Yh+Ew7empVCzld6i9H9rfwgc8RgVnO1LG5CqMiJRpiSoEgeowsaeake4U
	1FaafUaHSzKKaq1XW7YROx0ra+xRkNZWVkcWB0AFhdI1Hu7ODGxY97A4xF16W6ow/L+YdHLqYEWgf
	f0hCD1KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ5ZD-0000000C6l4-1vC2;
	Tue, 24 Dec 2024 14:07:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ5TH-0000000C5yj-38co
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 14:01:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24EFC2008;
	Tue, 24 Dec 2024 06:01:42 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B7BD3F59E;
	Tue, 24 Dec 2024 06:01:13 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Tue, 24 Dec 2024 13:57:52 +0000
Subject: [PATCH 5/5] firmware: arm_ffa: Fix big-endian support in
 __ffa_partition_info_regs_get()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-ffa_updates-v1-5-01233aba3e1e@arm.com>
References: <20241224-ffa_updates-v1-0-01233aba3e1e@arm.com>
In-Reply-To: <20241224-ffa_updates-v1-0-01233aba3e1e@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2970; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=8PoYp80YnxCA99g/OmQlLeeIzCDfYeP4snzLnAUmwtk=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnar6l3XRlKjtMg6uDxIl9RjBWqDRyRmdd59/2N
 VyB7K8D/euJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ2q+pQAKCRAAQbq8MX7i
 mPFgD/46xOZxqIMfUkH+doPiOY3d1l16m+uMBdkipigRAb+Bs5e/OtOOgIZRaOoSDCNAgafxbra
 RkMNC5yvHwcCAjbOoJBOOuR95ck23XsI04/3lyhmAS8k832ljSonVzCxnS7VS5pawBGEhF5Q5FV
 uerkw6AXZ33/ritIJYvTLw8uk/lYrfIGm9tiuPK+dkcnsZMGbqsoAP+9Tyff1Rfs+s2dK6nsDhl
 A0runS0ku2xgx/Wsrxp3a3//oWzDakf6kc/qg4jhl5z4A2gc6OE0v0edL2r8052wY7bpM3cUci4
 8EQIcg7epD6OsxjwnHdp07IkEGvB6dVDQRFpXLqkRGpo9VrD3CGGQDKzpSFCfiVWsxRzJoD3G4+
 5Q0w9kyfJdZmn041DUSTOwBDqfKwWzL1XP3tx3mbQP8FzDHYjHaopmNesDu09nfEeMVA5uGXMCV
 uBWkMAD2uec9ebJ5J/ihCtSQJiRJ/OgqS2LKfAEy+eXs6wRRq7Sr8ShS9wRC32XWlc59HfspZmI
 GkdCv/doWRHFfKSO6YLANEvuMQ7jZtPUbS9zfJ2JqH9s42yzZTlhBrUsqehpd/PLcuoVHZlLZxB
 zNBUUeGSAtkkb5jB803AEmA5twMzBEPSyU/ioptpPUOEv04bjUzXhofvaXL1uEbX21+OGrwQQlf
 VuoaGPZTUFvMHNg==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_060115_881154_0C0069EB 
X-CRM114-Status: GOOD (  14.54  )
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


