Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF651C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 19:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MuutgzGDaH8CjNyI4g6TYCQbDYXMk/DcTGlIQTdOozs=; b=azZzHoI5ZMzVk81sxkRffItB51
	BJxh4EBJypAvJGyi0e0GShDFvVm06l4fdJq3jbBIJlXrWhGn/3N31Gs0gHyTlXob5JcSMtS+C3CFH
	VqkXfRi+bvyfIJPdsmLA8NUkL1aJiwfqylxJ/wVlTwQL1CwtE4Kto0CTtcA2ID7gs9xr9/JFTha5k
	e9vCUGjmb+PRAN7wXcL2vZqWMATLA/qgvbeyAjeBujvqwiZ7LYsRuWVEJfmt9CM7G1Sf8hBq6AQvd
	GTNmS078sb0AoKwlCnmZFzUEAm4nXevQ9wN5PrXYRE6oB4UiphsYILImCJY9llpZX5IuXWeWO1kjz
	wtJ0s7jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSVK-0000000Dui5-1y2G;
	Tue, 20 May 2025 19:19:58 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSKn-0000000DtVz-3YnO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 19:09:06 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-476c7ce7a6fso2496361cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 12:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747768145; x=1748372945; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MuutgzGDaH8CjNyI4g6TYCQbDYXMk/DcTGlIQTdOozs=;
        b=ZlfzxUVT2wJ6jmx4TqbUAT8pzBFEUd0dgdNQPz7dYm7Iwz7NUno4mLkI2qAZTDciII
         0bDWjE8/FMAfbwclIy3ELKqw9wLQE3FnSBHhjSNEq3jxyt2trtV4c0jAl8PF/sSn7g+R
         /0OQyqr9iGdg8Pjx4dTu0tidQwWVkWNaywK7KeSJpaFg6JD5J/up8P7FaV/6wQUhveQ7
         m1WHmXs7B4wH56Onn5e+RQ1L6IKHktJXnV0L/x2wjHxGTMQo4PXA7n6ZV0DqEDscP5tl
         2hTtukcAx6pjJW9EY0BsDS4Bz/Srb6JHkfWzpE2+BZ47ju1opLYsRTyLSvJnP1bri+bs
         6WGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747768145; x=1748372945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MuutgzGDaH8CjNyI4g6TYCQbDYXMk/DcTGlIQTdOozs=;
        b=Iw1Ue7iheCMAOWkTmlpdBisqQybNRCgrvhqXJsHWpSU4Fl9GNnyCaQiQz+7fcRYYw9
         Dw0IMABBWv2hhbVUEvLYA4t9+fmsNRGJnr8NBdqJwRloMuzzGpMUU0d9/HMOnhVd86GE
         VgJ/FlfAUOjGBAQi8UApBvUPIODWwWwZ3QQTx7WUEQ/kIww5MIm3/1JLHCsy6wbzPBrm
         IZmupwn+R+niw0C+IuaBAdeP1PVfSain3P2St+XvBr1DV9IzYFH0njqnAd27x5o6Mwad
         7NLngJ1lSJb4YG2cGy3gqnsPdliqa76TP1sbIt3XdoEPBVZdsNn1j/SDEpVJesbC/zH9
         RK/A==
X-Forwarded-Encrypted: i=1; AJvYcCXvZdCPaBo4YeqM1Dlde0Ibf1o6RT2NgpOCAf1hV5g0Zf+agN4WSEkDbNM44kL7flS+ihxCjJFYaJUoQNcyZ0Tz@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1tQl4ADw8Dq/czg5VcKjVlRrQSchgYovgXY/9vkkAxushcI6T
	zmmXPAtAclMslqDmE+z26rTh18ro1XX0EnTPxiR4RX89uP7/YcaLaSkz
X-Gm-Gg: ASbGncurGXdMtFUl0vnfqAONb0GPx9sUAbp9z1+wPZSWy1jal+xcKXAB2/atHuCECsE
	HV9Ufz04bPkC2CN1L5w4FyxGtN69WhZ/evSk4CgEFpbWUETshB+BWedNXTcIMRSuuBwuQrtkZnI
	0xa25ca+MilU0JcB+Pe1LWBbnSevo3ULTH6LyFDIC6UiNz99qQCZJ/zieRVTrBnim4TW3rilAYd
	v4wlcixl24DRLl5C0L+PhUcgicjfcRw61JgmY49O5ji9BYAdIrA0BpwHeCCEgh6vdjpS6Lb1mqz
	rnBr2Fcq1IQBWCeu5HgN1MzO8CaNBd3dT4Nsg+s2RDjgYNgkFipHf7rtc31+YB3tRthJvqfQi9J
	+LzERekvpV60JidGqv4zfTtYWstKCWw==
X-Google-Smtp-Source: AGHT+IGTEuOT5AKSY9QNH3BI4uSkpEqMzwIX5HeR3aoY35A9UU3EKtm3GcLNIXZ3fsDigIbw6flk4w==
X-Received: by 2002:a05:622a:2c9:b0:474:fcf8:8f0e with SMTP id d75a77b69052e-494ae3736d5mr107613701cf.8.1747768144604;
        Tue, 20 May 2025 12:09:04 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae445b99sm76554051cf.48.2025.05.20.12.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:09:04 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 15:08:57 -0400
Subject: [PATCH v8 4/7] drm/msm: Don't use a worker to capture fault
 devcoredump
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v8-4-fce6ee218787@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747768138; l=6008;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=gk8DwE6MH3TUftDA43LAG4YX9fts1PWBfmK+nfds2g0=;
 b=B32zCFW6SjtAi/CSZwadfMTfzVtd5ahW7RYfl/ZOrAxW3x+ocg/HybRu5g3ZhTJm3x1MT8Sqx
 WcJt0qdXT4yBHPiW79Lj1VsiIe6m5qQgOqfSuL7uWBBsyLhmx41dhDo
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_120905_886667_00761CB8 
X-CRM114-Status: GOOD (  19.85  )
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

Now that we use a threaded IRQ, it should be safe to do this in the
fault handler.

We can also remove fault_info from struct msm_gpu and just pass it
directly.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 22 ++++++++--------------
 drivers/gpu/drm/msm/msm_gpu.c           | 20 +++++++++-----------
 drivers/gpu/drm/msm/msm_gpu.h           |  8 ++------
 3 files changed, 19 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 26db1f4b5fb90930bdbd2f17682bf47e35870936..4a6dc29ff7071940e440297f5fbbe4e2d06c3ffd 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -257,14 +257,6 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	const char *type = "UNKNOWN";
 	bool do_devcoredump = info && !READ_ONCE(gpu->crashstate);
 
-	/*
-	 * If we aren't going to be resuming later from fault_worker, then do
-	 * it now.
-	 */
-	if (!do_devcoredump) {
-		gpu->aspace->mmu->funcs->resume_translation(gpu->aspace->mmu);
-	}
-
 	/*
 	 * Print a default message if we couldn't get the data from the
 	 * adreno-smmu-priv
@@ -291,16 +283,18 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 			scratch[0], scratch[1], scratch[2], scratch[3]);
 
 	if (do_devcoredump) {
+		struct msm_gpu_fault_info fault_info = {};
+
 		/* Turn off the hangcheck timer to keep it from bothering us */
 		timer_delete(&gpu->hangcheck_timer);
 
-		gpu->fault_info.ttbr0 = info->ttbr0;
-		gpu->fault_info.iova  = iova;
-		gpu->fault_info.flags = flags;
-		gpu->fault_info.type  = type;
-		gpu->fault_info.block = block;
+		fault_info.ttbr0 = info->ttbr0;
+		fault_info.iova  = iova;
+		fault_info.flags = flags;
+		fault_info.type  = type;
+		fault_info.block = block;
 
-		kthread_queue_work(gpu->worker, &gpu->fault_work);
+		msm_gpu_fault_crashstate_capture(gpu, &fault_info);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index c380d9d9f5af10b90ef733b05f5b0295c0445f38..457f019d507e954daeb609c313d37ee64fd492f9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -257,7 +257,8 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 }
 
 static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
-		struct msm_gem_submit *submit, char *comm, char *cmd)
+		struct msm_gem_submit *submit, struct msm_gpu_fault_info *fault_info,
+		char *comm, char *cmd)
 {
 	struct msm_gpu_state *state;
 
@@ -276,7 +277,8 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	/* Fill in the additional crash state information */
 	state->comm = kstrdup(comm, GFP_KERNEL);
 	state->cmd = kstrdup(cmd, GFP_KERNEL);
-	state->fault_info = gpu->fault_info;
+	if (fault_info)
+		state->fault_info = *fault_info;
 
 	if (submit) {
 		int i;
@@ -308,7 +310,8 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 }
 #else
 static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
-		struct msm_gem_submit *submit, char *comm, char *cmd)
+		struct msm_gem_submit *submit, struct msm_gpu_fault_info *fault_info,
+		char *comm, char *cmd)
 {
 }
 #endif
@@ -405,7 +408,7 @@ static void recover_worker(struct kthread_work *work)
 
 	/* Record the crash state */
 	pm_runtime_get_sync(&gpu->pdev->dev);
-	msm_gpu_crashstate_capture(gpu, submit, comm, cmd);
+	msm_gpu_crashstate_capture(gpu, submit, NULL, comm, cmd);
 
 	kfree(cmd);
 	kfree(comm);
@@ -459,9 +462,8 @@ static void recover_worker(struct kthread_work *work)
 	msm_gpu_retire(gpu);
 }
 
-static void fault_worker(struct kthread_work *work)
+void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_info *fault_info)
 {
-	struct msm_gpu *gpu = container_of(work, struct msm_gpu, fault_work);
 	struct msm_gem_submit *submit;
 	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
 	char *comm = NULL, *cmd = NULL;
@@ -484,16 +486,13 @@ static void fault_worker(struct kthread_work *work)
 
 	/* Record the crash state */
 	pm_runtime_get_sync(&gpu->pdev->dev);
-	msm_gpu_crashstate_capture(gpu, submit, comm, cmd);
+	msm_gpu_crashstate_capture(gpu, submit, fault_info, comm, cmd);
 	pm_runtime_put_sync(&gpu->pdev->dev);
 
 	kfree(cmd);
 	kfree(comm);
 
 resume_smmu:
-	memset(&gpu->fault_info, 0, sizeof(gpu->fault_info));
-	gpu->aspace->mmu->funcs->resume_translation(gpu->aspace->mmu);
-
 	mutex_unlock(&gpu->lock);
 }
 
@@ -882,7 +881,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	init_waitqueue_head(&gpu->retire_event);
 	kthread_init_work(&gpu->retire_work, retire_worker);
 	kthread_init_work(&gpu->recover_work, recover_worker);
-	kthread_init_work(&gpu->fault_work, fault_worker);
 
 	priv->hangcheck_period = DRM_MSM_HANGCHECK_DEFAULT_PERIOD;
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index e25009150579c08f7b98d4461a75757d1093734a..bed0692f5adb30e50d0448640a329158d1ffe5e5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -253,12 +253,6 @@ struct msm_gpu {
 #define DRM_MSM_HANGCHECK_PROGRESS_RETRIES 3
 	struct timer_list hangcheck_timer;
 
-	/* Fault info for most recent iova fault: */
-	struct msm_gpu_fault_info fault_info;
-
-	/* work for handling GPU ioval faults: */
-	struct kthread_work fault_work;
-
 	/* work for handling GPU recovery: */
 	struct kthread_work recover_work;
 
@@ -705,6 +699,8 @@ static inline void msm_gpu_crashstate_put(struct msm_gpu *gpu)
 	mutex_unlock(&gpu->lock);
 }
 
+void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_info *fault_info);
+
 /*
  * Simple macro to semi-cleanly add the MAP_PRIV flag for targets that can
  * support expanded privileges

-- 
2.47.1


