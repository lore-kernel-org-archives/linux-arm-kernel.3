Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D562ECD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 17:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmAxlo1wPpVUGFi4z8FBEYgHX8eETYEQ7eEa1NRb4nY=; b=RIXvjzfr7Kx7+jPNYhsp1e6NzR
	hfXk16V+nLwNyi8hWWID2gVe80BHUStMEPOSAsoaJLhwFkTtVV39tJQfZgYm6aSztJWrldGSQ5rBN
	FLigGbUJi0XE0tq2f0tdLGHf4+zjsCFMYyu8BCW16ZkzM80F9YuKagsRY+MQZcgejlMH9Mi37qVTq
	Iwkt8oHNcOTmq9nISMZOw8U2Xyc1Ls3sjKhhvsbt2yDegXbcFEHEW0Q0FY+owTmvAAsVXvmw5qp4L
	4FCGsTZ8pOF6lAdpfB33QKwrEmb/0XDS1o2GQhr21nNETtTbyXxIy/0QR4JyZKhTO+QwfyAQ+boiG
	FeVd1QBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuvk-00000002ZNa-0ia8;
	Tue, 26 May 2026 16:47:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuvQ-00000002Z8o-3hqK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 16:46:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8BC71407DA;
	Tue, 26 May 2026 16:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B384D1F00A3E;
	Tue, 26 May 2026 16:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779814000;
	bh=vmAxlo1wPpVUGFi4z8FBEYgHX8eETYEQ7eEa1NRb4nY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ccr+aUxQl8B8VP26+PznQjAM5jvmJNlSdE8U9y1ip5BaMLJntllTX7BY3Nr43ByYR
	 3I7qL/PTr0QwCrtyQp5W+bo5LH0b+yhWamg9kaS/Fw6GLalmo3/TqXzvjcAl9nVoTn
	 t8pbV74ygCP68BufoMuGEOi+/SGvtWM7zzOAXpKfVmwYbW2Tm5LKKOWmxbPJWLA57b
	 rSEhj3pPq4GQvInyObJ0rsAxTMjEppCSJ4qJqErb5Uii0gr0M+ohJ5g6VIUDtjpb+D
	 dfh5vciNbOM7B3WO74qXzJZivvN3UwICa9CBKQ43vqHiJAJxStDMBJJyEzSMzn3vBU
	 WScG04N75WgRQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 26 May 2026 18:46:17 +0200
Subject: [PATCH v6 05/19] drm/mode-config: Document drm_private_obj
 exclusion from drm_mode_config_reset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-drm-mode-config-init-v6-5-852346394200@kernel.org>
References: <20260526-drm-mode-config-init-v6-0-852346394200@kernel.org>
In-Reply-To: <20260526-drm-mode-config-init-v6-0-852346394200@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438; i=mripard@kernel.org;
 h=from:subject:message-id; bh=p9ZaVQhU6x2BUkTWwGqZUaX+oUcICWz2dxNRq772dNc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmi5yICquxP9H7QShWVXMCSd7vposCC4Dzt1JqfSx6dF
 OiqXWTfMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACbCrsBYZ/nwX9WGoDVKv2vC
 bjQvNb9///Z62doejbvN/TxBeZqHE8IkZtxlYhThFdlgIOh3tdKFsYarJe3f9J1988I8rvZvE1u
 oMvX4X9NpIZ7ygitPKZ30zlN6mP9kotbOvJ9v2Q70TLGW9AUA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_094640_976953_7854B615 
X-CRM114-Status: GOOD (  10.54  )
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
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
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


