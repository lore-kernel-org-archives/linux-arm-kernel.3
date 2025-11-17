Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84932CEBF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pg6/d7tYH7Fa8SuxEA+vck9sHqkvG7ZrFQ8YnS0s4pY=; b=JTl7vsSZASfCxyNurKhQKXbpgA
	jb4dDP9PfYfz+aufDEj5KpInY+T7A+dEG2nnbs8i3bownmEMLJ8VHBtDRHpv0jvhs3woJ3yY6KHxl
	s75eYgnEDjAqtjUZsABfHOOdhN1rAhi1B4K8JWasuSI/Zq8dVTptHGq8n2t1Ud4Gyv4r2Ha0YYwqd
	c4PHiFhDlw9P8vtcmGxgw6C3P6QxECxiwDOzpBMBmhU/25TaPNDyhNzu9OIUak6oCaROBDAGy6FoQ
	45rIla48X3uDOEysKKqsgHC97BWlorX5DMjM8gzYflHvwnJealsKGzyI4jV1J4fNK1ywLyY8exW42
	dvyZL5qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HZ-0000000GdqW-3LpO;
	Mon, 17 Nov 2025 18:48:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HN-0000000Gdai-2AMc
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Nov 2025 18:48:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Pg6/d7tYH7Fa8SuxEA+vck9sHqkvG7ZrFQ8YnS0s4pY=; b=T7N6OKuAYv3PFKtLNrwFiicEVK
	dEqbNpyIrDVgeGLptMX7qFJHT0G5vgPfJyJeh9VHcDLBIV4RduhY7cHzkfLsjY1ENXQL74CZcO6FF
	hHYcacsGIRrdhVKL4nYnSEF4Of5Z9ntGdBUR91aAPBtVIWO/LI4Muui+kDETduq0of8EpOCMtVBke
	rjHVY5dET/Rx2rA7WzZiGVHjCS/5pGrLV1NW+wFqYKhtgT+OM8p89S/HUCXXuaskpDNHmyRUB48QK
	Ez2jFRIYAwNuekdX2uBxIbEhfHVYBV9hxO5s4VoEdRDbFKgVlCcufYPA2zLN/IazoEbOaojc3cZWB
	659vuztw==;
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3Pg-00000007wbk-3iDz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 17:53:18 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b70caafad59so478684666b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763405321; x=1764010121; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pg6/d7tYH7Fa8SuxEA+vck9sHqkvG7ZrFQ8YnS0s4pY=;
        b=n3INpCRyVeRcYwi9AkbKd5g23KwYl/PRVz8sNI5U3MlNk2J0lZgYQAeSs6CDCtcNCf
         sGpJ6gJ/u2MBFLjy4r3ObS4lhqqprc7v7Rp02xptrd6BQaVJomH5RIHf8PV53itPwxBU
         w4/zhqhQzsgN0hp41t3r1AyAYznd3yGMAeFCYpkdV/BBm617E+XV977yx/MjIcAjIVoR
         qVyC9Fp6xGOd5tVQwSJDvpZ9XMDKG7LVkWshWm9ze7/Ku3cFpODOMdbpJq560QenPHiT
         eJcdgrJ+KghBQyIaEw512EipQhaYolOnDOXUOzyrnG5pSJNOo0DOdnPJuFipzZ25UYRd
         wh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405321; x=1764010121;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pg6/d7tYH7Fa8SuxEA+vck9sHqkvG7ZrFQ8YnS0s4pY=;
        b=bPre3gjOk7PuWvgBhJkpnWuO+EHpH87oCZxy60RShJDE3zgiffR5wIRVTgJiVwxcI0
         B/FqpE8r/OT5mLgjquVw0+3u84GmIEQ3pdexNlxx66NAqgnYZvM3i1o/iqmoh70cwmZT
         Iky59D7j66aJ98F8sRJLELCsIj1XmkWjjLr/HozV/1BN5Ci5dXKuoG65XdWzKO3wifwM
         cFkVrOzv0Vo4VI+eSyqr1kNpQu502HlBfBKR2MMKpsYNJNuDHJGPbiC/XESwtTbTS9NB
         8JigLzq8d5RLdw7UWedXE9jUPiHlgzTfP47cX23qONzS7SvK+D5LCtP3wUyTrtY9/J6Q
         n4Uw==
X-Gm-Message-State: AOJu0Yzx2tNrGZUWktl0FkYZTc2QgVGxSRL80dSynbCVxBpYaiDOaQlP
	CM9xR+zFmo3SrvJw0x5NUUhQNCdZCcEsNh2jYBQxWL7MrgDyhzO3ialWccULX0huF82vnbgAQu6
	kk0+8yVkHSsmSVxecnnxqmlyD2AykQaVDrUEaxe17MpuFO20/IRD8HGIxJubgEaR47o7X4HFPsb
	tyEiEa/C8UxMcVZ6wGqCUPSnnjz6JNHNifCWR6VrEvkPAs5AhjiPB0VdByaWNDH7kS5Q==
X-Google-Smtp-Source: AGHT+IEDmtdye0WfWxlkb3rtc6UM9OGL+b9K1JFhVnvxv97zVFh9YFE5Gri7gLnInPVmef/IeMxDtKAYgxWvdw==
X-Received: from ejczi1.prod.google.com ([2002:a17:907:e981:b0:b70:b2b1:8ca])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:97c9:b0:b73:5db5:b6d9 with SMTP id a640c23a62f3a-b7367c16560mr1552133566b.55.1763405320730;
 Mon, 17 Nov 2025 10:48:40 -0800 (PST)
Date: Mon, 17 Nov 2025 18:48:02 +0000
In-Reply-To: <20251117184815.1027271-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251117184815.1027271-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251117184815.1027271-16-smostafa@google.com>
Subject: [PATCH v5 15/27] iommu/arm-smmu-v3-kvm: Create array for hyp SMMUv3
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
X-CRM114-CacheID: sfid-20251117_175316_987378_2DCBCCE3 
X-CRM114-Status: GOOD (  25.29  )
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

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 82 ++++++++++++++++++-
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  | 13 +++
 2 files changed, 91 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
index ca12560639c5..1d72951b7b53 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -8,6 +8,7 @@
 #include <asm/kvm_pkvm.h>
 
 #include <linux/auxiliary_bus.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 
@@ -16,6 +17,45 @@
 
 extern struct kvm_iommu_ops kvm_nvhe_sym(smmu_ops);
 
+static size_t				kvm_arm_smmu_count;
+static struct hyp_arm_smmu_v3_device	*kvm_arm_smmu_array;
+static size_t				kvm_arm_smmu_cur;
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
+
+	for_each_compatible_node(np, NULL, "arm,smmu-v3")
+		kvm_arm_smmu_count++;
+
+	if (!kvm_arm_smmu_count)
+		return -ENODEV;
+	smmu_order = get_order(kvm_arm_smmu_count * sizeof(*kvm_arm_smmu_array));
+	kvm_arm_smmu_array = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, smmu_order);
+	if (!kvm_arm_smmu_array)
+		return -ENOMEM;
+	return 0;
+}
+
 static size_t smmu_hyp_pgt_pages(void)
 {
 	/*
@@ -30,6 +70,21 @@ static size_t smmu_hyp_pgt_pages(void)
 static struct platform_driver smmuv3_nesting_driver;
 static int smmuv3_nesting_probe(struct platform_device *pdev)
 {
+	struct resource *res;
+	struct hyp_arm_smmu_v3_device *smmu = &kvm_arm_smmu_array[kvm_arm_smmu_cur];
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	smmu->mmio_addr = res->start;
+	smmu->mmio_size = resource_size(res);
+	if (smmu->mmio_size < SZ_128K) {
+		dev_err(&pdev->dev, "MMIO region too small(%pr)\n", &res);
+		return -EINVAL;
+	}
+
+	if (of_dma_is_coherent(pdev->dev.of_node))
+		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
+
+	kvm_arm_smmu_cur++;
 	return 0;
 }
 
@@ -41,12 +96,31 @@ static int kvm_arm_smmu_v3_register(void)
 	if (!is_protected_kvm_enabled() || !nr_pages)
 		return 0;
 
-	ret = platform_driver_probe(&smmuv3_nesting_driver, smmuv3_nesting_probe);
+	ret = kvm_arm_smmu_array_alloc();
 	if (ret)
 		return ret;
 
-	return kvm_iommu_register_driver(kern_hyp_va(lm_alias(&kvm_nvhe_sym(smmu_ops))),
-					 nr_pages);
+	ret = platform_driver_probe(&smmuv3_nesting_driver, smmuv3_nesting_probe);
+	if (ret)
+		goto out_err;
+
+	ret = kvm_iommu_register_driver(kern_hyp_va(lm_alias(&kvm_nvhe_sym(smmu_ops))),
+					nr_pages);
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
 
 static int smmu_create_aux_device(struct device *dev, void *data)
@@ -67,7 +141,7 @@ static int smmu_create_aux_device(struct device *dev, void *data)
 static struct platform_driver smmuv3_nesting_driver;
 static int kvm_arm_smmu_v3_post_init(void)
 {
-	if (!is_protected_kvm_enabled())
+	if (!is_protected_kvm_enabled() || !kvm_arm_smmu_cur)
 		return 0;
 
 	WARN_ON(driver_for_each_device(&smmuv3_nesting_driver.driver, NULL,
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
2.52.0.rc1.455.g30608eb744-goog


