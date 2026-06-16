Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78194CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 00:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzApdNind1Co5Xbcn1rQaSPzEq7He8P/6Dkl73QhY40=; b=mrvfRwyE1lJavQmxW/DM19rc3S
	wrLpCPtgYRSkVvphR0iiki1Atrzn09q4LgbYoklrSFVvPnGXS00jd++UsOmNXrdoBDp/pd8Ro0y6K
	gEjNukKx65o8is88YDP5Qzon8H9B2xSPn5WeSXsC2S3FZSAwXvIWsA47WbQ4AiGE4PTBJNJZ3ArLx
	TjrrYTPwMu3e4T+0bRAP4qSmOktamhdMN+66fb/8sH9uxs7OzswLc2/bVjuvMOFou6V5Z4P0xgGnR
	tiPpOSlNrI2+Q0YGsiiZCmStu3WVOa30BoAXmsWmNdAjX1tInbPORjg7SHRsioIfvwxgtGINAhQFK
	iZb32zlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHSd-0000000EzsI-4AZ4;
	Tue, 16 Jun 2026 00:15:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHSd-0000000Ezs4-0NCd;
	Tue, 16 Jun 2026 00:15:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9509A418E2;
	Tue, 16 Jun 2026 00:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6DC11F000E9;
	Tue, 16 Jun 2026 00:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781568922;
	bh=WzApdNind1Co5Xbcn1rQaSPzEq7He8P/6Dkl73QhY40=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=T+q5pju7LWkXd6Y1SVay308qFKHCSGXe8YQWAXzQQLRhoLNOLXzV1F73822ZYC85z
	 IlLlAvhIYmnN2QcfASlc1yAUZBKFXbPxLRFkLNMQIP75jyeBK17y/t+KCYA92cfKLG
	 EsciXIYoR4P/Eg+1zcRDmKU3MCSWZICwYbbZw7RXTy5UYG+RHOWq5Ar2qa0LOSCFdr
	 hVM8Ensq68LbFj1dR0BQNVGO2Gw4mqnJAwZU84AxQ3b0Cae7bYWTqpkNcF6xO0aEqM
	 8tV3Ffsx2SGbMKO4SVbFHPsPUX4WSq/XHLwt1FSiQgs1nIeRVj08Z+NTxrMc6Hg3Lt
	 giATJZ4GSttxQ==
Date: Mon, 15 Jun 2026 17:15:21 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: daniel@makrotopia.org
Cc: chester.a.unal@arinc9.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 5/8] net: dsa: mt7530: replace mt7530_read
 with regmap_read
Message-ID: <20260615171521.60d93bf1@kernel.org>
In-Reply-To: <20260615235649.1060736-1-kuba@kernel.org>
References: <c6fc9cfae9762bf8d8a136339c91d4a76a307355.1781312667.git.daniel@makrotopia.org>
	<20260615235649.1060736-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 15 Jun 2026 16:56:49 -0700 Jakub Kicinski wrote:
> >  static u32
> > -mt7530_read(struct mt7530_priv *priv, u32 reg)
> > +mt7530_mii_poll(struct mt7530_dummy_poll *p)
> >  {
> > -	int ret;
> >  	u32 val;
> >  
> > -	ret = regmap_read(priv->regmap, reg, &val);
> > -	if (ret) {
> > -		WARN_ON_ONCE(1);
> > -		dev_err(priv->dev,
> > -			"failed to read mt7530 register\n");
> > -		return 0;
> > -	}
> > +	regmap_read(p->priv->regmap, p->reg, &val);
> >  
> >  	return val;
> >  }  
> 
> [Medium]
> The old wrapper guaranteed val == 0 on failure. The new mt7530_mii_poll()
> declares val without an initializer and ignores the regmap_read() return
> code, so on a failed underlying transfer val is whatever was on the stack.
> 
> Looking at drivers/net/dsa/mt7530-mdio.c::mt7530_regmap_read():
> 
>     ret = bus->write(bus, priv->mdiodev->addr, 0x1f, page);
>     if (ret < 0)
>         return ret;
> 
>     lo = bus->read(bus, priv->mdiodev->addr, r);
>     hi = bus->read(bus, priv->mdiodev->addr, 0x10);
> 
>     *val = (hi << 16) | (lo & 0xffff);

This looks legit, AFAICT, sadly.

Maybe just write *val = 0; in mt7530_regmap_read() unconditionally ?

