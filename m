Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE5BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 20:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZ84WH17cmaqhOLzZnVtdcV+4jwRY2Bo5WKI6TnLcX4=; b=hCMnKon5vMZzmtkHWOrmgcFcxB
	vm/BplzTRF3wqu13B5bZP4P2McTONSw9wxMZU/pFDvKkm7KcrLZVVKbs3G5nNOphwU8GCBms2eNwi
	0ncr1tXsC4lV/w6kjq/I7VLp+v7D21bY7tZWzPh2OIvo7Wum8NdLV1YZJ6PyXDpZP1ky+Ql1P1AVE
	8zVzV72HM4Aw5+ElZPo6CMrbj07OJCCEisthNVoA70a2g9d39x0RPfDnXJMmpdq2Pm59x5xnr1Aia
	3i0SVfaiKnPAtdMeWTwyTsRmVQNZ9TttTVUMAVzuwzl5jk+wzqbKTUviHLMwDzoQPMmA3kVZBwSNP
	WIs07Hcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSIc-00000009b8b-1GHH;
	Sun, 05 Jul 2026 19:14:42 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSIY-00000009b2G-2pir
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:14:39 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso1341399f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 12:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278877; x=1783883677; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZ84WH17cmaqhOLzZnVtdcV+4jwRY2Bo5WKI6TnLcX4=;
        b=ZDIcaia5cK+TE+vIpBabZOwcB+UDGjW85eO42rrqy9CBDqxK8wIlr/zP1Zq1FXH6Fw
         OK4kPyXqvuzxPlwfFTrf9M6FZmnW9OzzE45nUDyA318RwE46pVOnD8WQwApPSYxxmVhe
         GBnQt0QbJX4XXjYPTN/MfGOluRR9ETOXd9p/A8i7W6H/TWXhyquNTAdFsbhMBAvK7Ibi
         PVETwwIwnD5L1tUsy925HVrt+l29Sgk8jQjaNycz/ABktdApl6S1m1CM+ghe5/NZBu2F
         uPb7D845h+F7q7pBcv7O6XRco1OGWk/t4b8Dhbn2MY4H91khuNw6y5eKWD5+WxHd7oWe
         ADew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278877; x=1783883677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nZ84WH17cmaqhOLzZnVtdcV+4jwRY2Bo5WKI6TnLcX4=;
        b=SaIKmzdka7adxjJLPagBMoCY94EtOH1rf6g/d4mLdQAW7iPY2o0+6x2OTpbMP+w9lW
         6IzELlz5h+fQaaINf7n8xAKKrNC2p388lbSq0JEZCbMOt2+rtJkTa3ngg4B3enReCd4Z
         6jlsH619gt3BYd5N5dq84BCGyVE0d262J1E5Kkk6EPhXrj+OCNKxluxTgnZdmIl1cvRm
         0AeKkZjM51zI+8ta/QzB52srO0GmDGc8RtTDCeYLyXHxG7iK/BzmuHtB9pYaKuTuLclY
         e0TVSDj1fHgTinSPCZjQREJkY3wYi9biasE1Rr8+lH2nyQCz0UMcDrdR3pfbCGJiLi0a
         tZYg==
X-Forwarded-Encrypted: i=1; AHgh+RoH6OVxuu5z1XV3kF6xe/nnsp8dobw1sImD5VSq+msYYNKv/eFgyiJ69eluJKoBG2z6UN4LBMfOdvo3ZZOEs6FI@lists.infradead.org
X-Gm-Message-State: AOJu0YzqqLTd0CdCb5LWN2Jk5sepHRu7oJXTHm6U/4P75aiXZzG6JmZa
	6D1wJpfZz9SS38XctEBj3PVBL8iFGjiDS9ACKhrYIB7hNGX4anf+tkc=
X-Gm-Gg: AfdE7cl+ph7LFhNnV3s8E7IRFlZPLzsoZykTxCY/UAhii5LdyawerIflhIzyZc3IYXu
	hG+n6BDnIjosW3HS2wUy3yrQWwzbvUI63MCJhyy36VCPjqCANcSG1iQqQDrz/stiK3bFigIZscc
	X3QWM05yIGt1n5cy8We9AjOJ3KuuAule6ckdTghpZo5f97WkDBT/y83D9CXNveAS2kM7syKNgBZ
	kj7QUof2ZPPZYAQL1ClAjL4Zp51QRptJjeXlIuBncTTAM+yDCIy1mX5a/ur859K5r9Jcv0H1Kva
	6uq2Wk7aeaq8bsm4LJP6fCje+hs51B5yvUadVbN21xdak8chvXsReX9ktQHxNUK+LeGB8yeAKh6
	kp2EYwsFdJEjMG68RZetNe8x+GFaJRNgS1TJWFGCTVdIgL6zcBBIgnYRxgsigjt2LwVtxVWcs+q
	nWSLfmwDc9wOK+T6n3nEK7XzWm7ppaFQ==
X-Received: by 2002:a05:6000:1846:b0:473:cefa:98da with SMTP id ffacd0b85a97d-47aaa60de86mr8534994f8f.10.1783278876921;
        Sun, 05 Jul 2026 12:14:36 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:36 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:46 +0200
Subject: [PATCH RFC 12/13] drm/msm: set ctxbank and asid based on ring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-12-01d50c3e0c99@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=1658;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=GNmboLcpB1u+4sbu+20YXtJhFgR6gBIC5iE7jNeRoQc=;
 b=rmC2QQUsBeGBctekJrkX9Bu4XpWytNrOy081NaDsxEdKs3EL5tzPk65CpjizWt1u9+G71Ip0Z
 pqDS3aq7HVdCwtuw5G8Lc0fcU6h3n5cTjmCTycxplXu/JrouOa8zMbf
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_121438_734363_78E5B09C 
X-CRM114-Status: GOOD (  11.84  )
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

qcom-arm-smmu always maps asid and ctxbank 1:1 and lpac is always 1

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 4417a9d04d7c..a8a061652ec2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -247,7 +247,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	phys_addr_t ttbr;
 	bool is_lpac = ring == a6xx_gpu->base.base.lpac_rb;
-	u32 asid;
+	u32 asid, ctxbank;
 	u64 memptr = rbmemptr(ring, ttbr0);
 
 	if (ctx->seqno == ring->cur_ctx_seqno)
@@ -256,6 +256,9 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	if (msm_iommu_pagetable_params(to_msm_vm(vm)->mmu, &ttbr, &asid))
 		return;
 
+	/* qcom-arm-smmu always maps asid and ctxbank 1:1 */
+	ctxbank = asid = is_lpac;
+
 	if (adreno_gpu->info->family >= ADRENO_7XX_GEN1) {
 		/* Wait for previous submit to complete before continuing: */
 		OUT_PKT7(ring, CP_WAIT_TIMESTAMP, 4);
@@ -313,7 +316,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 		CP_SMMU_TABLE_UPDATE_1_TTBR0_HI(upper_32_bits(ttbr)) |
 		CP_SMMU_TABLE_UPDATE_1_ASID(asid));
 	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_2_CONTEXTIDR(0));
-	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_3_CONTEXTBANK(0));
+	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_3_CONTEXTBANK(ctxbank));
 
 	/*
 	 * Write the new TTBR0 to the memstore. This is good for debugging.

-- 
2.54.0


