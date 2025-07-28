Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9B3C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4x+9nZ8CfG6VcovabsfC73bcsU1B/P8cpgFWvcyCzc=; b=b7HChgvd+o5Y4lUgPUut/vLuux
	B4UA3TrP1KD0QOjeT7P2YDZ8rua3NR6XCIf1SJOKM7VQ01XBGRY2FL8LbwPCHBMh67naVEdVPsf4O
	UxVbBnxfu+TrVPWtMpmeCoRNoqHV9xv8bs+Fu9/bWE3qmgfOCgoLAitbbzI9ujrEC4zvpsBR0Svb3
	4a98svjgBsuA7CF1/vJIouJXGv+9vB7LFglHBBRY4vWvmR2cvj67PvpoeH0w4Tp6H7Cqbdsf5VYA7
	0hKtwpDrB26U7qEof3MQVDJIT6wD02d4XhGwKghZtRx8NMyeR6duieqZfXCmBKSNdAH1gaVOELpFT
	zOfBZd3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTit-0000000FIAa-0Ghe;
	Mon, 28 Jul 2025 19:41:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS2y-0000000F92Q-1KKj
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Jul 2025 17:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=f4x+9nZ8CfG6VcovabsfC73bcsU1B/P8cpgFWvcyCzc=; b=iNX3y6u6LtWO+NfDuWugKyKmYZ
	712zFW8xUdgQQ7u2i2xSfkoovhuOh5TfX4Uov6r+wPL6N/t0borlDejgt3Npz2WFJs21C9qmDoIpq
	xK3j4+6Bfd2NuzlxH7c+ZOqN6VDwu97TumL0RZefcsfEcSiG++Ep/7Y/VxzzpqCXEueiqI10FaA9Z
	Ai9O06SsJjCHQkTyIrtgxHFhm6huJy5sf6HKTP4jxGPiJnW0nwRf3fKhKKDTmQbahK1b+8DDLooLQ
	mKcBvM16+xB/JCNsBexXcwNMIqx4ru5SrxZXhMkEl9iPyZ3W5izTmR1KEkgkJzZCwVoezI1Dd/Cpy
	V2G9c4fA==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS2v-0000000CWIW-20kP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:53:59 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-451d7de4ae3so22265775e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 10:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753725236; x=1754330036; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f4x+9nZ8CfG6VcovabsfC73bcsU1B/P8cpgFWvcyCzc=;
        b=iPoXUGjyGzf70o3KLNoRRQ3fyOK4kr/bHJFdWXqc1z4WCuiqkX2D/dWMo6ikU7ZiKk
         JYkJ/kS0BUjetZtxKrnO/u1H7UTnP4GOJY377GY9hT0ww2A/k9jfv0zMpZnx3Mnh6J3H
         FXGswilXbjpXh5zVzL59MdhlvemMlh2fAAN61LKrrFBBeHmlAhqFXQGtYTIXZMEWP3Oo
         gx2oVXEdZJBHcWR5vTInx9q4jaH9a8A/DEr1KW0g6Gq+pMLNO+kQexiARAvIbDr7fP5l
         /lBSdz7rcFBV2kyJI2hjMlJ3/Z3lzvKbkTaqMRwKCfohKoWs5td0NmyRw6fCgYx+dGWr
         rWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725236; x=1754330036;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f4x+9nZ8CfG6VcovabsfC73bcsU1B/P8cpgFWvcyCzc=;
        b=sRnjDAfLVNecS1TzgSj7eXDMBLq3ltw/Gk4LXEbkdloiV+TkwNRAlnJ2/LIsG3s9Aj
         vLd68TpKGcOLTpuJ03s81S3uuQDqZhnoDMwaKaiPuHwRHNKkQmNdbAQ0x++NcWplq11T
         j0j7CghS//7kfCjLjNs8R7AnFgA0IUka+2Vi1VNWfNci1DJCdjbcdfiX/xuCRXl5CwvS
         ReJrdCG9IfGpRHVR3w6GwNhQKeJNB2umipMS3dM+UQuiyWA9/yEx4yq9E3QJpdshcmHr
         r4U1GU8sNafaV0CyVv6ndqcEWHzJnWj17AhulhzZhAu+lAPPHHCr7uoB7ICnSg77+mXE
         5mNg==
X-Forwarded-Encrypted: i=1; AJvYcCUwmLqubiAgJWk9/BP+fwyIIzt1cN6OcKobN0mcnyJ+0d2oXibZfyu12JIirLtFo+bYHknDvrGYViL+dc+zrCVR@lists.infradead.org
X-Gm-Message-State: AOJu0YxCbxVr5kaG/zZQ5kZVEng8ibzVRAa7jAmKd5lfFpmqIL9Iqt2F
	bl2aALLVBM0sBPSgQFro4S2jGBr7g4MNkbPur6gwasnApE0MPJcsa81jguTEiHVwCSMGG4R2gYV
	7cqcVOJAM1I6o4w==
X-Google-Smtp-Source: AGHT+IEBJ4FZzMDcwCGDKN8xa1GdqdMhp4/1Mi4gQZ55PlpVVoMDB120scDJ9kcLF/kTOLPAggxTyBmxwWLxVQ==
X-Received: from wmbgw7.prod.google.com ([2002:a05:600c:8507:b0:456:293d:55c5])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:138c:b0:456:43c:dcdc with SMTP id 5b1f17b1804b1-458852502eamr42122365e9.33.1753725235777;
 Mon, 28 Jul 2025 10:53:55 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:53:14 +0000
In-Reply-To: <20250728175316.3706196-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250728175316.3706196-1-smostafa@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250728175316.3706196-28-smostafa@google.com>
Subject: [PATCH v3 27/29] iommu/arm-smmu-v3-kvm: Pass a list of SMMU devices
 to the hypervisor
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
X-CRM114-CacheID: sfid-20250728_185357_645969_92427BC0 
X-CRM114-Status: GOOD (  22.98  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Build a list of devices and donate the page to the hypervisor. At this
point the host is trusted and this would be a good opportunity to
provide more information about the system.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 182 +++++++++++++++++-
 1 file changed, 179 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
index 73c0150bdc81..2fa56ddfbdab 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -13,9 +13,119 @@
 
 extern struct kvm_iommu_ops kvm_nvhe_sym(smmu_ops);
 
+struct host_arm_smmu_device {
+	struct arm_smmu_device		smmu;
+	pkvm_handle_t			id;
+};
+
+#define smmu_to_host(_smmu) \
+	container_of(_smmu, struct host_arm_smmu_device, smmu);
+
+static size_t				kvm_arm_smmu_cur;
+static size_t				kvm_arm_smmu_count;
+static struct hyp_arm_smmu_v3_device	*kvm_arm_smmu_array;
+
+static bool kvm_arm_smmu_validate_features(struct arm_smmu_device *smmu)
+{
+	unsigned int required_features =
+		ARM_SMMU_FEAT_TT_LE |
+		ARM_SMMU_FEAT_TRANS_S2;
+	unsigned int forbidden_features =
+		ARM_SMMU_FEAT_STALL_FORCE;
+	unsigned int keep_features =
+		ARM_SMMU_FEAT_2_LVL_STRTAB	|
+		ARM_SMMU_FEAT_2_LVL_CDTAB	|
+		ARM_SMMU_FEAT_TT_LE		|
+		ARM_SMMU_FEAT_SEV		|
+		ARM_SMMU_FEAT_COHERENCY		|
+		ARM_SMMU_FEAT_TRANS_S1		|
+		ARM_SMMU_FEAT_TRANS_S2		|
+		ARM_SMMU_FEAT_VAX		|
+		ARM_SMMU_FEAT_RANGE_INV;
+
+	if (smmu->options & ARM_SMMU_OPT_PAGE0_REGS_ONLY) {
+		dev_err(smmu->dev, "unsupported layout\n");
+		return false;
+	}
+
+	if ((smmu->features & required_features) != required_features) {
+		dev_err(smmu->dev, "missing features 0x%x\n",
+			required_features & ~smmu->features);
+		return false;
+	}
+
+	if (smmu->features & forbidden_features) {
+		dev_err(smmu->dev, "features 0x%x forbidden\n",
+			smmu->features & forbidden_features);
+		return false;
+	}
+
+	smmu->features &= keep_features;
+
+	return true;
+}
+
 static int kvm_arm_smmu_probe(struct platform_device *pdev)
 {
-	return -ENOSYS;
+	int ret;
+	size_t size;
+	phys_addr_t ioaddr;
+	struct resource *res;
+	struct arm_smmu_device *smmu;
+	struct device *dev = &pdev->dev;
+	struct host_arm_smmu_device *host_smmu;
+	struct hyp_arm_smmu_v3_device *hyp_smmu;
+
+	if (kvm_arm_smmu_cur >= kvm_arm_smmu_count)
+		return -ENOSPC;
+
+	hyp_smmu = &kvm_arm_smmu_array[kvm_arm_smmu_cur];
+
+	host_smmu = devm_kzalloc(dev, sizeof(*host_smmu), GFP_KERNEL);
+	if (!host_smmu)
+		return -ENOMEM;
+
+	smmu = &host_smmu->smmu;
+	smmu->dev = dev;
+
+	ret = arm_smmu_fw_probe(pdev, smmu);
+	if (ret)
+		return ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	size = resource_size(res);
+	if (size < SZ_128K) {
+		dev_err(dev, "unsupported MMIO region size (%pr)\n", res);
+		return -EINVAL;
+	}
+	ioaddr = res->start;
+	host_smmu->id = kvm_arm_smmu_cur;
+
+	smmu->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(smmu->base))
+		return PTR_ERR(smmu->base);
+
+	ret = arm_smmu_device_hw_probe(smmu);
+	if (ret)
+		return ret;
+
+	if (!kvm_arm_smmu_validate_features(smmu))
+		return -ENODEV;
+
+	platform_set_drvdata(pdev, smmu);
+
+	/* Hypervisor parameters */
+	hyp_smmu->cmdq = smmu->cmdq.q;
+	hyp_smmu->strtab_cfg = smmu->strtab_cfg;
+	hyp_smmu->pgsize_bitmap = smmu->pgsize_bitmap;
+	hyp_smmu->oas = smmu->oas;
+	hyp_smmu->ias = smmu->ias;
+	hyp_smmu->mmio_addr = ioaddr;
+	hyp_smmu->mmio_size = size;
+	hyp_smmu->features = smmu->features;
+	kvm_arm_smmu_cur++;
+
+	return 0;
 }
 
 static void kvm_arm_smmu_remove(struct platform_device *pdev)
@@ -35,9 +145,62 @@ static struct platform_driver kvm_arm_smmu_driver = {
 	.remove = kvm_arm_smmu_remove,
 };
 
+static int kvm_arm_smmu_array_alloc(void)
+{
+	int smmu_order;
+	struct device_node *np;
+
+	kvm_arm_smmu_count = 0;
+	for_each_compatible_node(np, NULL, "arm,smmu-v3")
+		kvm_arm_smmu_count++;
+
+	if (!kvm_arm_smmu_count)
+		return 0;
+
+	/* Allocate the parameter list shared with the hypervisor */
+	smmu_order = get_order(kvm_arm_smmu_count * sizeof(*kvm_arm_smmu_array));
+	kvm_arm_smmu_array = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
+						      smmu_order);
+	if (!kvm_arm_smmu_array)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void kvm_arm_smmu_array_free(void)
+{
+	int order;
+
+	order = get_order(kvm_arm_smmu_count * sizeof(*kvm_arm_smmu_array));
+	free_pages((unsigned long)kvm_arm_smmu_array, order);
+}
+
 static int kvm_arm_smmu_v3_init_drv(void)
 {
-	return platform_driver_probe(&kvm_arm_smmu_driver, kvm_arm_smmu_probe);
+	int ret;
+
+	ret = platform_driver_probe(&kvm_arm_smmu_driver, kvm_arm_smmu_probe);
+	if (ret)
+		goto err_free;
+
+	if (kvm_arm_smmu_cur != kvm_arm_smmu_count) {
+		/* A device exists but failed to probe */
+		ret = -EUNATCH;
+		goto err_free;
+	}
+
+	/*
+	 * These variables are stored in the nVHE image, and won't be accessible
+	 * after KVM initialization. Ownership of kvm_arm_smmu_array will be
+	 * transferred to the hypervisor as well.
+	 */
+	kvm_hyp_arm_smmu_v3_smmus = kvm_arm_smmu_array;
+	kvm_hyp_arm_smmu_v3_count = kvm_arm_smmu_count;
+	return 0;
+
+err_free:
+	kvm_arm_smmu_array_free();
+	return ret;
 }
 
 static void kvm_arm_smmu_v3_remove_drv(void)
@@ -52,11 +215,24 @@ struct kvm_iommu_driver kvm_smmu_v3_ops = {
 
 static int kvm_arm_smmu_v3_register(void)
 {
+	int ret;
+
 	if (!is_protected_kvm_enabled())
 		return 0;
 
-	return kvm_iommu_register_driver(&kvm_smmu_v3_ops,
+	/*
+	 * Only one KVM IOMMU driver can be registered, so only call the
+	 * register function if any SMMUv3 exists on the platform.
+	 */
+	ret = kvm_arm_smmu_array_alloc();
+	if (ret || !kvm_arm_smmu_count)
+		return ret;
+
+	ret = kvm_iommu_register_driver(&kvm_smmu_v3_ops,
 					kern_hyp_va(lm_alias(&kvm_nvhe_sym(smmu_ops))));
+	if (ret)
+		kvm_arm_smmu_array_free();
+	return ret;
 };
 
 core_initcall(kvm_arm_smmu_v3_register);
-- 
2.50.1.552.g942d659e1b-goog


