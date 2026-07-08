Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0DFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 09:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOMFD/APDtG7nBqOMYfX/IhIsViQVFXVhI6H/yMdvHo=; b=blPs9vRDWzcvx2ivio0s2F6p1T
	XMoFt1Mi5EfXbObF1qMFdvB84fTabSjeh26qoYIaucNDA4tUHkqkEmndN5nzqq7vhSpB+WWknxPPr
	sMJxZ/tcCawq8d2NHm/Ltc3ZfIL6M6XzqchR6KJ6gWhL6oF7YDQU02tkijaiidP0ZI4SGgJU4Xin+
	hrVc7rWX25ywxr9lqGNmpUEDVJY4/BeIqyrNH/l1/ACAcEvNeZuTRiD/xl+lfj9k8errA2zZMCqGw
	bQHUCIrvEC8OBu6H/WSVNcaJ2XUNUMHF8Zy32/uFljKtibw8P3+j4Il93jcu3RRcB1GraQs6HzJNv
	lm6rAfSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whOOC-0000000Gj5y-1BPJ;
	Wed, 08 Jul 2026 09:16:20 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whOO6-0000000Gj4z-3Q5n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 09:16:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 06C91C8F445;
	Wed,  8 Jul 2026 09:16:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1BF8F60337;
	Wed,  8 Jul 2026 09:16:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83A6411BC0CFE;
	Wed,  8 Jul 2026 11:16:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783502168; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=qOMFD/APDtG7nBqOMYfX/IhIsViQVFXVhI6H/yMdvHo=;
	b=ru94O26T43mlxL2cIBX5lzUbVlmEHXENjSYkidWcZ4fB4BNAHeZORh+6LVllswrshyMRUK
	g6u6c/gM9RhAgallDLmQti6HwsxELEQnBgJBybPJs3xohzndsgOBdfnCj0PjjDn+i0gCqU
	xOKqt8v/5ye+ltJaHOKVGQeHGNAUcWIs1Tnbn4GDJ6dKyAo4Ys5Lj+Q0NI9y/GhJkQ5twI
	M3/vuMt7PSK5rwxB1ZZQsGt1v0Dzz+FhCeMhgmBCTb+VGEgUsFI6/DK+Jirpz8G44nTq8H
	LQv9+McURbD8FwAiF8+uG4UkjhFt9G1RiApWT4mIwi3DFKgsvUQEQkQw1Kt8xw==
Message-ID: <c8cbf359-e224-44c6-8692-9e1d1527ae0c@bootlin.com>
Date: Wed, 8 Jul 2026 11:16:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: stmmac: resume PHY before hardware setup when
 opening the interface
To: Stefan Agner <stefan@agner.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
References: <message-id-of-your-v1-mail>
 <20260707195425.405989-1-stefan@agner.ch>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260707195425.405989-1-stefan@agner.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_021615_022727_0EE3A813 
X-CRM114-Status: GOOD (  18.57  )
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

Hi Stefan,

On 7/7/26 21:54, Stefan Agner wrote:
> Since the referenced commit, changing the MTU on a running interface no
> longer disconnects and reconnects the PHY; __stmmac_release() merely
> stops phylink, which also suspends the PHY (BMCR power-down) when WoL
> is not enabled. __stmmac_open() then performs the DMA software reset in
> stmmac_hw_setup() before phylink_start() resumes the PHY again.
> 
> IEEE 802.3 22.2.4.1.5 allows a PHY to stop its receive clock while
> powered down, and stmmac requires a running receive clock for the DMA
> software reset to complete (the phylink config sets mac_requires_rxc).
> On such setups, e.g. the RK3566-based Home Assistant Green with an
> RTL8211F-VD PHY in RGMII mode, any runtime MTU change now times out and
> leaves the interface dead:
> 
>   rk_gmac-dwmac fe010000.ethernet end0: Failed to reset the dma
>   rk_gmac-dwmac fe010000.ethernet end0: stmmac_hw_setup: DMA engine initialization failed
>   rk_gmac-dwmac fe010000.ethernet end0: __stmmac_open: Hw setup failed
>   rk_gmac-dwmac fe010000.ethernet end0: failed reopening the interface after MTU change
> 
> In the field this is triggered by NetworkManager applying an MTU while
> activating the connection, breaking networking entirely.
> 
> Resume the PHY in __stmmac_open() before the hardware setup, making it
> the counterpart of the phylink_stop() in __stmmac_release(), like
> stmmac_resume() already does for the same reason. phylink_start() also
> resumes the PHY, but only after stmmac_hw_setup(), and it cannot be
> moved before the hardware setup since it may bring the link up
> immediately from a workqueue, racing with the initialization (see the
> comment in stmmac_resume()). For the regular ndo_open path the PHY has
> just been attached and is not suspended, in which case
> phylink_prepare_resume() does nothing.
> 
> Fixes: db299a0c09e9 ("net: stmmac: move PHY handling out of __stmmac_open()/release()")
> Link: https://github.com/home-assistant/operating-system/issues/4858
> Signed-off-by: Stefan Agner <stefan@agner.ch>

I was able to reproduce the issue on imx8mp and socfpga. Adding this case to
my periodic test list...

Indeed the assymetry isn't very nice, OTOH there's not phylink counterpart
for phylink_prepare_resume(). This helper was added for the suspend/resume
case, and only for it as the doc states, it just happens to do exactly
what we need to fix the issue :

/**
 * phylink_prepare_resume() - prepare to resume a network device
 * @pl: a pointer to a &struct phylink returned from phylink_create()
 *
 * Optional, but if called must be called prior to phylink_resume().
 *
 * Prepare to resume a network device, preparing the PHY as necessary.
 */
void phylink_prepare_resume(struct phylink *pl)

I think this helper should be renamed and the doc updated, stmmac is the
sole user, and it's really about controlling that rxc and not about
suspend / resume. Resuming from suspend is just one of the cases where we
need that RXC early on.

So either something like 'phylink_prepare_start_or_resume' but it's long,
or maybe we can be more explicit about it and simply call it:

phylink_start_rxc(pl)

(without a corresponding stop)

Maxime


