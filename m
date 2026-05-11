Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843F8CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 02:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r4O7npYUzaYeXNaPBSORmBhh0snrT3iu++6Vs+W8JAA=; b=1ClkqJjF6CmoVIp0hmVueeLei4
	IynwVubD4inAH19zkZwuZ0B9esqFPSsp0nheVK5rW8gqkDeap7xaBTsLUqW0D2aZwK2Pi0ebpQg7a
	3FasucZ7hLorgYPGgdq8BlV3XGlthhu6S41Qg+cvUgTvMrVRRettCXHp011YVqK+2K4oCbQrBrTe4
	j30Log6KIYIznS+Q5ZsSyPf6Ynu4HJJSLJ706WFbtc4xuiWPYRsWu6wkR5Wr2WgNc7a0uKnu/fNqd
	QZBFkZAsLWtP9ejD64xx3E6Fyw0Y8rmR7j7SyrIe8cndeLrtHqhB3tGZVTXMlJ+E/KOZxj11Ikuvk
	t4+7IGjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMGmQ-0000000C4u6-0QFr;
	Mon, 11 May 2026 02:54:02 +0000
Received: from mail-vk1-xa67.google.com ([2607:f8b0:4864:20::a67])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMGmM-0000000C4rb-1mSo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 02:54:00 +0000
Received: by mail-vk1-xa67.google.com with SMTP id 71dfb90a1353d-56f72d27e7eso4278954e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 19:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1778468036; x=1779072836; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r4O7npYUzaYeXNaPBSORmBhh0snrT3iu++6Vs+W8JAA=;
        b=NXWmVx/84fkMqSj1+5yVBv5XeJDIp+3QLRqBJPkxApf8OTOnEsYQ7GOhPLXOFpW8tr
         B6ab2zAkpspvZAsgm3imTKOlB7wYmKgthzRnQ7b6BpPAQNjvt9uLGLOx0E0ehE7ru8wQ
         l/7eBVtpXqg9ePsVRqc30PVrM1YFPQ7DlB3UpP1ZNe4SOjyNV2OI3kJYnMPwiXJVvEGq
         g9b/X7vz1lzILfm8wLJZ0zrdGoKgCDj2JeUMI67m53tc47LldoeJo5re/8SzqvG2u66O
         lijY8zCroRZzmyxAPHo6yIX5gzdrHXKNJXbNiOI98l8OISMPiUR9N6qX5u/2AupHsmUL
         5dRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778468036; x=1779072836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4O7npYUzaYeXNaPBSORmBhh0snrT3iu++6Vs+W8JAA=;
        b=iYh5yqdpP3XvpQLA9C0sHHNZNxic8YCStwu91FtJ43X8DEwh9jFlnGSWjvA9U2D9x+
         VF4age1eO3ABni0Vv2btib2gmo+dTGwycXjbUjJgYppJebZZkDhfKSML7IoOGQ8dmJth
         7XM64I8HorN46s3PQ+W/JZAZKfC4ok/NA850KrQYq/p6xPr53UOcSsEycgrOh0JDBHf/
         k5lVYWF6uQTRurVufAMQ32iKbtuz5moqjk/nzUHNsI5n5v8mm2NjC7xqakgFPuLnW+Vi
         NJNOMJCb70jYi2LXSBHWKWHX+STfw2X18qIWtxPT2TG4srjauKURFv9qkDSsWlkO1gCs
         J3Tg==
X-Forwarded-Encrypted: i=1; AFNElJ+XyNJ9FmXfUWX51jIHTLbYkosx4lAbxdktKrJ9uarw4QwjPWyFvokndRc9HsHhsm0OqyQ7hJX6XCNQDu4ICZlT@lists.infradead.org
X-Gm-Message-State: AOJu0YwKsVOxAQ61oMeIgH7EzicRpr9EAzsvff8e2n6JdsNI8MxdmW3/
	NQOfbxvLG3hZoFmuVBSuV4zFu/6ViOuUiMmiG4xn1NdfcveyrqGKXzzoIn0/taU2DjtkM5Hd5aC
	azdX/jPAZl0jgZ1/VbXZo+temgWZZYDfUFBBW
X-Gm-Gg: Acq92OEhEuFFqPeGq+7+JLTPcFrdya0/brywVHXWCdvLzqrTE9gcRvWDJ46xwin33OQ
	e1shLqDXoaNEEcoeqrqxNXMKO+Hz7loJ/WpjyFu5pm8XGU5u7fbeCKHLde/Hq6oyVnvkz6rkm2H
	yPmRauXXO9wR6fiT/0ECxN3bPXf2PZjpeA7WDQ7Sq5kamVNW8SG1MRxhZvEMH3wPIuchh3VVmzI
	56A0+EvxjqY+p0oytDyxXp7cUj/N8NiDs4pkWnSy4op+fhfkKnU30Yg22b7y6aOCSkmvD6Mn6aT
	yFVRZndp0tNzKEAYAQCuENUMrikQmV2cz4eRmTJtWQUiXsPWdyANePhmj/QRrd8KsRnmrpNyjpz
	oxNjGnv4wsWHtOewFhNF/SlBhHBO2YlhPiZ4j+IFzhrX9
X-Received: by 2002:a05:6102:358e:b0:634:6b98:c37 with SMTP id ada2fe7eead31-6346b9813e0mr447506137.7.1778468036478;
        Sun, 10 May 2026 19:53:56 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-6313ff6c191sm698744137.1.2026.05.10.19.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 19:53:56 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Alexey Charkov <alchark@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>
Subject: [PATCH v10 0/4] Add support for Orange Pi 5 Pro
Date: Sun, 10 May 2026 21:53:46 -0500
Message-ID: <20260511025352.106126-1-dennis@ausil.us>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_195358_494343_09D59338 
X-CRM114-Status: GOOD (  21.79  )
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
a Motorcomm YT6801 NIC (PCIe), WiFi/BT (BCM43456), HDMI connected to SoC
(Second port is disabled in this patch), and a 40-pin expansion header.

The series was tested against Linux 7.0

Please take a look.

Thank you,

Dennis Gilmore

Changes in v10:
- rename rk806_single to rk806
- link to v9: https://lore.kernel.org/linux-devicetree/20260429024737.544813-5-dennis@ausil.us/

Changes in v9:
- removed support for the dp-to-HDMI bridge, will send in a second patch
  set to enable discusion to finish on how to handle its two operating
  modes
- link to v8: https://lore.kernel.org/linux-devicetree/20260425031011.2529364-1-dennis@ausil.us/

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

Dennis Gilmore (4):
  dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
  arm64: dts: rockchip: rk3588s-orangepi-5: rename PLDO regulator labels
    to match schematic
  arm64: dts: rockchip: refactor items from Orange Pi 5/b to prep for
    Pro
  arm64: dts: rockchip: Add Orange Pi 5 Pro board support

 .../devicetree/bindings/arm/rockchip.yaml     |   1 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588s-orangepi-5-5b.dtsi   | 256 +++++++++++++
 .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 358 ++++++++++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5.dts  |   6 +-
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 263 +------------
 .../boot/dts/rockchip/rk3588s-orangepi-5b.dts |   2 +-
 7 files changed, 637 insertions(+), 250 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts

-- 
2.54.0


