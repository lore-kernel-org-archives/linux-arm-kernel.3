Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AD9C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 00:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G/IU33Kowi7mjRmGu2P0udQ+3YgI2w9sJSwVIE2F+7Y=; b=ePssvKIc25m/AL/XH8AAYwMOx0
	rHxuYD7eIU+xNm07V+UG5OoxACbV7hcr4MopE93kppH5FTKiUCV0KD1GiI1jJG7wzePXiNA9mg5ZZ
	3zRQ5UJHWL5wzpmvQY+Ry41A0wCyfXZsYn45tyHUKCy3+oKUbhN3cqI/TAlYN0+Uywk5IdteEDC+l
	WH1LjeY86kCfxtYUIURrCE8QyEhXlCOkDhvmY6QotkDC8k6/GXLUaPH+sYIRpU2qmAYN7AMsZEM3R
	EaroHWNmxGHMWtFoLd8eZ7OA+M+CIoLblEdxO0Gq3UhJ0hKFlACMlIJlfB13wXStlTZo9lbvvoH+c
	PQ8tXo5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZf6s-0000000AKFc-3cAE;
	Thu, 10 Jul 2025 00:25:58 +0000
Received: from mail2.coasia.com ([112.168.119.159] helo=spam.coasia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZf20-0000000AJKZ-06lh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 00:20:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1752106849; bh=5TCqIKAAZraTPISadWHH3ICmjB1H6s6kj8mUhsQHdN4=;
	l=3410; h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=DYjoVkqBmuQGkRBwZTGZHDjx9QRAz3kCc8AHXdSyuNrIOWvSGso8apc/shFMjuHNy
	 bU/6WB8K81rKKfOSU75Nkhf2KTDLsNzIpDQt+qxAzR6MbAmAld0dOq5hC+K8uZwb2h
	 k0mQfmGBOdlVRPFlYyNTt41E8XRcG9TS2KhAON78=
Received: from unknown (HELO kangseongu..) (ksk4725@coasia.com@115.23.218.194)
	by 192.168.10.159 with ESMTP; 10 Jul 2025 09:20:49 +0900
X-Original-SENDERIP: 115.23.218.194
X-Original-SENDERCOUNTRY: KR, South Korea 
X-Original-MAILFROM: ksk4725@coasia.com
X-Original-RCPTTO: jesper.nilsson@axis.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	linus.walleij@linaro.org,
	tomasz.figa@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	kenkim@coasia.com,
	pjsin865@coasia.com,
	gwk1013@coasia.com,
	ksk4725@coasia.com,
	hgkim05@coasia.com,
	mingyoungbo@coasia.com,
	smn1196@coasia.com,
	pankaj.dubey@samsung.com,
	shradha.t@samsung.com,
	ravi.patel@samsung.com,
	inbaraj.e@samsung.com,
	swathi.ks@samsung.com,
	hrishikesh.d@samsung.com,
	dj76.yang@samsung.com,
	hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev
From: ksk4725@coasia.com
To: Jesper Nilsson <jesper.nilsson@axis.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: kenkim <kenkim@coasia.com>,
	Jongshin Park <pjsin865@coasia.com>,
	GunWoo Kim <gwk1013@coasia.com>,
	SeonGu Kang <ksk4725@coasia.com>,
	HaGyeong Kim <hgkim05@coasia.com>,
	GyoungBo Min <mingyoungbo@coasia.com>,
	SungMin Park <smn1196@coasia.com>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Shradha Todi <shradha.t@samsung.com>,
	Ravi Patel <ravi.patel@samsung.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Hrishikesh <hrishikesh.d@samsung.com>,
	Dongjin Yang <dj76.yang@samsung.com>,
	Sang Min Kim <hypmean.kim@samsung.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev
Subject: [PATCH 00/16] Add support for the Axis ARTPEC-8 SoC
Date: Thu, 10 Jul 2025 09:20:30 +0900
Message-Id: <20250710002047.1573841-1-ksk4725@coasia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_172056_480666_B2AB3F22 
X-CRM114-Status: GOOD (  11.62  )
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

From: SeonGu Kang <ksk4725@coasia.com>

Add basic support for the Axis ARTPEC-8 SoC.
This SoC contains four Cortex-A53 CPUs and other several IPs.

Patches 1 to 10 provide the support for the clock controller,
which is similar to other Samsung SoCs.

The remaining patches provide pinctrl support and
initial device tree support.

Hakyeong Kim (9):
  dt-bindings: clock: Add ARTPEC-8 CMU bindings
  clk: samsung: Add clock PLL support for ARTPEC-8 SoC
  clk: samsung: artpec-8: Add initial clock support
  clk: samsung: artpec-8: Add clock support for CMU_CMU block
  clk: samsung: artpec-8: Add clock support for CMU_BUS block
  clk: samsung: artpec-8: Add clock support for CMU_CORE block
  clk: samsung: artpec-8: Add clock support for CMU_CPUCL block
  clk: samsung: artpec-8: Add clock support for CMU_FSYS block
  clk: samsung: artpec-8: Add clock support for CMU_PERI block

Ravi Patel (2):
  dt-bindings: clock: Add CMU bindings definitions for ARTPEC-8 platform
  dt-bindings: arm: Add Axis ARTPEC SoC platform

SeonGu Kang (3):
  dt-bindings: pinctrl: samsung: Add compatible for ARTPEC-8 SoC
  pinctrl: samsung: Add ARTPEC-8 SoC specific configuration
  arm64: dts: axis: Add initial pinctrl support

sungminpark (2):
  arm64: dts: axis: Add initial device tree support
  arm64: defconfig: Enable Axis ARTPEC SoC

 .../devicetree/bindings/arm/axis.txt          |  13 -
 .../devicetree/bindings/arm/axis.yaml         |  35 +
 .../bindings/clock/axis,artpec8-clock.yaml    | 224 +++++
 .../bindings/pinctrl/samsung,pinctrl.yaml     |   1 +
 MAINTAINERS                                   |  14 +
 arch/arm64/Kconfig.platforms                  |  13 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/axis/Makefile             |   4 +
 arch/arm64/boot/dts/axis/artpec-pinctrl.h     |  36 +
 arch/arm64/boot/dts/axis/artpec8-grizzly.dts  |  68 ++
 arch/arm64/boot/dts/axis/artpec8-pinctrl.dtsi | 373 ++++++++
 arch/arm64/boot/dts/axis/artpec8.dtsi         | 269 ++++++
 arch/arm64/configs/defconfig                  |   2 +
 drivers/clk/samsung/Kconfig                   |   8 +
 drivers/clk/samsung/Makefile                  |   1 +
 drivers/clk/samsung/clk-artpec8.c             | 890 ++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 | 129 ++-
 drivers/clk/samsung/clk-pll.h                 |   2 +
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    |  50 +
 drivers/pinctrl/samsung/pinctrl-exynos.h      |  10 +
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 include/dt-bindings/clock/axis,artpec8-clk.h  | 122 +++
 23 files changed, 2254 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/axis.txt
 create mode 100644 Documentation/devicetree/bindings/arm/axis.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/axis,artpec8-clock.yaml
 create mode 100644 arch/arm64/boot/dts/axis/Makefile
 create mode 100644 arch/arm64/boot/dts/axis/artpec-pinctrl.h
 create mode 100644 arch/arm64/boot/dts/axis/artpec8-grizzly.dts
 create mode 100644 arch/arm64/boot/dts/axis/artpec8-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/axis/artpec8.dtsi
 create mode 100644 drivers/clk/samsung/clk-artpec8.c
 create mode 100644 include/dt-bindings/clock/axis,artpec8-clk.h

-- 
2.34.1


