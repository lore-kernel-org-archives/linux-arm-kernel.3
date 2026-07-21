Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3573C44524
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 02:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ehQyL3yVbLuittsORgFXc0Ov1t74Yv3YeCmk2zqSXrM=; b=g+HtDguX8PMe8GXjbO1rIvsgwc
	sy5R5+tf1GpvM9oEbpaO7I9ZXQNZBa3YLK6lY5VLLL2OW0avJNfLALAVAKzM0HV0MqKLd05gbtWQZ
	fJNLN3qVWN6AnXDqbCcXgyeB0mEteeDE415gzk3KrR323sZWWwfTlD1TiYUFvAj8nswM2Q82qhA2m
	FrFtgfRFjJLT3Y4rIWDAIwyLJWdZpYNd3245atAc9u1HXvIqajXX4m97g1IO5b5RyFuMYHVZ4/oEQ
	D6K8+pimKiGVHJnoWFk0muxOgZkZguNVXYWze54/hEeWCdqmEnzdM7jmqLt0H1zUwr9MMTTOevhkX
	rPbzqGUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm0Bk-00000008FXi-0d66;
	Tue, 21 Jul 2026 02:26:32 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm0Bh-00000008FUm-1G1b;
	Tue, 21 Jul 2026 02:26:31 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wm0BL-000000000Cr-1a0z;
	Tue, 21 Jul 2026 02:26:07 +0000
Date: Tue, 21 Jul 2026 03:26:04 +0100
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
	Allen Chen <allen.chen@ite.com.tw>,
	Hermes Wu <hermes.wu@ite.com.tw>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/4] drm/bridge: it6505: DP audio support + shared-DAI
 hw_params fix
Message-ID: <cover.1784600387.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_192629_336873_38205FBC 
X-CRM114-Status: GOOD (  16.99  )
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

This series revives HDMI/DP audio support for the ITE IT6505 DP
bridge, originally posted by Jiaxin Yu [1], rebased onto current
-next and with the v3 review feedback addressed: the stale
&client->dev usages reported by AngeloGioacchino Del Regno [2] are
gone (the driver meanwhile gained it6505->dev), and the
"#sound-dai-cells" binding property requested by Chen-Yu Tsai [3] has
since been added by commit 325af1bef5b9 ("dt-bindings: display:
bridge: it6505: Add #sound-dai-cells").

Patch 1 fixes a pre-existing use-after-free in the driver's remove()
path: none of link_works, hdcp_wait_ksv_list or hdcp_work were ever
cancelled before devres frees the it6505 struct, unless DRM core
happened to call the bridge's .detach() first. It is needed before
patch 3 so that wiring up the new hdmi-audio-codec platform_device
does not add another caller into an already-broken teardown path.

Patch 2 fixes a second pre-existing bug: it6505->audio.channel_count
is zero until either DP link training or a valid ALSA hw_params call
has run, but it6505_enable_audio_infoframe() indexes an 8-entry table
with channel_count - 1 unconditionally, which is an out-of-bounds
stack read if the audio-FIFO-error IRQ fires first. It also fixes a
debug print that logged the previous channel count instead of the
rejected one. Needed before patch 3 for the same reason as patch 1:
that patch starts exercising the audio-FIFO-error IRQ path in a
configuration (shared I2S bus) where it is actually likely to fire
before any display has ever been hotplugged.

Patch 3 wires up the previously-unused it6505 audio helpers via
hdmi_codec_ops, which unblocks the mt8186-mt6366 sound card that
references it6505 as the I2S3 codec.

Patch 4 is a follow-up fix so that audio hw_params are accepted even
when the it6505 DP output has no display (and thus no encoder)
attached. This is needed when the it6505 shares its I2S bus with
another codec, as on the MediaTek MT8186 "steelix" Chromebooks, where
the shared I2S3 must keep working for the speaker path regardless of
the it6505 link state.

Tested on a MediaTek MT8186 (google,steelix) Chromebook.
Actual HDMI/DP audio output could not be tested lacking the USB-C
adapter cable. However, making the it6505 at least probe and fixing
the obviously missing things makes the sound card on the Chromebook
come up and internal speakers and microphone as well as the headset
mini-jack work as expected (both tested).

[1] https://lore.kernel.org/all/20230730180803.22570-4-jiaxin.yu@mediatek.com/
[2] https://lore.kernel.org/all/c35ef2d8-ab40-484b-9a4c-38f2f3e7d99c@collabora.com/
[3] https://lore.kernel.org/all/CAGXv+5G2tP9i8VrUc6-xs2d72_nL9XH9iSCeixzA2AM7X5fXOQ@mail.gmail.com/
---
v3:
 * new patch 1: cancel link_works, hdcp_wait_ksv_list and hdcp_work in
   it6505_i2c_remove(), fixing a pre-existing use-after-free flagged
   by automated review of v2
 * new patch 2: guard it6505_enable_audio_infoframe() against
   channel_count == 0 and fix a debug log printing the wrong channel
   count, both pre-existing bugs flagged by automated review of v2
 * patch 3 (formerly patch 1): serialise it6505_enable_audio() /
   it6505_disable_audio() with a new audio_lock mutex, resolving the
   "input welcome on whether a lock is warranted" note in the commit
   message; track explicit mute state so the audio-FIFO-error IRQ
   no longer re-enables audio out from under an ALSA-requested mute,
   both issues flagged by automated review of v2
 * patch 4 (formerly patch 2): no changes

v2: https://lore.kernel.org/all/cover.1784561622.git.daniel@makrotopia.org/
 * it6505: store the hdmi-codec platform_device and unregister it on
   i2c remove, fixing a resource leak / use-after-free
 * it6505: initialise the delayed audio work before registering the
   codec device
 * it6505: synchronously cancel the delayed audio work on audio
   shutdown and on driver remove (cancel_delayed_work_sync)
 * it6505: rework the mute path to cancel pending work synchronously
   and disable audio immediately when muting, removing a race
 * patch 2: drop the encoder check entirely instead of returning 0
   early, so the stream parameters are always cached; rewrite the
   commit message accordingly

v1: https://lore.kernel.org/all/cover.1784393979.git.daniel@makrotopia.org/

Daniel Golle (3):
  drm/bridge: it6505: cancel outstanding work before teardown in
    remove()
  drm/bridge: it6505: guard against zero channel count in audio
    infoframe
  drm/bridge: it6505: Don't reject audio hw_params without an encoder

Jiaxin Yu (1):
  drm/bridge: it6505: Add audio support

 drivers/gpu/drm/bridge/ite-it6505.c | 138 +++++++++++++++++++++++-----
 1 file changed, 116 insertions(+), 22 deletions(-)


base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
-- 
2.55.0

