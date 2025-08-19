Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05F3CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 00:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xwu1qRO+eOJjyAwUn9pi1Q+O90cBvLjGAkOSG+zhKow=; b=pt1B6mz3gHMG7wur8ESd8EZpR/
	vBSeAMcKB9WkFWUJ0u32ReS5MjARaSTCkmrO4kGYXgxLC7rYD8f/mrP++9c6n2h1RZw0LuPrD1Hdh
	4yfKzwrrzA0LPDPRiyvp26DOJITj+RAjvfxWm+6y1ykWDI7H4hunvEV+Bhn/uvCtfYG81PVLAE8Pr
	Yo7223XSReXnNUmK259VfS63n0ZeUgzqRBT1tzAgenDX5ieMoVufGvlBVbRcUuvByn1bmgNr1MmGZ
	WzNFEgsS88RffuZCs0d4nkyHzRm+hsR5lGLK03U1wHWyPRB7GZWwF5opvSDvtO54pOVEDaIZSUwma
	UW7Psqgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoWRL-0000000BvV7-3A9R;
	Wed, 20 Aug 2025 00:12:31 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUG1-0000000BfTg-1UZV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 21:52:42 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45b467f5173so4285425e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 14:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755640359; x=1756245159; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xwu1qRO+eOJjyAwUn9pi1Q+O90cBvLjGAkOSG+zhKow=;
        b=MmcPPPfQbCdYkC10dA7CGzkzVuZGzJOijm+4ZwNPESUPDq/ZGcHFszL/SdsALZwkt8
         HXvHdjAt7+lMqwv3kN+l5WhIiVC+NsOeQgBVJ/v1rIi68Ai01b0+mFAJIw6xp76qusip
         dyCGURQSfgmEv1PvR8sDZE/mi40DiA1T8Mj2cTvjhM+he9aJE/mYh9GQ4CKZenuajXWM
         baJOtlxIAAB7u8Rk4+Whctz+RarHglGxXmhJocHbCDCAur4DXNVIMjLCXikt9Ww/3obl
         jTCTFiuROeFjNbrdCEVEMpMLgxSMRq99YfrVnNH5sqdmcJI6ikUf64IQgerAB518/deK
         qi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755640359; x=1756245159;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xwu1qRO+eOJjyAwUn9pi1Q+O90cBvLjGAkOSG+zhKow=;
        b=I1yRkYcfYcksxU/GY9cmXm1flSJLlsrbflcZD45naJPaGhLKpbf1AXKmMMrVD3f0DH
         Pc92J2WTQ4myFs2OSIYRd3TOv504Aiyl6eZfmed+8hBbCyhUB3Z6ztPo8z02DbOl31c9
         gYJmSEFUZ/GSAtudlZ4jonZvFsArVGK+zc4ajRRlydFL5eeSF3FhcrrM7nsYeDdAyi5p
         9Fkh4qfeIrJBIZ+fwJLdK+paZUHogIdt55L7435nkyrE/G4CO5VxJgDbQ/daJZjFeCkj
         HRdod4Bk44squwu2ENdyVjccHTKwj+2bibGF4zUewl8kNFJTm4RlrfnVR+mE1CEXMcdS
         qiJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIpgPQ0+7G2Urca4z2s4m0XvqNuY2W/ZUtj9Dh9UUgUyV5hWe//80bvnkfXVXKfsYHCVOI5ZGZTwzTb1gaONjf@lists.infradead.org
X-Gm-Message-State: AOJu0YyWIxJ57p/om8URBnSLWAt1NtK4OPHhkJkg/jRtv7ZPU6CJb9JI
	xE6axIeaGNbmygqZUizuTk98XxN0lB2CXQJweruohfddNwSz8Pg40mxNCbwVJuNe9v5le9lasDY
	Wsh1/VhEV8tsZ0g==
X-Google-Smtp-Source: AGHT+IEhkGtNHGU6UMmeB0BAIZ4sLir5Qlb/i2T9JqWqyDJv4XQTeVZhQ/vtD+ljWCO9zlGmXGV9Ovms10Lr6A==
X-Received: from wmbhc5.prod.google.com ([2002:a05:600c:8705:b0:458:6799:d779])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b05:b0:43d:745a:5a50 with SMTP id 5b1f17b1804b1-45b479ea5a9mr2802145e9.19.1755640359305;
 Tue, 19 Aug 2025 14:52:39 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:51:44 +0000
In-Reply-To: <20250819215156.2494305-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250819215156.2494305-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250819215156.2494305-17-smostafa@google.com>
Subject: [PATCH v4 16/28] iommu/arm-smmu-v3-kvm: Create array for hyp SMMUv3
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
X-CRM114-CacheID: sfid-20250819_145241_395852_6C971181 
X-CRM114-Status: GOOD (  24.57  )
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

As the hypervisor has no access to firmware tables, the device discovery
is done from the kernel, where it parses firmware tables and populates a
list of devices to the hypervisor, which later takes over.

At the moment only the device tree is supported.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 93 ++++++++++++++++++-
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  | 13 +++
 2 files changed, 105 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
index ac4eac6d567f..27ea39c0fb1f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -7,6 +7,7 @@
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_pkvm.h>
 
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 
 #include "arm-smmu-v3.h"
@@ -14,6 +15,75 @@
 
 extern struct kvm_iommu_ops kvm_nvhe_sym(smmu_ops);
 
+static size_t				kvm_arm_smmu_count;
+static struct hyp_arm_smmu_v3_device	*kvm_arm_smmu_array;
+
+static void kvm_arm_smmu_array_free(void)
+{
+	int order;
+
+	order = get_order(kvm_arm_smmu_count * sizeof(*kvm_arm_smmu_array));
+	free_pages((unsigned long)kvm_arm_smmu_array, order);
+}
+
+/*
+ * The hypervisor have to know the basic information about the SMMUs
+ * from the firmware.
+ * This has to be done before the SMMUv3 probes and does anything meaningful
+ * with the hardware, otherwise it becomes harder to reason about the SMMU
+ * state and we'd require to hand-off the state to the hypervisor at certain point
+ * while devices are live, which is complicated and dangerous.
+ * Instead, the hypervisor is interested in a very small part of the probe path,
+ * so just add a separate logic for it.
+ */
+static int kvm_arm_smmu_array_alloc(void)
+{
+	int smmu_order;
+	struct device_node *np;
+	int ret;
+	int i = 0;
+
+	kvm_arm_smmu_count = 0;
+	for_each_compatible_node(np, NULL, "arm,smmu-v3")
+		kvm_arm_smmu_count++;
+
+	if (!kvm_arm_smmu_count)
+		return -ENODEV;
+
+	smmu_order = get_order(kvm_arm_smmu_count * sizeof(*kvm_arm_smmu_array));
+	kvm_arm_smmu_array = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, smmu_order);
+	if (!kvm_arm_smmu_array)
+		return -ENOMEM;
+
+	/* Basic device tree parsing. */
+	for_each_compatible_node(np, NULL, "arm,smmu-v3") {
+		struct resource res;
+
+		ret = of_address_to_resource(np, 0, &res);
+		if (ret)
+			goto out_err;
+		kvm_arm_smmu_array[i].mmio_addr = res.start;
+		kvm_arm_smmu_array[i].mmio_size = resource_size(&res);
+		if (kvm_arm_smmu_array[i].mmio_size < SZ_128K) {
+			pr_err("SMMUv3(%s) has unsupported size(0x%lx)\n", np->name,
+			       kvm_arm_smmu_array[i].mmio_size);
+			ret = -EINVAL;
+			goto out_err;
+		}
+
+		if (of_dma_is_coherent(np))
+			kvm_arm_smmu_array[i].features |= ARM_SMMU_FEAT_COHERENCY;
+
+		i++;
+	}
+
+	return 0;
+
+out_err:
+	kvm_arm_smmu_array_free();
+	return ret;
+}
+
 size_t smmu_hyp_pgt_pages(void)
 {
 	/*
@@ -27,10 +97,31 @@ size_t smmu_hyp_pgt_pages(void)
 
 static int kvm_arm_smmu_v3_register(void)
 {
+	int ret;
+
 	if (!is_protected_kvm_enabled())
 		return 0;
 
-	return kvm_iommu_register_driver(kern_hyp_va(lm_alias(&kvm_nvhe_sym(smmu_ops))));
+	ret = kvm_arm_smmu_array_alloc();
+	if (ret)
+		return ret;
+
+	ret = kvm_iommu_register_driver(kern_hyp_va(lm_alias(&kvm_nvhe_sym(smmu_ops))));
+	if (ret)
+		goto out_err;
+
+	/*
+	 * These variables are stored in the nVHE image, and won't be accessible
+	 * after KVM initialization. Ownership of kvm_arm_smmu_array will be
+	 * transferred to the hypervisor as well.
+	 */
+	kvm_hyp_arm_smmu_v3_smmus = kvm_arm_smmu_array;
+	kvm_hyp_arm_smmu_v3_count = kvm_arm_smmu_count;
+	return ret;
+
+out_err:
+	kvm_arm_smmu_array_free();
+	return ret;
 };
 
 core_initcall(kvm_arm_smmu_v3_register);
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
index f6ad91d3fb85..744ee2b7f0b4 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
@@ -4,7 +4,20 @@
 
 #include <asm/kvm_asm.h>
 
+/*
+ * Parameters from the trusted host:
+ * @mmio_addr		base address of the SMMU registers
+ * @mmio_size		size of the registers resource
+ * @features		Features of SMMUv3, subset of the main driver
+ *
+ * Other members are filled and used at runtime by the SMMU driver.
+ * @base		Virtual address of SMMU registers
+ */
 struct hyp_arm_smmu_v3_device {
+	phys_addr_t		mmio_addr;
+	size_t			mmio_size;
+	void __iomem		*base;
+	u32			features;
 };
 
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
-- 
2.51.0.rc1.167.g924127e9c0-goog


