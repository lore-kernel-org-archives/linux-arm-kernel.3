Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E82D68B26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 14:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DyiD3ejpKkSu4mppJ+GQZe5KVQL/VUrRw8jSsk28p4=; b=G8joxeTl7uXuoLqfI4QO5RBZmJ
	7CwQgGtPJ/etM8Gx6ILo7OFC7W7h86JlJyrGrF0BXI+N9ulbIP1jxQL7UrG50rDt7x2XrLnphzkqs
	fkd/msT2fKDXCf4DOoZNq86pw9JgmMR9NNo1JXiSt3x+a3Mc4OkRy5rzEhvnqk0C4hrf95JnMOGFl
	7kEafHF8CcXdk51oi1VVwvNZf6fqdY04Bjq6oxNJbA6vzt4io8DhapAPmw+EqGkD9OF2rmySg3A1I
	o28PjTvaI78CdBAYWb3FV9kgD14yswA4r5WOXl9tfhwKNFa6N6XU4sw/LCpwuEIHVfGlH4+WLoRnK
	PqHya4mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBalD-0000000AC2R-1MXF;
	Thu, 14 Nov 2024 14:23:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBahD-0000000ABD1-3VNk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 14:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0DyiD3ejpKkSu4mppJ+GQZe5KVQL/VUrRw8jSsk28p4=; b=O3ta6huYE8104TF8jA5dPpYfrC
	XGQ+YiXAo+PzqMREZZzEfi/V9yb4N/GZXXIZ+yMv6AjEifbrygBdtC7Hf7c9/fEWnF6FPsiuiMXY7
	i5PqfQpZvKYO3+J0+FR5agPTqRkuAaSclbPC5lHnqvENomg+BS/mdONRl6bj85zJ0tkA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tBags-00DIzU-Ir; Thu, 14 Nov 2024 15:19:22 +0100
Date: Thu, 14 Nov 2024 15:19:22 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v1 2/2] net: stmmac: set initial EEE policy
 configuration
Message-ID: <a6cbf428-4672-4beb-8c55-e4d3ae684458@lunn.ch>
References: <20241114081653.3939346-1-yong.liang.choong@linux.intel.com>
 <20241114081653.3939346-3-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114081653.3939346-3-yong.liang.choong@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_061943_893623_4BDC47EE 
X-CRM114-Status: GOOD (  14.60  )
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

On Thu, Nov 14, 2024 at 04:16:53PM +0800, Choong Yong Liang wrote:
> Set the initial eee_cfg values to have 'ethtool --show-eee ' display
> the initial EEE configuration.
> 
> Fixes: 49168d1980e2 ("net: phy: Add phy_support_eee() indicating MAC support EEE")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 7bf275f127c9..5fce52a9412e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1204,7 +1204,7 @@ static int stmmac_init_phy(struct net_device *dev)
>  			netdev_err(priv->dev, "no phy at addr %d\n", addr);
>  			return -ENODEV;
>  		}
> -
> +		phy_support_eee(phydev);
>  		ret = phylink_connect_phy(priv->phylink, phydev);

Is supporting EEE a synthesis option, or is it always available?

Some EEE code is guarded by:

        if (!priv->dma_cap.eee)
                return -EOPNOTSUPP;

	Andrew

