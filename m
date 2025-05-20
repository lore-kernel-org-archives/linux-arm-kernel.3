Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0E3C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 19:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cADqZ1V/EGiLXKG6qQOYNjFrT4sU1TPLVJeXzQQLmA0=; b=I70O9GwYRgA1wAT7Y6fiV8lNZa
	0gv3Yg7ewqanl4Q0fFp1xppgXolFEkbcIEwerHN3+oUw9hQELfmGY9MCe+DFtFgMWj48/3n9zI1Ow
	jCh5qVKwJWILmgtlx5wPAm74LU79eEFYDcKm81JwJXAfNGpLVMna5oK55bW7aA0+xJBwWtturo8fV
	X92/9IKlGnh954T5K/OUrdddnmRqgyV9Q89jrKcgkmVUHAxaNB2VI2G2JUOM5mrh1AqC3EnHheZru
	iS2YGzoLfcXTXldyf1OapSqhj/yHAzf+EJgqrMiNsIUWLbEuqIEV9e82olAKqB7U2xrMu052xPJgj
	rSMBTHcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSXR-0000000Duvn-0nVg;
	Tue, 20 May 2025 19:22:09 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSKp-0000000DtWc-0o93
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 19:09:08 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-490da2f354dso3174261cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 12:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747768146; x=1748372946; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cADqZ1V/EGiLXKG6qQOYNjFrT4sU1TPLVJeXzQQLmA0=;
        b=bUl0d//bMlFN7Qah/dnyMXotCJPWriwDM0XtOcb+qgkxE/g6kfc6Ugx1G8Ou8o4F4G
         87wGL1Gx/RS3gSEi4NGrSOzt5YTrYZCMiRZ3gR4Y4b3rCtwSa0QXTngj/w4svj3t7LcB
         DOaaJJWax6drwyT1dagwt2ruEWXgwYAhTqRsLCHmLAv0fLNud5AFXd0OlQpTYQfxyfWH
         rXh6OSFsuUCPg22SQWkUonVr8fsbGj/EaZ+tFU3TuMUWLrkCA3Ry2WVzpg+aYK1Baf3V
         C0DxaEBVkxJOh5lWHlupgMQi6uJhoAMAa7WIrguxK7ZOe+FMRqx9U9+pTbQ0hmcnR7ZZ
         PG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747768146; x=1748372946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cADqZ1V/EGiLXKG6qQOYNjFrT4sU1TPLVJeXzQQLmA0=;
        b=kWxbSKKMJ/FMeTEAVKhV1kD24Sm53WuLJHGJ7tEG+scQ4yvqqaLRvcDs6EoppY08Zd
         r315dV0Sdn6TGVwDUashRjUcXidK4BJW7XkJqf0rgrNNmjhP/bH+STKzuGVNX7+P10cb
         8Po21w+0KDRj/T2t53M2suHw7AuadDkG2fWiaR8vgxaBNfa3uTYdBvQ7tzOy4aXM6qhw
         mRO9UmrAbY/vqkDZHFNFl6l1WQM9g1i5TAdxOWW5om9GID0o0cusn5it6v3vWSKDluqy
         l7yIq6dsZ/WmQnpR9+lSzBvRosNzkPoqXvEglAD7Oa2jTgrRZeN26w+AR/UIf3EMyptN
         IBBw==
X-Forwarded-Encrypted: i=1; AJvYcCXHeCGrle9StO6sVc8mFx164esH9ij2Zbybb6sxS65ulfCastjj/chIY+D9MvyRmj7FwpsapYyxzoJ6cDLtpWoL@lists.infradead.org
X-Gm-Message-State: AOJu0YyrmJXY4N4VMEX2hQyLOABaYbUn/IAX6OBLAW4iTa+aMl0nbTop
	b6FugqFDo3SvHzb82QW/dv6UnTsaOCaIJVRjJzVOpPEAEJqmbrMKKQi/NRssOIU/
X-Gm-Gg: ASbGncv4V7x0ONOPT/2+zOfGLxO/KDWERM9NkHsjjH/pnq+k47xyowgE4D7srbgihyV
	ZDYF9Bhdz9GdQS0rjXJrrn3F2VM5DsRMww+/SafcQp4wq237w9ntgeU+douLZwUTVDAgSHMglzU
	ND3yU6MXJmUJXIqdKqW4zPHXpjjdQQn1ZReAh/QO35s3Nyv3Yn1JaD/s1kGn65O2mGstwzoq7pD
	PHkJ5USuVnPfm3SQMS8H7Naj3iiW/ELO/a4jyvfOl48RKuEEE04ytVIGYX6XftS5ZBY/TM4YZIu
	lCXQXgJOrPl//L41Yw2rU2a2pm1TC10AfHIF0eKghAHtv8xOCCdtMgrvwz976AMwDYLQeeUbS5s
	v1324XZaF9/5BR53nY3M=
X-Google-Smtp-Source: AGHT+IH/sySa48mHF1j+xGqwAb4OUN56/osDwaowVOBbvnddvZtTNPPLhnoNhpJNu3NLmENNp9KeEA==
X-Received: by 2002:a05:622a:295:b0:474:e213:7480 with SMTP id d75a77b69052e-494ae4557f3mr113963491cf.15.1747768145897;
        Tue, 20 May 2025 12:09:05 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae445b99sm76554051cf.48.2025.05.20.12.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:09:05 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 15:08:58 -0400
Subject: [PATCH v8 5/7] drm/msm: Delete resume_translation()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v8-5-fce6ee218787@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747768138; l=3387;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=IRNUvyOjaxw/F2ca+hPqiQkWq4EHwHVBbpQuon23Uj4=;
 b=5d0rxfRs5HCrkUIw2Arap8ZqFIuAGJ4FzZ6nBN1RaYGc2iwrZQL0YnVpt1p+/vjsJdBWdGDLK
 wKpde4hDDxRAJWeKAxM6zuLjWRz2y2+sHM1RYmSEmKQLnJbDbCP4lc7
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_120907_248614_C69B8BC4 
X-CRM114-Status: GOOD (  12.40  )
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

Unused since the previous commit.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c |  5 -----
 drivers/gpu/drm/msm/msm_iommu.c          | 13 -------------
 drivers/gpu/drm/msm/msm_mmu.h            |  1 -
 3 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
index 39641551eeb66d1441810c9691708ef448192578..4280f71e472a4130a62ba74e936870905ca260bb 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
@@ -71,10 +71,6 @@ static int a2xx_gpummu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
 	return 0;
 }
 
-static void a2xx_gpummu_resume_translation(struct msm_mmu *mmu)
-{
-}
-
 static void a2xx_gpummu_destroy(struct msm_mmu *mmu)
 {
 	struct a2xx_gpummu *gpummu = to_a2xx_gpummu(mmu);
@@ -90,7 +86,6 @@ static const struct msm_mmu_funcs funcs = {
 		.map = a2xx_gpummu_map,
 		.unmap = a2xx_gpummu_unmap,
 		.destroy = a2xx_gpummu_destroy,
-		.resume_translation = a2xx_gpummu_resume_translation,
 };
 
 struct msm_mmu *a2xx_gpummu_new(struct device *dev, struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index fd73dcd3f30e75878364cb28dd26475c2ff80a85..aae885d048d0d2fd617d7b2a16833da25f5e84cc 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -345,7 +345,6 @@ static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev
 		unsigned long iova, int flags, void *arg)
 {
 	struct msm_iommu *iommu = arg;
-	struct msm_mmu *mmu = &iommu->base;
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(iommu->base.dev);
 	struct adreno_smmu_fault_info info, *ptr = NULL;
 
@@ -359,9 +358,6 @@ static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev
 
 	pr_warn_ratelimited("*** fault: iova=%16lx, flags=%d\n", iova, flags);
 
-	if (mmu->funcs->resume_translation)
-		mmu->funcs->resume_translation(mmu);
-
 	return 0;
 }
 
@@ -376,14 +372,6 @@ static int msm_disp_fault_handler(struct iommu_domain *domain, struct device *de
 	return -ENOSYS;
 }
 
-static void msm_iommu_resume_translation(struct msm_mmu *mmu)
-{
-	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(mmu->dev);
-
-	if (adreno_smmu->resume_translation)
-		adreno_smmu->resume_translation(adreno_smmu->cookie, true);
-}
-
 static void msm_iommu_detach(struct msm_mmu *mmu)
 {
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
@@ -431,7 +419,6 @@ static const struct msm_mmu_funcs funcs = {
 		.map = msm_iommu_map,
 		.unmap = msm_iommu_unmap,
 		.destroy = msm_iommu_destroy,
-		.resume_translation = msm_iommu_resume_translation,
 };
 
 struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index daf91529e02b6c491d624e9de686173eeef86a9b..c3d17aae88b0a57b3c7d1df3351b39ec39bca60a 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -15,7 +15,6 @@ struct msm_mmu_funcs {
 			size_t len, int prot);
 	int (*unmap)(struct msm_mmu *mmu, uint64_t iova, size_t len);
 	void (*destroy)(struct msm_mmu *mmu);
-	void (*resume_translation)(struct msm_mmu *mmu);
 };
 
 enum msm_mmu_type {

-- 
2.47.1


