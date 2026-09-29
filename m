Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85788CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 03:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDZxo1vDA8KPlmypD4LBvSL25B+x7JnUcC92a9yoH8o=; b=wglhnS6ENO+uoZ/kXjae4jePgT
	2wXP9VNV+wAoSpDyuc3fsTeF6mtocWBFmR/o8ffIWXgQN159eO3FuWP6e+QOYXsSph5Y4E4ousEn8
	39hOSzZ4ysHQFuBPDwQozleDK7gsyqC+4LlQffFieGgNGZYDFx7svSqetOcr6GqNP+hjH5qo0801w
	f2ujvY/e0xbJ4VitRY6QHXMxjQvPS7BDdOE9sodLAIg6Cy3XHvGu4Qb0mE9p5rlflckuGBZfB2rAK
	WNEh7AIhdba/ssZIvnexbV8RfVTnHOcA3a/3MXjACUVQ1Qoryc0fYomQ6OozRi+VYLB/p3zlm5kr+
	6RP/qSLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOmU-00000002G5p-2oCM;
	Tue, 29 Sep 2026 03:45:26 +0000
Received: from mail-pg1-x548.google.com ([2607:f8b0:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOmM-00000002G3A-1Wjv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 03:45:19 +0000
Received: by mail-pg1-x548.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso2449067a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 20:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790653517; x=1791258317; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IDZxo1vDA8KPlmypD4LBvSL25B+x7JnUcC92a9yoH8o=;
        b=iTybINSSzeQbNHUNOVFuXVCCEF6YgLSVPhZXksuw2Kmw5hAqnxIu/MseFTuRjxKHsS
         MDsTMijv0iCZ5Yt/zafkOIzkuLfJlNW+7Y7LVeV4Vf9ZCikm8zEpC3lYqk6rAWNYTrjp
         Cengf5f0PCPMrlsnGwzZ4S4UntdddobjPCEcKeDixT3B+L6OHR9sB6/cqvIlVR3NTWyw
         0EQLVMonJfjOWKBut7nZq8POrtbrmMD+Bl74Y1rwt/Q5WGg3p3q41FYOmotmCbo87dnv
         AVEinuE/0qWL2ZpQhO3nsEF3wkseH0ATFakXLAYJtiay3l9DWzw8sR3G5AYSfgbKcPpl
         ii2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653517; x=1791258317;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IDZxo1vDA8KPlmypD4LBvSL25B+x7JnUcC92a9yoH8o=;
        b=KVP3k9kAjqEqCr6FE1doL5UUVQqZUQBFCK5HUtDuAh8plb+OpRDbt2nQJRKVtean+O
         8gcGgZyhbBVrVA521ltBZ2MKZxO5+6ic0JzId7GIQVcxq7yVpyu0WxOuPTeYJYKHOXUF
         JKw0C6iRUMDVS+7RW+37P0ccbRVVdLTrbHwEzdC0CEcshE/c2t7vDKHDte0Cfy1u4eiO
         Ya4xXvT/YZCRpUsfod3tHn6xX/XauQ/Fx7SN90pcOYX7zrRUQSiRbFIq/9Z/k763iSzk
         cJwyifKMTVKrbJ2XHKz7GnFqh+nIqOzT6xF3notXtMQwjDSFWViHcXTLb2UNSD0eYs0I
         F7fg==
X-Forwarded-Encrypted: i=1; AKwUvBxjNl5iYly5HE+AOJuuOL5ciazKfzW/WDr83bgPylEOpMDa+FK54KaV+FoDHmDDGhzLhVyW8N460ZVvQjTTZ64F@lists.infradead.org
X-Gm-Message-State: AFuF++moSi2JzMMTvH0qDqcLnLwQ5UwU5y1esEasdJw2pvsU4MiecZXr
	nRLdsCC1oUfanaMNe85rL50aVTffw/zwKD8DWwTNvVW9CUBBb38OC1qwrQ5ikDfeBM9tC+rZTWU
	TtA==
X-Received: from pfcs22.prod.google.com ([2002:a05:6a00:6fd6:b0:882:ebd3:410c])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:7585:b0:87f:dcc3:62f
 with SMTP id d2e1a72fcca58-87fdcc35542mr7869110b3a.60.1790653516329; Mon, 28
 Sep 2026 20:45:16 -0700 (PDT)
Date: Tue, 29 Sep 2026 03:44:55 +0000
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
Mime-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929034510.2023173-2-praan@google.com>
Subject: [PATCH v11 01/16] iommu/arm-smmu-v3: Refactor arm_smmu_setup_irqs
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_204518_421393_EF335DD6 
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

Refactor arm_smmu_setup_irqs by splitting it into two parts, one for
registering interrupt handlers and the other one for enabling interrupt
generation in the hardware. This refactor helps in re-initialization of
hardware interrupts as part of a subsequent patch that enables runtime
power management for the arm-smmu-v3 driver.

Additionally, pass a 'resume' flag to arm_smmu_device_reset() to skip
registering IRQ handlers again during resume. On probe, handlers are
registered after queues are configured but before enabling translation.

Reviewed-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 75 +++++++++++++++------
 1 file changed, 56 insertions(+), 19 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 5732f3ba0122..270e6617a19a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4756,14 +4756,55 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
 	}
 }
 
+static void arm_smmu_enable_irqs(struct arm_smmu_device *smmu)
+{
+	int ret;
+	u32 irqen_flags = IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
+
+	if (smmu->features & ARM_SMMU_FEAT_PRI)
+		irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
+
+	/*
+	 * Enable interrupt generation on the SMMU.
+	 * As per the ARM SMMUv3 spec section 6.3.17 (SMMU_IRQ_CTRL):
+	 *
+	 * Completion of an Update of x_IRQEN from 0 to 1 guarantees that the
+	 * MSI configuration in SMMU_x_IRQ_CFG{0,1,2} will be used for all
+	 * future MSIs generated from source x. All wired or MSI interrupts
+	 * that are triggered from a source relate to occurrences that happened
+	 * after the completion of the Update that enabled the source. It is
+	 * not permitted to trigger an interrupt that relates to an occurrence
+	 * that happened before the source was enabled, even if the source was
+	 * previously enabled at the time of the occurrence.
+	 */
+	ret = arm_smmu_write_reg_sync(smmu, irqen_flags,
+				      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
+	if (ret)
+		dev_warn(smmu->dev, "failed to enable irqs\n");
+}
+
+static int arm_smmu_disable_irqs(struct arm_smmu_device *smmu)
+{
+	return arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
+				       ARM_SMMU_IRQ_CTRLACK);
+}
+
 static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 {
 	int ret, irq;
-	u32 irqen_flags = IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
 
-	/* Disable IRQs first */
-	ret = arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
-				      ARM_SMMU_IRQ_CTRLACK);
+	/*
+	 * Disable IRQs first as required by the Arm SMMUv3 spec.
+	 * As per the ARM SMMUv3 spec section 6.3.17 (SMMU_IRQ_CTRL):
+	 *
+	 * An Update of x_IRQEN from 1 to 0 completes when all prior MSIs have
+	 * completed. An MSI has completed when it is visible to its
+	 * Shareability domain, or when it has aborted, and the abort is
+	 * recorded in the appropriate SMMU_(*_)GERROR bit. Completion of this
+	 * Update guarantees that no new MSI writes or wired edge events from
+	 * source x become visible until the source is re-enabled.
+	 */
+	ret = arm_smmu_disable_irqs(smmu);
 	if (ret) {
 		dev_err(smmu->dev, "failed to disable irqs\n");
 		return ret;
@@ -4785,15 +4826,6 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 	} else
 		arm_smmu_setup_unique_irqs(smmu);
 
-	if (smmu->features & ARM_SMMU_FEAT_PRI)
-		irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
-
-	/* Enable interrupt generation on the SMMU */
-	ret = arm_smmu_write_reg_sync(smmu, irqen_flags,
-				      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
-	if (ret)
-		dev_warn(smmu->dev, "failed to enable irqs\n");
-
 	return 0;
 }
 
@@ -4841,7 +4873,7 @@ static void arm_smmu_write_strtab(struct arm_smmu_device *smmu)
 	writel_relaxed(reg, smmu->base + ARM_SMMU_STRTAB_BASE_CFG);
 }
 
-static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
+static int arm_smmu_device_reset(struct arm_smmu_device *smmu, bool resume)
 {
 	int ret;
 	u32 reg, enables;
@@ -4943,12 +4975,17 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 		}
 	}
 
-	ret = arm_smmu_setup_irqs(smmu);
-	if (ret) {
-		dev_err(smmu->dev, "failed to setup irqs\n");
-		return ret;
+	if (!resume) {
+		ret = arm_smmu_setup_irqs(smmu);
+		if (ret) {
+			dev_err(smmu->dev, "failed to setup irqs\n");
+			return ret;
+		}
 	}
 
+	/* Enable interrupt generation on the SMMU */
+	arm_smmu_enable_irqs(smmu);
+
 	if (is_kdump_kernel())
 		enables &= ~(CR0_EVTQEN | CR0_PRIQEN);
 
@@ -5594,7 +5631,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	arm_smmu_rmr_install_bypass_ste(smmu);
 
 	/* Reset the device */
-	ret = arm_smmu_device_reset(smmu);
+	ret = arm_smmu_device_reset(smmu, false);
 	if (ret) {
 		arm_smmu_device_disable(smmu);
 		return ret;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


