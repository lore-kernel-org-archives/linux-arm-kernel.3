Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5ACC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 13:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQ45r65/eICG0K3oXWSgWL9Ap6Foqy+lEFou18SI24A=; b=Rq496WK00lfdGpkNyMBE6XUqEn
	aF+CPHbZnXVCCNDEwQNEbFxDgHtlyi5a/CR3otgIpxRMt+J0d6GemrRPuqBFViDuFSkfo8BiBodVE
	HKihRzeg6ff5DKTmQqSW4hLP0iaPvelul8olFXrJX81fG5zLuBPqaNf5W4E3d57Zr4OtJLY+R2eXO
	6uWdIn+XI6jEcsSZF4epCM5iJBTaikPw4uP58zZNrRuUANduzSpTOpxjf4YRi6Z32uXVofOHoiOqH
	gkCg5ocapTSOakbAn4xS6jppPEckyql8rZH0XsWH6f66ZGPETfbzDgS0l81EUTWIdnUXRMcjvtHtF
	URq6rYbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6sg-0000000184T-2VqA;
	Thu, 20 Feb 2025 13:46:22 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6mC-000000016EF-2j5p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 13:39:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GQ45r65/eICG0K3oXWSgWL9Ap6Foqy+lEFou18SI24A=; b=CYXwOHmy+1GP64C83m4rlns27N
	pEq8rW4Z/fLtOI8sMzqMjILB5WKu33wuRMYsFEBhwZfet4mFi/4IKt3DyQ/QE0LVwFp3IjaOTrsUw
	doit/kIEHYq1LufuNCHrQevICeHbk6Eoz8AptY65evxvg9+uDhC2Fqofdw2F+VREn0Nc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tl6lw-00FyQq-Nk; Thu, 20 Feb 2025 14:39:24 +0100
Date: Thu, 20 Feb 2025 14:39:24 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lukasz Majewski <lukma@denx.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm: clk: Add ETH switch clock description for vf610 SoC
Message-ID: <5a9d9eef-f2ca-4168-aca4-4419dcfcacb6@lunn.ch>
References: <20250219114936.3546530-1-lukma@denx.de>
 <3cebe152-6326-454c-9da6-5cf5a64f71c9@lunn.ch>
 <20250219233802.20ec53e5@wsk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219233802.20ec53e5@wsk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_053940_685660_F3F66903 
X-CRM114-Status: GOOD (  30.42  )
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

On Wed, Feb 19, 2025 at 11:38:02PM +0100, Lukasz Majewski wrote:
> Hi Andrew,
> 
> > On Wed, Feb 19, 2025 at 12:49:36PM +0100, Lukasz Majewski wrote:
> > > The NXP's vf610 soc is equipped with L2 switch IP block from More
> > > Than IP (MTIP) vendor.
> > > 
> > > It requires special clock (VF610_CLK_ESW) to be operational.  
> > 
> > So you have a driver for this switch? It has been talked about in the
> > past, but nobody made any progress with it. Ah, it was you in 2020.
> 
> Yes, I'm going to try another time to upstream it.... :-)
> 
> > It
> > will be interesting to see what you came up with in the end, pure
> > switchdev or a DSA driver.
> 
> I think it would be:
> 
> 1. Standalone driver, which would configure the L2 switch from the very
> beginning to work (this is different from FEC on imx28/vf610 where
> switch is bypassed)
> 
> 2. It will use the in-switch registers to have two network interfaces
> separated. As a result - it may be slower than the fec_main.c in this
> use case.

Seems like a reasonable compromise. You would only load this driver if
you intend to make use of the switch...

> 3. When somebody call "bridge ..." on it - then the in-switch
> separation would be disabled. This is the "normal" state of operation
> for L2 switch, which would be a HW accelerator for bridging.
> 
> 4. The switchdev would be used to manage it
> 
> 5. This would be just a very simple driver - just bridging and startup
> of the L2 switch.
> 
> After we would have a consensus (i.e. it would be pulled to mainline) -
> I would proceed further.
> 
> I will try to not touch fec_main.c driver - just write standalone, new
> for MoreThanIP L2 switch driver.

It might make sense to refactor the MDIO code into a helper which both
can share? No point duplicating that.

> If somebody would like to use FEC, then he will insert the proper
> module. If switch, another one can be inserted, depending o the target
> use case.

This all seems like a reasonable way forward.

MoreThanIP is now part of Synopsys. I wounder if this IP now exists in
other SoCs? The press release however suggests Synopsys was
interesting in the high speed interfaces, not a two ports Fast
Ethernet switch.

	Andrew

