Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B028ACD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 00:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1z0mzRaUwg28hI/tJz6GdvQqkq6YjyxhLSV6ywwj7Sw=; b=pAaOGoomC0I6V7+a7UfFLFVVCu
	wt2BUZAvToaNyrZY2GX+6weDMvsaco9+EBOMKodBmnGf2rcF7s5XXcA3ZOu0LAWPtHK6rDCW+gPj3
	BDtlm7GG5ju0Bea1RXMYae+BOZ8k1P5e5M3vMpFHpQYTDCnLmLfA/5U61xAZzVzOO8vMLcpkwN/3I
	jmoGR7a5RQ/9Nuf/BuayicPaT97/vyEIg+jnhq/6HA8VMPl/LDiTBG6AeR36VT1lbvu3PwofSiyH1
	gXH70o89HjQBWZIqfJAW1cH5/IsJESGNf3m1Z+/tiP244NLQf2t6JRvcJ0u38mOPPMjiclXFMvGlD
	uZuEa2YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa15q-00000000T0i-2VaW;
	Thu, 18 Jun 2026 00:58:54 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa15n-00000000T0G-3Xc8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 00:58:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781744329;
	bh=1z0mzRaUwg28hI/tJz6GdvQqkq6YjyxhLSV6ywwj7Sw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=D9aMXaS2Asgq1ESDl+vx0toQM1hhkc/hl8b0S37TNz/ZYTDXKsL/mFzZEwIZiTKwK
	 OSn2jCqTsmAKKwXcB+pyac+xBbjdZT9a17AIwwEzJbCIZgLewQ0/f+sdMZ7QLsu/nF
	 lEqpnlN78WMyKbpL5kl0DITIA2PIdXLtxujTBrR9KbSnU4eQ/J/s8M2eVEdz/2+TUr
	 hjHTvRO8XzEEcO2EXOvjPvUyAJOVe2TH0FhULoCBK5ALWbPhOK9MjoLVGINK58kkom
	 P+FZ9zggLJWLrLH1P4RZJafkfnvhE/Gp2qyVUbQOAOMlcTDEpbtEVPOdcTdox+mVa5
	 yyAf/Oj87fOTw==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8C404605A0;
	Thu, 18 Jun 2026 08:58:48 +0800 (AWST)
Message-ID: <492d66285039a789cbede66133a053fd75492e8b.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 1/2] soc: aspeed: add BMC-side PCIe BMC device driver
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?Gr=E9goire?= Layet <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
	yh_chung@aspeedtech.com, ninad@linux.ibm.com,
 linux-aspeed@lists.ozlabs.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, 	anirudhsriniv@gmail.com
Date: Thu, 18 Jun 2026 10:28:48 +0930
In-Reply-To: <CAFi2wKYgxKpp0ezzryYhFPDeqAeHhUq9Lhm67pVpnXRg+c2Vhw@mail.gmail.com>
References: <cover.1780929570.git.gregoire.layet@9elements.com>
	 <af322e76d34ad504e0bdec470293a017b489cfd7.1780929570.git.gregoire.layet@9elements.com>
	 <4839c31f666b612799a795bb47c884901fd2a903.camel@codeconstruct.com.au>
	 <CAFi2wKYzUDY5Gis9GaHdqeYdv-orHB+gWfLXkJBgbxfbnRgorA@mail.gmail.com>
	 <CAFi2wKanAH+ekKz3eVtdiz=pjEvmKwSh1XhE-Xo7p=CCiSWpEw@mail.gmail.com>
	 <e5822b82e99f8c2f81deecfeaea2192b223dfbec.camel@codeconstruct.com.au>
	 <CAFi2wKYgxKpp0ezzryYhFPDeqAeHhUq9Lhm67pVpnXRg+c2Vhw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_175852_108690_16CF659B 
X-CRM114-Status: GOOD (  26.53  )
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

Hi Gr=C3=A9goire,

On Wed, 2026-06-17 at 08:40 +0200, Gr=C3=A9goire Layet wrote:
> Hello Andrew,
>=20
> > The concept sounds reasonable to me. There's probably some bikeshedding
> > to do on the devicetree property though.
>=20
> Yes, having looked at how it's done, I would say :
> 'aspeed,vuart-over-pci' and 'aspeed,kcs-over-pci' flags would be
> better.
>=20
> > Can you outline the duplication you're concerned about? I think it's a
> > matter of resolving the SCU syscon to its regmap, then performing the
> > necessary accesses?
>=20
> Both drivers will need to set :
> - Enable PCI BMC Device MMIO
> - Enable PCI BMC Device IRQ
> - Enable PCI BMC Device MSI rooting over PCI Device 1 (BAR1)
> - Enable Host 2 BMC MSI interrupts
> - PCI device class to 0xff000000 to be identified as a MFD device. The
> reset default is 0x0C070100 which is an IPMI KCS device, but that
> causes issues as it is detected by ipmi_si but can't be loaded because
> of non default KCS address.
>=20
> Sorry for my errors, there is not that much. But both drivers will do
> almost the same initialisation. That was my code duplication concern.

I think it's valid to be concerned, but perhaps not for the reason of
code duplication. If there are multiple consumers then we need to
ensure consistency of configuration and correctness wrt to enabling /
disabling the capability based on the number of consumers.

>=20
> > I think it's not as bad as you make it out to be. The SCU's regmap
> > protects updates to individual registers under a lock, so concurrent
> > modification isn't a concern. The hardware design choices make all of
> > this slightly awkward for any related software design. As an
> > alternative you could implement a mini subsystem that relevant drivers
> > could call through to set the bits, but I currently think that's
> > unnecessary work.
>=20
> You are right it's not as bad as I thought.
> For now, I will focus on the VUART until the solution has been
> validated. Then I will easily do the same for the KCS over PCI.

I think it's a good step to at least solve one thing at a time, so long
as we're not precluding making those future steps.

>=20
> So I'll do for the V3 of the BMC side driver:
> - modify the device tree binding to have 'aspeed,ast2600-vuart' and
> add the 'aspeed,vuart-over-pci' boolean flag, only for the ast2600.

Just to confirm, you're proposing modifying the 8250 binding?

> - modify the '8250_aspeed_vuart' driver to add 'aspeed,ast2600-vuart' sup=
port.
> - add vuart over pci enable and disable code to the '8250_aspeed_vuart' d=
river.
>=20

Sounds like a reasonable start to me.

Andrew

