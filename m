Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C49ACD6E61
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 21:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rcpp3JbrlJR2Sgfo7gqP6/7JvCiYyDzydlgBu8YMP0M=; b=VeWlm4cr3inL5usjjUChAY9e8v
	dNHWeYjT8L+RiywIhpFsL+qqtIVxfcT/66TjasBaJD7WAKRaHMXb1OPYli2+Mxqq/V+4ONg+/g7E3
	izh9z3sBiu63lzxi3/D3BXMw6AhZj6wrj1Z0UwHP7u9nIrkWgAHJhin9vNgcFZMXrjF5gQVkmVtU1
	eM0yyiiFlMvw+MtV2z1UmK2c+ngjN4r7DDa2T0PSxgauHdqmKRPnkzmci1FnditgFWeoqXklEsJ+G
	fjip80886eYy4mKgQb/LiNN7WuQRSTmnc3pLxMv3ZsfG0aKkOu/ggPPuA4gwTuWR/nUEGk1iYGz3n
	yfiOePpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAfO-0000000BtLb-2Fzj;
	Mon, 01 Jun 2026 21:59:26 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAfM-0000000BtHx-0QrM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 21:59:25 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-c85a2bf5388so966304a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 14:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780351163; x=1780955963; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rcpp3JbrlJR2Sgfo7gqP6/7JvCiYyDzydlgBu8YMP0M=;
        b=rcu3ZlKP3ytRkrdqBtVa6ipiQZVxJ06q/K88JlU+BwHN/DefGkIWmf0nC5z4CwfnAd
         7GRHKGXfIEiR7vjlVLSPHTgnd2JIr2hR+PJTUGtLnxQjagpLd3SUgOyqo1GKfpphjA/a
         ZK12Ea7THaVjkJDy3A+RLR0FIbDFUWh5y6i1/A5arknyFPbcsRE+cIxQdE3AHGJn0hkd
         Xf84WClMO+sa5q9Teh4iuIRUqdduYjv5H8oglUfORwWWGseA+gakFXxnjsywMT6SebQN
         ZkXuOqKgHduaFvjjRNCfQxIXEItOrEQHRSVQa0ebb5vg9NA3P3zqNO51FCsDnSF8xshQ
         muUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780351163; x=1780955963;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rcpp3JbrlJR2Sgfo7gqP6/7JvCiYyDzydlgBu8YMP0M=;
        b=ZflRHetHxdnctELv0gzgTQTnHIJif/G7afP0CkVnF5ROFi4GKqT5Z43ZV893DN90Oq
         ThJxZwYty/CJo8VIwFlZ8bW9kDWgorXzcCYuFhy85zajJHo51PfzAGyZy7ooNzZ/0ke9
         cMzbcNgoO4emZNihnXTS5WkYllVBfkZghWTBO1/3xT22HKPu+PrmtPDmBuvedX02cpJx
         O7n+FoVZrt0lnuAoPqDeEMCJjYa+tsD3pHF22m7/KMPRONM0jVBkEIrfIz5lTRtS/2wz
         0aK98EsZj6eLfi8+WGjBnulavasTqNlnOLGeNfkhmfwjGlWHZXS3TIYtGf0zhgWZ6HdZ
         jhiA==
X-Forwarded-Encrypted: i=1; AFNElJ+dtAo7KNqGPFyN5Rf5K+LvHCe++jcV23rCpsKk9IwR3JaqY9pfryvmTzmGQNBym7x19v44kgRM+IwCh9Vn8pLD@lists.infradead.org
X-Gm-Message-State: AOJu0YxigBgUUQVkcZY8757+o289oP7fLDkvVl/gu4NFQ6s79+pPURbc
	/94IgnW8/utZ93VUJa5YG9bYbarwX5GiadlUz4ZlF0Rny1a8DqsjSSN8KxgVe7pqasoYL8Smql7
	8cw==
X-Received: from pgar15.prod.google.com ([2002:a05:6a02:2e8f:b0:c85:b93a:f6e0])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d83:b0:3b4:71a9:cda5
 with SMTP id adf61e73a8af0-3b471a9d336mr3295111637.48.1780351162605; Mon, 01
 Jun 2026 14:59:22 -0700 (PDT)
Date: Mon,  1 Jun 2026 21:59:02 +0000
In-Reply-To: <20260601215909.3958732-1-praan@google.com>
Mime-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.1013.g208068f2d8-goog
Message-ID: <20260601215909.3958732-6-praan@google.com>
Subject: [PATCH v8 05/12] iommu/arm-smmu-v3: Cache and restore MSI config
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_145924_150687_A7EDD73C 
X-CRM114-Status: GOOD (  15.19  )
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
that MSIs work after the system resumes.

To address this, cache the original `msi_msg` within the `msi_desc`
when the configuration is first written by `arm_smmu_write_msi_msg`.
This primarily includes the target address and data since the memory
attributes are fixed.

Introduce a new helper `arm_smmu_resume_msis` which will later be called
during the driver's resume callback. The helper would retrieve the
cached MSI message for each relevant interrupt (evtq, gerr, priq) via
get_cached_msi_msg & re-config the registers via arm_smmu_write_msi_msg.

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 37 +++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 8682be5060ed..93cee32f6c99 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4551,6 +4551,9 @@ static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
 	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
 	phys_addr_t *cfg = arm_smmu_msi_cfg[desc->msi_index];
 
+	/* Cache the msi_msg for resume */
+	desc->msg = *msg;
+
 	doorbell = (((u64)msg->address_hi) << 32) | msg->address_lo;
 	doorbell &= MSI_CFG0_ADDR_MASK;
 
@@ -4559,6 +4562,40 @@ static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
 	writel_relaxed(ARM_SMMU_MEMATTR_DEVICE_nGnRE, smmu->base + cfg[2]);
 }
 
+static void arm_smmu_resume_msi(struct arm_smmu_device *smmu,
+				unsigned int irq, const char *name)
+{
+	struct msi_desc *desc;
+	struct msi_msg msg;
+
+	if (!irq)
+		return;
+
+	desc = irq_get_msi_desc(irq);
+	if (!desc) {
+		dev_err(smmu->dev, "Failed to resume msi: %s", name);
+		return;
+	}
+
+	get_cached_msi_msg(irq, &msg);
+	arm_smmu_write_msi_msg(desc, &msg);
+}
+
+static void arm_smmu_resume_msis(struct arm_smmu_device *smmu)
+{
+	if (!(smmu->features & ARM_SMMU_FEAT_MSI))
+		return;
+
+	if (!dev_get_msi_domain(smmu->dev))
+		return;
+
+	arm_smmu_resume_msi(smmu, smmu->gerr_irq, "gerror");
+	arm_smmu_resume_msi(smmu, smmu->evtq.q.irq, "evtq");
+
+	if (smmu->features & ARM_SMMU_FEAT_PRI)
+		arm_smmu_resume_msi(smmu, smmu->priq.q.irq, "priq");
+}
+
 static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 {
 	int ret, nvec = ARM_SMMU_MAX_MSIS;
-- 
2.54.0.1013.g208068f2d8-goog


