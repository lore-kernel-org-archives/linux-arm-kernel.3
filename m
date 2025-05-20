Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FA4C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 19:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p605H/gwYQGbgiKDoVqvqTFDpgFsHP3ae2OvlNB6R7c=; b=0lgsaD6LZW4CLPklKUs3/gtXKE
	ec3bEPTVNQENT1sYCG+G6WlOQnx5InLN9xFAJSPdrd9dhwUsK8N/HGMuIE/35Ggp4/LyV918urs2B
	h6Ll6hE+SZd2fDfU2p90S8VYWbYKCxKs9cro8yogAXW8TXhRyklvGn2y3wyDDqWkp1RaOKwf1wE2s
	ATn65pkS711zQyP6UfKE2I3NqrdfrplyWNZpcFBy5H3h2BGBoLF26YmTdHnGYlXkdfu/ufjoG0UlV
	Ma2Y6c5fBdnz8HMUmRxJNmyz0W7WQtq3VUKFqoR7Dufvz7lIZn/bIf/6DGB7X2zQBROhtwO+CClv3
	iK8JJa2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSZY-0000000DvGd-4ATU;
	Tue, 20 May 2025 19:24:20 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSKq-0000000DtXD-1Dl1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 19:09:09 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7c548db0aa0so86693485a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 12:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747768147; x=1748372947; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p605H/gwYQGbgiKDoVqvqTFDpgFsHP3ae2OvlNB6R7c=;
        b=LvOSS1gdbnkTeSN9Xk/HXOI4i39DOVU3Yb21uuCOJNNJ2d3w/5UqnG8xc4RAR0Ahlc
         4NaGdnWAlABJ92iA3MjbmrPdoXl2CdLoXEYb7tHbpWuwV6sEh1vJcGN5ICrrbs9hYTx4
         7FPJddX12u8oU/qJcfHrF1/Mmt4bnq0ea+3hvm1vlVhUI0kpJZ1ZiQxBo9QMMluJfuUW
         ger8lq8OTQCYu6IE509mbV48XYCxMia3ZhvslTYLZX8HrG+NkbJbhPUKPGIfPDG/cKXf
         2QwgAmZEFqSXKsOcZqlBkaKYZaCjXYvBaz8phpgAdUjyHQETert/vmFR74Fv73JIrJu3
         x47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747768147; x=1748372947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p605H/gwYQGbgiKDoVqvqTFDpgFsHP3ae2OvlNB6R7c=;
        b=O7TGXsIUoj/erIfuJO+ZcNx3r1EWlHCNotLggijKYV8th05fqDYZBc5MeS9RF6jEIS
         KDl6jVnZ3h6soq0NVQ6VMo8PzqCEE8ssSzemxTX5EJcu1PU822bPWH/FfBhBWHh7rbLp
         Lqzgoiv55q8TH8qUuukHKmkBG+xDDM7qBOombJqG80sGeJCBjm1M9Mzpmi8X2BUHvzv/
         4HhhfI1Z7Nm/FoQ+IMZtdeHrGLaxPYpge5yavP/b9qEg0ydreJN9AFf+6EwSc9WwIVel
         1jPNRJBhhvDibVrHcSeK8lWzI8YkjIzMOmJHk0hsQ6ieOzzoXbC0AL9EWCn7k37XGj8l
         iMQw==
X-Forwarded-Encrypted: i=1; AJvYcCVwSSZkP6HmFQ/13t+UlPy4Z3LXREHA2Uj8nanwYG1FJw2b7Mbm+iAErpyREBj2LuolGOdiwVCAPz1+f6HiqMcS@lists.infradead.org
X-Gm-Message-State: AOJu0YwAXM4LpKwwUIxLTx/kr5hiOJazOWngW/tRy7Molu0rHDPoBHwb
	1sf6no1NEYAz0p8tTLf8MvvCkeAWHeptOyAVfAq4f84lgxfQdSICkN8t
X-Gm-Gg: ASbGncuRoYF3SUnHmTHKcIQoxPdKBgDU9baoFPyYtPEsHc4DdQ3fm+tYYouv6XOPF9L
	6kC4x7i4Yo9Qa2OmYEJlape7oSFReRIEzdIi+WkJhQ6hsmFti1+4Sks93qE8V2KjSCPP4c6d02Z
	LHEFAgGh4fCmptqfgo1APWPPX1NHU2YhEM+gwrn+Lh8Jx/5XpnRL/JMkokb1CiDa5AJsj66nl1T
	DlUIRjVC6HRlBfyvZCzRfW+Oein4Wo2uT6fwDb9hcCRsn9LUVT8RVKBXNadCQJCJl+HuEk/EjNb
	nJv49neA0qEzBX6D2S1m0TlGN4sFPmDHns5y05Er2xye6MZhdmae/KMY6HuqeI9U+sqMK08+CHE
	Ydrj+9aCn3qiMxQGSGU0=
X-Google-Smtp-Source: AGHT+IERko68tjSRXwzHehFMdLYwGfBcZEiVZ+HJEyjzfXIk8XlXd8CWDgt9mnwB3yU5B9kiA/nGyw==
X-Received: by 2002:a05:622a:19a0:b0:474:faeb:50aa with SMTP id d75a77b69052e-494ae3509fcmr97992671cf.5.1747768147025;
        Tue, 20 May 2025 12:09:07 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae445b99sm76554051cf.48.2025.05.20.12.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:09:06 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 15:08:59 -0400
Subject: [PATCH v8 6/7] drm/msm: Temporarily disable stall-on-fault after a
 page fault
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v8-6-fce6ee218787@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747768138; l=11849;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=FCsMQ/lDosid4e/Pi7b+7W8zAGLYgmp9uHd4ek8IEi4=;
 b=1H940zl22KNPnuJyClBlD1/DnqrUirZl5DpdXOyMTw/3GpoHapw90t4z6143/3qezWcEmP6Dx
 q7IbxNp6LYFAzyH62QyvwvsM14dulXC5iwBNsZ1KnA55wXpDtrbIg55
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_120908_366405_4E16AA51 
X-CRM114-Status: GOOD (  32.33  )
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
by the GMU, which shares translation resources with the GPU, cannot
proceed. This causes a GMU watchdog timeout, which leads to a failed
reset because GX cannot collapse when there is a transaction pending and
a permanently hung GPU.

On older platforms with qcom,smmu-v2, it seems that when one transaction
is stalled subsequent faulting transactions are terminated, which avoids
this problem, but the MMU-500 follows the spec here.

To work around these problems, disable stall-on-fault as soon as we get a
page fault until a cooldown period after pagefaults stop. This allows
the GMU some guaranteed time to continue working. We only use
stall-on-fault to halt the GPU while we collect a devcoredump and we
always terminate the transaction afterward, so it's fine to miss some
subsequent page faults. We also keep it disabled so long as the current
devcoredump hasn't been deleted, because in that case we likely won't
capture another one if there's a fault.

After this commit HFI messages still occasionally time out, because the
crashdump handler doesn't run fast enough to let the GMU resume, but the
driver seems to recover from it. This will probably go away after the
HFI timeout is increased.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 40 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
 drivers/gpu/drm/msm/msm_debugfs.c       | 32 ++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.c           |  4 ++++
 drivers/gpu/drm/msm/msm_drv.h           | 23 +++++++++++++++++++
 drivers/gpu/drm/msm/msm_iommu.c         |  9 ++++++++
 drivers/gpu/drm/msm/msm_mmu.h           |  1 +
 9 files changed, 116 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 650e5bac225f372e819130b891f1d020b464f17f..60aef079623606bb1ae44ba59ac45e391595b0ba 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -131,6 +131,8 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i, ibs = 0;
 
+	adreno_check_and_reenable_stall(adreno_gpu);
+
 	if (IS_ENABLED(CONFIG_DRM_MSM_GPU_SUDO) && submit->in_rb) {
 		ring->cur_ctx_seqno = 0;
 		a5xx_submit_in_rb(gpu, submit);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..afa4626d58f577d5d47f47b494b26953adcf230f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -212,6 +212,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i, ibs = 0;
 
+	adreno_check_and_reenable_stall(adreno_gpu);
+
 	a6xx_set_pagetable(a6xx_gpu, ring, submit);
 
 	get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP(0),
@@ -335,6 +337,8 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i, ibs = 0;
 
+	adreno_check_and_reenable_stall(adreno_gpu);
+
 	/*
 	 * Toggle concurrent binning for pagetable switch and set the thread to
 	 * BR since only it can execute the pagetable switch packets.
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 4a6dc29ff7071940e440297f5fbbe4e2d06c3ffd..0f8211641c318f1b619e1a72bb77f064fb78397b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -246,16 +246,54 @@ u64 adreno_private_address_space_size(struct msm_gpu *gpu)
 	return SZ_4G;
 }
 
+void adreno_check_and_reenable_stall(struct adreno_gpu *adreno_gpu)
+{
+	struct msm_gpu *gpu = &adreno_gpu->base;
+	struct msm_drm_private *priv = gpu->dev->dev_private;
+	unsigned long flags;
+
+	/*
+	 * Wait until the cooldown period has passed and we would actually
+	 * collect a crashdump to re-enable stall-on-fault.
+	 */
+	spin_lock_irqsave(&priv->fault_stall_lock, flags);
+	if (!priv->stall_enabled &&
+			ktime_after(ktime_get(), priv->stall_reenable_time) &&
+			!READ_ONCE(gpu->crashstate)) {
+		priv->stall_enabled = true;
+
+		gpu->aspace->mmu->funcs->set_stall(gpu->aspace->mmu, true);
+	}
+	spin_unlock_irqrestore(&priv->fault_stall_lock, flags);
+}
+
 #define ARM_SMMU_FSR_TF                 BIT(1)
 #define ARM_SMMU_FSR_PF			BIT(3)
 #define ARM_SMMU_FSR_EF			BIT(4)
+#define ARM_SMMU_FSR_SS			BIT(30)
 
 int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 			 struct adreno_smmu_fault_info *info, const char *block,
 			 u32 scratch[4])
 {
+	struct msm_drm_private *priv = gpu->dev->dev_private;
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
+	spin_lock_irqsave(&priv->fault_stall_lock, irq_flags);
+	if (priv->stall_enabled) {
+		priv->stall_enabled = false;
+
+		gpu->aspace->mmu->funcs->set_stall(gpu->aspace->mmu, false);
+	}
+	priv->stall_reenable_time = ktime_add_ms(ktime_get(), 500);
+	spin_unlock_irqrestore(&priv->fault_stall_lock, irq_flags);
 
 	/*
 	 * Print a default message if we couldn't get the data from the
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 92caba3584da0400b44a903e465814af165d40a3..6116f03e3d39bb208c7fa34f203931c563e029f9 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -634,6 +634,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 			 struct adreno_smmu_fault_info *info, const char *block,
 			 u32 scratch[4]);
 
+void adreno_check_and_reenable_stall(struct adreno_gpu *gpu);
+
 int adreno_read_speedbin(struct device *dev, u32 *speedbin);
 
 /*
diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 7ab607252d183f78b99c3a8b878c949ed5f99fec..6af72162cda4c8d4bc8dd4c6473cbc29817bb3c6 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -208,6 +208,35 @@ DEFINE_DEBUGFS_ATTRIBUTE(shrink_fops,
 			 shrink_get, shrink_set,
 			 "0x%08llx\n");
 
+/*
+ * Return the number of microseconds to wait until stall-on-fault is
+ * re-enabled. If 0 then it is already enabled or will be re-enabled on the
+ * next submit (unless there's a leftover devcoredump). This is useful for
+ * kernel tests that intentionally produce a fault and check the devcoredump to
+ * wait until the cooldown period is over.
+ */
+
+static int
+stall_reenable_time_get(void *data, u64 *val)
+{
+	struct msm_drm_private *priv = data;
+	unsigned long irq_flags;
+
+	spin_lock_irqsave(&priv->fault_stall_lock, irq_flags);
+
+	if (priv->stall_enabled)
+		*val = 0;
+	else
+		*val = max(ktime_us_delta(priv->stall_reenable_time, ktime_get()), 0);
+
+	spin_unlock_irqrestore(&priv->fault_stall_lock, irq_flags);
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(stall_reenable_time_fops,
+			 stall_reenable_time_get, NULL,
+			 "%lld\n");
 
 static int msm_gem_show(struct seq_file *m, void *arg)
 {
@@ -319,6 +348,9 @@ static void msm_debugfs_gpu_init(struct drm_minor *minor)
 	debugfs_create_bool("disable_err_irq", 0600, minor->debugfs_root,
 		&priv->disable_err_irq);
 
+	debugfs_create_file("stall_reenable_time_us", 0400, minor->debugfs_root,
+		priv, &stall_reenable_time_fops);
+
 	gpu_devfreq = debugfs_create_dir("devfreq", minor->debugfs_root);
 
 	debugfs_create_bool("idle_clamp",0600, gpu_devfreq,
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c3588dc9e53764a27efda1901b094724cec8928a..04a4bde2d33b03ae8fb06b2134ee1910debd774a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -245,6 +245,10 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	drm_gem_lru_init(&priv->lru.willneed, &priv->lru.lock);
 	drm_gem_lru_init(&priv->lru.dontneed, &priv->lru.lock);
 
+	/* Initialize stall-on-fault */
+	spin_lock_init(&priv->fault_stall_lock);
+	priv->stall_enabled = true;
+
 	/* Teach lockdep about lock ordering wrt. shrinker: */
 	fs_reclaim_acquire(GFP_KERNEL);
 	might_lock(&priv->lru.lock);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index a65077855201746c37ee742364b61116565f3794..c8afb1ea6040b1ac94ac95a785e6fc366c8dbfd1 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -222,6 +222,29 @@ struct msm_drm_private {
 	 * the sw hangcheck mechanism.
 	 */
 	bool disable_err_irq;
+
+	/**
+	 * @fault_stall_lock:
+	 *
+	 * Serialize changes to stall-on-fault state.
+	 */
+	spinlock_t fault_stall_lock;
+
+	/**
+	 * @fault_stall_reenable_time:
+	 *
+	 * If stall_enabled is false, when to reenable stall-on-fault.
+	 * Protected by @fault_stall_lock.
+	 */
+	ktime_t stall_reenable_time;
+
+	/**
+	 * @stall_enabled:
+	 *
+	 * Whether stall-on-fault is currently enabled. Protected by
+	 * @fault_stall_lock.
+	 */
+	bool stall_enabled;
 };
 
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format, uint64_t modifier);
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index aae885d048d0d2fd617d7b2a16833da25f5e84cc..739ce2c283a4613e74df4542ca3b68f180aa8335 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -372,6 +372,14 @@ static int msm_disp_fault_handler(struct iommu_domain *domain, struct device *de
 	return -ENOSYS;
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
@@ -419,6 +427,7 @@ static const struct msm_mmu_funcs funcs = {
 		.map = msm_iommu_map,
 		.unmap = msm_iommu_unmap,
 		.destroy = msm_iommu_destroy,
+		.set_stall = msm_iommu_set_stall,
 };
 
 struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index c3d17aae88b0a57b3c7d1df3351b39ec39bca60a..0c694907140d00bae86eb20411aed45650367e74 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -15,6 +15,7 @@ struct msm_mmu_funcs {
 			size_t len, int prot);
 	int (*unmap)(struct msm_mmu *mmu, uint64_t iova, size_t len);
 	void (*destroy)(struct msm_mmu *mmu);
+	void (*set_stall)(struct msm_mmu *mmu, bool enable);
 };
 
 enum msm_mmu_type {

-- 
2.47.1


