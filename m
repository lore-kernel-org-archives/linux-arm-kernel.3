Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D14CCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 22:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNBzpNsHMP9EroVda/kt7Sgk7izqkm+EHVOhUu1fFbM=; b=ncWNPe7XXgI2+hvjJ4kxBqw6PD
	sDmdREQ0wnbGiE99iEl5OUHgnQ/XI9JZbh6LBX82OK3sB5aUWAUJhM/6viXzxRuk/crQwLkK3ulGK
	Nj5aMQn900ZtTuOC5P5KI8V4rbs3970dOHfeMq/Unfjwqd6gpk2q2ptKSj5iAYgmPaXoD5WPttf/r
	7LkW5RNqIgafQOg8lgVn3bJcy7VFeg7MyXRDp/9ePobEEZC9iQjgAMX/widSIND1dVJredMcVkY69
	OnzoxBB7Xa+dOY2WgtRk9YQXWevkzk7D4MSYZvd56TPJ1CFjwHGUn4yUr/m3VFCzM2281vkvVJ4Lr
	nfxyKD1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSMW6-00000004mMh-43Hb;
	Wed, 27 May 2026 22:14:22 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSMW0-00000004mKa-1069
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 22:14:17 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2ba86e35aa1so192472825ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 15:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779920054; x=1780524854; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VNBzpNsHMP9EroVda/kt7Sgk7izqkm+EHVOhUu1fFbM=;
        b=tw5WAZClPH0F/DxmryAejA1kVypg4nBrDqBqDFGnm2bs5Zselu2DAgLozAisM4rN7f
         QTfh5sMX96bsT65soEEKiriGenm9s+jkCbt9qEAVwqcszvZ5dxmaadrBtwygm2dRp1mP
         LQbKBU4ZuJhcZzAy7B3o4oi/i6g7wzgodd8xDSbDAb6mrs9IUBJq4IBvW7tNGLbe/2GQ
         sFlNIZIPgYgR7ICU7ybhCWe8h4ZcERVnXHic9RjToTqtjctmquPLyjqpPN2+r42rHBkm
         NGWq+1TDKS/aNprDqV3QgJxABAt2t2pd74OHP63v/Fb7QcJOM/XruLmD2qzV+GPhtDZu
         osSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779920054; x=1780524854;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VNBzpNsHMP9EroVda/kt7Sgk7izqkm+EHVOhUu1fFbM=;
        b=YWCAOcjJ/afZ+OI4MnJNJWdHJFP1MGPwn3BPxKLvAsZz03V27QpkIcUx+vIBCqyUQG
         jIREZWGTl4qbNGHqUIVobVvvWG+NvY58AsfG25fpI+9khxzDvoF+oSAiDcpPi4wh6BjZ
         MV/gj6eBs26YxXiHk7Tfpz6utTizILVybme93ZSOrbMVTLTrWdWUVayDCRuqY2Y+Jvg+
         LY0dqwnv1KZovxh+nncygBlQjn2G4PlC8l9BpvTxdJuzbG/pAya2hL1BjJMWN/Ybz2QV
         GvVlQkgmvyp3rr2/6LN+VLEQqUY5p6kSpRcCxRCB8HJzWBQ7YoCBhopanzmwLeD8ksz5
         9hfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8X2azMPKSfS5MQYP11PiIZWInM9SjczVDD5S4+zHlkVqkERrWcQvTmOht50jC1z8xeIaOZZDenDhPANl0b15fz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5jjQdjsGW/O+RmSx422eWkXVk+uGOqqChYtY9VmDVohgMj/mV
	Kk8dKzkRp2UdWkakrys5XOi+jBTv7LRpJk7cqw4lxvLFz2CrpN+U9zmpg7svz7UC6k54EJvakt9
	c7Q==
X-Received: from plbjc6.prod.google.com ([2002:a17:903:25c6:b0:2bd:9b10:8067])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:24c:b0:2b9:fb0b:b727
 with SMTP id d9443c01a7336-2beb0675f69mr259357035ad.39.1779920054234; Wed, 27
 May 2026 15:14:14 -0700 (PDT)
Date: Wed, 27 May 2026 22:13:57 +0000
In-Reply-To: <20260527221407.1756491-1-praan@google.com>
Mime-Version: 1.0
References: <20260527221407.1756491-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260527221407.1756491-2-praan@google.com>
Subject: [PATCH v7 01/11] iommu/arm-smmu-v3: Refactor arm_smmu_setup_irqs
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_151416_280250_91A66692 
X-CRM114-Status: GOOD (  16.91  )
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

Reviewed-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 47 +++++++++++++--------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 8ce3e801eda3..3dad2c2d3283 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4601,14 +4601,32 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
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
 
 	/* Disable IRQs first */
-	ret = arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
-				      ARM_SMMU_IRQ_CTRLACK);
+	ret = arm_smmu_disable_irqs(smmu);
 	if (ret) {
 		dev_err(smmu->dev, "failed to disable irqs\n");
 		return ret;
@@ -4630,15 +4648,6 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
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
 
@@ -4779,11 +4788,8 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 		}
 	}
 
-	ret = arm_smmu_setup_irqs(smmu);
-	if (ret) {
-		dev_err(smmu->dev, "failed to setup irqs\n");
-		return ret;
-	}
+	/* Enable interrupt generation on the SMMU */
+	arm_smmu_enable_irqs(smmu);
 
 	if (is_kdump_kernel())
 		enables &= ~(CR0_EVTQEN | CR0_PRIQEN);
@@ -5417,6 +5423,13 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	/* Check for RMRs and install bypass STEs if any */
 	arm_smmu_rmr_install_bypass_ste(smmu);
 
+	/* Setup interrupt handlers */
+	ret = arm_smmu_setup_irqs(smmu);
+	if (ret) {
+		dev_err(smmu->dev, "failed to setup irqs\n");
+		goto err_free_iopf;
+	}
+
 	/* Reset the device */
 	ret = arm_smmu_device_reset(smmu);
 	if (ret)
-- 
2.54.0.794.g4f17f83d09-goog


