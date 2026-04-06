Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F62F46C59
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 16:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JmUEiDUzB/d9b/qanJMLIiDxDt0VTx0SbrbgQo9fEow=; b=2Cv6vOQSbGELS3eSStwRKjxDnJ
	OOb9KXKHyMpTxyNFmSjyl/sz7B76A1pdI3dODECNdKAYLlEbPVYV12VHd22tRl9mor2rbPLZYR9Pa
	yneURXPlmsOuDC938DoAoBjcW4ZvwO1bv5mGtc6nPYZNlgwJEPp/1bciyicIDENRNgEMve/M6yhTN
	fI437QjR8JyKjlEZD98Q5DNfrdDolDoCjReJrTcDKx4fyHonJDulrmaoXWf96MDlRsy/c9vr+b2pi
	q5jygYJPKVEGtggdqSX4UHMxIHpJLDVq2yJY4kbZz92hzcCPEaWZH5hlOgklsa5fPAffqjhKNaB3F
	M/DH6yKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9n5y-00000005Kbt-0lSx;
	Mon, 06 Apr 2026 16:46:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9n5u-00000005KbS-3Beo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 16:46:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JmUEiDUzB/d9b/qanJMLIiDxDt0VTx0SbrbgQo9fEow=; b=SiVGeKcCZ4Ko1Gig+ppZMpDo1/
	KG4HxlpvM+wMoozcXKVM/PzJQQhqCmRTI+Ok/vgi9GnfuRsnKENdjnXEiFoG9PdbdcR4/P9KprbnU
	6OcVQ2kbtBpRsBAurTC2Yob1IgCjKVFf4i8/LSbmzGiAkmj1wJZFwdrBZp6m701PL+bhcmX8OK4Li
	F2eIoGst+Uu0AM2g0QxCaFmfGyIGAG+H2v5sTX6hzW2cm+dXOq0WYcyaA6N5rO1+yRXgvew8QU/im
	WozeUgmbg6BymjPjShU9YrkRevLbNkFWBN6NwEiDCQUhIlr7Iha8xTJ2clM/zr4Siq44GSChY7C1a
	4oZ2rj4w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38218)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w9n5j-000000008Ja-1kAT;
	Mon, 06 Apr 2026 17:46:23 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w9n5g-000000001Re-2IJt;
	Mon, 06 Apr 2026 17:46:20 +0100
Date: Mon, 6 Apr 2026 17:46:20 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Julian Braha <julianbraha@gmail.com>, davem@davemloft.net,
	peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
	mcoquelin.stm32@gmail.com, kuba@kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] stmmac: cleanup dead dependencies on STMMAC_PLATFORM
 and STMMAC_ETH in Kconfig
Message-ID: <adPjXKz-UNgyLzAl@shell.armlinux.org.uk>
References: <20260402145858.240231-1-julianbraha@gmail.com>
 <CAMuHMdUfzVSQpadJYpEqPJ_UOBAgswnGzD_bp_U3U6jt2dy0dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUfzVSQpadJYpEqPJ_UOBAgswnGzD_bp_U3U6jt2dy0dg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_094635_086699_A6906A62 
X-CRM114-Status: GOOD (  20.23  )
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

On Mon, Apr 06, 2026 at 10:23:46AM +0200, Geert Uytterhoeven wrote:
> Hi Julian,
> 
> On Thu, 2 Apr 2026 at 17:07, Julian Braha <julianbraha@gmail.com> wrote:
> > There are already 'if STMMAC_ETH' and 'STMMAC_PLATFORM'
> > conditions wrapping these config options, making the
> > 'depends on' statements duplicate dependencies (dead code).
> >
> > I propose leaving the outer 'if STMMAC_PLATFORM...endif' and
> > 'if STMMAC_ETH...endif' conditions, and removing the
> > individual 'depends on' statements.
> >
> > This dead code was found by kconfirm, a static analysis tool for Kconfig.
> >
> > Signed-off-by: Julian Braha <julianbraha@gmail.com>
> > Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> > v2: add back default STMMAC_PLATFORM for DWMAC_GENERIC
> > Link to v1: https://lore.kernel.org/all/20260331125817.117091-1-julianbraha@gmail.com/
> 
> Thanks for your patch, which is now commit e2f152c822cf5d37 ("stmmac:
> cleanup dead dependencies on STMMAC_PLATFORM and STMMAC_ETH in
> Kconfig") in net-next.
> 
> > --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > @@ -20,7 +20,6 @@ if STMMAC_ETH
> >  config STMMAC_SELFTESTS
> >         bool "Support for STMMAC Selftests"
> >         depends on INET
> > -       depends on STMMAC_ETH
> >         default n
> >         help
> >           This adds support for STMMAC Selftests using ethtool. Enable this
> > @@ -29,7 +28,6 @@ config STMMAC_SELFTESTS
> >
> >  config STMMAC_PLATFORM
> >         tristate "STMMAC Platform bus support"
> > -       depends on STMMAC_ETH
> >         select MFD_SYSCON
> >         default y
> 
> This now lets us have STMMAC_PLATFORM=y and STMMAC_ETH=m.
> Does that actually link?

Really?

Let's try forcing it:

CONFIG_STMMAC_ETH=m
CONFIG_STMMAC_SELFTESTS=y
CONFIG_STMMAC_PLATFORM=y

and make oldconfig...

    STMicroelectronics Multi-Gigabit Ethernet driver (STMMAC_ETH) [M/n/y/?] m
      Support for STMMAC Selftests (STMMAC_SELFTESTS) [Y/n/?] y
      STMMAC Platform bus support (STMMAC_PLATFORM) [M/n/?] m

CONFIG_STMMAC_PLATFORM is forced to 'm'. 'y' is not permitted.

I think you're mistaken.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

