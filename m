Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A7BCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 00:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YNj1S5Tjh+MTuuSgivTU6GhE64woFcS5FBFIpdALKxk=; b=yrXgIDiixE2Ho8SRPIswd+WYBq
	0Qe75Rt8jauKET1/MjjP87UXf58SQf7o2YoaqZnKHaRPX79+qpZZiZgEia2iTR0VASlFKzSqt+Gjw
	H7jYTvxPSW2QT9VgD2hgdg3HE2U7wU6c9u3eq4IRgxuU/BNUexIqn+D5Ujpq447xzw87SjmcA4pUA
	hT5B++k3m7oU8VzPTKcOBYHD54bXYMqRpHOh8UUvYUDpr11x/e1EmfQGZX/YCRqcyIzigGq30xyn/
	T5GY6CIRThCM2VOL73wOTzvsg753635vLOcWG2+ZBNC9Dq6WMhhJOuKd+vBuWosb3x8k5cZ/ERkjv
	leOGcG2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoWOm-0000000BvLm-02C2;
	Wed, 20 Aug 2025 00:09:52 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUG0-0000000BfTM-08Ql
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 21:52:41 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45a1ba17bbcso25762945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 14:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755640358; x=1756245158; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YNj1S5Tjh+MTuuSgivTU6GhE64woFcS5FBFIpdALKxk=;
        b=UjMpc17OECL/E4zWg+l+Uk4gMaj8ba4iEwMtWgl1Pm85fnC35uupz5Oso7t+HH9xTV
         4sfFNgA8s/+EwZwnzd2XyIDxofoFO0Iwezp1WKLczfkYXhD1Pv2ghehwFsd4fHw9x3ea
         oLnSYNxHfzayI0Tz972MParM9F0zf48XeVJPR9z2jzj4yelDoQG6Jur3oqkq+A7FriRN
         tuf7+LB2XugwO4fuLtvmSL/0JFxtZXfCfpdUGL23JtlZL5aaKr8Yicc1ZjnAlYArj4BU
         hR7Bg9rqElvEGLFnRTiUx59tFVIibNoMs0qllNpsmhw8pvj43yH71oNu5BMt9kqHZEcc
         OzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755640358; x=1756245158;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YNj1S5Tjh+MTuuSgivTU6GhE64woFcS5FBFIpdALKxk=;
        b=PaqjP9EF2YACx7QmSXL3IYGR5A/hUl55LZNNIsSGBdmLvKCCoAQISMZs35UAmePgjy
         g0iX/aKX7D8DBPnZ/OwV0wcGLvPgc/R9DyCE2wTC8wk5UhQFF20Dk5/Lx8qyiq4IMXx2
         BWfW1JSXdGLTj84P8x9JQChAWy+dTB0CvR19BywUDF8e+ioiIQPY7OzdG2GPr5B5/HNz
         unkICOnejEPskTxNaWlZm4t3ugimHdCJFebg1VHb5OJO0QaltLXKvVBpjXuRMNaxkLbI
         pvlQf1Uh2AMZS36gQFqCgCdqpSvza/4jNibAzkb0tRucApgYPoBwi/TlqwEX8qStCWRu
         evkw==
X-Forwarded-Encrypted: i=1; AJvYcCVesHU2SjfrWXbkBbodeOFWrRAVSfwIOMTTBCNnnGwfVglICCPWBcf7D68pE3gMRHOuAM5b8ZguJmxLx1Es62XP@lists.infradead.org
X-Gm-Message-State: AOJu0YyShpZHTfEgnuGGc8K2s0JFIjzRVCYseVCflW7YPr8cb89Ff6UV
	5n1uYw9UB1iMiHOjAEzVQRb/w02dWcQybdtaWrw9V9+uzYDrwMf8nV4fj9GE4PEdu4IXFQLP/Ku
	bd3cqe5ns+o28+A==
X-Google-Smtp-Source: AGHT+IHhXE5eFe6Mvs1Uc4cVRo8SUsVH79pNU31b0EWqV1qHu+8OuogNqLM1q4nApTxhxyHGYIGINP4HjbEypA==
X-Received: from wmsd13.prod.google.com ([2002:a05:600c:3acd:b0:459:10dd:2e55])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b4b:b0:456:161c:3d6f with SMTP id 5b1f17b1804b1-45b479b8ed5mr2712295e9.11.1755640358514;
 Tue, 19 Aug 2025 14:52:38 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:51:43 +0000
In-Reply-To: <20250819215156.2494305-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250819215156.2494305-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250819215156.2494305-16-smostafa@google.com>
Subject: [PATCH v4 15/28] iommu/arm-smmu-v3: Load the driver later in KVM mode
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
X-CRM114-CacheID: sfid-20250819_145240_071363_CAA12594 
X-CRM114-Status: GOOD (  12.68  )
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

While in KVM mode, the driver must be loaded after the hypervisor
initializes.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 25 ++++++++++++++++-----
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 10ca07c6dbe9..a04730b5fe41 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4576,12 +4576,6 @@ static const struct of_device_id arm_smmu_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, arm_smmu_of_match);
 
-static void arm_smmu_driver_unregister(struct platform_driver *drv)
-{
-	arm_smmu_sva_notifier_synchronize();
-	platform_driver_unregister(drv);
-}
-
 static struct platform_driver arm_smmu_driver = {
 	.driver	= {
 		.name			= "arm-smmu-v3",
@@ -4592,8 +4586,27 @@ static struct platform_driver arm_smmu_driver = {
 	.remove = arm_smmu_device_remove,
 	.shutdown = arm_smmu_device_shutdown,
 };
+
+#ifndef CONFIG_ARM_SMMU_V3_PKVM
+static void arm_smmu_driver_unregister(struct platform_driver *drv)
+{
+	arm_smmu_sva_notifier_synchronize();
+	platform_driver_unregister(drv);
+}
+
 module_driver(arm_smmu_driver, platform_driver_register,
 	      arm_smmu_driver_unregister);
+#else
+/*
+ * Must be done after the hypervisor initializes at module_init()
+ * No need for unregister as this is a built in driver.
+ */
+static int arm_smmu_driver_register(void)
+{
+	return platform_driver_register(&arm_smmu_driver);
+}
+device_initcall_sync(arm_smmu_driver_register);
+#endif /* !CONFIG_ARM_SMMU_V3_PKVM */
 
 MODULE_DESCRIPTION("IOMMU API for ARM architected SMMUv3 implementations");
 MODULE_AUTHOR("Will Deacon <will@kernel.org>");
-- 
2.51.0.rc1.167.g924127e9c0-goog


