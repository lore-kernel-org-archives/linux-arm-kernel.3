Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21727D3ABF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 20:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zei2n4s9bbNltrNUY7KSs/d4lCa1U+2Nv9ZR/YlkmMQ=; b=UZ3A5wnV1rWfonFoN9fSUDMGGP
	wHcK+nGKrPkgFD1i0fMPuu9fOA/xJYEaGW08drNPWgic/GtQFIDnObv5gf1pMAlBiE1+6/NWiGcvI
	gZlR8Dt2I8PqpltQyFNQfumJmFMNG/LtipzW9WGJ7HLNl1ILab4gcgqvOBcjo/kz+45QMWALlTtyJ
	K4e+sRxtUZ1Mu6Xy4U7a7O+1hsNETuiTeTQwksU8qKDgtMqoccwZbkS9Gp9enPBdA4RnBpxvpp3NR
	E+1i2lu+dX+SJpWFemLz359cUhlsY3Tc3BeC+shKGpQuZLWV0Q6r82zwi4z0vgzA5wFI/wXA+ps0c
	5YMvrtXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAb5n-00000001Cjk-0Cby;
	Mon, 11 Nov 2024 20:32:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAb3z-00000001CQS-4B39
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 20:31:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 176A75C5CBD;
	Mon, 11 Nov 2024 20:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D830FC4CED4;
	Mon, 11 Nov 2024 20:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731357067;
	bh=4I34QEy3zPSWv8GHju8qDWe1DpbrSW7bMCIC8u+UuPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FDi5WtVu4/m62hLrLsWTmk+k2LQyfuFh2Di+SeiUbIBR4tcvNGp1PTDZECpd5/M7B
	 kcwCf7mOYQ+IB3u+JdsD07YtrdVR80HS25oNVRB8luHJ3BznoQZa/CNFvYmtOQOL3e
	 vE9w4qkbpH7V5641kh3S/jhvdduolCXX74m/JPaGKCOFo23ocjb4s58a5N9jktW64N
	 6rISV0mb/5V5H1q7FV4iKwxMr5B64iyYbaEOECgYuoHi9/RcIAdogZIx8E7yrfKDPG
	 xY92J3IvGrDIQ617rHDbwCnffqHuzDNbLQfOV2O/DzSKd57MYqjIJkLVSNxpGTAJ2B
	 +hFLCiyJtTRdA==
Date: Mon, 11 Nov 2024 14:31:04 -0600
From: Rob Herring <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: frank-w@public-files.de, Frank Wunderlich <linux@fw-web.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/3] arm64: dts: marvell: Fix anyOf conditional failed
Message-ID: <20241111203104.GA1887580-robh@kernel.org>
References: <20241109094623.37518-1-linux@fw-web.de>
 <20241109094623.37518-2-linux@fw-web.de>
 <e534c723-6d65-433f-8ab5-1c0d424d7367@lunn.ch>
 <9B1A5D20-3DE5-40C1-8B2D-B1C4F53FA5F4@public-files.de>
 <CAL_JsqJnOa_9Poz86vOWBCQigvv-Ab4Tt1hrwTxSa5zNraVxXQ@mail.gmail.com>
 <e7a8e087-fb92-4911-b7fb-34521635e8da@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7a8e087-fb92-4911-b7fb-34521635e8da@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_123108_140309_45F8C840 
X-CRM114-Status: GOOD (  27.46  )
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

On Mon, Nov 11, 2024 at 06:15:16PM +0100, Andrew Lunn wrote:
> On Mon, Nov 11, 2024 at 10:25:12AM -0600, Rob Herring wrote:
> > On Sun, Nov 10, 2024 at 3:25 AM Frank Wunderlich
> > <frank-w@public-files.de> wrote:
> > >
> > > Am 9. November 2024 18:29:44 MEZ schrieb Andrew Lunn <andrew@lunn.ch>:
> > > >On Sat, Nov 09, 2024 at 10:46:19AM +0100, Frank Wunderlich wrote:
> > > >> From: Frank Wunderlich <frank-w@public-files.de>
> > > >>
> > > >> after converting the ahci-platform binding to yaml the following files
> > > >> reporting "'anyOf' conditional failed" on
> > > >>
> > > >> sata@540000: sata-port@0
> > > >> diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> > > >> index 1e0ab35cc686..2b5e45d2c5a6 100644
> > > >> --- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> > > >> +++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> > > >> @@ -214,6 +214,7 @@ &cp0_sata0 {
> > > >>
> > > >>      sata-port@1 {
> > > >>              phys = <&cp0_comphy3 1>;
> > > >> +            status = "okay";
> > > >>      };
> > > >>  };
> > > >
> > > >>
> > > >> diff --git a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts b/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
> > > >> index 7af949092b91..6bdc4f1e6939 100644
> > > >> --- a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
> > > >> +++ b/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
> > > >> @@ -433,11 +433,13 @@ &cp0_sata0 {
> > > >>      /* 7 + 12 SATA connector (J24) */
> > > >>      sata-port@0 {
> > > >>              phys = <&cp0_comphy2 0>;
> > > >> +            status = "okay";
> > > >>      };
> > > >>
> > > >>      /* M.2-2250 B-key (J39) */
> > > >>      sata-port@1 {
> > > >>              phys = <&cp0_comphy3 1>;
> > > >> +            status = "okay";
> > > >>      };
> > > >>  };
> > > >> diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> > > >> index 7e595ac80043..161beec0b6b0 100644
> > > >> --- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> > > >> +++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> > > >> @@ -347,10 +347,12 @@ CP11X_LABEL(sata0): sata@540000 {
> > > >>
> > > >>                      sata-port@0 {
> > > >>                              reg = <0>;
> > > >> +                            status = "disabled";
> > > >>                      };
> > > >
> > > >I don't know the yaml too well, but it is not obvious how adding a few
> > > >status = "disabled"; status = "okay"; fixes a "'anyOf' conditional failed".
> > > >
> > > >Maybe you can expand the explanation a bit?
> > > >
> > > >       Andrew
> > >
> > > Hi angelo,
> > >
> > > I guess the dtbs_check only checks required properties from yaml if the node is enabled.
> > 
> > Yes, that is exactly how it works.
> 
> So from this, can i imply that phys is a required property?
> 
> Looking at the above patch, it appears that for armada-*.dts,
> sata-port@0 always uses phys = <&cp0_comphy2 0> and sata-port@1 uses
> phys = <&cp0_comphy3 1>. Is this an actual SoC property? Could it be
> moved up into the .dtsi file? Or is it really a board property?

Depends if the phy connection/assignment is really fixed or all boards 
so far just happen to use the same one. If it is fixed and it's just a 
matter of only one user can be active at a time, then yes, moving to the 
SoC dtsi makes sense. The connection in the h/w is there, enabled or 
not. Also, then the board is only dealing with "status" like many of the 
blocks.

Rob

