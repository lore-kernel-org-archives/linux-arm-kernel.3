Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0C7C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 05:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+ZXJK5vabVpIbj4thHc31K5dbmHYYZH1fC2DzTsqBo=; b=w+MIibQa1mwd1VbSyiLY+19/2n
	y1PH5ODz3m9rzKLH7UL/ET4ZjYx3QH4uG31QLht7UhkbVPHzk+bzdPSvEqDpfTrIjnZttJkcouwZH
	4olZnZ4aZl7vsMPyIZCg2LLQzWDnnvs7NHZpHKs0AVkc7iepEYAjt9ThHTOX7VOZFyAs6/sUrjsZH
	ZciH1PQ7l3wPOn0OPvp/0yMaLRZqA17U3MWMO4s6ohkwQuGyxvxdSvVnm6EI3IWWP9vM8wUm4gOhn
	Ac84vpNrFqLruTlPCesplq/lAjzwS6AWeJ3Ja/ThJwGhx2ge2+PDMPv7+E2cDKTiOPLOD/Gm2VnWI
	Ba1iPd4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPx7f-0000000FOfi-06mo;
	Fri, 13 Jun 2025 05:38:39 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPwz8-0000000FNdr-1lhX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 05:29:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1749792588;
	bh=o+ZXJK5vabVpIbj4thHc31K5dbmHYYZH1fC2DzTsqBo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=N9MssL99BFu955VaFR1nkL3xaUvn26A3cCWyDm62uEGpqkx1vySP1F20rcycQXUTW
	 C3h2aiWfBMTAVnAiYTzmm69r/fFhc+oyh6X2lEKQqmCFyyjkIN4vgVde9cWkpwcbTg
	 UtYCrdl/gEYRPNb7mm09wWg1aO56GKqYSi0TWK91uB+DrwzxoMDwm51hOd8aKJoNzL
	 maC+IuhtEB4uQsMHZpx22saMCLYYuyw9aODFECe6Qy534RqU2XS8iZqcxi1CqCCPxT
	 F8cp4Maxs7BCyZOL8TMUkdYFG5bw/hlkF3LR+/u60Y6p5rkfqMvWYcK9KHDRv1JuVB
	 sDfDKwY2bN9ZA==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BDC42680F3;
	Fri, 13 Jun 2025 13:29:44 +0800 (AWST)
Message-ID: <7b3be5c104b1fe1033570f2f3e2391991b6d9d42.camel@codeconstruct.com.au>
Subject: Re: [PATCH v0 0/5] Add initial AST2700 SoC support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, soc@lists.linux.dev, Mo Elbadry
 <elbadrym@google.com>,  Arnd Bergmann <arnd@arndb.de>, William Kennington
 <wak@google.com>, Taniya Das <quic_tdas@quicinc.com>,
 linux-kernel@vger.kernel.org, spuranik@nvidia.com,  Eric Biggers
 <ebiggers@google.com>, Joel Stanley <joel@jms.id.au>,
 linux-aspeed@lists.ozlabs.org, Will Deacon <will@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Nishanth
 Menon <nm@ti.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 nfraprado@collabora.com,  linux-arm-kernel@lists.infradead.org, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>, Rom Lemarchand
 <romlem@google.com>,  devicetree@vger.kernel.org, Geert Uytterhoeven
 <geert@linux-m68k.org>,  leohu@nvidia.com, Bjorn Andersson
 <bjorn.andersson@oss.qualcomm.com>, Yuxiao Zhang <yuxiaozhang@google.com>,
 dkodihalli@nvidia.com, wthai@nvidia.com
Date: Fri, 13 Jun 2025 14:59:43 +0930
In-Reply-To: <174975871838.2916138.1953670783794758715.robh@kernel.org>
References: <20250612100933.3007673-1-ryan_chen@aspeedtech.com>
	 <174975871838.2916138.1953670783794758715.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_222950_664132_CA1F511D 
X-CRM114-Status: GOOD (  25.37  )
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

On Thu, 2025-06-12 at 15:12 -0500, Rob Herring (Arm) wrote:
>=20
> On Thu, 12 Jun 2025 18:09:28 +0800, Ryan Chen wrote:
> > This patch series introduces initial support for the Aspeed AST2700 SoC
> > and the AST2700 Evaluation Board (EVB) to the Linux kernel. The AST2700
> > is the 7th generation Baseboard Management Controller (BMC) SoC from As=
peed,
> > featuring improved performance, enhanced security, and expanded I/O
> > capabilities compared to previous generations.
> >=20
> > The patchset includes the following changes:
> > - Device tree bindings for AST2700 boards.
> > - Addition of the AST2700 platform to the Kconfig menu.
> > - Basic device tree for the AST2700 SoC.
> > - Device tree for the AST2700-EVB.
> > - Updated defconfig to enable essential options for AST2700.
> >=20
> > Ryan Chen (5):
> > =C2=A0 dt-bindings: arm: aspeed: Add AST2700 board compatible
> > =C2=A0 arm64: Kconfig: Add Aspeed SoC family (ast2700) platform option
> > =C2=A0 arm64: dts: aspeed: Add initial AST2700 SoC device tree
> > =C2=A0 arm64: dts: aspeed: Add AST2700 EVB device tree
> > =C2=A0 arm64: configs: Update defconfig for AST2700 platform support
> >=20
> > =C2=A0.../bindings/arm/aspeed/aspeed.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +
> > =C2=A0arch/arm64/Kconfig.platforms=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 6 +
> > =C2=A0arch/arm64/boot/dts/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 1 +
> > =C2=A0arch/arm64/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
> > =C2=A0arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
 | 380 ++++++++++++++++++
> > =C2=A0arch/arm64/boot/dts/aspeed/ast2700-evb.dts=C2=A0=C2=A0=C2=A0 |=C2=
=A0 54 +++
> > =C2=A0arch/arm64/configs/defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 1 +
> > =C2=A07 files changed, 451 insertions(+)
> > =C2=A0create mode 100644 arch/arm64/boot/dts/aspeed/Makefile
> > =C2=A0create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi
> > =C2=A0create mode 100644 arch/arm64/boot/dts/aspeed/ast2700-evb.dts
> >=20
> > --
> > 2.34.1
> >=20
> >=20
> >=20
>=20
>=20
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>=20
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>=20
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>=20
> =C2=A0 pip3 install dtschema --upgrade
>=20
>=20
> This patch series was applied (using b4) to base:
> =C2=A0Base: attempting to guess base-commit...
> =C2=A0Base: tags/v6.16-rc1 (exact match)
>=20
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>=20
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/aspeed/=
' for 20250612100933.3007673-1-ryan_chen@aspeedtech.com:
>=20
> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: serial@14c33b00 (ns16550a): '=
pinctrl-0' is a dependency of 'pinctrl-names'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id: http://d=
evicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@100 (asp=
eed,ast2700-intc-ic): interrupts-extended: [[6, 0, 3844]] is too short
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id: http://d=
evicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@110 (asp=
eed,ast2700-intc-ic): interrupts-extended: [[6, 1, 3844]] is too short
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id: http://d=
evicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@120 (asp=
eed,ast2700-intc-ic): interrupts-extended: [[6, 2, 3844]] is too short
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id: http://d=
evicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@130 (asp=
eed,ast2700-intc-ic): interrupts-extended: [[6, 3, 3844]] is too short
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id: http://d=
evicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@140 (asp=
eed,ast2700-intc-ic): interrupts-extended: [[6, 4, 3844]] is too short
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id: http://d=
evicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@150 (asp=
eed,ast2700-intc-ic): interrupts-extended: [[6, 5, 3844]] is too short
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id: http://d=
evicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
>=20

To draw a line in the sand here: while the existing Aspeed devicetrees
(AST2600 and below) produce warnings, I won't accept devicetree patches
for the AST2700 and related boards unless they are warning-free.

Please make sure to test with the dt_binding_check and dtbs_check
targets (or equivalent) before sending your patches.

Andrew

