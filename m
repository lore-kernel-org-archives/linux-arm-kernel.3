Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AB5C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 21:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6jDsLdtzLKtqY4apUWLxP6U5mjSigvgDfQ1qHvaeqM=; b=Qnoa+LFlsyyfVRJUriOEy/qvFr
	9qlYxGxRvgJ+zQ/qdjPFvGP5AW+m3c+l+0XJ4l51Nl8LaDA3+/KXr6hhWEOrP1Fkh2cVgWp7WNL3K
	/JQ3eKd30ey1EEELUe4xPECKiDYQTPtpoWMvFGNUxMOfUwGhWNXrDXb1s+VZKVdarDPT6Ivg+RmnY
	+rK7ajtjI0tQyZpSZvL+eIzO+7tfYFYKPluk6Kx+AYXRdA5czkFKc5J5HXcIh4sOkI15XlthDtNsc
	qXBFHPP6Cf5MuKGXJu8jJKhL31v5IZtKZbOfpoH3b2JmemtLtVFH6ap576PJYKt9rr5iCO41+q0Au
	Mkw+KUuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop3Z-00000006GPk-0IiE;
	Tue, 28 Jul 2026 21:09:45 +0000
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop3S-00000006GMr-1ywf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 21:09:39 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-84842381150so380984b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785272977; x=1785877777; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v6jDsLdtzLKtqY4apUWLxP6U5mjSigvgDfQ1qHvaeqM=;
        b=Bbk/gURb9+DnJbxjsbE4u1vn/9UnGgYySyvLJ8WZyLCR2wDtTsPWTUid/2x0HPKQDQ
         PQFZqFloo8g1N4sP91xcjfSAAHVUBDpbG//eKMwmoRBlrJb0YChbD0S4p/l2Vvd7JO5u
         PegK6609tfUy5nSzJ2r3DZBQ9YkRhQhZuoH2LQOfZirnBgyCLTQKe8N/jlGdd9FJrjI6
         ryKY10vjE4+3QHjp1tMlBznNYsL114A9g4g6qwZMMAHifT3Ww71SRNKTfW0aspLNGqXh
         eeq2T0BFI40DNj+X1o7FHK3yv5g4H5hvcDrGG5n3XVf3Je/s2X9BP3DQknN1KSN7Rw5z
         /wSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785272977; x=1785877777;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v6jDsLdtzLKtqY4apUWLxP6U5mjSigvgDfQ1qHvaeqM=;
        b=hkKs1Nwdp3ZUd13zuRxmGjA1OatAzNwrCP7QbWvualVyaSTttANQZuyItLLmvk6kYI
         j6C0Wa5+6o1GErMZxqo0UwMw1sn3xCG6TFkhGU/iqAD91hBGdUrkTaGILxmGTiAremJG
         s5ZmChJ4nxD3hFFrxBzQfBA1Tl2F9EMSgX4lFqFRCso9/ssr32uUGsv0Sx5o7+Nia1PB
         vUCumZdlzUZ3Tw5QJXJRdiiK7roct05IuitIk9ld7fAPoX14/SNOPzMgI2X5gn0JLtE+
         xh9pzHfugtpIoNlozo9F1Xh4io791TkMFXGRLXH7Cil0I0hdCL6LfdmqCu2LALLsZj5w
         wrQQ==
X-Forwarded-Encrypted: i=1; AHgh+RpHo2LpZM3MbihBxC4cYgUh8eGbz6Pi6Y+eph44no+JkhYQ7HP75/N4XyXbi3kesQk5fZTqCAISUr7gUiD1tHh7@lists.infradead.org
X-Gm-Message-State: AOJu0YyMHnoyY3r77LJdIKZLL6fkwK56xDAwH8mQtfxySOY5OYnhH6cn
	r1wVckJ0F6cdQryH1iszfGS/ubG1c7PGnn/1rWZ4ZCpVW7j33LCNLfIDSk33J7a7hNSwWax6PBn
	BYQ==
X-Received: from pglf33.prod.google.com ([2002:a63:1021:0:b0:c92:dd1e:dc3c])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4ac6:b0:848:2f6e:e52e
 with SMTP id d2e1a72fcca58-84e9337e944mr3967580b3a.66.1785272976845; Tue, 28
 Jul 2026 14:09:36 -0700 (PDT)
Date: Tue, 28 Jul 2026 21:09:17 +0000
In-Reply-To: <20260728210928.1050849-1-praan@google.com>
Mime-Version: 1.0
References: <20260728210928.1050849-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260728210928.1050849-2-praan@google.com>
Subject: [PATCH v9 01/12] iommu/arm-smmu-v3: Refactor arm_smmu_setup_irqs
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	linux-arm-kernel@lists.infradead.org, Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_140938_517715_16B51C5B 
X-CRM114-Status: GOOD (  17.02  )
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
index 3a9cbd7d8a00..a11f5bcbe77d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4749,14 +4749,32 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
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
@@ -4778,15 +4796,6 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
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
 
@@ -4936,11 +4945,8 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
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
@@ -5576,6 +5582,13 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	/* Check for RMRs and install bypass STEs if any */
 	arm_smmu_rmr_install_bypass_ste(smmu);
 
+	/* Setup interrupt handlers */
+	ret = arm_smmu_setup_irqs(smmu);
+	if (ret) {
+		dev_err(smmu->dev, "failed to setup irqs\n");
+		return ret;
+	}
+
 	/* Reset the device */
 	ret = arm_smmu_device_reset(smmu);
 	if (ret) {
-- 
2.55.0.487.gaf234c4eb3-goog


