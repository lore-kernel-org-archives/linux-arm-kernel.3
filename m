Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B547C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 11:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1DdxlBwrHhow3M3zV5emyY7loKO7p/X/7X6nqt7mAI=; b=vPtTKguUnrA4RJ5TGlVQpyLJcI
	AVEtVbNCw70EaFc5/UcOy7y5QbOQ64J7REJyJqyuKqH/+Kn+Jcr0tMm+GbgVsULIU3m0AxrLG3335
	Qwzr0oytmFR8oT1DGN07KFqlfe+DZt/y4PIXoRbowVdzsernrFL7w4+2fLMkvbebTGIYebvxC1hes
	JF8wX4uBUYarlyCyPJuo9HCO7EOMMf2ImStGFkbj+DaB+bK4M8xbiFW5QJyskIHrpggPyqBzR2XZP
	Dra3JIgzHmC0Z0cBqp76lJyRDuTbFIXEubgOG1FW9H48nA7ImgBViaZqlekHGeNtqLV/khPpMa1rN
	/3Shk7JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqr45-0000000Gxk6-0sB3;
	Mon, 03 Aug 2026 11:42:41 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqr41-0000000GxjQ-2rAL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 11:42:39 +0000
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 965055C2478;
	Mon,  3 Aug 2026 13:42:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1785757353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1DdxlBwrHhow3M3zV5emyY7loKO7p/X/7X6nqt7mAI=;
	b=ONd7aAcB6Urqy1LY7slTlTyEmPDB/b9NLqK0THmD5GYDWNT6fZ4IP1xPuq1dFQ2vaYVIo5
	zdjkLHFBzW3L8TPWq2Gxc03OfnbP7X2gX5JF9hkunRuVeTOm1DWmBNHuwl/UnjCclpbigx
	0fYOxKgBNggJlDja79HWuyplyyWkhh0=
MIME-Version: 1.0
Date: Mon, 03 Aug 2026 13:42:31 +0200
From: Stefan Agner <stefan@agner.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "Russell King
 (Oracle)" <rmk+kernel@armlinux.org.uk>, Jakub Raczynski
 <j.raczynski@samsung.com>, Alexander Stein
 <alexander.stein@ew.tq-group.com>, Ovidiu Panait
 <ovidiu.panait.rb@renesas.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
Subject: Re: [PATCH net v3] net: stmmac: resume PHY before hardware setup when
 opening the interface
In-Reply-To: <2d2cdcea-4ae2-41e2-afcf-713c569da0d8@bootlin.com>
References: <20260803095156.132827-1-stefan@agner.ch>
 <2d2cdcea-4ae2-41e2-afcf-713c569da0d8@bootlin.com>
Message-ID: <4031d44e9ae41bd8be845538d27f41bd@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_044237_873827_C8C120C2 
X-CRM114-Status: GOOD (  15.07  )
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

Hi Maxime,

On 2026-08-03 12:36, Maxime Chevallier wrote:
> Hi Stefan,
> 
> On 8/3/26 11:51, Stefan Agner wrote:
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
>> activating the connection, breaking networking entirely. The same
>> regression has also been reported on i.MX8MP and reproduced on SoCFPGA
>> based systems.
>> 
>> Resume the PHY in __stmmac_open() before the hardware setup, making it
>> the counterpart of the phylink_stop() in __stmmac_release(), like
>> stmmac_resume() already does for the same reason. phylink_start() also
>> resumes the PHY, but only after stmmac_hw_setup(), and it cannot be
>> moved before the hardware setup since it may bring the link up
>> immediately from a workqueue, racing with the initialization (see the
>> comment in stmmac_resume()). For the regular ndo_open path the PHY has
>> just been attached and is not suspended, in which case
>> phylink_prepare_resume() does nothing.
>> 
>> Fixes: db299a0c09e9 ("net: stmmac: move PHY handling out of __stmmac_open()/release()")
>> Link: https://github.com/home-assistant/operating-system/issues/4858
>> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>> Assisted-by: Claude:claude-fable-5
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
> 
> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks for reviewing and testing!

> 
> Do you feel confident following-up with the phylink renames, or should
> I add that to my todolist ?

It takes me quite a bit of time since I am not much into kernel
development (anymore). I'd appreciate if you can do it.

--
Stefan

