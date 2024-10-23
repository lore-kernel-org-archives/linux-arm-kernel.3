Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B6DD2E029
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWMCtfx+f9goH/EvNBYNi1nk/RhHCZ5dymLbo1iBFTo=; b=JxIW/l2YF4PvINbJOfUjQD9UWr
	oZcTUnbHjfUMlKX/1zFP6H227/MA3FN8PfVaG7RFoy21I7aQMebCoN4KPJt2IZP8iYSfdf/Bd00lB
	k0wuGxFSa46MwoUcgTZiKWqhxUD9XxJbmgdGuV0RNoMe+/MAwsfCk1VPcf1ukV1Mkcfk5CouGTciX
	LSeGtRL1RnQOJ73p7OS7NncbZIiTq0N5VSKbUrbcHzs/ZF4sRrdJzk7ibhQQK7QckRm6uB2RBrFgK
	aV5WbGt1lCkRR6ORmnLbDMus0648yJJ7L/mGCLE2Zh9q97U+XFyZizgJt+fRIr+4OWkYUCDIPoCH2
	NLyC97Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XDq-0000000Dg3P-01CV;
	Wed, 23 Oct 2024 09:00:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3X3M-0000000DdI9-2zZ2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 08:49:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6F462A444AE;
	Wed, 23 Oct 2024 08:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC8DC4CEC6;
	Wed, 23 Oct 2024 08:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729673355;
	bh=7NhjULpJR19EvTFu6kukQjms/KFY1lUVI61YeGXteK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mCa7dn6prblg2R6KnQjb+AXq101pO4zTQ6kdNO0cGMRoSxe4p8mcSY11kut/o4ARa
	 VIb3+v0Ulxo4NjOxCI69dz3NnHfyMuLr5lUiqauOKBRGtmpjo85QQfoOkC/cvvbOq/
	 nNafENibQaC0pa/HBqLQku9SGDNagfPnOFHMa28Dm+8nzXTSZQEwRZTdCnHMd7sfLx
	 Vn04n7/iJ0IeP/lcMgNlGbsEUsvemJANyJVFPQrp5+D8yNtayXxm9X7ilTIqRotpLs
	 bB1EuQxYmNO/KtQ9wtLYYD/uAmHQD5WePX+P/GW2Ogbm1QTbREYOVHB+XoPZWvhBWH
	 oLU+MCJztxvCQ==
Date: Wed, 23 Oct 2024 09:49:10 +0100
From: Simon Horman <horms@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Cc: 2694439648@qq.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	hailong.fan@siengine.com
Subject: Re: [PATCH v1] net: stmmac: enable MAC after MTL configuring
Message-ID: <20241023084910.GL402847@kernel.org>
References: <tencent_CCC29C4F562F2DEFE48289DB52F4D91BDE05@qq.com>
 <20241021130554.00005cf5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021130554.00005cf5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_014916_904186_26968988 
X-CRM114-Status: GOOD (  26.41  )
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

On Mon, Oct 21, 2024 at 01:05:54PM +0800, Furong Xu wrote:
> On Mon, 21 Oct 2024 09:03:05 +0800, 2694439648@qq.com wrote:
> 
> > From: "hailong.fan" <hailong.fan@siengine.com>
> > 
> > DMA maybe block while ETH is opening,
> > Adjust the enable sequence, put the MAC enable last
> > 
> > For example, ETH is directly connected to the switch,
> > which never power down and sends broadcast packets at regular intervals.
> > During the process of opening ETH, data may flow into the MTL FIFO,
> > once MAC RX is enabled. and then, MTL will be set, such as FIFO size.
> > Once enable DMA, There is a certain probability that DMA will read
> > incorrect data from MTL FIFO, causing DMA to hang up.
> > By read DMA_Debug_Status, you can be observed that the RPS remains at
> > a certain value forever. The correct process should be to configure
> > MAC/MTL/DMA before enabling DMA/MAC
> > 
> > Signed-off-by: hailong.fan <hailong.fan@siengine.com>
> > 
> 
> A Fixes: tag should be added.

Also, as this patch is a fix for net, that target should be noted in the
subject.

  Subject: [PATCH v2 net] ...

Please address this and the issues raised by Furong Xu and post a v3.

> >  static void dwxgmac2_dma_stop_rx(struct stmmac_priv *priv, void __iomem *ioaddr,
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index e21404822..c19ca62a4 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -3437,9 +3437,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
> >  		priv->hw->rx_csum = 0;
> >  	}
> >  
> > -	/* Enable the MAC Rx/Tx */
> > -	stmmac_mac_set(priv, priv->ioaddr, true);
> > -
> >  	/* Set the HW DMA mode and the COE */
> >  	stmmac_dma_operation_mode(priv);
> >  
> > @@ -3523,6 +3520,9 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
> >  	/* Start the ball rolling... */
> >  	stmmac_start_all_dma(priv);
> >  
> > +	/* Enable the MAC Rx/Tx */
> > +	stmmac_mac_set(priv, priv->ioaddr, true);
> > +
> 
> This sequence fix should be applied to stmmac_xdp_open() too.
> 
> >  	stmmac_set_hw_vlan_mode(priv, priv->hw);
> >  
> >  	return 0;
> 
> It is better to split this patch into individual patches, since you are
> trying to fix an issue related to several previous commits:
> dwmac4, dwxgmac2, stmmac_hw_setup() and stmmac_xdp_open()

And each patch should have an appropriate Fixes tag.

-- 
pw-bot: changes-requested

