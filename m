Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B262BC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 21:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCgrcRKU1nB4E0G4qMe0gJqryU3wt9UNU2vaPfypDCA=; b=cJRv9zj1OPzDGJUd3n6MKDvIGG
	MOLcK+P4w/MDHdCPPcblm7BZbIgzr6FzueE3tyOnuhAGfIzySEB+dBX9aC8e0k1DRyT0eKz52m97Z
	gjDCXSuS5wNiY/1I4FdtNctNff2kassQ7KN4K22owOMHaLSZB91aw69sj2BRyEy8DPgE+siLovIuS
	L9//tFkLWyOAdjCrI1hKDPM7vD6WSUaoYs8shYahsPKF+GLe8v67MyfCB1mb2t4yUTNKU3ZDmJZnK
	K5nX9NvP3SxwfcL1RuDvp2jTiFngxcORNIZyvgW24xDXWGZA9PmnYXad0CIWxF6XiXQ3cs3Viasa3
	ZHsnlAow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop3m-00000006GXp-18EW;
	Tue, 28 Jul 2026 21:09:58 +0000
Received: from mail-pl1-x645.google.com ([2607:f8b0:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop3W-00000006GOt-3pBk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 21:09:43 +0000
Received: by mail-pl1-x645.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so2540095ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785272982; x=1785877782; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bCgrcRKU1nB4E0G4qMe0gJqryU3wt9UNU2vaPfypDCA=;
        b=ba6BzZSM2QRyHmZd500XBxTUgvLbpiRiHC71E1EKDkIRnCTeVYad4bRfMGsO/c92nf
         3JZ9+VRWIz/Bfq/jEyYpaXDDidj1vh+p31tL/PvBTWGNKEl65+OfOXeBvcAPClpxEOUx
         R2AV572XQ6KrqcfYrko8LCvDUTWstboYncSLtLIOp32nvY8Gdxkb7309+oLtv7kwBEvc
         dYfKTuNgSd7TP+mufdaj0mh0qbU1J++2RIGshGZTye5pIaUHmZmSwFiivOV50TllPpxR
         b4j5p9uFlVJIsz7xr6kJpjGJYo2jUUeaRuunxxENHCbxeJhwLdFXYO7NzAUkuYU+pgqj
         I1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785272982; x=1785877782;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bCgrcRKU1nB4E0G4qMe0gJqryU3wt9UNU2vaPfypDCA=;
        b=kphvx18bWjyA0MDuQ1QAoVQ/7nNLpqO0ZdoD6SLqvLXpXGGAJQWVAMiZpyM0NhOuyL
         SldBGiG+5CLG+2IA6EFOx8RHBAtyslDMA6ubhr3eBhzubg4Hf/nJAQ1/hQlTTjvNcKdb
         +5OPPcsgojanLHY7CllubhPw8OCkX8JmLGGe9O4mo1lHnX/Zdz6KPkPazpWdV9rTK2+z
         pgU8WjgZYnMknJoiIO/m8ZydTsle91rdzx9riUHg4X/Yqio7fjFzbjQx27xmmSUHOm7b
         Z9cXYVIbSbz+IB7LPwQSowBNLptxjhTFU4kVLGVAzfZV0DdXp3eKiVBKVpyn9Bg0b0aS
         iKAw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7ufMffir5gcBldv0NVdqJjLEjHg70A5Vp8BbPK2LWuNNpRKLb/KancbCqurr8mXa9wrAlzylrlBn3PuagEIJw@lists.infradead.org
X-Gm-Message-State: AOJu0YyAmM88bqf2bbprxp6Cpn4WlqU7aXM0wapzYhEHBOflKL5Yt180
	yOygLW41P9WFgNWfFJEjxRTm+MhwpH9uB8vHDfMPx/CzVqPR+ZAbUIOs1qRBP7zw36yja2oU7kZ
	E6g==
X-Received: from plij8.prod.google.com ([2002:a17:903:3808:b0:2cc:e64a:e6da])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:26cc:b0:2cf:7ffb:82aa
 with SMTP id d9443c01a7336-2d015d4739dmr45426485ad.45.1785272981504; Tue, 28
 Jul 2026 14:09:41 -0700 (PDT)
Date: Tue, 28 Jul 2026 21:09:19 +0000
In-Reply-To: <20260728210928.1050849-1-praan@google.com>
Mime-Version: 1.0
References: <20260728210928.1050849-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260728210928.1050849-4-praan@google.com>
Subject: [PATCH v9 03/12] iommu/tegra241-cmdqv: Add a helper to drain VCMDQs
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	linux-arm-kernel@lists.infradead.org, Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_140942_953904_596EFA03 
X-CRM114-Status: GOOD (  18.21  )
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

Add another function ptr to arm_smmu_impl_ops to drain implementation
specified queues and call it within `arm_smmu_drain_queues`.

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  7 ++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  1 +
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 35 +++++++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 08b83f211ab3..96ca4a024cdd 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -991,6 +991,13 @@ static int arm_smmu_drain_queues(struct arm_smmu_device *smmu)
 	 */
 	ret = arm_smmu_queue_poll_until_empty(smmu, &smmu->cmdq.q);
 
+	if (ret)
+		goto out;
+
+	/* Drain all implementation-specific queues */
+	if (smmu->impl_ops && smmu->impl_ops->drain_queues)
+		ret = smmu->impl_ops->drain_queues(smmu);
+out:
 	return ret;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 00ad2e0c257b..adfcbb654673 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -886,6 +886,7 @@ struct arm_smmu_impl_ops {
 	size_t (*get_viommu_size)(enum iommu_viommu_type viommu_type);
 	int (*vsmmu_init)(struct arm_vsmmu *vsmmu,
 			  const struct iommu_user_data *user_data);
+	int (*drain_queues)(struct arm_smmu_device *smmu);
 };
 
 /* An SMMUv3 instance */
diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index 6644075c1431..f62e9bdabf8a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -447,6 +447,40 @@ tegra241_cmdqv_get_cmdq(struct arm_smmu_device *smmu,
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
+
+		if (!vcmdq || !READ_ONCE(vcmdq->enabled))
+			continue;
+
+		ret = arm_smmu_queue_poll_until_empty(smmu, &vcmdq->cmdq.q);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
 /* HW Reset Functions */
 
 /*
@@ -905,6 +939,7 @@ static struct arm_smmu_impl_ops tegra241_cmdqv_impl_ops = {
 	.device_reset = tegra241_cmdqv_hw_reset,
 	.device_disable = tegra241_cmdqv_hw_disable,
 	.device_remove = tegra241_cmdqv_remove,
+	.drain_queues = tegra241_cmdqv_drain_vintf0_lvcmdqs,
 	/* For user-space use */
 	.hw_info = tegra241_cmdqv_hw_info,
 	.get_viommu_size = tegra241_cmdqv_get_vintf_size,
-- 
2.55.0.487.gaf234c4eb3-goog


