Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E55DC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/atnhhyuiyaYGTIs6tPwLh1U80J42TytoTU+U9u2siY=; b=V8qpc/3ANsb+8D8P62bKXjfsXx
	YXn3G5q28+FDsiWKGKLm9+54E3WhVeRriLDp4F8msNnf1pWTOBfXjvhd7f7TLhIGs5247tcVvzf/x
	mIloAtbQYIG4xwpAKKtYC88AJrXiKUVTROOprf9T0ZPlSxc8rOL36+T/B4Yo2LvWB2IQiA4G56aYm
	17KO3TLz52+ZzbeVyl8YLsm4OoWw5uOge48YpXNzMVspSkP93upz68DOrYbLuMgFXJFu/HnMTzd1h
	18jdpemJGqi98XbDCg38c0wPrF9HkT+JT1KFiR3ly6SP5SNRKDqKRz/rmaFwEzy7rmSKg6n+1ZQOQ
	RzTLXTLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwy-00000001veC-2Dfc;
	Wed, 01 Jul 2026 12:21:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwO-00000001tyT-1Dp3;
	Wed, 01 Jul 2026 12:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908477;
	bh=zDQHO31YQESRyD5xPDjrqaWl4NdzeVv2+s5rGc4p7JU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=neMY8j8NzNnXKb+pceojq+utU1dk5ofiAfq5UidcKHaFDRTjA/Ppw2caW6YpeuufE
	 2tTtstzje1E0v95Ylp9iXUn8+SCKSuB4q6tN8zt5+MD2MjEvsfIq+vNUpaUj6d2aJC
	 mxyISD9SBGOLQ8w74kqtwSIvPKsYAiBse5pSiV7Hr+ihJdCyNYShL2zduS0ao7D4rc
	 nZws0dI0DMUqaHjSQJM8NyNfh4FNDz9aqF5XR8RrSfkmjwyKOmeU1QmkzjL4w3Xf9d
	 Yx9rHH+n0aRGoJ1/vfLDYB3omAJiYqdFPPjPC/09p9zIhu2g/oH0rz2evdXhpa5gQL
	 TQnIAekgR3GXw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BE01717E0CA2;
	Wed,  1 Jul 2026 14:21:16 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH 13/42] drm/mediatek: mtk_hdmi_v2: Don't warn on RPM active during detach
Date: Wed,  1 Jul 2026 14:20:28 +0200
Message-ID: <20260701122057.19648-14-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_052120_574748_606E866B 
X-CRM114-Status: GOOD (  14.21  )
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

The Runtime PM may be active during bridge .detach() and this
happens especially at boot, when probe deferrals in the display
controller driver happen.

Even though it looks safe to assume that RPM has to be inactive
at that time, this happens to be true only if the DDC was to be
handled internally (like before .hpd_{en,dis}able() existed).

At this point in time, this driver uses HPD callbacks, and for
HPD to actually work it is necessary to raise the RPM refcount
to wake up the entire HDMI IP: since it's not granted that the
HPD or other children of the HDMI node are disabled during the
display controller probe sequence, the WARN at bridge .detach()
time may trigger (and will do that when mediatek-drm defers),
unnecessarily bloating the kernel log, as the RPM refcount will
be decreased anyway when removing the driver.

This is why the WARN(pm_runtime_active()) check during detach
is simply a development stage leftover: remove it!

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index 7bbf463056c9..0cc80e80ae26 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -995,8 +995,6 @@ static void mtk_hdmi_v2_bridge_detach(struct drm_bridge *bridge)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 
-	WARN_ON(pm_runtime_active(hdmi->dev));
-
 	/* The controller is already powered off, just disable irq here */
 	disable_irq(hdmi->irq);
 }
-- 
2.54.0


