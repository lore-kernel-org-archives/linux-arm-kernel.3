Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C238D3EE8A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 16:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKZNUPjuUcl3IiH9k6+6nqxg1HkcAU/xUmRgMsq4Sgk=; b=LPGeWEGnpg3YmGnxk9bt/Extit
	1Dsg1UXBnbHT0rVjQBOKO7E2Gw21Wr5IoxwhTIXsCMgF3ImlmBhcEHLyOq6wkHNvocglbW4Ro/BnF
	NO8SxKgjvfVg8tqjFS5ag3ZeGWr/J7AzGfKnrr+qkeyvZl5nZNl+RmfA2qtUnBTebZZCJFWxRSzxv
	dcCSNc4cRfqudqOXxGULZ0VDX8SyPvfoVg85Nadoctq/esln2aKrGozy9WjGS+NLmv+UUft4R4j1I
	ueFjAT9rNJakqPrzVVrBjkom90HCoJytb52Wfu0Ob+23eYIs7v49yi3F+SGJufNTpxcWbiwKuwvmM
	72ZpCT0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vix9c-00000007Nkd-1VlC;
	Thu, 22 Jan 2026 16:03:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vix9Z-00000007NkC-2b2D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 16:03:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GKZNUPjuUcl3IiH9k6+6nqxg1HkcAU/xUmRgMsq4Sgk=; b=0XGPstaGKvgp6pakaMES7f0WAJ
	+9zfLPL944OOtUXCK1x7qXcdrXb+t3DXPH37LZqZEgHPihvNeS2zTOyp9jMkIIwGOeAwzkKjw31jn
	sqeFFSUdCVqvcNvGoRD1ua81TO7IinO/BH5Sd4Nz1gbOVY2vkRZ8Pp/0FpFUGzMkm54p9OdeMBtiY
	5RSK1z4FO1Ac3suhOa/iGzR4/mcIaH1XDW/4lPQ2HKy6PxkGXmM6Atzd/X5qP55Kmu1wwlSfacZsG
	YonhOxnvDHzt0VGLVp07pXX6WVdj5ovCebu5eWRnqblzHAmyUlEj3Fu27s7YeD6pXcYkTeQRw71z8
	ToTt42jw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51058)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vix9F-000000000dd-31Mk;
	Thu, 22 Jan 2026 16:03:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vix9A-0000000017C-2p65;
	Thu, 22 Jan 2026 16:03:00 +0000
Date: Thu, 22 Jan 2026 16:03:00 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Bo Gan <ganboing@gmail.com>, devicetree@vger.kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com
Subject: Re: Re: [PATCH v1 1/2] dt-bindings: ethernet: eswin: add clock
 sampling control
Message-ID: <aXJKNBAifG6qv80M@shell.armlinux.org.uk>
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080859.1285-1-lizhi2@eswincomputing.com>
 <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
 <aWKZvEW7rKFFwZLG@shell.armlinux.org.uk>
 <0d54ddca-9270-40a5-aa82-d8a7b65027ff@gmail.com>
 <1a622916.2d28.19bb105feab.Coremail.lizhi2@eswincomputing.com>
 <d010a6b8-5bf0-40ff-8e76-18362a238d50@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d010a6b8-5bf0-40ff-8e76-18362a238d50@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_080325_653942_76A2D7E8 
X-CRM114-Status: GOOD (  16.42  )
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

On Thu, Jan 22, 2026 at 02:27:34PM +0100, Andrew Lunn wrote:
> > We also intend
> > to upstream complete DTS files for EIC7700 so the bindings can be validated
> > against real hardware.
> 
> I suggest you prioritise this. ARM-SOC is pretty flexible for
> accepting work in progress support for new SoCs. All you really need
> is for the board to boot to a login prompt on a serial port using an
> initramsfs. So the .dtsi and .dts file can be very slim, CPUs, memory
> and UARTs.
> 
> Once you have that merged you can work on the other drivers, their
> bindings, etc.
> 
> As Russell pointed out, at the moment, most of the code you have in
> the kernel is unusable, so it is a candidate for being thrown out.

Indeed, and we've had drivers merged before for platforms that never
made it in, and they just hang around for decades, adding to the
maintainer's burden for no benefit what so ever.

So please, no more drivers for EIC7700 until there is functional
support for the platform, as Andrew states.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

