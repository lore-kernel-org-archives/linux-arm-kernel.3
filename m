Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAA8E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 15:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+eGcF78PnRCgMjDMS2quanXGAcbh8iyhTUjv/20yif4=; b=kk9KYJ71WaPOL3JxRK6vg6a5MW
	h/JZln44erBINwlw6hPbSIH0hsCwfilad9qDSVB+vFLT6Yf0JmWEo3ul1+H6rxDsNPWpgwsAuCqGi
	sRjipCteSGix3QfJuAriiyZoeLM9pERY438BuBixFY5OL90IWe0qiUtWpMDw2GXIoMEAv4TxNjAkd
	JWTUESeq2evkotn44F+vJayjMV7XLWaP5WjfZevPnB918zt7E2/A83cC0iSfDHAg5vUMHmBR71+DA
	qrN1dvEpcoSHQylOp+sbzRRnZsfjaOvCwxvyLzS6qs1f/5TkUWe7Xl4ai3HlbcilGYi4oL/UhPCIT
	PmiDA+/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZBH-0000000DtNB-2z28;
	Tue, 17 Dec 2024 15:08:15 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZAA-0000000Dsy0-28rg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 15:07:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D11BB60009;
	Tue, 17 Dec 2024 15:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734448023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+eGcF78PnRCgMjDMS2quanXGAcbh8iyhTUjv/20yif4=;
	b=SybrRRdAVa2Ax8rFkE/tHwWK1Xxc+xoZXDJA7QbI6ffdDgfUtjl25UhREeafQ9s/BKMHZz
	c3QZmEFctAvFxDW2M/pwe7zcZDpYTO40Lh1C1lYqgguAhVGeRNistALf/X4S0gEP7dxhKo
	ay1dKhF+eFe/RYKGUJhARD6pTleL7Vomqcc1gmFJfHacSSCKy51a+wkAfjLK0MUU1EInZq
	zQB7YRqm9ydvmwz4DhcKuyRcr+d6FR5j+q2RlRM4vpXXPTBUV6rzPsCV/4LHEz/W/tbO8F
	idPN2p90Sa5oXPUPb5VmvGCFK5VcNMr9zqwgX9Ov2P3I8hdnMaedbeU3j/wUBQ==
Date: Tue, 17 Dec 2024 16:07:00 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-socfpga: Set interface
 modes from Lynx PCS as supported
Message-ID: <20241217160700.1b4256b4@fedora.home>
In-Reply-To: <20241217064907.0e509769@kernel.org>
References: <20241213090526.71516-1-maxime.chevallier@bootlin.com>
	<20241213090526.71516-3-maxime.chevallier@bootlin.com>
	<Z1wnFXlgEU84VX8F@shell.armlinux.org.uk>
	<20241213182904.55eb2504@fedora.home>
	<Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
	<20241216094224.199e8df7@fedora.home>
	<20241216173333.55e35f34@kernel.org>
	<20241217135932.60711288@fedora.home>
	<20241217064907.0e509769@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_070706_714343_02682C63 
X-CRM114-Status: GOOD (  13.76  )
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

On Tue, 17 Dec 2024 06:49:07 -0800
Jakub Kicinski <kuba@kernel.org> wrote:

> Let me triple check ;)
> 
> On Tue, 17 Dec 2024 13:59:32 +0100 Maxime Chevallier wrote:
> > - The priv->phylink_config.supported_interfaces is incomplete on
> > dwmac-socfpga. Russell's patch 5 intersects these modes with that the  
>                                    ^^^^^^^^^^
> > PCS supports :
> > 
> > +		phy_interface_or(priv->phylink_config.supported_interfaces,  
>                               ^^
> > +				 priv->phylink_config.supported_interfaces,
> > +				 pcs->supported_interfaces);
> > 
> > So without patch 2 in the series, we'll be missing
> > PHY_INTERFACE_MODE_1000BASEX in the end result :)  
> 
> "Or" is a sum/union, not intersection.
> 
> You set the bits in priv->phylink_config.supported_interfaces.
> Russell does:
> 
> 	priv->phylink_config.supported_interfaces |=
> 		pcs->supported_interfaces;
> 
> If I'm missing the point please repost once Russell's patches 
> are merged :)

Erf no I was missing the point, time to catch-up on some sleep I
guess... I read an 'and' and it was firmly stuck in my mind...

nevermind then, patch 2 isn't required anymore...

Maxime

