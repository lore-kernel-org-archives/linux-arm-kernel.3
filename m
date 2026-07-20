Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84629C4452A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 13:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlzD1oIWZcgqtlHJyvOYZyeovWx8boVI5GczyJJmdNM=; b=nvGCS0fuHcb6ERW9P21+PGeXT8
	md7dSeXq5YIy+Rp1t8RgTao9dtu1Uenl9CkRAegqI+klzUVALvYJYZHBTgMTWaRWNU3XM45rmasfn
	vgIH5/3Ur8CcrEfEeetyPEcK9OSHp39DrgEw5foy+aBvuGJhiPM+iICPxTWEZZpi3ZSPp95vgplpk
	npCD5H0BE5Jx4ACS5sEB8mTYTbPKrIFLoTnC6EZHIZmFF/ga31RIpQU25uaeCIN9I/v0ZlFVVW+mW
	Tu6AqTQkBxCc/wYSZhydn5cjEY8qRZaHKXz1y+xRgsmGiEx4S0uFiyFQHRBBRU7g0x3jjcy1W6D0F
	IW3+d7oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloX0-00000006tOd-1lda;
	Mon, 20 Jul 2026 13:59:42 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloWx-00000006tNy-1qR4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 13:59:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KlzD1oIWZcgqtlHJyvOYZyeovWx8boVI5GczyJJmdNM=; b=QPmmlsbFhv1s2zDpi8igvIlVz5
	3eXsV4saOEzxsP73iUczhxXkV5au9ja7cmSo5yrAjWcStbd7cnHBVoGGUxir3Yws5lS2F1spLuq8Y
	7xtnJg1oAfG8b9J1m+el0HRagWrsSzWcPMOfdGpDgT/+m0RhV4Jd+XCE7FuJpRdjFBkw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wloWd-00DGmj-Np; Mon, 20 Jul 2026 15:59:19 +0200
Date: Mon, 20 Jul 2026 15:59:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Luis Lang <luis.la@mail.de>
Cc: netdev@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net v2] net: stmmac: dwmac4: mask interrupts when
 stopping DMA in suspend
Message-ID: <e390ad2f-b789-41e6-90cd-c8065ff007fa@lunn.ch>
References: <20260720111534.163416-1-luis.la@mail.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720111534.163416-1-luis.la@mail.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_065939_482437_FAFA75C4 
X-CRM114-Status: GOOD (  14.48  )
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

On Mon, Jul 20, 2026 at 01:15:29PM +0200, Luis Lang wrote:
> Since commit 1b9707e6f1a9 ("net: stmmac: enable RPS and RBU
> interrupts"), suspending causes an interrupt storm from the RPS
> interrupt.
> Fix this by adding a deinit_chan() op to stmmac_dma_ops, which
> masks all default dma channel interrupts. This is called from
> stmmac_stop_all_dma(), so interrupts don't trigger while suspending.
> 
> Fixes: 1b9707e6f1a9 ("net: stmmac: enable RPS and RBU interrupts")
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Suggested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Luis Lang <luis.la@mail.de>

Nice. Thanks for working on this.

These are the sort of patches i like to see. We see a lot of AI driven
patches fixing theoretical issues which nobody really cares about. The
submitter does not appear to understand what they are doing, maybe
compile tests it, but never boot it on real hardware.

You have built and booted lots of kernels, done git bisects, sent a
good bug report, done the work of actually fixing the problem with a
little help from us, and pretty much got the processes correct first
time. You have the basics for being a real kernel hacker. I would be
happy to receive more patches from you.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Thanks

    Andrew

