Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B71C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvhC8nSpix1Vgr7VmRf3QvNU+tiGc69Yj4BU3oy6dHw=; b=Lgq/+Ff6QDa1stBodZPnJp6pmS
	TigoznaH8N0e0liasAoAAO2uGqfh+KWpNLjcQVcQjj4BrSVRnxjQupz0m0c4IToCsaVW0bQ0zSplb
	dvzAeh9gOP1FgkS9+9xYopPjIFZ0rxX1e5iBiJa+Byzsan9hSE46QNQRvgRnAAMwa7G9rySoiaZ6p
	sNbjgQOheFCjb+PCaPDH/tWIO/r68yiHd8mEasL8bb5mpvgotaDKvXR2lP2qHNMjSUWVpbd27aEDr
	gwteqHbZ1m23wXnmadKViOy96P0iIbrtnctDAwK8NyEYgQyBw479ybDpOICRe5DMS4W6l6Cg4/KBt
	8bHhhyDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPoJs-0000000ETcq-3hHk;
	Thu, 12 Jun 2025 20:14:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPoHi-0000000ETFs-0qJk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 20:12:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 202F843CEE;
	Thu, 12 Jun 2025 20:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0913C4CEF1;
	Thu, 12 Jun 2025 20:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749759145;
	bh=+48g9boYrfhqh6oqAlx4hdDyZbb4+UXU4X2BzsEPKTQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KFSifGw/qMZ5yRxKIXmq+GhYB6lh8UKqjLSfyCCuMh4zDI+V1KBVBQwuXJYZFz9jW
	 FOTGRxLTY8uvJNbAKNfhBkNeyYrFGl1AkiXRVMg+K2UGP9Lqg5IgO+Kl5jqrl0RoRT
	 fF9dlKjBTGiyYUWmoXbZPatVajnHIeYgr1vy9L8bluO/YTaovLygxV61aStDrWVAwZ
	 /WkviVMZWpWeDaqT3xrWLzsT4w7Iyuu8UKHHTFdc8SlTjyxFIKsXhkDhNBZRY4v3FC
	 V/61ynrIBUs08wFaBeQg33GD+fKtqpxnIz/h1NPyD0L4M/P9rOEIxDjSrEG8KzLKEG
	 Gk6U95RG8Uqqw==
Date: Thu, 12 Jun 2025 15:12:23 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Yashwanth Varakala <y.varakala@phytec.de>, Shawn Guo <shawnguo@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Teresa Remmet <t.remmet@phytec.de>, Benjamin Hahn <b.hahn@phytec.de>, 
 Jan Remmet <j.remmet@phytec.de>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 upstream@lists.phytec.de, Fabio Estevam <festevam@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev
To: Yannic Moog <y.moog@phytec.de>
In-Reply-To: <20250611-wip-y-moog-phytec-de-imx95-libra-v3-0-c8d09f1bdbf0@phytec.de>
References: <20250611-wip-y-moog-phytec-de-imx95-libra-v3-0-c8d09f1bdbf0@phytec.de>
Message-Id: <174975871561.2915543.9713933816111618183.robh@kernel.org>
Subject: Re: [PATCH v3 0/2] Add new imx imx95-libra-rdk-fpsc SBC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_131226_277472_2B6C6650 
X-CRM114-Status: GOOD (  18.05  )
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


On Wed, 11 Jun 2025 15:05:29 +0200, Yannic Moog wrote:
> The Libra i.MX 95 is a SBC that consists of the Libra base board
> and the phyCORE i.MX 95 FPSC SoM.
> This series adds its binding and device trees.
> 
> ---
> Changes in v3:
> - fix more style issues
> - remove the rs232/485 gpio hog -> switch on the board is used instead
> - remove erroneously added build artefacts
> - Link to v2: https://lore.kernel.org/r/20250509-wip-y-moog-phytec-de-imx95-libra-v2-2-b241a915f2be@phytec.de
> 
> Changes in v2:
> - fix indentation error in bindings
> - align alias naming with FPSC enumeration
> - Link to v1: https://lore.kernel.org/r/20250507-wip-y-moog-phytec-de-imx95-libra-v1-0-4b73843ad4cd@phytec.de
> 
> ---
> Yannic Moog (2):
>       dt-bindings: add imx95-libra-rdk-fpsc
>       arm64: dts: add imx95-libra-rdk-fpsc board
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml     |   7 +
>  arch/arm64/boot/dts/freescale/Makefile             |   1 +
>  .../boot/dts/freescale/imx95-libra-rdk-fpsc.dts    | 318 ++++++++++
>  .../boot/dts/freescale/imx95-phycore-fpsc.dtsi     | 656 +++++++++++++++++++++
>  4 files changed, 982 insertions(+)
> ---
> base-commit: 68087d05675e3ac0ed632bc7b175abf06617c584
> change-id: 20250415-wip-y-moog-phytec-de-imx95-libra-27c9ce555b91
> 
> Best regards,
> --
> Yannic Moog <y.moog@phytec.de>
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
 Base: using specified base-commit 68087d05675e3ac0ed632bc7b175abf06617c584

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250611-wip-y-moog-phytec-de-imx95-libra-v3-0-c8d09f1bdbf0@phytec.de:

arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: usb@4c200000 (fsl,imx95-usb): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx95-usb', 'fsl,imx7d-usb', 'fsl,imx27-usb'] is too long
	'fsl,imx95-usb' is not one of ['fsl,imx27-usb']
	'fsl,imx95-usb' is not one of ['fsl,imx23-usb', 'fsl,imx25-usb', 'fsl,imx28-usb', 'fsl,imx35-usb', 'fsl,imx50-usb', 'fsl,imx51-usb', 'fsl,imx53-usb', 'fsl,imx6q-usb', 'fsl,imx6sl-usb', 'fsl,imx6sx-usb', 'fsl,imx6ul-usb', 'fsl,imx7d-usb', 'fsl,vf610-usb']
	'fsl,imx95-usb' is not one of ['fsl,imx8dxl-usb', 'fsl,imx8ulp-usb']
	'fsl,imx95-usb' is not one of ['fsl,imx8mm-usb', 'fsl,imx8mn-usb', 'fsl,imx93-usb']
	'fsl,imx95-usb' is not one of ['fsl,imx6sll-usb', 'fsl,imx7ulp-usb']
	'fsl,imx27-usb' was expected
	'fsl,imx7ulp-usb' was expected
	'fsl,imx6ul-usb' was expected
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: usb@4c200000 (fsl,imx95-usb): interrupts: [[0, 176, 4], [0, 174, 4]] is too long
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: /soc/usb@4c200000: failed to match any schema with compatible: ['fsl,imx95-usb', 'fsl,imx7d-usb', 'fsl,imx27-usb']
arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: usbmisc@4c200200 (fsl,imx95-usbmisc): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx95-usbmisc', 'fsl,imx7d-usbmisc', 'fsl,imx6q-usbmisc'] is too long
	'fsl,imx95-usbmisc' is not one of ['fsl,imx25-usbmisc', 'fsl,imx27-usbmisc', 'fsl,imx35-usbmisc', 'fsl,imx51-usbmisc', 'fsl,imx53-usbmisc', 'fsl,imx6q-usbmisc', 'fsl,vf610-usbmisc']
	'fsl,imx95-usbmisc' is not one of ['fsl,imx6ul-usbmisc', 'fsl,imx6sl-usbmisc', 'fsl,imx6sx-usbmisc', 'fsl,imx7d-usbmisc']
	'fsl,imx95-usbmisc' is not one of ['fsl,imx7ulp-usbmisc', 'fsl,imx8mm-usbmisc', 'fsl,imx8mn-usbmisc', 'fsl,imx8ulp-usbmisc']
	'fsl,imx6sll-usbmisc' was expected
	'fsl,imx6q-usbmisc' was expected
	'fsl,imx6ul-usbmisc' was expected
	from schema $id: http://devicetree.org/schemas/usb/fsl,usbmisc.yaml#
arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: usbmisc@4c200200 (fsl,imx95-usbmisc): reg: [[0, 1277166080, 0, 512], [0, 1275133972, 0, 4]] is too long
	from schema $id: http://devicetree.org/schemas/usb/fsl,usbmisc.yaml#
arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: /soc/usbmisc@4c200200: failed to match any schema with compatible: ['fsl,imx95-usbmisc', 'fsl,imx7d-usbmisc', 'fsl,imx6q-usbmisc']






