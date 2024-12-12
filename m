Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFFFE77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nir/8Fu9wro0KzAUocadSL8VHwLHRc3vCT5pzOEHxAw=; b=hFJr3sXtaHGLRERtyAO8x9Wde/
	DJ9tcZGYojYM3d05NugKfh+LLMDNp0bRS3Wf8c/2/Xmp3cJRQ8FZe7LxSo01an+HRBSqdTS+0SVFO
	4Cgqx+qOQUs/2Nt308xCRyaoARRgos2a8kAHM6ZUO3aZ4FU/kktRIWCTr4+NA0pEIwaoMQPbbAfLV
	sGtNHhx6gw0KqCZaId1BDf8J14DAA3AZlLYefPZk+tvnEJIrCYf4Z5Dou32VeAp/iyS8QNZnlnfuc
	w/pkMlVzTX3pTIvSJoyYl7yAkkHfDl7d7cE2vfUeRPZKsNnE/4RotP5NErds/Tt6+aMhPtG8OjgzP
	6d36pTXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLofM-00000001aBZ-1uY9;
	Thu, 12 Dec 2024 19:16:04 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnaA-00000001KAY-17TP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:06:39 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4362552ce62so5374315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026796; x=1734631596; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nir/8Fu9wro0KzAUocadSL8VHwLHRc3vCT5pzOEHxAw=;
        b=mTxSXMNWyNwU3Gro3/S3lT5n2Q2UamvqE8k1dxHlfUygA/xy2gG2sWRoeFXfEBvLAH
         DPTE55cGfG/5/d163Gllp64DXFN1Qas299ngdNHdtZshlLKtMzd3n+FsJl1CQ9Sk9Nfs
         3rF2juszthwtdH6cLxeNAZYPB+XUE4KQWZVJTXpmGIM2a6/zEk19i9wC/saOd9a7IAH/
         UcujnN/SXwVVbqFF7FiZFCVwRWrpMePH89abKRBjfQWZL2YUoS0UTW545LsMt9D6pqcn
         GVdsRYa8AtZVSeAE5ZAn8iJK1N1DdVh3xl0/9WX2As12+4PJhAtcvW6EEuP7xGnKK35+
         WzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026796; x=1734631596;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nir/8Fu9wro0KzAUocadSL8VHwLHRc3vCT5pzOEHxAw=;
        b=egVHhiGswF/cekdUsGzop21Gd//n6iorvwTybMNa9ZZttTGx+n/nXjYtY31hhoEy60
         aWAQ2Ue8gfr+jODIyQpDDcQ9egr/i6lC886vy6y3qVUvR6F2G100qv3YAuJIu6/RwOEm
         NxDFL5BK/edJEEE1P5nGwSNkL/26hd92ALhkvVxHYrZP1ZlDFDRt2nHP6ainwsfjfql6
         pD0ZsKIEWnQumAb/gPzmNGT6azV/ucAg4l/FMEPRh68x0WcBZY+SfwuvROZC72/7xZ2x
         ERyb2R3bkzVB74XIcTkKbZ4haV1mCoEwf7LL4KhBU48xmlTr2PkwhuteZ/Ov/mA6hb4U
         Jbnw==
X-Forwarded-Encrypted: i=1; AJvYcCVflDwuuq/UaQldbj6Qnaj/h7J5F4dDS4lZtZYg595et1DaiDAmmqG4+qedE5tSLh+yFr7n9HvQC3/oighkFzkN@lists.infradead.org
X-Gm-Message-State: AOJu0YyXcD6mvuAMvTFaRJ+4j0HDPWmgYbZwGb5y2glOs7QotW2pQS5+
	Qbi+tfxk6v4EN9RLMhCn5BJOmJxtkgkmC6PWzqjA5HghQBOlDqUBYI8WbuVi/ep4bzXPyEXTW/d
	ipsZndEamYA==
X-Google-Smtp-Source: AGHT+IHRdZKXYWudkhhkQrQvejC9zCICHCvy3HiUQiQs1K09RQKbLBrbkNDh+wOO04CX03Sxp7dykFRKXpwfSw==
X-Received: from wmgg15.prod.google.com ([2002:a05:600d:f:b0:434:feb1:add1])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d20:b0:434:a529:3b87 with SMTP id 5b1f17b1804b1-4361c36f5ccmr81464315e9.10.1734026796519;
 Thu, 12 Dec 2024 10:06:36 -0800 (PST)
Date: Thu, 12 Dec 2024 18:04:18 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-55-smostafa@google.com>
Subject: [RFC PATCH v2 54/58] iommu/arm-smmu-v3-kvm: Enable runtime PM
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
X-CRM114-CacheID: sfid-20241212_100638_306146_F2B2FFA5 
X-CRM114-Status: GOOD (  17.49  )
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

Enable runtime PM for the KVM SMMUv3 driver. The PM link to DMA masters
dictates when the SMMU should be powered on.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
index deeed994a131..e987c273ff3c 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -11,6 +11,7 @@
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 
 #include <kvm/arm_smmu_v3.h>
 
@@ -127,6 +128,12 @@ static struct iommu_device *kvm_arm_smmu_probe_device(struct device *dev)
 	master->ssid_bits = min(smmu->ssid_bits, master->ssid_bits);
 	xa_init(&master->domains);
 	dev_iommu_priv_set(dev, master);
+	if (!device_link_add(dev, smmu->dev,
+			     DL_FLAG_PM_RUNTIME |
+			     DL_FLAG_AUTOREMOVE_SUPPLIER)) {
+		kfree(master);
+		return ERR_PTR(-ENOLINK);
+	}
 
 	return &smmu->iommu;
 }
@@ -818,6 +825,14 @@ static int kvm_arm_smmu_probe(struct platform_device *pdev)
 	hyp_smmu->iommu.power_domain = host_smmu->power_domain;
 	kvm_arm_smmu_cur++;
 
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	/*
+	 * Take a reference to keep the SMMU powered on while the hypervisor
+	 * initializes it.
+	 */
+	pm_runtime_resume_and_get(dev);
+
 	return arm_smmu_register_iommu(smmu, &kvm_arm_smmu_ops, ioaddr);
 }
 
@@ -826,6 +841,8 @@ static void kvm_arm_smmu_remove(struct platform_device *pdev)
 	struct arm_smmu_device *smmu = platform_get_drvdata(pdev);
 	struct host_arm_smmu_device *host_smmu = smmu_to_host(smmu);
 
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
 	/*
 	 * There was an error during hypervisor setup. The hyp driver may
 	 * have already enabled the device, so disable it.
@@ -834,6 +851,30 @@ static void kvm_arm_smmu_remove(struct platform_device *pdev)
 	arm_smmu_update_gbpa(smmu, host_smmu->boot_gbpa, GBPA_ABORT);
 }
 
+static int kvm_arm_smmu_suspend(struct device *dev)
+{
+	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
+	struct host_arm_smmu_device *host_smmu = smmu_to_host(smmu);
+
+	if (host_smmu->power_domain.type == KVM_POWER_DOMAIN_HOST_HVC)
+		return kvm_call_hyp_nvhe(__pkvm_host_hvc_pd, host_smmu->id, 0);
+	return 0;
+}
+
+static int kvm_arm_smmu_resume(struct device *dev)
+{
+	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
+	struct host_arm_smmu_device *host_smmu = smmu_to_host(smmu);
+
+	if (host_smmu->power_domain.type == KVM_POWER_DOMAIN_HOST_HVC)
+		return kvm_call_hyp_nvhe(__pkvm_host_hvc_pd, host_smmu->id, 1);
+	return 0;
+}
+
+static const struct dev_pm_ops kvm_arm_smmu_pm_ops = {
+	SET_RUNTIME_PM_OPS(kvm_arm_smmu_suspend, kvm_arm_smmu_resume, NULL)
+};
+
 static const struct of_device_id arm_smmu_of_match[] = {
 	{ .compatible = "arm,smmu-v3", },
 	{ },
@@ -843,6 +884,7 @@ static struct platform_driver kvm_arm_smmu_driver = {
 	.driver = {
 		.name = "kvm-arm-smmu-v3",
 		.of_match_table = arm_smmu_of_match,
+		.pm = &kvm_arm_smmu_pm_ops,
 	},
 	.remove = kvm_arm_smmu_remove,
 };
@@ -877,6 +919,12 @@ static void kvm_arm_smmu_array_free(void)
 	free_pages((unsigned long)kvm_arm_smmu_array, order);
 }
 
+static int smmu_put_device(struct device *dev, void *data)
+{
+	pm_runtime_put(dev);
+	return 0;
+}
+
 static int kvm_arm_smmu_v3_init_drv(void)
 {
 	int ret;
@@ -905,6 +953,7 @@ static int kvm_arm_smmu_v3_init_drv(void)
 	 */
 	kvm_hyp_arm_smmu_v3_smmus = kvm_arm_smmu_array;
 	kvm_hyp_arm_smmu_v3_count = kvm_arm_smmu_count;
+
 	return 0;
 
 err_free:
@@ -931,4 +980,21 @@ static int kvm_arm_smmu_v3_register(void)
 					kern_hyp_va(lm_alias(&kvm_nvhe_sym(smmu_ops))));
 };
 
+/*
+ * KVM init hypervisor at device_sync init call,
+ * so we drop the PM references of the SMMU taken at probe
+ * at the late initcall where it's guaranteed the hypervisor
+ * has initialized the SMMUs.
+ */
+static int kvm_arm_smmu_v3_post_init(void)
+{
+	if (!kvm_arm_smmu_count)
+		return 0;
+
+	WARN_ON(driver_for_each_device(&kvm_arm_smmu_driver.driver, NULL,
+				       NULL, smmu_put_device));
+	return 0;
+}
+
 core_initcall(kvm_arm_smmu_v3_register);
+late_initcall(kvm_arm_smmu_v3_post_init);
-- 
2.47.0.338.g60cca15819-goog


