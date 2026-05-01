Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD030CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O6kXYkgLH2ICtXbKKNbc9V/7v2AisF8lJzqevwz+DWw=; b=wxuoLQOQp045BpzpMvwTi53pGk
	uLSl2t7HUSmL/4cozrbMTh3jAHK7CaAk3PO6xHbAageQJ4/iK9VHbBt3P8YE524VnbOELRtqc3RXr
	UAqiOhlpsG6f2P3uxfihFmxgtgA1ou9ALgICZtoWe4zr/8p8U7/X/m3UQqWbmpDfW8Ak87UamDGZW
	QZ87J53zjnFRC0SM+ZFpdOitjOlrfU1PwH/bEZO5Jc3phUQ28WCcjS2VbvCjMaJSgMV9M1hUtX0Bo
	YGYpt1Yum57u5S9uLghGA5s47GrUV2EM+oesedLfoXz4Y8P+q8IKMyMiDxgTdrS2bcGbSBc2FGR5T
	7m2TW7fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIluZ-00000006cZi-2ZSL;
	Fri, 01 May 2026 11:19:59 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIluX-00000006cYR-3FbJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:19:59 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48a55ecc249so11293885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634396; x=1778239196; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=O6kXYkgLH2ICtXbKKNbc9V/7v2AisF8lJzqevwz+DWw=;
        b=KIViFrrPdscfiG53elGpgvU2DI8u5MhQKlDqIRuRBiZ+wbvJ8p5VUFb0sdRpswpwyH
         TPRQkmuq/WyoWrjg+xL2o+DafQkIygwKThgKV0dSixupd4JJovMux93e24s5aKYoWgwu
         v1cCJ4ATHWwkqR1+FB+mrYHo0vTLuvisbyrFPe3Il01EaO9Uo2eQ+HdZflCs/XficfU7
         5/gdZXWIUJoaIM2QOCe+ihpCgOj7DyuCP5hCkm6DmLBlkzGRkuMPmwXp4OtuAAt2OUfY
         eiPKv6/Cj5h/uIIC8AkryVi+WNfKl47t+QSWNZTzdWOpP+MLBdDCGhwiW5jGXExb9Nq+
         JyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634396; x=1778239196;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O6kXYkgLH2ICtXbKKNbc9V/7v2AisF8lJzqevwz+DWw=;
        b=HPY3eLYtluLJnqYHWmPZfppxAJPhhxf0mWobSLWAMk4Lxvap1DfJE+U7XvrgK1PhFJ
         LdRGs1ir8cswQ7iKyoW8vlDHZT4NUOFbujWl5bbwBpq8D4R+Mv+AKexBBNb0f+llO1ET
         e+36L1xaH9V0jgcDMbv8nNZTU1M57EI24mcB+JNfh3280h1OCYj0z6obb9UvtaUFXpwl
         7o66O6gLLH8jRmJmRqD/QKIsI7/0HKb/CrTLEO6fdHXzNLMI+Dj41aO31S4w3ihYwKsq
         ZsWXGaRA2UBRxA/zT2VpDD2Ag/9YGFUfW5iyUOKBRS50i8DGhU/3nvQJI85hiRTZ1bGn
         /0Zw==
X-Gm-Message-State: AOJu0YwiRjndPcjiR0GIXuswuRMO3y/shvZObZZNoUZ8RGbGAL1mW042
	GH39U/SANkNnG6IqPvUSh9+BFiuYIlhaoSMFRonBVW2QFv2kHgEh2b7UISmxASiMO5lEASuILUh
	64DZ/M+lar/bSpw5irTIelrm3cFoKrA17cDGOHphKGv1owNGKRUCVUlHwBNaUKiQkaIrld8Wec8
	fCtBgx+20O+w/YNb9BApLHk9LUbhnD87EpVWbyQApkfadQDuAYBapGfcV5NI60rcImOg==
X-Received: from wmxb6-n2.prod.google.com ([2002:a05:600d:8446:20b0:488:7b85:acf0])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f09:b0:48a:525b:e148 with SMTP id 5b1f17b1804b1-48a844e4a91mr99363655e9.4.1777634395587;
 Fri, 01 May 2026 04:19:55 -0700 (PDT)
Date: Fri,  1 May 2026 11:19:05 +0000
In-Reply-To: <20260501111928.259252-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260501111928.259252-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501111928.259252-4-smostafa@google.com>
Subject: [PATCH v6 03/25] iommu/arm-smmu-v3: Split code with hyp
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	mark.rutland@arm.com, qperret@google.com, tabba@google.com, 
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_041957_955796_1EE5CD89 
X-CRM114-Status: GOOD (  20.06  )
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

The KVM SMMUv3 driver would re-use some of the cmdq and ste code
inside the hypervisor, move these functions to a new common C file that
is shared between the host kernel and the hypervisor.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/Makefile        |   2 +-
 .../arm/arm-smmu-v3/arm-smmu-v3-common-lib.c  | 114 +++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 161 ------------------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  61 +++++++
 4 files changed, 176 insertions(+), 162 deletions(-)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.c

diff --git a/drivers/iommu/arm/arm-smmu-v3/Makefile b/drivers/iommu/arm/arm-smmu-v3/Makefile
index 493a659cc66b..c9ce392e6d31 100644
--- a/drivers/iommu/arm/arm-smmu-v3/Makefile
+++ b/drivers/iommu/arm/arm-smmu-v3/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_ARM_SMMU_V3) += arm_smmu_v3.o
-arm_smmu_v3-y := arm-smmu-v3.o
+arm_smmu_v3-y := arm-smmu-v3.o arm-smmu-v3-common-lib.o
 arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_IOMMUFD) += arm-smmu-v3-iommufd.o
 arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_SVA) += arm-smmu-v3-sva.o
 arm_smmu_v3-$(CONFIG_TEGRA241_CMDQV) += tegra241-cmdqv.o
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.c
new file mode 100644
index 000000000000..62744c8548a8
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2015 ARM Limited
+ *
+ * Author: Will Deacon <will.deacon@arm.com>
+ * Arm SMMUv3 driver functions shared with hypervisor.
+ */
+
+#include "arm-smmu-v3.h"
+#include <asm-generic/errno-base.h>
+
+#include <linux/string.h>
+
+int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
+{
+	memset(cmd, 0, 1 << CMDQ_ENT_SZ_SHIFT);
+	cmd[0] |= FIELD_PREP(CMDQ_0_OP, ent->opcode);
+
+	switch (ent->opcode) {
+	case CMDQ_OP_TLBI_EL2_ALL:
+	case CMDQ_OP_TLBI_NSNH_ALL:
+		break;
+	case CMDQ_OP_PREFETCH_CFG:
+		cmd[0] |= FIELD_PREP(CMDQ_PREFETCH_0_SID, ent->prefetch.sid);
+		break;
+	case CMDQ_OP_CFGI_CD:
+		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SSID, ent->cfgi.ssid);
+		fallthrough;
+	case CMDQ_OP_CFGI_STE:
+		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
+		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_LEAF, ent->cfgi.leaf);
+		break;
+	case CMDQ_OP_CFGI_CD_ALL:
+		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
+		break;
+	case CMDQ_OP_CFGI_ALL:
+		/* Cover the entire SID range */
+		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_RANGE, 31);
+		break;
+	case CMDQ_OP_TLBI_NH_VA:
+		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
+		fallthrough;
+	case CMDQ_OP_TLBI_EL2_VA:
+		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_NUM, ent->tlbi.num);
+		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_SCALE, ent->tlbi.scale);
+		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
+		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_LEAF, ent->tlbi.leaf);
+		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_TTL, ent->tlbi.ttl);
+		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_TG, ent->tlbi.tg);
+		cmd[1] |= ent->tlbi.addr & CMDQ_TLBI_1_VA_MASK;
+		break;
+	case CMDQ_OP_TLBI_S2_IPA:
+		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_NUM, ent->tlbi.num);
+		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_SCALE, ent->tlbi.scale);
+		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
+		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_LEAF, ent->tlbi.leaf);
+		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_TTL, ent->tlbi.ttl);
+		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_TG, ent->tlbi.tg);
+		cmd[1] |= ent->tlbi.addr & CMDQ_TLBI_1_IPA_MASK;
+		break;
+	case CMDQ_OP_TLBI_NH_ASID:
+		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
+		fallthrough;
+	case CMDQ_OP_TLBI_NH_ALL:
+	case CMDQ_OP_TLBI_S12_VMALL:
+		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
+		break;
+	case CMDQ_OP_TLBI_EL2_ASID:
+		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
+		break;
+	case CMDQ_OP_ATC_INV:
+		cmd[0] |= FIELD_PREP(CMDQ_0_SSV, ent->substream_valid);
+		cmd[0] |= FIELD_PREP(CMDQ_ATC_0_GLOBAL, ent->atc.global);
+		cmd[0] |= FIELD_PREP(CMDQ_ATC_0_SSID, ent->atc.ssid);
+		cmd[0] |= FIELD_PREP(CMDQ_ATC_0_SID, ent->atc.sid);
+		cmd[1] |= FIELD_PREP(CMDQ_ATC_1_SIZE, ent->atc.size);
+		cmd[1] |= ent->atc.addr & CMDQ_ATC_1_ADDR_MASK;
+		break;
+	case CMDQ_OP_PRI_RESP:
+		cmd[0] |= FIELD_PREP(CMDQ_0_SSV, ent->substream_valid);
+		cmd[0] |= FIELD_PREP(CMDQ_PRI_0_SSID, ent->pri.ssid);
+		cmd[0] |= FIELD_PREP(CMDQ_PRI_0_SID, ent->pri.sid);
+		cmd[1] |= FIELD_PREP(CMDQ_PRI_1_GRPID, ent->pri.grpid);
+		switch (ent->pri.resp) {
+		case PRI_RESP_DENY:
+		case PRI_RESP_FAIL:
+		case PRI_RESP_SUCC:
+			break;
+		default:
+			return -EINVAL;
+		}
+		cmd[1] |= FIELD_PREP(CMDQ_PRI_1_RESP, ent->pri.resp);
+		break;
+	case CMDQ_OP_RESUME:
+		cmd[0] |= FIELD_PREP(CMDQ_RESUME_0_SID, ent->resume.sid);
+		cmd[0] |= FIELD_PREP(CMDQ_RESUME_0_RESP, ent->resume.resp);
+		cmd[1] |= FIELD_PREP(CMDQ_RESUME_1_STAG, ent->resume.stag);
+		break;
+	case CMDQ_OP_CMD_SYNC:
+		if (ent->sync.msiaddr) {
+			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_IRQ);
+			cmd[1] |= ent->sync.msiaddr & CMDQ_SYNC_1_MSIADDR_MASK;
+		} else {
+			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
+		}
+		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSH, ARM_SMMU_SH_ISH);
+		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIATTR, ARM_SMMU_MEMATTR_OIWB);
+		break;
+	default:
+		return -ENOENT;
+	}
+
+	return 0;
+}
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index e8d7dbe495f0..cb64f88989f0 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -125,33 +125,6 @@ static void parse_driver_options(struct arm_smmu_device *smmu)
 }
 
 /* Low-level queue manipulation functions */
-static bool queue_has_space(struct arm_smmu_ll_queue *q, u32 n)
-{
-	u32 space, prod, cons;
-
-	prod = Q_IDX(q, q->prod);
-	cons = Q_IDX(q, q->cons);
-
-	if (Q_WRP(q, q->prod) == Q_WRP(q, q->cons))
-		space = (1 << q->max_n_shift) - (prod - cons);
-	else
-		space = cons - prod;
-
-	return space >= n;
-}
-
-static bool queue_full(struct arm_smmu_ll_queue *q)
-{
-	return Q_IDX(q, q->prod) == Q_IDX(q, q->cons) &&
-	       Q_WRP(q, q->prod) != Q_WRP(q, q->cons);
-}
-
-static bool queue_empty(struct arm_smmu_ll_queue *q)
-{
-	return Q_IDX(q, q->prod) == Q_IDX(q, q->cons) &&
-	       Q_WRP(q, q->prod) == Q_WRP(q, q->cons);
-}
-
 static bool queue_consumed(struct arm_smmu_ll_queue *q, u32 prod)
 {
 	return ((Q_WRP(q, q->cons) == Q_WRP(q, prod)) &&
@@ -170,12 +143,6 @@ static void queue_sync_cons_out(struct arm_smmu_queue *q)
 	writel_relaxed(q->llq.cons, q->cons_reg);
 }
 
-static void queue_inc_cons(struct arm_smmu_ll_queue *q)
-{
-	u32 cons = (Q_WRP(q, q->cons) | Q_IDX(q, q->cons)) + 1;
-	q->cons = Q_OVF(q->cons) | Q_WRP(q, cons) | Q_IDX(q, cons);
-}
-
 static void queue_sync_cons_ovf(struct arm_smmu_queue *q)
 {
 	struct arm_smmu_ll_queue *llq = &q->llq;
@@ -207,12 +174,6 @@ static int queue_sync_prod_in(struct arm_smmu_queue *q)
 	return ret;
 }
 
-static u32 queue_inc_prod_n(struct arm_smmu_ll_queue *q, int n)
-{
-	u32 prod = (Q_WRP(q, q->prod) | Q_IDX(q, q->prod)) + n;
-	return Q_OVF(q->prod) | Q_WRP(q, prod) | Q_IDX(q, prod);
-}
-
 static void queue_poll_init(struct arm_smmu_device *smmu,
 			    struct arm_smmu_queue_poll *qp)
 {
@@ -240,14 +201,6 @@ static int queue_poll(struct arm_smmu_queue_poll *qp)
 	return 0;
 }
 
-static void queue_write(__le64 *dst, u64 *src, size_t n_dwords)
-{
-	int i;
-
-	for (i = 0; i < n_dwords; ++i)
-		*dst++ = cpu_to_le64(*src++);
-}
-
 static void queue_read(u64 *dst, __le64 *src, size_t n_dwords)
 {
 	int i;
@@ -268,108 +221,6 @@ static int queue_remove_raw(struct arm_smmu_queue *q, u64 *ent)
 }
 
 /* High-level queue accessors */
-static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
-{
-	memset(cmd, 0, 1 << CMDQ_ENT_SZ_SHIFT);
-	cmd[0] |= FIELD_PREP(CMDQ_0_OP, ent->opcode);
-
-	switch (ent->opcode) {
-	case CMDQ_OP_TLBI_EL2_ALL:
-	case CMDQ_OP_TLBI_NSNH_ALL:
-		break;
-	case CMDQ_OP_PREFETCH_CFG:
-		cmd[0] |= FIELD_PREP(CMDQ_PREFETCH_0_SID, ent->prefetch.sid);
-		break;
-	case CMDQ_OP_CFGI_CD:
-		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SSID, ent->cfgi.ssid);
-		fallthrough;
-	case CMDQ_OP_CFGI_STE:
-		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
-		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_LEAF, ent->cfgi.leaf);
-		break;
-	case CMDQ_OP_CFGI_CD_ALL:
-		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
-		break;
-	case CMDQ_OP_CFGI_ALL:
-		/* Cover the entire SID range */
-		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_RANGE, 31);
-		break;
-	case CMDQ_OP_TLBI_NH_VA:
-		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
-		fallthrough;
-	case CMDQ_OP_TLBI_EL2_VA:
-		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_NUM, ent->tlbi.num);
-		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_SCALE, ent->tlbi.scale);
-		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
-		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_LEAF, ent->tlbi.leaf);
-		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_TTL, ent->tlbi.ttl);
-		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_TG, ent->tlbi.tg);
-		cmd[1] |= ent->tlbi.addr & CMDQ_TLBI_1_VA_MASK;
-		break;
-	case CMDQ_OP_TLBI_S2_IPA:
-		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_NUM, ent->tlbi.num);
-		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_SCALE, ent->tlbi.scale);
-		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
-		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_LEAF, ent->tlbi.leaf);
-		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_TTL, ent->tlbi.ttl);
-		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_TG, ent->tlbi.tg);
-		cmd[1] |= ent->tlbi.addr & CMDQ_TLBI_1_IPA_MASK;
-		break;
-	case CMDQ_OP_TLBI_NH_ASID:
-		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
-		fallthrough;
-	case CMDQ_OP_TLBI_NH_ALL:
-	case CMDQ_OP_TLBI_S12_VMALL:
-		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
-		break;
-	case CMDQ_OP_TLBI_EL2_ASID:
-		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
-		break;
-	case CMDQ_OP_ATC_INV:
-		cmd[0] |= FIELD_PREP(CMDQ_0_SSV, ent->substream_valid);
-		cmd[0] |= FIELD_PREP(CMDQ_ATC_0_GLOBAL, ent->atc.global);
-		cmd[0] |= FIELD_PREP(CMDQ_ATC_0_SSID, ent->atc.ssid);
-		cmd[0] |= FIELD_PREP(CMDQ_ATC_0_SID, ent->atc.sid);
-		cmd[1] |= FIELD_PREP(CMDQ_ATC_1_SIZE, ent->atc.size);
-		cmd[1] |= ent->atc.addr & CMDQ_ATC_1_ADDR_MASK;
-		break;
-	case CMDQ_OP_PRI_RESP:
-		cmd[0] |= FIELD_PREP(CMDQ_0_SSV, ent->substream_valid);
-		cmd[0] |= FIELD_PREP(CMDQ_PRI_0_SSID, ent->pri.ssid);
-		cmd[0] |= FIELD_PREP(CMDQ_PRI_0_SID, ent->pri.sid);
-		cmd[1] |= FIELD_PREP(CMDQ_PRI_1_GRPID, ent->pri.grpid);
-		switch (ent->pri.resp) {
-		case PRI_RESP_DENY:
-		case PRI_RESP_FAIL:
-		case PRI_RESP_SUCC:
-			break;
-		default:
-			return -EINVAL;
-		}
-		cmd[1] |= FIELD_PREP(CMDQ_PRI_1_RESP, ent->pri.resp);
-		break;
-	case CMDQ_OP_RESUME:
-		cmd[0] |= FIELD_PREP(CMDQ_RESUME_0_SID, ent->resume.sid);
-		cmd[0] |= FIELD_PREP(CMDQ_RESUME_0_RESP, ent->resume.resp);
-		cmd[1] |= FIELD_PREP(CMDQ_RESUME_1_STAG, ent->resume.stag);
-		break;
-	case CMDQ_OP_CMD_SYNC:
-		if (ent->sync.msiaddr) {
-			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_IRQ);
-			cmd[1] |= ent->sync.msiaddr & CMDQ_SYNC_1_MSIADDR_MASK;
-		} else {
-			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
-		}
-		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSH, ARM_SMMU_SH_ISH);
-		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIATTR, ARM_SMMU_MEMATTR_OIWB);
-		break;
-	default:
-		return -ENOENT;
-	}
-
-	return 0;
-}
-
 static struct arm_smmu_cmdq *arm_smmu_get_cmdq(struct arm_smmu_device *smmu,
 					       struct arm_smmu_cmdq_ent *ent)
 {
@@ -1827,18 +1678,6 @@ static void arm_smmu_free_cd_tables(struct arm_smmu_master *master)
 }
 
 /* Stream table manipulation functions */
-static void arm_smmu_write_strtab_l1_desc(struct arm_smmu_strtab_l1 *dst,
-					  dma_addr_t l2ptr_dma)
-{
-	u64 val = 0;
-
-	val |= FIELD_PREP(STRTAB_L1_DESC_SPAN, STRTAB_SPLIT + 1);
-	val |= l2ptr_dma & STRTAB_L1_DESC_L2PTR_MASK;
-
-	/* The HW has 64 bit atomicity with stores to the L2 STE table */
-	WRITE_ONCE(dst->l2ptr, cpu_to_le64(val));
-}
-
 struct arm_smmu_ste_writer {
 	struct arm_smmu_entry_writer writer;
 	u32 sid;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index ef42df4753ec..9b8c5fb7282b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1142,6 +1142,67 @@ void arm_smmu_install_ste_for_dev(struct arm_smmu_master *master,
 int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
 				struct arm_smmu_cmdq *cmdq, u64 *cmds, int n,
 				bool sync);
+int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent);
+
+/* Queue functions shared between kernel and hyp. */
+static inline bool queue_has_space(struct arm_smmu_ll_queue *q, u32 n)
+{
+	u32 space, prod, cons;
+
+	prod = Q_IDX(q, q->prod);
+	cons = Q_IDX(q, q->cons);
+
+	if (Q_WRP(q, q->prod) == Q_WRP(q, q->cons))
+		space = (1 << q->max_n_shift) - (prod - cons);
+	else
+		space = cons - prod;
+
+	return space >= n;
+}
+
+static inline bool queue_full(struct arm_smmu_ll_queue *q)
+{
+	return Q_IDX(q, q->prod) == Q_IDX(q, q->cons) &&
+	       Q_WRP(q, q->prod) != Q_WRP(q, q->cons);
+}
+
+static inline bool queue_empty(struct arm_smmu_ll_queue *q)
+{
+	return Q_IDX(q, q->prod) == Q_IDX(q, q->cons) &&
+	       Q_WRP(q, q->prod) == Q_WRP(q, q->cons);
+}
+
+static inline u32 queue_inc_prod_n(struct arm_smmu_ll_queue *q, int n)
+{
+	u32 prod = (Q_WRP(q, q->prod) | Q_IDX(q, q->prod)) + n;
+	return Q_OVF(q->prod) | Q_WRP(q, prod) | Q_IDX(q, prod);
+}
+
+static inline void queue_inc_cons(struct arm_smmu_ll_queue *q)
+{
+	u32 cons = (Q_WRP(q, q->cons) | Q_IDX(q, q->cons)) + 1;
+	q->cons = Q_OVF(q->cons) | Q_WRP(q, cons) | Q_IDX(q, cons);
+}
+
+static inline void queue_write(__le64 *dst, u64 *src, size_t n_dwords)
+{
+	int i;
+
+	for (i = 0; i < n_dwords; ++i)
+		*dst++ = cpu_to_le64(*src++);
+}
+
+static inline void arm_smmu_write_strtab_l1_desc(struct arm_smmu_strtab_l1 *dst,
+						 dma_addr_t l2ptr_dma)
+{
+	u64 val = 0;
+
+	val |= FIELD_PREP(STRTAB_L1_DESC_SPAN, STRTAB_SPLIT + 1);
+	val |= l2ptr_dma & STRTAB_L1_DESC_L2PTR_MASK;
+
+	/* The HW has 64 bit atomicity with stores to the L2 STE table */
+	WRITE_ONCE(dst->l2ptr, cpu_to_le64(val));
+}
 
 #ifdef CONFIG_ARM_SMMU_V3_SVA
 bool arm_smmu_sva_supported(struct arm_smmu_device *smmu);
-- 
2.54.0.545.g6539524ca2-goog


