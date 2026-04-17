Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDA1F436BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 17:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGZoyyU5mHFyfI81hgTycgiqWkmpexYhWMgVjzucmMY=; b=a1aXHhpvq1K4oKLQZb1LJ1d+r7
	wwe9dXCdo1mtpx7OKja1uuDG+kDEuza6Eq3w4kfRIOs9qWKlJ6xRGL4GYEUueewEeTFf7QFx9DOiC
	+WJOGpQTxtGE5SMzjMw0oOkRturjh3mhrThWbmxjAF7UVGLrMY5u6fb+dhJ2m6JGtmzGVv3m9tEVC
	D5awpfts0l6vGrpmCdld6EnpShJ1dy+SJGb7WowegJp/m+FZEfYPFH+SXZ6DbYir00Rvb+teetZFb
	gltNkqik3X5ZPeZQOyml3+k64EeHnevf214J0tcn/8qA5DoZwvErHKJJjeU8EhOy8Jnf8AwjY14wy
	KoFc0H3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDn1j-00000004K3u-2P00;
	Fri, 17 Apr 2026 17:30:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDn1h-00000004K3Y-1XrY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 17:30:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TGZoyyU5mHFyfI81hgTycgiqWkmpexYhWMgVjzucmMY=; b=y73whGyibXvyVYNDNyPFnQAyMd
	eNY9QgXr6vi7KyuFwRNlaDo8k5tV+c+1/UEylcCLSaqrJP2gNkA8zSOSyey5havYeGQa4Vsy8QmX4
	0918cQy7oZdGrMy6KAypTjdiQtI9bC4T2/zcsWEp1a5TKgSl7pjvvLfFUEkvcrpA2yNM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wDn1R-00GRAd-By; Fri, 17 Apr 2026 19:30:29 +0200
Date: Fri, 17 Apr 2026 19:30:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 5/6] net: stmmac: move PHY handling out of
 __stmmac_open()/release()
Message-ID: <01f5e05f-31ab-4051-bc2a-9c331fcd9a95@lunn.ch>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
 <aeDSTIS9-TDSihbX@shell.armlinux.org.uk>
 <680c384c-135f-44cd-a2cd-7e4fd0ec4bf7@bootlin.com>
 <13939918.O9o76ZdvQC@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13939918.O9o76ZdvQC@steina-w>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_103045_437871_EF1FCBD5 
X-CRM114-Status: GOOD (  10.46  )
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

> Thanks for conforming this for another PHY. What I'm wondering right now:
> Why is the PHY stopped in the first place? We are just changing the MTU, no?

It is not too uncommon to see an MTU change destroying everything and
rebuilding it, especially when it was retrofitted into an older driver
which had fixed MTU.

> I have a proof of concept running, but it needs more cleanup due
> to code duplication.

You probably also want to take a look at the ethtool code for
configuring rings. Oh, it is even worse:

int stmmac_reinit_ringparam(struct net_device *dev, u32 rx_size, u32 tx_size)
{
        struct stmmac_priv *priv = netdev_priv(dev);
        int ret = 0;

        if (netif_running(dev))
                stmmac_release(dev);

        priv->dma_conf.dma_rx_size = rx_size;
        priv->dma_conf.dma_tx_size = tx_size;

        if (netif_running(dev))
                ret = stmmac_open(dev);

        return ret;
}

So not even using __stmmac_release() or __stmmac_open(), and leaving
you with a dead interface if there is not enough memory to allocate
the rings.

These paths should really share the same code.

      Andrew

