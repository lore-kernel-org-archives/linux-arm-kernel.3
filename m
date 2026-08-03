Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5AEC5518F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 05:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=74sKA3Fp2KekMkzYHPtGWFK+N4ABlBFoAFD2YVwF/bc=; b=urINgsL4XVX1nt
	mbNAzrgOJSzdtLQqslAp9KeruIg1uGO2kB0I/IRYszy7Hd+yWsJhKFHnWcO+cZz3qsyJRwA1yLhKZ
	TPTlC+v9DG3V4GW3JFmduizlDyhdVz9tJ4GbFRF64QsPQOVBHi3xzZ41OyFvE2kUdeuTBFKjKkSXJ
	fBoPrEfBTUqlU4mFO9CLsHm8DapIN/4vPfaB01WuOq5WeVrnYyr6wmzfgSJWVEcLxY8BADyC/uq6D
	6XkHVFmG2N8RqTK9b2xWc8K1y+DI+jkpH0EMmt6nJezY7Jv+kZa6XkKoK6emXte2dh9acOXx0Lr9Y
	lfnrEBxqgvM/hJYl+OeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1J-0000000GKSW-1BKF;
	Mon, 03 Aug 2026 05:15:25 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1G-0000000GKRB-1eZt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 05:15:24 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7e9fc3de7ceso1362954a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 22:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734120; x=1786338920; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=74sKA3Fp2KekMkzYHPtGWFK+N4ABlBFoAFD2YVwF/bc=;
        b=DOcoU7bLkYGEPDsng+lZhk1oyp3vl7UwpINYpkjYr1lf3F2pzGDmo3seR1FnG8sOgL
         K73l5gDB004Tqkz9boJkpaja8b6JsYwVB/ZGUuRSNyzjZ8ctQ7mrV6accq7h1ENPLsYr
         IBRfoR+6M3ypVODgXNtnPVhF+G2DQzqbJ49A+mZI3t0iXhfWkYxLZbQAchkbQlEeXbJP
         ye2967JSNZ81mW3wM5XBaKqYbfSl1/D5uExchhvmUf/ierij8I8rtclREnHPP7fSXf1d
         UL9wYeGmM/o9Gwrb1yaAxkHDSYhhZk644ESkxswnryrS0xMF0bFuZS/hqzleht+snmGE
         ccrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734120; x=1786338920;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=74sKA3Fp2KekMkzYHPtGWFK+N4ABlBFoAFD2YVwF/bc=;
        b=KJwZ18NDO5nfQZokm303EQ4qa2Sj9hehxbBWm3fM2yHVypgE/K8zNl4q2etlbSfgDd
         WgDLTZhTdoY2MM1JnJ/bYvxPARKJ/mBvWQrvfselLj5rju3PmoQnte1dPbpBREZ67CiH
         3OiBDaf/IVTxGsVfK1W4aBeMeocdDerB1ZkHhjmZXgV33wsfwloduncQLWVseOoqUIDb
         UFVT48ZISO3OY7Y5GboLHZ40MsMR/0FUr9sEdVCV7gxNfaXwFs4gY5zme3evEDCqFRGD
         W+9wdEw9AUH9xEKIjML6gwO6NqMIELraZuq65C0lqd3RSRrGMRGEgCNq63yEPa+Qj58d
         aHow==
X-Forwarded-Encrypted: i=1; AHgh+Rol/P1ZgOsLayL0A1b3blYQgc/hYwKzDxMzCT/J05a3pkqu39dP8in5+pKMYwj7FRfUdfZYEYhOleWSxB4jdTyG@lists.infradead.org
X-Gm-Message-State: AOJu0YwE+x89aHv9C4k3ybblcM0eFBNxiDEpUYkPy3fAf4cvgEr4Xc7/
	mgMyW8Jni5rMBfwxClSBcgLgpZj90Gr0RoSwbW83fBVEgJcH8qO66yOULvN2JhJD
X-Gm-Gg: AR+sD111L9eGZajHbg8Cp2lXIN2L0mIXl2EQpLMHzydXr/iOYSreT0p4YhtiVMDMiIi
	tNLkBAe7p1AdOOHdFw+o6jOJcslHv/8pZbXTOYxd1tnMhWp2IWCc3OZ1hkqtO1C0jZfWk6o5R1t
	vUEcmnoPU+B2IvjNnNYxvq6kmkZj4jQbhLa35GY2wC9l2azaCGATLydKGI7tcutJvTFPGV7764G
	BmCneIRYiuESqTULq+djd2M9bVYL58bCVECc3vjdhNRRV5gWkExAAW8P9c8DOVblGSeN7mbVfx+
	XfYiW5chOWV/Lj79wZkCinVPabUuF/l6/EpnTpv6xCl3tKoY7VGyTIrc22/SjYbaZ5a9X4XbbeU
	Fnr5dKWxEOf0tkDephhAk1SwxrIJT8iTYi9hH6B/dbj7+DZq66+UM9hqdR1mdvAA9lIdoSOOFqE
	I51ct21E6sQocwi79oz1eFKsb9l9O0OoHaPczZ3HcDXfkUENdzgtH/uEh48ftvceo/YHyF22OfQ
	o8GxzX4rcMdnwfhMHNF64yanlOwiBc/oJPJjqYfoELjOt74u//QU6X67uNJJ9chLh0iFd+TpmBB
	Ykd+TD60GmQea/7GZFcIWwNm1UlqAysv4b+RgThE1sCijsTB74AGy7e6w9JZ0M9L64iaHWp5NOH
	e8Z2Pgj3eFTTU3MUo
X-Received: by 2002:a05:6830:488e:b0:7e9:cce4:803b with SMTP id 46e09a7af769-7f196e9595cmr15400429a34.8.1785734119585;
        Sun, 02 Aug 2026 22:15:19 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 00/21] net: phy: add X-Powers AC200/AC300 EPHY support
Date: Sun, 02 Aug 2026 23:14:10 -0600
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2Oy27DIBREf8ViXazLy2CrivofVRY8rlOqGBqwo
 1RR/r3E6fJIM2fmTiqWiJVM3Z0UvMYac2rA3jriv2w6IY2hMeHABzDAad3cEldq/Q2A5pmG32S
 X6OmV0VFaCJ6pmRtOmuCn4Bxvu/zz+OLW/ka/Po3/iYKXra2urxhZsFa7r07d+z6qQTDFOVM9G
 7lRI2W0xPathP6EKW/hw+W8nmPqfV4OT6uzFWmD9nPqQCunpZHMBYBBWeGCFVKC0cJrqUdhcBj
 dYMjx8fgD77ZBiw4BAAA=
X-Change-ID: 20260802-submit-acx00-of-dynamic-v1-94a0dc15f282
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_221522_459313_708C86AB 
X-CRM114-Status: GOOD (  15.70  )
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

The Allwinner H616/H618 secondary EMAC is commonly connected to a Fast
Ethernet PHY in an X-Powers AC200 or AC300 companion package.  The two
packages expose the same link PHY ID and largely compatible link-side
registers, but require different control paths before those registers can
be accessed: AC200 is initialized through its I2C MFD, while AC300 uses a
non-PHY Clause 22 control endpoint.

Some H616-family products were shipped with either package under the same
board identity.  For those systems, this series uses a SID NVMEM field to
select the control provider at run time.  With CONFIG_OF_DYNAMIC, the link
PHY enables only the selected fail-needs-probe provider, so an AC300 board
does not probe the unused AC200 I2C controller or claim its pins.  The same
drivers also support fixed descriptions without CONFIG_OF_DYNAMIC: a board
can reference one enabled provider, or enable both candidates when runtime
selection is still required.

The series adds:

  - the H616 EMAC1 binding, stmmac variant and controller node;
  - generic MDIO OF reconfiguration support for PHYs, packages, scanned
    addresses and generic MDIO devices;
  - the AC200 MFD and AC200/AC300 EPHY control providers;
  - the shared AC200/AC300 link-PHY driver, including calibration, power and
    reset sequencing, MDI/MDI-X, statistics, EDPD, PHY-managed EEE, package
    LEDs, interrupts and Wake-on-LAN; and
  - H6 and H616-family device-tree descriptions and arm64 defconfig support.

The AC200 and AC300 control and link paths were exercised on H616-family
hardware during development, including link traffic, address handling,
ethtool EDPD/EEE controls, statistics and LEDs.  The H6 interrupt and
Wake-on-LAN description still needs validation by an H6 hardware user.

This series depends on Richard Genoud's v7 H616 PWM controller series,
which provides the bypass clock used by the companion EPHY:

  https://lore.kernel.org/all/20260703152215.192859-1-richard.genoud@bootlin.com/

The PWM patches are an external prerequisite and are intentionally not
included in this 21-patch series.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (18):
      net: mdio: factor out OF child registration helpers
      net: mdio: make device map changes hotplug-safe
      net: mdio: support dynamic OF device changes
      dt-bindings: net: x-powers: add AC200 EPHY control
      dt-bindings: mfd: x-powers: add AC200
      mfd: add X-Powers AC200 support
      net: phy: add X-Powers AC200 EPHY control driver
      dt-bindings: net: x-powers: add AC300 EPHY control
      net: phy: add X-Powers AC300 EPHY control driver
      dt-bindings: net: x-powers: add AC200/AC300 EPHY
      net: phy: support configuring PHY-autonomous Tx LPI
      net: phylink: allow PHY-autonomous EEE without MAC LPI
      net: phy: add X-Powers AC200/AC300 EPHY driver
      arm64: dts: allwinner: h616: add ACx00 EPHY resources
      arm64: dts: allwinner: orangepi-zero2w: enable Ethernet expansion
      arm64: dts: allwinner: h6: add AC200 EPHY resources
      arm64: dts: allwinner: h6: tanix: enable AC200 EPHY
      arm64: defconfig: enable X-Powers ACx00 Ethernet support

Richard Genoud (3):
      dt-bindings: net: allwinner: add H616 EMAC1
      net: stmmac: sun8i: add support for Allwinner H616 EMAC1
      arm64: dts: allwinner: h616: add EMAC1 controller

 .../devicetree/bindings/mfd/x-powers,ac200.yaml    |  118 ++
 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    |   18 +-
 .../devicetree/bindings/net/snps,dwmac.yaml        |    2 +
 .../bindings/net/x-powers,ac200-ephy-ctl.yaml      |   46 +
 .../bindings/net/x-powers,ac300-ephy-ctl.yaml      |   77 ++
 .../bindings/net/x-powers,acx00-ephy.yaml          |  217 +++
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi |   45 +
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi       |   73 +
 .../boot/dts/allwinner/sun50i-h616-acx00-ephy.dtsi |   61 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |   51 +
 .../dts/allwinner/sun50i-h618-orangepi-zero2w.dts  |   13 +
 arch/arm64/configs/defconfig                       |    6 +
 drivers/mfd/Kconfig                                |   13 +
 drivers/mfd/Makefile                               |    1 +
 drivers/mfd/ac200.c                                |  302 ++++
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  |   21 +
 drivers/net/mdio/of_mdio.c                         |  508 ++++++-
 drivers/net/phy/Kconfig                            |   30 +
 drivers/net/phy/Makefile                           |    3 +
 drivers/net/phy/mdio_bus.c                         |   14 +-
 drivers/net/phy/mdio_bus_provider.c                |  140 +-
 drivers/net/phy/mdio_device.c                      |  235 +++-
 drivers/net/phy/phy.c                              |   35 +-
 drivers/net/phy/phy_device.c                       |  127 +-
 drivers/net/phy/phylib-internal.h                  |    4 +-
 drivers/net/phy/phylink.c                          |   35 +-
 drivers/net/phy/xpowers-ac200-ctl.c                |  330 +++++
 drivers/net/phy/xpowers-ac300-ctl.c                |  454 ++++++
 drivers/net/phy/xpowers-acx00.c                    | 1457 ++++++++++++++++++++
 drivers/net/phy/xpowers-acx00.h                    |   27 +
 include/dt-bindings/mfd/x-powers,ac200.h           |   13 +
 include/linux/mdio.h                               |    6 +
 include/linux/phy.h                                |   36 +
 33 files changed, 4384 insertions(+), 134 deletions(-)
---
base-commit: 075b74841bd0065a3bda3440873c747938e69b68
change-id: 20260802-submit-acx00-of-dynamic-v1-94a0dc15f282
prerequisite-message-id: <20260703152215.192859-1-richard.genoud@bootlin.com>
prerequisite-patch-id: 8c447ebd677ea7bf9e63a77d34d8fdaa05eebe7f
prerequisite-patch-id: c7574f9c0e2571ce8c6129ac6db7aa959c986ef3
prerequisite-patch-id: e8b00768102951244927ecf054314f6e02f9ff1b
prerequisite-patch-id: a3e2055ed7f3b5751a3e02d57e674b25ee404ff7

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


