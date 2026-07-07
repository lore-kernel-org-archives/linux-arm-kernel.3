Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534DEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 18:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydta7jlti9j4LmIExsQGl//hnKkqR/izt7WQIkW8wSk=; b=YMs/0S2p396QMBOxaZ880i7Us3
	tUThrJZVCFz61RybpLLRjeQ9lHBove7j/L4isffJx7pIHcvKcK5AAtzougxUCjAKJm/GLusdFEp7a
	7XLOz0gRORCFPVSQNOoVWOUVThmdsf8CuOV70ByOlAhz+n1CY1DtLlWFFrnsdCMaOlYvNBr65xreB
	G6LcinPP8tvrJO9WHSmA8hz3kJIbBnTtwTrQ2cGuo7UAlOZ8pqaVBOcd4zYY084OAekp1Hio3IaPr
	XUG+tvdTjKf46lPCw4oCo8wIbeTyj1LDCFF25xwGLohIXMCrzu9V8Z+iM5g5DwFlTEA2pk6ZUhIoY
	3EQ+j+3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whAz6-0000000FfYw-1hgC;
	Tue, 07 Jul 2026 18:57:32 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whAz3-0000000FfYO-2RA6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 18:57:31 +0000
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id B379F5C53A1;
	Tue,  7 Jul 2026 20:57:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1783450646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ydta7jlti9j4LmIExsQGl//hnKkqR/izt7WQIkW8wSk=;
	b=VwgDDaMGjWsUqJunxOtrOFCt44wvbqum4Kq9eG2b5+LsgfyrmGES1P+nzQLAsMnLbDZVbi
	heOXAVXP0PMW0lVmjqKmCACcMKv6fJRCvlHJT4IAoaHFh+UYMRmVoCici37dfthuAyQpWB
	qiGsWVx+hibrDeatdSYGaoS4B163lJ4=
MIME-Version: 1.0
Date: Tue, 07 Jul 2026 20:57:26 +0200
From: Stefan Agner <stefan@agner.ch>
To: Jakub Raczynski <j.raczynski@samsung.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "Russell King
 (Oracle)" <rmk+kernel@armlinux.org.uk>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Ovidiu Panait
 <ovidiu.panait.rb@renesas.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
Subject: Re: [PATCH net] net: stmmac: resume PHY before reopening the
 interface on MTU change
In-Reply-To: <ak01QZhCKkq2FM33@AMDC4622.eu.corp.samsungelectronics.net>
References: <20260707162146.73823-1-stefan@agner.ch>
 <CGME20260707172005eucas1p2fdf3255132201e4e2c6fcc835fd2e805@eucas1p2.samsung.com>
 <ak01QZhCKkq2FM33@AMDC4622.eu.corp.samsungelectronics.net>
Message-ID: <75d9132549fce2298f581318e2d2e80f@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_115729_765968_69E11EB9 
X-CRM114-Status: GOOD (  12.50  )
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

On 2026-07-07 19:20, Jakub Raczynski wrote:
> On Tue, Jul 07, 2026 at 06:21:46PM +0200, Stefan Agner wrote:
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -5884,6 +5884,15 @@
>> 
>>  		__stmmac_release(dev);
>> 
>> +		/* phylink_stop() in __stmmac_release() suspends the PHY.
>> +		 * IEEE 802.3 allows PHYs to stop their receive clock while
>> +		 * powered down, but the DMA software reset performed by
>> +		 * stmmac_hw_setup() requires a running receive clock.
>> +		 * Resume the PHY, as on system resume, to ensure its clocks
>> +		 * are running before reopening the interface.
>> +		 */
>> +		phylink_prepare_resume(priv->phylink);
> 
> Does it work without warnings? Nothing in dmesg?

With this patch applied, this is the dmesg log on MTU change:
[   56.761175] rk_gmac-dwmac fe010000.ethernet end0: Register
MEM_TYPE_PAGE_POOL RxQ-0
[   56.762769] rk_gmac-dwmac fe010000.ethernet end0: Link is Down
[   56.801327] dwmac4: Master AXI performs any burst length
[   56.801368] rk_gmac-dwmac fe010000.ethernet end0: No Safety Features
support found
[   56.801409] rk_gmac-dwmac fe010000.ethernet end0: IEEE 1588-2008
Advanced Timestamp supported
[   56.801780] rk_gmac-dwmac fe010000.ethernet end0: registered PTP
clock
[   56.801804] rk_gmac-dwmac fe010000.ethernet end0: configuring for
phy/rgmii link mode
[   61.032985] rk_gmac-dwmac fe010000.ethernet end0: Link is Up -
1Gbps/Full - flow control off

> phylink_prepare_resume() does have ASSERT_RTNL() which is not called anywhere.

I am not very familiar with the codebase, but Fable states:

> RTNL is held here: ndo_change_mtu is invoked from netif_set_mtu_ext(),
> which calls netdev_ops_assert_locked() — for a driver without instance
> locking such as stmmac that is ASSERT_RTNL() — right before calling the
> driver op. 

What I can definitely confirm is that without this patch applied, a MTU
change does not succeed, with it applied MTU change works and the
network interface remains functional.

--
Stefan

