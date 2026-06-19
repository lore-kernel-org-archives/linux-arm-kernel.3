Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35070CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 12:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykcLps+Shu0CrNHX9F1utrPYhUTEb1kFSaYzGD/riok=; b=Zbpj0R3HXMKxfZx4XoUq6MAmUa
	emfI1YQNmE3afb82hjwx+mm6+MFeSVGUIUJdEgCXu9FZVSQ5PUuOAep7rxTGH5fsWRv5/EahTOEZH
	iN/l9j/SZ29lts2HnMhB7750JZp8UZM2bJGZq8HzyBNGMzaWGxYBpkRfuumTZOmFmCvhIbVUG4SZs
	u9lZnKJ2vdMN2FgdCFPEW8crirtCoT8yvn9bjjXWzZ1Cf2SIMX6lQ54SXW5w1SLeI6yaCTl9kmty/
	6+pue9xW/I0agDFCES9od5IwQNCvUfoLQYVgGYF0g+qcvBetaEs0lgD+VzoaRzLYOTiwDoAVSvbTe
	M6+iEs8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYI1-00000002O1q-0KIX;
	Fri, 19 Jun 2026 12:25:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYHw-00000002Nzp-3dut
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 12:25:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EAC4601EF;
	Fri, 19 Jun 2026 12:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D011F000E9;
	Fri, 19 Jun 2026 12:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781871936;
	bh=ykcLps+Shu0CrNHX9F1utrPYhUTEb1kFSaYzGD/riok=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bIc/SSd493x31+XrYNvQqaOiokRDpni/al0WTynbN/bZq8+ixD+loex4EX7doYcGl
	 s5jlFbrBREY6Ghc16ZKiofoLbwGSJ7JyPEGfI9qeuX2apoABvYgtM5d4Ql/T6A7+Ds
	 TQoD0EWLqEMZv//JOacYFcXoQVMqI4FzPu6h+ze4cUf7adbaU7d018luPKq9ISoRWN
	 W7VSgvqPSR3Q5vEzfUi1w7SuJs9iUw30SfSmBYSvLVB0aRWBdwCvTIbiN16GWxnv/V
	 bsekKrY8gxOWW0ijQyNUBWLAP8KrANrgpXD3hsvDKr/2cj+BqFTXNwj3aOgBIlj0c1
	 oxiA/rjf6EjDQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 19 Jun 2026 14:24:23 +0200
Subject: [PATCH v3 18/78] drm/bridge: imx8qxp-pixel-link: Switch to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-drm-no-more-bridge-reset-v3-18-ff399263111b@kernel.org>
References: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
In-Reply-To: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, Liu Ying <victor.liu@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770; i=mripard@kernel.org;
 h=from:subject:message-id; bh=lNh5oV/n8/EUzkNfMs5+aHUSFUX8P2sI5jHfvY6aCT4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmmJh9vM3EdOaH9OSXsRIaoIKPMf4VDkxc5+bHp2ty23
 vJ0XfCajqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjAR7/mM9VU7eM8t/iGrq7n7
 ZcQJ/uPdIpenzN3rk7HVwUGBS3bKwpwb72f+77MIXttZUj1pX/UBGcb6zEWZ5RrTbdS+M05/GMX
 S53V0jViB0VzBqCWJxnIpzwtXdB6Rc1sgw7EgmHFN9QGHq1sA
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

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Liu Ying <victor.liu@nxp.com>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index ee6b6dbbe952..56ce6aa76181 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -227,11 +227,11 @@ imx8qxp_pixel_link_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs imx8qxp_pixel_link_bridge_funcs = {
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_create_state	= drm_atomic_helper_bridge_create_state,
 	.attach			= imx8qxp_pixel_link_bridge_attach,
 	.mode_set		= imx8qxp_pixel_link_bridge_mode_set,
 	.atomic_enable		= imx8qxp_pixel_link_bridge_atomic_enable,
 	.atomic_disable		= imx8qxp_pixel_link_bridge_atomic_disable,
 	.atomic_get_input_bus_fmts =

-- 
2.54.0


