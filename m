Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC2ECA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 04:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PTYxgSgI1gU4YVXt5Wl8EAQGb2RKGpOz4eoAl0qe8o=; b=nVsSL4S7DOA/is4oCCJyZSxSzv
	iOoEKD5+m56pMVWrrD5d34/Cmur8+1m6aijFaRf0VZjDVpO0bsNZO8WBQFGn9lxKlT1LGTpx7CPFW
	/ldAD02wAmKPV2T2m6IpAnXCA+YHhbFDwlTdZzmQ/5hdbPqEjroUBDurR+3dMrDT41Nhh6cZxQryc
	KF1tX8gDLIz1GNOjunFdJayjYMQ1513JpNzqOfDaSpHU4Ofw+u6V/HSXEetWn0Oe4fV+hKi4Bb4tR
	QshYTMVEuSfGswUR5o1IQmsfrUPM5F+nmb35wlk3230D/Pwwjc507jhNPTVgM3w7brJn/Sr5yDto7
	EKCGILKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOmt-00000002GJr-0iEY;
	Tue, 29 Sep 2026 03:45:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOmp-00000002GHb-3ejW
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 03:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9PTYxgSgI1gU4YVXt5Wl8EAQGb2RKGpOz4eoAl0qe8o=; b=OYP/8MAvr9tZzhuyX/SRsCjw97
	qL8IBGmZaLpc04zRylEXeXp5Nca2j5Z9h4+PdECgN+b8kWGNK6fEzaMzDeaK5cBCgV3nk73DmI7WQ
	UMjgbWBNgP0wt4vFdj9DP2I7u/uEs+SyqNgjFO3HsUWXMBvlHe7psV+hY+SFCgg+gT24VPOIwQ0Ko
	83vjju41ciK+bc9CD2gUJUFE+eFDtuVdydm/dlnLJTZC7KxhoKCVPQj4IwpfyNsP6exgvoxD22wJK
	2aSLGmd5Ip1uMTaScwggzGlkcH9LqgEvBSvJSsqbRw7iHMkf0gU3mN/F+Wa/pGaKSq2Yo6joMUzkK
	S36P/xjw==;
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBOmg-000000029OD-0Xxj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 03:45:44 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-cc79125e4b8so1887982a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 20:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790653524; x=1791258324; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9PTYxgSgI1gU4YVXt5Wl8EAQGb2RKGpOz4eoAl0qe8o=;
        b=wPBN9ZOGEPq1LqLYNSrgnw56rbmojp05lq70vpb+0g4ZMhwvWV9epDozC2QIQyZUUg
         FcbnnkIzGR45graGvHVASX+Ib9pnKd+8o8yJwC7IgKMPgL1LshLIoTwueGDB6wUdv75o
         mnqdru0ViRXYNnFec2X3dsoI9HaBol7PB+nNAWJ/Er52zQ18j/EsMO1H6ZF2iep6Lkru
         7HA7dTDVH3I2So/5lVSPfK+IhgdpmlGRgB5nNqywoD92A7O3UCpoqqNyTUkrJhbneZBS
         0rQ0rrF2YuAse+C5NRD5t0U7zWMRD1QlsWCkgwv3vv2Zoyxn/0RgdwMGMYpLoZhTvQFs
         DevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653524; x=1791258324;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PTYxgSgI1gU4YVXt5Wl8EAQGb2RKGpOz4eoAl0qe8o=;
        b=nPLDE73TkEntf15oPQ5/SYMFzupBnBS3RjKAfKdv/hHP4HIWdt9HEt7ojAdMTDZ7Dx
         0jUVBmEc3XOsIEQlgmPheblENFTUbHxgxJS89F20ILTWngI4OwH4rHLJSIwiYFLD0faX
         XCKplwjjuQJ/y6JkHaQ9dnw2yFy7MV6Wqe+NTJ4jil3pEIYLKMz5YQtFc5r5pXITs1wZ
         w9A6bBVwCoTupJ8yzOiTBSwDTHXBwREVAKLHzzTH8IWbNwpSH8fl0RL+Z25z18mDrBS+
         fIQxPH/VHeKmZc696kZOVoQO0INfbTngJ8evKm2xJ8Vr3mfMXQ540UIMwzKsUsOrcmCT
         284A==
X-Forwarded-Encrypted: i=1; AKwUvBxeA5GcuMi59sv6Chew6ZZpR/updMkvp82ZOGsXrknF83jzvYJgWYZxgffMpGiDivjdPT9o/PqRS7XuhXACsCWc@lists.infradead.org
X-Gm-Message-State: AFuF++khpg9OZOM+Ep5Q3FfGcBM3l86Um0+y3Idolpwjbjs5CSq1sE32
	Qcfvdpacg0K/6oY1je1zW6pkNw9GqVlYXKNZwpeoiVl3b+YgNEZ0fhWEKnSSpKfBNQnZhFSXF+D
	ftA==
X-Received: from pgce14.prod.google.com ([2002:a05:6a02:1ce:b0:cc7:9e98:e366])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:4ea6:b0:3dd:85aa:452a
 with SMTP id adf61e73a8af0-3de0e8d32b0mr14950680637.37.1790653524254; Mon, 28
 Sep 2026 20:45:24 -0700 (PDT)
Date: Tue, 29 Sep 2026 03:44:58 +0000
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
Mime-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929034510.2023173-5-praan@google.com>
Subject: [PATCH v11 04/16] iommu/tegra241-cmdqv: Add a helper to drain VCMDQs
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
X-CRM114-CacheID: sfid-20260929_044541_981192_0ED299C5 
X-CRM114-Status: GOOD (  23.19  )
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

The tegra241-cmdqv driver supports vCMDQs which need to be drained
before suspending the SMMU. The current driver implementation only uses
VINTF0 for vCMDQs owned by the kernel which need to be drained. Add a
helper that drains all the enabled vCMDQs under VINTF0.

Add a drain_queues function ptr to arm_smmu_impl_ops to drain
implementation specified queues, and export arm_smmu_drain_queue().

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  5 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  4 ++
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 49 +++++++++++++++++++
 3 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 84b56849f6dc..d809b625f7fb 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -976,9 +976,8 @@ static int arm_smmu_cmdq_batch_submit(struct arm_smmu_device *smmu,
  * Context: Process context; may sleep.
  * Return: 0 on success or a negative errno on timeout.
  */
-static int __maybe_unused arm_smmu_drain_queue(struct arm_smmu_device *smmu,
-					       struct arm_smmu_queue *q,
-					       bool until_empty)
+int arm_smmu_drain_queue(struct arm_smmu_device *smmu,
+			 struct arm_smmu_queue *q, bool until_empty)
 {
 	ktime_t timeout = ktime_add_us(ktime_get(), ARM_SMMU_POLL_TIMEOUT_US);
 	u32 cons, prod, prev, undrained;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 84e618a7fa9e..deefb17e31eb 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -891,6 +891,7 @@ struct arm_smmu_impl_ops {
 	size_t (*get_viommu_size)(enum iommu_viommu_type viommu_type);
 	int (*vsmmu_init)(struct arm_vsmmu *vsmmu,
 			  const struct iommu_user_data *user_data);
+	int (*drain_queues)(struct arm_smmu_device *smmu);
 };
 
 /* An SMMUv3 instance */
@@ -1174,6 +1175,9 @@ int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
 int arm_smmu_cmdq_init(struct arm_smmu_device *smmu,
 		       struct arm_smmu_cmdq *cmdq);
 
+int arm_smmu_drain_queue(struct arm_smmu_device *smmu,
+			 struct arm_smmu_queue *q, bool until_empty);
+
 static inline bool arm_smmu_master_canwbs(struct arm_smmu_master *master)
 {
 	return dev_iommu_fwspec_get(master->dev)->flags &
diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index 6644075c1431..a394bf0f487f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -447,6 +447,54 @@ tegra241_cmdqv_get_cmdq(struct arm_smmu_device *smmu,
 	return &vcmdq->cmdq;
 }
 
+static int tegra241_cmdqv_drain_vintf0_lvcmdqs(struct arm_smmu_device *smmu)
+{
+	struct tegra241_cmdqv *cmdqv =
+		container_of(smmu, struct tegra241_cmdqv, smmu);
+	struct tegra241_vintf *vintf = cmdqv->vintfs[0];
+	int ret = 0;
+	u16 lidx;
+
+	/*
+	 * Kernel only uses VINTF0. Return if it's disabled.
+	 * Note: Lockless reads of the enabled flags are safe here.
+	 * VINTF0 is initialized during probe() (before Runtime PM is
+	 * enabled) and de-initialized during remove() (after the driver
+	 * core has called pm_runtime_disable()). Thus, this drain helper,
+	 * running only in runtime_suspend(), cannot race against VINTF0
+	 * creation or destruction.
+	 */
+	if (!READ_ONCE(vintf->enabled))
+		return 0;
+
+	for (lidx = 0; lidx < cmdqv->num_lvcmdqs_per_vintf; lidx++) {
+		struct tegra241_vcmdq *vcmdq = vintf->lvcmdqs[lidx];
+		int rc;
+
+		if (!vcmdq || !READ_ONCE(vcmdq->enabled))
+			continue;
+
+		rc = arm_smmu_drain_queue(smmu, &vcmdq->cmdq.q, true);
+		if (rc) {
+			/*
+			 * The PM core forces suspend even if a drain times out.
+			 * We must record the error but continue draining the
+			 * remaining queues to ensure no in-flight commands are
+			 * abandoned when the hardware power is cut.
+			 */
+			dev_warn_ratelimited(smmu->dev,
+					     "vintf0 lvcmdq%u drain timed out\n",
+					     lidx);
+			ret = rc;
+		}
+
+		/* Avoid consuming stale commands on resume */
+		vcmdq->cmdq.q.llq.cons = vcmdq->cmdq.q.llq.prod;
+	}
+
+	return ret;
+}
+
 /* HW Reset Functions */
 
 /*
@@ -905,6 +953,7 @@ static struct arm_smmu_impl_ops tegra241_cmdqv_impl_ops = {
 	.device_reset = tegra241_cmdqv_hw_reset,
 	.device_disable = tegra241_cmdqv_hw_disable,
 	.device_remove = tegra241_cmdqv_remove,
+	.drain_queues = tegra241_cmdqv_drain_vintf0_lvcmdqs,
 	/* For user-space use */
 	.hw_info = tegra241_cmdqv_hw_info,
 	.get_viommu_size = tegra241_cmdqv_get_vintf_size,
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


