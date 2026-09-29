Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506F6CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 13:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=li47V/+ljdl1K8BeLPH5PnBYfAJEyKs5Q3gRsX1+S5M=; b=ersQEe5Zbc7fMs
	040uQSNDNnLfnXme5md/3zD3K9x4lpQhqsb1Ll7pUznQKMxmIdPYXzEJjEhb9c+1D+hcP35jSHMpd
	vFtM8cEwNu6l2vtrRATWa59lTLGZaAGXRQrQOT++FZpAEBublq9jl9W4fenb30msGqkD9zTM8c/jw
	w6wgHOJPlfO1oZwDv4NiIq09UPFnccrNJANtQPT+6uR4TuirnmY6IGJgtaSeT4YBPwN1ECbhcGEdN
	E2QrPMf27TkRjRSaf/M8DZRQ5tqFDWHWt3tajwhHebiR8Zohftr5McYyQScvCbfWX3B7BbLU5olHx
	iiUYD09Kzj8yOG6gsCAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBY4E-00000003gz8-2XGS;
	Tue, 29 Sep 2026 13:40:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBY4B-00000003gyY-0mOS
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 13:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=li47V/+ljdl1K8BeLPH5PnBYfAJEyKs5Q3gRsX1+S5M=; b=f+z2W8JwyGdRBaFFrgST0E1qrt
	9wMTgg6eEuqX2bS8WnRBH114LtX7GsBLqJ7MKfo0eUEWZqQIqvDJzeFNQOdkNTiG3J61EFP32nIOk
	nY2QMpeo2/471zo3KuFmmYr3eZeeoZv+OJwb+UHIGgWkDyRaMz8q5BGB8naAfpTdASQFFZlTTqZf3
	sCDLpHIjP8t5pMrtRMtosvwO2bfwvM9oZueN3G5m0r/qeXKnov0YldheQIU5XHiEikaD8KGkeIyPw
	ZKuW1l6puO3TzP9ULEDuYTaxOaXjkUUoGksQTD+k+MzNnAxi61L7fiXIu5kQOLv7ytzKazlhDbBdo
	n9BUuChw==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBY47-00000002gsr-2BGU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 13:40:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2EBBF1A104D;
	Tue, 29 Sep 2026 13:40:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EE07E601BD;
	Tue, 29 Sep 2026 13:40:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 798F710328E3E;
	Tue, 29 Sep 2026 15:39:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790689210; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=li47V/+ljdl1K8BeLPH5PnBYfAJEyKs5Q3gRsX1+S5M=;
	b=KYbH4dvRx16/hbjludcvkJCeygqzesh+LtiUHUpPgqqPaxRrOwycDAR+sTjFWaTTelFffM
	oqUMECt6splE610HbWnPyHhAuKPOjzHgCbnfNUeDr8fWV0HL1gufRgXKHmZ9r/XY7Htrqu
	2J07esEd869Lf4uxEWdBCYSFUmAxGyN+87uevSpxZtEcRffjII95rye8qmk8bnbuZTCsuy
	09pn0RkDakTqYUNo8BVZmhRhntAIkq9LzBjyGZuIFhhWLol9I2/273nm2x1I9s95e4rBGG
	sp1ehxIYDJk2i3sRcQWcXdYaRvOa/AP11mLzigx3oif5FF6/f1iCtkXX7TwH9w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v2 0/7] drm: remove deprecated *_of_get_bridge() from
 non-OF drivers (fixes build regression)
Date: Tue, 29 Sep 2026 15:39:49 +0200
Message-Id: <20260929-drm-fix-of_get_bridge-build-regression-v2-0-6da431d8f180@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOTQ6CMBBGr2K6dkzpAsGV9zCE9GeAMUDNtBAN4
 e62eAKXL3nzvtlEQCYM4nbaBONKgfycQJ1Pwg567hHIJRZKqlLWqgbHE3T0Bt+1PcbWMLkkmYV
 GB4w9Y8gJqKtOqa7ShbNWpNiLMV0dQ4/mx2ExT7Qx17MxUIieP8cna5G9v0fXAiRYa65YSuW0d
 nfjfRxpvlg/iWbf9y8h5IPr8AAAAA==
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_144015_914724_3006308A 
X-CRM114-Status: GOOD (  12.72  )
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
Changes in v2:
- Fix bugs in patches 2,3,4
- Fix removed function name in patches 5,6
- Mention lkp reports in patches 2,3
- Add review tags on patches not modified since v1
- Link to v1: https://patch.msgid.link/20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com

---
Luca Ceresoli (7):
      drm/imx/lcdc: stop using deprecated devm_drm_of_get_bridge()
      drm: verisilicon: stop using deprecated devm_drm_of_get_bridge()
      drm/bridge: dw-mipi-dsi: stop using deprecated devm_drm_of_get_bridge()
      drm/bridge: dw-mipi-dsi2: stop using deprecated devm_drm_of_get_bridge()
      drm/vc4: dpi: stop using deprecated drmm_of_get_bridge()
      drm/vc4: dsi: stop using deprecated drmm_of_get_bridge()
      drm: renesas: shmobile: stop using deprecated devm_drm_of_get_bridge()

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c     | 11 +++++------
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c    | 11 +++++------
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c               |  4 ++--
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c |  5 ++---
 drivers/gpu/drm/vc4/vc4_dpi.c                     |  9 ++-------
 drivers/gpu/drm/vc4/vc4_dsi.c                     | 10 ++++------
 drivers/gpu/drm/verisilicon/vs_bridge.c           | 11 ++++++-----
 drivers/gpu/drm/verisilicon/vs_bridge.h           |  1 -
 8 files changed, 26 insertions(+), 36 deletions(-)
---
base-commit: 91ceac83e599c9d48da4c4d2d91410c588a215f7
change-id: 20260929-drm-fix-of_get_bridge-build-regression-98f22f8a1dcc

Best regards,
--  
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


