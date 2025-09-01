Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB38CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 05:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=+P63S1WeyzaOHIy21vCppZGqsfWHA7uyC6Z3WF1kh1s=; b=llGfBcu2Rw98uO
	upj6jH9rLVPuACGL2qzqEMftcsFz7W6ggWzBxCvsaCIhAYGuCpEIEZdTtxuN6yNhJ0SM9wgtBloCF
	69rY3WoZ36KXnNrko4vSbJE/LVITtmP9XQ1MlUPtWmp38Du8xzce22YjfWNM7QLd0PvR0YQ1kMcC8
	sqX2HDM7K0y79Ru3WtlOgYPe00zc5+dZ1bs52+26k6kqUa8gai6FuxQNVrZ2Ky7cTyNcXcB0rZbcC
	CzNNdp5PYjkBYQTYn3zwbzFyV9Rg4NFrpkK0HKix/hhzYVce3KjINK4eDnd9TigZovGjU2ndzthne
	MSFzIRMLEBfGUI6N7FpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usxM9-0000000BEq6-1PY4;
	Mon, 01 Sep 2025 05:45:29 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usxJU-0000000BEVm-01XV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 05:42:46 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250901054237epoutp0331209d58e2f92350ad12e6b20effe9c5~hEjceVEKB1982119821epoutp03I
	for <linux-arm-kernel@lists.infradead.org>; Mon,  1 Sep 2025 05:42:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250901054237epoutp0331209d58e2f92350ad12e6b20effe9c5~hEjceVEKB1982119821epoutp03I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756705357;
	bh=+P63S1WeyzaOHIy21vCppZGqsfWHA7uyC6Z3WF1kh1s=;
	h=From:To:Cc:Subject:Date:References:From;
	b=We6TqxO97PsiufhF72wqFSGxGt/wZ+b6bk3keOUHxkp8HXt4dfQ5CBm2u41jRwkKp
	 L9MIBNbg9wgCRSzcOx4YBhNlVkZcOourMkLd8F9a8IooAfbk4kamQG2lM5xeSqmM9m
	 63XAg/wnW+2T/7ZGlnJG4Ei+ABe0CYu1Ue8vWYq4=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250901054236epcas5p45331ab81524c2009c67f02d40432a1b2~hEjbuSPLP1914519145epcas5p4m;
	Mon,  1 Sep 2025 05:42:36 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.94]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cFd7H4ydNz6B9mN; Mon,  1 Sep
	2025 05:42:35 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250901054234epcas5p1e4b34b6ccb304b0306b1fe616edda9e2~hEjZ-_lri2209922099epcas5p1I;
	Mon,  1 Sep 2025 05:42:34 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250901054230epsmtip286b8464cf38115139e540265f925392d~hEjVrMBJL0761807618epsmtip2H;
	Mon,  1 Sep 2025 05:42:30 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com,
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, shradha.t@samsung.com, ravi.patel@samsung.com,
	inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com,
	dj76.yang@samsung.com, hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v4 0/6] Add support for the Axis ARTPEC-8 SoC
Date: Mon,  1 Sep 2025 10:49:20 +0530
Message-Id: <20250901051926.59970-1-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
X-CMS-MailID: 20250901054234epcas5p1e4b34b6ccb304b0306b1fe616edda9e2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250901054234epcas5p1e4b34b6ccb304b0306b1fe616edda9e2
References: <CGME20250901054234epcas5p1e4b34b6ccb304b0306b1fe616edda9e2@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_224244_685619_6C5F93ED 
X-CRM114-Status: GOOD (  21.08  )
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
Changes in v4:
- Drop the applied v3 patches (Patch #01, #02, #03, #06)
- Update the pinctrl header license in dtsi patch (Patch #08 of v3 series)

Link to v3: https://lore.kernel.org/linux-samsung-soc/20250825114436.46882-1-ravi.patel@samsung.com/

---
Changes in v3:
- Rebased patchset on linux-samsung-soc "for-next" branch which includes round_rate() drop
- Add CPU mask in dtsi patch #8

Link to v2: https://lore.kernel.org/all/20250821123310.94089-1-ravi.patel@samsung.com/

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

SeonGu Kang (3):
  dt-bindings: pinctrl: samsung: Add compatible for ARTPEC-8 SoC
  pinctrl: samsung: Add ARTPEC-8 SoC specific configuration
  arm64: dts: axis: Add ARTPEC-8 Grizzly dts support

SungMin Park (3):
  dt-bindings: arm: axis: Add ARTPEC-8 grizzly board
  arm64: dts: exynos: axis: Add initial ARTPEC-8 SoC support
  arm64: defconfig: Enable Axis ARTPEC SoC

 .../devicetree/bindings/arm/axis.yaml         |   7 +
 .../bindings/pinctrl/samsung,pinctrl.yaml     |   1 +
 MAINTAINERS                                   |  12 +
 arch/arm64/Kconfig.platforms                  |   7 +
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 arch/arm64/boot/dts/exynos/axis/Makefile      |   4 +
 .../boot/dts/exynos/axis/artpec-pinctrl.h     |  36 +++
 .../boot/dts/exynos/axis/artpec8-grizzly.dts  |  35 +++
 .../boot/dts/exynos/axis/artpec8-pinctrl.dtsi | 120 +++++++++
 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi  | 244 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    |  50 ++++
 drivers/pinctrl/samsung/pinctrl-exynos.h      |  10 +
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 15 files changed, 531 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/axis/Makefile
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec8-grizzly.dts
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi

--
2.49.0


