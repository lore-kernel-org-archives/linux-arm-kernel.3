Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F795C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 17:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cADqZ1V/EGiLXKG6qQOYNjFrT4sU1TPLVJeXzQQLmA0=; b=Hfm3qHW0z2GDfRwguPdgs1TQsC
	GQgCOTqQmQGk102Ud63NHKmXWBsCwRZ9modjXg5hz0VNEITTK+YkeyOFUeFM3kS8gtz3g9RkwklOQ
	TT/rqeCREabSMKi7ygy7A4Ph4LdOWxW8KgWYqhFPrzPhOStLwVMXDM6BVahRxwnQV2Cf6MF7iPYCK
	VNI/JeWrzprdZsgovn+PECGLKVAnp2UxTk7zH/brIHubA97Zn6VuqbmlPJeA4o1yB9dN6CsXHhsZp
	qJavMVWg486yJltoJ0de741XNXRk1tFfq/p/lKsXPTsixaCnDGeupYr5nqBNrkQr0z3135UFd31ld
	7eI9DlFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHREA-0000000Dk12-20M5;
	Tue, 20 May 2025 17:58:10 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHR1X-0000000DiCF-0pQG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 17:45:08 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6ef0537741dso9051446d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 10:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747763106; x=1748367906; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cADqZ1V/EGiLXKG6qQOYNjFrT4sU1TPLVJeXzQQLmA0=;
        b=GcEkneAnrBswpdWw38FtxDUIvRm/yJJ9utKN9lpfqeKtNrFBokeWaKOMlkOG6BPgUV
         C2thZOXRRvc2UzWPukmu4+sC54J0bxpqfW0Z91PQLZfEXytTZQAkLMePe2dx45kH4tqx
         4gOXJfbNflRwY6nSHPX50FnsJNNPmd6Wbrs8iWW4g9YQbeKe0cJJzroyJ35zxcicAqtk
         E0738c930tJSACub4oVD8l07snsq9Rx1lDGJX7vRIqhI2hBCiv9uHNW/7TkVnROF1Lm7
         XJlJPyjiqtT3HPvV2OIZ6ZBWGvZJW8HTGK4pIRIqAkO7b0JAQJJII591MRGxQb1N9JjF
         oquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763106; x=1748367906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cADqZ1V/EGiLXKG6qQOYNjFrT4sU1TPLVJeXzQQLmA0=;
        b=xJq25m4daPRjE+XIETUlDD7WHDo8QpJ7u8JHiSqMzm5w400sjmlHl+CYGJ1h1xr7Ct
         +4n5y1L+2f/emfx9eDTZpLfLcoaNQUeKLtrX1IzpBy1Ot6S8Qjmy4pZtoX89gPqbcMOw
         yu7bIoEB9wDShz391/IKcnxDhW3iMCg9AKFeT7dRjGU9ZtJnX5ejg3zaxOz268RDKnIW
         bsI0+eFLYPYzcElz06xyLFyaAtELXA0Cr15w07xBx0UXCZ4/B2/xjs+tbFJxrgBT1FX1
         ZVSPOry0SmrFVumW6qAblZfJOYN7giruK4r8u64UVywa9sXZUki5pjV610mm/0ilyDn5
         YB8w==
X-Forwarded-Encrypted: i=1; AJvYcCWc/pye9isp6EASPEgRReduP6UEjgkWoMZZkRwtJWr+PA2kYJs5Zol9etHSnl5hN+cmfwa2Tp/oSPFQXiUv+D8D@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxgl+2Tzavkpxav0jcz4deKwDnk5yph+pVANY/GQP0sRFKwpa7
	fG8Czt2tnMH+LrqmzlYXdjH1tpc517zHWoIUp6ME6bJ6UetTh/mGXd0L
X-Gm-Gg: ASbGncvbMqOvahIVOvM6mtT5RADaMco6LpQZ2bsZFpUifDP6gc/p9jGl1nK33peMmKv
	gskPZ+nrvPGQZ5rBMVP+xZCcpIezCMxOIt+IvzK1M9WM+jcwt57wmGNxZf6E1n4Nqh2ycVzscUx
	ozpU03eFME7oFFRmOTLN7x7evzVdWOe5Dag7VL71oZpacMlePP2S/WWp2K7m58hkGcDUXKM2V4L
	QMI/IKS9TT5bNjg0zEpF3LZRABwxwP4O0lkCgfqcAJJHxqa0f8f4VsZQz+ygH8O40NZdP+Um8nR
	XBMhwhE+Kih/nv0TQcOHrjl2dJprfthCOpqj+peXLc3P/6TPYdm6RRa+RcpBinPYmPueH25KluA
	3Oy3CHMoASGUTliT9wKY=
X-Google-Smtp-Source: AGHT+IF/kqZXAuJjPUcZYWB5r6Qr7iOAsFvxKah/Zq78HNCB/e2Q26OWxJdFiR2AvAYDpvo1c5xq6w==
X-Received: by 2002:ad4:5941:0:b0:6f4:c603:588c with SMTP id 6a1803df08f44-6f8b087eb22mr85100926d6.7.1747763105993;
        Tue, 20 May 2025 10:45:05 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b096ddb4sm74126586d6.78.2025.05.20.10.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:45:05 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 13:44:54 -0400
Subject: [PATCH v7 5/7] drm/msm: Delete resume_translation()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v7-5-96cd1cc9ae05@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com>
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747763098; l=3387;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=IRNUvyOjaxw/F2ca+hPqiQkWq4EHwHVBbpQuon23Uj4=;
 b=bb1ikhMcSzxMlK/2NMm33STv5kLCmibVErhj4n18dSnT3mDibLINSPR9ac7QKmBAKJFyLjFcr
 bATA0iAywjqCx5qFhoAISP9lr/FgSu8Zo+BxW+MrAxNgLZ4CwVNSho3
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_104507_244356_D073F9CC 
X-CRM114-Status: GOOD (  12.20  )
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


