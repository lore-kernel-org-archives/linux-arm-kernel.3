Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D00BC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 14:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHOlI9B+kRNV8mR7AZ9EOpi9LgyzdqkF97XYiWd6DoA=; b=zRG71lijDJscrA07cRFcOg1bH/
	juqDpeL2kOHpZkIZBEdcSzFqdnLXGLuZL51HU1jAw1DxTaEUcDkroT3Bihhtfx2BbOa2mIjtJhXvq
	DIOQoLsPnUAlapXc17Snjkq5QEFwlOIX6EXLpQvujDWwF42rKQtjaPeZXYkr/969Cv/fR3GA1vofe
	MQGLfZRXDeog462q1rXn4CF7jh8V8S9iivfTjxsvuzO7D0brlcCck/2EciZ1GVK51CtrCn+zv5WXK
	rlfcykLY0OzX9eotD8wSl/wJdugxSkWEWcb0iPJIzofM3rWApal6Wb2LBzYsMtydebVyN/0J9QXcp
	niZz+VnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5f1-00000006Fi4-0mAS;
	Tue, 25 Mar 2025 14:53:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5dI-00000006FOO-0p43
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 14:52:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=dHOlI9B+kRNV8mR7AZ9EOpi9LgyzdqkF97XYiWd6DoA=; b=ixf5gNS2Hm9OYOcP8O+7jPO5ui
	ybqYKk7MvSqMVRLUG8x2TzdIcnzMZGjq89t3BqPKLar7IfOn9op3MNgRPyyarqv6AavFh8GXQI1Uf
	ntINpyPVr/KR+f7hAaUmXHO2SxaxINPQJrzicWv7OYIG/vLvje7oMuMvMg0E+vDcdpop0+pgxud0C
	8JN7cMbI1TACq9sSKQIOZP2kUX03rD/i4DN6TqzpPQU5ErpyFp9XOKdzYv6TiKEHuK+uH8WTON0TA
	7OqW1Z4Qlq9Z80+giyuS4iybivikZYRapfBDlGVYVKjxAabQEdJ3E94RndTsJ5xvlm5bT+wNyQbyK
	U8EacH/A==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx5dE-00000005Wkx-1uaS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 14:51:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B48135C61FB;
	Tue, 25 Mar 2025 14:49:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420B5C4CEED;
	Tue, 25 Mar 2025 14:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742914314;
	bh=uV5hAcmXTUSxUEdJgxlWrpYerwxW5ZbmqsbDspBaLIc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=m2WW+D94wxEdAWc0gFzDLPt8BALX5kyVA+IU9Cy/HUA8Alvr4FQYmyqE7C1GeNczu
	 HpT3a50TMFkG5Z2epJD2aaaIXa3HeOewj7Lw91u6cWXr/GJx8lH+GdYNo4lE0ho/5F
	 CyIUQwGvwzP30vC1amrugbuqg1SbVN3y80fkJuXI137o7J1HCdweruWvtUTkb8DwkX
	 H+So3XnWqP9+OGfT149ajYphzZkDqxhDDb8wRAYFgst8qtjrpCpUuTHJy98M1jUfl1
	 kc6dtC/IdRggoSGYVDFcARMyk5Fa0PHZwnQbSRa6zJIKWlctYqNc9oHyc3ym3wCjYl
	 DEOkhDPtQHhuQ==
Date: Tue, 25 Mar 2025 09:51:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Eric Dumazet <edumazet@google.com>, 
 davem@davemloft.net, imx@lists.linux.dev, 
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, linux-arm-kernel@lists.infradead.org, 
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
To: Lukasz Majewski <lukma@denx.de>
In-Reply-To: <20250325115736.1732721-1-lukma@denx.de>
References: <20250325115736.1732721-1-lukma@denx.de>
Message-Id: <174291413928.2015590.6304239007146936808.robh@kernel.org>
Subject: Re: [PATCH 0/5] net: mtip: Add support for MTIP imx287 L2 switch
 driver
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_145156_975712_26B65F49 
X-CRM114-Status: GOOD (  32.11  )
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


On Tue, 25 Mar 2025 12:57:31 +0100, Lukasz Majewski wrote:
> This patch series adds support for More Than IP's L2 switch driver embedded
> in some NXP's SoCs. This one has been tested on imx287, but is also available
> in the vf610.
> 
> In the past there has been performed some attempts to upstream this driver:
> 1. The 4.19-cip based one [1]
> 2. DSA based one for 5.12 [2] - i.e. the switch itself was treat as a DSA switch
>    with NO tag appended.
> 3. The extension for FEC driver for 5.12 [3] - the trick here was to fully reuse
>    FEC when the in-HW switching is disabled. When bridge offloading is enabled,
>    the driver uses already configured MAC and PHY to also configure PHY.
> 
> All three approaches were not accepted as eligible for upstreaming.
> 
> The driver from this series has floowing features:
> 
> 1. It is fully separated from fec_main - i.e. can be used interchangeable
>    with it. To be more specific - one can build them as modules and
>    if required switch between them when e.g. bridge offloading is required.
> 
>    To be more specific:
> 	- Use FEC_MAIN: When one needs support for two ETH ports with separate
> 	  uDMAs used for both and bridging can be realized in SW.
> 
> 	- Use MTIPL2SW: When it is enough to support two ports with only uDMA0
> 	  attached to switch and bridging shall be offloaded to HW.
> 
> 2. This driver uses MTIP's L2 switch internal VLAN feature to provide port
>    separation at boot time. Port separation is disabled when bridging is
>    required.
> 
> 3. Example usage:
> 	Configuration:
> 	ip link set lan0 up; sleep 1;
> 	ip link set lan1 up; sleep 1;
> 	ip link add name br0 type bridge;
> 	ip link set br0 up; sleep 1;
> 	ip link set lan0 master br0;
> 	ip link set lan1 master br0;
> 	bridge link;
> 	ip addr add 192.168.2.17/24 dev br0;
> 	ping -c 5 192.168.2.222
> 
> 	Removal:
> 	ip link set br0 down;
> 	ip link delete br0 type bridge;
> 	ip link set dev lan1 down
> 	ip link set dev lan0 down
> 
> 4. Limitations:
> 	- Driver enables and disables switch operation with learning and ageing.
> 	- Missing is the advanced configuration (e.g. adding entries to FBD). This is
> 	  on purpose, as up till now we didn't had consensus about how the driver
> 	  shall be added to Linux.
> 
> Links:
> [1] - https://github.com/lmajewski/linux-imx28-l2switch/commits/master
> [2] - https://github.com/lmajewski/linux-imx28-l2switch/tree/imx28-v5.12-L2-upstream-RFC_v1
> [3] - https://source.denx.de/linux/linux-imx28-l2switch/-/tree/imx28-v5.12-L2-upstream-switchdev-RFC_v1?ref_type=heads
> 
> 
> 
> Lukasz Majewski (5):
>   MAINTAINERS: Add myself as the MTIP L2 switch maintainer (IMX SoCs:
>     imx287)
>   dt-bindings: net: Add MTIP L2 switch description
>     (fec,mtip-switch.yaml)
>   arm: dts: Adjust the 'reg' range for imx287 L2 switch description
>   arm: dts: imx287: Provide description for MTIP L2 switch
>   net: mtip: The L2 switch driver for imx287
> 
>  .../bindings/net/fec,mtip-switch.yaml         |  160 ++
>  MAINTAINERS                                   |    7 +
>  arch/arm/boot/dts/nxp/mxs/imx28-xea.dts       |   56 +
>  arch/arm/boot/dts/nxp/mxs/imx28.dtsi          |    4 +-
>  drivers/net/ethernet/freescale/Kconfig        |    1 +
>  drivers/net/ethernet/freescale/Makefile       |    1 +
>  drivers/net/ethernet/freescale/mtipsw/Kconfig |   10 +
>  .../net/ethernet/freescale/mtipsw/Makefile    |    6 +
>  .../net/ethernet/freescale/mtipsw/mtipl2sw.c  | 2108 +++++++++++++++++
>  .../net/ethernet/freescale/mtipsw/mtipl2sw.h  |  784 ++++++
>  .../ethernet/freescale/mtipsw/mtipl2sw_br.c   |  113 +
>  .../ethernet/freescale/mtipsw/mtipl2sw_mgnt.c |  434 ++++
>  12 files changed, 3682 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/fec,mtip-switch.yaml
>  create mode 100644 drivers/net/ethernet/freescale/mtipsw/Kconfig
>  create mode 100644 drivers/net/ethernet/freescale/mtipsw/Makefile
>  create mode 100644 drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
>  create mode 100644 drivers/net/ethernet/freescale/mtipsw/mtipl2sw.h
>  create mode 100644 drivers/net/ethernet/freescale/mtipsw/mtipl2sw_br.c
>  create mode 100644 drivers/net/ethernet/freescale/mtipsw/mtipl2sw_mgnt.c
> 
> --
> 2.39.5
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nxp/' for 20250325115736.1732721-1-lukma@denx.de:

arch/arm/boot/dts/nxp/mxs/imx28-xea.dtb: /ahb@80080000/switch@800f0000: failed to match any schema with compatible: ['fsl,imx287-mtip-switch']
arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1110.dtb: /lvds1-panel: failed to match any schema with compatible: ['nlt,nl12880bc20-spwg-24']






