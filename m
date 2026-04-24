Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9D9FE5202
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 10:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+XcnAmlaaONK1ZLErA/m5Wd0iJnpahgeiSKtQbbAYE=; b=AqvuBrlOfVQwj1EqzFmbLjwwVP
	hd3JSXUGiDL1n17OdcieLgs5tXKLpnYeXW029dQ19CMeSa/jlMiXkBZHYTB+jkg2AAoB6EuhNLk2g
	pUQRUSx2N475GcSb+nudRjz8i0iv1BPgpuMbXGSp0ujEUfcOLDGKqLMhfX0qYQPsLtiqjTBj7cOvK
	OvgfwaPmrgUNPGByDERBjBPTMVgWr/fFIwe9RCN+mJgh3PGlHFF/i2V0N4PyZKXmz3i1YwheP1JhK
	2tDlmdepvis5f2VSlAklkEnm5rvxobUaUtJV27xMdw5u19+cvATa4mu0j+Kx0HpP0+rkXQF1LnEEb
	lKc+aOZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDd5-0000000D0aM-11Eq;
	Fri, 24 Apr 2026 10:19:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDcy-0000000D0Uf-0Nwl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 10:19:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B7C154174B;
	Fri, 24 Apr 2026 10:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1888BC2BCB4;
	Fri, 24 Apr 2026 10:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777025955;
	bh=aNX0zEGJyR4omhAYCQYN3diflr9cBelBuF2mFH6r1sI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NSKPF/6L1iOeTKpG+TAXaJZRtvHoJDHtu0EPg8P8qH/e/o2Ui2bduii2PYLUt+XYV
	 sD+vQsmKIBJQC2olcVH5iVvacfi8uB8/dHwlQorFzAlDMcAqcD3n0U2iaNSw8Qlog7
	 rB5LaXn5wkwiRXVmYch0h4O+bC7Tl55d5B85Rc9bcbR9hUOXbcz8iZXb9BVmpwKjvN
	 dlZyQcNsOpYD8LgI+ND5K6TmCPHVu8sZeS6dgUsNir2YhFztC1+WdWAz0+vGvjZX/h
	 zDemEt6SX1jQjbIrfRjGJX4IrsdU3s7GgU+sWzE/qa1QrvEfCYxyXV2IWH68gewvtD
	 YmSUgmPk5mmNg==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 24 Apr 2026 12:18:45 +0200
Subject: [PATCH v3 05/20] drm/mode-config: Document drm_private_obj
 exclusion from drm_mode_config_reset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-drm-mode-config-init-v3-5-8b68d9db0d8b@kernel.org>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
In-Reply-To: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
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
 h=from:subject:message-id; bh=aNX0zEGJyR4omhAYCQYN3diflr9cBelBuF2mFH6r1sI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJmvnbvKFXQ8VfeKxlTPP/BDz01t8s9ftR8+W3pPmbG3s
 UrpWWVwx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZhIgD9jnfWZjfrVx66VvdrH
 HmEtX+uqYLDfTOHztkjOMOtHU5+vK+ePLxA+2zB1duTyJLn0OZoTGBu2bDDyvv/rd+aOlyK3s9/
 NXRZ1UPvPu8DHuoZPtvbsZzDc5pTL1pd4n/nlFz+7cjbzafkA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_031916_201186_3D9301A2 
X-CRM114-Status: GOOD (  10.49  )
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
2.53.0


