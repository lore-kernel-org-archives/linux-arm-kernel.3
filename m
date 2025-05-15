Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351BDC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 20:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXRAlEAkp/v2H222njYW3lOGT6rTudruLVTCXUshl+c=; b=JfD3yd8g4dFMRIMq4icEm1OBKo
	R6kLyJ4g7m3eSq10YLqfzjGwhPrWE0a6UcctHMZY/wfI5vLUAuntb5D2rU9Jq6N4av7XrtLDE0PLc
	ps1czGgQLlsC4BzWvMqHSB0s8lZy5+0dErCzHnwiEbM3mMr7A/dPW50+Sj4b67rkv0M67TedQfWzh
	RWiumdSNshwUZqcQy7LVYXM1l+tcC9gICbkD6nLwvpjZpeAqxqf2cMX8TIoKfpXWIwxTLhCWmA/p8
	iKkrs0zlgtzydUbdCaaarDyDlIkQM/jXVJEd3ajPaGwnGPiH/sqkcHB79wzMg9eROxdo8kEi7NKZ7
	0tNmqikQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFew2-00000001lb3-0v86;
	Thu, 15 May 2025 20:12:06 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFek4-00000001k83-20LI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 19:59:45 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4769a9055e6so496331cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 12:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747339183; x=1747943983; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CXRAlEAkp/v2H222njYW3lOGT6rTudruLVTCXUshl+c=;
        b=izojFupQB8sd/4hstY/C6XBu8PKcfrg3QSf9h2TeWjXvyseWwqTUzOOQuC4wEiTaw/
         xkS6wkvJYGAb6bF+67IDrAn1jXTxHqpHEuDFAIbpq8gw0TgGfF0izeYYwiV/5mDnLBqr
         AdHUg/JaMjGM3qcLZrhHlQKpAZqaTBgAv9wDOGiKMCEozrXSweA9YKXxChpOJDbBDMmh
         I/mNHqbGmuKhJ8m+2PJJ+laEEbmY0BwKDNG/tXbWiLBliR4KZXLwsRdsAbDH2RWvr4Q5
         kQyL3+G6tCRScsdhnA6bthecvH5rKjunKcX90nifxhRqM+M9IxYYtMOxNHq9zoEOMTTp
         9TBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747339183; x=1747943983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXRAlEAkp/v2H222njYW3lOGT6rTudruLVTCXUshl+c=;
        b=hiQSpXTHA2N+6OzibxNbrI5n/gzmdPg4hImQZQ9B6EXKmBvEyUJWBehdeSRHi1de+A
         48OuzcX4WmxkHHIFtHsF+YLlbVn7b9YvcoHW03LPonJZDDqRU5nk6fuFGdT/qe7AlVc8
         cr8vEXFKkBtmO4U970g73tpEHW07g+63Rl2vYjCcAs628wuN0kvw/RSYiRkGK5UeV6LU
         NY+Gx6LxKHzgdJmSTgRC9VVA+Jr4yXohIguh+eQi9wl1/8zyfwQ1SGFKQqXG8PF2yN8P
         MLx3nHT/wy2iF2NdpTqKvADMzdow4tKO3aywCbugz/QmDjWEp4kSeADxhlRplhMd2OJ8
         nIqA==
X-Forwarded-Encrypted: i=1; AJvYcCWKsFL1u1mZbgJZAL4ycEc3fugqre5d5HIdXLU2ksZ3q2o/pygvMCz+09L2QPURsNqSSzwaXnEe+1zJCHZ6NA3h@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy6UW5SoAgGfU1DuAz5mEK17juHC9YtUaQt7BziMdBmQBtw6yS
	Ub+mAqhfcGMnBFd4fhpOB7CWPV6SW/D6/mk4s2cCodm90QEV8oZJgojW
X-Gm-Gg: ASbGncuiBzlE/s1+X8mvh2iQL6GSZkbAsN+xUJWzAIijR4Sb8a4hLkPzT7y13JlLwUi
	41qNkEapYkF9lPw4c+yfi3OUcP4IyRpHYazFN36eB/e+pO7EH8DnZLo1ZRxKKcPuqJV/FuEUkE/
	0oEuW478kAgFD8CCvGHePVKZf/d/feBh9d+AAzuIqDK4+8EZXJRK6QthplMaa0hGnx/2w61VatG
	EHOzh8aVVOEFFshbGHSCuA//OSDjTIkjIKxPRrRRM92WNLJS9X5a2Lb0hL1arxw6U3NzCVCgSrP
	4EoOz1Rh1ibo5iJJUnu0z1S6MLczu4rDsv/ixkzJ8y1BWPRyD4R0RUFAQfjG4sDNlWKG6rOyY8X
	S4iFLVuWJT04P7c+tqb4=
X-Google-Smtp-Source: AGHT+IHON1Ci4ArRCi8J9fIgnvSIH3M28UzX9E4XnN9n89/XqiNa63YZ+YYjbAguQ3rvFJAVU38Aqg==
X-Received: by 2002:a05:622a:19aa:b0:473:884e:dcff with SMTP id d75a77b69052e-494ae4539b1mr3915141cf.13.1747339183019;
        Thu, 15 May 2025 12:59:43 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae4fd80bsm1957231cf.56.2025.05.15.12.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:59:42 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 15 May 2025 15:58:47 -0400
Subject: [PATCH v6 5/7] drm/msm: Delete resume_translation()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-msm-gpu-fault-fixes-next-v6-5-4fe2a583a878@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747339176; l=3253;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=Qq5k1GBVvpOoe3vbf7lHYuU1s8ow91pqey8KnhArgxI=;
 b=/yM3pG9E+DokL/lrL3Cl3ogv2uxixtq/MENaQRhh9mJ7nye6cSJOdpS0NZNuJb+oTQewG5E6D
 ++dtz6vH3kzBvtRX4KSQtz77NW08TMP7QhhfQ5z4KlxpGJRz/i6wi0U
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_125944_519708_8A917A50 
X-CRM114-Status: GOOD (  11.71  )
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
index 2a94e82316f95c5f9dcc37ef0a4664a29e3492b2..c6fed9bcb0021a5ad25d8487db1cc05869668c3e 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -323,7 +323,6 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
 		unsigned long iova, int flags, void *arg)
 {
 	struct msm_iommu *iommu = arg;
-	struct msm_mmu *mmu = &iommu->base;
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(iommu->base.dev);
 	struct adreno_smmu_fault_info info, *ptr = NULL;
 
@@ -337,20 +336,9 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
 
 	pr_warn_ratelimited("*** fault: iova=%16lx, flags=%d\n", iova, flags);
 
-	if (mmu->funcs->resume_translation)
-		mmu->funcs->resume_translation(mmu);
-
 	return 0;
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
@@ -398,7 +386,6 @@ static const struct msm_mmu_funcs funcs = {
 		.map = msm_iommu_map,
 		.unmap = msm_iommu_unmap,
 		.destroy = msm_iommu_destroy,
-		.resume_translation = msm_iommu_resume_translation,
 };
 
 struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 88af4f490881f2a6789ae2d03e1c02d10046331a..f118de637b1b35acba76a92c2cca1de9b2fad5a0 100644
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


