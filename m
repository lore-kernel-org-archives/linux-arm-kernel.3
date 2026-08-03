Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A745BC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5Gx76VJyX4gBn4VLPhypngQoj/jr3IBftVHMJXbc1Po=; b=bPDFzDluNrRvLAj9p17Rxq5Rfd
	Uukv7qfoqUEC9ieI5D4zJjgxzohpqzHdfo0Ozr0ScZHzAqyXiPprrRmJCOWoIcbXERSBDxhi+y6mW
	356eCNNo67NaIxkXQEC8MuOxVgqIOnT48x2+8qygHkRDGktsnPWo3NvQf4ZG3+bSsZFKu3RerYB+9
	jkvA3crJSfzTGZMcXmzm6DkoKJNN8Zk7y+oX6be4IaxbfvHO6hh+RnY7OFrqH++2PJC4jjBQSUib9
	5pNFRmJhAMq0OhPB6iWEIeXTRpcAIBybbcTlRasR9UzHk1ijSWex7wFmErhU0gg6pVJ6aI3QXqBKP
	ZAnLMJyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt6i-0000000HGjq-24LW;
	Mon, 03 Aug 2026 13:53:32 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt6f-0000000HGij-2vvt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 13:53:30 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-848743155bcso1267347b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 06:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785765208; x=1786370008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Gx76VJyX4gBn4VLPhypngQoj/jr3IBftVHMJXbc1Po=;
        b=mSTe4OUaA9J1b2d3Ew7ygoIvx80QpeTjH4dQ/Q9IpFYgOlOfbd5+PsN8DuKbMQhxbF
         PeQF0oBWe63PkQxn9gelf6ZMILQYfhkNBTSldOTRI5XUzNUTU0f1atcRrutokKvT906T
         id1SL8vBji02uAnxv8cILg6Vo9Go9lEPADUJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785765208; x=1786370008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Gx76VJyX4gBn4VLPhypngQoj/jr3IBftVHMJXbc1Po=;
        b=r68ukkenBXwLpjmh/HeF0MipV6plZL+9PdxfypGto4UyKbWj/2y7ybeVYmawGrmO7p
         6LIJd0cXJjr9GI6SK7VeMKPTPWIx52jU8YKmHBheTxrlDdDERqj/lOsYIqxL4Z/t1k62
         tHiGCvivNUCmDLsQ9tePEDdwZBI7EVFWJam374L++8AauvQ+EdCGcrUghFzKeFCsV3Zv
         /vR80L+Bh14vQWqLvIPuI0L1eQUO01yw9eDs8mZoT2Bzn4fE1Am34HMQGsfqRvmSSyLc
         eAHiwBMjLY/IyGIjU47ngMeZlpxw6H9ksVStGM6/YEqJVRIBO+hh79GefTFCAquEhNKu
         R7HQ==
X-Forwarded-Encrypted: i=1; AHgh+RrlEtKzFPgVr1/HjPUjebrIUYKvqFmBM68R9p8WR9LY0udYJ/lLfUPjPf9wFuE7Zj1LbF3f7dTkXrieWHrTmHAS@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0dQ7NplLDPS7FHDjCTqfsgTCnSFrnvN/3C9E/v8EtZ04B8YbW
	xrc6uYDOTBPAF26/kcvJXgd/fqBNq3zrCm9Gg7GTsLai128OeBc1wGVxskQ6Vw6J6tWNtGOPtxK
	WIz5NzA==
X-Gm-Gg: AR+sD136WhydFX+HUCt/Vqko5Tcs5wA4WhMFhJsS3o5Es9ssJycf+hJmvXbeNI+daHw
	4ZBfpk51MUEPuZGryYiIiYoeTNI4Vd5v06buZ4Yd2g4e3URtC1JuKyAWnIX46Ktpq5l/fj490LH
	ZNLpkNiwiHl64nygdtR77FM/0DvgEnd8n5O0/DuvrY5M8gJp5gpm2cIyQ+GfjJDagUhcdP7uHSG
	A87qArVhOTMouTVgIT0xw/R6CrTdBRwNkMTcTbgm5h3W/Uf+5w8otqN+Tmtdn+yyLqrDlQ7Kxo3
	LZ/EyaOTDC1on4FiqV8z90kaxis8neo54DKQkn8YBoisGdxpz1e8TIUzzz12g+7EW/pQHU4bPFb
	q25q3ep26QM6HGSfuKvLjdRTFWSIB54dmpgNI7wPL4KIoCsPlaBSh+nfMWc3mTGl6ZO95X5xMlY
	F5l8rCEUNT5gflgVmv/zMOZwy/g/hmvb6fR17Jz1JtoMdXob90z3Q5UbzWh+KAr0eX/hHV9Wykc
	KtUMKeEEzkrVwDj6dG/FelKFWr43yuNDbfqilcCjDkB5w==
X-Received: by 2002:a05:6a00:399b:b0:848:4ff5:5316 with SMTP id d2e1a72fcca58-84ee480a3c8mr9142674b3a.19.1785765208605;
        Mon, 03 Aug 2026 06:53:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:1c0b:57ba:92e2:e178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe7a243sm3757511b3a.24.2026.08.03.06.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:53:28 -0700 (PDT)
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
Subject: [PATCH] drm/exynos/gem: Drop extra "0x" prefix in front of "%pad" format
Date: Mon,  3 Aug 2026 21:53:21 +0800
Message-ID: <20260803135322.2898247-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.571.g244d577d93-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_065329_737017_BB6B1C1E 
X-CRM114-Status: GOOD (  12.69  )
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

The recent size_t format string fix for exynos DRM driver left the "0x"
prefix in front of "%pad" format around. Since the pointer format output
already provides "0x" prefix, this ends up adding an extra prefix.

Drop the redundant "0x" prefix".

Fixes: 3470274dca48 ("drm/exynos: fix size_t format string")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 0208c9259572..acb8def747de 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -80,7 +80,7 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
 		return;
 	}
 
-	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%pad), size(0x%zx)\n",
+	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(%pad), size(0x%zx)\n",
 			  &exynos_gem->dma_addr, exynos_gem->base.size);
 
 	dma_free_attrs(drm_dev_dma_dev(dev), exynos_gem->base.size, exynos_gem->cookie,
-- 
2.55.0.571.g244d577d93-goog


