Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3A9CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 01:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XfM8N9pcz0uma2jqU60SptFJDCNKnp7M0ThZRFRtgyw=; b=W/+Qv0cQuKsOA8p+oLS/RcYJtJ
	LuMM3EnTErSKJaBc4O04EFWj3fOGvtUfp8W2q/h1ar4N+gf2uvkZcrZQAIpgwOz1CwS/mb1ApOrpK
	uXZ7p4uL7YyRSr8YO1vZHGkQQYCCSR4pHA4m+3APkeDQchkAzo0fbwf46Xpt5ZL3m2TKj5s4aG1hA
	PeLOx6ZqhMv4S2UIR4ldtxE5nOu2nkNVy88SfI82WAMVUOsDCrpk29iCrokkx9fGIYskqNS4dEbbL
	9lk8GRN3C5BDC32XF1AGZob91/XqkGfmKf0fy/aHNImZVS6dtwjA7BMeOtOFo2QExHgzbDgOXpuG9
	CzVeYflA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1acn-00000005AaW-1DGO;
	Thu, 25 Sep 2025 01:18:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1acj-00000005AYl-2bFx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 01:18:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0411D44E34;
	Thu, 25 Sep 2025 01:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA6DC4CEF7;
	Thu, 25 Sep 2025 01:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758763096;
	bh=dcMGML8nIKL54kbpLGP4hmfYVS3GxsNhXjY7EifHJFg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=fisDoom0bp0IExYdpwTaduh4U29KIGvkrVXZJJBbQL/s3v9w79ct8Rqfpi8+DJC2w
	 5UB42mGvCQK3RVSyKfmzKHGfbI8VRDHM9DIk1MSS4v5IhM+/FW63Nr7rhIAAPDa3fD
	 0Lk5cZMmkRsxO1S52+2APJykTmJvuhFayfBJ/exSJBtppK7xVgVFtwUBfAoWJvnstp
	 k7t5SudwkTbJNpObMvwZI+C70Fu/RAn/45nNM5TGFhPqTA1S61QkpeezbfXAQaztGV
	 it4G1s6T3+6Q1UxD5jvfSq/OhEKm45DxqGaoKfkmLLtlbjUy4iQ85AS3ByyG30p2tS
	 Tibh2gKvR9U0g==
Date: Wed, 24 Sep 2025 20:18:15 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 linux-sound@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 imx@lists.linux.dev, Vladimir Oltean <olteanv@gmail.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, 
 David Jander <david@protonic.nl>, Lucas Stach <l.stach@pengutronix.de>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>
To: Jonas Rebmann <jre@pengutronix.de>
In-Reply-To: <20250924-imx8mp-prt8ml-v3-0-f498d7f71a94@pengutronix.de>
References: <20250924-imx8mp-prt8ml-v3-0-f498d7f71a94@pengutronix.de>
Message-Id: <175876283065.3268812.10851892974485151512.robh@kernel.org>
Subject: Re: [PATCH v3 0/3] Mainline Protonic PRT8ML board
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_181817_699579_3782628F 
X-CRM114-Status: GOOD (  19.14  )
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


On Wed, 24 Sep 2025 10:34:11 +0200, Jonas Rebmann wrote:
> This series adds the Protonic PRT8ML device tree as well as some minor
> corrections to the devicetree bindings used.
> 
> Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
> ---
> Changes in v3:
> - Add comment on the intentional limitation to 100Mbps RGMII
> - Link to v2: https://lore.kernel.org/r/20250918-imx8mp-prt8ml-v2-0-3d84b4fe53de@pengutronix.de
> 
> Changes in v2:
> - Dropped "ASoC: dt-bindings: asahi-kasei,ak4458: Reference common DAI
>   properties", applied to broonie/sound for-next (Thanks, Mark)
> - Updated description of the reset-gpios property in sja1105 binding to
>   address the issues of connecting this pin to GPIO (Thanks, Vladimir)
> - Added the fec, switch and phy for RJ45 onboard ethernet after
>   successful testing
> - Consistently use interrupts-extended
> - Link to v1: https://lore.kernel.org/r/20250910-imx8mp-prt8ml-v1-0-fd04aed15670@pengutronix.de
> 
> ---
> Jonas Rebmann (3):
>       dt-bindings: net: dsa: nxp,sja1105: Add reset-gpios property
>       dt-bindings: arm: fsl: Add Protonic PRT8ML
>       arm64: dts: add Protonic PRT8ML board
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
>  .../devicetree/bindings/net/dsa/nxp,sja1105.yaml   |   9 +
>  arch/arm64/boot/dts/freescale/Makefile             |   1 +
>  arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dts    | 501 +++++++++++++++++++++
>  4 files changed, 512 insertions(+)
> ---
> base-commit: ea21fa34164c9ea0a2a5b8714c7e36f54c7fb46e
> change-id: 20250701-imx8mp-prt8ml-01be34684659
> 
> Best regards,
> --
> Jonas Rebmann <jre@pengutronix.de>
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
 Base: using specified base-commit ea21fa34164c9ea0a2a5b8714c7e36f54c7fb46e

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250924-imx8mp-prt8ml-v3-0-f498d7f71a94@pengutronix.de:

arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: codec@11 (asahi-kasei,ak4458): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/asahi-kasei,ak4458.yaml#
arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: isp@32e10000 (fsl,imx8mp-isp): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[77, 6], [77, 1]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: isp@32e20000 (fsl,imx8mp-isp): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[77, 6], [77, 4]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#






