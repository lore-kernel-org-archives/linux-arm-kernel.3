Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E4FC369CA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 13:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fPmaDVcyCN8xn5x/2E/HujSFy+Zs3h3dzceOeOvtskU=; b=PgAjKoWW6Uc4bSD+1+evSYOAm6
	CPoqRFQF1WkcRiqvbn9Pdx+PQlSjGYgyth/p6miLkv/vi/F6muQV7Gm0QfPUh/Htay1/B3rQaD4Gg
	TG0eeEBFMY91ESt4Z6qk4jerV8FicSPK9dyRP9Fv/BVjT64xAcY9Cf8h0/4GI7/GYgJcU2j+6ZoHy
	mjNH5v6O6QVzIYFB9Rze5B+UV3ZiJVXfk5IlfllMR/WJ4sbAWA8tCyZaiTHkwXi6BHp1iZV0EDNv6
	EEK9N3q9dughT6sQ18g1BeRF47ovVzUN1c6QWhqujc3gV9HXpT7sEguy2EkokLiIkK7otsAobzFPg
	ETcoaGFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5lSu-0000000GA0j-0M0R;
	Fri, 18 Apr 2025 13:09:08 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5lQy-0000000G9fl-2rUT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 13:07:09 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-440685d6afcso13829855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 06:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744981627; x=1745586427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fPmaDVcyCN8xn5x/2E/HujSFy+Zs3h3dzceOeOvtskU=;
        b=nWGHg/XrKggppf/+bDLYibM38JqjuWn4IpUTV/zQWrcXWQV/q0GpXqCRIEuAgOTPBC
         Mzb1+Wk7ZPfbB7TeFVc74N4WYvA0SLDHmGkxJ9GppLN5jkOFdGihLI1bGZWiMCuDFVi9
         oTXKK0TWgzUUufUDExms7rKpGdXVkK0gHMl2KLMpmrWInrdA612m6CwICTekROgJpJUm
         /2cDd+EUjXfx/0gHzkkV96KECsCCSXiCvB3mPMfCpMebD/pr6yoJCDaXigokgtm2w7zG
         r/wHJHYg0Vo1S0X7nlt9N9ew3gihkr8e9iMSXEEdvnQcfSilWRBQpTeU7CpPOamHIqWN
         j92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744981627; x=1745586427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPmaDVcyCN8xn5x/2E/HujSFy+Zs3h3dzceOeOvtskU=;
        b=ubrm2oUs+cxifwHD5mg8gQoUOsEhAG2KwCvTHo0yt91c/pCNSgtIhrb8uYlYiydjCi
         ffVJQ0jxPYmvTTgR1sAzlEFLEX3AhWjDT3vRB0fxb8rkCUmxWMfZny0/zfX0Sy3+BuLZ
         u+ksvfqg767W5exxMEuWYfyRKXcXEKF0+RDEcMdiJcX1FUQd9aMoXKdrJgSaHnu5iHR5
         GX/w2Tf6nv/rlbnmHhckxftdx27duSDoA0abUTpLH7GxMoBIVsqr0iDysSfQpuFla+dh
         jf9Qv3v+w81rvLP5AgKHvZumQLOKLqHspglhCH+I5L0ZH+X6p6DrgozhDs2TbAo/Y9iO
         fphQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUgU4C9CWdFZari+avNGuXAVexiDIKZksjDxmp2yjxxMuTh3W5Nx3tHtx/VdijeVCWRFODYp3h3LZ+Fj2M2fbn@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1S14dHB+K7mgrGog3JBT/fzkY6vgqFfD0BW3dpWu4dq4V/pk3
	/3cdErf586BRtarsjt94AESlyoL4jvEqBByblo7U6Xc3sA+WgxN/
X-Gm-Gg: ASbGncvR8l9Kk9JyDE6x+AX1mcCFi5HOC+c10D4HPzOZBdUjfhAQc7/ADbwm/8JSj6v
	3xRx3k2XeCS2UcBdoJ2NmChnnhzSKT7/2RlFLbdq/HGBXZr5eDCcTRuVOAfCbSRofqFDAOrZ6vt
	I9vfzKNKWmhUEqae7xsBbhAjs6WKgrm/EDWEjLnq20lwvdPrQh6zGp2dLbFhP4xB9TYfK3wn01N
	EqJQuWAvhOgL07A0XwbJmbMjRr82N5w5TE6WEhUPN0m58a3VZYagMzkVm4DLtkXBaGtYAMBLaF8
	opxq/VXyXyGrySb3KDRhwMNw+gLVHAfw67Kv9l9C6g==
X-Google-Smtp-Source: AGHT+IExMbsAQz7Mwc12HiLkpWeb7K2O1dS/WK/atDtpdKNgEq1aIQw+33yHgxXO3RSHnYFs46ICbA==
X-Received: by 2002:a05:600c:1547:b0:43c:e481:3353 with SMTP id 5b1f17b1804b1-4406ababea3mr21349975e9.17.1744981626906;
        Fri, 18 Apr 2025 06:07:06 -0700 (PDT)
Received: from localhost ([194.120.133.58])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa4330d8sm2796501f8f.33.2025.04.18.06.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:07:06 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/exynos: Fix spelling mistake "enqueu" -> "enqueue"
Date: Fri, 18 Apr 2025 14:07:00 +0100
Message-ID: <20250418130700.540590-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_060708_725128_6399F088 
X-CRM114-Status: GOOD (  11.75  )
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

There is a spelling mistake in a DRM_DEV_DEBUG_KMS message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index b150cfd92f6e..09e33a26caaf 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -908,7 +908,7 @@ static void fimc_dst_set_buf_seq(struct fimc_context *ctx, u32 buf_id,
 	u32 buf_num;
 	u32 cfg;
 
-	DRM_DEV_DEBUG_KMS(ctx->dev, "buf_id[%d]enqueu[%d]\n", buf_id, enqueue);
+	DRM_DEV_DEBUG_KMS(ctx->dev, "buf_id[%d]enqueue[%d]\n", buf_id, enqueue);
 
 	spin_lock_irqsave(&ctx->lock, flags);
 
-- 
2.49.0


