Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03294C36008
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 00:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5pgxu/C3HO0atJOCJMZznUfULA/oXZuznV1UshXGNHM=; b=j7FKAQDWM07fxz4gfbiIvKNJ9x
	PZXEnb0CQ6p8uZ8Pr79WZWqyMUMh9VTbEYVmzPS5G5J8atmzmm//kavhfDvBNUzrsilw6TyKGQbAZ
	oSrrjAaMb33pHmJHvnMBIhDYpY6yx2BIO857t3mvuY4hiKpKAoJO6jousnE2/68MhQj+PcC0wl0am
	PKUsJm/ZRfrQiINP1IpEwuJ1ks2GJrd3a6wP7x5pp7p4IjNgyNFBwPWOYwE6hlHWZFDCsI+vslmab
	n+aLt/GBlJ5OhzAq4AiFQMVHlVIv9i3JENbTV+tqLSDblukW57OKIckSIT3GR7c3N5eNCPMxVRSKn
	5wG6WAJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tygXm-0000000FfYd-2wD9;
	Sun, 30 Mar 2025 00:28:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tygW2-0000000FfRL-2t41
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 00:27:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 004B24448F;
	Sun, 30 Mar 2025 00:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01651C4CEEA;
	Sun, 30 Mar 2025 00:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743294425;
	bh=aiiKdFDmCS0U9MUvBKmwJ6wtLAwgtVEXAZWbVJ4delE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YdWoEnL7t3+G1eeikHnkF20YlYkfES7CxO/Bpxz0+RX6+FLucVZqHc97etVGahclJ
	 eJ+W+Jp+4QdjpGCfWCZdXf3yUeZqhZIGppdp0x7S3eqKVs+NASYHeoSgfOjLDY3FmK
	 5F3AYTFi3pF5aBRlHUUcJI+Qlbaf9f8+HPa+XRIqaj7RPJPt13+oRoDeaBPplp09WI
	 Dg4FsXV/9d0Euzy4vKTH+xz2hiKWu2g1zVKGSYYQwszyk5OrmkWFwlsYIjiC2whRbY
	 NBYRMGWh+cIWrmkGZ306mabVDmnSlu0mSHOrfxh4tOVLYGNtdH36Zo9wCP9wFIJ/If
	 YQCFHairp9IOg==
Date: Sat, 29 Mar 2025 19:27:04 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sascha Hauer <s.hauer@pengutronix.de>, Benjamin Hahn <b.hahn@phytec.de>, 
 linux-kernel@vger.kernel.org, Teresa Remmet <t.remmet@phytec.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, upstream@lists.phytec.de, 
 Yashwanth Varakala <y.varakala@phytec.de>, Shawn Guo <shawnguo@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Fabio Estevam <festevam@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jan Remmet <j.remmet@phytec.de>
To: Yannic Moog <y.moog@phytec.de>
In-Reply-To: <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-0-28324c7f81fa@phytec.de>
References: <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-0-28324c7f81fa@phytec.de>
Message-Id: <174329418273.2439899.17086234453417036380.robh@kernel.org>
Subject: Re: [PATCH 0/3] Add new imx imx8mp-libra-rdk-fpsc SBC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_172706_769064_8A90403E 
X-CRM114-Status: GOOD (  15.02  )
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


On Fri, 28 Mar 2025 14:04:36 +0100, Yannic Moog wrote:
> The Libra i.MX 8M Plus is a SBC that consists of the Libra base board
> and the phyCORE i.MX 8M Plus FPSC SoM.
> This series adds its binding and device trees.
> In addition add an overlay for an LVDS display that may optionally be
> connected to the Libra board.
> 
> ---
> Yannic Moog (3):
>       dt-bindings: add imx8mp-libra-rdk-fpsc
>       arm64: dts: add imx8mp-libra-rdk-fpsc board
>       arm64: dts: add imx8mp-libra-rdk-fpsc LVDS panel overlay
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml     |   7 +
>  arch/arm64/boot/dts/freescale/Makefile             |   3 +
>  .../imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso  |  44 ++
>  .../boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts   | 291 ++++++++
>  .../boot/dts/freescale/imx8mp-phycore-fpsc.dtsi    | 796 +++++++++++++++++++++
>  5 files changed, 1141 insertions(+)
> ---
> base-commit: 90453dc4dee29b96b9162895f45776bc25526e07
> change-id: 20241210-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-c273025682f2
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
 Base: using specified base-commit 90453dc4dee29b96b9162895f45776bc25526e07

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-0-28324c7f81fa@phytec.de:

arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: clock-controller@30e20000: clocks: [[2, 284], [2, 123], [2, 124], [2, 125], [2, 127], [2, 128], [2, 182], [2, 321]] is too long
	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: clock-controller@30e20000: clock-names: ['ahb', 'sai1', 'sai2', 'sai3', 'sai5', 'sai6', 'sai7', 'axi'] is too long
	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#






