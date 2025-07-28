Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0329C87FD4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSr0fqvgX1Drng12G6ETMDdU03kWvJEQjrB6gLd0l4Y=; b=s347FBAsdPt02JOgNH663t/UJG
	TL1zIG7wCPmG0h0Rukrd8+7S/Qy3zJGmBmaZvuDrcOaeZdsSXOPcP+NnknIgyC5HtWYmdb3fJPjOX
	0EnWB5aoODhdGzsnuv93E3KbUNVCqKaa65dnh7y43RULrhmkA3tn51n6lU6IhAqb695oL5Sb2en/O
	WGoB9+ofmaugX6eS+W7uLhsmYC85qYp3zONvPzeZG7K7wlEZs/btXnngknKRJSz9QXNrIVZu7J+yq
	DfwiotQGdnmpBZ3Viky5PLAl4J9O/To7kOkmEhfUYjFvaR5RhOJWsxby9qEnZXRxIFtAlsKqkKydq
	fpCM9JSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTiu-0000000FICr-0N1I;
	Mon, 28 Jul 2025 19:41:24 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS2x-0000000F920-33xS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:54:00 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4561611dc2aso33519045e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 10:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753725238; x=1754330038; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QSr0fqvgX1Drng12G6ETMDdU03kWvJEQjrB6gLd0l4Y=;
        b=hOWHpJjk+Yjc0oYXyPJUvPPb3FTtVnt51VmtbumAfA7YGFh/WuoF1CcMW4+sBewM7t
         ARWK/h0qqB3UYNQMhUSqS24EEFc3b3J/9h6nlE59Ido1PpZ/fO8bdXsfIVC2c3ILw2xL
         hGX8WY4icto8/KKDkEOOnKgPaf1zq0KyYMyqUzgamjy02pEIsRZi42e9+k5nQSdOnzei
         H8DbDR7vm/auFfB3pcRSqna7TZ+Q/Lo/9G2VgtuqvEXDwc6KdOT+MuGxkLQ2gV98lM7h
         Ok0bphA1r/n1rlN0m4Lj3HTaNOyL1ITr3BAZbzbEIGDcxAH26zgC1JOvYvG2H7ZQFf7L
         XvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725238; x=1754330038;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QSr0fqvgX1Drng12G6ETMDdU03kWvJEQjrB6gLd0l4Y=;
        b=roG8t+yB8JHu7rdiMRn/G2uWXaC1yz6Nk0QlVKnFKdq7UeZ3x+Gy4XeZSW+RPk6LzF
         jJX+wxzBIv+52cd7GlzPEp3/eeleVuL7CQkpJ1ZB/3cGRUYXbSofekbZtddY4CQ+3wad
         lNdpmoK+yN3MON2AhxEZKGIBztPWlETbRrem87by3eK6vulsznUVH2MryhDN/65RPQsw
         z/0rIP7E5cui97GWrmnxpQyp0mXtMHwIPaoaP3He7BF8z4oGXia/UfJgh0tUrAbvtzdk
         XkL+0urvrt+jBpC0NSDd3jiETT01bP3D5BEWnkTymmhbzCC2TvckpXumrhBjs3kakZUt
         lMfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTJPEIfwHjCJMKa83k2Oye3IvLSu7Bvq6zrETzHBPHMoo7pUxILnh8PjMWCxpIqAI55xaW5KJ0dj3qW91WznjZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyFo6lCK157KpCDJuNO4eQJ0d6AjwEvQZ1mV7K75f3DxhtmEmlJ
	kxdJVOWIKq7SpeVBvJAWURfpQM8Al62V26VCEa+6bR42bPNmKMv0c2EkqpoLDsqF/V4UtIbuJif
	GU2Wx/FS02oQfOw==
X-Google-Smtp-Source: AGHT+IHJypg4BMzHTQELfiD77Icp1+iTSwb8rg42c8bIcH6n5fDLR43xwlqFaDtwSnP1AmX/74ubtwgfnroFOw==
X-Received: from wmbay36.prod.google.com ([2002:a05:600c:1e24:b0:456:1ccb:7fbc])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4011:b0:3a5:243c:6042 with SMTP id ffacd0b85a97d-3b7765e58a1mr8332580f8f.2.1753725237768;
 Mon, 28 Jul 2025 10:53:57 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:53:16 +0000
In-Reply-To: <20250728175316.3706196-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250728175316.3706196-1-smostafa@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250728175316.3706196-30-smostafa@google.com>
Subject: [PATCH v3 29/29] iommu/arm-smmu-v3-kvm: Add IOMMU ops
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
X-CRM114-CacheID: sfid-20250728_105359_768536_663F7CD9 
X-CRM114-Status: GOOD (  17.28  )
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

Register the SMMUv3 through IOMMU ops, that only support identity
domains. This allows the driver to know which device are currently used
to properly enable/disable then.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 92 ++++++++++++++++++-
 1 file changed, 91 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
index 2e51e211250d..d7b2a50a4cb2 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -96,6 +96,95 @@ static int kvm_arm_smmu_device_reset(struct host_arm_smmu_device *host_smmu)
 	return 0;
 }
 
+static struct platform_driver kvm_arm_smmu_driver;
+static struct arm_smmu_device *
+kvm_arm_smmu_get_by_fwnode(struct fwnode_handle *fwnode)
+{
+	struct device *dev;
+
+	dev = driver_find_device_by_fwnode(&kvm_arm_smmu_driver.driver, fwnode);
+	put_device(dev);
+	return dev ? dev_get_drvdata(dev) : NULL;
+}
+
+static struct iommu_device *kvm_arm_smmu_probe_device(struct device *dev)
+{
+	struct arm_smmu_device *smmu;
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+
+	if (WARN_ON_ONCE(dev_iommu_priv_get(dev)))
+		return ERR_PTR(-EBUSY);
+
+	smmu = kvm_arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);
+	if (!smmu)
+		return ERR_PTR(-ENODEV);
+
+	dev_iommu_priv_set(dev, smmu);
+	return &smmu->iommu;
+}
+
+static void kvm_arm_smmu_release_device(struct device *dev)
+{
+	int i;
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct arm_smmu_device *smmu = dev_iommu_priv_get(dev);
+	struct host_arm_smmu_device *host_smmu = smmu_to_host(smmu);
+
+	for (i = 0; i < fwspec->num_ids; i++) {
+		int sid = fwspec->ids[i];
+
+		kvm_call_hyp_nvhe(__pkvm_iommu_disable_dev, host_smmu->id, sid);
+	}
+}
+
+static phys_addr_t kvm_arm_smmu_iova_to_phys(struct iommu_domain *domain,
+					     dma_addr_t iova)
+{
+	return iova;
+}
+
+static int kvm_arm_smmu_attach_dev(struct iommu_domain *domain,
+				   struct device *dev)
+{
+	int i, ret = 0;
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct arm_smmu_device *smmu = dev_iommu_priv_get(dev);
+	struct host_arm_smmu_device *host_smmu = smmu_to_host(smmu);
+
+	for (i = 0; i < fwspec->num_ids; i++) {
+		int sid = fwspec->ids[i];
+
+		ret = kvm_call_hyp_nvhe(__pkvm_iommu_enable_dev, host_smmu->id, sid);
+		if (ret)
+			goto out_err;
+	}
+	return ret;
+out_err:
+	while (i--)
+		kvm_call_hyp_nvhe(__pkvm_iommu_disable_dev, host_smmu->id, fwspec->ids[i]);
+
+	return ret;
+}
+
+static struct iommu_domain kvm_arm_smmu_def_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &(const struct iommu_domain_ops) {
+		.attach_dev	= kvm_arm_smmu_attach_dev,
+		.iova_to_phys	= kvm_arm_smmu_iova_to_phys,
+	}
+};
+
+static struct iommu_ops kvm_arm_smmu_ops = {
+	.device_group		= arm_smmu_device_group,
+	.of_xlate		= arm_smmu_of_xlate,
+	.get_resv_regions	= arm_smmu_get_resv_regions,
+	.probe_device		= kvm_arm_smmu_probe_device,
+	.release_device		= kvm_arm_smmu_release_device,
+	.pgsize_bitmap		= -1UL,
+	.owner			= THIS_MODULE,
+	.default_domain 	= &kvm_arm_smmu_def_domain,
+};
+
 static int kvm_arm_smmu_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -170,7 +259,7 @@ static int kvm_arm_smmu_probe(struct platform_device *pdev)
 	hyp_smmu->features = smmu->features;
 	kvm_arm_smmu_cur++;
 
-	return 0;
+	return arm_smmu_register_iommu(smmu, &kvm_arm_smmu_ops, ioaddr);
 }
 
 static void kvm_arm_smmu_remove(struct platform_device *pdev)
@@ -184,6 +273,7 @@ static void kvm_arm_smmu_remove(struct platform_device *pdev)
 	 */
 	arm_smmu_device_disable(smmu);
 	arm_smmu_update_gbpa(smmu, host_smmu->boot_gbpa, GBPA_ABORT);
+	arm_smmu_unregister_iommu(smmu);
 }
 
 static const struct of_device_id arm_smmu_of_match[] = {
-- 
2.50.1.552.g942d659e1b-goog


