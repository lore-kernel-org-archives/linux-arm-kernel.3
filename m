Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114A4E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 08:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bxS4ncPpbKlMnJQoKFd8UWkTSQivyZ8RY8LCYQtrmNo=; b=vFdwfGN563JSUPv+5ClqEhop5o
	yMC6XVI5WI9EcKz/9CCERFXx+ZBXQFUb8Ec9JqQGBeqIj+td842YVxwmJgSAW1BeBIKFBo4tpa7mJ
	XU0RV7uK2K6ns6Ixvtqf0CXLW+OxAPRyLiQdj91ugcnKUnuh5h3nz4SYsRcFdWWeyogTtRSds/WnM
	AdAqoe6tI0euAQYCzpaYF9+I3YTDpaHO8PTHHCfdOfTiE44eribD/D4QMO9JBAcGvF7me0H+gi9a6
	waACsqHnVtgC16R8Lp1Zzc/ylVWqKpFGNkDRxqaMmvPVLTVmIUA2sPXnCzW0IcpQ+bCEnZakvJaST
	dlVYfE2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6KO-00000009N3i-35kr;
	Mon, 16 Dec 2024 08:19:44 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6JH-00000009MuY-1ma1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 08:18:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52484FF802;
	Mon, 16 Dec 2024 08:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734337111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bxS4ncPpbKlMnJQoKFd8UWkTSQivyZ8RY8LCYQtrmNo=;
	b=L6g0QXKdxrWm0q1CYYnXC6J2ukMS3d5pJImPPr7qQ8cAMergObjjMlyk2MwqGMnTc8SCGH
	yyGyr79Fb8aXS207hHSHxL726xEHZTIC5Z8XMPbHzK0SuSLkghGPD3DJj0QgBm5Vj4w6Ls
	jKgPjmvahPDAHsoRhdwxP56NAR6njisU6iY+EUK9WRpxgASltWnc3m4E3YJYyKqR+OO/FD
	bSECcVFfm++Hv018s7qg4qJ25q7YlhhUle5G9sVksvlJ3zC0Nv40gl5yT83MJ4ZXMboV2S
	m9e6sMIKILAFiAEweWN7L0Dtmlzf4qqVHs5iTgcFgk1M9+J9JSTSdQycndxAkA==
Date: Mon, 16 Dec 2024 09:42:24 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-socfpga: Set interface
 modes from Lynx PCS as supported
Message-ID: <20241216094224.199e8df7@fedora.home>
In-Reply-To: <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
References: <20241213090526.71516-1-maxime.chevallier@bootlin.com>
	<20241213090526.71516-3-maxime.chevallier@bootlin.com>
	<Z1wnFXlgEU84VX8F@shell.armlinux.org.uk>
	<20241213182904.55eb2504@fedora.home>
	<Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_001835_735580_8568D2B6 
X-CRM114-Status: GOOD (  17.52  )
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

Hello Russell,

On Fri, 13 Dec 2024 19:21:38 +0000
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> > > However, maybe at this point we need to introduce an interface bitmap
> > > into struct phylink_pcs so that these kinds of checks can be done in
> > > phylink itself when it has the PCS, and it would also mean that stmmac
> > > could do something like:

[...]

> > > and not have to worry about this from individual PCS or platform code.  
> > 
> > I like the idea, I will give it a go and send a series for that if
> > that's ok :)  
> 
> I've actually already created that series!

Woaw that was fast ! I'll review and give it a test on my setup then.

Maybe one thing to clarify with the net maintainers is that this work
you've done doesn't replace the series this thread is replying to,
which still makes sense (we need the
stmmac_priv->phylink_config.supported_interfaces to be correctly
populated on socfpga).

Thanks a lot for that work Russell,

Maxime

Thanks a lot,

Maxime

