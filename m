Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E229C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 03:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aU2aSTL0cwaF4bRDvw4JUIThEaROTHqENTCUjsBYJBA=; b=fAJ6C9H6SmcEe0
	1gmFl4Q9BDrscvBxDasYT8X6bLfGNb0WKHN/Ip93DpvzUOzZGGU0YXffpP2+CM+mBbRRJ1tzyJaYT
	/94hIgg/P5aaP44QjQbvI2ewN4UqZFFUhSeBQJ7FCZmZBKhJjfKkeaOM8CS+XmoLsrmq/L0M4Z1hv
	mbiPUSut5SIFKFRJQi+ZN/TlVVoq0Xd3cbwDkmZvvt2Q1qimn8JL+EQDISpAYZIGccRnjTvNM35h0
	EFV0MCkeis/eyoHWVRmOQVt5ioavmuLhUBXKXmUlxD7ZixSSu78/WfuC0V+gVhFFwItVAdIgpRdoW
	+iJiFmohbDLFxh2rrJkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0XJH-0000000AdLj-3gg3;
	Fri, 04 Apr 2025 03:01:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0XHS-0000000ActN-0wPq;
	Fri, 04 Apr 2025 02:59:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 347015C6508;
	Fri,  4 Apr 2025 02:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770AFC4CEE3;
	Fri,  4 Apr 2025 02:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743735580;
	bh=R97K1edD4zHvzCCaN7fvUpcILyjz5fPxwxzTH3c208Y=;
	h=From:Subject:Date:To:Cc:From;
	b=DInFV6ZzZBtDCjprD0wNsyVhBlrl/OLVq59Qc8WDA3UnSu6pzYrn/+z8sAldu048T
	 ECwlYcs9UBoRPnPvxrGuu3EVcEF6J+/4r0wCEVgadFKl7SSEGWPQGtFvgKZ1uGx6Gw
	 NTLPe6lvFsgBfDYD7MVxeaup6ebGs1VhLDI2kWsioUB4+zEg5amoqw+NwiA92bLggV
	 DiTcm1B9ZIta65dj/bHTQlKbhzaJ+b8ojif64yPJtiGJ9m0NXcBKtR4YA89r3Wz/hE
	 JDizBDNh1vovQRv3FZYw5ee6m1E8APjoQChggwO8qym2IVuWiSgZhxgZi6eSXcB4yL
	 +O4eazKiulj1g==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 00/19] Arm cpu schema clean-ups
Date: Thu, 03 Apr 2025 21:59:21 -0500
Message-Id: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAlL72cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwNj3ZQS3eSCUt3i5IzU3ERdE4tUM7Nk8zSzREsDJaCegqLUtMwKsHn
 RsbW1AGXLomtfAAAA
X-Change-ID: 20250403-dt-cpu-schema-48e66c7f6a90
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
 Conor Dooley <conor@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_195942_359413_6F93C7BB 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

The Arm cpu.yaml schema fails to restrict allowed properties in 'cpu' 
nodes. The result, not surprisely, is a number of additional properties 
and errors in .dts files. This series resolves those issues.

There's still more properties in arm32 DTS files which I have not 
documented. Mostly yet more supply names and "fsl,soc-operating-points". 
What's a few more warnings on the 10000s of warnings...

The .dts files can be taken by the respective SoC maintainers. I will 
take the binding changes.

Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>
---
Rob Herring (Arm) (19):
      arm64: dts: allwinner: h5/h6: Drop spurious 'clock-latency-ns' properties
      arm64: dts: broadcom: bcm2712: Use "l2-cache" for L2 cache node names
      arm64: dts: morello: Fix-up cache nodes
      arm64: dts: microchip: sparx5: Fix CPU node "enable-method" property dependencies
      arm64: dts: qcom: qdu1000: Fix qcom,freq-domain
      arm64: dts: qcom: msm8939: Fix CPU node "enable-method" property dependencies
      arm64: dts: qcom: msm8992-lg-h815: Fix CPU node "enable-method" property dependencies
      arm: dts: qcom: msm8916: Move "qcom,acc" and "qcom,saw" to 32-bit .dtsi
      arm: dts: qcom: sdx55/sdx65: Fix CPU power-domain-names
      arm/arm64: dts: imx: Drop redundant CPU "clock-latency"
      arm: dts: qcom: ipq4019: Drop redundant CPU "clock-latency"
      arm: dts: rockchip: Drop redundant CPU "clock-latency"
      arm64: dts: amlogic: Drop redundant CPU "clock-latency"
      dt-bindings: arm/cpus: Add schemas for "enable-method" dependencies
      dt-bindings: arm/cpus: Re-wrap 'description' entries
      dt-bindings: Reference opp-v1 schema in CPU schemas
      dt-bindings: arm/cpus: Add missing properties
      dt-bindings: arm/cpus: Add power-domains constraints
      dt-bindings: cpufreq: Drop redundant Mediatek binding

 Documentation/devicetree/bindings/arm/cpus.yaml    | 220 ++++++++++--------
 .../bindings/cpufreq/cpufreq-mediatek.txt          | 250 ---------------------
 Documentation/devicetree/bindings/mips/cpus.yaml   |   3 +-
 Documentation/devicetree/bindings/opp/opp-v1.yaml  |  18 +-
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi               |   1 -
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi           |   4 -
 arch/arm/boot/dts/qcom/qcom-msm8916-smp.dtsi       |   8 +
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi             |   2 +-
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi             |   2 +-
 arch/arm/boot/dts/rockchip/rk3128.dtsi             |   8 +-
 arch/arm/boot/dts/rockchip/rk3188.dtsi             |   1 -
 arch/arm/boot/dts/rockchip/rk322x.dtsi             |   1 -
 arch/arm/boot/dts/rockchip/rk3288.dtsi             |   5 +-
 arch/arm/boot/dts/rockchip/rv1108.dtsi             |   1 -
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi       |   4 -
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi       |   4 -
 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts  |   4 -
 .../boot/dts/amlogic/meson-g12a-radxa-zero.dts     |   4 -
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  |   4 -
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts    |   4 -
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |   4 -
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi        |   1 +
 .../dts/amlogic/meson-g12b-a311d-libretech-cc.dts  |   6 -
 arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi  |   2 +
 .../boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi  |   6 -
 .../boot/dts/amlogic/meson-g12b-bananapi.dtsi      |   6 -
 .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |   6 -
 .../dts/amlogic/meson-g12b-odroid-go-ultra.dts     |   6 -
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi |   6 -
 .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    |   6 -
 arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi  |   2 +
 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi   |   6 -
 arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi   |   4 -
 .../arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi |   4 -
 .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |   4 -
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |   4 -
 .../dts/amlogic/meson-sm1-s905d3-libretech-cc.dts  |   4 -
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |   4 -
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         |   1 +
 arch/arm64/boot/dts/arm/morello.dtsi               |  22 +-
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |   8 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |   4 -
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |   4 -
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |   4 -
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |   4 -
 .../boot/dts/microchip/sparx5_pcb_common.dtsi      |   2 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   8 -
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |  24 +-
 arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts       |   6 +
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |   8 +-
 50 files changed, 210 insertions(+), 514 deletions(-)
---
base-commit: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
change-id: 20250403-dt-cpu-schema-48e66c7f6a90

Best regards,
-- 
Rob Herring (Arm) <robh@kernel.org>


