Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1BCCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 00:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1XMrJFUsZlHqUSwfaqqxufwXrUFJ8lXJIFDET8NUKg=; b=r8UMFPTedeefVh1kJJXgL49eIj
	kt+dCtT2ZzpcGEcl7ApPzORy3Kue0J8CQ4mn7IAONESQ+fnicMvIfSnhkpYyoO4B4YD+jUaT5jGVl
	+yDTXS9afUEZCTVNq79U3y7j2Dt12Jy/ZMT4YyNrvrc8QV/0VBPeFy1kDp8dddmbIiMKSjcI9XJQ1
	punbwxFZZx+UQ9XLfzvJvjAMzA/Nb88kV3u/hjcE/uYF+Nd14Oio/GH8dwBMG/eodu7Sd8++CHTBT
	D98coBvPHV6sz5upHboKFrySDw9d6dQlg2Momqew1gDkoWCYpn2iW1KqgjziA1BtC/vEFdP+sOkN1
	lWxoevlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoWWX-0000000Bw00-1cV5;
	Wed, 20 Aug 2025 00:17:53 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUG3-0000000BfV4-1dBz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 21:52:44 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3b9e418aab7so2448250f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 14:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755640361; x=1756245161; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=y1XMrJFUsZlHqUSwfaqqxufwXrUFJ8lXJIFDET8NUKg=;
        b=A7KrCY6RI5sHERkNbIPsV58FVxVbPRt/ImMOEYG/d32dY3G2NLLRrBtG8PYq7ZSPNH
         l6EQiuUvhJwvM8GeSZ1T3LWEtYQO0dkTXriIQIswsZVsSZkn3IBzirJT8rjTiMyWJUx4
         osiGcbrorZziBghAZ6XW5Th4aVZmj6vE853WMOVZ4JZ3qoxPbTB2avOR5nkOTpCCE89s
         Hf1/KF5AnrLiq79AwvW/YExFkB5WJ/NhxGDtry2y7DafcUieqkzf+Yqkv15JlQHQ0tX3
         jIBTkXu+MW8IrFbZ/ACM2sOYKXiqiiS2BJSbXR/eOY3mKj1kKFd5r9wIYejZfXCbF23u
         mp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755640361; x=1756245161;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y1XMrJFUsZlHqUSwfaqqxufwXrUFJ8lXJIFDET8NUKg=;
        b=FuwFK8cUNZpJFPHnyPoZD4Uq1aiXxBDVo39INedLsCaRD/30hU4N/wv0Kx0uK1mbRN
         R3epQtwlt/MJ290NOgBIgHws0bDa0g6ah15IGdEnHHlXd/EpbHCJXqF0p887syJ1uGKl
         veyzV52/xaZQc97Nob++MLGkvN+AWo0uR0pVxRQaGPs7kBrudj3nhuo8F2RpqQJQ/dQG
         gxdaxRJlo1cXqkqEW7nYK0utvqBwG6Ib+m4RTXekxWq6vTRlgccbemd5NUyPQndxEGNQ
         CYN0RBgSAPBml0cZskW0C7xwkh+PojCJ+tftcAq+bLn+rN2q2C1CqP+UOc1jRsVmvIAv
         lkxg==
X-Forwarded-Encrypted: i=1; AJvYcCXxUIv/Ed102VurrmD65H3l8oAi8xsCF3nIevabu2QpvQTjUlwQ2S4Ou8zwDmcnAvHBhczZ57imzRAgYvCfTT2f@lists.infradead.org
X-Gm-Message-State: AOJu0YziiwoZX3Ux+iFGouw3rKmdwKx2ku7aedUWAiNSvi5QbozPl/yw
	kGw9WBUb+cXYmBq0/bwfJ369PMFOC9tWHkuPElHs7+9nsZ4TWTTo3jFB0Ez5fYg3wXd+Q6UoHHs
	F3PcUdyiSJbhzlw==
X-Google-Smtp-Source: AGHT+IGRK4bp6sesJCXzi77ty+REwj3D43YiESI0ZMsE4l0swwRaEoRodh4XIVE78li6aGNDnGWJRk469Etvfw==
X-Received: from wrqf13.prod.google.com ([2002:adf:f8cd:0:b0:3b7:8aed:a63d])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2309:b0:3b7:54b3:c512 with SMTP id ffacd0b85a97d-3c32e7fe680mr338963f8f.58.1755640361697;
 Tue, 19 Aug 2025 14:52:41 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:51:46 +0000
In-Reply-To: <20250819215156.2494305-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250819215156.2494305-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250819215156.2494305-19-smostafa@google.com>
Subject: [PATCH v4 18/28] iommu/arm-smmu-v3-kvm: Probe SMMU HW
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_145243_426985_6A144030 
X-CRM114-Status: GOOD (  19.70  )
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
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  1 +
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 57 ++++++++++++++++++-
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  |  8 +++
 3 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 8ffcc2e32474..f0e1feee8a49 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -48,6 +48,7 @@ struct arm_smmu_device;
 #define IDR0_S2P			(1 << 0)
 
 #define ARM_SMMU_IDR1			0x4
+#define IDR1_ECMDQ			(1 << 31)
 #define IDR1_TABLES_PRESET		(1 << 30)
 #define IDR1_QUEUES_PRESET		(1 << 29)
 #define IDR1_REL			(1 << 28)
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index b56feae81dda..e45b4e50b1e4 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -10,6 +10,7 @@
 #include <nvhe/mem_protect.h>
 
 #include "arm_smmu_v3.h"
+#include "../arm-smmu-v3.h"
 
 size_t __ro_after_init kvm_hyp_arm_smmu_v3_count;
 struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
@@ -45,9 +46,56 @@ static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
 	}
 }
 
+/*
+ * Mini-probe and validation for the hypervisor.
+ */
+static int smmu_probe(struct hyp_arm_smmu_v3_device *smmu)
+{
+	u32 reg;
+
+	/* IDR0 */
+	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR0);
+	smmu->features = smmu_idr0_features(reg);
+
+	/*
+	 * Some MMU600 and MMU700 have errata that prevent them from using nesting,
+	 * not sure how can we identify those, so it's recommended not to enable this
+	 * drivers on such systems.
+	 * And preventing any of those will be too restrictive
+	 */
+	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S1) ||
+	    !(smmu->features & ARM_SMMU_FEAT_TRANS_S2))
+		return -ENXIO;
+
+	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR1);
+	if (reg & (IDR1_TABLES_PRESET | IDR1_QUEUES_PRESET | IDR1_REL | IDR1_ECMDQ))
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
+	smmu->ias = 64;
+	smmu->ias = min(smmu->ias, smmu->oas);
+	return 0;
+}
+
 static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 {
-	int i;
+	int i, ret;
 	size_t nr_pages;
 
 	if (!PAGE_ALIGNED(smmu->mmio_addr | smmu->mmio_size))
@@ -64,8 +112,13 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 		WARN_ON(__pkvm_host_donate_hyp_mmio(pfn));
 	}
 	smmu->base = hyp_phys_to_virt(smmu->mmio_addr);
-
+	ret = smmu_probe(smmu);
+	if (ret)
+		goto out_ret;
 	return 0;
+out_ret:
+	smmu_deinit_device(smmu);
+	return ret;
 }
 
 static int smmu_init(void)
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
index 744ee2b7f0b4..3550fa695539 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
@@ -12,12 +12,20 @@
  *
  * Other members are filled and used at runtime by the SMMU driver.
  * @base		Virtual address of SMMU registers
+ * @ias			IPA size
+ * @oas			PA size
+ * @pgsize_bitmap	Supported page sizes
+ * @sid_bits		Max number of SID bits supported
  */
 struct hyp_arm_smmu_v3_device {
 	phys_addr_t		mmio_addr;
 	size_t			mmio_size;
 	void __iomem		*base;
 	u32			features;
+	unsigned long		ias;
+	unsigned long		oas;
+	unsigned long		pgsize_bitmap;
+	unsigned int		sid_bits;
 };
 
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
-- 
2.51.0.rc1.167.g924127e9c0-goog


