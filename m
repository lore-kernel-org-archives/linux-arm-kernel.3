Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5321C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 21:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxItAIafgzEWpgvlD1boJ4CXcti6VEwEZqB89OI68jc=; b=UYcTWTP13aqeUUViKMjuGgLsFK
	psQeKvA/APepY151t6aXGAZcWEY5ihZR+o/YXqNtGeKek3C4ZWjxZULO7Plii1p/woahpisyS9y+f
	hhuCEu7s2IZOd+5B4Al+vIpAqK7SEglQf3x6ntPTGpRalxn/YAcAne6xZWHLTJxVG0qFNOEaPQJrJ
	6l5VH2KVVj1LIWDR2EKYJhHFzHeSs5iqgz6xLC1uJ0ZwsAGZBTuXsgcA05cD6RlrqPY8BevjfA339
	U6HyP5Au0m/X4696Cl8JrSvqo5WkohYosLUHTHLGt/eLAf8DvFVTjDSEzxrvb/MKuh1oGr3EYtuzI
	xx/TJRzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop3m-00000006GZY-3znI;
	Tue, 28 Jul 2026 21:09:58 +0000
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop3i-00000006GVe-1uKk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 21:09:55 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cb6dd278512so113330a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785272994; x=1785877794; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxItAIafgzEWpgvlD1boJ4CXcti6VEwEZqB89OI68jc=;
        b=ttzu/CLzDheSGZbnUWMjGE5uw0f5hEmO76I2KQ7VkxaAi5qS9PPFs7EA9hQXR+A4TT
         KoCD5TBl0yY9Wwv6UwuZ/mk1Ajp88HN7f+xFa+trjUYKhom2ibma5IdA4UYwnh09OpAh
         MXLRhjYUBgGmvEm/7S9KYfsBjOVcouxpUdCaG/Tz60ubuRYdAETgCCRAFw0ZRqKVChAY
         Xi4slrb8xxtjGZdREFwWC+BxVJcpPipk/1JMiA2hZU63IKaguU/0dE8w5H++Pf+cSylg
         5nYgAMwKt+IVtJNzdJA8lanUOBjQ9Psr0RS9BYFNStamn4rHNaWaxLJhS7SMyr0lCZw1
         KG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785272994; x=1785877794;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KxItAIafgzEWpgvlD1boJ4CXcti6VEwEZqB89OI68jc=;
        b=BCGdI+h754CS2fqqBew4p6+Qbsv3WLuAAsW9cKveN8nc5kNq3TuFXVWA7gcY4e32+C
         ZG2F1qIg/UuhfYAajAzGJV4wzyX1jriKMM5ow5T7U+tXCbvI1QXzy6vZWvAGAz6ZWrTE
         xHxz84gtu01V3WejlUhiTxnl9vyz+CvVO8KVmp3Q3U4iCceK2YraMgmvX4AX0VL4qRMq
         PqngUwWyZwOibgu7hM9epbcXjos+I4WFrq6yCBnkHUPz65DDjp/Wbyj5ADTStB81/VLg
         z0o3QTcY7xLoarVWLgmMsIh1RD/MrmFkiZilaCsL6+N5ccVWTWZoI23ZBu0vCdgDBBwg
         Jqmg==
X-Forwarded-Encrypted: i=1; AHgh+RqAd3eAVBGYFwml7gfvk9khk74oOR3A03crKGOddDtiiMSmqMuJQjQsN09zieJi2vJrBtM5E6T2kX3vu15PMhu3@lists.infradead.org
X-Gm-Message-State: AOJu0YyfE6aDlXfnhIysxcig6MzXVWPnvrrZwByVwSyEGDg5Zp1gH2B9
	hzwayTOV0N0DU7RR7ejKZcdhR07HOnJZO9k50AM9K57pN1fROu3FaoJn47rZ1BXCHaarq8keN96
	jkA==
X-Received: from pggg12.prod.google.com ([2002:a63:200c:0:b0:c8b:6fd:f93f])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:1645:b0:3c3:a20f:f729
 with SMTP id adf61e73a8af0-3c8aafb4adbmr5111132637.7.1785272993435; Tue, 28
 Jul 2026 14:09:53 -0700 (PDT)
Date: Tue, 28 Jul 2026 21:09:24 +0000
In-Reply-To: <20260728210928.1050849-1-praan@google.com>
Mime-Version: 1.0
References: <20260728210928.1050849-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260728210928.1050849-9-praan@google.com>
Subject: [PATCH v9 08/12] iommu/tegra241-cmdqv: Add a helper to quiesce VCMDQs
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	linux-arm-kernel@lists.infradead.org, Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_140954_508129_3E27D047 
X-CRM114-Status: GOOD (  21.37  )
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
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  4 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  2 +-
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 37 +++++++++++++++++--
 3 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 8809757ebee8..49e15d062dd5 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1013,8 +1013,8 @@ static int arm_smmu_drain_queues(struct arm_smmu_device *smmu)
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
index 40b889998d5b..cc25f307a9e4 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -891,7 +891,7 @@ struct arm_smmu_impl_ops {
 	size_t (*get_viommu_size)(enum iommu_viommu_type viommu_type);
 	int (*vsmmu_init)(struct arm_vsmmu *vsmmu,
 			  const struct iommu_user_data *user_data);
-	int (*drain_queues)(struct arm_smmu_device *smmu);
+	int (*quiesce_and_drain_queues)(struct arm_smmu_device *smmu);
 };
 
 /* An SMMUv3 instance */
diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index 8ecd2052b6dd..32139797c19b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -447,6 +447,26 @@ tegra241_cmdqv_get_cmdq(struct arm_smmu_device *smmu,
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
 static int tegra241_cmdqv_drain_vintf0_lvcmdqs(struct arm_smmu_device *smmu)
 {
 	struct tegra241_cmdqv *cmdqv =
@@ -467,6 +487,14 @@ static int tegra241_cmdqv_drain_vintf0_lvcmdqs(struct arm_smmu_device *smmu)
 	if (!READ_ONCE(vintf->enabled))
 		return 0;
 
+	/*
+	 * Gate all vCMDQs by setting the STOP_FLAG in a separate,
+	 * initial loop to ensure no new commands can be submitted
+	 * to any secondary queue while we are waiting to drain them.
+	 */
+	tegra241_cmdqv_quiesce_vintf0_lvcmdqs(smmu);
+
+	/* Now that all queues are safely gated, drain them sequentially. */
 	for (lidx = 0; lidx < cmdqv->num_lvcmdqs_per_vintf; lidx++) {
 		struct tegra241_vcmdq *vcmdq = vintf->lvcmdqs[lidx];
 
@@ -552,14 +580,17 @@ static int tegra241_vcmdq_hw_init(struct tegra241_vcmdq *vcmdq)
 
 	/* Configure and enable VCMDQ */
 	writeq_relaxed(vcmdq->cmdq.q.q_base, REG_VCMDQ_PAGE1(vcmdq, BASE));
-
 	/*
 	 * HW Registers reset to 0 when power-cycled. Restore them from their
 	 * SW copies to prevent executing stale/ghost commands after resume.
 	 */
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
@@ -946,7 +977,7 @@ static struct arm_smmu_impl_ops tegra241_cmdqv_impl_ops = {
 	.device_reset = tegra241_cmdqv_hw_reset,
 	.device_disable = tegra241_cmdqv_hw_disable,
 	.device_remove = tegra241_cmdqv_remove,
-	.drain_queues = tegra241_cmdqv_drain_vintf0_lvcmdqs,
+	.quiesce_and_drain_queues = tegra241_cmdqv_drain_vintf0_lvcmdqs,
 	/* For user-space use */
 	.hw_info = tegra241_cmdqv_hw_info,
 	.get_viommu_size = tegra241_cmdqv_get_vintf_size,
-- 
2.55.0.487.gaf234c4eb3-goog


