Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D29C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 10:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WSBopwb4Cb9HOoO/hMWiA+bgd04ZQBQSPMNhoyBkfQ=; b=pfzX1WeKSmbcsBB3yQoaQnwVSk
	XG2lFrKGVuylOLCOyr1jS/ZVWNhy8CJ6RQHPq1V71jqRBM7m7aTs0Ne2QdVKC6jK2xbjqLYKf53XM
	we5xPwty2C5Oq81OH1iGcz8vk0bfZVST/A+nnz6eh5Z8eC2q2C12Vtu8lQTG0IEYDGgr0o41rbjiC
	KIhd8umJlIN3dK6rv6+C0yvGGlKfrmUzEAZwTG+jC7PdIpl25Swuv3ubjX9H3Fx8mGcZuE1j2OSj/
	Nhp37iEeHKdXuq98HCuGKOrf2PJ1JgExPZ7cI1jXAwGlXnP2RPcr3NmKYxc8+w43iUL1kzhf19bm0
	1ggqmsqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6n40-00000008zl6-39qN;
	Wed, 16 Sep 2026 10:40:28 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6n3x-00000008zkQ-0N0p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 10:40:26 +0000
Received: from francesco-nb (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 80A961FF4C;
	Wed, 16 Sep 2026 12:40:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789555222;
	bh=0WSBopwb4Cb9HOoO/hMWiA+bgd04ZQBQSPMNhoyBkfQ=; h=From:To:Subject;
	b=t6SCR7lzzUCi5mNNqwzPk74gVaCxDHMnqjLPHLI4Au1//cCfHM8pjZw5XBx/FqBia
	 QNZm6hJkpTraDX1TCEqO/23QWLUWaEwIMfrjsspW7z9ubI1ALtyjCae1kgpeVslMBj
	 rJ92jzetF9OpnkOrXX08FCtZg7AdgRDCi28j9/FdHaekVH8WceteXjmY53RpVHLIB7
	 AarH47CQejXFLprU7RZy2UM1/WOzTf/u5vgo6n1HZgZNTwT4Q5J4j93uo7Quaxa3ws
	 VVumQuMiH4tD3C8qw5E6U6tv0SZUSJ2bs88zjPUWnxdQVanWU5Fhps8YCzMFWf7LmU
	 SKWWu/FHoNknQ==
Date: Wed, 16 Sep 2026 12:40:17 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Judith Mendez <jm@ti.com>,
	Daniel Schultz <d.schultz@phytec.de>, Andrew Davis <afd@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Devarsh Thakkar <devarsht@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Vishal Mahaveer <vishalm@ti.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Hari Nagalla <hnagalla@ti.com>
Subject: Re: [PATCH v8 9/9] arm64: dts: ti: Add wkup R5F nodes to pre-ram
 bootphase
Message-ID: <20260916104017.GA284106@francesco-nb>
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
 <20260903-topic-am62a-ioddr-dt-v6-19-v8-9-74c650dfdea6@baylibre.com>
 <20260911052428.GB5377@francesco-nb>
 <DLGNWF2DSXZI.7WRJZRZLGW8@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLGNWF2DSXZI.7WRJZRZLGW8@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_034025_735646_3F0295E5 
X-CRM114-Status: GOOD (  24.33  )
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

On Wed, Sep 16, 2026 at 12:17:42PM +0200, Markus Schneider-Pargmann wrote:
> Hi Francesco,
> 
> On Fri Sep 11, 2026 at 7:24 AM CEST, Francesco Dolcini wrote:
> > Hello Markus
> >
> > On Thu, Sep 03, 2026 at 02:39:30PM +0200, Markus Schneider-Pargmann (TI) wrote:
> >> For IO+DDR the wkup_r5fss0_core0 and the
> >> wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
> >> setup is done. These are used to read the lpm metadata region in
> >> which data is stored to resume. This needs to be done before RAM is
> >> in use to avoid overwriting data.
> >> 
> >> Add the bootph-pre-ram flag to the wkup_r5fss0_core0 node in both
> >> ipc-firmware dtsi files and to the lpm metadata region nodes of the
> >> AM62A and AM62P boards.
> >> 
> >> The board level bootph-pre-ram flag of k3-am62d2-evm.dts becomes
> >> redundant with the dtsi-wide flag and is dropped.
> >> 
> >> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> > ...
> >
> >> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> >> index 45ab9d947b3a..8976c0424cd1 100644
> >> --- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> >> +++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> >> @@ -184,6 +184,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
> >>  			compatible = "shared-dma-pool";
> >>  			reg = <0x00 0x9ca08000 0x00 0x1000>;
> >>  			no-map;
> >> +			bootph-pre-ram;
> >>  		};
> >
> > verdin-am62p has the various bootph tags only in the U-Boot dtsi
> > (k3-am62p5-verdin-wifi-dev-u-boot.dtsi) as of now, I am not convinced it
> > is a good idea to just add this single one here.
> 
> I don't see any bootph-* flags for any of the related memory regions in
> k3-am62p5-verdin-wifi-dev-u-boot.dtsi. Is it in a different dtsi?

What I meant is that any bootph- property is in
arch/arm/dts/k3-am6p25-verdin-wifi-dev-u-boot.dtsi 

And I would not start adding spreading this in 2 different places.

Francesco


