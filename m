Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECADCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VvnYtqd0myYRNK/90yLn0GAD8hhlBrrwU4M1ju3ptmQ=; b=ZHQ/ojJvhza1sS
	fhEf36+VrCNNniMr2y28M4ZAKDDObPHlrQAROSyP+aeFJ7VVfDNffIwrf7/whAJ0pbhwu+Tgp7Efn
	8SOKYTIc+HnqIbYK9N452od9pqKK09Kj18EBiVuYqnzWYWWQ5mhULKB7SghI+MfZOjydCPiLa2Gv7
	59FN8C6qPEzjuDzmw7Xl0YIfk5L+hY7NnYrlWsRQoVslhcqBSWYi6mMRwiKw0hTv7Dt8ZOVGo5BcM
	/Eo2AeTaL6VN1rNdS/GapfwtlBYdu4K3Dm6DOf0cm4jVJJ1DXsVDiJOPvPT6qZP+x7XzrQT3GjYQ2
	lStE2OOgtuhUoNlQ0wiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVCk-00000003GML-3U3C;
	Tue, 29 Sep 2026 10:36:58 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVCd-00000003GJj-0Ww4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:36:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B8DEB1A1057;
	Tue, 29 Sep 2026 10:36:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 883CE601BD;
	Tue, 29 Sep 2026 10:36:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D5D8103295E3;
	Tue, 29 Sep 2026 12:36:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790678205; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=VvnYtqd0myYRNK/90yLn0GAD8hhlBrrwU4M1ju3ptmQ=;
	b=wCR4TJCZEG1EFZ9sAHD+M9t7myv55BOEKz3ojLI5zZT8kNCNQ69VpEl5WgAyAaIuXU8JYV
	TnAtkjlIUsZjY6BsgZwBu46it15MdA0pkZHV4IBB0BeO6gblx+LFTsXwpwzO7lCu8zmpQq
	RdpdBnGZQSwwdJhHENya2deNsUErubWClvCA2GbjT6k7eQEyxhhReE+7zwrqz8kPJTui1i
	DpntxKdFxNSdU7USbUVpNAWiJ5nEf44lNvBk+ViXRvWUCSS1L4gvH2FFFn0QXCCPoEmxfg
	ZbHJpu0Rfil2TPXIB8Jwt3ffw6lEsxzPhoMzACTwb1pHGMIbjpdV2DjJpYy0HA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/7] drm: remove deprecated *_of_get_bridge() from non-OF
 drivers (fixes build regression)
Date: Tue, 29 Sep 2026 12:36:32 +0200
Message-Id: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN0QqDMAxFf0XyvID2Ydj9yhhim7RmbDpSlYH47
 4vz8cC5525QWIUL3KoNlFcpMo0GzaWCOPRjZhQyBle7a+2dR9I3JvnilLrMcxdUyKSwyItQOSu
 XI4G+Tc6ltm8oRrDYR9lW/6P74+SyhCfH+ajDvv8APlv53IoAAAA=
X-Change-ID: 20260929-drm-fix-of_get_bridge-build-regression-98f22f8a1dcc
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@kernel.org>, Doug Anderson <dianders@chromium.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_033651_338785_3E9B9982 
X-CRM114-Status: UNSURE (   9.70  )
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

After commit Fixes: aa8a8c7e4641 ("drm/bridge: panel: move all code to
drm_panel.c") some drivers fail building:

  error: implicit declaration of function 'devm_drm_of_get_bridge'

This is because devm_drm_of_get_bridge() (and drmm_of_get_bridge()) have
been moved to drm-panel.h.

The affected drivers are those which:

 * can be built without CONFIG_OF, and
 * don't include drm_panel.h

The affected drivers are 3, fix them (patches 1-3) by replacing the
deprecated *_of_get_bridge() calls with of_drm_get_bridge_by_endpoint().

While there, do the same for all drivers which be built without CONFIG_OF,
even if they don't fail (patches 4-7).

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (7):
      drm/imx/lcdc: stop using deprecated devm_drm_of_get_bridge()
      drm: verisilicon: stop using deprecated devm_drm_of_get_bridge()
      drm/bridge: dw-mipi-dsi: stop using deprecated devm_drm_of_get_bridge()
      drm/bridge: dw-mipi-dsi2: stop using deprecated devm_drm_of_get_bridge()
      drm/vc4: dpi: stop using deprecated drmm_of_get_bridge()
      drm/vc4: dsi: stop using deprecated drmm_of_get_bridge()
      drm: renesas: shmobile: stop using deprecated devm_drm_of_get_bridge()

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c     |  9 +++------
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c    |  9 +++------
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c               |  4 ++--
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c |  5 ++---
 drivers/gpu/drm/vc4/vc4_dpi.c                     |  9 ++-------
 drivers/gpu/drm/vc4/vc4_dsi.c                     | 10 ++++------
 drivers/gpu/drm/verisilicon/vs_bridge.c           |  7 +++----
 drivers/gpu/drm/verisilicon/vs_bridge.h           |  1 -
 8 files changed, 19 insertions(+), 35 deletions(-)
---
base-commit: 91ceac83e599c9d48da4c4d2d91410c588a215f7
change-id: 20260929-drm-fix-of_get_bridge-build-regression-98f22f8a1dcc

Best regards,
--  
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


