Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F58CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UU83Oeb4MDmTny3jalsI86VqzD8OKMnbSWGrcxMKTpA=; b=DVY0Jvlp+yA0dnkP0NkKeCkUcF
	KVD2IM6406dBogkNE1vlu1mLZww2PFRQnMTRJELUjLK04IL3f/foqJ/UfiihUYlYq3WkajuKkZeJC
	yUJDb/S87cZgO8i4yc5pXQuinIKMjdKHFZuqT3IdXNSUAQjrcfQcFUiocdT/gvuZbzDxiTr7BlDSK
	+Oz6l05e3dbeif29FgMnho2xt11gbGruZzcjT2Fy/jSB/pV12/doHyx9PYjvITk2tBIm0gsjphmvN
	qIFPcdBcSd1MonnFJBnmUJWqpREUhnx+zZ0dqVbUtrSc6CqxdbKnzuh6lZAznPq2Bd5PF+p0lxiE8
	TRLlkrvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIluv-00000006cxc-49oQ;
	Fri, 01 May 2026 11:20:22 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlut-00000006cqn-0Lud
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:20:20 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-488d56f87e8so14261295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634417; x=1778239217; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UU83Oeb4MDmTny3jalsI86VqzD8OKMnbSWGrcxMKTpA=;
        b=bg/H/BZ9bFZ0EpAtEK+xFlhyDxNlg6vRuG9l+UOClRcERG3FeDdFCbV04cyfIT74Qv
         A9CdpeHjgDiDuqn28Qztyy1j0KairiCH/M8x1KTXsu2F/A1Q/brDCsYzTDeiF1L7Gk0j
         7ONh/w1g2sHRve0Jiite5We1fsZOiFcz+DWy/hHE/QF5GOfv7gh1tIoJ7COeYa9tCFDm
         KaACXiQIU+G2Iq2LujnHHowuz8XI0qeWN2oKcslKsnBsnVYJUdQ0gkK/lgqpQ4s90uAk
         BK266FQBLhuYcqXDJrPb6QX0CNz3ikcUnIMhaE6orPi/Rsh8h2ULKehhlQAKny2CAyDb
         nkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634417; x=1778239217;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UU83Oeb4MDmTny3jalsI86VqzD8OKMnbSWGrcxMKTpA=;
        b=qSAGCdEv0rM2j8w8nWz70dwZnaW9yOsbSCb1ouH6a0yvB1qk0RM9pGWTneH3W6ZwAL
         O4SryBKkwKRW/MuwvyQK/yW3xUSUnVT2WYiA7Bfe9lfpok0CnCi05ajqHrsY+zygOac8
         wJwfBdagFzMORyA1XZN5z58F+G3D2iptJlh+B7LSuA3qIVHhtAQlaqBltQaW7L8c9HPM
         bdh1/ydkVUOOHrWgJu2lEddBBBE08tc6qbPUniNO6hFPlXQ4ZA70iYtF+OtTiHU2Sn8u
         YwEG0+UJc2ZqsQQiyvwfw34Z5jnh8FK4T6x/5YWq60Fc8yQcbjJ9+0bMDGl+5KcoelkL
         EwbQ==
X-Gm-Message-State: AOJu0YxeQd8jxhVjauyBUIWlQNPVEEMIiPJQCkfM5wHAw79x97qxGl6E
	N+7v2srjQ8PuYUhS5CyW2qEDPAV7BU5I1pLQzaQ/XiP+++cwsH1vwEtk/wf3DzJuAWBXOg+uT9a
	pNg0vHp15WPF6MnOhL4amA0nbis7yggNnfWLfaEQL1xpO7fXxtdaaLoOknYii2SOduF09jb0S3m
	IByq7qKX26J16HscFQWDlf24HUz6WcIv8CtNaSt+zj+4b2ltIgre0ckHE5CNe3C4tsRg==
X-Received: from wrtx8.prod.google.com ([2002:a5d:60c8:0:b0:43d:7331:91da])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6995:b0:483:709e:f238 with SMTP id 5b1f17b1804b1-48a8ebab77emr40681985e9.29.1777634416769;
 Fri, 01 May 2026 04:20:16 -0700 (PDT)
Date: Fri,  1 May 2026 11:19:15 +0000
In-Reply-To: <20260501111928.259252-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260501111928.259252-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501111928.259252-14-smostafa@google.com>
Subject: [PATCH v6 13/25] iommu/arm-smmu-v3-kvm: Probe SMMU HW
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
X-CRM114-CacheID: sfid-20260501_042019_198077_5EC9FCAD 
X-CRM114-Status: GOOD (  19.15  )
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

Probe SMMU features from the IDR register space, most of
the logic is common with the kernel.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  6 --
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  6 ++
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 78 +++++++++++++++++++
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  |  6 ++
 4 files changed, 90 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 61e6ab364086..157acde0436d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4738,12 +4738,6 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	return 0;
 }
 
-#define IIDR_IMPLEMENTER_ARM		0x43b
-#define IIDR_PRODUCTID_ARM_MMU_600	0x483
-#define IIDR_PRODUCTID_ARM_MMU_700	0x487
-#define IIDR_PRODUCTID_ARM_MMU_L1	0x48a
-#define IIDR_PRODUCTID_ARM_MMU_S3	0x498
-
 static void arm_smmu_device_iidr_probe(struct arm_smmu_device *smmu)
 {
 	u32 reg;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 64618299d03a..f904f4d19609 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -84,6 +84,12 @@ struct arm_vsmmu;
 #define IIDR_REVISION			GENMASK(15, 12)
 #define IIDR_IMPLEMENTER		GENMASK(11, 0)
 
+#define IIDR_IMPLEMENTER_ARM		0x43b
+#define IIDR_PRODUCTID_ARM_MMU_600	0x483
+#define IIDR_PRODUCTID_ARM_MMU_700	0x487
+#define IIDR_PRODUCTID_ARM_MMU_L1	0x48a
+#define IIDR_PRODUCTID_ARM_MMU_S3	0x498
+
 #define ARM_SMMU_AIDR			0x1C
 
 #define ARM_SMMU_CR0			0x20
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index 9afc314d0acc..d9945db9e102 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -10,6 +10,7 @@
 #include <nvhe/mem_protect.h>
 
 #include "arm_smmu_v3.h"
+#include "../arm-smmu-v3.h"
 
 size_t __ro_after_init kvm_hyp_arm_smmu_v3_count;
 struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
@@ -26,6 +27,77 @@ static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
 	smmu->base = NULL;
 }
 
+static bool smmu_nesting_supported(struct hyp_arm_smmu_v3_device *smmu)
+{
+	unsigned int implementer, productid, variant, revision;
+	u32 reg;
+
+	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S1) ||
+	    !(smmu->features & ARM_SMMU_FEAT_TRANS_S2))
+		return false;
+
+	reg = readl_relaxed(smmu->base + ARM_SMMU_IIDR);
+	implementer = FIELD_GET(IIDR_IMPLEMENTER, reg);
+	productid = FIELD_GET(IIDR_PRODUCTID, reg);
+	variant = FIELD_GET(IIDR_VARIANT, reg);
+	revision = FIELD_GET(IIDR_REVISION, reg);
+
+	if (implementer != IIDR_IMPLEMENTER_ARM)
+		return true;
+
+	if (productid == IIDR_PRODUCTID_ARM_MMU_600)
+		return variant >= 2;
+	else if (productid == IIDR_PRODUCTID_ARM_MMU_700)
+		return !(variant < 1 || revision < 1);
+
+	return true;
+}
+
+/*
+ * Mini-probe and validation for the hypervisor.
+ */
+static int smmu_probe(struct hyp_arm_smmu_v3_device *smmu)
+{
+	u32 reg;
+
+	/* Similar to the kernel, rely on firmware override. */
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
+		return -EINVAL;
+
+	/* IDR0 */
+	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR0);
+
+	smmu->features |= smmu_idr0_features(reg);
+	if (!smmu_nesting_supported(smmu))
+		return -ENXIO;
+
+	if (!(smmu->features & (ARM_SMMU_FEAT_TT_LE | ARM_SMMU_FEAT_TT_BE)))
+		return -ENXIO;
+
+	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR1);
+	if (reg & (IDR1_TABLES_PRESET | IDR1_QUEUES_PRESET | IDR1_REL))
+		return -EINVAL;
+
+	smmu->sid_bits = FIELD_GET(IDR1_SIDSIZE, reg);
+	/* Follows the kernel logic */
+	if (smmu->sid_bits <= STRTAB_SPLIT)
+		smmu->features &= ~ARM_SMMU_FEAT_2_LVL_STRTAB;
+
+	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR3);
+	smmu->features |= smmu_idr3_features(reg);
+
+	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR5);
+	smmu->pgsize_bitmap = smmu_idr5_to_pgsize(reg);
+
+	smmu->oas = smmu_idr5_to_oas(reg);
+	if (smmu->oas == 52)
+		smmu->pgsize_bitmap |= 1ULL << 42;
+	else if (!smmu->oas)
+		smmu->oas = 48;
+
+	return 0;
+}
+
 static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 {
 	unsigned long haddr;
@@ -39,8 +111,14 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 		return ret;
 
 	smmu->base = (void __iomem *)haddr;
+	ret = smmu_probe(smmu);
+	if (ret)
+		goto out_ret;
 
 	return 0;
+out_ret:
+	smmu_deinit_device(smmu);
+	return ret;
 }
 
 /* Called while is the host is still trusted. */
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
index 744ee2b7f0b4..82b84673e85b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
@@ -12,12 +12,18 @@
  *
  * Other members are filled and used at runtime by the SMMU driver.
  * @base		Virtual address of SMMU registers
+ * @oas			PA size
+ * @pgsize_bitmap	Supported page sizes
+ * @sid_bits		Max number of SID bits supported
  */
 struct hyp_arm_smmu_v3_device {
 	phys_addr_t		mmio_addr;
 	size_t			mmio_size;
 	void __iomem		*base;
 	u32			features;
+	unsigned long		oas;
+	unsigned long		pgsize_bitmap;
+	unsigned int		sid_bits;
 };
 
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
-- 
2.54.0.545.g6539524ca2-goog


