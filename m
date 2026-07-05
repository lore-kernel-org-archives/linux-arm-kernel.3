Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC77C43602
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 19:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gs7XFy3FD2pLHB50oDAQT+DRMjBuMolL1OQX4I1ZUY=; b=b5NCYoUe9ABTEFDoy2nUp9WfTL
	pL+cB8Nd7WQ0HsiBD2brGv2kX59lukRavPNrjT/BY8CAplJEaOvdCgDF1OLaEkSDkU8km+QkJ6azj
	xbtoYKsiTE7yNO0mpDWlr0U+emmxYuh5f2H/pDmcUylKe63zgdV3oGUZKRLkf3IKZWntymZ3nFJbc
	ySPAYH8AdHOlDpFHvXlhwvC/O7bEu4uBV9zEvr1biYRhkRiEAyB3GjwkvJOFyB1u0idtSqK5Wi0yG
	NjMiA0413aSB88+/DSFsCJqIGhBWIEJrQWFv9sYrA65xTh/FHX4DKV7tOxtenIbPqkt+iOqgNontG
	Y02p1gtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSII-00000009alc-0gPM;
	Sun, 05 Jul 2026 19:14:22 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSIF-00000009ajp-1Aha
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:14:20 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-476d8e647e9so1950255f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 12:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278857; x=1783883657; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gs7XFy3FD2pLHB50oDAQT+DRMjBuMolL1OQX4I1ZUY=;
        b=QBX61PjvizG9t5XZLfIaHoiHVIDj5VAnaJenbQP3b+6NB9vaQZQZWoDzpOXON4QLmp
         rAHGhwZMenJIkTj8A5tCZxWl+H3ztWpWT8J1JSO1sezyV60c6wGqnfnIddoiQogQjKq1
         NwvuaDhknBsOrcmh9CjMdwiHETUca43WQg+AikbhVwQuQVmqLg9bZM/eY3XQBmvHX2iw
         ZDsOLpnMFZKp21hKaR+dCv4N2JAM4hs5y5NKyIRMPYUT/usyg2hDW77KRwv1Xz7em7Yv
         E7ZLmMIkxoOq7uMgUEf46Xj+f8TuRl9c5EzMcvowdBzdSHYRFut3bUguXp2glZHKBYjm
         DQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278857; x=1783883657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9gs7XFy3FD2pLHB50oDAQT+DRMjBuMolL1OQX4I1ZUY=;
        b=LcqSoojplrqQm1ICRkjx4Ak3OKPOJzzG9k5vTcKNNzhYOo8Xhk/+uNzVllgjCRUDD+
         +PNmnWytJEOh/4aRLYIML16FAnt3eHRb8zv38IuTiEQmxiTyPbyfQwZU57XLhucfrRNU
         INpwzqyWBUu6/W51xHk5KZczTpYVX7UaC0i1yVsQLmdNLyT+jZ2In3BxJbGjhb2lUXmG
         +ueqyo43WY941WgMp7uksjb/1oTKpXzHeK/MJfC6JHSKlpT8aKOF+YmbWTsRZ2p5T7Jp
         aa8ld128YGt4yLdbIFCFAOSVthhiIAINoF2t6q58buLZofmnRwMmms3t0MbKXsZKoFPO
         Aw3A==
X-Forwarded-Encrypted: i=1; AHgh+Rq/9l6B4aSb9ow2v3ePr4VP8ul5PoNCpnoxHQIawAEUzFQ8xhP6fpRPEP/mnFASGiQ6Tro6l/V0D1LjR6F6kwQD@lists.infradead.org
X-Gm-Message-State: AOJu0YwsBMnhaoJ9eoiFuPTFIGOvGUNxq+a1QWfrNoMm76D8czykcSCu
	tZ5UrEp1pUfR7ypGm2onNNzl5EVup9GvZXkZwaKLxrhzN2dDqQpQiTo=
X-Gm-Gg: AfdE7clwyyH8oVPE/JZqEaCKOFzfCS9zPwkhMio/elm4WLaRzuQOmt91nA8ZpLT1jCf
	Cx66OVm3UfSAMvC9svGw4fhOIXC9K45dc3UXzwHb6q5qFhgQLsqQAOqG+7yzyA2jr94pps3bYOh
	4nXqd9g/Dw67SvePSk9zCy8wINOH+00HHyf55CfhWj0mgSnNwjy/NoImw1Z6qrjawlFBH2+dV2s
	m+s2HLfTZqB+KGoV3jqBXnl+V1Ez9BahRGRULmk4EBqBu4au+mlwiyhowghFycp0l86ZEi0vHSn
	GpbgSBOavZWaD/T3wMfGGc0N7Gq2qTS2D0uBKHTbHtfglQbSpqwq3+LEYCRug0o1kAnOMO4NkFP
	wjyvcPPkNgzTSUYIaYAiM+xwPIgUDOFuEvW+snnDp8zT6bSVazxK9Grgc4HYU+xabHsZUcBPBDV
	v1A379AN49iEBla56ocCqNKuuYEM0cKg==
X-Received: by 2002:a05:6000:2406:b0:475:f0d1:eb67 with SMTP id ffacd0b85a97d-47aae69e052mr8854078f8f.52.1783278857291;
        Sun, 05 Jul 2026 12:14:17 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:16 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:36 +0200
Subject: [PATCH RFC 02/13] drm/msm: add support for lpac_domain in msm_mmu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-2-01d50c3e0c99@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=14958;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=+NUxUAUzmqgmaVz24Pfo0rNku3mUxnWGlBhR5LzZ8hk=;
 b=8W6PxW4cFdy9SaMu8b3ahWtwVASq+Bvo3w/bWXaLDP/eyz+C+jDO31pse3AAxMO06yvXU1vSx
 Owz5RmTQFZyCsiGmMaRGiLh+xXPZw9Pu43VyY1Ea4IU+x28mZtIXN89
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_121419_468667_F07C4D15 
X-CRM114-Status: GOOD (  22.32  )
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

LPAC needs to use a separate context bank in order to be able to update
the page table independetly.

Add an iommu_domain for LPAC and keep it in sync with the main domain.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |   2 +-
 drivers/gpu/drm/msm/msm_gpu.h           |   1 +
 drivers/gpu/drm/msm/msm_iommu.c         | 158 ++++++++++++++++++++++++++++----
 drivers/gpu/drm/msm/msm_mmu.h           |   7 +-
 5 files changed, 148 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 2e5d7b53a0c3..a91d9b03ca88 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1569,7 +1569,7 @@ static int a6xx_gmu_memory_probe(struct drm_device *drm, struct a6xx_gmu *gmu)
 {
 	struct msm_mmu *mmu;
 
-	mmu = msm_iommu_new(gmu->dev, 0);
+	mmu = msm_iommu_new(gmu->dev, NULL, 0);
 	if (IS_ERR(mmu))
 		return PTR_ERR(mmu);
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index c62c45bb0ddb..f3fc7032fadc 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -201,7 +201,7 @@ adreno_iommu_create_vm(struct msm_gpu *gpu,
 	struct drm_gpuvm *vm;
 	u64 start, size;
 
-	mmu = msm_iommu_gpu_new(&pdev->dev, gpu, quirks);
+	mmu = msm_iommu_gpu_new(&pdev->dev, NULL, gpu, quirks);
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 6c83b8cbbb90..e2291dfe3ca8 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -175,6 +175,7 @@ struct msm_gpu {
 	const struct msm_gpu_funcs *funcs;
 
 	struct adreno_smmu_priv adreno_smmu;
+	struct adreno_smmu_priv lpac_adreno_smmu;
 
 	struct msm_ringbuffer *rb[MSM_GPU_MAX_RINGS];
 	int nr_rings;
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 058c71c82cf5..19bee64adb7c 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -13,7 +13,7 @@
 
 struct msm_iommu {
 	struct msm_mmu base;
-	struct iommu_domain *domain;
+	struct iommu_domain *domain, *lpac_domain;
 
 	struct mutex init_lock;  /* protects pagetables counter and prr_page */
 	int pagetables;
@@ -127,6 +127,8 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 	}
 
 	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
+	if (to_msm_iommu(pagetable->parent)->lpac_domain)
+		iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->lpac_domain);
 
 	return ret;
 }
@@ -224,6 +226,10 @@ static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
 	struct msm_iommu *iommu = to_msm_iommu(pagetable->parent);
 	struct adreno_smmu_priv *adreno_smmu =
 		dev_get_drvdata(pagetable->parent->dev);
+	struct adreno_smmu_priv *lpac_adreno_smmu = NULL;
+
+	if (pagetable->parent->lpac_dev)
+		lpac_adreno_smmu = dev_get_drvdata(pagetable->parent->lpac_dev);
 
 	/*
 	 * If this is the last attached pagetable for the parent,
@@ -232,9 +238,13 @@ static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
 	mutex_lock(&iommu->init_lock);
 	if (--iommu->pagetables == 0) {
 		adreno_smmu->set_ttbr0_cfg(adreno_smmu->cookie, NULL);
+		if (lpac_adreno_smmu)
+			lpac_adreno_smmu->set_ttbr0_cfg(lpac_adreno_smmu->cookie, NULL);
 
 		if (adreno_smmu->set_prr_bit) {
 			adreno_smmu->set_prr_bit(adreno_smmu->cookie, false);
+			if (lpac_adreno_smmu && lpac_adreno_smmu->set_prr_bit)
+				lpac_adreno_smmu->set_prr_bit(lpac_adreno_smmu->cookie, false);
 			__free_page(iommu->prr_page);
 			iommu->prr_page = NULL;
 		}
@@ -450,14 +460,22 @@ static void msm_iommu_tlb_flush_all(void *cookie)
 	struct msm_iommu_pagetable *pagetable = cookie;
 	struct adreno_smmu_priv *adreno_smmu;
 
-	if (!pm_runtime_get_if_in_use(pagetable->iommu_dev))
-		return;
+	if (pm_runtime_get_if_in_use(pagetable->iommu_dev)) {
+		adreno_smmu = dev_get_drvdata(pagetable->parent->dev);
+
+		pagetable->tlb->tlb_flush_all((void *)adreno_smmu->cookie);
+
+		pm_runtime_put_autosuspend(pagetable->iommu_dev);
+	}
 
-	adreno_smmu = dev_get_drvdata(pagetable->parent->dev);
+	if (pagetable->parent->lpac_dev &&
+	    pm_runtime_get_if_in_use(pagetable->parent->lpac_dev)) {
+		adreno_smmu = dev_get_drvdata(pagetable->parent->lpac_dev);
 
-	pagetable->tlb->tlb_flush_all((void *)adreno_smmu->cookie);
+		pagetable->tlb->tlb_flush_all((void *)adreno_smmu->cookie);
 
-	pm_runtime_put_autosuspend(pagetable->iommu_dev);
+		pm_runtime_put_autosuspend(pagetable->parent->lpac_dev);
+	}
 }
 
 static void msm_iommu_tlb_flush_walk(unsigned long iova, size_t size,
@@ -466,14 +484,23 @@ static void msm_iommu_tlb_flush_walk(unsigned long iova, size_t size,
 	struct msm_iommu_pagetable *pagetable = cookie;
 	struct adreno_smmu_priv *adreno_smmu;
 
-	if (!pm_runtime_get_if_in_use(pagetable->iommu_dev))
-		return;
 
-	adreno_smmu = dev_get_drvdata(pagetable->parent->dev);
+	if (pm_runtime_get_if_in_use(pagetable->iommu_dev)) {
+		adreno_smmu = dev_get_drvdata(pagetable->parent->dev);
 
-	pagetable->tlb->tlb_flush_walk(iova, size, granule, (void *)adreno_smmu->cookie);
+		pagetable->tlb->tlb_flush_walk(iova, size, granule, (void *)adreno_smmu->cookie);
 
-	pm_runtime_put_autosuspend(pagetable->iommu_dev);
+		pm_runtime_put_autosuspend(pagetable->iommu_dev);
+	}
+
+	if (pagetable->parent->lpac_dev &&
+	    pm_runtime_get_if_in_use(pagetable->parent->lpac_dev)) {
+		adreno_smmu = dev_get_drvdata(pagetable->parent->lpac_dev);
+
+		pagetable->tlb->tlb_flush_walk(iova, size, granule, (void *)adreno_smmu->cookie);
+
+		pm_runtime_put_autosuspend(pagetable->parent->lpac_dev);
+	}
 }
 
 static void msm_iommu_tlb_add_page(struct iommu_iotlb_gather *gather,
@@ -504,12 +531,16 @@ static size_t get_tblsz(const struct io_pgtable_cfg *cfg)
 struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed)
 {
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(parent->dev);
+	struct adreno_smmu_priv *lpac_adreno_smmu = NULL;
 	struct msm_iommu *iommu = to_msm_iommu(parent);
 	struct msm_iommu_pagetable *pagetable;
 	const struct io_pgtable_cfg *ttbr1_cfg = NULL;
 	struct io_pgtable_cfg ttbr0_cfg;
 	int ret;
 
+	if (parent->lpac_dev)
+		lpac_adreno_smmu = dev_get_drvdata(parent->lpac_dev);
+
 	/* Get the pagetable configuration from the domain */
 	if (adreno_smmu->cookie)
 		ttbr1_cfg = adreno_smmu->get_ttbr1_cfg(adreno_smmu->cookie);
@@ -528,6 +559,8 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_m
 	msm_mmu_init(&pagetable->base, parent->dev, &pagetable_funcs,
 		MSM_MMU_IOMMU_PAGETABLE);
 
+	pagetable->parent = parent;
+
 	/* Clone the TTBR1 cfg as starting point for TTBR0 cfg: */
 	ttbr0_cfg = *ttbr1_cfg;
 
@@ -588,6 +621,17 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_m
 			return ERR_PTR(ret);
 		}
 
+		if (lpac_adreno_smmu) {
+			ret = lpac_adreno_smmu->set_ttbr0_cfg(lpac_adreno_smmu->cookie, &ttbr0_cfg);
+			if (ret) {
+				iommu->pagetables--;
+				mutex_unlock(&iommu->init_lock);
+				free_io_pgtable_ops(pagetable->pgtbl_ops);
+				kfree(pagetable);
+				return ERR_PTR(ret);
+			}
+		}
+
 		BUG_ON(iommu->prr_page);
 		if (adreno_smmu->set_prr_bit) {
 			/*
@@ -606,11 +650,17 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_m
 						  page_to_phys(iommu->prr_page));
 			adreno_smmu->set_prr_bit(adreno_smmu->cookie, true);
 		}
+
+		if (lpac_adreno_smmu && lpac_adreno_smmu->set_prr_bit) {
+			iommu->prr_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+			lpac_adreno_smmu->set_prr_addr(lpac_adreno_smmu->cookie,
+						       page_to_phys(iommu->prr_page));
+			lpac_adreno_smmu->set_prr_bit(lpac_adreno_smmu->cookie, true);
+		}
 	}
 	mutex_unlock(&iommu->init_lock);
 
 	/* Needed later for TLB flush */
-	pagetable->parent = parent;
 	pagetable->tlb = ttbr1_cfg->tlb;
 	pagetable->pgsize_bitmap = ttbr0_cfg.pgsize_bitmap;
 	pagetable->ttbr = ttbr0_cfg.arm_lpae_s1_cfg.ttbr;
@@ -646,6 +696,26 @@ static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev
 	return 0;
 }
 
+static int msm_lpac_fault_handler(struct iommu_domain *domain, struct device *dev,
+		unsigned long iova, int flags, void *arg)
+{
+	struct msm_iommu *iommu = arg;
+	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(iommu->base.dev);
+	struct adreno_smmu_fault_info info, *ptr = NULL;
+
+	if (adreno_smmu->get_fault_info) {
+		adreno_smmu->get_fault_info(adreno_smmu->cookie, &info);
+		ptr = &info;
+	}
+
+	if (iommu->base.handler)
+		return iommu->base.handler(iommu->base.arg, iova, flags, ptr);
+
+	pr_warn_ratelimited("*** lpac fault: iova=%16lx, flags=%d\n", iova, flags);
+
+	return 0;
+}
+
 static int msm_disp_fault_handler(struct iommu_domain *domain, struct device *dev,
 				  unsigned long iova, int flags, void *arg)
 {
@@ -660,9 +730,16 @@ static int msm_disp_fault_handler(struct iommu_domain *domain, struct device *de
 static void msm_iommu_set_stall(struct msm_mmu *mmu, bool enable)
 {
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(mmu->dev);
+	struct adreno_smmu_priv *lpac_adreno_smmu = NULL;
+
+	if (mmu->lpac_dev)
+		lpac_adreno_smmu = dev_get_drvdata(mmu->lpac_dev);
 
 	if (adreno_smmu->set_stall)
 		adreno_smmu->set_stall(adreno_smmu->cookie, enable);
+
+	if (lpac_adreno_smmu && lpac_adreno_smmu->set_stall)
+		lpac_adreno_smmu->set_stall(lpac_adreno_smmu->cookie, enable);
 }
 
 static void msm_iommu_detach(struct msm_mmu *mmu)
@@ -670,6 +747,9 @@ static void msm_iommu_detach(struct msm_mmu *mmu)
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
 
 	iommu_detach_device(iommu->domain, mmu->dev);
+
+	if (iommu->lpac_domain)
+		iommu_detach_device(iommu->lpac_domain, mmu->lpac_dev);
 }
 
 static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
@@ -689,6 +769,11 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 	if (ret < 0)
 		return ret;
 
+	if (iommu->lpac_domain) {
+		ret = iommu_map_sgtable(iommu->lpac_domain, iova, sgt, prot);
+		WARN_ON(!ret);
+	}
+
 	return (ret == len) ? 0 : -EINVAL;
 }
 
@@ -701,6 +786,9 @@ static int msm_iommu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
 
 	iommu_unmap(iommu->domain, iova, len);
 
+	if (iommu->lpac_domain)
+		iommu_unmap(iommu->lpac_domain, iova, len);
+
 	return 0;
 }
 
@@ -708,6 +796,8 @@ static void msm_iommu_destroy(struct msm_mmu *mmu)
 {
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
 	iommu_domain_free(iommu->domain);
+	if (iommu->lpac_domain)
+		iommu_domain_free(iommu->lpac_domain);
 	kmem_cache_destroy(iommu->pt_cache);
 	kfree(iommu);
 }
@@ -720,9 +810,9 @@ static const struct msm_mmu_funcs funcs = {
 		.set_stall = msm_iommu_set_stall,
 };
 
-struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
+struct msm_mmu *msm_iommu_new(struct device *dev, struct device *lpac_dev, unsigned long quirks)
 {
-	struct iommu_domain *domain;
+	struct iommu_domain *domain, *lpac_domain = NULL;
 	struct msm_iommu *iommu;
 	int ret;
 
@@ -753,6 +843,30 @@ struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
 		return ERR_PTR(ret);
 	}
 
+	if (lpac_dev) {
+		if (!device_iommu_mapped(lpac_dev))
+			return ERR_PTR(-ENODEV);
+
+		lpac_domain = iommu_paging_domain_alloc(lpac_dev);
+		if (IS_ERR(lpac_domain))
+			return ERR_CAST(lpac_domain);
+
+		iommu_set_pgtable_quirks(lpac_domain, quirks);
+
+		iommu->lpac_domain = lpac_domain;
+		iommu->base.lpac_dev = lpac_dev;
+	}
+
+	if (lpac_domain) {
+		ret = iommu_attach_device(lpac_domain, lpac_dev);
+		if (ret) {
+			iommu_domain_free(domain);
+			iommu_domain_free(lpac_domain);
+			kfree(iommu);
+			return ERR_PTR(ret);
+		}
+	}
+
 	return &iommu->base;
 }
 
@@ -761,7 +875,7 @@ struct msm_mmu *msm_iommu_disp_new(struct device *dev, unsigned long quirks)
 	struct msm_iommu *iommu;
 	struct msm_mmu *mmu;
 
-	mmu = msm_iommu_new(dev, quirks);
+	mmu = msm_iommu_new(dev, NULL, quirks);
 	if (IS_ERR(mmu))
 		return mmu;
 
@@ -771,13 +885,18 @@ struct msm_mmu *msm_iommu_disp_new(struct device *dev, unsigned long quirks)
 	return mmu;
 }
 
-struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsigned long quirks)
+struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct device *lpac_dev,
+				  struct msm_gpu *gpu, unsigned long quirks)
 {
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(dev);
+	struct adreno_smmu_priv *lpac_adreno_smmu = NULL;
 	struct msm_iommu *iommu;
 	struct msm_mmu *mmu;
 
-	mmu = msm_iommu_new(dev, quirks);
+	if (lpac_dev)
+		lpac_adreno_smmu = dev_get_drvdata(lpac_dev);
+
+	mmu = msm_iommu_new(dev, lpac_dev, quirks);
 	if (IS_ERR(mmu))
 		return mmu;
 
@@ -791,10 +910,15 @@ struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsig
 			kmem_cache_create("msm-mmu-pt", tblsz, tblsz, 0, NULL);
 	}
 	iommu_set_fault_handler(iommu->domain, msm_gpu_fault_handler, iommu);
+	if (iommu->lpac_domain)
+		iommu_set_fault_handler(iommu->lpac_domain, msm_lpac_fault_handler, iommu);
 
 	/* Enable stall on iommu fault: */
 	if (adreno_smmu->set_stall)
 		adreno_smmu->set_stall(adreno_smmu->cookie, true);
 
+	if (lpac_adreno_smmu && lpac_adreno_smmu->set_stall)
+		lpac_adreno_smmu->set_stall(lpac_adreno_smmu->cookie, true);
+
 	return mmu;
 }
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 8915662fbd4d..1965b98d20db 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -52,7 +52,7 @@ struct msm_mmu_prealloc {
 
 struct msm_mmu {
 	const struct msm_mmu_funcs *funcs;
-	struct device *dev;
+	struct device *dev, *lpac_dev;
 	int (*handler)(void *arg, unsigned long iova, int flags, void *data);
 	void *arg;
 	enum msm_mmu_type type;
@@ -74,8 +74,9 @@ static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
 	mmu->type = type;
 }
 
-struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks);
-struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsigned long quirks);
+struct msm_mmu *msm_iommu_new(struct device *dev, struct device *lpac_dev, unsigned long quirks);
+struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct device *lpac_dev,
+				  struct msm_gpu *gpu, unsigned long quirks);
 struct msm_mmu *msm_iommu_disp_new(struct device *dev, unsigned long quirks);
 
 static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,

-- 
2.54.0


