Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4916E106F30E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AhfnsBmjL6PTqSJ6d1w99Feh6f2YhYZjbZMXjyNjc+Q=; b=Gj4q9lWWIko9ZVwnF0/0eRyB6n
	MQ7I63NfAFEOuWe1N41CGa4ejOVX+6LMPtGHJt88gtFBhXZ6yrcfGwYGy2amfW84UClZ6c7RxFnth
	jq6GBVbnqY/VI3AqTqibjf6TGvRMRDQXQvp1mBvYet7W2aa2ARGCYHwUQlmrdT2FBxaUjvxVGKeN/
	/pInZuuNmOLHZnTGTcHSimLkS5UgB+5/UlJBI2WR1YNHrVLbDF6Fg301dFVG7zGgvFAy7Yozdow4q
	cIlUesWwnIqhSaPy7EH8Au2QU7LoZ2JCL2/s5URs/kS2YWbtL7+c3c0Sup5qzOLX/pC2Uvx792IkD
	r4SqehyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5h3O-000000059oK-402A;
	Thu, 26 Mar 2026 09:31:02 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5h3M-000000059nl-1hVE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 09:31:01 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-82a62714fe6so303525b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 02:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774517459; x=1775122259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AhfnsBmjL6PTqSJ6d1w99Feh6f2YhYZjbZMXjyNjc+Q=;
        b=LjrjSaa43ug5G037qFr4YM9GzaBfUDrhlC5V+HGtAjSsTmwAIYEC4twWVhGJ1cKIY9
         4KH0nKJQmgW89ebGxaWmipD+bz4l1eQSnIidB53hWDF1+S7I/TwlRNW/rkqCPvG72Tnn
         wW3lqMg5CttALXQiB5JrqM4UQJbwrtrlc75e4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517459; x=1775122259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhfnsBmjL6PTqSJ6d1w99Feh6f2YhYZjbZMXjyNjc+Q=;
        b=cEcuvk2YQ/C4utIz6baxc68F9RHI66WLwk2K46AZ6rVa1ATmwj9IP4LzL4BUNuDLLK
         U73eDeSyW9xK9sxAqFfzOaoBcssRcfUt6k+8bkbGLOPBswy/wUjiCpBm+FQ1wHA4jpg8
         yk8UBqWPRrlHYsV9drO4C+/r8mdaOOmk+szLU2aNZUkiBwTxgm052vJHNkVRYxqvlA7h
         TKUBMIBwsyKOz7ujj/blKk6FBXinkH6CNU6zGd18Ez3+MfE92YcbuAcfVBb7x+wogjr6
         dAZl2vwcRkjgbixdePqjrZ1bu+XdU5z9UXaq8EYBnOmxwyTJpMUL+LQ0POX9N3Eww4U9
         0DaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRpeu8wAUaCTgGttLVbnHy+b58LPOCnLoklN3FV6gGat5XDbH5uU7i2M7rZnceV19Ej0pq3HfBRrAt7/0lUXxa@lists.infradead.org
X-Gm-Message-State: AOJu0YwdPKmM29ZXmiWds1lniYOy0A8RwMc/GitGQqtlzaGwdKiJ2Wwm
	irZYGyBE5rdCIKYXc5wHAWcvuhL/38dzqyCKfofYbRj+BrLnDNky9ZHDIWpDbIGHsA==
X-Gm-Gg: ATEYQzyVgEe3MBUTT68DHPwj2DgBel7txtzP6FPAR6BwrmnuCXoP4tRLCYS8HaE4iFu
	LJwD5yb26xzAE5mkNiZrc7v94c/uzfpfOKfvC3lfn1vXXTvF2TctgZbCXZJaG+O6Z8YwxK41eID
	SeopF7VNPV+iVPwIwQEXw4kPwKRHU/+loEMrFhPdI00ThsTE3yYoROC/3YfTOuNbVOEyyQXcXX3
	Pi+hicojwCd20S0H8yTAJJArCfMAo2KJZUxljLALeTUCKZPM5KN945ajJdCgv+b6XuLtPhMkt6h
	1tGvZDRDnhJOKlmTss4W451Iuloypk6zLi4DvThbMe2GEs+YP0MW4on/S91j31MqucozEunu05W
	L9V/YYURPyNZsBAG2SEiga2lT0SBeh1snKiiQtacWLlXGyprn6VzgZKd1ZI3QaKYJk9WwsowDx9
	FdKKdH5DwkcqqWlwb/xiu8I58a3qEUbz/KAz6j04JMKmS+hs+phm19Ytb/ke/lwI1QSufNaJo9d
	Qv468ya
X-Received: by 2002:a05:6a00:2d99:b0:81f:ac1c:709e with SMTP id d2e1a72fcca58-82c86a1e9f4mr970524b3a.31.1774517459022;
        Thu, 26 Mar 2026 02:30:59 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d1e1502sm2130970b3a.5.2026.03.26.02.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:30:58 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/exynos/dma: Drop iommu_dma_init_domain() stub
Date: Thu, 26 Mar 2026 17:30:38 +0800
Message-ID: <20260326093039.1152770-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_023100_485499_318149B9 
X-CRM114-Status: GOOD (  10.78  )
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

Commit 1feda5eb77fc ("drm/exynos: Use selected dma_dev default iommu
domain instead of a fake one") removed the code around creating a
custom IOMMU domain, but forgot to remove the stub.

Remove the iommu_dma_init_domain() stub as the function is no longer
referenced, and was also made private to the IOMMU DMA code.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_drm_dma.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
index 6a6761935224..ccc6b852ee7d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
@@ -23,10 +23,6 @@
 #define to_dma_iommu_mapping(dev) NULL
 #endif
 
-#if !defined(CONFIG_IOMMU_DMA)
-#define iommu_dma_init_domain(...) ({ -EINVAL; })
-#endif
-
 #define EXYNOS_DEV_ADDR_START	0x20000000
 #define EXYNOS_DEV_ADDR_SIZE	0x40000000
 
-- 
2.53.0.1018.g2bb0e51243-goog


