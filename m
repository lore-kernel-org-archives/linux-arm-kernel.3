Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12DEC02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 18:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4L1KrStSGgMrLKkKl6uxBZehY7mDLoPXpGyU7mfraHE=; b=X49IJfVjlUuEp56NyAsx1NV2D/
	y1Sz2BvHyg9CVBPwGqcK7WiXyjrq1i2UivLVXslvXhrScddNZJ50MMXYvRsqXbdYLzpWjX/XNEZvp
	XfG6jzqYKr2BeZyeGqmWWs5MsAxeKE69rPVEF2VWRSIXSf8h1B3l8P5R2n6mle6DZdhd+7LmTDBAz
	fqkiJp566MQCJaJxliw3vWQTgN/KyUzloJQfbWYcFigZ9vkpPVr32lhqYb0OmmXGIOH4IOviEMHT1
	JNNr4hwMybCJfDaEkpLDJDOP8AOSvHSsD0rwcnQY7aMGpHfc35aZtaUfGDp0Czz+Ov4+csq4jlQdw
	+Tm4rnYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYrRL-000000019pf-44Yy;
	Fri, 17 Jan 2025 18:51:31 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYrNd-000000018uL-2HTt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 18:47:42 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6d8983825a3so3380636d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 10:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737139660; x=1737744460; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4L1KrStSGgMrLKkKl6uxBZehY7mDLoPXpGyU7mfraHE=;
        b=nVCjWu5uEkJ1221mXe8TAeEEZeGFp/XnMbWbydTqQfmMlVSKTIAX/2W9h0I7s60zg/
         2+u+ZYyNyJdiyBRDBUSI9duuMlEOIic34blw6MJ2HrMuFaOsoVK52ScHndit3l41t3xe
         qf3KZwJexBFZxgmn2NjVO2tmMqF9j/Q1/DEDkJoNXY3eDyMdnctfAScddy5DXejKa0KJ
         KCFIjxtaLgnhInne9NWYScyDgVUQP9c4AbymGRJgSq0CAfq/Gt9UUGq+5JRqqdZiie4i
         1pd3euP7frXSvz1TswAhPykmJnYlmgrgvdYdhS73dF6Em7rmGFMtSYJ7+rQENkva9UBo
         3Irg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737139660; x=1737744460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4L1KrStSGgMrLKkKl6uxBZehY7mDLoPXpGyU7mfraHE=;
        b=pASKcMOVIF0deXhMtaXUH9Ik616Zpd4qh/yvB3+XDstKb+fri10jtQP42rpUuifflt
         jX4IDWHuyK1hpUmOULw30zRNSN/ztiYxKW+YbsXNMv+0FMBDq+LrgUKJ3yaGu8P5Hstj
         QN0/oqiV5kG6mM0i3yPhuYObMRcnqvAaxaLb3TrMBg0Wqkw9fRWe9UYaX23fP15h6uUz
         ysMgI4dZz1ArZN5Gm+Wj6HcpXofOfaoDUFphKbqPpuHqTtQnsLifL6wB1zlzvTIPgC8U
         sv9gA+bdmX++MnFJe9lhSGpUDUROa5nzTRLaXUnIy39IEdEgb/aDZRo03ND3S5GmGH6I
         sc0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZCyWuior1dumDF6SfYD3/SwVVgFcDw9LuVN2pNhGZAz9rAlH+qeXkFi/+1kr+Tnup6t32IteEwZeRc8I8BYX6@lists.infradead.org
X-Gm-Message-State: AOJu0YwcGnpISFigFE3KmxDJJKvnvkxhDCUhHlym6WfaaegR0Zzc/KHX
	ysC7VCyFT0jmuTejumavpt6UJG+hizj6NZB89sOvmfK9vY35y5b0
X-Gm-Gg: ASbGncuMPVMGkh0CpaYr41e5hGjJisu9nTP/7boWTfUxwk+09PZ8Mz00V3DLRuX21R3
	Ig0B9qPSMcHQKfk7DkXCmaA/hMQ47WX27xfRJibU3FRWZgWKI4ARxVc2VJjDnCF+PVzoyIOL7d3
	TKHk/ICv0G1+z+fXEpmlqUgTqZt7NDCQ+gv1sGFD59A9rNiUS03fV3Am4P651y2/L4iY342LXm0
	i5i+sHErekjslCt99xlY/mQDltOTmKVbtfP8wT2t8LH8Fu7Tnq6O389a/GOGeIgExqvTLU/3iJu
	oaa6dtyOyuzV1ic=
X-Google-Smtp-Source: AGHT+IEIyw5aGTESg9zUs6A5tho39lsXqAds1z3a8v1SLXZHSS9GUHBu+n7xHH9/ywAcj3SysGTDjA==
X-Received: by 2002:a05:6214:528a:b0:6d8:a90b:1564 with SMTP id 6a1803df08f44-6e1b21ba3f6mr22060366d6.6.1737139660304;
        Fri, 17 Jan 2025 10:47:40 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afcd3859sm13992176d6.74.2025.01.17.10.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 10:47:39 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 17 Jan 2025 13:47:09 -0500
Subject: [PATCH 3/3] drm/msm: Temporarily disable stall-on-fault after a
 page fault
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-msm-gpu-fault-fixes-next-v1-3-bc9b332b5d0b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737139656; l=9406;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=Azd0LHGJbPV6BAUlAR+Xa9srFF0aNcFCaktmBN9LT5I=;
 b=gspZvcy0PinUMwLI8bcCW+Uo6tVZOE/Ynr6m7+0VeKjlXgIRjeYaEXzAu1aAjUlDpx/jq2nlv
 ln3K0SO9BS3B9wdm/nclFxOBJtN7Ugr7u838eMB87ADklULFCMaraL+
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_104741_591240_0A1E9B94 
X-CRM114-Status: GOOD (  27.05  )
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

When things go wrong, the GPU is capable of quickly generating millions
of faulting translation requests per second. When that happens, in the
stall-on-fault model each access will stall until it wins the race to
signal the fault and then the RESUME register is written. This slows
processing page faults to a crawl as the GPU can generate faults much
faster than the CPU can acknowledge them. It also means that all
available resources in the SMMU are saturated waiting for the stalled
transactions, so that other transactions such as transactions generated
by the GMU, which shares a context bank with the GPU, cannot proceed.
This causes a GMU watchdog timeout, which leads to a failed reset
because GX cannot collapse when there is a transaction pending and a
permanently hung GPU.

On older platforms with qcom,smmu-v2, it seems that when one transaction
is stalled subsequent faulting transactions are terminated, which avoids
this problem, but the MMU-500 follows the spec here.

To work around these problem, disable stall-on-fault as soon as we get a
page fault until a cooldown period after pagefaults stop. This allows
the GMU some guaranteed time to continue working. We also keep it
disabled so long as the current devcoredump hasn't been deleted, because
in that case we likely won't capture another one if there's a fault.

After this commit HFI messages still occasionally time out, because the
crashdump handler doesn't run fast enough to let the GMU resume, but the
driver seems to recover from it. This will probably go away after the
HFI timeout is increased.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  4 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 56 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 21 +++++++++++++
 drivers/gpu/drm/msm/msm_iommu.c         |  9 ++++++
 drivers/gpu/drm/msm/msm_mmu.h           |  1 +
 6 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 71dca78cd7a5324e9ff5b14f173e2209fa42e196..a559e47af5b549e154fa6c32ef8879dd856531a2 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -131,6 +131,8 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i, ibs = 0;
 
+	adreno_gpu_enable_iommu_stall(adreno_gpu);
+
 	if (IS_ENABLED(CONFIG_DRM_MSM_GPU_SUDO) && submit->in_rb) {
 		ring->cur_ctx_seqno = 0;
 		a5xx_submit_in_rb(gpu, submit);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0ae29a7c8a4d3f74236a35cc919f69d5c0a384a0..0e63ee62d3eff3e274bae375430efbdf6f8dccf0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -212,6 +212,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i, ibs = 0;
 
+	adreno_gpu_enable_iommu_stall(adreno_gpu);
+
 	a6xx_set_pagetable(a6xx_gpu, ring, submit);
 
 	get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP(0),
@@ -335,6 +337,8 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i, ibs = 0;
 
+	adreno_gpu_enable_iommu_stall(adreno_gpu);
+
 	/*
 	 * Toggle concurrent binning for pagetable switch and set the thread to
 	 * BR since only it can execute the pagetable switch packets.
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 1238f326597808eb28b4c6822cbd41a26e555eb9..6bf834d075219193cce187ec5f55aa691121aad3 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -246,16 +246,65 @@ u64 adreno_private_address_space_size(struct msm_gpu *gpu)
 	return SZ_4G;
 }
 
+void adreno_gpu_enable_iommu_stall(struct adreno_gpu *adreno_gpu)
+{
+	struct msm_gpu *gpu = &adreno_gpu->base;
+	unsigned long flags;
+
+	/*
+	 * Wait until the cooldown period has passed and we would actually
+	 * collect a crashdump to re-enable stall-on-fault.
+	 */
+	spin_lock_irqsave(&adreno_gpu->fault_stall_lock, flags);
+	if (!adreno_gpu->stall_enabled &&
+			READ_ONCE(adreno_gpu->enable_stall_on_submit) &&
+			!READ_ONCE(gpu->crashstate)) {
+		adreno_gpu->stall_enabled = true;
+
+		gpu->aspace->mmu->funcs->set_stall(gpu->aspace->mmu, true);
+	}
+	spin_unlock_irqrestore(&adreno_gpu->fault_stall_lock, flags);
+}
+
+static void fault_stall_handler(struct timer_list *t)
+{
+	struct adreno_gpu *gpu = from_timer(gpu, t, fault_stall_timer);
+
+	WRITE_ONCE(gpu->enable_stall_on_submit, true);
+}
+
+
 #define ARM_SMMU_FSR_TF                 BIT(1)
 #define ARM_SMMU_FSR_PF			BIT(3)
 #define ARM_SMMU_FSR_EF			BIT(4)
+#define ARM_SMMU_FSR_SS			BIT(30)
 
 int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 			 struct adreno_smmu_fault_info *info, const char *block,
 			 u32 scratch[4])
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	const char *type = "UNKNOWN";
-	bool do_devcoredump = info && !READ_ONCE(gpu->crashstate);
+	bool do_devcoredump = info && (info->fsr & ARM_SMMU_FSR_SS) &&
+		!READ_ONCE(gpu->crashstate);
+	unsigned long irq_flags;
+
+	/*
+	 * In case there is a subsequent storm of pagefaults, disable
+	 * stall-on-fault for at least half a second.
+	 */
+	spin_lock_irqsave(&adreno_gpu->fault_stall_lock, irq_flags);
+	if (adreno_gpu->stall_enabled) {
+		adreno_gpu->stall_enabled = false;
+		adreno_gpu->enable_stall_on_submit = false;
+
+		gpu->aspace->mmu->funcs->set_stall(gpu->aspace->mmu, false);
+
+	}
+	spin_unlock_irqrestore(&adreno_gpu->fault_stall_lock, irq_flags);
+
+	mod_timer(&adreno_gpu->fault_stall_timer,
+			round_jiffies_up(jiffies + msecs_to_jiffies(500)));
 
 	/*
 	 * If we aren't going to be resuming later from fault_worker, then do
@@ -1143,6 +1192,11 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		adreno_gpu->info->inactive_period);
 	pm_runtime_use_autosuspend(dev);
 
+	spin_lock_init(&adreno_gpu->fault_stall_lock);
+	timer_setup(&adreno_gpu->fault_stall_timer, fault_stall_handler, 0);
+	adreno_gpu->enable_stall_on_submit = true;
+	adreno_gpu->stall_enabled = true;
+
 	return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
 			gpu_name, &adreno_gpu_config);
 }
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index dcf454629ce037b2a8274a6699674ad754ce1f07..c59501afa40c223d02bea3ff9b0dbc309d099317 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -205,6 +205,25 @@ struct adreno_gpu {
 	/* firmware: */
 	const struct firmware *fw[ADRENO_FW_MAX];
 
+	spinlock_t fault_stall_lock;
+
+	struct timer_list fault_stall_timer;
+
+	/**
+	 * enable_stall_on_submit:
+	 *
+	 * Whether to re-enable stall-on-fault on the next submit.
+	 */
+	bool enable_stall_on_submit;
+
+	/**
+	 * stall_enabled:
+	 *
+	 * Whether stall-on-fault is currently enabled.
+	 */
+	bool stall_enabled;
+
+
 	struct {
 		/**
 		 * @rgb565_predicator: Unknown, introduced with A650 family,
@@ -629,6 +648,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 			 struct adreno_smmu_fault_info *info, const char *block,
 			 u32 scratch[4]);
 
+void adreno_gpu_enable_iommu_stall(struct adreno_gpu *gpu);
+
 int adreno_read_speedbin(struct device *dev, u32 *speedbin);
 
 /*
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 2a94e82316f95c5f9dcc37ef0a4664a29e3492b2..8d5380e6dcc217c7c209b51527bf15748b3ada71 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -351,6 +351,14 @@ static void msm_iommu_resume_translation(struct msm_mmu *mmu)
 		adreno_smmu->resume_translation(adreno_smmu->cookie, true);
 }
 
+static void msm_iommu_set_stall(struct msm_mmu *mmu, bool enable)
+{
+	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(mmu->dev);
+
+	if (adreno_smmu->set_stall)
+		adreno_smmu->set_stall(adreno_smmu->cookie, enable);
+}
+
 static void msm_iommu_detach(struct msm_mmu *mmu)
 {
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
@@ -399,6 +407,7 @@ static const struct msm_mmu_funcs funcs = {
 		.unmap = msm_iommu_unmap,
 		.destroy = msm_iommu_destroy,
 		.resume_translation = msm_iommu_resume_translation,
+		.set_stall = msm_iommu_set_stall,
 };
 
 struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 88af4f490881f2a6789ae2d03e1c02d10046331a..2694a356a17904e7572b767b16ed0cee806406cf 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -16,6 +16,7 @@ struct msm_mmu_funcs {
 	int (*unmap)(struct msm_mmu *mmu, uint64_t iova, size_t len);
 	void (*destroy)(struct msm_mmu *mmu);
 	void (*resume_translation)(struct msm_mmu *mmu);
+	void (*set_stall)(struct msm_mmu *mmu, bool enable);
 };
 
 enum msm_mmu_type {

-- 
2.47.1


