Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134DAC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 17:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SF4su2A7LBkgNyuJx7QC3c3F7wOlkzt5ypMNp2gqA1w=; b=3axcKMAyLf3hkNRqFDQWLa0CYa
	tP38BiGZZkfJN/kBKNKWC6hmPiceflR3X0K5KhTntR+u3nO7xZtP0bajalYqZqP7NgfT8x2Rh3L9X
	vxteEpS/y+KaudqeAHRj8tQgQAMD/VE7VV9ErvoG0a4J2kvQWFRGNlHWB7iPglsHahnMv0t1+D4Mm
	TtPukF8ONHPTZJCATaB67p9ZqUK7DdtoXVhDUIOC8MFu/c6qCQOo3JFixKdwjhDVQca82MFCMiub4
	Ko5iOErQcfkjZ8cSSXQtoDQf+1E1Mu2zhQBm9eHhVlY1f0lRSt7BYGsE/yLFsYPqLl68EfFWxzFDh
	BGQ17SwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuZeJ-00000001KsO-0Z97;
	Thu, 13 Aug 2026 17:55:27 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuZeH-00000001Krg-0VBp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 17:55:26 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso2767105ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 10:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786643723; x=1787248523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SF4su2A7LBkgNyuJx7QC3c3F7wOlkzt5ypMNp2gqA1w=;
        b=KnMExlRNBsqnxa2IQkYCuLToi7Rmk+O3336K0Hj9D3bSLvleb5zQlyLXT2x+jMe06E
         bzAin3HCD3Wq3xdtdCN6goXbThwRiM8EUr3Vq84BCtLJK02qEFoGa1fQ2JUY5b3fe/B1
         7Hv0iDnTzdP40SQbpVs65uLiIiHrvJ5GX+jYUJvw+Akb+ma1JrhCir4k58KlZwYuml6n
         tj3q3FYZNGqzavwQwHwaEy8+whqvtw16YxA/BfShA2kFXrE4meabfShzGW9Gxj44kD77
         MTbw6HK/GZOHIINZJla+fdVgOlXBeJOt7alfMxs1Ft1WIiEOOrfypRWamy7VlUikNGzH
         HHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786643723; x=1787248523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SF4su2A7LBkgNyuJx7QC3c3F7wOlkzt5ypMNp2gqA1w=;
        b=IZMVOEM4nmpDRVUPYFIZtJ9kxxVitQeaQpOSg6lAw1grPoLYhnQShkjaM6ZGekZE65
         KE+eiT4FPuRE9zNH3wuM9rpvSu5QTQhSbIqni0GxPU5FBGnO7RXOQRHsWI8/oLWcRris
         WeHWKrqqHwN35WH0N6ozCMTyRlSfQoxB7cyMBxyfXtZATBNKyWtrkkqeLP1Oc3wfig6v
         cRot+Uh8ZEIUJzAB+9l+zxcxhdYbLygfSnV0sRc/CoJbgPEzozxrXcs8r8YDr8a/bRcc
         hHZMXc4qZd3pscB5FWkqkEcZKzB0Q3ANYA9NwJTvf8uJvTFkxYYDgN8KMqlqsJ3BLN0z
         /v2w==
X-Forwarded-Encrypted: i=1; AHgh+RpVmw1g6MbOemqoer91jbCjlQqxgGZCZuUNOGBYWkieUbGjLkCNRj2zxifXqGoKPyJwR/EOl64s7TnqwStFTJL8@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxb2igujY3ZndzekI4cN/AkQEsjtx5UPL2/1Oit32UqCZSoIg/
	fyuYbS8PK7VQsC/8IVTz0g7WGz3JIb6w1xMmo+Ws1LJ2Ce8maEv4yF02
X-Gm-Gg: AR+sD13ivSegmueivblzl9FekshvYqwoFOotHOnuVj92a25z8l6gLwcx5CGBDOH47Lb
	eNK92FH3R7rnd9c7LDEDUxSGaEdyZwTbq2k50Poho50PS/rUYXBHV4Vm7dAj40KnsO4dRNYRWWW
	czPs+zdAWPyoU9sU4ox0roPD7tjvqqXwaZtMyQS43vbOwd9G6TXgiBrK9lPjXD23jZXu8mHGwif
	pwBp2CNygIpNSrZ0A/YrWwY7Rs4zez/lBcTAZtF4eb1z6k9x+09qg/nrRaZitIWUM19BcxQomWW
	lgbP7/F1mWVnWC2phuOU48fGnuyYJ2hJt3IzUpYZXUm34FFX0ZQzqIOyTPBs91MovUktBdoVoTQ
	P3crOzNRcRaGVlpFCqTCQoTsBYkLaz5AybCs1CCVF5by+LeEf2okNROs2cLkTZCjYl0we4W0MLI
	FPhn+KiDoX2d5G1dr2hvT4i1LfH6S0CPg4Xlryd2/prIS4NnDtGy9gfxbI+1LTVrDGPfa7ybmSy
	g3/dgBp0ZgJkw89rJBstP6NbIfWbY6ANmBcUyPhsHqf4s93TxEUelHclBPseiEoDuzz
X-Received: by 2002:a17:902:c948:b0:2c0:b6c7:227e with SMTP id d9443c01a7336-2d37d52e1d6mr84044455ad.5.1786643723510;
        Thu, 13 Aug 2026 10:55:23 -0700 (PDT)
Received: from LAPTOP-M4N25KQ5.tail73068d.ts.net (1-160-237-124.dynamic-ip.hinet.net. [1.160.237.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aec05197sm675935ad.81.2026.08.13.10.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 10:55:23 -0700 (PDT)
From: Sean Chang <seanwascoding@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sean Chang <seanwascoding@gmail.com>
Subject: [PATCH v1] drm/mediatek: mtk_dsi: Open-code drm_simple_encoder_init()
Date: Fri, 14 Aug 2026 01:55:17 +0800
Message-ID: <20260813175517.156893-1-seanwascoding@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_105525_155765_95E89335 
X-CRM114-Status: GOOD (  11.85  )
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

The drm_simple_encoder_init() helper is deprecated because it adds an
intermediate abstraction layer that only wraps drm_encoder_init() with
an empty or minimal drm_encoder_funcs struct.

Replace drm_simple_encoder_init() with explicit calls to drm_encoder_init()
and define driver-specific drm_encoder_funcs carrying the cleanup callback.

Signed-off-by: Sean Chang <seanwascoding@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 49dfc0f825cb..276d57f8407b 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -226,6 +226,10 @@ struct mtk_dsi {
 	const struct mtk_dsi_driver_data *driver_data;
 };
 
+static const struct drm_encoder_funcs mtk_dsi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static inline struct mtk_dsi *bridge_to_dsi(struct drm_bridge *b)
 {
 	return container_of(b, struct mtk_dsi, bridge);
@@ -918,8 +922,9 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 {
 	int ret;
 
-	ret = drm_simple_encoder_init(drm, &dsi->encoder,
-				      DRM_MODE_ENCODER_DSI);
+	ret = drm_encoder_init(drm, &dsi->encoder,
+			       &mtk_dsi_encoder_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
 	if (ret) {
 		drm_err(drm, "Failed to encoder init to drm\n");
 		return ret;
-- 
2.43.0


