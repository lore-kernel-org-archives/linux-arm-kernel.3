Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC244CD6E65
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 21:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwoPBlNloT+7eWpBXhnL6MtBCTp1+ESlF9RR1+VuIgk=; b=3yznSNfrL2e/8fwKYxfD5jz0/4
	3zXcuM85k9qQggAMZYHRo/hSXfoYafIJ1YZqTkXV0fyGsWXS8UvbjxtxUPdFTjOHNC/A+FBKNxAth
	xVxwIxcUYa3u4cPySA9JVKx5mFgiJadwVj/qcCKd7nCu7AIC8Ba9IFp7eOIhjLzfKIXrPRnGk2Yrp
	/D6sHqW4E282gW7Br5zuv8O5SBA16bF2NCEq9VsNqA9eJ04W58IXEhT/EHtTg1EgNOTckrRX/8bXh
	goMVP5qGeJZnIxFZ2jbFtaqeatlv0odDum/Qyx0YHBd6er7khFglFiYyD2Ks7Jv9h7Ei6XK13KMia
	qKg8qHRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAfT-0000000BtR3-3x6X;
	Mon, 01 Jun 2026 21:59:31 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAfR-0000000BtOG-3sAb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 21:59:31 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-36d97955899so1668434a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 14:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780351169; x=1780955969; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VwoPBlNloT+7eWpBXhnL6MtBCTp1+ESlF9RR1+VuIgk=;
        b=E82bOIDEh7QlK+gqzgejN0pxYbuDWGnJ+KsporCr9iavbEeUTK74nh4vYECNl+n/ke
         kRqewBx5nGYngkspaQ25GYt0DIt8t8LZWP3NpEARlE+radOasjNanHQDHka7govqUCqP
         JpSf2LA9WreS+hSRTD+Eo5uoJj8znLP0i9HpEUfE/KwHcbA9Igswgn+O5n17G8OySgYp
         1Rgv1VpZHgcRl3VtsvR0jC/NziW+V6z0tPnnB3Z7Y9yQA6WkAMK1BPuq4DQCvlzEyJuW
         Z3fIKWFgyRp6RhOleT1BCn8Ruv1A5hf/pNTMj3GgWiiHgvg2Bn6rYIT05R7nZcofmLnI
         PtxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780351169; x=1780955969;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VwoPBlNloT+7eWpBXhnL6MtBCTp1+ESlF9RR1+VuIgk=;
        b=bl5qiwyqtNBVHu4xof0p/af87lwUOYrYOgSRZferMDnx67jUZO8e8ZRd51/wkm+XFr
         UKyRiDdS4wz8mEcEDffD9Lrc71ltxPJ3QgmsqrtRUuL+hArogHQe9usen3nQUhv2JZsN
         2elJ+bq14iX90j0zQfYDWBwxW2ewgRcRLeHAPCbGFGskwV7eVSfE4Xxfnr7uqfKEYMJp
         XymcB/+kgCDsDRhC/bg3CGrHe9UJeFzRGI04Wn/CbwSKPvOge67nNRipiQfhu28Ohpcu
         VMcQMGDRdJ4WLQb3H9vNtpsCTu7aN3P31bl3BY8FkLlmNp3tArJxqjxP+I0EcJG3jNAK
         51EA==
X-Forwarded-Encrypted: i=1; AFNElJ86auHEhIae/oQ+mo64nCyS3kESiryUyQgtZ3ZOy4ggCh4D7w2hIoRqbcy12L/X/wrzOmo3nM/Pq2wuM00+9CqE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9gPnUx1bWPfgOEmxT0JUts25qL1Tltk+aB0Fy1lm91uAaruU9
	VFcKktZdyOu9pfaAoD3wy7A8tCd9dO7TjT34awmcEWL9Wx41/jHzkgelGQcGyM0UpMflGJ/8w4W
	m1A==
X-Received: from pjbot1.prod.google.com ([2002:a17:90b:3b41:b0:36b:b668:1956])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3dc8:b0:36d:cf58:b79
 with SMTP id 98e67ed59e1d1-36dcf580f7fmr2656997a91.19.1780351168717; Mon, 01
 Jun 2026 14:59:28 -0700 (PDT)
Date: Mon,  1 Jun 2026 21:59:05 +0000
In-Reply-To: <20260601215909.3958732-1-praan@google.com>
Mime-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.1013.g208068f2d8-goog
Message-ID: <20260601215909.3958732-9-praan@google.com>
Subject: [PATCH v8 08/12] iommu/tegra241-cmdqv: Add a helper to quiesce VCMDQs
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_145929_968008_C16AE9F4 
X-CRM114-Status: GOOD (  19.14  )
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

The tegra241-cmdqv driver supports vCMDQs which need to be quiesced using
the STOP_FLAG as well. The current driver implementation only uses VINTF0
for vCMDQs owned by the kernel which need to be stopped. Add a helper
that sets the CMDQ_PROD_STOP_FLAG on the vCMDQs as well.

Consolidate this logic by renaming the implementation hook to
quiesce_and_drain_queues and ensuring that the tegra241-cmdqv driver
gates all active local virtual queues before starting the drain loop.
Additionally, clear the STOP_FLAG in tegra241_vcmdq_hw_init() as a part
of tegra241_cmdqv_hw_reset.

Suggested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  4 +--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  2 +-
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 32 +++++++++++++++++--
 3 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index c4315bdde7d5..d31e50b64b50 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -937,8 +937,8 @@ static int arm_smmu_drain_queues(struct arm_smmu_device *smmu)
 		goto out;
 
 	/* Drain all implementation-specific queues */
-	if (smmu->impl_ops && smmu->impl_ops->drain_queues)
-		ret = smmu->impl_ops->drain_queues(smmu);
+	if (smmu->impl_ops && smmu->impl_ops->quiesce_and_drain_queues)
+		ret = smmu->impl_ops->quiesce_and_drain_queues(smmu);
 out:
 	return ret;
 }
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index a3c8417c87d8..719e499c72ce 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -887,7 +887,7 @@ struct arm_smmu_impl_ops {
 	size_t (*get_viommu_size)(enum iommu_viommu_type viommu_type);
 	int (*vsmmu_init)(struct arm_vsmmu *vsmmu,
 			  const struct iommu_user_data *user_data);
-	int (*drain_queues)(struct arm_smmu_device *smmu);
+	int (*quiesce_and_drain_queues)(struct arm_smmu_device *smmu);
 };
 
 /* An SMMUv3 instance */
diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index 866cae7b73e5..536aeeb63202 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -414,6 +414,28 @@ tegra241_cmdqv_get_cmdq(struct arm_smmu_device *smmu,
 	return &vcmdq->cmdq;
 }
 
+static void tegra241_cmdqv_quiesce_vintf0_lvcmdqs(struct arm_smmu_device *smmu)
+{
+	struct tegra241_cmdqv *cmdqv =
+		container_of(smmu, struct tegra241_cmdqv, smmu);
+	struct tegra241_vintf *vintf = cmdqv->vintfs[0];
+	u16 lidx;
+
+	if (!READ_ONCE(vintf->enabled))
+		return;
+
+	for (lidx = 0; lidx < cmdqv->num_lvcmdqs_per_vintf; lidx++) {
+		struct tegra241_vcmdq *vcmdq = vintf->lvcmdqs[lidx];
+
+		if (!vcmdq || !READ_ONCE(vcmdq->enabled))
+			continue;
+
+		atomic_or(CMDQ_PROD_STOP_FLAG, &vcmdq->cmdq.q.llq.atomic.prod);
+	}
+
+	return;
+}
+
 static int tegra241_cmdqv_drain_vintf0_lvcmdqs(struct arm_smmu_device *smmu)
 {
 	struct tegra241_cmdqv *cmdqv =
@@ -426,6 +448,8 @@ static int tegra241_cmdqv_drain_vintf0_lvcmdqs(struct arm_smmu_device *smmu)
 	if (!READ_ONCE(vintf->enabled))
 		return 0;
 
+	tegra241_cmdqv_quiesce_vintf0_lvcmdqs(smmu);
+
 	for (lidx = 0; lidx < cmdqv->num_lvcmdqs_per_vintf; lidx++) {
 		struct tegra241_vcmdq *vcmdq = vintf->lvcmdqs[lidx];
 
@@ -511,9 +535,13 @@ static int tegra241_vcmdq_hw_init(struct tegra241_vcmdq *vcmdq)
 
 	/* Configure and enable VCMDQ */
 	writeq_relaxed(vcmdq->cmdq.q.q_base, REG_VCMDQ_PAGE1(vcmdq, BASE));
-	writel_relaxed(vcmdq->cmdq.q.llq.prod, REG_VCMDQ_PAGE0(vcmdq, PROD));
+	writel_relaxed(vcmdq->cmdq.q.llq.prod & CMDQ_PROD_IDX_MASK,
+		       REG_VCMDQ_PAGE0(vcmdq, PROD));
 	writel_relaxed(vcmdq->cmdq.q.llq.cons, REG_VCMDQ_PAGE0(vcmdq, CONS));
 
+	/* Clear the CMDQ_PROD_STOP_FLAG */
+	atomic_andnot(CMDQ_PROD_STOP_FLAG, &vcmdq->cmdq.q.llq.atomic.prod);
+
 	ret = vcmdq_write_config(vcmdq, VCMDQ_EN);
 	if (ret) {
 		dev_err(vcmdq->cmdqv->dev,
@@ -873,7 +901,7 @@ static struct arm_smmu_impl_ops tegra241_cmdqv_impl_ops = {
 	.get_secondary_cmdq = tegra241_cmdqv_get_cmdq,
 	.device_reset = tegra241_cmdqv_hw_reset,
 	.device_remove = tegra241_cmdqv_remove,
-	.drain_queues = tegra241_cmdqv_drain_vintf0_lvcmdqs,
+	.quiesce_and_drain_queues = tegra241_cmdqv_drain_vintf0_lvcmdqs,
 	/* For user-space use */
 	.hw_info = tegra241_cmdqv_hw_info,
 	.get_viommu_size = tegra241_cmdqv_get_vintf_size,
-- 
2.54.0.1013.g208068f2d8-goog


