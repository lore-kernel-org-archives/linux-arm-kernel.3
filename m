Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4847CC79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1q6wMbvWs5hyRc4lMFhdHQIXxqX9BNA101N+lgrnFo=; b=XIoN0WWSrpsKAg1ILrWeE7CvrQ
	kiAVQE773+SNYYvjLkdfpcmA/Qk2xyIdJseKN21gJSRJrcYEiQvZtiMvCVHR4a8ovRB62h5bhl0J7
	lo5PFBkx+dZwxau8wOUhNvkkfMildNabDnEw6jfHQNvmZ6xZlhnbWomXlZQySR10Xi0YDuIYG4kbv
	ljcQKTKfJtKjcVVCJjtLaNAhS2rB6nwDJXnIQvTXjyt6sIWN+TRJo4dprP4tXADwTiLEGmURpv/bg
	TM1Ixx8xq9EevYyXeCENp25eyJQF6aeX8KYMyZhOs86FjiLiEc3KHbsaWcn07aFyzrtAFio/T4M1d
	pIDK2HBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zRz-00000009mX9-12Md;
	Tue, 08 Sep 2026 17:17:39 +0000
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zRw-00000009mTh-3QmF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:17:37 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-8632fdf67dfso4004926b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788887854; x=1789492654; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1q6wMbvWs5hyRc4lMFhdHQIXxqX9BNA101N+lgrnFo=;
        b=DtI7rSPvS9nOaZvjxmxUEFt27fw2viWs4K70ZywENkqM6tHTwEXtEiB4/zNtS83g3K
         GfeWbhNj0hlg6g23COnwNXApn5/hZfUA4zKC+guNLT7kAdTxWssvlC4O3xRUC2TW7Ttq
         nNgwBBc5Thp9xQVN0S93fO58fppCzg+oADAWehaEPNpw/5fL41sSmhw0fnh6Ntmw1LCX
         9wu21dO/b+Rk9WyUJIrEvKRqd4uDif0RxoJwsO5O6uJH2tfcZBF5cJRzbi2HTSxgijo2
         qaon9H64F9XxsNhCgmXFOd+NJTxttxj2FPjJqE343MAfzZ6mExubVuYTrvuTbra1m5Ow
         NItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887854; x=1789492654;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1q6wMbvWs5hyRc4lMFhdHQIXxqX9BNA101N+lgrnFo=;
        b=VH1C7bENJVW87KaNmwubmIMARk8zoy0qkw1OtYqGkV3rXHNYKcaBhBXxRolTHGF0Nc
         aLDFAa0DcwDsAsj9WbIiu4Ol9HBfLOKUWKvVKUzLnWjnXHlAax/4Sc3pE9uOj1Fn0aSV
         VnRSS/8vYSaUz9oYhnJwb94gVJ4ccpoMNJbUMqpJg9/4Ul4T5Meum2VROgS56TOjLREy
         zbWa3E/vg5zJm7qefTP5VtqSDv5A0Flp/M7xusgS67DA1mr6q8Bvz/Cli52GAlzZEzjR
         Xrjx29BvcfWG89rA/wwLsph/5qTn3qC3zAc0ZkwpQE90UrXRq1mhNhWZIZ7HzISU/6xh
         eqBw==
X-Forwarded-Encrypted: i=1; AKwUvByWy8XcFJkp77mNyUkDslYiWbHg+e4N2Q69DRohn2LvFt8sYomGfBjlLigJUZtiJ/8l0ZxeT1K9006cTpMTFgH9@lists.infradead.org
X-Gm-Message-State: AFuF++nHf15RI8Jh3XgPRVmR548BSn3/tFEkLJOCP4LnL6N9tmxwQJhp
	e33zLbLnnrNZ8CZ2bodPcDM5NmhRnpg18YSPB40riUpcmgrMsXeAcCRqC5BOS1ycZLzBHnn6GwP
	URw==
X-Received: from pfbim24.prod.google.com ([2002:a05:6a00:8d98:b0:84b:57b7:60c5])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4506:b0:837:f111:b70
 with SMTP id d2e1a72fcca58-85ffc18995amr33657135b3a.4.1788887853997; Tue, 08
 Sep 2026 10:17:33 -0700 (PDT)
Date: Tue,  8 Sep 2026 17:17:04 +0000
In-Reply-To: <20260908171712.356645-1-praan@google.com>
Mime-Version: 1.0
References: <20260908171712.356645-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908171712.356645-9-praan@google.com>
Subject: [PATCH v10 08/15] iommu/arm-smmu-v3: Cache and restore MSI config
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Thomas Gleixner <tglx@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_101736_909720_8C9049F6 
X-CRM114-Status: GOOD (  17.04  )
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

The SMMU's MSI configuration registers (*_IRQ_CFGn) containing target
address, data and memory attributes lose their state when the SMMU is
powered down. We'll need to cache and restore their contents to ensure
that MSIs work after the system resumes. Address this, by caching the
original `msi_msg` within the `msi_desc` when the config is first written
by `arm_smmu_write_msi_msg`. This primarily includes the target address
and data since the memory attributes are fixed.

Introduce a new helper `arm_smmu_resume_msis` which will later be called
during the driver's resume callback. The helper re-configures the IRQCFG
registers for each relevant interrupt (evtq, gerr, priq) via the new
platform_device_msi_rewrite() helper.

In addition, clear ARM_SMMU_FEAT_MSI if MSI setup fails and the driver
falls back to wired IRQs, preventing spurious MSI resume attempts.

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 32 +++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index dc2fc02b5163..a8166e75db0b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4771,6 +4771,9 @@ static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
 	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
 	phys_addr_t *cfg = arm_smmu_msi_cfg[desc->msi_index];
 
+	/* Cache the msi_msg for resume */
+	desc->msg = *msg;
+
 	doorbell = (((u64)msg->address_hi) << 32) | msg->address_lo;
 	doorbell &= MSI_CFG0_ADDR_MASK;
 
@@ -4779,6 +4782,31 @@ static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
 	writel_relaxed(ARM_SMMU_MEMATTR_DEVICE_nGnRE, smmu->base + cfg[2]);
 }
 
+static void __maybe_unused arm_smmu_resume_msis(struct arm_smmu_device *smmu)
+{
+	/* Clear the MSI address regs as they reset to unknown value */
+	writeq_relaxed(0, smmu->base + ARM_SMMU_GERROR_IRQ_CFG0);
+	writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);
+
+	if (smmu->features & ARM_SMMU_FEAT_PRI)
+		writeq_relaxed(0, smmu->base + ARM_SMMU_PRIQ_IRQ_CFG0);
+
+	if (!(smmu->features & ARM_SMMU_FEAT_MSI))
+		return;
+
+	if (!smmu->dev->msi.domain) {
+		dev_err(smmu->dev, "msi_domain absent during resume\n");
+		smmu->features &= ~ARM_SMMU_FEAT_MSI;
+		return;
+	}
+
+	platform_device_msi_rewrite(smmu->dev, smmu->gerr_irq, arm_smmu_write_msi_msg);
+	platform_device_msi_rewrite(smmu->dev, smmu->evtq.q.irq, arm_smmu_write_msi_msg);
+
+	if (smmu->features & ARM_SMMU_FEAT_PRI)
+		platform_device_msi_rewrite(smmu->dev, smmu->priq.q.irq, arm_smmu_write_msi_msg);
+}
+
 static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 {
 	int ret, nvec = ARM_SMMU_MAX_MSIS;
@@ -4798,6 +4826,7 @@ static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 
 	if (!dev->msi.domain) {
 		dev_info(smmu->dev, "msi_domain absent - falling back to wired irqs\n");
+		smmu->features &= ~ARM_SMMU_FEAT_MSI;
 		return;
 	}
 
@@ -4805,6 +4834,7 @@ static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 	ret = platform_device_msi_init_and_alloc_irqs(dev, nvec, arm_smmu_write_msi_msg);
 	if (ret) {
 		dev_warn(dev, "failed to allocate MSIs - falling back to wired irqs\n");
+		smmu->features &= ~ARM_SMMU_FEAT_MSI;
 		return;
 	}
 
@@ -4918,6 +4948,8 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 
 	irq = smmu->combined_irq;
 	if (irq) {
+		/* MSIs are unsupported for combined irq cases */
+		smmu->features &= ~ARM_SMMU_FEAT_MSI;
 		/*
 		 * Cavium ThunderX2 implementation doesn't support unique irq
 		 * lines. Use a single irq line for all the SMMUv3 interrupts.
-- 
2.55.0.979.g7e5102b832-goog


