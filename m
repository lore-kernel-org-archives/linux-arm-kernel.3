Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FA9CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 17:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nujP9rgCHe8pVwsy2vxm07nZV8x4bv342qsfibZkYP0=; b=BdSrf6mgaKKT1X63tdEzMIh1ll
	77tjs3LLU8yOuAK455IVuqbEMLU+BBh7BxYhoRCahLQTlNxXHcmrcQO3xA5yuzru7Qwl90f2nxVmU
	Tq5e2TA+QhDNzPQbjkD3IJ5umDDt+WLEY9J5KqiTP7ieSUGDpSa7hwhl9emipC2knJ9aOyPsHc7OG
	gIKft+wxWPcdMYuzfnuOkck28PmobidUHr8+2VKaYVkb/hYWR3Hs1dM26Pfb4hJTGJnO6M2Tkx9ui
	rDpJD8jPDJQgMBDNGdTuuSvMZ5oez3MGE4jNUSSmk+B+ZoUZlYj4eYu8TYBylhUe2+ji12+KaLlDb
	p9vkKK2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH37i-0000000G6f9-0hQV;
	Wed, 14 Oct 2026 17:50:42 +0000
Received: from mail-pj2-x03.google.com ([2607:f8b0:4864:39::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH37a-0000000G6dy-3C19
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 17:50:40 +0000
Received: by mail-pj2-x03.google.com with SMTP id 98e67ed59e1d1-3ac845e7231so152721a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 10:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792000232; x=1792605032; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nujP9rgCHe8pVwsy2vxm07nZV8x4bv342qsfibZkYP0=;
        b=mZE3uiDVN9zKumRg5qUMfhQDoASYOt6nbn5EZOrAqkRAb1xp88DEgPVpdo6/lK+nu8
         8SHT0FDwkKBIse3JbEu4Q++/nMAn6nQdvLpM2eJuOFAGrNVrOCZ2u6WOh6+yQT56yncQ
         ptRPsvzc4MmCXdELStZzt+J5iHWxmfXIkdjGCJYVkEBNAtg1qjpnKEw8RvWdujmlHd19
         qk3Kycj3Bpnn+OZ+QKXNafgRnRWUxem3cBs8qhbERv1EATe6cgTjaycUzASyF43ZDaEn
         7N+C1F019epaxJIyn0x8ITxIftmxWARTA6zQng4oG4EJUt1n2Z4FENiwgjQePN+Fr/tw
         jMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000232; x=1792605032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nujP9rgCHe8pVwsy2vxm07nZV8x4bv342qsfibZkYP0=;
        b=hxyUlPWlrLXoC3oKftePqo37sg0FdnExoJSsJ0ouzeFXlIijJYpUA5CZ6P+BPguDPQ
         iRGhiu5Oe/20CrVJDyZocuRFDsrM8NWkdpNqU4vwwfacvihx4qavTDjzi8TPPdmQcd0Y
         uUTBpsrzSMdde/WyHiKyiiW36ModK12PTqVA1fGHsL1bk9r+O7bwQgIhLWLLeVAiIkcO
         cyOmZX9MzYozrSFDlFJYfbVPJGLTFJKBCd6lNSi/W4MMlTiznE7EfV1ua6JVWkL/uO26
         pgn26xGb+B9RuXeugHroPCTKl5uRDIBau/evfZ+wQWI+UEOUyc+NXY2TCI4eIeCwwuRV
         K38A==
X-Forwarded-Encrypted: i=1; AKwUvBzUHBueCy+Tvq/JwQFyt3sRG9s/MJtllDrKSA0EBbp4aau6x6DbuqDP9iUoNW6ke9cHD9LKLGfAUrSWXofV59C7@lists.infradead.org
X-Gm-Message-State: AFq9FYKNGjbd8LpRwf+bVdsRYlvtT+F/+8z0fWYg63WgLnHOnWvUBzJc
	KjaYYDYOVRJvlr2X52fRlpH/dEbBNZS/c68KY/2XOT6UTt0zc49TEZEV
X-Gm-Gg: AYBFou3mtCv7VuisHwP5owdlX9YmBTJR/USHgBaU0Sav8w6U5Rr6Mrv1H+cmdBpZ49E
	Zclz4c5r79Bow5o7rkxHxcwAdY30mujWiO7GYk5Z+5bXJHnrNtY7MsWu8Tlzy9O+1kNlCym4LcK
	ojbm/aoBasqAAyF9Rn6ca74BZCSiEN1p6/adMxNLjT2zDEZDRQ+yID0mq650Y9saREwxjgbW+hH
	ZgLIkA9Se+U0wx3ls0bplrtWlsQCpZyUVMkd355ViDET2UXmv+Zz8z1gQnwxYjYV6SOoZjZBy3g
	LhDAVo7OVyydvMzP1chBKtPvyF5QRT/u5ppPKFMz8A5/diX7kXQp69qpo2QfRWyVEaz1w0UM/WZ
	ccD6269pbGj3Akd9Oq+jknFQtWLdOvojpk6Bus+DIohrnTfMD2y+2q0+je/HeHmDWdBUWFOB3jo
	R/kIC+IVmJpx6UjPdxFKRZ3BACVSdv5qmEVpmNlzbMQlmt3IW3R7ipeEUKKUqCYs14CqZ4xrh6G
	xiZd5K3nzePmCOzMtjY
X-Received: by 2002:a17:90b:1e41:b0:3ab:2737:3396 with SMTP id 98e67ed59e1d1-3ab3a9d3e2cmr14452410a91.65.1792000232105;
        Wed, 14 Oct 2026 10:50:32 -0700 (PDT)
Received: from AERO17.taila7786d.ts.net ([156.231.115.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9449ae48sm403009a91.13.2026.10.14.10.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:50:28 -0700 (PDT)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: andrew@lunn.ch,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] arm64: zynqmp: Add support for ALINX EdgeBoard FZ3A
Date: Thu, 15 Oct 2026 01:50:17 +0800
Message-ID: <20261014175020.62907-1-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_105034_829038_AEB9CC27 
X-CRM114-Status: GOOD (  16.68  )
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

The ALINX EdgeBoard FZ3A is an embedded computing board from ALINX based on
the Xilinx Zynq UltraScale+ XCZU3EG SoC. The hardware was designed and
manufactured by ALINX for Baidu's AI EdgeBoard program.

This series adds the ALINX vendor prefix, documents the board compatible,
and adds a device tree for the board's PS peripherals:
  - UART1 debug console
  - eMMC (HS200) and microSD card
  - GEM3 Ethernet with Micrel KSZ9031 PHY on the MDIO bus
  - I2C0 and I2C1
  - QSPI NOR flash
  - PCIe
  - USB 3.0 host
  - DisplayPort output

Public board documentation and product links:
  - https://ai.baidu.com/tech/hardware/deepkit
  - https://ai.baidu.com/ai-doc/HWCE/8kq9b2121
  - https://www.alinx.com/
  - https://vd100-20232-v101.readthedocs.io/zh-cn/en/VD100_S1_RSTdocument_EN/00_aboutALINX_EN.html

Tested on ALINX EdgeBoard FZ3A hardware with Linux 7.3.0-rc5: the board boots
from SD card into userspace over the serial console, gem3 negotiates
1000Mbps/Full duplex with phy-mode = "rgmii-id", and the eMMC runs in
HS200 mode.

The base DTB passes CHECK_DTBS=y without warnings, the bindings pass
dt_binding_check, and the DTS passes dt-check-style.

Apologies for the threading issues in v2 caused by an SMTP relay breakdown;
v3 is sent as a clean, unified thread and addresses all reviewer comments.

Changes in v3:
  - Update author and submission email to cyan2254650260@gmail.com
  - Patch 1:
    - Fix legal transliteration to "Xinyi Electronic Technology (Shanghai)
      Co., Ltd. (ALINX)" (Conor Dooley)
    - Add website link in commit message (Conor Dooley)
    - Collect Conor's Acked-by
  - Patch 2:
    - Collect Conor's Acked-by
  - Patch 3:
    - Add public board documentation and product links in commit message
      and DTS header comment (Michal Simek)
    - Conform to DTS coding style:
      - Sort compatible before model in root node
      - Sort children in natural-sort order
      - Reorder properties in canonical order (phys before phy-names, etc.)
      - Add required blank lines before status properties
      - Alphabetize pinctrl children and pin configurations

Changes in v2:
  - Use the correct vendor prefix 'alinx' instead of 'ebdee', and rename
    the board and DTS file accordingly (Krzysztof Kozlowski)
  - Describe the board as a single board computer with the SoC, DDR4 and
    eMMC on one PCB (Andrew Lunn)
  - Add the MDIO bus and describe the KSZ9031 PHY with phy-handle (Andrew Lunn)
  - Enable eMMC HS200 on sdhci0: drop no-1-8-v, add pinctrl and mmc-hs200-1_8v
  - Drop power-source and bias-high-impedance from pinctrl_gem3_default,
    which only produce spurious warnings on pre-2023.1 PM firmware


Pufan Jin (3):
  dt-bindings: vendor-prefixes: Add ALINX vendor prefix
  dt-bindings: soc: xilinx: Add ALINX EdgeBoard FZ3A
  arm64: zynqmp: Add ALINX EdgeBoard FZ3A

 .../bindings/soc/xilinx/xilinx.yaml           |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/xilinx/Makefile           |   1 +
 .../xilinx/zynqmp-alinx-edgeboard-fz3a.dts    | 360 ++++++++++++++++++
 4 files changed, 364 insertions(+)
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts

Range-diff against v2:
1:  c33ea63b7 ! 1:  ceeae5872 dt-bindings: vendor-prefixes: Add ALINX vendor prefix
    @@
      ## Metadata ##
    -Author: Pufan Jin <2254650260@qq.com>
    +Author: Pufan Jin <cyan2254650260@gmail.com>
     
      ## Commit message ##
         dt-bindings: vendor-prefixes: Add ALINX vendor prefix
     
    -    Add vendor prefix for ALINX (Shanghai Xin'yi Electronics Technology
    +    Add vendor prefix for ALINX (Xinyi Electronic Technology (Shanghai)
         Co., Ltd.).
     
    -    Signed-off-by: Pufan Jin <2254650260@qq.com>
    +    Link: https://www.alinx.com/
    +    Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
    +    Acked-by: Conor Dooley <conor.dooley@microchip.com>
     
      ## Documentation/devicetree/bindings/vendor-prefixes.yaml ##
     @@ Documentation/devicetree/bindings/vendor-prefixes.yaml: patternProperties:
    @@ Documentation/devicetree/bindings/vendor-prefixes.yaml: patternProperties:
        "^alientek,.*":
          description: Guangzhou Xingyi Intelligent Technology Co., Ltd.
     +  "^alinx,.*":
    -+    description: Shanghai Xin'yi Electronics Technology Co., Ltd. (ALINX)
    ++    description: Xinyi Electronic Technology (Shanghai) Co., Ltd. (ALINX)
        "^allegro,.*":
          description: Allegro DVT
        "^allegromicro,.*":
2:  888548b4e ! 2:  da2a7b3e7 dt-bindings: soc: xilinx: Add ALINX EdgeBoard FZ3A
    @@
      ## Metadata ##
    -Author: Pufan Jin <2254650260@qq.com>
    +Author: Pufan Jin <cyan2254650260@gmail.com>
     
      ## Commit message ##
         dt-bindings: soc: xilinx: Add ALINX EdgeBoard FZ3A
     
         Document the ALINX EdgeBoard FZ3A compatible.
     
    -    Signed-off-by: Pufan Jin <2254650260@qq.com>
    +    Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
    +    Acked-by: Conor Dooley <conor.dooley@microchip.com>
     
      ## Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml ##
     @@ Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml: properties:
3:  cd96303fb ! 3:  273fcd977 arm64: zynqmp: Add ALINX EdgeBoard FZ3A
    @@
      ## Metadata ##
    -Author: Pufan Jin <2254650260@qq.com>
    +Author: Pufan Jin <cyan2254650260@gmail.com>
     
      ## Commit message ##
         arm64: zynqmp: Add ALINX EdgeBoard FZ3A
    @@ Commit message
         The base DTB passes CHECK_DTBS=y, and the Xilinx SoC binding passes
         dt_binding_check.
     
    -    Signed-off-by: Pufan Jin <2254650260@qq.com>
    +    Link: https://ai.baidu.com/tech/hardware/deepkit
    +    Link: https://ai.baidu.com/ai-doc/HWCE/8kq9b2121
    +    Link: https://www.alinx.com/
    +    Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
     
      ## arch/arm64/boot/dts/xilinx/Makefile ##
     @@
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     + * Device tree for the ALINX EdgeBoard FZ3A
     + * based on the Xilinx Zynq UltraScale+ XCZU3EG
     + *
    ++ * Product info: https://ai.baidu.com/tech/hardware/deepkit
    ++ * Documentation: https://ai.baidu.com/ai-doc/HWCE/8kq9b2121
    ++ *
     + * Copyright (c) 2026 Pufan Jin
     + */
     +
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     +#include "zynqmp-clk-ccf.dtsi"
     +
     +/ {
    -+	model = "ALINX EdgeBoard FZ3A";
     +	compatible = "alinx,edgeboard-fz3a", "xlnx,zynqmp";
    ++	model = "ALINX EdgeBoard FZ3A";
     +
     +	aliases {
     +		ethernet0 = &gem3;
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     +		stdout-path = "serial0:115200n8";
     +	};
     +
    -+	dpcon: connector {
    -+		compatible = "dp-connector";
    -+		label = "mini-DP";
    -+		type = "mini";
    -+
    -+		port {
    -+			dpcon_in: endpoint {
    -+				remote-endpoint = <&dpsub_dp_out>;
    -+			};
    -+		};
    -+	};
    -+
     +	dp_aclk: clock-dp-aclk {
     +		compatible = "fixed-clock";
     +		#clock-cells = <0>;
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     +		clock-frequency = <100000000>;
     +	};
     +
    -+	memory@0 {
    -+		device_type = "memory";
    -+		reg = <0x0 0x0 0x0 0x7ff00000>;
    ++	dpcon: connector {
    ++		compatible = "dp-connector";
    ++		label = "mini-DP";
    ++		type = "mini";
    ++
    ++		port {
    ++			dpcon_in: endpoint {
    ++				remote-endpoint = <&dpsub_dp_out>;
    ++			};
    ++		};
     +	};
     +
     +	vcc_3v3_pcie: regulator-pcie {
     +		compatible = "regulator-fixed";
    -+		regulator-name = "pcie-reset";
    -+		regulator-min-microvolt = <3300000>;
    -+		regulator-max-microvolt = <3300000>;
    -+		gpios = <&gpio 37 GPIO_ACTIVE_HIGH>;
     +		enable-active-high;
    ++		gpios = <&gpio 37 GPIO_ACTIVE_HIGH>;
     +		regulator-always-on;
     +		regulator-boot-on;
    ++		regulator-max-microvolt = <3300000>;
    ++		regulator-min-microvolt = <3300000>;
    ++		regulator-name = "pcie-reset";
     +	};
     +
     +	reserved_memory: reserved-memory {
    ++		ranges;
     +		#address-cells = <2>;
     +		#size-cells = <2>;
    -+		ranges;
     +
     +		linux_cma: cma {
     +			compatible = "shared-dma-pool";
    ++			alloc-ranges = <0x0 0x0 0x0 0x7ff00000>;
     +			reusable;
    -+			alloc-ranges = <0x0 0x0 0x0 0x80000000>;
    -+			size = <0x0 0x20000000>;	/* 512MB */
    -+			linux,cma-default;
    ++			size = <0x0 0x20000000>;
     +		};
     +	};
    ++
    ++	memory@0 {
    ++		device_type = "memory";
    ++		reg = <0x0 0x0 0x0 0x7ff00000>;
    ++	};
     +};
     +
     +&ams_pl {
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     +	snps,dis_u2_susphy_quirk;
     +	snps,hsphy_interface = "ulpi";
     +	snps,usb3_lpm_capable;
    ++
     +	status = "okay";
     +};
     +
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     +	clocks = <&lpd_lsbus>, <&zynqmp_clk GEM3_REF>,
     +		 <&zynqmp_clk GEM3_TX>, <&zynqmp_clk GEM3_RX>,
     +		 <&zynqmp_clk GEM_TSU>;
    -+	pinctrl-names = "default";
    -+	pinctrl-0 = <&pinctrl_gem3_default>;
    -+	phy-mode = "rgmii-id";
     +	phy-handle = <&phy0>;
    ++	phy-mode = "rgmii-id";
    ++	pinctrl-0 = <&pinctrl_gem3_default>;
    ++	pinctrl-names = "default";
    ++
     +	status = "okay";
     +
     +	mdio {
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     +		#size-cells = <0>;
     +
     +		phy0: ethernet-phy@1 {
    -+			reg = <1>;
     +			compatible = "ethernet-phy-id0022.1620";
    ++			reg = <1>;
     +		};
     +	};
     +};
     +
     +&gpio {
     +	clocks = <&lpd_lsbus>;
    ++
     +	status = "okay";
     +};
     +
     +&i2c0 {
     +	clock-frequency = <400000>;
    -+	pinctrl-names = "default";
     +	pinctrl-0 = <&pinctrl_i2c0_default>;
    ++	pinctrl-names = "default";
    ++
     +	status = "okay";
     +};
     +
     +&i2c1 {
     +	clock-frequency = <400000>;
    -+	pinctrl-names = "default";
     +	pinctrl-0 = <&pinctrl_i2c1_default>;
    ++	pinctrl-names = "default";
    ++
     +	status = "okay";
     +};
     +
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     +
     +&pcie {
     +	phys = <&psgtr 0 PHY_TYPE_PCIE 0 0>;
    ++
     +	status = "okay";
     +};
     +
     +&pinctrl0 {
     +	status = "okay";
     +
    ++	pinctrl_gem3_default: gem3-default {
    ++		conf {
    ++			groups = "ethernet3_0_grp";
    ++			slew-rate = <SLEW_RATE_SLOW>;
    ++		};
    ++
    ++		conf-mdio {
    ++			bias-disable;
    ++			groups = "mdio3_0_grp";
    ++			slew-rate = <SLEW_RATE_SLOW>;
    ++		};
    ++
    ++		conf-rx {
    ++			low-power-disable;
    ++			pins = "MIO70", "MIO71", "MIO72", "MIO73", "MIO74",
    ++			       "MIO75";
    ++		};
    ++
    ++		conf-tx {
    ++			bias-disable;
    ++			low-power-enable;
    ++			pins = "MIO64", "MIO65", "MIO66", "MIO67", "MIO68",
    ++			       "MIO69";
    ++		};
    ++
    ++		mux {
    ++			function = "ethernet3";
    ++			groups = "ethernet3_0_grp";
    ++		};
    ++
    ++		mux-mdio {
    ++			function = "mdio3";
    ++			groups = "mdio3_0_grp";
    ++		};
    ++	};
    ++
     +	pinctrl_i2c0_default: i2c0-default {
     +		conf {
     +			bias-pull-up;
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     +		};
     +	};
     +
    -+	pinctrl_usb0_default: usb0-default {
    -+		mux {
    -+			function = "usb0";
    -+			groups = "usb0_0_grp";
    -+		};
    -+	};
    -+
     +	pinctrl_sdhci0_default: sdhci0-default {
    -+		mux {
    -+			groups = "sdio0_0_grp";
    -+			function = "sdio0";
    -+		};
    -+
     +		conf {
    ++			bias-disable;
     +			groups = "sdio0_0_grp";
     +			slew-rate = <SLEW_RATE_SLOW>;
    -+			bias-disable;
     +		};
    -+	};
     +
    -+	/*
    -+	 * Omit 'power-source' and 'bias-high-impedance' to avoid spurious
    -+	 * warnings on the board's pre-2023.1 PM firmware. Bank voltage
    -+	 * and pin directions are already configured by hardware.
    -+	 */
    -+	pinctrl_gem3_default: gem3-default {
     +		mux {
    -+			function = "ethernet3";
    -+			groups = "ethernet3_0_grp";
    -+		};
    -+
    -+		conf {
    -+			groups = "ethernet3_0_grp";
    -+			slew-rate = <SLEW_RATE_SLOW>;
    -+		};
    -+
    -+		conf-rx {
    -+			pins = "MIO70", "MIO71", "MIO72", "MIO73", "MIO74",
    -+			       "MIO75";
    -+			low-power-disable;
    -+		};
    -+
    -+		conf-tx {
    -+			pins = "MIO64", "MIO65", "MIO66", "MIO67", "MIO68",
    -+			       "MIO69";
    -+			bias-disable;
    -+			low-power-enable;
    -+		};
    -+
    -+		mux-mdio {
    -+			function = "mdio3";
    -+			groups = "mdio3_0_grp";
    ++			function = "sdio0";
    ++			groups = "sdio0_0_grp";
     +		};
    ++	};
     +
    -+		conf-mdio {
    -+			groups = "mdio3_0_grp";
    -+			slew-rate = <SLEW_RATE_SLOW>;
    -+			bias-disable;
    ++	pinctrl_usb0_default: usb0-default {
    ++		mux {
    ++			function = "usb0";
    ++			groups = "usb0_0_grp";
     +		};
     +	};
     +};
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     +&psgtr {
     +	clocks = <&gtr_refclk0>, <&gtr_refclk1>, <&gtr_refclk2>;
     +	clock-names = "ref0", "ref1", "ref2";
    ++
     +	status = "okay";
     +};
     +
     +&qspi {
     +	clocks = <&zynqmp_clk QSPI_REF>, <&lpd_lsbus>;
     +	num-cs = <1>;
    ++
     +	status = "okay";
     +
     +	flash: flash@0 {
    -+		#address-cells = <1>;
    -+		#size-cells = <1>;
     +		compatible = "jedec,spi-nor";
     +		reg = <0x0>;
    ++		#address-cells = <1>;
    ++		#size-cells = <1>;
     +		spi-max-frequency = <50000000>;
     +		spi-rx-bus-width = <4>;
     +		spi-tx-bus-width = <1>;
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     +};
     +
     +&sdhci0 {
    ++	assigned-clock-rates = <187498125>;
    ++	bus-width = <8>;
    ++	cap-mmc-hw-reset;
     +	clocks = <&zynqmp_clk SDIO0_REF>, <&lpd_lsbus>;
    -+	pinctrl-names = "default";
    -+	pinctrl-0 = <&pinctrl_sdhci0_default>;
    -+	non-removable;
     +	disable-wp;
    ++	mmc-hs200-1_8v;
     +	no-sd;
     +	no-sdio;
    -+	mmc-hs200-1_8v;
    -+	cap-mmc-hw-reset;
    -+	bus-width = <8>;
    ++	non-removable;
    ++	pinctrl-0 = <&pinctrl_sdhci0_default>;
    ++	pinctrl-names = "default";
     +	xlnx,mio-bank = <0>;
    -+	assigned-clock-rates = <187498125>;
    ++
     +	status = "okay";
     +};
     +
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     +	clocks = <&zynqmp_clk SDIO1_REF>, <&lpd_lsbus>;
     +	disable-wp;
     +	no-1-8-v;
    ++
     +	status = "okay";
     +};
     +
     +&uart0 {
     +	clocks = <&zynqmp_clk UART0_REF>, <&lpd_lsbus>;
    ++
     +	status = "okay";
     +};
     +
     +&uart1 {
     +	clocks = <&zynqmp_clk UART1_REF>, <&lpd_lsbus>;
    ++
     +	status = "okay";
     +};
     +
     +&usb0 {
    -+	phy-names = "usb3-phy";
     +	phys = <&psgtr 1 PHY_TYPE_USB3 0 1>;
    -+	pinctrl-names = "default";
    ++	phy-names = "usb3-phy";
     +	pinctrl-0 = <&pinctrl_usb0_default>;
    ++	pinctrl-names = "default";
     +	reset-gpios = <&gpio 44 GPIO_ACTIVE_LOW>;
     +
     +	status = "okay";
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     +		 <&zynqmp_clk DP_AUDIO_REF>,
     +		 <&zynqmp_clk DP_VIDEO_REF>;
     +	clock-names = "dp_apb_clk", "dp_aud_clk", "dp_vtc_pixel_clk_in";
    -+	phy-names = "dp-phy0", "dp-phy1";
     +	phys = <&psgtr 3 PHY_TYPE_DP 0 2>,
     +	       <&psgtr 2 PHY_TYPE_DP 1 2>;
    ++	phy-names = "dp-phy0", "dp-phy1";
    ++
     +	status = "okay";
     +};
-- 
2.56.0


