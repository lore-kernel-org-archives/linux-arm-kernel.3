Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD80E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVsW/B0gP9PKHwLUmI8ZMBosi9aDXXUah+1PSSjDx2o=; b=E20vjTixUiw/FRpY6r2v/bjbU6
	mohGZcHcyLgycZpL+yIun5v9EC9wMTTc+ZpIOxX20dNqNhCzD/bVqg71q6v04D6n6wtQApJKXl3Gc
	a+72eLR7ONbYLM/Ur58sdFp9MfUSLFN2m83O6q1V0ygN88k4vajVAJsxvdJlSpfmvEKbIGkuUHva1
	Jgyc7mrhFyJqOsdNK0nNUUQw6xm/dF2ryPrD7cUSAf+JLIg+9vbDL7/eSbVhsFrwSzIbJfNflIhw4
	rbfRMOSzLxz0xsvwgb5klM05Eg7uLwohpdQNnv9D0h+/M/6vy0vjrsbxL8z74jdoEL06ex+6tvEvS
	G30tWEaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLoIa-00000001Vdh-2QFq;
	Thu, 12 Dec 2024 18:52:32 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZn-00000001K2B-2MEc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:06:17 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-434fb9646efso8353895e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026774; x=1734631574; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EVsW/B0gP9PKHwLUmI8ZMBosi9aDXXUah+1PSSjDx2o=;
        b=RL8/2Y4tjd9jO4JVohoChHo/U0rDGYfIstLJNvAjvZxaHOl/2xvS7DFsTtuKHPRP7y
         b5jjroP8Hm5O6ElrEtqPs8ynnmf9TSpzj9TgfbrinpsSKqnVrPLB99+NzpfsUwOAjcXA
         iBzsmPETrg0mGFJ0amSzzvOsYq+jDzgtHPzka8BJUClOhhwrxldTc+oAt8gKT204yrdR
         Fic+B+/f74VuCMVJM7ZtBEyUcZGzouXZD5aD/MEFl6esV8sh2QXak11k3UehOzaAT5y4
         LJPAnuS8mYtdSE/MfmJF6dJh33YaA/nxRYKXX0eNxWl6Ez7Y+JmY+D2gEvhgcL8JIUTn
         fBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026774; x=1734631574;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EVsW/B0gP9PKHwLUmI8ZMBosi9aDXXUah+1PSSjDx2o=;
        b=fh+f1WfvOlnfkbQa/5vvBJV1DeyLwP+WauV5WvScfZUL2TaDHswm1BVP1RNan9TfH8
         D7KPJG3OIgWCoa8T2H61S/enowZ3GJxNWNx2Q6VjB3tA3wsGGYz4i0Akjxz7njCPil1V
         PHo8JkRWMruFh4OSDrNH/IvjNJIBTaa24wGYdtz1zPLzHWaJl0ue0TsuDHfovhU91b5Q
         6AZYBKbqEMWANhEF499eWavDMjIoBMxRvJsQtdGjrOdp+LCuplqm/i+xjlzKa0s0fxsG
         SBZu70IYQyOgy+x6lCbV9eDoazR7UHS/F1EtiwKxHWqGfwlK5kNcfLESx5uIbgW5Z0hA
         /SCg==
X-Forwarded-Encrypted: i=1; AJvYcCWJerI1z8NZLkxIP//3a3rWFnIjvoJHG/ZAhOcBdr76axKHu1O4LfjSN+vrYApoVkPu64gKzVIail9F9yonN3JR@lists.infradead.org
X-Gm-Message-State: AOJu0YwALs5Uwa72LlIBLRkDFpJVktmgA1CjXK9xk1JV/H2VfaJphWcA
	U0UROhQbWAnlxf7e5oNmszPa3qnfStyD6vofxjxWI+hBUZgAo1wrt/uxirCAxEzDeppDHGLjJE7
	LPx4f6p2UUg==
X-Google-Smtp-Source: AGHT+IGtbmK0V/XXvUUniJq5jDJrYVzgaPP6wOPvnq/baCobCTh6J6FiAIEBuWfIVdGKl3cSeTr7ETO057hIBA==
X-Received: from wmpj7.prod.google.com ([2002:a05:600c:4887:b0:434:e90f:9fd3])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f86:b0:430:5887:c238 with SMTP id 5b1f17b1804b1-4361c35f09fmr65905665e9.11.1734026773733;
 Thu, 12 Dec 2024 10:06:13 -0800 (PST)
Date: Thu, 12 Dec 2024 18:04:07 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-44-smostafa@google.com>
Subject: [RFC PATCH v2 43/58] iommu/arm-smmu-v3-kvm: Pass a list of SMMU
 devices to the hypervisor
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org, 
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com, 
	tabba@google.com, danielmentz@google.com, tzukui@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100615_613094_BDC1200D 
X-CRM114-Status: GOOD (  22.00  )
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
provide more information about the system. For example, which devices
are owned by the host (perhaps via the VMID and SW bits in the stream
table, although we populate the stream table lazily at the moment.)

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 128 +++++++++++++++++-
 1 file changed, 126 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
index 8cea33d15e08..e2d9bd97ddc5 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -15,9 +15,73 @@
 
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
+	platform_set_drvdata(pdev, smmu);
+
+	/* Hypervisor parameters */
+	hyp_smmu->pgsize_bitmap = smmu->pgsize_bitmap;
+	hyp_smmu->oas = smmu->oas;
+	hyp_smmu->ias = smmu->ias;
+	hyp_smmu->mmio_addr = ioaddr;
+	hyp_smmu->mmio_size = size;
+	kvm_arm_smmu_cur++;
+
+	return arm_smmu_register_iommu(smmu, &kvm_arm_smmu_ops, ioaddr);
 }
 
 static void kvm_arm_smmu_remove(struct platform_device *pdev)
@@ -37,9 +101,69 @@ static struct platform_driver kvm_arm_smmu_driver = {
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
+	/*
+	 * Check whether any device owned by the host is behind an SMMU.
+	 */
+	ret = kvm_arm_smmu_array_alloc();
+	if (ret || !kvm_arm_smmu_count)
+		return ret;
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
-- 
2.47.0.338.g60cca15819-goog


