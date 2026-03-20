Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C73A10987A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5jAvpcXwF0Zl+VrVU8z8q5ztgaucjIpCP0dexToyEQ=; b=w2bTB4+PxSXbeqSjQLH3LoKnz7
	ir+Rw9tBaHs4E+SsYBnZ/o/PZy1RBSO995hVmQU9DDf9UfDPLmcQpWjF7yMZd4o3ImJRY+E2zg7Oy
	05KQu6DuRUF1AlOBGdbAQb4HUHit8zoy/fc6vdjinm/UCT6r8aOQceWlZb0S3VsInvYMVKmciMfuG
	9oYGTe5ZzE/Bl97oYp3IAd4+FQlz2uFGcrkn+B6gsSbpBfmdJclswHwSqw+tRE9uA97/QR5LaLqpt
	c8p0dBDu+IzPNhgCAtlRxg9LHUy3CJlNiGlb68cpSpWkmD2FY22gZtENznpj4PJoQc0XWYqlWBMir
	cyKiWo/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3chL-0000000D7j3-2vWJ;
	Fri, 20 Mar 2026 16:27:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3chF-0000000D7e5-1UwQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:27:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E4DC44201;
	Fri, 20 Mar 2026 16:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD29FC2BCB2;
	Fri, 20 Mar 2026 16:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024056;
	bh=wsgH+JigiQfeFcxwGD7t3o9+hIxvZid3TubvDqbfQKQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MnyukRsdGM5tALWWow4wXrFdo8tSbj4j8ni/3V46UYr2109ahtsTjO+b8xdEUcYWI
	 B5FJMYYjNoRgcIgBsRxF8+csBoBgS+6LqeDii30a02TOaLREFHylNG/b0do5OgulRX
	 uk/em3q56XPAJnJWUwicAA8LpnyY5y0NwTJ4AcO2XVPr4V0DKDVcERDl+tuHpGEfc3
	 rK0kS7xWscWDuSxaqOLPIN4F20FcZCis+xH8gNQyPqRGTFvMfi0CrnDdvcdJ1wwHSr
	 GaxwAsRBHzUahnvinIQJekLn9N0AWZdRYeJEctKdrz8xQ24iXt3keg8QHNdSXsHSuI
	 n8e5iAnbkY+TQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 20 Mar 2026 17:27:10 +0100
Subject: [PATCH v2 03/20] drm/mode-config: Mention drm_mode_config_reset()
 culprits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-mode-config-init-v2-3-c63f1134e76c@kernel.org>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
In-Reply-To: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1447; i=mripard@kernel.org;
 h=from:subject:message-id; bh=wsgH+JigiQfeFcxwGD7t3o9+hIxvZid3TubvDqbfQKQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl7S1Nstz3decpi2d3w+dyr5Sep10g8NjdLdNj4TvVkR
 dCc3sVbOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBE+vUYa3iSZ4dmqL/Xb0pU
 aF57vk5KrffSjgPs3nUaSq8YoldPLlV6o/bufc2bR9+75RnYukOmMjY8v2TSmPH1tu5y5rSOaW+
 /3hGa0P4geHpjnTp3SDDXjcVf9XfxtOklnQ559/qG3ITr7+cCAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_092737_469975_9BDE7B77 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

Let's document this expectation.

Link: https://lore.kernel.org/dri-devel/aOaQLx-7EpsHRwkH@ideak-desk/
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_mode_config.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 66f7dc37b5970c0a08f8dde008aef56376c59f37..cba527571ca66d3aa6dc652c87e03a19815d1d41 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -187,10 +187,14 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
  * @dev: drm device
  *
  * This functions calls all the crtc's, encoder's and connector's ->reset
  * callback. Drivers can use this in e.g. their driver load or resume code to
  * reset hardware and software state.
+ *
+ * Note that @drm_private_obj structures are expected to be stable across
+ * suspend/resume cycles, and @drm_mode_config_reset() does not affect these
+ * structures.
  */
 void drm_mode_config_reset(struct drm_device *dev)
 {
 	struct drm_crtc *crtc;
 	struct drm_colorop *colorop;

-- 
2.53.0


