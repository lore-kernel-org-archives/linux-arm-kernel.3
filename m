Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D5CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 19:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8zcaiL31SCCh1YPdlPY6GbxJWdviTylW/ogJ//b4zE=; b=VgtB1k79G5KUvise7+Lw7d89RU
	UTDFas3tUtsAM26oR72H0+9xxsWkeRFUOODVAV4SeJAaDYzxrLOO22ykGwPW07KbB8O67fdiO8j1u
	o8wlRHe2bdQ5QMF8kBwvFck4ZX4Qrv4d3k3DNWOAySfCDnZThVqX/izpfv7v+ISL9nD5BMoIE1RPr
	2h/DNDjD+Dmvd7kD/TL0mdWRAivP2FwnzbZX/rhA5/cwSXAsDhNZ2VfWw66BEXaGfzslZt6VQp0bT
	3BHGetYFPGfcNLbw6VAY1GbcwM1EpS5V7vFjr1qxEoorgYdwcdF1YWQpfiPJRkOevhoIpKClBZ1D/
	NRvW7IsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSIe-00000009bBw-2Ury;
	Sun, 05 Jul 2026 19:14:44 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSIa-00000009b4q-3L5w
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:14:41 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493c733f15aso23263365e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 12:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278879; x=1783883679; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C8zcaiL31SCCh1YPdlPY6GbxJWdviTylW/ogJ//b4zE=;
        b=JJG4gckQ5YH4Yj5wokQ+wLMqI2+/ZRoqwAt9jiwGjryhC9ZIaJYIBLnZzecL0ns5Sx
         4apgeXo8Qy6O0vIOygJOWdwpzc2/WoxfsehXPpesRWNqfO6UIw9kVoVIrlPaWrH8kmmm
         OBGdEREQ/tJOvfIW9nswjySSwY9uHdyJwORCK4kjIza9e69hPtBhwxiS9xe6+8hf6FMT
         yihla7iZTkbR3zAWESvY5Ri7LbiQqFyCW8Tojn7zbeeKsn3MW4dqiWQ19Rb3a5dEeio/
         Uvfc5Lnyj4ReDcPj+5zb+ziS+hnsVd6+OEXj+YA5scv/KjWDqP2+p6VBeatz28K4FaUZ
         /DTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278879; x=1783883679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C8zcaiL31SCCh1YPdlPY6GbxJWdviTylW/ogJ//b4zE=;
        b=IhawrkUdn7KhVj8hsGTHS1fhPTJjxcvjNfuTfH9hwhqcBam+3nRJzrb1NvkGXksBtq
         +vPpWvdbiYIVL11iC+CE+kqQ/426gdA3FdPtzJZy/1cRRmtSbRSxIanouo9Y6kM7h4sj
         yoYHtaWcEKwbLXWIB1rYFk0J64SA1MFmW+amfxbm3H/zYvo+Gg8S9y+ZBPx1FcU9ubIC
         m6P7+dsErpK0kRuU9APgZsKEnSSEkZK01NeKxZrNMXeqHCsrJJ/KlCx5i7BlagpS62Vw
         pqy6EDPUe2+gUlVUdwL+y59STReDBdxsQlv56RKMgLtK1wbtj6LYrI6US9Q6tF9/gqvd
         O0aQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9+eWNjYouzpIa1CGbxtgs6mIfA1nk1Dq539+kygb7hMNH2FAsLv8jgtYKHqIUG9DZdhTmb42nNWOfFM/AcyhB@lists.infradead.org
X-Gm-Message-State: AOJu0YwCNiSF/BaL6+vfdVHnnK0zSJeAhCNCtdCWO5nLCuBvD1XPKzXt
	fohO+ozBCA4/vHiqzJoKwim0WneMBu9Nd3MjbVtWoEwGFLdYbpr0ppA=
X-Gm-Gg: AfdE7cmSHZ2CRSKXkKtwcu0/dk6nF237z38HiPCY7ju1QxGDdUv/HSmdJkkifs6pSEU
	DUCm9FWA09SFIPUW8B0/t9E3RBM5xXc2BFsrokh3zthlfnycm9ERKycy907RNuJ3Mgu8kjzlngo
	eHdjBCgE+NdMiqfZ2mtw3ZDSFajjFwr70s0Zes4wWD/b9g9aXe3PEmtaCrJBxvmONddY9Gx90pu
	geGIYQFMjKePvELv8j9j0V6buJV+EgEjwiwRkeAsuc6lFokCJsJ/J7mRGe64JVo++luM5wqh8uE
	wEu9KFVj4S3SL5FsOEHY490wx0zeQuQsPHmK64tdCr5zEBcfu9prB14rpxoBO1zt+v/FMIgmaJp
	iyrZSH3Kd8ebpRgAN1KlViNwMM92DZeZbu3CyYoNj5cbb4LroAniHDqnqrVN0U0i9ccHt10b6rd
	ymexIW/DE/7iHKikE=
X-Received: by 2002:a05:600c:c16f:b0:492:523f:a3df with SMTP id 5b1f17b1804b1-493d52ac417mr60885215e9.5.1783278878843;
        Sun, 05 Jul 2026 12:14:38 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:38 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:47 +0200
Subject: [PATCH RFC 13/13] drm/msm: add lpac ring to devcoredump
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-13-01d50c3e0c99@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=2731;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=wmCqgt9bbc7y6girDLeQUG/lasgVe98klmVzcoHOM/o=;
 b=PVK05TezP6oByIlmJqXX6RCKZc0Sfa+FvqbaJD2D2MNQt18wh5zplyqPzMUoPj4wq2v3x/AHS
 ORhKtsBbYDeCcbFNugaM2rR3PLhNr8TrJkg/x8sEhnkPAzo9vnVPIw+
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_121440_869896_472351E1 
X-CRM114-Status: GOOD (  14.54  )
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

Add the LPAC ring state to the devcoredump for debugging.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 19 ++++++++++---------
 drivers/gpu/drm/msm/msm_gpu.h           |  2 +-
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 94dbec9464a4..030bb1aeb7ee 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -782,25 +782,26 @@ int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state)
 
 	ktime_get_real_ts64(&state->time);
 
-	for (i = 0; i < gpu->nr_rings; i++) {
+	for (i = 0; i < gpu->nr_rings + !!gpu->lpac_rb; i++) {
+		struct msm_ringbuffer *ring = i < gpu->nr_rings ? gpu->rb[i] : gpu->lpac_rb;
 		int size = 0, j;
 
-		state->ring[i].fence = gpu->rb[i]->memptrs->fence;
-		state->ring[i].iova = gpu->rb[i]->iova;
-		state->ring[i].seqno = gpu->rb[i]->fctx->last_fence;
-		state->ring[i].rptr = get_rptr(adreno_gpu, gpu->rb[i]);
-		state->ring[i].wptr = get_wptr(gpu->rb[i]);
+		state->ring[i].fence = ring->memptrs->fence;
+		state->ring[i].iova = ring->iova;
+		state->ring[i].seqno = ring->fctx->last_fence;
+		state->ring[i].rptr = get_rptr(adreno_gpu, ring);
+		state->ring[i].wptr = get_wptr(ring);
 
 		/* Copy at least 'wptr' dwords of the data */
 		size = state->ring[i].wptr;
 
 		/* After wptr find the last non zero dword to save space */
 		for (j = state->ring[i].wptr; j < MSM_GPU_RINGBUFFER_SZ >> 2; j++)
-			if (gpu->rb[i]->start[j])
+			if (ring->start[j])
 				size = j + 1;
 
 		if (size) {
-			state->ring[i].data = kvmemdup(gpu->rb[i]->start, size << 2, GFP_KERNEL);
+			state->ring[i].data = kvmemdup(ring->start, size << 2, GFP_KERNEL);
 			if (state->ring[i].data)
 				state->ring[i].data_size = size << 2;
 		}
@@ -1001,7 +1002,7 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 
 	drm_puts(p, "ringbuffer:\n");
 
-	for (i = 0; i < gpu->nr_rings; i++) {
+	for (i = 0; i < gpu->nr_rings + !!gpu->lpac_rb; i++) {
 		drm_printf(p, "  - id: %d\n", i);
 		drm_printf(p, "    iova: 0x%016llx\n", state->ring[i].iova);
 		drm_printf(p, "    last-fence: %u\n", state->ring[i].seqno);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 263dafeb9652..4fbf0dedc334 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -639,7 +639,7 @@ struct msm_gpu_state {
 		void *data;
 		int data_size;
 		bool encoded;
-	} ring[MSM_GPU_MAX_RINGS];
+	} ring[MSM_GPU_MAX_RINGS+1];
 
 	int nr_registers;
 	u32 *registers;

-- 
2.54.0


