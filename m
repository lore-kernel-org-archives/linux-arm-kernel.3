Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15372D277F0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 15:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUHVAoAREYLF1TzcvPdgfaRGlq1lrNPziR3WwRPXhq4=; b=MrRQ1O9m0OmFDeflaKdWyF5LNM
	GwJhWl2m0IG5a1uAlpmjW2MIGfZckwQJQL7gXLHtL+UO9qs+SYnnSFbcB9/4NHf92YPry66XjUmey
	NUxCrE/VxVT5eDZSYS9agBVJchYMOdGyGL+bIcAuVXWXezD5bm4OhZN3D5QbwFLMNdXmTOnvc5Ma8
	iZ/r+YLR6PbAJ+jvqecRMqGxB6JNp9SZ0se0rC+cd3UUIxC9g5tFHCe04fohf0VJ0O1W2zWHyoZue
	dSXc2lFXh4Gz7efv2Ej4op75K98RLaXovQU/6bJ40R83vwPBpYB6ORNF7gXItRKIg2z0FC/10We2y
	zNqW9r0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vebBr-00000003Wqr-36gY;
	Sat, 10 Jan 2026 15:47:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vebBo-00000003WqW-3xaJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 15:47:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nUHVAoAREYLF1TzcvPdgfaRGlq1lrNPziR3WwRPXhq4=; b=A0iYr7prmMiASSL1AOz8/XgGnp
	ovZha2vbY0r/bjN1U7KLi7QQ95Ls88EQ7rWpiXyuL4qd5r5L5sAxP6f18XrMYnZfdbPpXk+CATM+k
	7hyz++Y0TvK6+c6JaSPTlVYElOR7Ov9sUzc4dGjAtrF6+Mc8Ev73r4UOwQBLJdlJaVVlaOk9Yz91e
	0EFZdcfLSQC9+VcyGqk7RdkISvlDd9/jUERKYAM1CLejmpG+vYtP50qQE3HqPSiGJ4gsrh0MS5trN
	Pk1sI854m9fkkLK88dF6pD/ZIrKSKrM6I04zOdgPRGmSAfZgxygS1zea+BnrP0mGVUT8dwzXKd7Bt
	lbHi5hXQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53048)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vebBV-000000004qn-3BkF;
	Sat, 10 Jan 2026 15:47:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vebBR-000000004Mx-2YK5;
	Sat, 10 Jan 2026 15:47:21 +0000
Date: Sat, 10 Jan 2026 15:47:21 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, francesco.dolcini@toradex.com,
	robh@kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH RESEND net-next v2] net: stmmac: dwmac: Add a fixup for
 the Micrel KSZ9131 PHY
Message-ID: <aWJ0iV6-_4XqpeHD@shell.armlinux.org.uk>
References: <20260105100245.19317-1-eichest@gmail.com>
 <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
 <aVuxv3Pox-y5Dzln@eichest-laptop>
 <a597b9d6-2b32-461f-ac90-2db5bb20cdb2@lunn.ch>
 <aVvp70S2Lr3o_jyB@eichest-laptop>
 <aVvwOYce1CFOLiBk@shell.armlinux.org.uk>
 <aVv7wD2JFikGkt3F@eichest-laptop>
 <aWC_ZDu0HipuVhQS@eichest-laptop>
 <8f70bd9d-747f-4ffa-b0f2-1020071b5adc@bootlin.com>
 <aWJXNSiDLHLFGV8F@eichest-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWJXNSiDLHLFGV8F@eichest-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_074745_291585_7B5EDCA2 
X-CRM114-Status: GOOD (  11.28  )
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

On Sat, Jan 10, 2026 at 02:42:13PM +0100, Stefan Eichenberger wrote:
> Hi Maxime,
> 
> Not problem, thanks a lot for the feedback and the discussion. I will
> then proceed with the current approach and send a new version with an
> updated commit message.

We could add a flag to:

/* Generic phy_device::dev_flags */
#define PHY_F_NO_IRQ            0x80000000
#define PHY_F_RXC_ALWAYS_ON     0x40000000

indicating that the MAC requires the full preamble, which the PHY can
then test for and configure appropiately.

The question is, whether the requirement for the full preamble applies
to many MACs, and whether there are PHYs that default to producing
short preambles.

Looking at Marvell 88e151x, the only control it has is to pad odd
nibbles of preambles on copper (page 2, register 16, bit 6.)

AR8035 seems to make no mention of preamble for the MII interfaces, so
I guess it has no control over it.

I've not looked further than that.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

