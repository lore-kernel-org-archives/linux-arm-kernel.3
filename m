Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E3DC44500
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 19:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eucsPGNd22T7/L/fPweBTQcc98PLGSu6dgszPF9AEJg=; b=fPhx3LetCrZvFjiUc0eQf3uvQa
	Ni5i4Gn7Eby0VJNEJReKdjKQhVNDrxt4ma1HxmCvwmEJ0ySW8pjVAZCY78jj0xuiSfxeV1FOuxFek
	6WFaFNSOzQlZyOvzLn52a4xE/bfsZ2AT6rkHlJfZOXLKebS6o/rEz11wg6nax6BGGpPsujL2e0WNY
	tMOofuMYlnlBYHrZ3PFU2JMN4rsSa7MZ1XOojejERsJBpk31EVcvSr01vlvswh9oQcWbjX/Esn3si
	rx7T/xw8qbmUOFIRcVVLcq50MAO0v6yuT06Rnmmuvxd+A6r7KMwXHMLIiaJvz00tInmM4Sqi/2jNW
	hduB30ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSIY-00000009b3K-3HJs;
	Sun, 05 Jul 2026 19:14:38 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSIV-00000009axl-08xC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:14:37 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47362928f65so2230113f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 12:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278873; x=1783883673; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eucsPGNd22T7/L/fPweBTQcc98PLGSu6dgszPF9AEJg=;
        b=OLGUaZdLAjKetoy6jK+LqtYn7YBQtzOtqB7Sa2eZ10DJMgnH7D17srYHFhnXX+Be3q
         HIMf6x5KL4U/fzzOLxaD+t9YDNxAJGpV7+U3wDdqWucWGyKPnGTWdWOTjoQ7MA4+12en
         buoUgOFSK6ZN/rJVpZZzv3+H+3n3JJFLKkwdXD1QJg13qoPvr9Y0JpeajhymkcJpFViX
         BDD/6RRuoPzl7a0NQFBNoeWcdxfTTkQ6kEaTECQB5HbgFQM3iiZ1tfGFZ2JdfArvRgzd
         MEMoFI8XnOewWYfUqRcSJ4UEKZAr788fDe8gy+8Zr05x9g1Xvsl7szO3ezfxFmZIEVJ+
         RHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278873; x=1783883673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eucsPGNd22T7/L/fPweBTQcc98PLGSu6dgszPF9AEJg=;
        b=J3h7dQxaW90/Xgt7yu8mCWj0tYA3Ut+1+ZN68VdmhGDMkyg+6BAUFKdx855loq+4x/
         NwCmDrfRnF9K+epthhzE1eEouW/cF9crBSJ4vXeiqVtHQnvAKvndz9BAThPz8wZ7sFq5
         x9YwhzpV+voVTwiRw+tY6W6Ql66Eg3XgPGDGzoT8bOsGxcbr0wk0cPzHVc3PefjMQLW6
         BAI9V/61K5N8kjPe4V/c8e8tpnetnGwdzvZ2llaqRBrbheUqGC1BVwH8f29wpOqiemWk
         VtrxkYmoB5vN6QrvYfG8w1O7uYmx6OMbC/B0Usyym8QfrAwSTFyEiEBNhGKjXO1EhqbI
         cplQ==
X-Forwarded-Encrypted: i=1; AHgh+RooeuOrKG4ymzDaRkE1kN5qxDA58RjsRMhBtYF4UsqAuXV9+S+bRn9ygGKMvLlQcBZwL7wlyme+QAzXa67TX2rK@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr0OgNCFFdAZdGDoNxnOuRAceGOzzHKdULT8Yu0H4Ml4UGV+1t
	gv7Vqn/89bIETB75fuZBn/H5DMXbHFtvzQlSafwE5hZm3ykz6VGJlXI=
X-Gm-Gg: AfdE7cnH+g7Qyx5Ux+dA4/jPeWI+WP2zxbCbObYDm3koW/SPcWghHoqAisOHp4YQdjw
	QyWuChopOvmF08ACW/4rAyZdH80O+3Pd4ZyEhROBMJ4uYjy3C+OINMC9Vn5lTdgma/rdZ1dGPu5
	N8+neyxyeDh3Zz0/AB7sCGRJAdJTmoVAQEKUFJaITD/1UA1pYBjtPTqRw7JGOAwz3kk3MyT3Fff
	D/y2ONQW/4rr/jDU8md+dZfl0Qi0n73ReQkO2xlMCSLyi6MKlfxlaCworPvXtu1WJAGQFek9j8O
	pB5QMCHRnH+plTHDlLWo1VTmQZUEcxHm3QoVWSc0PSqfvkdO+TQp0g+7XqvfEmxWtJiAS4eoKuu
	NUMXD1ZFC8goES0F9nFwbbWa9xaDVN6UdLOniCvejythziOKLWmib28O8gjZJ3QivnOhhe/xvkO
	ysNlDbrlqpOSygR8J7pNbwIfu1HP8K8A==
X-Received: by 2002:a05:6000:18a3:b0:472:d857:5d39 with SMTP id ffacd0b85a97d-47aa91cad30mr9118667f8f.0.1783278873152;
        Sun, 05 Jul 2026 12:14:33 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:32 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:44 +0200
Subject: [PATCH RFC 10/13] drm/msm: initialize LPAC ring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-10-01d50c3e0c99@gmail.com>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=12456;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=US11y6MspkBO1wtbA8nmNx+MkENKkTwPRtQtLRAoYd0=;
 b=lj7oKumXTSdxDfAq0n1MJNK9Z10T2woYTOMUT5AqzVpbmXRZpRS/zOOTFgZ/nAGBm7NO1T56Z
 Hboji/xg/o9CIrqQ/JK6Px0J9pNGRTOb2KBPjVHktDKn6B6BDhdnNYg
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_121435_198277_548B8776 
X-CRM114-Status: GOOD (  26.83  )
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

Program all the register needed to start up LPAC and send initialization
sequence.

Additionally, now that the LPAC ring is live, make the code aware of it.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c  |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 98 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/adreno_device.c |  6 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 32 ++++++----
 drivers/gpu/drm/msm/msm_gpu.c              | 21 ++++++-
 drivers/gpu/drm/msm/msm_gpu.h              |  9 +++
 6 files changed, 148 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 3e6f409d13a2..5ee00eead14c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1394,6 +1394,7 @@ static const u32 a750_ifpc_reglist_regs[] = {
 	REG_A6XX_SP_NC_MODE_CNTL,
 	REG_A6XX_CP_DBG_ECO_CNTL,
 	REG_A6XX_CP_PROTECT_CNTL,
+	REG_A6XX_CP_LPAC_PROTECT_CNTL,
 	REG_A6XX_CP_PROTECT(0),
 	REG_A6XX_CP_PROTECT(1),
 	REG_A6XX_CP_PROTECT(2),
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 8b3bb2fd433b..9f69aada9b7b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -168,6 +168,18 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 
 	update_shadow_rptr(gpu, ring);
 
+	if (ring == gpu->lpac_rb) {
+		/* Copy the shadow to the actual register */
+		ring->cur = ring->next;
+
+		/* Make sure to wrap wptr if we need to */
+		wptr = get_wptr(ring);
+
+		a6xx_fenced_write(a6xx_gpu, REG_A7XX_CP_LPAC_RB_WPTR, wptr, BIT(3), false);
+
+		return;
+	}
+
 	spin_lock_irqsave(&ring->preempt_lock, flags);
 
 	/* Copy the shadow to the actual register */
@@ -730,6 +742,12 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 		  A6XX_CP_PROTECT_CNTL_ACCESS_FAULT_ON_VIOL_EN |
 		  A6XX_CP_PROTECT_CNTL_LAST_SPAN_INF_RANGE);
 
+	//TODO if LPAC
+	gpu_write(gpu, REG_A6XX_CP_LPAC_PROTECT_CNTL,
+		  A6XX_CP_PROTECT_CNTL_ACCESS_PROT_EN |
+		  A6XX_CP_PROTECT_CNTL_ACCESS_FAULT_ON_VIOL_EN |
+		  A6XX_CP_PROTECT_CNTL_LAST_SPAN_INF_RANGE);
+
 	for (i = 0; i < protect->count - 1; i++) {
 		/* Intentionally skip writing to some registers */
 		if (protect->regs[i])
@@ -972,6 +990,53 @@ static int a7xx_cp_init(struct msm_gpu *gpu)
 	return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
 }
 
+static int lpac_cp_init(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct msm_ringbuffer *ring = gpu->lpac_rb;
+	u32 mask;
+
+	OUT_PKT7(ring, CP_ME_INIT, 7);
+
+	/* Use multiple HW contexts */
+	mask = BIT(0);
+
+	/* Enable error detection */
+	mask |= BIT(1);
+
+	/* Set default reset state */
+	mask |= BIT(3);
+
+	/* Disable save/restore of performance counters across preemption */
+	mask |= BIT(6);
+
+	/* Enable the register init list with the spinlock */
+	mask |= BIT(8);
+
+	OUT_RING(ring, mask);
+
+	/* Enable multiple hardware contexts */
+	OUT_RING(ring, 0x00000003);
+
+	/* Enable error detection */
+	OUT_RING(ring, 0x20000000);
+
+	/* Operation mode mask */
+	OUT_RING(ring, 0x00000002);
+
+	/* *Don't* send a power up reg list for concurrent binning (TODO) */
+	/* Lo address */
+	OUT_RING(ring, lower_32_bits(a6xx_gpu->pwrup_reglist_iova));
+	/* Hi address */
+	OUT_RING(ring, upper_32_bits(a6xx_gpu->pwrup_reglist_iova));
+	/* BIT(31) set => read the regs from the list */
+	OUT_RING(ring, BIT(31));
+
+	a6xx_flush(gpu, ring);
+	return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
+}
+
 /*
  * Check that the microcode version is new enough to include several key
  * security fixes. Return true if the ucode is safe.
@@ -1096,7 +1161,7 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
 	if ((adreno_gpu->base.hw_apriv || a6xx_gpu->has_whereami) &&
 	    !a6xx_gpu->shadow_bo) {
 		a6xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
-						      sizeof(u32) * gpu->nr_rings,
+						      sizeof(u32) * (gpu->nr_rings + !!gpu->lpac_rb),
 						      MSM_BO_WC | MSM_BO_MAP_PRIV,
 						      gpu->vm, &a6xx_gpu->shadow_bo,
 						      &a6xx_gpu->shadow_iova);
@@ -1289,6 +1354,8 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_UCHE_CACHE_WAYS, 0x4);
 	}
 
+	gpu_rmw(gpu, REG_A6XX_UCHE_DEBUG_CNTL_1, BIT(30), BIT(30));
+
 	if (adreno_is_a640_family(adreno_gpu) || adreno_is_a650_family(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x02000140);
 		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x8040362c);
@@ -1386,6 +1453,11 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_CP_CHICKEN_DBG, BIT(24));
 	}
 
+	gpu_write(gpu, REG_A7XX_CP_LPAC_CHICKEN_DBG, 0x1);
+
+	gpu_write(gpu, REG_A7XX_SP_CHICKEN_BITS_2, BIT(4));
+	gpu_write(gpu, REG_A7XX_SP_LPAC_CHICKEN_BITS_2, BIT(4));
+
 	if (adreno_is_a690(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x90);
 	/* Set dualQ + disable afull for A660 GPU */
@@ -1437,13 +1509,17 @@ static int hw_init(struct msm_gpu *gpu)
 	/* Set the ringbuffer address */
 	gpu_write64(gpu, REG_A6XX_CP_RB_BASE, gpu->rb[0]->iova);
 
+	/* Set the ringbuffer address for lpac */
+	gpu_write64(gpu, REG_A7XX_CP_LPAC_RB_BASE, gpu->lpac_rb->iova);
+
 	/* Targets that support extended APRIV can use the RPTR shadow from
 	 * hardware but all the other ones need to disable the feature. Targets
 	 * that support the WHERE_AM_I opcode can use that instead
 	 */
-	if (adreno_gpu->base.hw_apriv)
+	if (adreno_gpu->base.hw_apriv) {
 		gpu_write(gpu, REG_A6XX_CP_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
-	else
+		gpu_write(gpu, REG_A7XX_CP_LPAC_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
+	} else
 		gpu_write(gpu, REG_A6XX_CP_RB_CNTL,
 			MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE);
 
@@ -1451,7 +1527,10 @@ static int hw_init(struct msm_gpu *gpu)
 	if (a6xx_gpu->shadow_bo) {
 		gpu_write64(gpu, REG_A6XX_CP_RB_RPTR_ADDR,
 			shadowptr(a6xx_gpu, gpu->rb[0]));
-		for (unsigned int i = 0; i < gpu->nr_rings; i++)
+		if (gpu->lpac_rb)
+			gpu_write64(gpu, REG_A7XX_CP_LPAC_RB_RPTR_ADDR,
+				shadowptr(a6xx_gpu, gpu->lpac_rb));
+		for (unsigned int i = 0; i < (gpu->nr_rings + !!gpu->lpac_rb); i++)
 			a6xx_gpu->shadow[i] = 0;
 	}
 
@@ -1469,9 +1548,16 @@ static int hw_init(struct msm_gpu *gpu)
 	for (i = 0; i < gpu->nr_rings; i++)
 		gpu->rb[i]->cur_ctx_seqno = 0;
 
+	if (gpu->lpac_rb)
+		gpu->lpac_rb->cur_ctx_seqno = 0;
+
 	/* Enable the SQE_to start the CP engine */
 	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 1);
 
+	/* Enable the LPAC SQE_to start the CP engine */
+	//TODO is this needed? Doesn't fw do this at init?
+	gpu_write(gpu, REG_A6XX_CP_LPAC_SQE_CNTL, 1);
+
 	if (adreno_is_a7xx(adreno_gpu) && !a6xx_gpu->pwrup_reglist_emitted) {
 		a7xx_patch_pwrup_reglist(gpu);
 		a6xx_gpu->pwrup_reglist_emitted = true;
@@ -1481,6 +1567,10 @@ static int hw_init(struct msm_gpu *gpu)
 	if (ret)
 		goto out;
 
+	ret = lpac_cp_init(gpu);
+	if (ret)
+		goto out;
+
 	/*
 	 * Try to load a zap shader into the secure world. If successful
 	 * we can use the CP to switch out of secure mode. If not then we
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 7f20320ef66a..881fa09f3943 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -349,6 +349,9 @@ static void suspend_scheduler(struct msm_gpu *gpu)
 
 		drm_sched_wqueue_stop(sched);
 	}
+
+	if (gpu->lpac_rb)
+		drm_sched_wqueue_stop(&gpu->lpac_rb->sched);
 }
 
 static void resume_scheduler(struct msm_gpu *gpu)
@@ -360,6 +363,9 @@ static void resume_scheduler(struct msm_gpu *gpu)
 
 		drm_sched_wqueue_start(sched);
 	}
+
+	if (gpu->lpac_rb)
+		drm_sched_wqueue_start(&gpu->lpac_rb->sched);
 }
 
 static int adreno_system_suspend(struct device *dev)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 6a48e211fa3c..94dbec9464a4 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -655,6 +655,22 @@ struct drm_gem_object *adreno_fw_create_bo(struct msm_gpu *gpu,
 	return bo;
 }
 
+static inline void init_ring(struct msm_ringbuffer *ring)
+{
+	ring->cur = ring->start;
+	ring->next = ring->start;
+	ring->memptrs->rptr = 0;
+	ring->memptrs->bv_fence = ring->fctx->completed_fence;
+
+	/* Detect and clean up an impossible fence, ie. if GPU managed
+	 * to scribble something invalid, we don't want that to confuse
+	 * us into mistakingly believing that submits have completed.
+	 */
+	if (fence_before(ring->fctx->last_fence, ring->memptrs->fence)) {
+		ring->memptrs->fence = ring->fctx->last_fence;
+	}
+}
+
 int adreno_hw_init(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -679,20 +695,12 @@ int adreno_hw_init(struct msm_gpu *gpu)
 		if (!ring)
 			continue;
 
-		ring->cur = ring->start;
-		ring->next = ring->start;
-		ring->memptrs->rptr = 0;
-		ring->memptrs->bv_fence = ring->fctx->completed_fence;
-
-		/* Detect and clean up an impossible fence, ie. if GPU managed
-		 * to scribble something invalid, we don't want that to confuse
-		 * us into mistakingly believing that submits have completed.
-		 */
-		if (fence_before(ring->fctx->last_fence, ring->memptrs->fence)) {
-			ring->memptrs->fence = ring->fctx->last_fence;
-		}
+		init_ring(ring);
 	}
 
+	if (gpu->lpac_rb)
+		init_ring(gpu->lpac_rb);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 18ed00e5f143..932e2a7c24b3 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -739,8 +739,8 @@ static void retire_submits(struct msm_gpu *gpu)
 	int i;
 
 	/* Retire the commits starting with highest priority */
-	for (i = 0; i < gpu->nr_rings; i++) {
-		struct msm_ringbuffer *ring = gpu->rb[i];
+	for (i = 0; i < gpu->nr_rings + !!gpu->lpac_rb; i++) {
+		struct msm_ringbuffer *ring = i < gpu->nr_rings ? gpu->rb[i] : gpu->lpac_rb;
 
 		while (true) {
 			struct msm_gem_submit *submit = NULL;
@@ -782,6 +782,9 @@ void msm_gpu_retire(struct msm_gpu *gpu)
 	for (i = 0; i < gpu->nr_rings; i++)
 		msm_update_fence(gpu->rb[i]->fctx, gpu->rb[i]->memptrs->fence);
 
+	if (gpu->lpac_rb)
+		msm_update_fence(gpu->lpac_rb->fctx, gpu->lpac_rb->memptrs->fence);
+
 	kthread_queue_work(gpu->worker, &gpu->retire_work);
 }
 
@@ -973,7 +976,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	}
 
 	memptrs = msm_gem_kernel_new(drm,
-		sizeof(struct msm_rbmemptrs) * nr_rings,
+		sizeof(struct msm_rbmemptrs) * (nr_rings + 1),
 		check_apriv(gpu, MSM_BO_WC), gpu->vm, &gpu->memptrs_bo,
 		&memptrs_iova);
 
@@ -1006,6 +1009,15 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		memptrs_iova += sizeof(struct msm_rbmemptrs);
 	}
 
+	gpu->lpac_rb = msm_ringbuffer_new(gpu, nr_rings, memptrs, memptrs_iova);
+
+	if (IS_ERR(gpu->rb[i])) {
+		ret = PTR_ERR(gpu->rb[i]);
+		DRM_DEV_ERROR(drm->dev,
+					  "could not create lpac ringbuffer %d\n", ret);
+		goto fail;
+	}
+
 	gpu->nr_rings = nr_rings;
 
 	refcount_set(&gpu->sysprof_active, 1);
@@ -1046,6 +1058,9 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 		gpu->rb[i] = NULL;
 	}
 
+	msm_ringbuffer_destroy(gpu->lpac_rb);
+	gpu->lpac_rb = NULL;
+
 	msm_gem_kernel_put(gpu->memptrs_bo, gpu->vm);
 
 	if (!IS_ERR_OR_NULL(gpu->vm)) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 271956e7f870..9a213fb65b4f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -181,6 +181,8 @@ struct msm_gpu {
 	struct msm_ringbuffer *rb[MSM_GPU_MAX_RINGS];
 	int nr_rings;
 
+	struct msm_ringbuffer *lpac_rb;
+
 	/**
 	 * sysprof_active:
 	 *
@@ -323,6 +325,13 @@ static inline bool msm_gpu_active(struct msm_gpu *gpu)
 			return true;
 	}
 
+	if (gpu->lpac_rb) {
+		struct msm_ringbuffer *ring = gpu->lpac_rb;
+
+		if (fence_after(ring->fctx->last_fence, ring->memptrs->fence))
+			return true;
+	}
+
 	return false;
 }
 

-- 
2.54.0


