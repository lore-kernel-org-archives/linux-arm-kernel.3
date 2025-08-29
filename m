Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A7FCA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 10:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8GnmUKWDJlRgWN2/IhQKyobnL8ui9xca7cB7B0oUi8=; b=lFI+lJkofXVC1sO0/9lscqcBE6
	NnqMZWA6P/896ONB6YNbi9XUlH+HtE3/U6FNYBEEtt7jYSw6DX/aullyRJLgJvyzB0L6sKuJzy4+C
	AbzV04LzVmImYr4E6fK8MCKy8nCospP5+an0wMB6vwlwepw4xBP0WTr2oM3PGUnV4fakZVdSzftpc
	jnhdyZ9a6mUIfQOJFNXAusKaSZmBhwJan5tfK8Jn9bu7KJPqHV4gDjXCz7WtH3FIOWefb6Oehj5vj
	KyGPxKZN6c3/bOyK+qjsrmVRgy/l7mA899+yZClguFEW4cOjtJgGU5fZ6vLEJe5hklQaHSckuj0N1
	sqRz4I3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urw7e-00000005HQK-06hI;
	Fri, 29 Aug 2025 10:14:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urv38-000000054pX-0Po8;
	Fri, 29 Aug 2025 09:05:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B96B54172F;
	Fri, 29 Aug 2025 09:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997B4C4CEF5;
	Fri, 29 Aug 2025 09:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756458333;
	bh=vYVabSltptJRE83ss4FzMAYlVF/0xeNcsPWfCCvyH88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G22pMn2mPsU48neBJG5HJBNrKPDONRCT4j7/5Q1t9M8uJZGA7cmxMmok1u7yUgUoe
	 0t3AjiJpU0w4aHv8CHKUtCdp9BB5mwINnmG1kmuR5OmiNg/lOifbESKFe0ytn8VX1p
	 IZoX64m1TA/7Bp+fipeSq1WsPRbp9r/TUbziLrJDuS+YUWRxit9k2F07//4mLcGby9
	 Sd1fbIDU3ggDWf8/Yn6Z3JZ8Z50WKsmiSTXkSV9vhcp+6wi0JX93raVTzRqL8iYGX9
	 SOK0actdeTa34s9N28zD0ZqhOju8Q1phurizAqXkgU1Iem2rjm5dTflJmZv56OIg4v
	 hZi3+djVxatrw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1urv2x-000000005WH-0zjm;
	Fri, 29 Aug 2025 11:05:23 +0200
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ma Ke <make24@iscas.ac.cn>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/2] drm/mediatek: clean up driver data initialisation
Date: Fri, 29 Aug 2025 11:03:45 +0200
Message-ID: <20250829090345.21075-3-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250829090345.21075-1-johan@kernel.org>
References: <20250829090345.21075-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_020534_159758_15858B8B 
X-CRM114-Status: GOOD (  11.56  )
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

The platform and drm devices are only used to look up the drm device and
its driver data respectively when initialising the driver data during
bind().

Drop the reference counts as soon as they have been used to make the
code more readable.

Note that the crtc count is never incremented on lookup failures.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 3b02ed0a16da..33b83576af7e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -395,12 +395,14 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 			continue;
 
 		drm_dev = device_find_child(&pdev->dev, NULL, mtk_drm_match);
+		put_device(&pdev->dev);
 		if (!drm_dev)
-			goto next_put_device_pdev_dev;
+			continue;
 
 		temp_drm_priv = dev_get_drvdata(drm_dev);
+		put_device(drm_dev);
 		if (!temp_drm_priv)
-			goto next_put_device_drm_dev;
+			continue;
 
 		if (temp_drm_priv->data->main_len)
 			all_drm_priv[CRTC_MAIN] = temp_drm_priv;
@@ -412,12 +414,6 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 		if (temp_drm_priv->mtk_drm_bound)
 			cnt++;
 
-next_put_device_drm_dev:
-		put_device(drm_dev);
-
-next_put_device_pdev_dev:
-		put_device(&pdev->dev);
-
 		if (cnt == MAX_CRTC) {
 			of_node_put(node);
 			break;
-- 
2.49.1


