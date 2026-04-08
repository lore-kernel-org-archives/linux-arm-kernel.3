Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A051EFD5F7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 06:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U521sUYf25ASEfCtOQX+Ill+lllnFxxt3OJbaB5Iblc=; b=ou2GvfeJQF/q1Mqsa8sL+idJ9q
	mNLSqG/xt1cOv0nmT3OKELbSG9ftypdPsVfRNy41lYdpK56ClCMWB7RPd5bsoP7/8hB5JrH6OkE/D
	FSnClLoytEx4HsidR4IH15LUgCYSgPnbYcIaOgV0dhCH/ZL9QCari/1mWfYGA7BrDE0zqmmsAYwg0
	alf2/DR0rFmUfxOf5dI6UC423BLT/xz38lE/H56zYIVcqySgQ3o0/LyjHLMCUzXkBqr4OIIqKsIJ/
	Y6RIu9wA1NNDlPLQRcE8/Vh8OMJuFUIKPqR2Q9m6NuhyKcZZTbbeM+OA+Ux+teoiywrCx00PPdjbm
	wpME961Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAMkm-00000008NE4-2nO8;
	Wed, 08 Apr 2026 06:51:08 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAMkk-00000008NDQ-0SES
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 06:51:07 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-35d965648a2so4601406a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 23:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775631065; x=1776235865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U521sUYf25ASEfCtOQX+Ill+lllnFxxt3OJbaB5Iblc=;
        b=hm3TPyYzmlHHHUdVnPbtmB7udJ+ty5w2Fs2FWPm7elzuK1C5sJNkEq1bkZPc2hH4Gx
         E6BNsn5DVGyaWXLI71kc2JFQb9481w4KnrYpLx6ENECyRIQQp05QMx6+OLBbSWOF1k/G
         Ew6N/f217RQyJWi/AUSAGpcV90pmktU7m+e1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775631065; x=1776235865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U521sUYf25ASEfCtOQX+Ill+lllnFxxt3OJbaB5Iblc=;
        b=TCmK+Wocc76qN/iWgEmIdWDGAiWrMd/I2rNHmNF/L6lHp1meN/ya5UHnyx32DAhlV2
         IO4pYy4bRsrqKx7g6F9VgTxPXDXYjIN9ixFj6upAvRbCpC5KubGR5TL/sE1nUm5BDBwY
         +Hy4dtCoFw613cgrOSLArrbAzfozhmzE5HibpT+OKnCTUW2YbMsgWR9Ps7aXR32lYjte
         3YTQNeMPiTrpTyCJABNUr7SyZUhthPp91YxLN83vOyIJw+Za/v9wsYhKdT/DFaDkTTRC
         dCIWO207eqzPfdBhPVeXG8GfeoVhygxp425y0EEvxj/fgDf7jtWpjXeCvMoEcEglKk2Q
         0B7A==
X-Forwarded-Encrypted: i=1; AJvYcCV0pnIgJt1CSvZZG9Adxq3VGE1uXF3N9TfZkUeEUVO5DPZbMaWfABoYkDz7q8GPPetnhcAqvYgkzt+9Wm3vNy4Y@lists.infradead.org
X-Gm-Message-State: AOJu0YwRhdeF4SJdm9kuWqEvDgKt5Tb8nYzOtW8PyT5++FJ2lktJy91N
	8/nOgzLFOA+XJ5G1ZbKffsPRqOC44tMQiy/QyUgdrzJgQuyNuwQTI1BM2rw6S9YRxLUPxq6OyWd
	WX2g=
X-Gm-Gg: AeBDievBHaWYxJ1ARu4wy+AsGdWksriF5C0gpOzA/Vu0Tnnafk/UvDrSR8Y19qUJSfS
	608kSDv7NynpPp0i+mfaxD2y2dOqh4Z05NKazytSKN0oPKaI63t16rRDQWx/aYkzckvkrP49GC6
	NiV2lo8O/AfMUqPm0ChrwJQPs+63FenSJDPbzobU26SNbdg5QGW3T/oUzI1ShjLTy5xbzVT/KtB
	XOYkQkX00J6mOiMeQLCvaPdfAdxAGgiTmb/d77DZrJ1hxR37Au4tnN+8rzJsUlQOXdaOzAbNkp/
	Xq77ZZLTCjr3OeYcUiNjLTS2mL4SlN2bCiw4Y6MoMnP0XjAx/QPMpk9vjYZ40QMNLr1pp/BlTK1
	mvowc/mxo1T2we5EFnrlfzPrWNp3ytiqKyoiLZcYfU6bgR04yOHDKxDUQuRoOoQ66voeajyAWar
	foM7NEFdZdFI0OPgRe+6A2tGTeJgu+5+8FYcpoxlzEKwr1Okp8gp35SJ6Jb0FNhD7BtsAVjLovx
	DdX43LH13NgimXkDy4=
X-Received: by 2002:a17:90b:4f43:b0:359:f3b1:6811 with SMTP id 98e67ed59e1d1-35de67db862mr18680927a91.1.1775631064757;
        Tue, 07 Apr 2026 23:51:04 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f0e3:c8b2:74ff:70d1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe959886sm24889460a91.14.2026.04.07.23.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 23:51:04 -0700 (PDT)
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
Subject: [PATCH] drm/exynos/fimd: fix register offset type in fimd_trigger()
Date: Wed,  8 Apr 2026 14:50:54 +0800
Message-ID: <20260408065055.1353444-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_235106_148130_C9ABCDA5 
X-CRM114-Status: GOOD (  14.56  )
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

Sparse reports:

    exynos_drm_fimd.c:992:39: warning: incorrect type in initializer (different address spaces)
    exynos_drm_fimd.c:992:39:    expected void *timing_base
    exynos_drm_fimd.c:992:39:    got void [noderef] __iomem *
    exynos_drm_fimd.c:1005:33: warning: incorrect type in argument 1 (different address spaces)
    exynos_drm_fimd.c:1005:33:    expected void const volatile [noderef] __iomem *addr
    exynos_drm_fimd.c:1005:33:    got void *
    exynos_drm_fimd.c:1007:33: warning: incorrect type in argument 2 (different address spaces)
    exynos_drm_fimd.c:1007:33:    expected void volatile [noderef] __iomem *addr
    exynos_drm_fimd.c:1007:33:    got void *

Add "__iomem" to *timing_base to fix its type.

Fixes: 3854fab24e89 ("drm/exynos: fimd: support LCD I80 interface")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
random warning I found while checking for the size_t warning.
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index b6abdc4f2b0a..695d3515d421 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -989,7 +989,7 @@ static void fimd_trigger(struct device *dev)
 {
 	struct fimd_context *ctx = dev_get_drvdata(dev);
 	const struct fimd_driver_data *driver_data = ctx->driver_data;
-	void *timing_base = ctx->regs + driver_data->timing_base;
+	void __iomem *timing_base = ctx->regs + driver_data->timing_base;
 	u32 reg;
 
 	 /*
-- 
2.53.0.1213.gd9a14994de-goog


