Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F41CAC585
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 18:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HtfesK0bD1FU8VPQXSQZvbbJN2rnz9eTYACyELLUrU=; b=FYUCK2xiimH/Op/4tSIEn3UJU9
	a/y4n1HiwvKddVQ/+5lrWiHZZIevdpSEiDLtU4N2akI6NoTwUqtK1Tx80oKlIUaWWahqL/4Tc657x
	EJXtu6jkcM+3RrhdaELtUyfr4qaH1Bw7wIbJrKUBhSedBI1ipIpNjG7ojIlvxGRYAlgthKhgURtFO
	3bp+kleXVKPxWryK46R0Z9a7eVJ541RGHYHNFkIRfY0DdHjfLZvrQRybZmbvvDgNZ/WEkb5VxLWI5
	xsCtqjlp9jXw0qQV9OuggRiKfU6j2j6jpAwFKh7OZCyebqhIsUBTaBEzd5d2g0y3dtwvTm2muvE5/
	zoUYRFpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgUk-00000001VGs-3pN1;
	Mon, 08 Sep 2025 18:21:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvcfh-000000002kF-3hiA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 14:16:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2BAE24468A;
	Mon,  8 Sep 2025 14:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB51C4CEF7;
	Mon,  8 Sep 2025 14:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757341001;
	bh=CBI4suASODhHBC14sipB186eMW1r9Bxk7k0WFgqClrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tmPa1gkqzuRx5RyBxCqHbzAfV5G4d4nmjTy6s6i+bt8myOEAOvu9tsR0PlDNaoEHs
	 sST9fnnK7DNwNwUqjeW5R0YMOuZQPBrj7IDVOInuWfqw122jHn7oe+ryNfpvECbpT8
	 QGOooXhdorgU/mWM3v6eZG5p0MbFRl7IM4VZVzmhwtupIt/tVZYx/y6bFRkpsf5kLb
	 jNyXLVEg3krWoHqiJAJeueQguSgXgV502xPIwfMKDsJBq5oTKUw644aWNHdDZ4c4Ui
	 edKOg88t//Hhs8IVxDpQPqbLQlkysNMXo9z37pCYTNLvn+zGjV6Vip71Pe++vy/BIc
	 A5EjILmOauKQQ==
Date: Mon, 8 Sep 2025 15:16:33 +0100
From: Lee Jones <lee@kernel.org>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Robert Marko <robert.marko@sartura.hr>, linux@armlinux.org.uk,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	andi.shyti@kernel.org, broonie@kernel.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de, daniel.machon@microchip.com,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v9 4/9] mfd: at91-usart: Make it selectable for
 ARCH_MICROCHIP
Message-ID: <20250908141633.GB9224@google.com>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
 <20250813174720.540015-5-robert.marko@sartura.hr>
 <20250902100254.GD2163762@google.com>
 <769c8dc4-4db6-4d2e-aa2f-f86aa7ccaf78@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <769c8dc4-4db6-4d2e-aa2f-f86aa7ccaf78@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_071641_967181_2F1AB850 
X-CRM114-Status: GOOD (  21.74  )
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

On Thu, 04 Sep 2025, Nicolas Ferre wrote:

> On 02/09/2025 at 12:02, Lee Jones wrote:
> > On Wed, 13 Aug 2025, Robert Marko wrote:
> > 
> > > LAN969x uses the Atmel USART, so make it selectable for ARCH_MICROCHIP to
> > > avoid needing to update depends in future if other Microchip SoC-s use it
> > > as well.
> > > 
> > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > ---
> > >   drivers/mfd/Kconfig | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > > index 425c5fba6cb1..8f11b2df1470 100644
> > > --- a/drivers/mfd/Kconfig
> > > +++ b/drivers/mfd/Kconfig
> > > @@ -138,7 +138,7 @@ config MFD_AAT2870_CORE
> > >   config MFD_AT91_USART
> > >        tristate "AT91 USART Driver"
> > >        select MFD_CORE
> > > -     depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
> > > +     depends on ARCH_MICROCHIP || COMPILE_TEST
> > >        help
> > >          Select this to get support for AT91 USART IP. This is a wrapper
> > >          over at91-usart-serial driver and usart-spi-driver. Only one function
> > 
> > Let me know when the deps are in Mainline.
> 
> Hi Lee,
> 
> I have tags from other maintainers, how about you give us your and we make

My?  AB?

> this patch travel through arm-soc like the other ones?

Sure.

Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]

