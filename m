Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EFBCA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 16:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjvs5YIYigeX5S8OtQBGKC14I/wskjTtDwVHz/NFJLk=; b=Ht5a1KwmE+KPIN+/7XV1dB5sZI
	AASYee6DFWQcNJt5+0Ly45isgrIc6Leyo1Hf/lCGT5RsrO7RkqMBl6qv75yEZxCnv4+8cC1ohL7JC
	9d4/HhstfQ1a2Npxf8c5sQCNdjsMsOQQQE+Cz+kCk8xHqY4QTfTqFTP5qGc5IYBNZqU0bdkwFJaYf
	c+Tp2mkQlmrENKefli1OW8NYFtiNgTnsowBqTh0zG3T+pjR+UfZadkt7me6GSx+zcUFA2Hs0Ph+qE
	KKYZ0SBczL0FJFm9ovVDNuu5nM/i4gjwb1YHufXDqYWf3ChSyNE6Y1IZddN9QfNSw454KMmafMUzP
	98s9B5xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up82R-0000000HWzd-0zdP;
	Thu, 21 Aug 2025 16:21:20 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4ae-0000000GvXd-0wDh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 12:40:26 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250821124017epoutp02d7410255ff4b5d08f8296bfcf5d3868c~dyJ_rYulA0273302733epoutp02k
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 12:40:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250821124017epoutp02d7410255ff4b5d08f8296bfcf5d3868c~dyJ_rYulA0273302733epoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755780017;
	bh=rjvs5YIYigeX5S8OtQBGKC14I/wskjTtDwVHz/NFJLk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a3KCQnSxdRLGwIqtF64kFn9hVo9I+a/JNFyuc1rixVGBUjhYhxNCeYZ9CZ3RHWOkA
	 dpojnUBbhdtFYhT9EQMMykrksUMailRz4vlQknWEqnGzjtqB0o/pPZzekBVVyogr50
	 fJJsxP35vsP8V7te4MAgs/tOhswRER8oTWRBZd2E=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250821124016epcas5p1dbce6fcdb5debccef4b219cc53e1cb71~dyJ9kbk0i0508905089epcas5p1e;
	Thu, 21 Aug 2025 12:40:16 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c72wH4xvgz6B9m6; Thu, 21 Aug
	2025 12:40:15 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250821124014epcas5p12bacab10aac378f8d011fe7d2e04c8fa~dyJ7RtKgX2595625956epcas5p1E;
	Thu, 21 Aug 2025 12:40:14 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250821124009epsmtip274fefd0605f3013be9921b57f147c42f~dyJ2gSu4O2624826248epsmtip2I;
	Thu, 21 Aug 2025 12:40:08 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com,
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com, inbaraj.e@samsung.com, swathi.ks@samsung.com,
	hrishikesh.d@samsung.com, dj76.yang@samsung.com, hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, soc@lists.linux.dev
Subject: [PATCH v2 00/10] Add support for the Axis ARTPEC-8 SoC
Date: Thu, 21 Aug 2025 18:02:44 +0530
Message-ID: <20250821123310.94089-1-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710002047.1573841-1-ksk4725@coasia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250821124014epcas5p12bacab10aac378f8d011fe7d2e04c8fa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250821124014epcas5p12bacab10aac378f8d011fe7d2e04c8fa
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	<CGME20250821124014epcas5p12bacab10aac378f8d011fe7d2e04c8fa@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_054024_899124_8EA980F1 
X-CRM114-Status: GOOD (  21.82  )
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

Add basic support for the Axis ARTPEC-8 SoC which contains
quad-core Cortex-A53 CPU and other several IPs. This SoC is an
Axis-designed chipset used in surveillance camera products such as
the AXIS Q1656-LE and AXIS Q3538-LVE.

This ARTPEC-8 SoC has a variety of Samsung-specific IP blocks and
Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.

List of Samsung-provided IPs:
- UART
- Ethernet (Vendor: Synopsys)
- SDIO
- SPI
- HSI2C
- I2S
- CMU (Clock Management Unit)
- Pinctrl (GPIO)
- PCIe (Vendor: Synopsys)
- USB (Vendor: Synopsys)

List of Axis-provided IPs:
- VIP (Image Sensor Processing IP)
- VPP (Video Post Processing)
- GPU
- CDC (Video Encoder)

This patch series includes below changes:
- CMU (Clock Management Unit) driver and its bindings
- GPIO pinctrl configuration and its bindings
- Basic Device Tree for ARTPEC-8 SoC and boards

The patch series has been tested on the ARTPEC-8 EVB with
Linux v6.15-rc5 and intended to be merged via the `arm-soc` tree.

---
Changes in v2:
- Update SoB sections in all patches
- Update the copyright year to 2025
- Add CMU abbreviation description
- Merge dt-bindings patch 01 and 02 into single patch
- Modify yaml file to fit coding style in CMU
- Modify clock-names
- Reorder config macros to fit coding style
- Remove the unused macro in clock driver code
- Squash all clock driver patches (4 to 10) into single patch
- Split yaml conversion patch translation and add ARTPEC-8 SoC
- Remove "clock-frequency" property from cpu node in dtsi
- Remove the "status" property in dts and dtsi
- Reorder the DTS and pin nodes to follow the alphabetical and DTS coding style
- Change items property in axis.yaml
- Move dts files to exynos folder
- Removed ARCH_ARTPEC8 from platform Kconfig
- Add pattern in MAINTAINER file
- Merge dtsi and pinctrl dtsi file
- Split board dts file

Link to v1: https://lore.kernel.org/all/20250710002047.1573841-1-ksk4725@coasia.com/
NOTE: The first version has been sent by Coasia.
      After that, it has been agreed between Coasia and Samsung that Samsung will take
      ownership of upstreaming ARTPEC-8 and ARTPEC-9 platforms.
---

Hakyeong Kim (3):
  dt-bindings: clock: Add ARTPEC-8 clock controller
  clk: samsung: Add clock PLL support for ARTPEC-8 SoC
  clk: samsung: artpec-8: Add initial clock support for ARTPEC-8 SoC

Ravi Patel (1):
  dt-bindings: arm: Convert Axis board/soc bindings to json-schema

SeonGu Kang (3):
  dt-bindings: pinctrl: samsung: Add compatible for ARTPEC-8 SoC
  pinctrl: samsung: Add ARTPEC-8 SoC specific configuration
  arm64: dts: axis: Add ARTPEC-8 Grizzly dts support

SungMin Park (3):
  dt-bindings: arm: axis: Add ARTPEC-8 grizzly board
  arm64: dts: exynos: axis: Add initial ARTPEC-8 SoC support
  arm64: defconfig: Enable Axis ARTPEC SoC

 .../devicetree/bindings/arm/axis.txt          |   13 -
 .../devicetree/bindings/arm/axis.yaml         |   36 +
 .../bindings/clock/axis,artpec8-clock.yaml    |  213 ++++
 .../bindings/pinctrl/samsung,pinctrl.yaml     |    1 +
 MAINTAINERS                                   |   12 +
 arch/arm64/Kconfig.platforms                  |    7 +
 arch/arm64/boot/dts/exynos/Makefile           |    1 +
 arch/arm64/boot/dts/exynos/axis/Makefile      |    4 +
 .../boot/dts/exynos/axis/artpec-pinctrl.h     |   36 +
 .../boot/dts/exynos/axis/artpec8-grizzly.dts  |   35 +
 .../boot/dts/exynos/axis/artpec8-pinctrl.dtsi |  120 ++
 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi  |  244 ++++
 arch/arm64/configs/defconfig                  |    1 +
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-artpec8.c             | 1044 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |  128 +-
 drivers/clk/samsung/clk-pll.h                 |    2 +
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    |   50 +
 drivers/pinctrl/samsung/pinctrl-exynos.h      |   10 +
 drivers/pinctrl/samsung/pinctrl-samsung.c     |    2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |    1 +
 include/dt-bindings/clock/axis,artpec8-clk.h  |  169 +++
 22 files changed, 2116 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/axis.txt
 create mode 100644 Documentation/devicetree/bindings/arm/axis.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/axis,artpec8-clock.yaml
 create mode 100644 arch/arm64/boot/dts/exynos/axis/Makefile
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec8-grizzly.dts
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi
 create mode 100644 drivers/clk/samsung/clk-artpec8.c
 create mode 100644 include/dt-bindings/clock/axis,artpec8-clk.h

--
2.49.0


