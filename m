Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD94C4450F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 06:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8HvXs7CUgg+W9jq4h9ThPVWtnVBLT+yspWDmg3Ue+dM=; b=NYW9TPr5VaeAPdgWCd+ADkzW8d
	JccPL5POQPIZMoS8ofnCzzd90LcmdYCuz4MhXJZZ2BqDQtEeytpYsn+fNzE3u0SrpLoHdLEWVg3oC
	loqzpjtsHcbnuXjWVwvDud9yWFS2vBnGKWZ63xyzLHZJffTiFcXE2E8BMBPt+r7pWpSlYsTTqTbfo
	Mr+XY5DCJxzT+Bd++nzmyK+x62Yo/91ze+zfLb4+IIKJ+Jlvtftu7U3jcjxbZoBCJ6HhOJ68QzM5x
	oagmKDzOv7rJ9114w+w5ygSBm9OQ89TVz8dv/HGHD8d0KA+5Ua5Enyl90UXiuU/QvYAl8b1GJ8jix
	q5boVbgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcXS-00000001KxS-0Dzu;
	Fri, 17 Jul 2026 06:59:14 +0000
Received: from flow-b4-smtp.messagingengine.com ([202.12.124.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcXP-00000001Kx1-0T2p;
	Fri, 17 Jul 2026 06:59:12 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.stl.internal (Postfix) with ESMTP id 2B63D130029D;
	Fri, 17 Jul 2026 02:59:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 17 Jul 2026 02:59:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1784271549; x=1784275149; bh=8HvXs7CUgg
	+W9jq4h9ThPVWtnVBLT+yspWDmg3Ue+dM=; b=HD3EiK65LPmAYjSM8nVyfNvTTT
	G+I1vUt8aJHzLBQSJfA8is89p3PBkw3oEdcIyq24MwujgH8IIsJCyJd5t5rvYSH9
	iE7BC9cHhy5QqlOFFw+D4wx5xFWxZfoNclTtgzFSVaDQKkvDHDLCOQA7MG9Osph+
	iZyr3YbwHRJRhTaMfPTrd4cT2jla+ITzUT0jssIbZLg1mfZkWmbD7tW+1PUkUl9X
	2946J6FdbrJI/FUMjVG6iHR9zFfhaBz2LiPNo63a9CITox5GHWtzvMihSf1RfrV+
	3GVrCq3S8V+zESNDyh5oiuCkoHKVZomPuARcz8Kapz71Fu6OxgCubGoUKDOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784271549; x=1784275149; bh=8HvXs7CUgg+W9jq4h9ThPVWtnVBLT+yspWD
	mg3Ue+dM=; b=pD6m/SfhuubRBW0GBtNOr8ovoROY4BNBsd74lXc0fu+ABdV8HQ7
	sa2Ug4veA4ONmKni3bnRuxw37mq3tvPGwUTS5uV+3zjwWxyyZJpIUBAdJIM67iDI
	OZichqnBctOS+EH1WrP+yppzLPCoI0TpU/GwCdfaLVVCQVFzhD/iFQIJsLSAK00F
	lsaW9T7UxekHeEDdJh9abMv4lDsU2bP9sHiSYF+n6noVwnEFtyCLLxC2Me8f+6+a
	MnKub5MJorsWdCOeFS9dkWIQRCouZjVofJcbwQhIIJZvHNOI8bjpNPu4GDd/9HDB
	5iUrepkjNMArB5rpT7oB3I49rbL1NMZw1zQ==
X-ME-Sender: <xms:vNJZaooLvJow1uswiov3v9MKsXqwJajs0ebDMTAgusFT8Amk-wOEvg>
    <xme:vNJZarPMcpsI4kpvFKcw57Yrrt1EnUXVlSEXHAJaRRpEM3cFIBr5WjsVEps5I0tGm
    ZTyn9gtv8vQWnSglBqRlACj1XM-GOGfIzIDmVtgq9YCvZK1i7VE2wgc>
X-ME-Received: <xmr:vNJZahozdLZXWJfs91bZbYyb29ycW9SiZEcW6LL0-WwM9yQ1C4_NjOpulG6pm0icE0J6wFHBUa9HudpsgL0>
X-ME-Proxy-Cause: dmFkZTGxFtQ7rm5S321BiQW3lDhmeAbt7qejiWZVfY1YXg8QXynsse9vIbWj+GXyF8syfr
    /j1kfqmqx0gO0BaTbe0qe/v0fky4zWGTYviTLuvvWFmsC7lSafc2/60BpZzdsOZJy4x806
    /CoQGzL68sqaB1sE9zAv0xaAkYSoysb2E7lEPVG5xX4176I2/q7PfIkWK26KlfBK0f3tuo
    eO4acG27Km7FmYkG5PoT5jT8JbR72LXiJSaYCPZFVCZikDf9Ks0WqL1ynRXO+fLOr8u2eu
    IHCjynQTY68Ja330c0e6EFzvWkoGgbLTgNNXWJ3r2ixwi1KTFjl/RHlvztzuRkCKQp9FdF
    lOb2VySduc3Ocw/uV/Dc9vVTs21c1FHK0ubkSaXbXN5vVkA26CymV+tY0RaMzMyntiGsGv
    scC6VefnafC56+b8y5naZIXN6UwAUkIf8ZglWYoWqHgzpPErorEVvbidPX1t0peXxFa4oU
    dypXTglLfJMSoAYDH1Cb8XXkjqksFtg4HuExTnkNTihiHsZh67tmbxP45Vui2koTAm45+k
    Bw18+l6PWWsr1EE8qLZZDfrLjZYm1V54FxPFcZPWbRUNYiwsupn2S5glF3JfZZY1EYJGbO
    9W3FZoz875GVO07+V7opL0nWI9CEyHG+qo9OyKmxMGynFzJMa+KM0830UhBA
X-ME-Proxy: <xmx:vNJZamsf0O19wjAU-rzZ6FHDcE6CAlgrGfGogWsz1baPsim9mAIaEw>
    <xmx:vNJZao1amVr0CHj5RPrjC-Wyak7WfgrZjTa0q03_2EydO2nJGPdyvQ>
    <xmx:vNJZapGzpPNwPQK_j4kkxlUuphmw3qRAm7pEGXzjJvWybU23i_lfeQ>
    <xmx:vNJZarsj4ZHc54n46QK-byKCqSRXMJrygZfJ3SBsWSZGbp6IHPdXpw>
    <xmx:vNJZav665iCjuY9jJCdbK7RZ4TRPrsFSjRbOpyaAGszXSm2Y4TQSlYiG>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jul 2026 02:59:05 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [PATCH v4 0/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
Date: Fri, 17 Jul 2026 18:59:01 +1200
Message-ID: <20260717065903.2629399-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_235911_330154_1622DE5C 
X-CRM114-Status: GOOD (  14.04  )
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

Add mainline support for the ArmSoM CM5, an RK3576 compute module, and
its CM5-IO carrier board.

Patch 1 adds the binding, patch 2 the module dtsi and the carrier dts.

The on-module YT8531 PHY has no crystal and needs the SoC 25 MHz
reference clock (clk_mac_refout). Ungating it for RGMII needs a small
dwmac-rk change sent separately to netdev [1]; the clock is optional so
this DTS applies without it.

Tested on a CM5-IO: the YT8531 links at 1000 Mbit/s; RK806, HYM8563,
eMMC, microSD, the USB3 hub and the PCIe root complex all probe.
dtbs_check is clean.

Sorry about the v3 traffic: it went out twice because my mail provider
accepted the first copy but then held it for hours before delivering, so
a resend and the original both landed. That is fixed now.

Changes in v4:
- Use phy-mode = "rgmii-id" and let the YT8531 add both RGMII delays
  internally; drop the MAC tx_delay/rx_delay. The PCB does not use long
  clock lines, so rgmii-id is the correct description, and this matches
  the other rk3576 boards. Re-tested: link still comes up at 1000 Mbit/s
  (Andrew Lunn).
- Drop the redundant clocks/assigned-clocks on the PHY node; the 25 MHz
  reference is enabled and rated through clk_mac_refout on the gmac node,
  and clock properties on an MDIO child are not processed (sashiko-bot).
- Enable &sai6, the I2S CPU DAI the HDMI sound card needs to probe
  (sashiko-bot).
- Pick up Krzysztof's Acked-by on patch 1.

Changes in v3:
- Remove the ES8388 codec from the file header and the i2c0 block comment
  (the node was dropped in v2 but the comments still named it).
- Use gpios instead of gpio in the vcc_3v3_pcie fixed regulator.

Changes in v2:
- Type-C DP alt-mode: name the altmodes child "displayport" and make svid
  a /bits/ 16 value; drop the undocumented svid from &usbdp_phy and add
  the missing mode-switch.
- Move the FUSB302 role-switch endpoint into the connector's ports and
  rename the node to usb-typec@22.
- Drop the ES8388 node and the unreferenced gmac0_rst, bt_reg_on and
  wifi_host_wake_irq pinctrls.
- Rename the wifi-poweren-gpio pinctrl node (collided with
  gpio-consumer.yaml).
- Describe the PHY reset at the MDIO bus level rather than with the
  deprecated snps,reset-gpios.

[1] net: stmmac: dwmac-rk: enable the reference clock for output mode

Jiaxing Hu (2):
  dt-bindings: arm: rockchip: Add ArmSoM CM5 and CM5-IO
  arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO

 .../devicetree/bindings/arm/rockchip.yaml     |   7 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3576-armsom-cm5-io.dts     | 402 +++++++++++++
 .../boot/dts/rockchip/rk3576-armsom-cm5.dtsi  | 558 ++++++++++++++++++
 4 files changed, 968 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi

-- 
2.43.0


