Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4697C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 20:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3UKLAKS32/3D/mX73DiA7ewZNIUl/OD69FTo/T8pQI=; b=mY8ml8ueR899oVHlWlLKMqoc31
	k5VcsJBzZxO0/cav/ZFs2rqTCNVc6XSFkzTgRktGS6EXhlhW3g2CFHAIYUerbgdaA8zo0tsNTqYyG
	Udz5K2MUfHlvpeuyuwYhwRbV9UDF2yrpwod51Kr2ASjeMwhl0ohUFM1w0FoyLDTZuAQ1NrHgDvzgZ
	74OFa1afLkqaH9tWaOvHk4eyFFGOYYP5yELUFnJXZ4i/nKz1K133cDZtLes1g2dhnUuv3gLZ5cH+2
	lG/RdimFogZQQmV9p7wSBAvCA8DPPAPReqGRGKeChlFbfvugiisNmS6V/JyjXjPoP7Jg/x52KWYui
	F8Fwxm5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFeu2-00000001lLh-2Edj;
	Thu, 15 May 2025 20:10:02 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFek3-00000001k7d-0ZKl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 19:59:44 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7c964e8710eso10664685a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 12:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747339182; x=1747943982; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L3UKLAKS32/3D/mX73DiA7ewZNIUl/OD69FTo/T8pQI=;
        b=ATecFcSIEjGodPtBkhZrfcXxie+ROSovIIcrTNEBXkDirnAGnv1H/QxAoB4zsKtlt/
         cgFyzrOxmoeJYshEYcWv6FKE9qs6X4mERwcyPaTQSiH0ru2xeXNawOFrkJXVl0JQjb0H
         rkQIqglfjVu7SCUgUezjABrzcseBwNWcEMpSKakOqUljfXwSSam7DNIFso+vrstX26Za
         TmEOpNCgSWZD7jO8VH7EP0UI6Wca5nbHC7aR+BgLFHVHqVTWZARoWnabx/hCfCDjBFbs
         fmEfNOdo4Kro/BIG/cUwzh7NNIyDZBkqHWMBJLNUdjzWIL6E55MOybSrOT/HPwNsXU1X
         cdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747339182; x=1747943982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L3UKLAKS32/3D/mX73DiA7ewZNIUl/OD69FTo/T8pQI=;
        b=CUN3NDO1JXv0Z26lA7MP3i9tIAoB2F2G/6rjpTv3YZwc5S6D9jtqb6ISK7eEY4c17E
         Ctw0L598eag/9ZVZa41bpUP59BXO1NmDC85UnTTKCxuW2p5Gt/fMaINeOEYGURd+AyDA
         Sf+v85N3DzRwx/i7oiINU1WERSoYo4yK7Nk1W5r+mwe5H+f/2tJcE/n81BqIh8m7lHvs
         6fGotXumL4WzfGfPGWrZiw/qHiPHMqTpBP0RIhIv22zSqUfb2y3QjcOEGe5R5sFhi7r0
         DML8YPGi65J6kNQo2y4vXgfZ0VafYqByQ7gOTpvlWX/T5ae+5R3s+SEZZvfIvWrXkTB7
         VuLA==
X-Forwarded-Encrypted: i=1; AJvYcCWpRlwWOEoeutgjdWEapz0YQMnJDZV4JCeRpk42XpTnZZdyHgWOc96XXDEevQn1O8a3tLamsxh/6TZLmbq6lNGI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7E4LjhNoYpkdN6vXPR2PMPoW0v9r//07E25uhaJcQfCpMEQCc
	9cDw4HO4IUAZu3wJxlW86PCKbckZaetFTMtkH7RtHYZ5wnv4eKM5jbNh
X-Gm-Gg: ASbGncscg8M84wGLMdXL5DI3I+i960G8QUJDmqgFF1xaFeZ4sUwhuedeuf0Y7DS9/C4
	QGPOcWjmCQrp9W3NIzbScBw+CI/NkGA/rqW4oLi8ErjD8XLaXfQXeK2/3YgceJAQkIbRkV+I0Md
	HLqmj+ldKz1fLvuecxNr9JTjHykloQGbraCpgCnMjT6zt1hezxuJd9r/TbYz0gk8QleRZD0Sut1
	3ZGkqa99gKTq3SFtMHCPqYbb8PlNue1xrUsLXxfPjxxdI+UybLAK9e3+nDJEmaRSENwwWTkBtHi
	AilTm8t4FI4RtcNSeP8ODF14+7idugX2I7lx8dbsOwpJIoA74pbvEsxUU+GFxXvj9GaENuWSoDA
	RsL8Xo7oB9zA6G2tRZqg=
X-Google-Smtp-Source: AGHT+IEQjQf0fT8qgLmZr+6iLcHLgcDi9fUiiL8m/7lrWjaOZGrI3mQflKlah/0QM9S0VMm54v4xhA==
X-Received: by 2002:a05:622a:10f:b0:472:58b:463f with SMTP id d75a77b69052e-494ae3307c5mr4501831cf.3.1747339181799;
        Thu, 15 May 2025 12:59:41 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae4fd80bsm1957231cf.56.2025.05.15.12.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:59:41 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 15 May 2025 15:58:46 -0400
Subject: [PATCH v6 4/7] drm/msm: Don't use a worker to capture fault
 devcoredump
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-msm-gpu-fault-fixes-next-v6-4-4fe2a583a878@gmail.com>
References: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
In-Reply-To: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747339176; l=6005;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=BC6iPoxvTfFoKvzZxMJ/DcbtAIrxCCZiQQVyyoYGKgg=;
 b=ax8wqfUD5w5AtJIx8e8BSTWwfIH8+CcskJsen4Q3OMpNIsG3qxBGWU8xdKN5yMT7NKGAIwiIj
 mK9QryMx8yFBhA3Ab0QKac/sXryZHyNB7WLh9EIpKIqDfcynBiP1okG
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_125943_179267_958743B0 
X-CRM114-Status: GOOD (  19.26  )
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
index 1238f326597808eb28b4c6822cbd41a26e555eb9..1a4069a73aa42821cb9af7871e6ff8ec7b44d1ef 100644
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
 		del_timer(&gpu->hangcheck_timer);
 
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
index 0d4a3744cfcbd2662d27f9929ff691581707325b..8ea8991aa40931c4c3d1a60c433fcd1aeccc45ff 100644
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
@@ -299,7 +301,8 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 }
 #else
 static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
-		struct msm_gem_submit *submit, char *comm, char *cmd)
+		struct msm_gem_submit *submit, struct msm_gpu_fault_info *fault_info,
+		char *comm, char *cmd)
 {
 }
 #endif
@@ -396,7 +399,7 @@ static void recover_worker(struct kthread_work *work)
 
 	/* Record the crash state */
 	pm_runtime_get_sync(&gpu->pdev->dev);
-	msm_gpu_crashstate_capture(gpu, submit, comm, cmd);
+	msm_gpu_crashstate_capture(gpu, submit, NULL, comm, cmd);
 
 	kfree(cmd);
 	kfree(comm);
@@ -450,9 +453,8 @@ static void recover_worker(struct kthread_work *work)
 	msm_gpu_retire(gpu);
 }
 
-static void fault_worker(struct kthread_work *work)
+void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_info *fault_info)
 {
-	struct msm_gpu *gpu = container_of(work, struct msm_gpu, fault_work);
 	struct msm_gem_submit *submit;
 	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
 	char *comm = NULL, *cmd = NULL;
@@ -475,16 +477,13 @@ static void fault_worker(struct kthread_work *work)
 
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
 
@@ -873,7 +872,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	init_waitqueue_head(&gpu->retire_event);
 	kthread_init_work(&gpu->retire_work, retire_worker);
 	kthread_init_work(&gpu->recover_work, recover_worker);
-	kthread_init_work(&gpu->fault_work, fault_worker);
 
 	priv->hangcheck_period = DRM_MSM_HANGCHECK_DEFAULT_PERIOD;
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 7cabc8480d7c5461ab8d8726fcc21690cbaf7366..ec83327779c4beb733cb38c932206245ab9bd2f2 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -245,12 +245,6 @@ struct msm_gpu {
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
 
@@ -697,6 +691,8 @@ static inline void msm_gpu_crashstate_put(struct msm_gpu *gpu)
 	mutex_unlock(&gpu->lock);
 }
 
+void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_info *fault_info);
+
 /*
  * Simple macro to semi-cleanly add the MAP_PRIV flag for targets that can
  * support expanded privileges

-- 
2.47.1


