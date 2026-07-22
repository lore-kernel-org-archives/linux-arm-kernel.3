Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5E7C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 00:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajWAwcErM4NFG2VUEQ2mwMT3BAUyj12rOUEc/JPCE+8=; b=oei4L8F2BtuofbltF5xttl0DTH
	C+VYEg3axtJwqySswBFPufcwJqqX9F7PkVKnljEfQkxge89DtICrTvJftxnyPNfy3Y0QW1sSvB9ho
	vVbo2Hs0mbKXYFU/DYjhK6Z1efleGYtxVnye2w05OK4rPasNaZz58H9fTZPUfFIq52g/fWv3HJpkm
	FmEBrYzyGnv16+AIkKjYvREagh7Qe0rFmU4ZxBVzxTG7Ci2JsaUP+K2pBM1PmiY914IhN5R4cHO1t
	+PfLJF1vGZrI3e7WsDOl1mTfeZWQG4avMFzGw/17LisCJSXo4VbNU7P9IcjV0BtYp+xKWsxiz8cPY
	eUMKvFTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmLJP-0000000Afs0-3LEh;
	Wed, 22 Jul 2026 00:59:51 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmLJN-0000000Afqi-27Xe;
	Wed, 22 Jul 2026 00:59:50 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wmLJF-000000000zf-0Aua;
	Wed, 22 Jul 2026 00:59:41 +0000
Date: Wed, 22 Jul 2026 01:59:37 +0100
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
	Allen Chen <allen.chen@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v4 3/5] drm/bridge: it6505: guard against zero channel count
 in audio infoframe
Message-ID: <94721d5c75645a574263cc849249c56e504c2ade.1784681487.git.daniel@makrotopia.org>
References: <cover.1784681487.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1784681487.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_175949_547682_4A6C8EC4 
X-CRM114-Status: GOOD (  13.34  )
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

it6505->audio.channel_count is zero from allocation until either DP
link training has run once (it6505_variable_config()) or a valid
hw_params call has cached a channel count. it6505_enable_audio() can
be reached before either of those has happened, e.g. from the
audio-FIFO-error IRQ, which is unmasked unconditionally at poweron.
it6505_enable_audio_infoframe() then indexes the 8-entry
audio_info_ca[] table with channel_count - 1, an out-of-bounds stack
read when channel_count is still 0.

Bail out of it6505_enable_audio_infoframe() when channel_count is not
yet known instead of indexing with it.

While here, fix the debug print in it6505_audio_setup_hw_params(): on
the invalid-channel-count path it logged the previously cached
channel_count instead of the actually-rejected params->cea.channels.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
v4: no changes

v3: new patch, split out to fix pre-existing bugs flagged by
    automated review of v2's audio series; needed before that series
    starts exercising the audio-FIFO-error IRQ path in a
    configuration where channel_count == 0 is actually reachable.

 drivers/gpu/drm/bridge/ite-it6505.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 2a8298ee6c03..443ea5579744 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -1575,6 +1575,9 @@ static void it6505_enable_audio_infoframe(struct it6505 *it6505)
 	struct device *dev = it6505->dev;
 	u8 audio_info_ca[] = { 0x00, 0x00, 0x01, 0x03, 0x07, 0x0B, 0x0F, 0x1F };
 
+	if (!it6505->audio.channel_count)
+		return;
+
 	DRM_DEV_DEBUG_DRIVER(dev, "infoframe channel_allocation:0x%02x",
 			     audio_info_ca[it6505->audio.channel_count - 1]);
 
@@ -2991,7 +2994,7 @@ static int __maybe_unused it6505_audio_setup_hw_params(struct it6505 *it6505,
 
 	if (params->cea.channels <= 1 || params->cea.channels > 8) {
 		DRM_DEV_DEBUG_DRIVER(dev, "channel number: %d not support",
-				     it6505->audio.channel_count);
+				     params->cea.channels);
 		return -EINVAL;
 	}
 
-- 
2.55.0

