Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DAEC98321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 18:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UzJuyoSm0EtM9iBnYcGi4gSn7JkZuf+TjAAEDJt717g=; b=h8LUcLqWdwtS5Ic+DW0v27bA6r
	v3K+wGaxF/uDzlDshQ/0FNrjgOkQs3UKQnJDamvc0aEAqc06dEo3+728Wu9H82trfCZYSEBaQyZqR
	Lb9wNPjTtskh8zKa/5DRpMuo5EslIwCWEtePQkpHYLs3c2bn5MznljXfuB3IVl3zMh7Oe1Far6wJr
	GeMFc3TDdL1O2MSLLauQYf3Qs93mFO4D6XkLltzSL8OsOVitwatXg+Oglk0dKo7+vHRml+6m1oRQE
	QlP2snCO/UbonnsvUGk3PrKvE9Ep2XyN8QbQVdqLBYn8z6j4d3tcI7XIGct/SHK4F35Qra8eirmT6
	RlnhHNKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9oMq-0000000BvQq-3CUy;
	Thu, 24 Sep 2026 18:40:24 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9oMo-0000000BvPE-168T;
	Thu, 24 Sep 2026 18:40:23 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100)
	(envelope-from <daniel@makrotopia.org>)
	id 1x9oMU-000000007GV-1R2Y;
	Thu, 24 Sep 2026 18:40:02 +0000
Date: Thu, 24 Sep 2026 19:39:58 +0100
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
	Hermes Wu <hermes.wu@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v7 00/14] drm/bridge: it6505: DP audio support + shared-DAI
 hw_params fix
Message-ID: <cover.1790275151.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_114022_303123_6C0A0359 
X-CRM114-Status: GOOD (  15.08  )
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

Revive HDMI/DP audio support for the it6505, originally posted by
Jiaxin Yu [1], rebased onto current -next with the review feedback
addressed: &client->dev is gone (the driver gained it6505->dev) and
"#sound-dai-cells" has since been added by commit 325af1bef5b9
("dt-bindings: display: bridge: it6505: Add #sound-dai-cells").

Patches 1-12 fix pre-existing bugs found during review of earlier
versions of this series; they carry Fixes: tags and are ordered first
so stable trees can pick them.

Patch 13 wires up the it6505 audio helpers via hdmi_codec_ops,
unblocking the mt8186-mt6366 sound card which references it6505 as
the I2S3 codec. Patch 14 makes hw_params succeed with no display
attached, needed when the I2S bus is shared with another codec as on
MT8186 "steelix" Chromebooks, where the speaker path must keep
working regardless of the it6505 link state.

Tested on a MT8186 (google,steelix) Chromebook: the sound card comes
up, speakers, microphone and headset jack work. HDMI/DP audio output
itself could not be tested for lack of a suitable adapter cable.

[1] https://lore.kernel.org/all/20230730180803.22570-4-jiaxin.yu@mediatek.com/
---
v7:
 * new patch 2: cancel link_works, hdcp_wait_ksv_list and hdcp_work
   in it6505_poweroff() so link training and HDCP authentication
   cannot run into a chip being powered off; pre-existing, found
   while assessing the Sashiko AI review of v6
 * patch 13 (was 12): it6505_poweroff() clears the powered flag
   under audio_lock, closing the race between the codec ops and a
   concurrent power-off flagged by the Sashiko AI review of v6; the
   it6505_enable_audio() wrapper is folded into the delayed work
 * the remaining v6 review findings are already fixed by later
   patches of this series (patches 3, 4, 6, 8, 11 and 12), concern
   pre-existing code outside its scope (whole-register restore in
   it6505_audio_input(), unchecked reads in it6505_aux_i2c_wait()
   and it6505_calc_video_info(), regulator disable order) or do not
   apply (AUX unregister on unbind, missing newline in dev_err())
 * rebased onto next-20260923
 * patches 1, 3-12 and 14: no changes

v6:
 * patch 1: track notifier registration in a flag instead of
   clearing notifier_call, which a chain traversal racing the
   unregistration could have called as NULL (extcon traverses its
   raw notifier chain unlocked); flagged by Sashiko AI review of v5.
   The in-flight-callback race also flagged there is an extcon core
   limitation affecting all its consumers and cannot be closed from
   a consumer driver.
 * patch 4: note that a failed regulator_disable() leaks the
   reference either way
 * new patches 10 and 11: two more pre-existing fixes from v5
   review, an uninitialised link-frequencies value and an error
   code written back to the reset register
 * patches 2, 3, 5-9, 12 and 13: no changes

v5:
 * patch 1: serialise notifier registration state with extcon_lock
 * patch 2: also drop the runtime PM usage ref held for a connected
   display; retitled
 * new patches 3-7 and 9: more pre-existing fixes from v4 review
   (AUX unregister symmetry, poweroff error path, IRQ status read
   errors, two divisions by zero, of_node_put before use)
 * patch 10 (was 4): update plugged_cb/codec_dev under mode_lock
 * patches 8 and 11: no changes

v4:
 * patch 1: quiesce extcon notifier and IRQ before cancelling work,
   initialise extcon_wq in probe; retitled
 * new patch 2: disable runtime PM on remove
 * patch 3 (was 2): collected Chen-Yu Tsai's Reviewed-by
 * patch 4 (was 3): start out muted; mute state and cached
   parameters updated under audio_lock; unregister codec after
   quiesce
 * patch 5 (was 4): apply audio defaults at probe time

v3:
 * new patches 1 and 2, fixing a pre-existing use-after-free on
   remove() and an out-of-bounds read with channel_count == 0
 * patch 3 (was 1): serialise audio enable/disable with audio_lock;
   track mute state so the FIFO-error IRQ cannot undo a mute
 * patch 4 (was 2): no changes

v2:
 * keep and unregister the hdmi-codec platform_device on remove
 * initialise delayed_audio before registering the codec device
 * cancel delayed_audio synchronously on shutdown and remove
 * disable audio immediately when muting
 * patch 2: drop the encoder check instead of returning 0 early

v1: https://lore.kernel.org/all/cover.1784393979.git.daniel@makrotopia.org/
v2: https://lore.kernel.org/all/cover.1784561622.git.daniel@makrotopia.org/
v3: https://lore.kernel.org/all/cover.1784600387.git.daniel@makrotopia.org/
v4: https://lore.kernel.org/all/cover.1784681487.git.daniel@makrotopia.org/
v5: https://lore.kernel.org/all/cover.1784717129.git.daniel@makrotopia.org/
v6: https://lore.kernel.org/all/cover.1784947240.git.daniel@makrotopia.org/

Daniel Golle (13):
  drm/bridge: it6505: quiesce event sources and work on remove()
  drm/bridge: it6505: quiesce work items before powering off
  drm/bridge: it6505: balance and disable runtime PM on remove
  drm/bridge: it6505: unregister DP AUX adapter on bridge detach
  drm/bridge: it6505: complete poweroff even if disabling regulators
    fails
  drm/bridge: it6505: bail out of the IRQ handler when status reads fail
  drm/bridge: it6505: avoid division by zero in pixel clock calculation
  drm/bridge: it6505: avoid division by zero in audio FS debug print
  drm/bridge: it6505: guard against zero channel count in audio
    infoframe
  drm/bridge: it6505: hold endpoint OF node reference while parsing it
  drm/bridge: it6505: reject a too short link-frequencies property
  drm/bridge: it6505: don't write an error code back to the reset
    register
  drm/bridge: it6505: Don't reject audio hw_params without an encoder

Jiaxin Yu (1):
  drm/bridge: it6505: Add audio support

 drivers/gpu/drm/bridge/ite-it6505.c | 262 +++++++++++++++++++++-------
 1 file changed, 200 insertions(+), 62 deletions(-)


base-commit: 3d7783543c2646af69ad65825e810060494bea21
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.55.0

