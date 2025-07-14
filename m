Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D253C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 14:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TmleEhhVyOMAvmKR4twAxGwgQhrNxQ2pccvF+Yutx3I=; b=d0E+NXzewCTILdtuZ6PySPbZFj
	bMUGzgU8UprwR97B2xrh3oRDP7wAmp2rIAXuYVqOvNyX8vWK+16TeK6yrP1WL+tEgxVPui56+UpBz
	FhnVL3cUqgG5cLFRvz7SdxO00Aj2KFa5rCZCxz6RaT9uoopAQ15l6Y2C5ReSHkTWzd1Dz/Vnckq3Q
	4I/JV3K205ctMV6omMy/oUe2Z43HuYwk7EXzeCXueVQLMHUFVtjrVuSG5PrjO2VdUSH/Ttk67AdhD
	dvGHeF6AEtzrlutz16Dwv4T02BjAL88lw3PuaDxyqxaT7XJJN3NyA4qe3bJ9s42UB/Nh7kZnXV02C
	l7TTbjdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJu0-00000002Qk5-3S4D;
	Mon, 14 Jul 2025 14:11:32 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJcR-00000002NAz-1JSw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 13:53:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TmleEhhVyOMAvmKR4twAxGwgQhrNxQ2pccvF+Yutx3I=; b=UtBS/0chb+ZDH8y8RqGl2m7yeO
	uals07ZFQCEyENbaG0hmUouu0k1MOEE9tuQ9w1lbvRnHxN74m9jAD9TNxN09YNLhBuTiKXM5sIOh9
	s1IxAtvFuAVBtBbbzIWwXNkjBPu4ny0UXVcqerQIexBZ074ZoGLlgNjKIIDz3x+03Sko=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ubJcB-001SqZ-ID; Mon, 14 Jul 2025 15:53:07 +0200
Date: Mon, 14 Jul 2025 15:53:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Marvin Lin <milkfafa@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
	KWLIU@nuvoton.com, tmaimon77@gmail.com, kflin@nuvoton.com
Subject: Re: [PATCH] net: stmmac: Add NCSI support
Message-ID: <5b01bd9c-252c-41ac-adaa-dddda8ffd06b@lunn.ch>
References: <20250714053527.767380-1-milkfafa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714053527.767380-1-milkfafa@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_065323_352673_D322D532 
X-CRM114-Status: GOOD (  15.47  )
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

> -	ret = stmmac_reset(priv, priv->ioaddr);
> -	if (ret) {
> -		netdev_err(priv->dev, "Failed to reset the dma\n");
> -		return ret;
> +	if (!priv->plat->use_ncsi) {
> +		ret = stmmac_reset(priv, priv->ioaddr);
> +		if (ret) {
> +			netdev_err(priv->dev, "Failed to reset the dma\n");
> +			return ret;
> +		}
>  	}

Please break this patch up into a series and include good commit
messages. You can then explain why this change is safe.

>  	/* DMA Configuration */
> @@ -3643,6 +3646,14 @@ static void stmmac_hw_teardown(struct net_device *dev)
>  	clk_disable_unprepare(priv->plat->clk_ptp_ref);
>  }
>  
> +static void stmmac_ncsi_handler(struct ncsi_dev *nd)
> +{
> +	if (unlikely(nd->state != ncsi_dev_state_functional))
> +		return;
> +
> +	netdev_info(nd->dev, "NCSI interface %s\n", nd->link_up ? "up" : "down");

Please don't spam the kernel log. Only do prints if something goes
wrong.

> +}
> +
>  static void stmmac_free_irq(struct net_device *dev,
>  			    enum request_irq_err irq_err, int irq_idx)
>  {
> @@ -4046,14 +4057,16 @@ static int __stmmac_open(struct net_device *dev,
>  	if (ret < 0)
>  		return ret;
>  
> -	if ((!priv->hw->xpcs ||
> -	     xpcs_get_an_mode(priv->hw->xpcs, mode) != DW_AN_C73)) {
> -		ret = stmmac_init_phy(dev);
> -		if (ret) {
> -			netdev_err(priv->dev,
> -				   "%s: Cannot attach to PHY (error: %d)\n",
> -				   __func__, ret);
> -			goto init_phy_error;
> +	if (!priv->plat->use_ncsi) {
> +		if ((!priv->hw->xpcs ||

My understanding of NCSI is that you have an additional RGMII like
port feeding into the MAC. The MAC still has all its media machinery,
a PCS, PHY etc. Something needs to drive that PCS and PHY. So it would
be good to explain in the commit message why you are removing all
this.

	Andrew

