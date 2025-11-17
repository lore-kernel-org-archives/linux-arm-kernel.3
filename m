Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E64CEBF92
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDHGRVWxr8tiMMJHgFkthzaCbmxDX2W8q2KLEFUMQ0M=; b=X9vN8A0VQPRCE5EGYNABAvHBCG
	zj6T1arXhCSBqdAgo9z9Gc9q/Ztdf8aof+PZ9i7fKto8gx3LJCbqrsFuWgN3WVaavqT7M4gVRLbrL
	vzAtYjEQMZ1VVQ6c2AYJQFWGATm1uMpicVHH5sPXxmkg3wgsn/ijrTHlBh5ElbpgGCjkY6v9YUMi1
	n611MldC4v/pkbR1BolaM91NxGYmKeVJRs0ixoghMqEfsyI/Ec42wUbakNGANItiYtppj7siktlQT
	LctfRBN8Awm/eEkli5b7BWhkpI7HylovIXJ+N7pVD8mQYmpH5hi2petClo4Hbvp19xnPnWsCb4R64
	WfKH27tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4Ha-0000000GdrA-0f8R;
	Mon, 17 Nov 2025 18:48:58 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HN-0000000GdZx-1tM4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 18:48:46 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b739b3d8997so134092566b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763405323; x=1764010123; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NDHGRVWxr8tiMMJHgFkthzaCbmxDX2W8q2KLEFUMQ0M=;
        b=iLK/yz6MleOA9PsJvnAtkOl25M0kpyLQFQsbQRGWyu0rMSZQTbExCMuuTBiGn5H1aY
         UPT5M2++7O33YckP6OKaNPgUm1QHQaxpeGFvXk8DUzA5NyWH8ZAM9aRsMpYiJ7yg3Cu0
         RIT3veonkWuCG3eT0TsO9gm5ujLqI7CfRllxDXfTIfurp+980y1Y9Fwu2oJBvi3HwahB
         QMdrq/m/Ed/5b62Y6WqdM5SNEgoLGXF5ftuuYI+vCR384Lo4UR0NdJTPZmNc6YpzWJZD
         LnfFaT1PvC8yTY3pYFP6L6cEXm3yQ8xGGderG4qlnajxKWjVRTwfBQ9dt5qFcWIArjXp
         EqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405323; x=1764010123;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NDHGRVWxr8tiMMJHgFkthzaCbmxDX2W8q2KLEFUMQ0M=;
        b=btktcEub9UE1Zk4jilHRSNg5NTNCjCkT5FK+LWK8ZOYk5mlFxAER3iaXSovjPVe63z
         UJUw9IPZIZnHUBm7wcLssUxTKlW+uEQyNQcpHqwh4mhwnCe5BzELyY/aoQ7zthi0PaPK
         JTM8wm7OQU85CXdb3A29hiSW4axLFlpXnRQxPfP6cKwSdoEVxG4/yuWL4cFfbP8EvEQH
         obooTuyWYpK1l79rwaqELYzZjBqVC4ThshpBD/hXqbaSlZVpYr58gY0xophaSjXvyEfB
         H8Tt2himJbYsTvKeSLb3eobn29jXzMUIVN4q2ly+LSTN3w3UW7O43lKaOwaiY/t1PTvk
         0FtA==
X-Gm-Message-State: AOJu0Yzavu2qqHrpy9wuB4T4Jq7pq0vJkHPQzpWjr3fja21Eqfq4RaJw
	I5bB+XILq4hKrZAyZ0exTaLXkejgSAmh5PltmlZvYxZ5t6azMrhRLUC/SHy3WD/Kd+khKpac03Q
	uN5Z43D3d8hZsXnCbzcTmywgMH1UzaWI4wU5wWkTlEtpMTRFrYWvW5m9jA5V6EnB01ieNTWwtB6
	HF9SrIOnCkkE7l/EiSvFeRyQHE2SY3K71RELif62CZQlunKDNHILYVWr34yqdCE1ciPw==
X-Google-Smtp-Source: AGHT+IG0TrsHTOFqlfcoz8fH0quPptO87OaYvkyHV4a6ntExQ0SYHVEwf58bnjdfGxOgO/BBPbDmIMTbefbdcw==
X-Received: from ejclk13.prod.google.com ([2002:a17:907:178d:b0:b73:69d2:27b7])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:97cc:b0:b73:7b5d:e76a with SMTP id a640c23a62f3a-b737b5dea0bmr1018806066b.27.1763405322837;
 Mon, 17 Nov 2025 10:48:42 -0800 (PST)
Date: Mon, 17 Nov 2025 18:48:04 +0000
In-Reply-To: <20251117184815.1027271-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251117184815.1027271-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251117184815.1027271-18-smostafa@google.com>
Subject: [PATCH v5 17/27] iommu/arm-smmu-v3-kvm: Probe SMMU HW
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_104845_518026_48BA2F25 
X-CRM114-Status: GOOD (  18.81  )
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
index 309194ceebe7..1d552efdc4ae 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -49,6 +49,7 @@ struct arm_vsmmu;
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
2.52.0.rc1.455.g30608eb744-goog


