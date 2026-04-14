Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26272F9D0FC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 21:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9sQVj34tJCzHG+OSzAE6qEOKAh1LdGOwM6EDuxjty+c=; b=M27r3Pms0npd3415s6GUNyMlQj
	9zqH4njhFiyzxCicoD2sg4fDCLQoBsuHivZVsy3UnwBm5q4xA11XXq0OZndDS2EB1CNFtk1rtbzv0
	SstWEtWwRLmxx+enxPU0w+RLrw6kYKDfes6PawtEe72n7WoAkOq9wBvKuPoj81VHldl9knWMD4BIN
	Ue0eC9M2AOpexL2jSNjGgczEeMRjGB8a2px7qyu7HV3i2SLimwBhobPdAbGCVqIYOWshbNxjMiqNq
	hCRYhQAcbXlDs3gB8mqBZXZGA/FNCOSprW5LCpEkXQ3b7cP69FgeyI/7EOGrCUlR6CyF2ZiNhwLp5
	owbTi0/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wClVR-00000000FcG-170w;
	Tue, 14 Apr 2026 21:41:13 +0000
Received: from mail-vs1-xe64.google.com ([2607:f8b0:4864:20::e64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wClVO-00000000FaG-2EV6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 21:41:12 +0000
Received: by mail-vs1-xe64.google.com with SMTP id ada2fe7eead31-6121f20650dso294971137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 14:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1776202868; x=1776807668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9sQVj34tJCzHG+OSzAE6qEOKAh1LdGOwM6EDuxjty+c=;
        b=Lsb5pwIT2gwRI5VrQMAJURizFAlYOhRUk2EzbtOck+ynbB2pufImVZzw8sVHrNQTKf
         EI3BkT0w6KwOaFRSb3rci92YxD5TGUzu84pPrqj7mNKmN87zAqY6zycSKBR4145PJKRF
         rdtEkpEJhY3y4Lu8AAkHhCtedFBmPrtCKlZ0XJl2eHRITZCmI+jYoZ6dHpdcam4ZAh0K
         R9OS80AV+aGIFN2VZkRpiHyIDxF+wo7FU9sCsorKly5w4tTeaxmTpzi05/WzSQH1qjY6
         OF91mNf7PNzQnCzgrZUsNFeFK3iDypKKNnOJwi6ghBbpaqnzgZo79qHXKJPIRj/lCYkb
         n0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776202868; x=1776807668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sQVj34tJCzHG+OSzAE6qEOKAh1LdGOwM6EDuxjty+c=;
        b=lQvkDCbxVjz8MLB+K2DVbpvK1188KaFRt/WpI53y2rFPBVavCaVfCEkXm2oZqPaIaG
         WplatUwg/8F/2rAuPDfMri8OosC3OdpJt6Vavfhz2+kxDTpzG4ulMVa928pmEg46GquX
         Xo3AMBW2dvoMKuD95p3rXkfo1qOxljTN5+qgjTOGh/wybK2CbXWV2Eo69fxi8c/ZHRfO
         wUwsDSOTCJuyArLxhF42ILKlO8tTy1GxTyUEobjKgA0jFTO7xQ5k2oRKaid88XHdyk+A
         6zlJ8E/omi22fUlt1vADG8Wd0i2GN/uC7fn9YGjMVCTRpzsM2oDjoKdd2mKByLlNrhXd
         9RTg==
X-Forwarded-Encrypted: i=1; AFNElJ/U7+yY95Qjm94DiTSRl255MX67gwgrOyE3vsVVADVYWRmON21sip6eC+TlhkjogeFXPhBa3DEKdwy5zgo1LsIo@lists.infradead.org
X-Gm-Message-State: AOJu0YyeIID1UcTLH8kCF9TV0ZB3r0yd+RBY8HMQOJb9iIzG21x2hc9O
	z3vqhZsO+TdVSqKIGki6jDo5c4sN3+T5PPKh0awmWb2JvocZ4V0ElRN6PFyWUfw9+dFLJkmU2oj
	PwUlroDhPLSGlFr9fXvm0ZDk9HN3nbDES+bes
X-Gm-Gg: AeBDieuf6/iK7U3TlWSJPaWQJSkzX/9kFSJsBtFGbc1vs9YCK4hbujHcysho9B0YTDi
	AmMVFEqOeypCHi6hm7d4uhMunpAtGqDCxud9Ir2OzKuC4qRPJGK11HqGpEXuVC8d/d0jwH95M72
	uEdYOSAgHTZ7TBnWQfcFuEBCLbWE+SdasZxdTUH4YblZPMsDF9EnemGlKIW7Oy23O52AOa6cnyw
	6kSVDZ3OCH8jVTYZ+VQiXEHxf3YA3kAqANGlOCfn/Hy34H9TXOv/L5jQUGBIreQWDDL9IFkHJ6c
	VMOYmltrl7SjcUat/we4q9aoyf/u9DJU4qecK/L+90lSRzueYKCZGf8XZIaFIiakYruZpFUo7WE
	zVDBAfgm3b13R8v+INXxuKkGCACT9XBIQmNoqv24zwZ8olxvk3TG62/4=
X-Received: by 2002:a05:6102:10ce:b0:60a:9cac:d286 with SMTP id ada2fe7eead31-60a9cacdb01mr5997352137.12.1776202868454;
        Tue, 14 Apr 2026 14:41:08 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-95691131afesm346899241.1.2026.04.14.14.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 14:41:08 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: 
Cc: Alexey Charkov <alchark@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Dennis Gilmore <dennis@ausil.us>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	FUKAUMI Naoki <naoki@radxa.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hsun Lai <i@chainsx.cn>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	John Clark <inindev@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Peter Robinson <pbrobinson@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Robert Foss <rfoss@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v7 0/6] Add support for Orange Pi 5 Pro
Date: Tue, 14 Apr 2026 16:40:51 -0500
Message-ID: <20260414214104.1363987-1-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_144110_600015_B744D8F9 
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

This series adds initial support for Orange Pi 5 Pro. The PCIe attached
network driver(dwmac-motorcomm) was just added.

The series was tested against Linux 7.0-rc7

Please take a look.

Thank you,

Dennis Gilmore

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
  match the schematics as they all use vcca_*
- RK806 PLDO1 and PLDO2 outputs are swapped between the 5/5B and pro.
  move their definition to the shared 5/5B dtsi and 5 Pro dts
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
- Added pinctrl entries for all GPIO pins (dp_bridge_en, vcc3v3_phy1_en,
  wifi_enable_h, pcie2x1l1_rst, pcie2x1l2_rst)
- DP bridge rework — replaced dp-connector node with proper chain:
    - lt8711uxd bridge node (compatible lontium,lt8711uxd, with port@0/port@1
      endpoints). Bridge power is gated by the vcc3v3_dp regulator, whose
      enable GPIO (GPIO3_PC2) is driven via the dp_bridge_en pinctrl group;
      no enable-gpios/vdd-supply on the bridge node itself.
    - hdmi1-con connector node (compatible hdmi-connector, type a)
    - dp0_out endpoint now points to bridge input instead of old connector
- drop accidentally included, unrelated changes to
  drivers/gpu/drm/bridge/synopsys/dw-dp.c and
  Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
- link to v6 https://lore.kernel.org/linux-devicetree/20260411024743.195385-1-dennis@ausil.us/

Changes in v6:
- Move the shared configs for the Orange Pi 5 and Orange Pi 5b from each
  devices dts to a shared rk3588s-orangepi-5-5b.dtsi to avoid duplication
- Remove empty ports subnodeis from typea_con
- Move i2s2m1_mclk pinctrl from &i2s2 to the es8388 codec node
- Add dp-con, dp0_out, dp0_in, and vp1 nodes, plus the vcc3v3_dp regulator
  in order to get the second HDMI port working via its transparent
  LT8711UXD DP to HDMI bridge
- link to v5 https://lore.kernel.org/linux-devicetree/20260401010707.2584962-1-dennis@ausil.us/

Changes in v5:
- define a connector node for Type-A port, and list the regulator as its VBUS supply explicitly.
- Requires https://lore.kernel.org/all/20260217-typea-vbus-v1-1-657b4e55a4c2@flipper.net/
- link to v4 https://lore.kernel.org/linux-devicetree/20260310031002.3921234-1-dennis@ausil.us/

Changes in v4:
- rename vcc3v3_pcie20 copied from rk3588s-orangepi-5.dts to vcc3v3_phy1 to match the schematic
- use vcc_3v3_s3 as the supply not vcc5v0_sys for PCIe
- remove the definition for vcc3v3_pcie_m2 as it does not really exist
  as a regulator

- link to v3 https://lore.kernel.org/linux-devicetree/20260306024634.239614-1-dennis@ausil.us/

Changes in v3:
- moved leds from gpio-leds to pwm-leds
- remove disable-wp from sdio
- rename vcc3v3_pcie_eth regulator to vcc3v3_pcie_m2 to reflect the
  purppose
- actually clean up the delete lines and comments missed in v2
- link to v2 https://lore.kernel.org/linux-devicetree/20260304025521.210377-1-dennis@ausil.us/

Changes in v2:
- moved items not shared by orangepi 5/5b/5 Pro from dtsi to 5 and 5b
  dts files
- removed all the comments and deleted properties from 5 Pro dts
- Link to v1 https://lore.kernel.org/linux-devicetree/20260228205418.2944620-1-dennis@ausil.us/


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
 .../dts/rockchip/rk3588s-orangepi-5-5b.dtsi   | 222 +++++++++
 .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 442 ++++++++++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5.dts  |   6 +-
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 235 +---------
 .../boot/dts/rockchip/rk3588s-orangepi-5b.dts |   2 +-
 drivers/gpu/drm/bridge/simple-bridge.c        |   5 +
 9 files changed, 695 insertions(+), 220 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts

-- 
2.53.0


