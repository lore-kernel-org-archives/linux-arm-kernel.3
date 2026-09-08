Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442CBC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lc32lUSnWjeFXxJjDUKsljGGJZHXRkwsKmhRUzXFCR0=; b=sPVdzpvXlZFXePIxxm5rf8SgYY
	8qurM/vviGiTihV405G/ya9mAxpc3j2kIkkmpbEz30WS8Ek35JVoih80qYwMPgKvCNpiKwOVuYRUR
	CGYYtEfDRFaYBMOPh7WL4BSuX2ZxkRCoyjwVGgLvEo5rKNrfLzqJHYNUIQcALp12+r2SdE+8o/riF
	CCyXssfBtuBjbdJ8BqGv+xTIJVpJaI2PEs/SKCESGixSvJ89qV3sHObuK/zlpkKqBbitIDsbkVMPa
	XK5WjqiVPw9ECMdLAE9/Thk9RPmExxttVpa1dNli2b9eUd6eoA9bfjFQNsO7JMaLYd5LBAJWwm//5
	+DidXfmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zRo-00000009mPN-3dGv;
	Tue, 08 Sep 2026 17:17:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zRj-00000009mNi-2sbR
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 17:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lc32lUSnWjeFXxJjDUKsljGGJZHXRkwsKmhRUzXFCR0=; b=FldgBvxB45ZLhLttte0bvghx/w
	0R4namftuCHCpqFfF9m1BYWQH8a3LxorBcb3sAoMMb+T0/jkKtDd1nDCiM/ZxT5U+URtkjtdfSqhs
	2WY7myNY67lFGAG8+rgAw7RP8BZgwp0TMoxaAV0h+OqkiLiHQHvdY41X/sD83Mv0QK3k7Vxh+feWG
	Y+Wz7KMSknAWmnopboeAmpCbvMtj+7chJTZ6FHLeAaAuL+19BHAFdq3LoHwe3v7W22Ka6XN76BnTX
	Sa/fsS8DeyjbH9UsNrioaMW+eP/birXWOjplYS1l5i2DY7p7/MY8f5yXALkUry9bKEOCEzMPIbyQg
	omk/gHFw==;
Received: from mail-pf1-x446.google.com ([2607:f8b0:4864:20::446])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3zRg-000000008uz-3Thy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:17:22 +0000
Received: by mail-pf1-x446.google.com with SMTP id d2e1a72fcca58-86261e66700so706802b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788887838; x=1789492638; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lc32lUSnWjeFXxJjDUKsljGGJZHXRkwsKmhRUzXFCR0=;
        b=BZfDjxNWd+NxB9WeLWAyvzjzSg8RPPZks0pibpNANSGhmgbJ1DyzyYKFdkHo1Lz6Tf
         VlAOPmHOXbJdd3dpBkpjOvQgOvKwNlUT70MG/3NPn6TUS5+Wzh/0kQXAGqPLI7ebB7He
         5FLFj/HAZSl6pohOJ6lDpabpGmqbqRVM8QXOK9FQvLzZaudD3gaH2D/ST5Axhs6On+1S
         Bnqe8MYtstFp6aJoqK92LvVUvLftjgiloE8mPN8Ajpx/6bLge0QVtq61sSfXqyfx8b8Y
         0lxRFNggr3KObcFNnjo4ZTQvbnjMRwzodl630UWB5bbI89wtw3gbCkYgfZUKoSENBEEa
         Ybow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887838; x=1789492638;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lc32lUSnWjeFXxJjDUKsljGGJZHXRkwsKmhRUzXFCR0=;
        b=l+S4XfE2Z98UseO4CFQP1tICWVIvPv7rfDZDbF6ZFtsx8Dpp/rWW969jC9zMoFVzPi
         zrwH1jHUz//JeeaAkU2JqWLpLTK9L5slEf3GD2LKY3+RGih6bL1jLBfPq6BVjEk3Aivb
         BewoQqR2mGh7CD7swqcKmTaFplEEMm+f1fKpPEEE/yF4STv8897rNRacf+D8L/x9nFHU
         QswRlSz4xynuhXbaCXFiKIc/w4ssEgWWAnTxQD1GSxdYjVe/TWcv2ZwD4v2jJw7KrX/Q
         YoMhDHMVyzi+0rR0Zqu6ETUdBK7NBUiG/VSFcmTnYUVV5tJVOPtIlYblfux5BHp/LRXA
         mqcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxe5XZ86ndBXGe1mQxQ3inBCABQ8vBmByz3u088I1S8/a9zD7XwHKW7uZD+TsbriIgmkiXTmEsJ3bitEoxHcUcY@lists.infradead.org
X-Gm-Message-State: AFuF++l0EDgVsSDn8mbxMs1vTlF5oZHdF57eKsaqfj1SnIX8nnpOQ9jR
	nPYgDh5g37A2oIlOdmgQr/u8StkvQrV1OGixWbCXZBwmMy1Z9XOi3gqys7Q7vYJdvjkrA2SyzQk
	b/w==
X-Received: from pfbly3.prod.google.com ([2002:a05:6a00:7583:b0:847:9472:cf8e])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:8c3:b0:856:30dd:91ba
 with SMTP id d2e1a72fcca58-86168e8bb34mr38848578b3a.2.1788887837663; Tue, 08
 Sep 2026 10:17:17 -0700 (PDT)
Date: Tue,  8 Sep 2026 17:16:57 +0000
In-Reply-To: <20260908171712.356645-1-praan@google.com>
Mime-Version: 1.0
References: <20260908171712.356645-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908171712.356645-2-praan@google.com>
Subject: [PATCH v10 01/15] iommu/arm-smmu-v3: Refactor arm_smmu_setup_irqs
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Thomas Gleixner <tglx@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_181720_988540_7212C086 
X-CRM114-Status: GOOD (  22.01  )
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
2.55.0.979.g7e5102b832-goog


