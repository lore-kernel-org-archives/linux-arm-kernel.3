Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901E8CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 18:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GeOtfZ/2jEXI4JZJbkmlwASajVLEWsFaSswuR8dEivA=; b=hNLl8dMqnXwukhgIdSS23oV/MX
	jrlyUFkqXl0rErjLbw4SHezrvgunKya6u+3xvvKvxRcwmXDtWMM5dwmLtux8Ogtr0RQ9MaSgsJlAB
	wtBfVLGM7jAriwihRc76UF8t6vYrIjxWmWqDcUFm8KfhK8VLBItoQtzKbM6CrKcBI76LQCjn5MFuE
	9GDKC/xAvNvHGoVAnaTxMdtLgO3hu7ctT8gPPPA90LswZobHP3Ty4t17uQ1JmiyZBPMAepFu/rAti
	7746icv3in6R1qW7YdXu8b6zmJppM+aIFL+c9drgUbo2MoyoHl0giiShjyHhi/TULZkp/fxncAz/K
	7RA7EeTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsgC-00000007Ziw-3ldA;
	Tue, 11 Nov 2025 18:01:20 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsg9-00000007ZgU-3oja
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 18:01:18 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id EAB1B1FBD9;
	Tue, 11 Nov 2025 19:01:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1762884076;
	bh=GeOtfZ/2jEXI4JZJbkmlwASajVLEWsFaSswuR8dEivA=;
	h=Received:From:To:Subject;
	b=aI8bGIWAI2vpUM0Q1gPxC2D2j9khL0+ZtZzVyH/TwXYIPPPmZbyTTLZfONdwF9m16
	 k12Sml81K6lHHHhQTB0FRpKbInzV7b56G/tXHR6RXMoq8/b0bp6bi0T4aR+jSoMq5/
	 zf2WPxwIJCmqbSD8cIg9hUcldH0gZTEX0KGb+Z8zUfuweGEZuoq/UyDtaH1bEUolv9
	 qzgS7Kgla9vdvLDhzbhwFsyZW7TUxq09EpZ5iHFDf4FaNxV5DV/R6RBz+yzNr7BM8Q
	 dbndxxKuojLcQ0kkU2Udhl3n4cnXZ4ZttnHDho3njVX/eahgVLYioaId67rQgsEfMx
	 s816fstyTSeww==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id 92C177F982; Tue, 11 Nov 2025 19:01:15 +0100 (CET)
Date: Tue, 11 Nov 2025 19:01:15 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Kirill A. Shutemov" <kas@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
	Vitor Soares <vitor.soares@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add Toradex SMARC iMX95
Message-ID: <aRN562k3NXCMghEl@gaggiata.pivistrello.it>
References: <20251111151618.70132-1-francesco@dolcini.it>
 <20251111151618.70132-3-francesco@dolcini.it>
 <aRNeMJWsCTRO3j6X@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRNeMJWsCTRO3j6X@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_100118_130208_55EB94E5 
X-CRM114-Status: GOOD (  20.91  )
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

Hello Frank,

On Tue, Nov 11, 2025 at 11:02:56AM -0500, Frank Li wrote:
> On Tue, Nov 11, 2025 at 04:16:14PM +0100, Francesco Dolcini wrote:
> > From: Max Krummenacher <max.krummenacher@toradex.com>
> >
> > Add DT support for Toradex SMARC iMX95 SoM and Development carrier
> > board.
> >
> > The module consists of an NXP i.MX95 family SoC, up to 16GB of LPDDR5
> > RAM and up to 128GB of storage, a USB 3.0 Host Hub and 2.0 OTG, two
> > Gigabit Ethernet PHYs, a 10 Gigabit Ethernet interface, an I2C EEPROM
> > and Temperature Sensor, an RX8130 RTC, a Quad/Dual lane CSI interface,
> > and some optional addons: TPM 2.0, DSI, LVDS, DisplayPort (through a
> > DSI-DP bridge), and Wi-Fi/BT module.
> >
> > Link: https://www.toradex.com/computer-on-modules/smarc-arm-family/nxp-imx95
> > Link: https://www.toradex.com/products/carrier-board/smarc-development-board-kit
> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > Co-developed-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > Co-developed-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > Co-developed-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
> > Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
> > Co-developed-by: Vitor Soares <vitor.soares@toradex.com>
> > Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> > Co-developed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> > v2:
> >  - move enable-active-high after gpio
> >  - add newline between properties and child node in som_dsi2dp_bridge
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile        |    1 +
> >  .../dts/freescale/imx95-toradex-smarc-dev.dts |  277 ++++
> >  .../dts/freescale/imx95-toradex-smarc.dtsi    | 1155 +++++++++++++++++
> >  3 files changed, 1433 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > index 75676b908299..28f8eaf18471 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -390,6 +390,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
> > +dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
> >
> ...
> > +
> > +/* SMARC PCIE_A / M2 Key B */
> > +&pcie0 {
> > +	status = "okay";
> 
> Nit: if there are next version, please consider add supports-clkreq.

What do you expect exactly?
Maybe what you are looking for is in imx95-toradex-smarc.dtsi?

Francesco

