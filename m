Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E69CE8E94
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNfGiyxEp8UFNVJDEOVK59e7y9Cim+52uMG72bNpMeM=; b=fgNVssqJsuVSbws3K6fuX8IH4S
	t/o3ksuB0dwwBn9Pq/13bm1hyn+UKQVBFESw6VGbSMFXbRMjkjuFU0jT+9YNwlo7uK7ZPwsogio2D
	Ukh2BNAvu1gWpuEWUSP4JLYK/XJbn5ZScU0WUGvntdQEpb/6+33rE77bpD11NfIkMDr4sjOkaERYt
	pRBV9zVZZX8FM2ptHQzbyCW1PEYg17zRI3pFuPuxxUAviB/B9o7hFE3NZ+O7FG/hH9zeaEi3t1Jq1
	rk4+GqDxJlRgMgGg1yqKvEStqc0fzfniia9VRMdcgkQhCimITn0+DlAqEQ09vJVr7xYta0UGKd451
	ToaEVJlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40wn-000000018i3-0Hby;
	Thu, 24 Oct 2024 16:44:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t40ly-000000016eu-0uBV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 16:33:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EC1D1A456A5;
	Thu, 24 Oct 2024 16:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C83C4CEC7;
	Thu, 24 Oct 2024 16:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729787596;
	bh=wcSvy++2WK9K7K4DB2BwQXIdYratvHoDhVpZn+pTHkE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=K8SZNPBRMnGyYzoTxbLEDtIHajP6leNlRwDJRr7KVuXBS948RtOWKQXUbsdcHwuI3
	 Pyk87iQWjay5aijI06KAE6bn302HswGqSkyTsFEn03azdQVQRIN0kfVJfeUyIrpunZ
	 aR1XztGV2ldUuqslrYTLN2lmOcKMFq5SXG5hFx1703Pe60kbnWEZdHdpnrGsFaOnPy
	 PUeM7XoHibxYxzYewW2IIY25q4N3KTyaLth1xGduH+Qf7lW0f3agTCzAJwtkR86wPF
	 u758EkhJDrEjLH197/jpXci2SDFeC+V+7HjqD3ZV1KbOD3f9yACNDTuaFKlCfifgKW
	 aH7gfUWtvyL/w==
Date: Thu, 24 Oct 2024 11:33:16 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhavin Sharma <bhavin.sharma@siliconsignals.io>
Cc: Hiago De Franco <hiago.franco@toradex.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Michael Walle <mwalle@kernel.org>, Tim Harvey <tharvey@gateworks.com>, 
 Parthiban Nallathambi <parthiban@linumiz.com>, 
 Max Merchel <Max.Merchel@ew.tq-group.com>, 
 Conor Dooley <conor+dt@kernel.org>, shawnguo@kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
 Joao Paulo Goncalves <joao.goncalves@toradex.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Gregor Herburger <gregor.herburger@ew.tq-group.com>, imx@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>, Mathieu Othacehe <m.othacehe@gmail.com>, 
 linux-kernel@vger.kernel.org, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20241023091231.10050-1-bhavin.sharma@siliconsignals.io>
References: <20241023091231.10050-1-bhavin.sharma@siliconsignals.io>
Message-Id: <172978739819.623555.106741073057492931.robh@kernel.org>
Subject: Re: [PATCH v3 0/2] Add support Boundary Device Nitrogen8MP
 Universal SMARC Carrier Board
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_093318_404609_9DBBA96F 
X-CRM114-Status: GOOD (  14.20  )
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


On Wed, 23 Oct 2024 14:41:13 +0530, Bhavin Sharma wrote:
> Add initial support for Nitrogen8MP Universal SMARC Carrier Board with
> Nitrogen8MP SMARC System on Module.
> 
> Change in V2:
> 
> in patch 1/2:
>         - Drop Unneeded line
>         - Correct the indentation
> 
> in patch 2/2:
>         - Add Acked-by tag
> 
> CHange in V3:
> 
> in patch 1/2:
> 	- In version 2, I forgot to add the Makefile. Adding it now.
> 
> Bhavin Sharma (2):
>   arm64: dts: imx8mp: Add Boundary Device Nitrogen8MP Universal SMARC
>     Carrier Board
>   dt-bindings: arm: fsl: Add Boundary Device Nitrogen8MP Universal SMARC
>     Carrier Board
> 
>  .../devicetree/bindings/arm/fsl.yaml          |   6 +
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../freescale/imx8mp-nitrogen-smarc-som.dtsi  | 348 ++++++++++++++++++
>  .../imx8mp-nitrogen-smarc-universal-board.dts |  17 +
>  4 files changed, 372 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-som.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dts
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


New warnings running 'make CHECK_DTBS=y freescale/imx8mp-nitrogen-smarc-universal-board.dtb' for 20241023091231.10050-1-bhavin.sharma@siliconsignals.io:

arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: /soc@0/bus@30800000/i2c@30ae0000/gpio@20: failed to match any schema with compatible: ['microchip,mcp23018']






