Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1DACA5FAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 03:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1UoDLaUSVrQDcp8js+xQqVPvK9lSKlk7fepU02SFQA=; b=xtDIgQU9aGSv9XI6l/2TJagjdg
	Gxg0ctgwLj9D1obmx7RHy2o1FDDxBcmQC7L3N2FBuNTqGhSY/hqIYKjpVH2nqjmwiit5DUhu40rm/
	bilr9sLfWgIm2hjvKgu43ENFymil//ttj//WmWEQcA7D/xcBnqZ73ZZuEhcnFxyFSEJYqQKXpdian
	vKiyVGa/T5q1Ck+4pDdfxU+F9Fv8YUBNo+8TXgCsHzdkpNjRpFS3FuF+CgKyJQGpTBHAc0nQl+wrc
	aoiNbk7791s+i2RMV087YfDaw7XtsRKp3Y7eYEjnuMo9cC6C+LQ96BmEq0wGk85/dxVyG1kAa0/nO
	3ou7SaDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOnt-00000002Gw9-0CFw;
	Tue, 29 Sep 2026 03:46:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOmy-00000002GQo-2oE6
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 03:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Q1UoDLaUSVrQDcp8js+xQqVPvK9lSKlk7fepU02SFQA=; b=rOO8Bri1AGZmkT/mrgYCmAtxVt
	w5lavTjD02taBMeH/eYKbFSjALBce8kPCekFDqnEXxg/nPOL4SaPn0NqfNjlDyPutRUT6SpdZb3fK
	2tY+dybbntQ9NjFz3pKuc51Kyx1rfLhxS1tj7Zdd5HjnSUk48Xp1MMHPnByfCQ6oT3aPgoPnxnl5f
	hF2We0cB6HHr6M9GVhCB1/k9CT3fpBrhtKEFFoJ6jzFFPWyitYc1ziyd0+BMzJVr6JjnN8AI0er8O
	6K3tIVm5Ve+z1AKmhqfJKtu7GoK1YpeQCSLxzRDITtJo3/uzEHjCPRIk3v95tDqu1GQpl+SQGBT95
	Nh/uJaqQ==;
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBOmt-000000029R8-2xUt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 03:45:54 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso4175693a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 20:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790653549; x=1791258349; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q1UoDLaUSVrQDcp8js+xQqVPvK9lSKlk7fepU02SFQA=;
        b=FxRSkjH8p6wU9aX6opK+FGnZCqvE76sLt5isrRYSIrFJ6HnODEF0dZvFlDLSmnDnDk
         yGtU7OqUd1ZQRfzyVDUlUDBLoMtC4pyk2kNhHLo//GuMML8hj2VzAmN2P/ZsgO3FZJjC
         gKAjJ0qkugzrZF1N3Ggahe7Z6t7yS4jZcK2Sk3EN+P4aV2uLQO/IL5IEqNP7m84swQr+
         duHVm7rvq/8KzUMfhKqreEeOjMlUJII5XrjR8WKlkiUYcNYwcd9gaFdZjs9HZXggsQ39
         4L/BQM0eHyvR4OvWOatXBGA/MuoF9tqC59UWBLuC+tIujlTMQ4iOY3vkZYqHt0F3w4yn
         ayQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653549; x=1791258349;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q1UoDLaUSVrQDcp8js+xQqVPvK9lSKlk7fepU02SFQA=;
        b=aypMHSETjuJXTe2KHGCU9Th9/cVzYPijdLZ+nsRMYmN0JMe8Ox6RTqTB0Lj0UJ1ovM
         WXbUEESe4Ivt2w+sjj0Rtw61xIjFov7cRfxi6qjDp0vogpXrq7DXnjcyUS2otyxg9BU5
         gOWeYHBeh5sc7+ZGzAQTzxhZgvedmvBDlpcLWD43OuKlkxEfD+ORXuaifoO2bFOxdQoH
         JnZbGxt1TUG4MdS+t3Vdo5+AldjIDZYWtWrZrTBn4RNFaBuBqOWbfmd3BDUdDWlxJ1eg
         lKtJ0yRApSJhRtIg7F3sK7z1t3P8i8QN5G6JuDKjvYVrvs4XeaCznYpZhAAc5vqwvzrH
         Rzzg==
X-Forwarded-Encrypted: i=1; AKwUvBx7on4Z/N+jWL66SVg5KEmDYk7FMV+0mX0RNLI4tN3llRxBvjTuTvK/z4BQDVD9DWo5ucVEnHBkFDGIqACyZzMH@lists.infradead.org
X-Gm-Message-State: AFuF++k4NDGkpPy7q4jO0W6jorSYDGlIhrLcttHrG+0CtIrWDDXvbxDZ
	yL5C/G7xU2ZoqoXixC9HwQUKamn7ZsNStqo3F75LjZyiGN4zFOaFhUC+o8o3xQlYn/325FQ4iHj
	7cg==
X-Received: from pgww22.prod.google.com ([2002:a05:6a02:2c96:b0:cc7:ade4:5f77])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:c90a:b0:3dd:85a9:55a9
 with SMTP id adf61e73a8af0-3de26db3254mr10142499637.34.1790653549063; Mon, 28
 Sep 2026 20:45:49 -0700 (PDT)
Date: Tue, 29 Sep 2026 03:45:06 +0000
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
Mime-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929034510.2023173-13-praan@google.com>
Subject: [PATCH v11 12/16] iommu/tegra241-cmdqv: Add a helper to quiesce VCMDQs
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
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_044552_959188_43636144 
X-CRM114-Status: GOOD (  26.41  )
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
index 7f89e2306942..89a4e756ff17 100644
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
2.56.0.rc1.315.gc6ed9934b7-goog


