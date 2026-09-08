Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C990BC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9C92r83nS2wq2dKMa8skb7uP3YeUASzkep8OkFa0pmc=; b=gqGJ7LSFZO7ymPet3ccckB0DIa
	IVf9nw3/A9Fuul4kpjyhtc8G8YV0+x4t7Q2v/B8LIBhn6L3htaUZq/rfQFjD9VY0R1zCvhrfFZM1s
	BahtOv6YQ91idONTyMR8C76FqO+5YjH8NSeB+n8N7C/Oe4xNjBVbm7A+lE7voTwRgpJdBlvFqbJ1C
	i4NhbKCXBBan7aasY+1+iuxSnwndqja6TJUPbX8tnM7iSn1fQZWmqujPPOIaXM2UBxew/oHxOkujl
	qNcX+QdBt11aLf3hioqzurgHGgKDx2Y7zQjAQpsZ++HG38YOUAViP8848bKVJWNm1C5dA0pi4x24B
	qTZgR6Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zRy-00000009mVl-3Ce5;
	Tue, 08 Sep 2026 17:17:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zRq-00000009mPe-06VG
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 17:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9C92r83nS2wq2dKMa8skb7uP3YeUASzkep8OkFa0pmc=; b=XQc3+Fp2Tg9VcC8pX/KlMtyMDA
	t9y5lvFkkhZuqMIBRILzQiNcOC+NnZEWQ12l8jQsK4rG9zjyz8BsZp5LUJQUuYTe+UX/0P5hjUyfV
	rUe8ZCaSNPA/yKdONTXtEidaR+l9+eWYGFZMZXChjVooymtE6BQLa6vZIegyQBE/ybi6O9rIBRBzL
	F1TBVOHIc34szXG5iLPXcFH6Yod2/8Idg3VtGqF9sR2V5euINI822nwkOwy+WslaKGrCNi9Rwjnxc
	E48IEyPRDf0O0hnS5RbOnTLDMfJgknxjFGgy61g5KXGB9NE2PwPj76o55PlIMX+NWVPXQvjxgkfgt
	z1HnxMeQ==;
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3zRn-000000008vw-16Ej
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:17:28 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-cbedb8673ceso4137180a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788887845; x=1789492645; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9C92r83nS2wq2dKMa8skb7uP3YeUASzkep8OkFa0pmc=;
        b=uwguafq04xuKnvDvh7B6V2G6r60yl9Klt9k0oRB0BbMEZU67O3YELoRL8NaFn3RmpL
         yA4g0u3Kzj5xqkwxw6w6mljdwSUvmNmiwrZDSt/vb++ut9mMj//tGtqD8AgfQbCm/xIo
         3l/1HzFT3u9/K9RQ2Fs52zieq2+mVEB3TftehKfzyhXqgs6r3u9cMHD3zCsaBS3IhjYd
         +yH/in4vuVhWp52cjGCC75CIvfgatkFrkoW46eCDxX8KZl+uw04s5y3qguJ6nAKzAKIl
         lo05WlVMbwYCqdNB2ocXSK7QKSjIvk8pifEilMhk0rocbBs8J+DKh9e6FZhH5HI2BN+K
         T7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887845; x=1789492645;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9C92r83nS2wq2dKMa8skb7uP3YeUASzkep8OkFa0pmc=;
        b=i0acUOU0U3MAO+//jvqzYIt3eKbsuXL+ym2hC3Gn2oE6hnDrDduqGiIr1Yq8iCDI3k
         3IAu9dHLXQaXawkUAwHz3ZnaeMFDOpwjH9PnSiy+qvjuj/GxQw6+hWbzgO8mN52sOqmp
         cM1WX2nFsaEHtXR1nU6zXDi3M6aQlEyMUu1aLgxjyPxiU4rdzCgzUysqiXIQEV/RptEW
         Gp02ZpEotz+bK+W20A2isRkERg8FSoIv2U64kZaczWbsmsiqeBLSMLY0L1v8uvAgM3Xr
         oMWNgY+5cnnr0KJs8vypk597jXrWRvZtbBqCQBfskvbreKdWnIpS/6N4zayLU8J1Q4W7
         N2cg==
X-Forwarded-Encrypted: i=1; AKwUvBxrvCLXLBUbY+3BsviOnroS7EdYRbcjJ8JAMJfmFnZQAwfOvCkhF1UV48l6HIq4WsCXRb36GYhKb40zqlEbOcS+@lists.infradead.org
X-Gm-Message-State: AFuF++ni8L6yv0YuHQgfcLUp4f9pBRZEghDfci5QGMWnYHw/9NoxQMFR
	hnBwngx4QlyuLEdjv6HGEjd4Vz0/PmogRtVHnf7i5chg9ggKL2R81iNhucz1Ah9NnulkHQ7afj9
	xJQ==
X-Received: from pgbcl15.prod.google.com ([2002:a05:6a02:98f:b0:c8b:2706:11a7])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9f43:b0:3cc:92d9:80cb
 with SMTP id adf61e73a8af0-3da39e4d212mr51863565637.12.1788887844433; Tue, 08
 Sep 2026 10:17:24 -0700 (PDT)
Date: Tue,  8 Sep 2026 17:17:00 +0000
In-Reply-To: <20260908171712.356645-1-praan@google.com>
Mime-Version: 1.0
References: <20260908171712.356645-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908171712.356645-5-praan@google.com>
Subject: [PATCH v10 04/15] iommu/tegra241-cmdqv: Add a helper to drain VCMDQs
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
X-CRM114-CacheID: sfid-20260908_181727_388184_9F21753F 
X-CRM114-Status: GOOD (  21.50  )
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
2.55.0.979.g7e5102b832-goog


