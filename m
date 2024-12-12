Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8971E77182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2LdunWCve+BzW7qxRXgQ2DWd6pqP346bXuKFqoUe0/0=; b=x/MyH3B8Di4QdmghXiqzhoamJL
	hmMw1/j+YI88fzITBVEAXLdVD3mvf8Pf5NsJx5WqFIOJ3dVR1jZ+M1pNMKeBL05wQxMQQeLql01c7
	vNi2ciOk0Ap5I6aituCRR8q7t0iTVTuVHPJFESGT/d8F2XIhYoePh2YXvKmkVxictDZ3gR8Xcq4HR
	WAvIjb410TzCBXnX+ELgwh7KyDOBb9WSVZWrtjl6nVASz5T+tKTd7bkJWEk6R7tr9l8YHrvwm/Ddt
	+Ov8mLdm2gpOxW+jsLA5HKVaad9sY6Tu9BbPhrVrvBaSEqRKDHsNwkBmr/iYp4OwuL2iBx/DfIq9+
	jHMG3P3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLofL-00000001aAt-1WZ6;
	Thu, 12 Dec 2024 19:16:03 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLna6-00000001K8p-0SDw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:06:35 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4361efc9d1fso8323555e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026792; x=1734631592; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2LdunWCve+BzW7qxRXgQ2DWd6pqP346bXuKFqoUe0/0=;
        b=g3D+s9m3lPHJ6ylpJGLCNkExb7ujzb34G9S26GYZ2J5BK/BmUPiwWJFDTPjpbdTyRE
         AoiqTU2O7ZWa9nWTuD0529bPkJeGkrOLQm2fEu77ZCXv3vAqFJ9pGl74oHlFUXm2Nlh+
         aEcT/5uxpaj15zGcJisL/CpOaprQVSP8sruPkOMBrjcqpCNnLa5sGLcFSSX75QuKxVru
         zkeTSm38bVhvHlfMZVvW6TPVdVX5+MGYxvPfStEBFPAwLBuMOT+5SQwRew7cJ75gmuAI
         x3pye6FV4/1321PK9BqqBClIX2JNRFcgsTbPxMgY8Ez+4aK/oFh7rd325RBM+DSFF2rs
         VPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026792; x=1734631592;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2LdunWCve+BzW7qxRXgQ2DWd6pqP346bXuKFqoUe0/0=;
        b=Sxt4yZnalIX/tx+nWGECFFUlO/flWjlsn4OMhFwapzJ4MKoJ2bb7+IB1PFCy3wuW7E
         X+kJqrVdIMgdNVGKqxEXtuPBIkcpP/ZjI+Oat2BfjTeAJkrXOByXE/qULy7X1251zHLR
         KoOMPqbIyB+F2gXPicmMlvoMvTV6c57BGVMKKrpeLSUywDouy0E1pfXGNbTKULz6MGs5
         +plFu9NJSSiGxsDjIUV5+iKgOsv5dN0ubDsyhveU5OMR8Ej6Z3UCaRL2bbMp5SoTll5s
         /nOy3qopuX4NwDLRpqOP3X/N/2oE4Jpxs4a1swQRoBcW5UCxgwMmkl/wUJgJsiMuf/GQ
         ZSXA==
X-Forwarded-Encrypted: i=1; AJvYcCVjDZUbOELYN71t49L7ZoLsy7Y25GgMqcC6y5ICyZesAqTRxHLXMiy8La3kxnlrQn7laf5vPC7zRQUc787yFxzx@lists.infradead.org
X-Gm-Message-State: AOJu0YyiMXZp5SdFKzDjIUe4+ihLZKb/U5NzBIuM2AOm9/WcDW8ClVdU
	7OnFzeX5etxNs4H3qVzzUmnJwIhR6AP4VH53JeUJz/JFtPZvCZFaS420CtWORZVhkvaPqo/+DD9
	1pa4xM3X4Vg==
X-Google-Smtp-Source: AGHT+IERWZ4NnM7KQcPGdQG43bKrQYNR/UyZnwsqD34WfJRCP7KI0E4FIciOvn+bi06f/klghzOUEL4MFalBog==
X-Received: from wmqd1.prod.google.com ([2002:a05:600c:34c1:b0:434:fe2b:fea7])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5101:b0:434:ffb2:f9df with SMTP id 5b1f17b1804b1-4361c3a6550mr73450045e9.17.1734026792347;
 Thu, 12 Dec 2024 10:06:32 -0800 (PST)
Date: Thu, 12 Dec 2024 18:04:16 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-53-smostafa@google.com>
Subject: [RFC PATCH v2 52/58] iommu/arm-smmu-v3-kvm: Add IRQs for the driver
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
X-CRM114-CacheID: sfid-20241212_100634_147307_6F3089F4 
X-CRM114-Status: GOOD (  22.30  )
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

Handle IRQs from the KVM kernel driver, it should be safe to do it
from the kernel as this a debug feature.

Only GERROR and EVTQ irqs are handled.
Unlike the kernel driver, we don't do much here (no rest in SMMU or
interaction of cmdq) but just printing.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c   |   3 +-
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 138 ++++++++++++++++++
 2 files changed, 139 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
index 2a99873d980f..60f0760f49eb 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
@@ -365,7 +365,6 @@ static int smmu_init_registers(struct hyp_arm_smmu_v3_device *smmu)
 	      FIELD_PREP(CR1_QUEUE_IC, CR1_CACHE_WB);
 	writel_relaxed(val, smmu->base + ARM_SMMU_CR1);
 	writel_relaxed(CR2_PTM, smmu->base + ARM_SMMU_CR2);
-	writel_relaxed(0, smmu->base + ARM_SMMU_IRQ_CTRL);
 
 	val = readl_relaxed(smmu->base + ARM_SMMU_GERROR);
 	old = readl_relaxed(smmu->base + ARM_SMMU_GERRORN);
@@ -540,7 +539,7 @@ static int smmu_reset_device(struct hyp_arm_smmu_v3_device *smmu)
 		goto err_disable_cmdq;
 
 	/* Enable translation */
-	return smmu_write_cr0(smmu, CR0_SMMUEN | CR0_CMDQEN | CR0_ATSCHK);
+	return smmu_write_cr0(smmu, CR0_SMMUEN | CR0_CMDQEN | CR0_ATSCHK | CR0_EVTQEN);
 
 err_disable_cmdq:
 	return smmu_write_cr0(smmu, 0);
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
index cbcd8a75d562..674ce2b02a4b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -496,11 +496,107 @@ static bool kvm_arm_smmu_validate_features(struct arm_smmu_device *smmu)
 	return true;
 }
 
+static irqreturn_t kvm_arm_smmu_evt_handler(int irq, void *dev)
+{
+	int i;
+	struct arm_smmu_device *smmu = dev;
+	struct arm_smmu_queue *q = &smmu->evtq.q;
+	struct arm_smmu_ll_queue *llq = &q->llq;
+	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
+				      DEFAULT_RATELIMIT_BURST);
+	u64 evt[EVTQ_ENT_DWORDS];
+
+	do {
+		while (!queue_remove_raw(q, evt)) {
+			u8 id = FIELD_GET(EVTQ_0_ID, evt[0]);
+
+			if (!__ratelimit(&rs))
+				continue;
+
+			dev_info(smmu->dev, "event 0x%02x received:\n", id);
+			for (i = 0; i < ARRAY_SIZE(evt); ++i)
+				dev_info(smmu->dev, "\t0x%016llx\n",
+					 (unsigned long long)evt[i]);
+
+			cond_resched();
+		}
+
+		/*
+		 * Not much we can do on overflow, so scream and pretend we're
+		 * trying harder.
+		 */
+		if (queue_sync_prod_in(q) == -EOVERFLOW)
+			dev_err(smmu->dev, "EVTQ overflow detected -- events lost\n");
+	} while (!queue_empty(llq));
+
+	/* Sync our overflow flag, as we believe we're up to speed */
+	queue_sync_cons_ovf(q);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t kvm_arm_smmu_gerror_handler(int irq, void *dev)
+{
+	u32 gerror, gerrorn, active;
+	struct arm_smmu_device *smmu = dev;
+
+	gerror = readl_relaxed(smmu->base + ARM_SMMU_GERROR);
+	gerrorn = readl_relaxed(smmu->base + ARM_SMMU_GERRORN);
+
+	active = gerror ^ gerrorn;
+	if (!(active & GERROR_ERR_MASK))
+		return IRQ_NONE; /* No errors pending */
+
+	dev_warn(smmu->dev,
+		 "unexpected global error reported (0x%08x), this could be serious\n",
+		 active);
+
+	/* There is no API to reconfigure the device at the moment.*/
+	if (active & GERROR_SFM_ERR)
+		dev_err(smmu->dev, "device has entered Service Failure Mode!\n");
+
+	if (active & GERROR_MSI_GERROR_ABT_ERR)
+		dev_warn(smmu->dev, "GERROR MSI write aborted\n");
+
+	if (active & GERROR_MSI_PRIQ_ABT_ERR)
+		dev_warn(smmu->dev, "PRIQ MSI write aborted\n");
+
+	if (active & GERROR_MSI_EVTQ_ABT_ERR)
+		dev_warn(smmu->dev, "EVTQ MSI write aborted\n");
+
+	if (active & GERROR_MSI_CMDQ_ABT_ERR)
+		dev_warn(smmu->dev, "CMDQ MSI write aborted\n");
+
+	if (active & GERROR_PRIQ_ABT_ERR)
+		dev_err(smmu->dev, "PRIQ write aborted -- events may have been lost\n");
+
+	if (active & GERROR_EVTQ_ABT_ERR)
+		dev_err(smmu->dev, "EVTQ write aborted -- events may have been lost\n");
+
+	if (active & GERROR_CMDQ_ERR) {
+		dev_err(smmu->dev, "CMDQ ERR -- Hypervisor cmdq corrupted?\n");
+		BUG();
+	}
+
+	writel(gerror, smmu->base + ARM_SMMU_GERRORN);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t kvm_arm_smmu_pri_handler(int irq, void *dev)
+{
+	struct arm_smmu_device *smmu = dev;
+
+	dev_err(smmu->dev, "PRI not supported in KVM driver!\n");
+
+	return IRQ_HANDLED;
+}
+
 static int kvm_arm_smmu_device_reset(struct host_arm_smmu_device *host_smmu)
 {
 	int ret;
 	u32 reg;
 	struct arm_smmu_device *smmu = &host_smmu->smmu;
+	u32 irqen_flags = IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
 
 	reg = readl_relaxed(smmu->base + ARM_SMMU_CR0);
 	if (reg & CR0_SMMUEN)
@@ -522,6 +618,39 @@ static int kvm_arm_smmu_device_reset(struct host_arm_smmu_device *host_smmu)
 	/* Command queue */
 	writeq_relaxed(smmu->cmdq.q.q_base, smmu->base + ARM_SMMU_CMDQ_BASE);
 
+	/* Event queue */
+	writeq_relaxed(smmu->evtq.q.q_base, smmu->base + ARM_SMMU_EVTQ_BASE);
+	writel_relaxed(smmu->evtq.q.llq.prod, smmu->base + SZ_64K + ARM_SMMU_EVTQ_PROD);
+	writel_relaxed(smmu->evtq.q.llq.cons, smmu->base + SZ_64K + ARM_SMMU_EVTQ_CONS);
+
+	/* Disable IRQs first */
+	ret = arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
+				      ARM_SMMU_IRQ_CTRLACK);
+	if (ret) {
+		dev_err(smmu->dev, "failed to disable irqs\n");
+		return ret;
+	}
+
+	/*
+	 * We don't support combined irqs for now, no specific reason, they are uncommon
+	 * so we just try to avoid bloating the code.
+	 */
+	if (smmu->combined_irq)
+		dev_err(smmu->dev, "Combined irqs not supported by this driver\n");
+	else
+		arm_smmu_setup_unique_irqs(smmu, kvm_arm_smmu_evt_handler,
+					   kvm_arm_smmu_gerror_handler,
+					   kvm_arm_smmu_pri_handler);
+
+	if (smmu->features & ARM_SMMU_FEAT_PRI)
+		irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
+
+	/* Enable interrupt generation on the SMMU */
+	ret = arm_smmu_write_reg_sync(smmu, irqen_flags,
+				      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
+	if (ret)
+		dev_warn(smmu->dev, "failed to enable irqs\n");
+
 	return 0;
 }
 
@@ -565,6 +694,8 @@ static int kvm_arm_smmu_probe(struct platform_device *pdev)
 	if (IS_ERR(smmu->base))
 		return PTR_ERR(smmu->base);
 
+	arm_smmu_probe_irq(pdev, smmu);
+
 	ret = arm_smmu_device_hw_probe(smmu);
 	if (ret)
 		return ret;
@@ -583,6 +714,13 @@ static int kvm_arm_smmu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* evtq */
+	ret = arm_smmu_init_one_queue(smmu, &smmu->evtq.q, smmu->base + SZ_64K,
+				      ARM_SMMU_EVTQ_PROD, ARM_SMMU_EVTQ_CONS,
+				      EVTQ_ENT_DWORDS, "evtq");
+	if (ret)
+		return ret;
+
 	ret = arm_smmu_init_strtab(smmu);
 	if (ret)
 		return ret;
-- 
2.47.0.338.g60cca15819-goog


