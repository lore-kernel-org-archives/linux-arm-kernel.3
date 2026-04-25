Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEA8FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 03:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fvue385W0hX6gDR6DeAjBvEUcDEjMxESWf6pVitmIoY=; b=LQDY9cjCHcF70tDK9mNqVNJhr/
	hC71Z5gW3iN6nJpXa3gI7Kl+9HPdsjonqrniCeWaKeeRc+CRLkf6mWb2deinxF6osumo8/ioG1rpY
	KL1c5TL/fItTk05EK7MlyTnxI1uXhpZsh06dvUeGOGg4wRtLHHIJuFldDTruNe8LMLnVqfivTt1xA
	NRGArNNDMz9dCImFDrYalI934/sCFxJ+OUAk/ctNXwJyKkNIH0Xs6UQfver+RH8VDmcjpT8JwUMps
	utqkd0LU9wA4/dTbWXVu3+Tvt9Vk5f81TFn3lugruFKzIX/KSbUBwHzM8V+zAEGvodCTiEjv2o9mH
	TcrnQsBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGTPQ-0000000E1bM-0zvO;
	Sat, 25 Apr 2026 03:10:20 +0000
Received: from mail-dy1-x1364.google.com ([2607:f8b0:4864:20::1364])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGTPN-0000000E1Zw-0mve
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 03:10:18 +0000
Received: by mail-dy1-x1364.google.com with SMTP id 5a478bee46e88-2d868d014a5so8351277eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 20:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1777086616; x=1777691416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fvue385W0hX6gDR6DeAjBvEUcDEjMxESWf6pVitmIoY=;
        b=efqnm72E/axv8XwwR7kvej6dfGa3uHWLllVV9dhFylx/2DlfLWH5XqRW0kOygOiIIC
         CfNDUTqkIt/CCyz19zriCGabErzOUYy7hhMrLgW8FROnq+dHQhNwNfG5ZB8ixgwLI2Sg
         xSz7Mk1aHMRUVUHNBJ6ss9CgQitmnoFRyelvfpXrWpsTwR50tSWgmNMUMAivkexrHeRe
         I+QSMgZFCxJdLj8TJt20oOd5TlUZsSMIJxaDx60HhkccFtXkscPuL7H54ZioJ9MxTY27
         1+QzrRScYbLs4JG86i4xSGl+XJAHZqqmm71QGOPPcowo3t6zp+Vub0uSsKdZ52gXHXpr
         Bv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777086616; x=1777691416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fvue385W0hX6gDR6DeAjBvEUcDEjMxESWf6pVitmIoY=;
        b=PKAAlo78U/rWACPOe/zjHrH6qc11xOvqe2cOKXaLRZe8xs11gta71D3dtX0XQ7aGir
         a1FCPEs6wKqGRQXNTKIgViFOYRwnbFRbD6WJIiBXp1r80gdLop0YlRYl02WW3I1yUUZP
         KqkLGpmG6d+FJNTDTI7ktMeN3ar9ViX2jlP5JnJLZXreToPymbMqg4Zxh504rRFR/MWH
         w3WhEpMpKZqh2aFaWrqH+2/3jekiteAqV5NYbu++gfqfnnSPY7+IwwsjvzFY+PFnoArE
         4O/4ISwx+YN06Tr5vL9Ed3BRr57pNI8qakWSxOv2RiWUURFvVy0l0JLM8u9Qzu6KfvzL
         aqzw==
X-Forwarded-Encrypted: i=1; AFNElJ+kzzaorGjg+htTAcWnLNKGDbfor+S2wubU4XOvUCw+86/sP6OU9kT0hF+yQeW2b0pNXVsu/BOSs15/DJBAl7bL@lists.infradead.org
X-Gm-Message-State: AOJu0YzY1UfxJbLynNDo3f1DxsEm6/58ZxYNsGu5VqGIM53+vj3+bJ4Q
	0ZTFRrHMjtfn65yAJpCdx0RRuavK5KJnkggNi58sNxcBMKoxfaueO8wyq6KXi/PXW1Wuw2lDGdq
	NC4Ad7XHftrNlXD/U2+WAdcLLEzT2oa7Awh43
X-Gm-Gg: AeBDieuq8vdFRK+rCrozdT2LaWuRsR0frOAwolF2lHtfL4rVMtwcl1Qcrou96fM4got
	/7suBIHbhgzGZu5kdBntmS8HOExe0U3uaGy4NEDcpnnMkT6Yy5l4g/7clweQRV2iAeGwa/Ad2bk
	qMDsP6tCwvhF0aFwAyH26fTHaT3mf98ZUM8E5Amq+w2j5C4TkCCku3Pf/38gVHVGbO+vcGd3Zqo
	X/lsjA3wg2Hz281LzTqWj7b5m/m1pDQH7wGepec0bXwBtIZ3BMl7caqD8H9pb6x41FJEIN/4V7N
	Dn12VOo9mkUAw0K9aH3OoEaE8rvZ8RS6LKrkRmqrTg71L4fSAHNjCk+idIu3JsK9lSG30PIK/Rc
	hTZyT/ril2BESRorYuz0BJXFX1q4Qn14pz0s8ruYJ8GxpFS6wmgLSBak=
X-Received: by 2002:a05:7301:4586:b0:2e2:27bb:a4a2 with SMTP id 5a478bee46e88-2e47873a866mr19665803eec.13.1777086615769;
        Fri, 24 Apr 2026 20:10:15 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-2e53a3ae691sm1728646eec.11.2026.04.24.20.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 20:10:15 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: Heiko Stuebner <heiko@sntech.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Alexey Charkov <alchark@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>
Subject: [PATCH v8 0/6] Add support for Orange Pi 5 Pro
Date: Fri, 24 Apr 2026 22:10:05 -0500
Message-ID: <20260425031011.2529364-1-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_201017_248124_71E60E85 
X-CRM114-Status: GOOD (  20.08  )
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

This series adds initial support for the Xunlong Orange Pi 5 Pro, based on
the Rockchip RK3588S SoC. The board features eMMC, SD card, NVMe (PCIe),
a Motorcomm YT6801 NIC (PCIe), WiFi/BT (BCM43456), dual HDMI output (the
second via a Lontium LT8711UXD DP-to-HDMI bridge on dp0), and a 40-pin
expansion header.

The series was tested against Linux 7.0

This series depends on:
  https://lore.kernel.org/all/20260217-typea-vbus-v1-1-657b4e55a4c2@flipper.net/

Please take a look.

Thank you,

Dennis Gilmore

Changes in v8:
- Bridge node: renamed label from lt8711uxd to hdmi-bridge
- Bridge node: added vdd-supply = <&vcc3v3_dp>. The vcc3v3_dp regulator
  gates power to the LT8711UXD. regulator-always-on is kept because
  drm_simple_bridge only enables vdd-supply with HPD which does not
  happen without power on
- GPIO output pinctrl groups (bt_wake_gpio, dp_bridge_en, ethernet_en,
  vcc5v0_otg_en, wifi_enable_h) changed from pcfg_pull_none to
  pcfg_pull_down to match the RK3588S power-on-reset default state
- pcie2x1l1 (NVMe): switched from GPIO-mode reset to hardware sideband pins
  using pinctrl-0 = <&pcie30x1m1_1_perstn>, <&pcie30x1m1_1_clkreqn>,
  <&pcie30x1m1_1_waken>. Note: despite the "pcie30" prefix in the DTSI
  group names, the SoC pin-mux table confirms these alt-function 4 pads
  physically route to pcie2x1l1's native PERST#/CLKREQ#/WAKE# inputs.
  reset-gpios is retained alongside the pinctrl entry for U-Boot
  compatibility (pcie_dw_rockchip in U-Boot requires reset-gpios).
- pcie2x1l2 (NIC): added &pcie20x1m0_clkreqn and &pcie20x1m0_waken to
  pinctrl-0
- Renamed pinctrl group vcc3v3_phy1_en to ethernet_en to match the
  schematic signal name (Ethernet_EN)
- link to v7: https://lore.kernel.org/linux-devicetree/20260414214104.1363987-1-dennis@ausil.us/

Changes in v7:
- Fix up whitespace issues identified by checkpatch.pl --strict in
  rk3588s-orangepi-5-5b.dtsi
- checkpatch gave a warning for WARNING: phy-mode "rgmii-rxid" without
  comment, as this was moved over I left it untouched
- Added lontium,lt8711uxd to the compatible enum in the simple-bridge
  binding
- Added lontium,lt8711uxd match entry with DRM_MODE_CONNECTOR_HDMIA to
  the simple-bridge driver
- New patch to rename the regulator labels for the es8388 supplies to
  match the schematics and they all use vcca_*
- Fixed ES8388 PVDD-supply — vcca_3v3_s0 → vcca_1v8_s0, 5 Pro is
  different to 5 and 5b.
- analog-sound: use CPU-as-clock-master on the Pro. The ES8388 is wired to
  i2s2_2ch (the only I2S block physically routed to the codec pins on this
  board), which uses the legacy rockchip_i2s driver. That driver's
  slave-mode trigger path hangs for 200 µs polling I2S_CLR and bails with
  -ETIMEDOUT ("lrclk update failed"). The TDM-capable i2s0/i2s1/i2s5
  blocks served by rockchip_i2s_tdm don't have this issue, which is why
  other mainline ES8388 boards get away with bitclock-master = masterdai.
  Drop bitclock-master/frame-master and the masterdai label to let the I2S
  block generate BCLK/LRCK itself
- Removed regulator-always-on/regulator-boot-on from vcc3v3_dp
- Added pinctrl entries for all GPIO pins (dp_bridge_en, vcc3v3_phy1_en,
  wifi_enable_h, pcie2x1l1_rst, pcie2x1l2_rst)
- DP bridge rework — replaced dp-connector node with proper chain:
    - lt8711uxd bridge node (compatible lontium,lt8711uxd, with port@0/port@1
      endpoints). Bridge power is gated by the vcc3v3_dp regulator, whose
      enable GPIO (GPIO3_PC2) is driven via the dp_bridge_en pinctrl group;
      no enable-gpios/vdd-supply on the bridge node itself.
    - hdmi1-con connector node (compatible hdmi-connector, type a)
    - dp0_out endpoint now points to bridge input instead of old connector
- remove accidentally included unnecessary changes
- link to v6: https://lore.kernel.org/linux-devicetree/20260411024743.195385-1-dennis@ausil.us/

Changes in v6:
- Move the shared configs for the Orange Pi 5 and Orange Pi 5b from each
  devices dts to a shared rk3588s-orangepi-5-5b.dtsi to avoid duplication
- Remove empty ports subnodeis from typea_con
- Move i2s2m1_mclk pinctrl from &i2s2 to the es8388 codec node
- Add dp-con, dp0_out, dp0_in, and vp1 nodes, plus the vcc3v3_dp regulator
  in order to get the second HDMI port working via its transparent
  LT8711UXD DP to HDMI bridge
- link to v5: https://lore.kernel.org/linux-devicetree/20260401010707.2584962-1-dennis@ausil.us/

Changes in v5:
- define a connector node for Type-A port, and list the regulator as its VBUS supply explicitly.
- Requires https://lore.kernel.org/all/20260217-typea-vbus-v1-1-657b4e55a4c2@flipper.net/
- link to v4: https://lore.kernel.org/linux-devicetree/20260310031002.3921234-1-dennis@ausil.us/

Changes in v4:
- rename vcc3v3_pcie20 copied from rk3588s-orangepi-5.dts to vcc3v3_phy1 to match the schematic
- use vcc_3v3_s3 as the supply not vcc5v0_sys for PCIe
- remove the definition for vcc3v3_pcie_m2 as it does not really exist
  as a regulator
- link to v3: https://lore.kernel.org/linux-devicetree/20260306024634.239614-1-dennis@ausil.us/

Changes in v3:
- moved leds from gpio-leds to pwm-leds
- remove disable-wp from sdio
- rename vcc3v3_pcie_eth regulator to vcc3v3_pcie_m2 to reflect the
  purpose
- actually clean up the delete lines and comments missed in v2
- link to v2: https://lore.kernel.org/linux-devicetree/20260304025521.210377-1-dennis@ausil.us/

Changes in v2:
- moved items not shared by orangepi 5/5b/5 Pro from dtsi to 5 and 5b
  dts files
- removed all the comments and deleted properties from 5 Pro dts
- link to v1: https://lore.kernel.org/linux-devicetree/20260228205418.2944620-1-dennis@ausil.us/

Dennis Gilmore (6):
  dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
  dt-bindings: display: bridge: simple: document the Lontium LT8711UXD
    DP-to-HDMI bridge
  drm/bridge: simple: Add the Lontium LT8711UXD DP-to-HDMI bridge
  arm64: dts: rockchip: rk3588s-orangepi-5: rename PLDO regulator labels
    to match schematic
  arm64: dts: rockchip: refactor items from Orange Pi 5/b to prep for
    Pro
  arm64: dts: rockchip: Add Orange Pi 5 Pro board support

 .../devicetree/bindings/arm/rockchip.yaml     |   1 +
 .../display/bridge/simple-bridge.yaml         |   1 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588s-orangepi-5-5b.dtsi   | 256 ++++++++++
 .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 440 ++++++++++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5.dts  |   6 +-
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 263 +----------
 .../boot/dts/rockchip/rk3588s-orangepi-5b.dts |   2 +-
 drivers/gpu/drm/bridge/simple-bridge.c        |   5 +
 9 files changed, 725 insertions(+), 250 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts

-- 
2.53.0


