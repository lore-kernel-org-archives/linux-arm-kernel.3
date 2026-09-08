Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC24BC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 10:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s44HXDX+ZX1RHp9/nbKIfpiIWQyXK7l4galcUQO1A5g=; b=rnw/wMQ9uv6KXvEGVeLd0nLfHl
	E5HtDmj77UL6/SMDKKxCgubh3f5shiVb8Pd5MzfH2aaoten4Nto6Em4cDtvUVca+PFLRmo1m/qoh9
	c03MB0tsB/iT1P6Np1o29w8fRseG0C2m4FMkpi9abkJLkpT9/Y2RPMNvkge05yeDp1lZMS4bzjvoH
	xnzo4wm5344nowkizZccnVsAy7TH0Cs7SiChQP/tZu+DY9EJX/iEmLvIlZ/8nA9nVQ0OrpJBICAZq
	pfMPm1nowPQTfCXisH2dzVBMJgDvQBlNDr+DLwoupiBKhPksdYAs1Lpfhda7xCTOoEt7Lmz9AhrzE
	kAw8ZioA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sfC-00000008iPu-2TVf;
	Tue, 08 Sep 2026 10:02:50 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sf8-00000008iNM-0SoW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 10:02:48 +0000
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 955FB2037C;
	Tue,  8 Sep 2026 12:02:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1788861759;
	bh=s44HXDX+ZX1RHp9/nbKIfpiIWQyXK7l4galcUQO1A5g=; h=From:To:Subject;
	b=k2QjJN2PqtVSe4hTRSXLytQvozeeNJY/ZU2WE1WBNR7+sr1vuxLcKYa4vMj3hqOrS
	 rAERFZZ8wX2meMOUpxXCHsEZ9IpnIdAZJ09EuJkliOEZKzWNKrN+QIGzkQrNJ4KPEo
	 G8FJQcLm/AjDd/hPr4e4i5zDC/LapZNLPb3YMlLDaLK3jZY2VlvI+3sgwkKu1kkxAy
	 PhOBEkB+SwOyii4Ijp2tUAbMU9BYTUe45SBefgACypceakRssTv16iRIJZc7XN3S0M
	 B5qvZCj//QaGOTG8dvSNg0GcCkZnwTfTZrTA/ILojTqjkCOWlvGugsMXr8nZGIdafm
	 Xwy7+wWhKikAQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco@dolcini.it>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
Subject: [PATCH v1 0/3] drm/bridge: Add Thine THC63LVD827 LVDS encoder and 10inch LVDS panel on Colibri iMX7
Date: Tue,  8 Sep 2026 12:02:24 +0200
Message-ID: <20260908100230.83796-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_030247_043687_5EB9AC17 
X-CRM114-Status: UNSURE (   8.46  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

This series adds support for the Thine THC63LVD827 DPI to LVDS encoder and
afterward uses it to add a DT overlay to enable the Toradex 10inch LVDS panel
on Colibri iMX7 / Iris

Francesco Dolcini (3):
  dt-bindings: display: bridge: Add THine THC63LVD827
  drm/bridge: Add THine THC63LVD827 LVDS encoder
  ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 10"
    LVDS

 .../display/bridge/thine,thc63lvd827.yaml     | 126 ++++++++++++
 MAINTAINERS                                   |   6 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   6 +
 ...emmc-iris-panel-cap-touch-10inch-lvds.dtso |  92 +++++++++
 drivers/gpu/drm/bridge/Kconfig                |  11 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/thc63lvd827.c          | 193 ++++++++++++++++++
 7 files changed, 435 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/thine,thc63lvd827.yaml
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-iris-panel-cap-touch-10inch-lvds.dtso
 create mode 100644 drivers/gpu/drm/bridge/thc63lvd827.c

-- 
2.47.3


