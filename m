Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB07CD6E65
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 21:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ai+cV1PUAoJFIr5rJA5saMXsoTfCbKkPKE9Leq0NHbo=; b=uaNz+21vcbVD0txy0nl5aYkUYU
	B6hZNqvvlBBbAE5eJqUAEYRP10fMdm4i3qmLZkRgTei1rzlP2YwOFtrV+cN7P4Ly0e+5y7wtChTum
	Sj5Z4i0/qF+JVHoAJ1gcww7o2Go7TnbixqQ3mtTQkq9Jtgvez6YemBOsspDKrK7FbRUVyCnzdz+Z1
	bvRO5pfxqaoZSM2qG4ej6eJ4yacYUXkn32d5txryBEPajz8Np7Xx43XFgs6tYkui89YHC2s2I54el
	sb6Ep/3sMTthwtcyHBEfKLjKiUfObuIPBXa45Pa5Vc0PnOuj5d3eXtVGvsospCzR6ufJw+d4I7VBE
	StK4r7MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAfJ-0000000BtGi-42lx;
	Mon, 01 Jun 2026 21:59:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAfI-0000000BtG8-3QXJ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Jun 2026 21:59:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ai+cV1PUAoJFIr5rJA5saMXsoTfCbKkPKE9Leq0NHbo=; b=gx18FpU1ZPrCouN1VyjNF473gz
	IxOaElz5bLAvk6ftgKIU1EkOgwbVNo4G0l1x5aIRMmrNtT6bQFdnxXDMYQgmA1z900sAH/jWF+i6T
	hXgR2GpZ495+aCck9hCo/NqpKRP+B8FOVRE1wK5eQMrI/xLsEWgMY+XAZIu7/DBImkqeYDWtFGePs
	6/KTD0JP+NDDrUjF3csvDgn3SAUFq/ZGlw1gZYZq3F/mslBdfzD+fnvz5cW3/Dx4S+kFkkyw2qj9o
	i+cgNEzyLhLKvYJoNH/x9d1+k4i/bXXkRoAJr7P23wY6YTdfHd1OsswbkFz+E7x72z9lXFvNjqX6S
	CoWgAZ3A==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAfF-00000007opo-0UvM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 21:59:19 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2bf335549b8so40836075ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 14:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780351154; x=1780955954; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ai+cV1PUAoJFIr5rJA5saMXsoTfCbKkPKE9Leq0NHbo=;
        b=X/JXuA0tZzvbu+GTTPnpMnoLs3txycPRDsq/Q9qi6MndjEtuCmyIdqOD/AJnC0IeQ/
         cb4FvskOax+/ziOcgbKIYLi+AMWBUKpg/NhOrEhNDbMFiSdSV7JM5QdD5aiqbdGMShfI
         DW3cWATdBA0kHODTYpS24KHErkcrc3L9V+MPlu/c67vPTYfgZKIlP3swWT1hHZCQuM3L
         iiABLr3Pbx4tUcF31pQA28lbP+uhqtcOWqO1vlTuymK0U42iSW+FzFr3439wtso928Dm
         hHVgfTudkMVG/RDQGk613a5fI8okAiRDV94nWqZ5CCTnKpYieRakvFnxmuBPNDs/xCab
         ixEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780351154; x=1780955954;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ai+cV1PUAoJFIr5rJA5saMXsoTfCbKkPKE9Leq0NHbo=;
        b=kvS+1VNP2870EeLJ/ouEa2LYCRMdLC6rjfeyKK2b2/ZHSZGhZQS5nhE23bxHIaB1qM
         j3NyuT+eV9su/bI49cyuXujUjTCTA5P+PcZh7+Ff/4mPxf6G27Lv2YVDoM6BIroPflsG
         n0sYcP/lscrN/Q/lDE1VesCETigAgCnyYdTBNDN46ILA1S08dfQyktI1uge81OE5ppA8
         mpqedoecstBC2P1aanDjby4Me+jpSVnMwsFpzvOwq+NW7XLK/KOkBGfvcQMMQghirgaf
         FyH8MZG3zWG14U9JavQCsQgIJ2c+h7Ri0Ajnxo05EHytj9AGnalzTdPQS/UuUGwi1LZz
         1CZQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Puoa2PYLJdexfGQVMLYs9w02DzHlkDEXKql5BBnnH88x8lfyw/NvcNJIzQ/1SOM6H4HkDl4ToVKnAhW0quuxK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+I0pbuUjO8i7p5Yt/F8Qn2IoSweCENlM9MKuU+kN+4P1ZAKiu
	ilGSDfhZD8gaAnmPEIFdQENKQdg2tMFDYaVjBsbnSJ/+jQNDTs4Sd4jVSE6Jty3AXFrmT+vHxW0
	5QQ==
X-Received: from plbna5.prod.google.com ([2002:a17:903:1585:b0:2bf:fd0f:2b0d])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e78b:b0:2bd:907:2cf0
 with SMTP id d9443c01a7336-2bf36840972mr152023605ad.32.1780351154112; Mon, 01
 Jun 2026 14:59:14 -0700 (PDT)
Date: Mon,  1 Jun 2026 21:58:58 +0000
In-Reply-To: <20260601215909.3958732-1-praan@google.com>
Mime-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.1013.g208068f2d8-goog
Message-ID: <20260601215909.3958732-2-praan@google.com>
Subject: [PATCH v8 01/12] iommu/arm-smmu-v3: Refactor arm_smmu_setup_irqs
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_225917_669360_86F709E6 
X-CRM114-Status: GOOD (  17.70  )
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
2.54.0.1013.g208068f2d8-goog


