Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747CACA5FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JEGPocbhabTmG9JnP0it9oQn8qUEYKbqSsbZyc3hfr4=; b=jPIODr/pizl5G4zPpy2RFK81si
	Aj/Zgb7fMLtZ94vUkylRoA98fJwmaeuDCIy5RAwNat3X0b1B/1Io5wg/CKquCsDOUenIyK5MN2uNL
	8XFvchkUu5nQnmA4CF4AKOzV9ahj3QRQoHdWnISuJbsH3jLu2fl4o+5UtQDi3uNAYFU92T+WZns8i
	oOxPnAf8KseYeMY0+ceTHyNYqrzuN7JK7cpVVCkgZXaPiWRrZMbnKEF2PLHnsRT2cJqzuQmIzDkt4
	E0Pj2snCAUmz3jThV7Maq5NYufEgN2pceY/xR++N5Nf2voNXEoXX+sUa5zfcvowQJahkWhO2S53Nn
	8cUGHVSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfKv-0000000G4fv-1a4i;
	Mon, 05 Oct 2026 09:50:21 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfKr-0000000G4eV-3U4I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:50:19 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 4F0EB1FC35;
	Mon,  5 Oct 2026 11:50:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791193815;
	bh=JEGPocbhabTmG9JnP0it9oQn8qUEYKbqSsbZyc3hfr4=; h=From:To:Subject;
	b=GiX/fnpMMtR20Mo8hBpj/2dvtW01C4IwPdHEyvyhF96+RdiRqllIxBHcmwA9X18kJ
	 CLcm/JlEDrNRFZAxf7OZf7aOOxU4WX8TDWNOZSak+m+kuo3Og5fOGwA3Y/Pm6zmd3L
	 2icwxNEliViG+JDHuM10h/QvGNriQhzucDZHKrrx8anr6exFKRzUUBPZhAFGsWZoF8
	 uT5LwEyVkOKvQ3D99U+BCzPe+w/i6OKCwS5BMnqyLp1svoUqAYzCMW4DXOaqoGxP55
	 B02e2Z3ZE+FKBdTNYYryQDJbVMaHb4w5+K2clEUNxsgZwjs4lEm8gflBjZSh8+wAF0
	 q7g40Z1Om6o9Q==
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco@dolcini.it>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] drm/bridge: Add Thine THC63LVD827 LVDS encoder and 10inch LVDS panel on Colibri iMX7
Date: Mon,  5 Oct 2026 11:50:00 +0200
Message-ID: <20261005095006.20290-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_025018_034207_E480E86C 
X-CRM114-Status: GOOD (  10.39  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

This series adds support for the Thine THC63LVD827 DPI to LVDS encoder and
afterward uses it to add DT overlays to enable the Toradex 10inch LVDS panel
on Colibri iMX6ULL / iMX7 with the Iris v2 carrier board.

v2:
 - address review comment on the binding (Frank), document the power
   supplies
 - driver: add power supplies support, enforce the input sampling edge
   via atomic_check, use bridge.next_bridge with
   of_drm_get_bridge_by_endpoint(), drop unused code
 - move the common part of the Colibri iMX7 overlay to a dtsi shared
   between Colibri iMX6ULL and iMX7, minor cleanups to the overlay and
   the Makefile
 - new patch adding the Colibri iMX6ULL overlay

v1: https://lore.kernel.org/all/20260908100230.83796-1-francesco@dolcini.it/

Francesco Dolcini (4):
  dt-bindings: display: bridge: Add THine THC63LVD827
  drm/bridge: Add THine THC63LVD827 LVDS encoder
  ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 10"
    LVDS
  ARM: dts: imx6ull-colibri-emmc: Add Toradex Capacitive Touch Display
    10" LVDS

 .../display/bridge/thine,thc63lvd827.yaml     | 138 +++++++++++
 MAINTAINERS                                   |   6 +
 arch/arm/boot/dts/nxp/imx/Makefile            |  13 +
 ...emmc-iris-panel-cap-touch-10inch-lvds.dtso |  49 ++++
 ...ibri-iris-panel-cap-touch-10inch-lvds.dtsi |  70 ++++++
 ...emmc-iris-panel-cap-touch-10inch-lvds.dtso |  47 ++++
 drivers/gpu/drm/bridge/Kconfig                |  11 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/thc63lvd827.c          | 228 ++++++++++++++++++
 9 files changed, 563 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/thine,thc63lvd827.yaml
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-iris-panel-cap-touch-10inch-lvds.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-iris-panel-cap-touch-10inch-lvds.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-iris-panel-cap-touch-10inch-lvds.dtso
 create mode 100644 drivers/gpu/drm/bridge/thc63lvd827.c

-- 
2.47.3


