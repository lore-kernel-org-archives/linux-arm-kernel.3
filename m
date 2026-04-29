Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F22FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zl9XgC3TfyOqXWuiClERpmBwbbrr/I0CkpxRLL3CCak=; b=M5+LgDwun6LzxybUDaPO9MLNu9
	xynM1Sg/S1O2H5a2/LpLalpv1t7RVCYvGxwu/rtcaDvJSFmhz+5BLeQHFMas+jiTx6LVO+nKQ4PKx
	9fcGh2PaLNW2jVQMDbW1QlpJKQQYkrOxxWR6j/qnhWuIcoiwEh7wQzMGCwpMG4Fx5mn5nQydHU6Ic
	17nG8rA15H2LxJAlAjYA4Hz73v5k0WPK0DEB54tuHcXV2jUTL3x7lV/uKaBDVa+y4IXj3SgZkXcrG
	RZz5uUvNmZ4rMmdiOos433qZVouVA81UXu2I/RNQczpg7i4JtrcozDkH8dIZ109/9hMgN/Bm+Jxdj
	uKh6x7mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1hX-00000003Pie-00Rd;
	Wed, 29 Apr 2026 09:59:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1hQ-00000003Pef-1ipC;
	Wed, 29 Apr 2026 09:59:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777456757;
	bh=LyfP3fNgBZbx3Y7bMZIcMNk42pMyUhQMoz9M6xKuTBU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Sn1c1ARpDTFmUw6OvH8jUoV7ESk11yWm/zJ/tSePIlq2U2WEU9iV05grUeHDFt6YX
	 +rtDQbWBh6QeNSOYpSM2Pb66Cl16nPZezJpJqqApzVpbPKLx88Ca2Okw/q5cHkUEzj
	 3nQfaeAjUyUwde8AjBsGyNws+eHwRYEa0HksFAnmoPsrmYfcVYPBuxZ1EVGojpwb09
	 u56b18ImAS51f1urLUN5e8lMSByF4AxHxmaHQZ5zOzn5VgfW4ei4X58baJJm3lAf3a
	 9nwAR1KXaXqMSXF8AMRcbLD7l88WUcJWTqsszx/fGroUTSWx8UTBIk4hD5QDxeYAzM
	 7dnYOPGEdnVvg==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D514717E1502;
	Wed, 29 Apr 2026 11:59:16 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 29 Apr 2026 11:58:59 +0200
Subject: [PATCH 1/4] drm/mediatek: mtk_hdmi_ddc_v2: Fix non-static global
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-mediatek-drm-fix-sparse-warnings-v1-1-d95c4d118b83@collabora.com>
References: <20260429-mediatek-drm-fix-sparse-warnings-v1-0-d95c4d118b83@collabora.com>
In-Reply-To: <20260429-mediatek-drm-fix-sparse-warnings-v1-0-d95c4d118b83@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777456755; l=1276;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=LyfP3fNgBZbx3Y7bMZIcMNk42pMyUhQMoz9M6xKuTBU=;
 b=BneHREU+huFw3thbhe7FS2zvw8FvXQGPmcNzalvbNjY2xpbm0QYcyQaHN8eLPMrkSBRDFKtAK
 fnKnQV1qajKAYGBCAB3bRtU7C3/2NLCzmOpIGO1w3sEpRrhpCepm+/o
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_025920_641030_7B4230A2 
X-CRM114-Status: GOOD (  13.43  )
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

The struct 'mtk_hdmi_ddc_v2_driver' is not used outside of the
mtk_hdmi_ddc_v2.c file, so make it static to silence sparse warning:
```
drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:392:24: sparse: warning:
  symbol 'mtk_hdmi_ddc_v2_driver' was not declared. Should it be
  static?
```

Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604132044.fcYjEcU8-lkp@intel.com/
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
index d937219fdb7e..31e81a6de6d8 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
@@ -389,7 +389,7 @@ static const struct of_device_id mtk_hdmi_ddc_v2_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_hdmi_ddc_v2_match);
 
-struct platform_driver mtk_hdmi_ddc_v2_driver = {
+static struct platform_driver mtk_hdmi_ddc_v2_driver = {
 	.probe = mtk_hdmi_ddc_v2_probe,
 	.driver = {
 		.name = "mediatek-hdmi-ddc-v2",

-- 
2.54.0


