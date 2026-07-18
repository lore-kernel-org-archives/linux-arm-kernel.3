Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7A3C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 17:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRu+5jgu0dhVNaa0NfROuGLRH11j5nDGGdjs/pTJzi8=; b=TH9FsEAZ3q32c+Bt6O/skW6H7M
	Wo1Szs41UOzQUXCaoDyRo1Gwh9uwvpE7vGGVmtHyYgUmYawOtvSFuPPwIS3y4UG8bMdz+XVMLd7Lv
	hiAmTFMmApqYyCH0/Z9sV47p/A0cNufeVqKv7ixHsgqy0ZC04A5lOaSOaDQ+AwU6J5YD9ZTUOwBZE
	PTpSTU8rVXuV0DaySV8QLTTN4HV0gKd1NBVZV2jSfJdIazMH/8xxTSFeand+rk5NIuHQ2D6fnbFMN
	NEZ4xIPY/SkVqBE8SfHNKgfCaWQ7tbO2aLIo+Ci9yQlueDVo2s5g+BT8MCtbILAWsAKYrtY40FWs7
	a0Umshdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl8RR-00000004MBM-1hxt;
	Sat, 18 Jul 2026 17:03:09 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl8RN-00000004M9y-1Uzm;
	Sat, 18 Jul 2026 17:03:06 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wl8RG-000000007ru-3SD7;
	Sat, 18 Jul 2026 17:02:58 +0000
Date: Sat, 18 Jul 2026 18:02:55 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	Allen Chen <allen.chen@ite.com.tw>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] drm/bridge: it6505: Don't reject audio hw_params without
 an encoder
Message-ID: <4efccd2179cadef2209ef6ecc0c898025276117d.1784393979.git.daniel@makrotopia.org>
References: <cover.1784393979.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1784393979.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_100305_425080_348C7F7C 
X-CRM114-Status: GOOD (  12.66  )
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

it6505_audio_setup_hw_params() returns -ENODEV when the bridge is not
attached to a DRM encoder. Now that it6505 registers an hdmi-audio-codec,
this callback runs whenever a stream is configured on the I2S DAI it is
wired to, including when that DAI is shared with another codec. On
mt8186-corsola the speaker amplifier (rt1019) and it6505 share I2S3, so
when the it6505 DP output has no display attached (bridge.encoder is
NULL) the -ENODEV propagates up through dpcm_be_dai_hw_params() and tears
down the whole backend, breaking speaker playback.

A codec must not fail hw_params on a shared DAI just because its own sink
is absent; the actual output is already gated by it6505->powered. Return
0 so the shared link can be configured.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 698ae01b3a47..e88960c82a23 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2979,7 +2979,7 @@ static int it6505_audio_setup_hw_params(struct it6505 *it6505,
 			     params->cea.channels);
 
 	if (!it6505->bridge.encoder)
-		return -ENODEV;
+		return 0;
 
 	if (params->cea.channels <= 1 || params->cea.channels > 8) {
 		DRM_DEV_DEBUG_DRIVER(dev, "channel number: %d not support",
-- 
2.55.0

