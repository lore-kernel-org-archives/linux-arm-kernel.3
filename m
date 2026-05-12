Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F70CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 13:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0ttxcHjt2e1X8IsaAGTCBdz9If2UXST8UhQqDi/gtU=; b=HinZtd+9GX4+3iH48fXZgNz64y
	JAJ8xjNHBmAhXJg54XWfcwFVxntUWpg+i6ekh9YNfT27anrfRs68iWPA8nDnevk0GAAdmvXgi+t8i
	JGFaW/ecK6CP+OtgRAn5JVLnGfkDuiofTAtynu+RfCLj9ga8rm3duno2IU9S0hFG+axuntFYRhsmI
	cFVAFEfunLyJyFYrnF+3WL0oTH+FPeYKZXXdTLzcjKnpyaKAwPqLb3HgH7WzCCFi8MHCM5TQqx2d5
	H5pPF9ICXklDom94WegfdI5qmOmFbALeVa8aQ+KDhl/HKuT7YjLwWIcG49wJJTJBTEB5rUJNsUf0x
	CqBq1MqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmoh-0000000GkdJ-1KAh;
	Tue, 12 May 2026 13:06:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmof-0000000GkbX-35Xq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 13:06:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF49660139;
	Tue, 12 May 2026 13:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A71C2BCF5;
	Tue, 12 May 2026 13:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778591188;
	bh=OOzvE+PDY+lMMJPx9rpX9siTCSFetWvZ9fVlq7uKBtk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uUi8PyyWSlUasaCm2U0uzJXbtwFmzzWcaPhcbQ1cWY1JOZS0ZKblaXjz5H3XobsHw
	 NZEJuk7wNJtOxBnPfQ5AR9Ls6MAJWvMoNRqrh6hFZ874XuuM9/AEmuLKNXwvpt1hp1
	 +tk5136Ff/28HHd2rMQj9e373Rq+rsYb6HZU7nFfLbKvHtlxSJU0JW6QLiCBJvNQgI
	 +/ZP5nZ/QeFpdtxzqjHDgk7fwU9zgds+GFB/qKQF8BWhy979Nn0crxFNojKVs0Nnr9
	 6hcLspIgO4pVifirFHsMRvuRT+PcHSQddogD2DwIGhLgkh8aLQxJEeKfoQL2kJ7qWt
	 gE02pAWujcpdQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 12 May 2026 15:06:03 +0200
Subject: [PATCH v4 05/20] drm/mode-config: Document drm_private_obj
 exclusion from drm_mode_config_reset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-drm-mode-config-init-v4-5-591dfdcc1bf9@kernel.org>
References: <20260512-drm-mode-config-init-v4-0-591dfdcc1bf9@kernel.org>
In-Reply-To: <20260512-drm-mode-config-init-v4-0-591dfdcc1bf9@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>, 
 Melissa Wen <mwen@igalia.com>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Alex Hung <alex.hung@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1384; i=mripard@kernel.org;
 h=from:subject:message-id; bh=OOzvE+PDY+lMMJPx9rpX9siTCSFetWvZ9fVlq7uKBtk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFnMqnuMvhxQE+VpeMGU8J57zZyE8p83wy+XJkarJN5nZ
 ZofalTQMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACbS5MhYp/k/+t5GvSWX9u31
 Oc0juFzVVof3cc5FrhlNdfsVvobLSExv5iv9mnA1eb5ySJnP6vbVjHXqSvOumJjsmT+v7ncIz4E
 cWZPTKYuaPwXcLluauWrdhe+Sey+97NKVnm0XorykxPKC/hIA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

drm_mode_config_reset() does not reset drm_private_states by design.

This is especially significant for the DP MST and tunneling code that
expect to be preserved across a suspend/resume cycle, where
drm_mode_config_reset() is also used.

Document this expectation.

Link: https://lore.kernel.org/dri-devel/aOaQLx-7EpsHRwkH@ideak-desk/
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_mode_config.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 66f7dc37b597..c33382a38191 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -187,10 +187,14 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
  * @dev: drm device
  *
  * This functions calls all the crtc's, encoder's and connector's ->reset
  * callback. Drivers can use this in e.g. their driver load or resume code to
  * reset hardware and software state.
+ *
+ * Note that &drm_private_obj structures are expected to be stable across
+ * suspend/resume cycles, and drm_mode_config_reset() does not affect these
+ * structures.
  */
 void drm_mode_config_reset(struct drm_device *dev)
 {
 	struct drm_crtc *crtc;
 	struct drm_colorop *colorop;

-- 
2.54.0


