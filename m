Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472C5EB362F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 19:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To:From:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OsiU+25ikLMoP/pnEIeeGi5XIZmrewWgt/aCqVKENCM=; b=iRRShFObbl/wbM
	DFTmk6mQYUWqRmrt/bnlg8SBmfYyor0rGLIG7JLGk7Zga9VagR+oXpxT8/q9G7+ME+k1yyNMr6hm9
	VNyQDLxE1rzcnNhbbrcwo791/ZELG1kec/eUh+K1q2zHd/imkmzv5Yb4rWS0TlAun5iw4e9RNKmCf
	84HXpbMrx8c9hNzXhHmw/XHnj5sq0VvYMxFwP0Jf9EeH/dQ59oQTMDkh5gDE6/WZoLwlDAP21+ONm
	W8luTNsWYnQSke6mMmRbfIReBRK5uKxII0F/h2Jp0oObvwaH4cZePYChLI4EMknKmQSX+aKENPcZL
	cc4gYRLRWw7cBXILivAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx93t-0000000DkM7-0Zk3;
	Mon, 02 Mar 2026 19:36:14 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx93o-0000000DkKJ-2KGk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 19:36:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=OsiU+25ikLMoP/pnEIeeGi5XIZmrewWgt/aCqVKENCM=; b=hEYTfqKSMQ+s8dWtuATsAUt6mi
	z14GSWSe5bL1HTRyD2vJGgXbPFGZMF/imrEJfDWshUZHCsKE2sS96S9Ndb64y+JzR/f5XR3DdbDnH
	NjP8dq6epf8vISR/Ig/Fa6buRSvSaI5y6aMNLstX77CSS83nhygLdEqx0twehm8IbMIs=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:59962 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vx8f6-0007Wl-Q3; Mon, 02 Mar 2026 14:10:37 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	antonin.godard@bootlin.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	hugo@hugovil.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Date: Mon,  2 Mar 2026 14:03:36 -0500
Message-ID: <20260302190953.669325-1-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
Subject: [PATCH 00/14] var-som-6ul: improve support for variants
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_113608_596440_34B9C71F 
X-CRM114-Status: GOOD (  17.51  )
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

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Hello,
this patch series improves support for Variscite VAR-SOM-6UL based boards.

The first two patches fix DT/dmesg warnings.

Then add support for the imx6ull CPU variant of the VAR-SOM-6UL.

Then improves/fixes the following features/options that are currently not
working on the concerto EVK board:
  - ethernet ports ENET1
  - LVDS display panel
  - Wifi/Bt

Also factor out optional features into separate DTSI include files, so it will be
easier to support them for other boards, and to make sure they are not
unconditionnally enabled.

I have tested these changes on a Variscite concerto EVK board using a
VAR-SOM-6UL with the following options:
  - EC (ethernet phy on SOM)
  - LD (LVDS encoder assembled on SOM)
  - WBD (Wi-Fi 802.11 ac/a/b/g/n and Bluetooth 5.2/BLE on SOM)
Result of tests:
  - Both ethernet ports Ok
  - LVDS display panel Ok
  - Wifi/Bt Ok

Also tested on a custom board with a VAR-SOM-6UL SOM (will be submitted in
a future series).

Thank you.

Hugo Villeneuve (14):
  ARM: dts: imx6ul-var-som: fix warning for non-existent dc-supply
    property
  ARM: dts: imx6ul-var-som: fix warning for boolean property with a
    value
  ARM: dts: imx6ul-var-som: change incorrect VAR-SOM-6UL model name
  dt-bindings: arm: fsl: change incorrect VAR-SOM-6UL model name
  dt-bindings: arm: fsl: add variscite,var-som-imx6ull
  ARM: dts: imx6ul-var-som: Factor out common parts for all CPU variants
  ARM: dts: imx6ul-var-som-concerto: Factor out common parts for all CPU
    variants
  ARM: dts: imx6ul-var-som: factor out SD card support
  ARM: dts: imx6ul-var-som: add proper Wifi and Bluetooth support
  ARM: dts: imx6ul-var-som: factor out ENET2 ethernet support
  ARM: dts: imx6ul-var-som: add support for EC configuration option
    (ENET1)
  ARM: dts: imx6ul-var-som: factor out audio support
  dt-bindings: display/lvds-codec: add ti,sn65lvds93
  ARM: dts: imx6ul-var-som: add support for LVDS display panel

 .../devicetree/bindings/arm/fsl.yaml          |   8 +-
 .../bindings/display/bridge/lvds-codec.yaml   |   1 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   3 +
 .../dts/nxp/imx/imx6ul-var-som-audio.dtsi     |  30 ++
 ...ar-som.dtsi => imx6ul-var-som-common.dtsi} | 140 +++-----
 ...ts => imx6ul-var-som-concerto-common.dtsi} | 159 ++-------
 .../nxp/imx/imx6ul-var-som-concerto-full.dts  |  22 ++
 .../dts/nxp/imx/imx6ul-var-som-concerto.dts   | 318 +-----------------
 .../dts/nxp/imx/imx6ul-var-som-enet1.dtsi     |  44 +++
 .../dts/nxp/imx/imx6ul-var-som-enet2.dtsi     |  79 +++++
 .../nxp/imx/imx6ul-var-som-lvds-panel.dtsi    | 112 ++++++
 .../boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi   |  27 ++
 .../boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi |  75 +++++
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi | 219 +-----------
 .../nxp/imx/imx6ull-var-som-concerto-full.dts |  22 ++
 .../dts/nxp/imx/imx6ull-var-som-concerto.dts  |  21 ++
 .../arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi |  36 ++
 17 files changed, 575 insertions(+), 741 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-audio.dtsi
 copy arch/arm/boot/dts/nxp/imx/{imx6ul-var-som.dtsi => imx6ul-var-som-common.dtsi} (60%)
 copy arch/arm/boot/dts/nxp/imx/{imx6ul-var-som-concerto.dts => imx6ul-var-som-concerto-common.dtsi} (51%)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet1.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-lvds-panel.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi


base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
-- 
2.47.3


