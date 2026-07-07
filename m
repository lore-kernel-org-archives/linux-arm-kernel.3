Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA2DC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 19:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EHdhmWw8bTLtB+4kBs5YmjWw0Q5vkcur8qe9Menb+4Y=; b=4HgJZsCZva4iaXdkYrcSAhzZjB
	krilYNNJgoAZMVceBn32vQBL0xIwKf3PsgkaEp9+04NnjewxoX3d1UJCKUTEI4IFAj6SUVJtQYKfz
	REJOsWqry0Po2ROk4PR7Xb+CSUE5kTifcT3/ekK7NSgC6FLPQJ8noeyZcnK137CAiBzLw+eh0vtZa
	t+padADy4ui9k9XiDdGzgl+8b6G9rBnpyEGjBzXCGO7lPHlf+Fu7O9BOW+QdCZSw7RBHntE8BSSHW
	H1IpxOpzHqX1nTrBzmxxsSi5WE/WvMe0Q4pVGhXQRz+PVaQtN43PEk/Wo8PCuvHPzNuvqcxIprvxa
	yYbe5Dmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBC0-0000000FjZ8-3Mxd;
	Tue, 07 Jul 2026 19:10:52 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBBw-0000000FjYJ-3nzn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 19:10:51 +0000
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id BD6405C53A1;
	Tue,  7 Jul 2026 21:10:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1783451446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EHdhmWw8bTLtB+4kBs5YmjWw0Q5vkcur8qe9Menb+4Y=;
	b=YImG43wpWUITLr/OqWZqVeD0BxZ2LBxvqtZmsG2DdkJaZjaMFYFxOahbnLGZK4vqI0OFpt
	O1OW00LRxTMyo+WcuEIlcf+uteIvi6l2gnCqcdx3pUVrlS4MI5n1typ7DGgKYO0NLziA/V
	eB/QJLcSHzScGvpvrvemDA6L7E1NIEc=
MIME-Version: 1.0
Date: Tue, 07 Jul 2026 21:10:46 +0200
From: Stefan Agner <stefan@agner.ch>
To: Andrew Lunn <andrew@lunn.ch>
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
In-Reply-To: <a6515f8c-1358-4e2a-a485-2a25a7dc6313@lunn.ch>
References: <20260707162146.73823-1-stefan@agner.ch>
 <a6515f8c-1358-4e2a-a485-2a25a7dc6313@lunn.ch>
Message-ID: <9c8cdec3250eb3226d4f64ca8397cfa8@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_121050_689158_8063331B 
X-CRM114-Status: GOOD (  18.55  )
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

On 2026-07-07 20:50, Andrew Lunn wrote:
> On Tue, Jul 07, 2026 at 06:21:46PM +0200, Stefan Agner wrote:
>> Since the referenced commit, changing the MTU on a running interface no
>> longer disconnects and reconnects the PHY; __stmmac_release() merely
>> stops phylink, which also suspends the PHY (BMCR power-down) when WoL
>> is not enabled. __stmmac_open() then performs the DMA software reset in
>> stmmac_hw_setup() before phylink_start() resumes the PHY again.
>> 
>> IEEE 802.3 22.2.4.1.5 allows a PHY to stop its receive clock while
>> powered down, and stmmac requires a running receive clock for the DMA
>> software reset to complete (the phylink config sets mac_requires_rxc).
>> On such setups, e.g. the RK3566-based Home Assistant Green with an
>> RTL8211F-VD PHY in RGMII mode, any runtime MTU change now times out and
>> leaves the interface dead:
>> 
>>   rk_gmac-dwmac fe010000.ethernet end0: Failed to reset the dma
>>   rk_gmac-dwmac fe010000.ethernet end0: stmmac_hw_setup: DMA engine initialization failed
>>   rk_gmac-dwmac fe010000.ethernet end0: __stmmac_open: Hw setup failed
>>   rk_gmac-dwmac fe010000.ethernet end0: failed reopening the interface after MTU change
>> 
>> In the field this is triggered by NetworkManager applying an MTU while
>> activating the connection, breaking networking entirely.
>> 
>> Resume the PHY before reopening the interface, like stmmac_resume()
>> does, to ensure the receive clock is running for the DMA software
>> reset.
>> 
>> Fixes: db299a0c09e9 ("net: stmmac: move PHY handling out of __stmmac_open()/release()")
>> Link: https://github.com/home-assistant/operating-system/issues/4858
>> Assisted-by: Claude:claude-fable-5
>> Tested-by: Stefan Agner <stefan@agner.ch>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>> ---
>> Note: phylink_prepare_resume()'s kernel-doc says it is to be called
>> prior to phylink_resume(); here it is paired with phylink_start()
>> (called from __stmmac_open()) instead, which phylink_resume() itself
>> uses to restart the machinery. If preferred, I can extend the
>> kernel-doc or introduce a more generically named helper.
>> 
>>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>> 
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
>> +
>>  		ret = __stmmac_open(dev, dma_conf);
>>  		if (ret) {
>>  			free_dma_desc_resources(priv, dma_conf);
> 
> I'm not convinced.
> 
> __stmmac_open() and __stmmac_release() should be opposites of each
> other. If __stmmac_release() stops the clock, __stmmac_open() should
> start the clock.

Hm, I see. __stmmac_release() calls phylink_stop(). But from what I can
tell we can't simply move phylink_start() in __stmmac_open() since it
does too much. So we need to use phylink_prepare_resume() in
__stmmac_open(), so there is still some asymmetry. I'll send a v2.

--
Stefan

