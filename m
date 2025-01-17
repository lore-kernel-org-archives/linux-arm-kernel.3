Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90041C02188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 18:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+ra6/FwxtS9APR+DM5MjQWhKeuNW85TPSbzZLBgVdyU=; b=bxH0+nq91IZFgO
	LsnCY3TOANaJ7kNKUqTH9kDCG6vgLspyBsIYPinzsSImAkQaY7Ld/BoKohCGBqBog5fZfro5jfr2H
	6BuYcCp3qCRxf/01UqbqrWx9RuP0Z6I9sDBC+KzcgQGqaqW36aSdScgmvMmSlzWujSSNP0Dd9tE+J
	Vt0lLaa4BZ/IHW/gdDimPkFfJYNFz/ph/TbINZU8PqbCcf4Ov3oUG8EfpEqGc3z0V5Kj2RzF0dpcu
	xSHvaG1CTJkb2MVyf2ziu8fohCklmyf/wIlwLeh8fPssdKQfPh2EI147V7XJaWofUgnWc3kMnrR7n
	v8EJ02knfwYZD7nveA9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYrOr-000000019B8-31S3;
	Fri, 17 Jan 2025 18:48:57 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYrNa-000000018sp-2iFu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 18:47:39 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6d8f9494312so3212436d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 10:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737139657; x=1737744457; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ra6/FwxtS9APR+DM5MjQWhKeuNW85TPSbzZLBgVdyU=;
        b=Uaw1nuNH+1790XBfXzPcLXmXzA4Cc4A77hWxWnFom8LHeiSvDg6F88WBM8dI7UUXAV
         OhN+F23EBdtsyb80p/umvUrmTWf+HCHhUt2IymSw7V10ynpaYdNPQ7wmQiCEHlV4VOMK
         WtqUJeGQ//xO2jatYJrYv3VZIfEfn+mNSxVAEGdEtReN6gLwPUgSBdwXDyww5WDdJpyv
         aVFPIiFfHD5slr+bt8V0JjAyopQ3mI/qrrTD5qGPid6ko2k+IRUistR6sg1Rpj5YObxT
         WkQ3A0XHHUYBI+hmA+k4Q6EcZIEh6j81qV9E5GPAaR5thlDFa+P5+9uVUplLmLOc34HR
         cLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737139657; x=1737744457;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ra6/FwxtS9APR+DM5MjQWhKeuNW85TPSbzZLBgVdyU=;
        b=egamYaG/HzhTy8YkKvsr+8WudQXWmk7Y3kcvpOpp6uoS60WAvgoLl9QgnVxzJdRXCm
         6wJygqzGkYvUzvv57qm2h2xRnu441rAXLe9EKBj4BxeMoSf/7RZe646qqhQJuopXtCKs
         MaFDr5eWaezMHNlbUJAf3JXStJ922rZi6HaGPm2RfXNRTSOHcz7tDFBnKW3BOtnHuU3f
         F8gKZWJt0PB5/qzGdpX0tVFvLv+VGaradVnbDh5bVz6/zbdH+kAMh8g2wmHWpCjbzDxs
         0d4Ra8mNQ47Ev//sKl2PrmAwzbpvaqKwO6z/moJFV0nR/CtOaBrhQKaUTQmeav/osWiJ
         NI1A==
X-Forwarded-Encrypted: i=1; AJvYcCV6PFHVWMi7kTpb9h+lDNepIZJ8wWVS+RmaYMRUMtCHz/bLNuLWrz6d2f/Ipp+pJ9FD7uNL7m0CORBvAu+QPPXe@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7XgcI7dSyGOwIrBqzqvMOGJbkgYc5Q6wgNkgso6a05wXORrjK
	tr/G/6jxuuKIDi2MaobT8QTRvCSW82uc+tnm7FqGeTi4IytAlzuM
X-Gm-Gg: ASbGncuDx0qBw0vNuXAIB82GaqHHXpcLSqzta8wMFOFQ2xHh532aKELug71Ti8Q9x7K
	VzIk/+pTeSd8fYsYia0wDRMq3gsbWpcdBZG0JNVFKUxuG0XTPDDW/TSoL/7jUPl6sWy1LmlUIJI
	lvJxfl3g42tN54yRDEsgtdet4+UziwzItOzxH+wlqNO1XbGu8MlHIIqUI+R+JuYUlHig7sWVJei
	OD41aDQFgp2qFNyNCEdqf3uUk4G+gPcAdoLygrqPY2S4k0gomN+w7xpgGVPN9gO3zsIz+RbXNws
	ur21yxp856L2MZM=
X-Google-Smtp-Source: AGHT+IHEGS3WMZchQKb6AiaCl+4ohD5OQ+8Gq4AMLYPZ/+pdqcNLdTJ3oItGfaDD1AJRyHaTYAAAVQ==
X-Received: by 2002:a05:6214:c82:b0:6d9:2fe3:bf0c with SMTP id 6a1803df08f44-6e1b2158965mr20166666d6.4.1737139657265;
        Fri, 17 Jan 2025 10:47:37 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afcd3859sm13992176d6.74.2025.01.17.10.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 10:47:36 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH 0/3] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Date: Fri, 17 Jan 2025 13:47:06 -0500
Message-Id: <20250117-msm-gpu-fault-fixes-next-v1-0-bc9b332b5d0b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKqlimcC/x3LSwqEMBBF0a1IjS1IIn63Ij0QfWqBRklpI4h7N
 zg8XO5NiiBQapKbAv6isvkImybUz52fwDJEkzMuN9aWvOrK037y2J3LwaNcUPa4Dq4LZKaujMt
 gKe57wFfj3f6e5wViwNJ/agAAAA==
X-Change-ID: 20250117-msm-gpu-fault-fixes-next-96e3098023e1
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737139656; l=2214;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=wufxwIG7SZVGT+NpZWvu5eUyVT71GkroNC9AubeD6sU=;
 b=RzjUDIZzgJrcKPPHCBVN/rS1IQljrG9wOjACFFGTOV2ahU8dMokrXTl3UGiT9YmU29Wrd+Hio
 +pb1RkanhupDPC3GvaEwsdahnKSFbIIkGWx35my0A19lFaiS/f1vahd
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_104738_707877_478D4C62 
X-CRM114-Status: GOOD (  15.55  )
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

drm/msm uses the stall-on-fault model to record the GPU state on the
first GPU page fault to help debugging. On systems where the GPU is
paired with a MMU-500, there were two problems:

1. The MMU-500 doesn't de-assert its interrupt line until the fault is
   resumed, which led to a storm of interrupts until the fault handler
   was called. If we got unlucky and the fault handler was on the same
   CPU as the interrupt, there was a deadlock.
2. The GPU is capable of generating page faults much faster than we can
   resume them. GMU (GPU Management Unit) shares the same context bank
   as the GPU, so if there was a sudden spurt of page faults it would be
   effectively starved and would trigger a watchdog reset, made even
   worse because the GPU cannot be reset while there's a pending
   transaction leaving the GPU permanently wedged.

Patch 1 fixes the first problem and is independent of the rest of the
series. Patch 3 fixes the second problem and is dependent on patch 2, so
there will have to be some cross-tree coordination.

I've rebased this series on the latest linux-next to avoid rebase
troubles.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
Connor Abbott (3):
      iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
      iommu/arm-smmu-qcom: Make set_stall work when the device is on
      drm/msm: Temporarily disable stall-on-fault after a page fault

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  4 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 56 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 21 +++++++++++
 drivers/gpu/drm/msm/msm_iommu.c            |  9 +++++
 drivers/gpu/drm/msm/msm_mmu.h              |  1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 46 +++++++++++++++++++++---
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 32 +++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 +-
 9 files changed, 167 insertions(+), 6 deletions(-)
---
base-commit: 0907e7fb35756464aa34c35d6abb02998418164b
change-id: 20250117-msm-gpu-fault-fixes-next-96e3098023e1

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>


