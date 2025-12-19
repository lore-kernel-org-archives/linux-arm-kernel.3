Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFA5D78770
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 16:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBJtP20PWFoAC61+yzJwHMPjnijCRNFt3SBUm5FoOjA=; b=jb90qZMnZ+KTQUeKHlrAigr3ml
	9ue0b6MHOSeG71OT84qNB36068mmwZ2Yn2nVKB0T2DNGno794YJII9U2qOvvDJPNnDLFm9+iO1SDl
	5yKaijU/azk10CZBs56UEKyblG+pYkSOx4rbgThvs++QLeE9A0ML0GzS5qUS1+FOOzXVYx8G2JXvC
	PUoQ03yjaFp0KUjdOwBMmeSIH2ts2BYYbV5IfN/Gp4LuQng4HEKXdc8iBJkreoJ9TmCv0sAbDU1qY
	XR5s1+VHtLVpUpMJqKqDOUVcAH00iPc33bc7kbZJKU3qB4cMhLgU9Wk+sKlTBvyzeR73xQuLU/FW2
	hR6kdzYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdfA-0000000AfUo-2TXc;
	Fri, 19 Dec 2025 16:49:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdf9-0000000AfUg-1o9H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 16:49:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 618F660152;
	Fri, 19 Dec 2025 16:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1E8C4CEF1;
	Fri, 19 Dec 2025 16:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766162946;
	bh=k3LBmjqi2XqQEaxLfGxUjft8TSwKuJs0iVDFAYlyWhY=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=Wx2/VHkZhhQrp1M6P1F3p1BFo6NtZQPGus+IR0IufHerO8doZ2+zez0C0DCw5eTm+
	 Wg+Fl0d7S4yQxmkCqW9w8tmyL2dNzjEIJPbuiHgZlK9ACGVuoH5Bn4gAV7Ss3eUvUX
	 6cirAeTB93EuEEIrHL474OhR7nXRn3Cy2vr4qBVSuetlXlbDXkjwGDwgNtCs65eCL2
	 EDvec9HneEuAx+DgHerxD3SLoWUyj6HIfyJTvGOpVeDlFOwQzZ5L8w0fVRszRIn2OM
	 90XsxfMw2sKdD8Znt8a+QWioWzCib2y5WLRziQt0E7uYqhLCVn+RADJmvmoCaqxNdL
	 Fz+Rt2Uui8L9Q==
From: Rob Herring <robh@kernel.org>
Date: Fri, 19 Dec 2025 10:49:03 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
 linux-usb@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux@ew.tq-group.com, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 Roger Quadros <rogerq@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Fabio Estevam <festevam@gmail.com>, Pawel Laszczak <pawell@cadence.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Peter Chen <peter.chen@kernel.org>, imx@lists.linux.dev, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-clk@vger.kernel.org, 
 Marek Vasut <marex@denx.de>, Magnus Damm <magnus.damm@gmail.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
Message-Id: <176616243172.3584134.12135958492433215984.robh@kernel.org>
Subject: Re: [PATCH 0/6] Support TQMa8QM
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


On Thu, 18 Dec 2025 16:20:47 +0100, Alexander Stein wrote:
> Hi,
> 
> this series adds support for TQ's TQMa8QM. The first 3 patches are prepatory:
> 1. Add support for clock-output-names for clk-renesas-pcie. This is necessary
> as clk-imx8qxp-lpcg.c (driver for phyx1 phyx2 clock gating) reqiures that
> property on the parent clock.
> 
> 2. Add support for USB devices in cdns USB3 host controller, namely
> onboard-devices as USB hubs. Implemented similarily to snps,dwc3-common.yaml.
> 
> 3. Add DMA IRQ for PCIe controller. Similar to commit 0b4c46f9ad79c
> ("arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe") which was only tested
> on imx8qxp which just has one PCIe controller.
> 
> 4 & 5. Device bindings and platform DT
> 
> 6. Workaround for missing "ERR050104: Arm/A53: Cache coherency issue"
> workaround. See [1] for details. Split into separate commit for easy revert
> once an errata workaround has been integrated.
> 
> Best regards,
> Alexander
> 
> [1] https://lore.kernel.org/all/20230420112952.28340-1-iivanov@suse.de/
> 
> Alexander Stein (6):
>   dt-bindings: clk: rs9: add clock-output-names property
>   dt-bindings: usb: cdns,usb3: support USB devices in DT
>   arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
>   dt-bindings: arm: fsl: add bindings for TQMa8x
>   arm64: dts: Add TQ imx8qm based board
>   arm64: dts: imx8qm-tqma8qm-mba8x: Disable Cortex-A72 cluster
> 
>  .../devicetree/bindings/arm/fsl.yaml          |  10 +
>  .../bindings/clock/renesas,9series.yaml       |  37 +
>  .../devicetree/bindings/usb/cdns,usb3.yaml    |  11 +
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../boot/dts/freescale/imx8qm-ss-hsio.dtsi    |   5 +-
>  .../dts/freescale/imx8qm-tqma8qm-mba8x.dts    | 869 ++++++++++++++++++
>  .../boot/dts/freescale/imx8qm-tqma8qm.dtsi    | 322 +++++++
>  7 files changed, 1253 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
> 
> --
> 2.43.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/v6.18-rc7-1585-gfa10d5a2b8f9 (best guess, 3/5 blobs matched)
 Base: tags/v6.18-rc7-1585-gfa10d5a2b8f9 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20251218152058.1521806-1-alexander.stein@ew.tq-group.com:

Error: arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi:180.1-15 Label or path thermal_zones not found
FATAL ERROR: Syntax error parsing input tree
make[3]: *** [scripts/Makefile.dtbs:132: arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dtb] Error 1
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/freescale] Error 2
make[2]: Target 'arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1478: freescale/imx8qm-tqma8qm-mba8x.dtb] Error 2
make: *** [Makefile:248: __sub-make] Error 2
make: Target 'freescale/imx8dx-colibri-eval-v3.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-var-som-symphony.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-nitrogen-enc-carrier-board.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1046a-qds.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-prt8mm.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1028a-kontron-sl28.dtb' not remade because of errors.
make: Target 'freescale/imx8qxp-tqma8xqp-mba8xx.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-beacon-kit.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-venice-gw73xx-2x.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-var-som-symphony.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-icore-mx8mp-edimm2.2.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-innocomm-wb15-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8qm-apalis-v1.1-eval.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-aristainetos3-proton2s.dtb' not remade because of errors.
make: Target 'freescale/imx8dx-colibri-iris-v2.dtb' not remade because of errors.
make: Target 'freescale/imx8mn-ddr3l-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-icore-mx8mm-edimm2.2.dtb' not remade because of errors.
make: Target 'freescale/imx8mn-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-dhcom-pdk3.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-phyboard-polis-rdk.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-venice-gw72xx-2x.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-venice-gw7901.dtb' not remade because of errors.
make: Target 'freescale/imx8mn-beacon-kit.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1028a-kontron-sl28-var1.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1028a-kontron-sl28-var3.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-debix-som-a-bmb-08.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-verdin-nonwifi-dahlia.dtb' not remade because of errors.
make: Target 'freescale/imx8qxp-ai_ml.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-verdin-wifi-dev.dtb' not remade because of errors.
make: Target 'freescale/s32v234-evb.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-skov-revb-lt6.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-phg.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-nitrogen-smarc-universal-board.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-venice-gw71xx-0x.dtb' not remade because of errors.
make: Target 'freescale/imx8ulp-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8qxp-colibri-iris.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-emtop-baseboard.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-hummingboard-pro.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1028a-kontron-sl28-var4.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-librem5-r4.dtb' not remade because of errors.
make: Target 'freescale/imx8dx-colibri-aster.dtb' not remade because of errors.
make: Target 'freescale/imx8mn-rve-gateway.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-venice-gw71xx-2x.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls2080a-rdb.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-pico-pi.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-verdin-wifi-mallow.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-msc-sm2s-ep1.dtb' not remade because of errors.
make: Target 'freescale/imx8dxl-evk.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1043a-qds.dtb' not remade because of errors.
make: Target 'freescale/s32g399a-rdb3.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-venice-gw72xx-0x.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-verdin-wifi-ivy.dtb' not remade because of errors.
make: Target 'freescale/imx8mn-bsh-smm-s2.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-aristainetos3-adpismarc.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-verdin-nonwifi-mallow.dtb' not remade because of errors.
make: Target 'freescale/imx8qxp-tqma8xqps-mb-smarc-2.dtb' not remade because of errors.
make: Target 'freescale/imx8mn-dimonoff-gateway-evk.dtb' not remade because of errors.
make: Target 'freescale/imx93-tqma9352-mba93xxca.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-tqma8mq-mba8mx.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1012a-oxalis.dtb' not remade because of errors.
make: Target 'freescale/imx93-14x14-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8dx-colibri-iris.dtb' not remade because of errors.
make: Target 'freescale/imx8mn-var-som-symphony.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-kontron-smarc-eval-carrier.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls2080a-simu.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1046a-frwy.dtb' not remade because of errors.
make: Target 'freescale/imx93-9x9-qsb.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-verdin-wifi-yavia.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-verdin-nonwifi-yavia.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-verdin-wifi-mallow.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-debix-model-a.dtb' not remade because of errors.
make: Target 'freescale/imx8qm-apalis-v1.1-ixora-v1.2.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-icore-mx8mm-ctouch2.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-zii-ultra-rmb3.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-phygate-tauri-l.dtb' not remade because of errors.
make: Target 'freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb' not remade because of errors.
make: Target 'freescale/fsl-lx2162a-clearfog.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-data-modul-edm-sbc.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-librem5-devkit.dtb' not remade because of errors.
make: Target 'freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1012a-tqmls1012al-mbls1012al-emmc.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-cubox-m.dtb' not remade because of errors.
make: Target 'freescale/fsl-lx2160a-honeycomb.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-skov-revb-hdmi.dtb' not remade because of errors.
make: Target 'freescale/imx8qm-apalis-eval.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-venice-gw7904.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-navqp.dtb' not remade because of errors.
make: Target 'freescale/fsl-lx2160a-qds.dtb' not remade because of errors.
make: Target 'freescale/fsl-lx2160a-bluebox3.dtb' not remade because of errors.
make: Target 'freescale/imx93-var-som-symphony.dtb' not remade because of errors.
make: Target 'freescale/imx8dxp-tqma8xdps-mb-smarc-2.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-nitrogen-r2.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1046a-rdb.dtb' not remade because of errors.
make: Target 'freescale/imx93-tqma9352-mba91xxca.dtb' not remade because of errors.
make: Target 'freescale/imx95-tqma9596sa-mb-smarc-2.dtb' not remade because of errors.
make: Target 'freescale/imx8mn-ddr4-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8mn-bsh-smm-s2pro.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-phanbell.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-venice-gw7903.dtb' not remade because of errors.
make: Target 'freescale/s32g274a-evb.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-ddr4-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-dhcom-pdk2.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1012a-frdm.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1012a-qds.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1043a-rdb.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-phyboard-pollux-rdk.dtb' not remade because of errors.
make: Target 'freescale/imx8qm-mek.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1088a-qds.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1088a-rdb.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-verdin-wifi-dev.dtb' not remade because of errors.
make: Target 'freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb' not remade because of errors.
make: Target 'freescale/imx91-tqma9131-mba91xxca.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-hummingboard-mate.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-venice-gw75xx-0x.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-venice-gw74xx.dtb' not remade because of errors.
make: Target 'freescale/imx8qm-apalis-ixora-v1.1.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-aristainetos3-helios.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-skov-revc-bd500.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-verdin-nonwifi-dahlia.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-iot-gateway.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-librem5-r2.dtb' not remade because of errors.
make: Target 'freescale/imx95-libra-rdk-fpsc.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1088a-ten64.dtb' not remade because of errors.
make: Target 'freescale/imx8ulp-9x9-evk.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1028a-qds.dtb' not remade because of errors.
make: Target 'freescale/imx8qm-tqma8qm-mba8x.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-verdin-wifi-dahlia.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-beacon-kit.dtb' not remade because of errors.
make: Target 'freescale/fsl-lx2162a-qds.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb' not remade because of errors.
make: Target 'freescale/imx91-11x11-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-verdin-wifi-dahlia.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-evkb.dtb' not remade because of errors.
make: Target 'freescale/imx93-tqma9352-mba93xxla.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-emcon-avari.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-edm-g-wb.dtb' not remade because of errors.
make: Target 'freescale/imx93-11x11-evk.dtb' not remade because of errors.
make: Target 'freescale/imx95-19x19-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-hummingboard-ripple.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1012a-tqmls1012al-mbls1012al.dtb' not remade because of errors.
make: Target 'freescale/fsl-lx2160a-clearfog-cx.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-tqma8mqml-mba8mx.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-verdin-nonwifi-ivy.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-dhcom-drc02.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-toradex-smarc-dev.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-verdin-wifi-ivy.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-verdin-nonwifi-yavia.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1012a-rdb.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1012a-frwy.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1028a-kontron-sl28-var2.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-verdin-nonwifi-mallow.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-venice-gw73xx-0x.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-kontron-bl-osm-s.dtb' not remade because of errors.
make: Target 'freescale/fsl-lx2160a-bluebox3-rev-a.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-verdin-wifi-yavia.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-mx8menlo.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls2081a-rdb.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-mnt-reform2.dtb' not remade because of errors.
make: Target 'freescale/imx8qxp-colibri-iris-v2.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls2088a-rdb.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-zii-ultra-zest.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-tqma8mpql-mba8mpxl.dtb' not remade because of errors.
make: Target 'freescale/imx8qm-apalis-eval-v1.2.dtb' not remade because of errors.
make: Target 'freescale/s32g274a-rdb2.dtb' not remade because of errors.
make: Target 'freescale/imx93-phyboard-nash.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-verdin-nonwifi-dev.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-ultra-mach-sbc.dtb' not remade because of errors.
make: Target 'freescale/imx8mn-tqma8mqnl-mba8mx.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-kontron-bl-osm-s.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls2080a-qds.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-verdin-nonwifi-ivy.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-data-modul-edm-sbc.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-librem5-r3.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls2088a-qds.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-kontron-pitx-imx8m.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-venice-gw7902.dtb' not remade because of errors.
make: Target 'freescale/fsl-lx2160a-rdb.dtb' not remade because of errors.
make: Target 'freescale/imx95-19x19-evk-sof.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-venice-gw82xx-2x.dtb' not remade because of errors.
make: Target 'freescale/imx93-phyboard-segin.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-verdin-nonwifi-dev.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-kontron-bl.dtb' not remade because of errors.
make: Target 'freescale/imx8dxp-tqma8xdp-mba8xx.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-hummingboard-pulse.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-libra-rdk-fpsc.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-venice-gw75xx-2x.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8qxp-colibri-eval-v3.dtb' not remade because of errors.
make: Target 'freescale/imx943-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8qxp-colibri-aster.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-nitrogen.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-skov-basic.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-thor96.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1028a-rdb.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-hummingboard-pulse.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-iota2-lumpy.dtb' not remade because of errors.
make: Target 'freescale/imx8mn-venice-gw7902.dtb' not remade because of errors.
make: Target 'freescale/imx8qxp-mek.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-skov-revc-tian-g07017.dtb' not remade because of errors.
make: Target 'freescale/imx93-kontron-bl-osm-s.dtb' not remade because of errors.
make: Target 'freescale/imx95-15x15-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-dhcom-picoitx.dtb' not remade because of errors.






