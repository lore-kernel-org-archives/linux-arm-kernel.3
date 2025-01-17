Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7F3C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 18:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thdukG+G+Hf8HToZ/Gcz+gc/k0VJqX4Uv/6IUD32wZs=; b=ytZfLcv+RuuPikRqIVxK7zDdgI
	7+2Vw2DUVS2VGjpqrtfM5trwDOQZYPmlPBTFUwqMRTeSXB3FN69Ky5GGt0KZOvnh94H4aRJ0Uhe0K
	7JAINmRCgvxgpQ5bCn73UP5BeKkuYdGkr5V6pM0NW/fxmBIFV2fQPFyDEVFPuRB3LhcWokGMR9b1n
	86wu5y1cfLIGAJTryN56TsagtWVsUoudSym4H+oNgM9Uyhjg2SjH5CZ0ORyigE2iCiqq1G4XGXkzr
	rAAM8l1XNPVcGdoByZ9OgcpBt7jHIhNn4S01eqtuOG/K4znazOvR8A+zZdEsC5/lBNE3lj9fQl7O5
	Ts3/e53A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYrQ6-000000019VJ-1NVd;
	Fri, 17 Jan 2025 18:50:14 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYrNd-000000018u4-05uW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 18:47:42 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6dafe70ccd6so4251166d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 10:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737139660; x=1737744460; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=thdukG+G+Hf8HToZ/Gcz+gc/k0VJqX4Uv/6IUD32wZs=;
        b=ZGhoqHA9caBDOoQN3buTQEsjXgc/gqXFV53SCRE0R6CpSoR4dv8abxf98HC3ySmkPF
         /fQqLMlyDTc2hWGhCHw/gtX5WWA/dUik0g6UkjOYAI6Ip6crAMjwaZF0Fdn1kAEHm8Ve
         fAmr6p1W2GL/NLrskyT0TV+6jJ7keJh9xQfDRPbZ65RkNAya7KT69K2k6qtApJnt19eT
         vgJM6h8WCAEWuJFIvTVa1FcL2rO4VQqc+BahJWw0SMpACtZn1S/ZlApK++bBI/+zQ7Uf
         RWphQc7XP61ZFlquRbGKKIo9f5SNY659rxfB/yqmClEkCywgoBGNBt3OKxyfH/o7JDvp
         RSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737139660; x=1737744460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thdukG+G+Hf8HToZ/Gcz+gc/k0VJqX4Uv/6IUD32wZs=;
        b=eFZGMAntmF7uPikwr+r6sOp/liwHMNadhC+ENlPvG3o7SyctiLwvhGe8mg2RvJVoHu
         EVfT5xZO568lEWVoXSy0YR38mYfVVq3CvftsPQJrRTL4SSlvLgVkzOHlwKFddw7ckCxo
         ifGu7nZ2v978m5/8bRj4q6G+P5Rnz7BDVRcOKgO9Q1iPZKhgh2IJIVENr6LSnNxcHA/V
         M30AwlTvp/UZ2UMLdOFpWFa9vBPd0vbIdxdIL2KNezZzU8D2LU9cqVucCfHHs/khgMvK
         it8Y/ygqNFeyBKWKWb8gEThhmMA6FWGCMC4oNLcFobOHlE9IgkGQ6eq+xN0LJWj3tAL9
         p4qA==
X-Forwarded-Encrypted: i=1; AJvYcCVu3dmPk7yZcU9RNXKFjDKCsuIBWof+qci5pZT7nhMJrffTYS3eg2AyQd2lxQOaZ8TsUTd05LFobdOo0svbZUif@lists.infradead.org
X-Gm-Message-State: AOJu0Yww9JcB4opBu+KEYT8yhBCabvQ/cA6wZ34v9Tt+2daV7/JRQrnT
	UIHQAK64kRI9z/dXLz7grp39WHrS588LEwuV9t56kkGDFIG2GG3n
X-Gm-Gg: ASbGncvaDZBFwRvut2EnWtFc3QygZcuWnYNc7SNAD7hf3Zc+jVWOoAFPgm82onJZ4Kh
	GzvWKhnGIJdNpvDzN3rke+JZ+sOOJ6WtuAGjj6b02TSa59xrefLSg37V8snkICR+utK7GYj10G4
	/LwyMhooT3JqGzBiVhbruNOs90MXsXgutJpzItya5uJ9RUkmRaaDzg2fX6icx08n1RaFK9JApJX
	cmedUJcGwrP5WJiA0db5C7aZa3VNcWFsMy3m4JFDH4LVjdHKW10mpEIgCaFLERpXhnOlQCLnlz2
	bZnqa2+1qysP8HA=
X-Google-Smtp-Source: AGHT+IFCtwKid4R9G/cATIXezUnzqNQSbD7LKvgass5fNNZc7tPfiHB8Zo6yUqQCv+onFrLudNkh8Q==
X-Received: by 2002:a05:6214:27e5:b0:6d8:967a:1a60 with SMTP id 6a1803df08f44-6e1b2155c60mr25286736d6.2.1737139658289;
        Fri, 17 Jan 2025 10:47:38 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afcd3859sm13992176d6.74.2025.01.17.10.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 10:47:37 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 17 Jan 2025 13:47:07 -0500
Subject: [PATCH 1/3] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-msm-gpu-fault-fixes-next-v1-1-bc9b332b5d0b@gmail.com>
References: <20250117-msm-gpu-fault-fixes-next-v1-0-bc9b332b5d0b@gmail.com>
In-Reply-To: <20250117-msm-gpu-fault-fixes-next-v1-0-bc9b332b5d0b@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737139656; l=5695;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=7AFM9ok1w81f2C++Gf69M3gwTiOfZOHfwkbHtBmlR6U=;
 b=X+UwyS84Mnzz7AGUA5nnVxAYS//fGOH+DQuYOJ9NlINCnfa/ZQ7Lo1kEPeJsOuB3QXodNs8nF
 iU2wOQc8uUUBczya9xYLQs0rwFL2blr/6XtA1wGsbUnBXZjEb0pUDBH
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_104741_066376_465F46FE 
X-CRM114-Status: GOOD (  21.96  )
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

On some SMMUv2 implementations, including MMU-500, SMMU_CBn_FSR.SS
asserts an interrupt. The only way to clear that bit is to resume the
transaction by writing SMMU_CBn_RESUME, but typically resuming the
transaction requires complex operations (copying in pages, etc.) that
can't be done in IRQ context. drm/msm already has a problem, because
its fault handler sometimes schedules a job to dump the GPU state and
doesn't resume translation until this is complete.

Work around this by disabling context fault interrupts until after the
transaction is resumed. Because other context banks can share an IRQ
line, we may still get an interrupt intended for another context bank,
but in this case only SMMU_CBn_FSR.SS will be asserted and we can skip
it assuming that interrupts are disabled which is accomplished by
removing the bit from ARM_SMMU_CB_FSR_FAULT.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 15 +++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 32 ++++++++++++++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 +-
 3 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 59d02687280e8d37b5e944619fcfe4ebd1bd6926..ee2fdf7e79a6d04bc2700e454253c96b573c5569 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -125,12 +125,25 @@ static void qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
 	struct arm_smmu_domain *smmu_domain = (void *)cookie;
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	u32 reg = 0;
+	u32 reg = 0, sctlr;
+	unsigned long flags;
 
 	if (terminate)
 		reg |= ARM_SMMU_RESUME_TERMINATE;
 
+	spin_lock_irqsave(&smmu_domain->stall_lock, flags);
+
 	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
+
+	/*
+	 * Re-enable interrupts after they were disabled by
+	 * arm_smmu_context_fault().
+	 */
+	sctlr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
+	sctlr |= ARM_SMMU_SCTLR_CFIE;
+	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, sctlr);
+
+	spin_unlock_irqrestore(&smmu_domain->stall_lock, flags);
 }
 
 static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 79afc92e1d8b984dd35c469a3f283ad0c78f3d26..c92de760940ee2872f22dbe1b2519e02766aa143 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -457,12 +457,43 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 				      DEFAULT_RATELIMIT_BURST);
 	int idx = smmu_domain->cfg.cbndx;
 	int ret;
+	unsigned long flags;
 
 	arm_smmu_read_context_fault_info(smmu, idx, &cfi);
 
 	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
 		return IRQ_NONE;
 
+	/*
+	 * On some implementations FSR.SS asserts a context fault
+	 * interrupt. We do not want this behavior, because resolving the
+	 * original context fault typically requires operations that cannot be
+	 * performed in IRQ context but leaving the stall unacknowledged will
+	 * immediately lead to another spurious interrupt as FSR.SS is still
+	 * set. Work around this by disabling interrupts for this context bank.
+	 * It's expected that interrupts are re-enabled after resuming the
+	 * translation.
+	 *
+	 * We have to do this before report_iommu_fault() so that we don't
+	 * leave interrupts disabled in case the downstream user decides the
+	 * fault can be resolved inside its fault handler.
+	 *
+	 * There is a possible race if there are multiple context banks sharing
+	 * the same interrupt and both signal an interrupt in between writing
+	 * RESUME and SCTLR. We could disable interrupts here before we
+	 * re-enable them in the resume handler, leaving interrupts enabled.
+	 * Lock the write to serialize it with the resume handler.
+	 */
+	if (cfi.fsr & ARM_SMMU_CB_FSR_SS) {
+		u32 val;
+
+		spin_lock_irqsave(&smmu_domain->stall_lock, flags);
+		val = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_SCTLR);
+		val &= ~ARM_SMMU_SCTLR_CFIE;
+		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, val);
+		spin_unlock_irqrestore(&smmu_domain->stall_lock, flags);
+	}
+
 	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
 		cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 
@@ -921,6 +952,7 @@ static struct iommu_domain *arm_smmu_domain_alloc_paging(struct device *dev)
 
 	mutex_init(&smmu_domain->init_mutex);
 	spin_lock_init(&smmu_domain->cb_lock);
+	spin_lock_init(&smmu_domain->stall_lock);
 
 	return &smmu_domain->domain;
 }
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 2dbf3243b5ad2db01e17fb26c26c838942a491be..153fac131b2484d468fd482ffbf130efc8cfb8f6 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -216,7 +216,6 @@ enum arm_smmu_cbar_type {
 					 ARM_SMMU_CB_FSR_TLBLKF)
 
 #define ARM_SMMU_CB_FSR_FAULT		(ARM_SMMU_CB_FSR_MULTI |	\
-					 ARM_SMMU_CB_FSR_SS |		\
 					 ARM_SMMU_CB_FSR_UUT |		\
 					 ARM_SMMU_CB_FSR_EF |		\
 					 ARM_SMMU_CB_FSR_PF |		\
@@ -384,6 +383,7 @@ struct arm_smmu_domain {
 	enum arm_smmu_domain_stage	stage;
 	struct mutex			init_mutex; /* Protects smmu pointer */
 	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
+	spinlock_t                      stall_lock;
 	struct iommu_domain		domain;
 };
 

-- 
2.47.1


