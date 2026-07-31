Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A0BC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 10:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Egrzgru4rqzIVjakh/U1vCIEpyofNys52v5eb3pOQpY=; b=GYdssduY7bkqM1b5/ZWYwrhc6U
	Pcx6We3qvVirdacSghaYbYDxZ6YSc3YdpP3cWIMoBZCSgyvLcl8H2aRRGM3Y0gddmFwFwThV13coL
	gfOVC48ymJgphvE1grP0BijNGIbIiwlKJ9wvPNZbWb5k9K2RQC1zYKrG9qoM9xoRTgd1ms/e/wDyw
	vbcXwmD2SUMJQERK3eR40bFxon2J8s6TDUyprmDKfgiuNvDtj/q7Cx9yKEUKmq+DCYsd9m87Xv273
	BVhv0BDU7DoGjKg5xhxDo8Ke+1D95Xsz3F48kItmqWDYLNy0OMKfKNm46mWgzsb+mv53Fir9I3p9O
	iF6SLumA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpk5H-0000000CGss-0Qvk;
	Fri, 31 Jul 2026 10:03:19 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpk5A-0000000CGrh-1rzE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 10:03:17 +0000
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 0CE995C3173;
	Fri, 31 Jul 2026 12:03:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1785492188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Egrzgru4rqzIVjakh/U1vCIEpyofNys52v5eb3pOQpY=;
	b=BIYYK5bNBZm5aNWO5x+yb4BytXI/n4VIxD+AGZVlP9wNtJS9MzJyXeNwLbV8GF6QISw6QE
	hI04U3GxvBAKNSojaby9x0FO0PiOISdYYw+AeiANQB5SEGjygnHwSprS4lWlNO/NbV2z54
	8VQf7fkPY4/pKyAN/M2vSx8ldueLnIw=
MIME-Version: 1.0
Date: Fri, 31 Jul 2026 12:03:07 +0200
From: Stefan Agner <stefan@agner.ch>
To: Paolo Abeni <pabeni@redhat.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>, Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
Subject: Re: [PATCH net v2] net: stmmac: resume PHY before hardware setup when
 opening the interface
In-Reply-To: <2946c0f7-1c79-4890-a4b3-94141f42bc1a@redhat.com>
References: <message-id-of-your-v1-mail>
 <20260707195425.405989-1-stefan@agner.ch>
 <c8cbf359-e224-44c6-8692-9e1d1527ae0c@bootlin.com>
 <2946c0f7-1c79-4890-a4b3-94141f42bc1a@redhat.com>
Message-ID: <2f7fc28f777ce870e30e400640418c71@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_030312_932936_51E827B6 
X-CRM114-Status: GOOD (  19.65  )
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

Hi Paolo, hi Maxime,

On 2026-07-21 10:12, Paolo Abeni wrote:
> Hi,
> 
> On 7/8/26 11:16 AM, Maxime Chevallier wrote:
>> On 7/7/26 21:54, Stefan Agner wrote:
>>> Since the referenced commit, changing the MTU on a running interface no
>>> longer disconnects and reconnects the PHY; __stmmac_release() merely
>>> stops phylink, which also suspends the PHY (BMCR power-down) when WoL
>>> is not enabled. __stmmac_open() then performs the DMA software reset in
>>> stmmac_hw_setup() before phylink_start() resumes the PHY again.
>>>
>>> IEEE 802.3 22.2.4.1.5 allows a PHY to stop its receive clock while
>>> powered down, and stmmac requires a running receive clock for the DMA
>>> software reset to complete (the phylink config sets mac_requires_rxc).
>>> On such setups, e.g. the RK3566-based Home Assistant Green with an
>>> RTL8211F-VD PHY in RGMII mode, any runtime MTU change now times out and
>>> leaves the interface dead:
>>>
>>>   rk_gmac-dwmac fe010000.ethernet end0: Failed to reset the dma
>>>   rk_gmac-dwmac fe010000.ethernet end0: stmmac_hw_setup: DMA engine initialization failed
>>>   rk_gmac-dwmac fe010000.ethernet end0: __stmmac_open: Hw setup failed
>>>   rk_gmac-dwmac fe010000.ethernet end0: failed reopening the interface after MTU change
>>>
>>> In the field this is triggered by NetworkManager applying an MTU while
>>> activating the connection, breaking networking entirely.
>>>
>>> Resume the PHY in __stmmac_open() before the hardware setup, making it
>>> the counterpart of the phylink_stop() in __stmmac_release(), like
>>> stmmac_resume() already does for the same reason. phylink_start() also
>>> resumes the PHY, but only after stmmac_hw_setup(), and it cannot be
>>> moved before the hardware setup since it may bring the link up
>>> immediately from a workqueue, racing with the initialization (see the
>>> comment in stmmac_resume()). For the regular ndo_open path the PHY has
>>> just been attached and is not suspended, in which case
>>> phylink_prepare_resume() does nothing.
>>>
>>> Fixes: db299a0c09e9 ("net: stmmac: move PHY handling out of __stmmac_open()/release()")
>>> Link: https://github.com/home-assistant/operating-system/issues/4858
>>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>> 
>> I was able to reproduce the issue on imx8mp and socfpga. Adding this case to
>> my periodic test list...
>> 
>> Indeed the assymetry isn't very nice, OTOH there's not phylink counterpart
>> for phylink_prepare_resume(). This helper was added for the suspend/resume
>> case, and only for it as the doc states, it just happens to do exactly
>> what we need to fix the issue :
>> 
>> /**
>>  * phylink_prepare_resume() - prepare to resume a network device
>>  * @pl: a pointer to a &struct phylink returned from phylink_create()
>>  *
>>  * Optional, but if called must be called prior to phylink_resume().
>>  *
>>  * Prepare to resume a network device, preparing the PHY as necessary.
>>  */
>> void phylink_prepare_resume(struct phylink *pl)
>> 
>> I think this helper should be renamed and the doc updated, stmmac is the
>> sole user, and it's really about controlling that rxc and not about
>> suspend / resume. Resuming from suspend is just one of the cases where we
>> need that RXC early on.
>> 
>> So either something like 'phylink_prepare_start_or_resume' but it's long,
>> or maybe we can be more explicit about it and simply call it:
>> 
>> phylink_start_rxc(pl)
>> 
>> (without a corresponding stop)
> I read the above as a possible follow-up more than actual changes
> requested to this patch, am I correct?

Since this fixes a bug, I'd prefer to keep the patch minimal to make it
easier to backport. Therefor I would prefer to do make such structural
changes as a follow-up change rather than part of this patch.

Does that work for you, Maxime?

--
Stefan

