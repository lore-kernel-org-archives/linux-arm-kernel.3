Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0250C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uONWWaSJb8FTHdgaUf0CJlqohoMDMyLvCC6od1SxwCM=; b=BBtTby9PC477/Do2wp6olrwNbM
	3qdzq8DzEhiJwoqN/LHF+hExDMNxaUpruNFsfez0hVJaWbp+uRnVD6tZNwlL2bFnfptzhWM+0WHRF
	ZUlgZ2giulNfawUZ5tHZQ+7q6Hdz2XkRmrPYP7dP11U7L+kUAwdy93YUPzv9+IUBETQrLTgIP10Zl
	sK9pHXFJKglUf7dkRxYD9b8qCWG/7cJPDb5H3m3cwrDmTWw+WmzCIs2ojGA4KmsQj2tHEG2biP5pA
	Phz9JU9R6tq2K2SI6FYYHjVHoWpetNGhrUO7MaIcxV8ywkrRL/P2EtlHMdTjrw6WUYs2rRmARwzSf
	jMcrTvQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zSE-00000009mnv-1GOu;
	Tue, 08 Sep 2026 17:17:54 +0000
Received: from mail-pl1-x645.google.com ([2607:f8b0:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zS2-00000009mZs-2Fpe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:17:43 +0000
Received: by mail-pl1-x645.google.com with SMTP id d9443c01a7336-2d94a158dc8so79528415ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788887861; x=1789492661; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uONWWaSJb8FTHdgaUf0CJlqohoMDMyLvCC6od1SxwCM=;
        b=b5S8wuuyezsbhzqIIbwouHUHohkqTLlFQnbyIeAypF8M0fdAel1NCz3/Br14JYy1qY
         EHyDLyMvHHERaEhx2mno73JXMQoVXSVlqAxusYyWxxpeOX2w8OKH8TnJLcD4S/x0wrqR
         QpV385bQP47y7JAT9PtyB+929OR6bO8kRM9sqJHLbPK7F8LICh7GO19FCumjnEVtWWjv
         UKQHtF4k4VYVyLGggGrCjTHSigYX6YzL4KhCzPTxXYFLaXCcXl5xtEyLK3NEWFLNFsoP
         JMeArKBzLlfbXt4D4TkGD0J7kqohywsBgllz8cqNJ/oTtkmLFWU84A/0smRwSyJxThRP
         wa7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887861; x=1789492661;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uONWWaSJb8FTHdgaUf0CJlqohoMDMyLvCC6od1SxwCM=;
        b=M+lVW9e92F+L33kFFPnWFn/Ewfm714BMdIRjCaJvlVAeNPl7fFuGKV/QuvPnFG7pQo
         xCwUboRbnTdH7HSddLZE2eF9IV5QkSlKXWSJCBsUyVKZ0y82hEOdnPgS4goWAF0mF69Y
         2h39GEywMC7kDjBBsPT6U/YvTOkmDCLYEQZMI9WbQ7dMsEfBQlZ6fk5T5RjNXb7VyJSh
         AlliO88Oyz5B78E238wAUT+K5vIWpRsur+i8P0VEurNSOexpYSqb5JF4Sn8bcfsfGOGw
         yQUVITezMSD1hCj/0BYwklh3TGS8ocoKrgEYBHM/yQFyIrFCnulYhdjjOhEzbWUPCPiJ
         s42w==
X-Forwarded-Encrypted: i=1; AKwUvBwWnlCeTM5vrIYwp87nFIUpIyCyhfka+AH+Z2AQ5QF9KX+RIteflht3f+nG9zDUnzBhI9IJ9ZOb0L57u+lWjUCs@lists.infradead.org
X-Gm-Message-State: AFuF++mNgokYFF67wihaVEN1RqO3hm535Vhb2B1UIAjapQrVVNHurN25
	iNz24aYLnfjpVx4ZouZfj7lUqAzKFUi3eFNIoN3Mi9zixZ29kaLE5DJ/0hJMGy8eNCZ54OkRvid
	L3A==
X-Received: from pjbgg16.prod.google.com ([2002:a17:90b:a10:b0:39b:8e8b:e1f3])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2ccd:b0:398:9c00:29f0
 with SMTP id 98e67ed59e1d1-39b2628fc25mr48793062a91.24.1788887860460; Tue, 08
 Sep 2026 10:17:40 -0700 (PDT)
Date: Tue,  8 Sep 2026 17:17:07 +0000
In-Reply-To: <20260908171712.356645-1-praan@google.com>
Mime-Version: 1.0
References: <20260908171712.356645-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908171712.356645-12-praan@google.com>
Subject: [PATCH v10 11/15] iommu/tegra241-cmdqv: Add a helper to quiesce VCMDQs
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
X-CRM114-CacheID: sfid-20260908_101742_581716_B3810705 
X-CRM114-Status: GOOD (  24.67  )
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
the STOP_FLAG. The current driver implementation only uses VINTF0 for
vCMDQs owned by the kernel which need to be stopped. Add a helper that
sets the CMDQ_PROD_STOP_FLAG on these vCMDQs.

Consolidate this logic by renaming the implementation hook to
quiesce_and_drain_queues and ensuring that the tegra241-cmdqv driver
gates all active local virtual queues before starting the drain loop.
Additionally, clear the STOP_FLAG in tegra241_vcmdq_hw_init() as a part
of tegra241_cmdqv_hw_reset().

Suggested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  4 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  2 +-
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 77 ++++++++++++++++++-
 3 files changed, 76 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 65939a9b0619..7eb939888735 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1077,8 +1077,8 @@ static int __maybe_unused arm_smmu_drain_cmdqs(struct arm_smmu_device *smmu)
 	ret = arm_smmu_drain_queue(smmu, &smmu->cmdq.q, true);
 
 	/* Drain all implementation-specific queues */
-	if (smmu->impl_ops && smmu->impl_ops->drain_queues) {
-		err = smmu->impl_ops->drain_queues(smmu);
+	if (smmu->impl_ops && smmu->impl_ops->quiesce_and_drain_queues) {
+		err = smmu->impl_ops->quiesce_and_drain_queues(smmu);
 		if (err)
 			ret = err;
 	}
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 794b258550dd..0a841441cc44 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -896,7 +896,7 @@ struct arm_smmu_impl_ops {
 	size_t (*get_viommu_size)(enum iommu_viommu_type viommu_type);
 	int (*vsmmu_init)(struct arm_vsmmu *vsmmu,
 			  const struct iommu_user_data *user_data);
-	int (*drain_queues)(struct arm_smmu_device *smmu);
+	int (*quiesce_and_drain_queues)(struct arm_smmu_device *smmu);
 };
 
 /* An SMMUv3 instance */
diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index c7989fcd2c62..61847f2802a3 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -447,6 +447,54 @@ tegra241_cmdqv_get_cmdq(struct arm_smmu_device *smmu,
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
+}
+
+static void tegra241_vcmdq_wait_quiescent(struct arm_smmu_device *smmu,
+					 struct tegra241_vcmdq *vcmdq)
+{
+	u32 target = READ_ONCE(vcmdq->cmdq.q.llq.prod) & CMDQ_PROD_IDX_MASK;
+	int timeout = ARM_SMMU_POLL_TIMEOUT_US;
+
+	/* Wait for the last committed owner to reach the hardware */
+	while (atomic_read(&vcmdq->cmdq.owner_prod) != target && timeout) {
+		udelay(1);
+		timeout--;
+	}
+
+	if (!timeout)
+		dev_err(smmu->dev, "vintf0 lvcmdq%u owner wait timeout\n",
+			vcmdq->lidx);
+
+	/* Wait for queue lock to be released */
+	timeout = ARM_SMMU_POLL_TIMEOUT_US;
+	while (atomic_read(&vcmdq->cmdq.lock) != 0 && timeout) {
+		udelay(1);
+		timeout--;
+	}
+
+	if (!timeout)
+		dev_err(smmu->dev, "vintf0 lvcmdq%u lock wait timeout\n",
+			vcmdq->lidx);
+}
+
 static int tegra241_cmdqv_drain_vintf0_lvcmdqs(struct arm_smmu_device *smmu)
 {
 	struct tegra241_cmdqv *cmdqv =
@@ -467,6 +515,21 @@ static int tegra241_cmdqv_drain_vintf0_lvcmdqs(struct arm_smmu_device *smmu)
 	if (!READ_ONCE(vintf->enabled))
 		return 0;
 
+	/*
+	 * Gate all vCMDQs by setting the STOP_FLAG in a separate,
+	 * initial loop to ensure no new commands can be submitted
+	 * to any secondary queue while we are waiting to drain them.
+	 *
+	 * Client devices are suspended at this point due to devlinks,
+	 * ensuring no concurrent command submissions race with this
+	 * drain sequence.
+	 */
+	tegra241_cmdqv_quiesce_vintf0_lvcmdqs(smmu);
+
+	/* Ensure all CPUs observe the STOP_FLAG before draining */
+	smp_mb();
+
+	/* Now that all queues are safely gated, drain them sequentially. */
 	for (lidx = 0; lidx < cmdqv->num_lvcmdqs_per_vintf; lidx++) {
 		struct tegra241_vcmdq *vcmdq = vintf->lvcmdqs[lidx];
 		int rc;
@@ -474,6 +537,9 @@ static int tegra241_cmdqv_drain_vintf0_lvcmdqs(struct arm_smmu_device *smmu)
 		if (!vcmdq || !READ_ONCE(vcmdq->enabled))
 			continue;
 
+		/* Wait for the last committed owner to reach the hardware */
+		tegra241_vcmdq_wait_quiescent(smmu, vcmdq);
+
 		rc = arm_smmu_drain_queue(smmu, &vcmdq->cmdq.q, true);
 		if (rc) {
 			/*
@@ -489,7 +555,7 @@ static int tegra241_cmdqv_drain_vintf0_lvcmdqs(struct arm_smmu_device *smmu)
 		}
 
 		/* Avoid consuming stale commands on resume */
-		vcmdq->cmdq.q.llq.cons = vcmdq->cmdq.q.llq.prod;
+		vcmdq->cmdq.q.llq.cons = vcmdq->cmdq.q.llq.prod & CMDQ_PROD_IDX_MASK;
 	}
 
 	return ret;
@@ -566,7 +632,6 @@ static int tegra241_vcmdq_hw_init(struct tegra241_vcmdq *vcmdq)
 
 	/* Configure and enable VCMDQ */
 	writeq_relaxed(vcmdq->cmdq.q.q_base, REG_VCMDQ_PAGE1(vcmdq, BASE));
-
 	/*
 	 * HW Registers reset to 0 when power-cycled. Restore them from their
 	 * SW copies to prevent executing stale/ghost commands after resume.
@@ -574,7 +639,8 @@ static int tegra241_vcmdq_hw_init(struct tegra241_vcmdq *vcmdq)
 	 * to the Guests since the relevant frameworks (IOMMUFD / VFIO) hold
 	 * active PM references preventing suspend while VMs are active.
 	 */
-	writel_relaxed(vcmdq->cmdq.q.llq.prod, REG_VCMDQ_PAGE0(vcmdq, PROD));
+	writel_relaxed(vcmdq->cmdq.q.llq.prod & CMDQ_PROD_IDX_MASK,
+		       REG_VCMDQ_PAGE0(vcmdq, PROD));
 	writel_relaxed(vcmdq->cmdq.q.llq.cons, REG_VCMDQ_PAGE0(vcmdq, CONS));
 
 	ret = vcmdq_write_config(vcmdq, VCMDQ_EN);
@@ -587,6 +653,9 @@ static int tegra241_vcmdq_hw_init(struct tegra241_vcmdq *vcmdq)
 		return ret;
 	}
 
+	/* Clear the CMDQ_PROD_STOP_FLAG */
+	atomic_andnot(CMDQ_PROD_STOP_FLAG, &vcmdq->cmdq.q.llq.atomic.prod);
+
 	dev_dbg(vcmdq->cmdqv->dev, "%sinited\n", h);
 	return 0;
 }
@@ -963,7 +1032,7 @@ static struct arm_smmu_impl_ops tegra241_cmdqv_impl_ops = {
 	.device_reset = tegra241_cmdqv_hw_reset,
 	.device_disable = tegra241_cmdqv_hw_disable,
 	.device_remove = tegra241_cmdqv_remove,
-	.drain_queues = tegra241_cmdqv_drain_vintf0_lvcmdqs,
+	.quiesce_and_drain_queues = tegra241_cmdqv_drain_vintf0_lvcmdqs,
 	/* For user-space use */
 	.hw_info = tegra241_cmdqv_hw_info,
 	.get_viommu_size = tegra241_cmdqv_get_vintf_size,
-- 
2.55.0.979.g7e5102b832-goog


