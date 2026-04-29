Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55107FF887E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 23:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5bn0vuze3NUtYdqxGOxl3AjzfEya3PXELIGy7zvCG8=; b=i9AidAA/heJn7my/kfSJCgnecs
	u9eC974IW4NPHn4AfdMo5s7lQ1CXiZ9+rxL6yv8TnDxTK4y/RtF56j57+FuieDo0zf8XTS77bOSXC
	/wnt7cD0IAPh8OtYBDw25GwQk5ZXC/jEz1aLGq4gLnu09qtjllF7Uv613d+LFYyjIZXWK5+hM1ibn
	0dz3zJJTfAeaZ/ELpt/63Ac1hjtj6kGSyvZluBt7T7Qq/qCOuPeNrgQEwdN6MLzzRrLeMxWtc7Pl6
	utKoR9hbZ//ZEaBjA44ba+j1W5HY2kzVaqCjKjPD4y/XwnLIZHsoyMCCkfnj6Qv6L9Qmw/IpK56ih
	Wm6cKxnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIEkT-00000004Jx4-2fGg;
	Wed, 29 Apr 2026 23:55:21 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIEkR-00000004JwW-0PT3;
	Wed, 29 Apr 2026 23:55:20 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wIEkC-000000005vx-440e;
	Wed, 29 Apr 2026 23:55:05 +0000
Date: Thu, 30 Apr 2026 00:55:01 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: chester.a.unal@arinc9.com, andrew@lunn.ch, olteanv@gmail.com,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux@armlinux.org.uk, ansuelsmth@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v4] net: dsa: mt7530: fix .get_stats64 sleeping in
 atomic context
Message-ID: <afKaVQ27GUQiWZTb@makrotopia.org>
References: <16efd278e4f17776ccfbf8491e5be71a4689c137.1777385305.git.daniel@makrotopia.org>
 <20260429234612.2240476-2-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429234612.2240476-2-kuba@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_165519_137867_60D66444 
X-CRM114-Status: GOOD (  20.75  )
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

On Wed, Apr 29, 2026 at 04:46:13PM -0700, Jakub Kicinski wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
> net: dsa: mt7530: fix .get_stats64 sleeping in atomic context
> 
> This commit introduces a delayed workqueue to asynchronously poll MIB counters
> for MDIO-connected switches. This caches the results so they can be returned
> safely without sleeping in the atomic .get_stats64 callback.
> 
> > diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> > index b9423389c2ef..66bff861a921 100644
> > --- a/drivers/net/dsa/mt7530.c
> > +++ b/drivers/net/dsa/mt7530.c
> 
> [ ... ]
> 
> > @@ -3137,9 +3187,25 @@ mt753x_setup(struct dsa_switch *ds)
> >  	if (ret && priv->irq_domain)
> >  		mt7530_free_mdio_irq(priv);
> >  
> > +	if (!ret && priv->bus) {
> > +		spin_lock_init(&priv->stats_lock);
> > +		INIT_DELAYED_WORK(&priv->stats_work, mt7530_stats_poll);
> > +		mt7530_stats_refresh(priv);
> > +		schedule_delayed_work(&priv->stats_work,
> > +				      MT7530_STATS_POLL_INTERVAL);
> > +	}
> > +
> >  	return ret;
> >  }
> 
> [ ... ]
> 
> > @@ -3409,6 +3476,9 @@ mt7530_remove_common(struct mt7530_priv *priv)
> >  
> >  	dsa_unregister_switch(priv->ds);
> >  
> > +	if (priv->bus)
> > +		cancel_delayed_work_sync(&priv->stats_work);
> 
> Could this call cancel_delayed_work_sync() on an uninitialized work struct
> if the driver is unbound before the DSA switch tree completes?
> 
> The priv->bus pointer is initialized during probe. However,
> INIT_DELAYED_WORK() is only called in mt753x_setup(), which might never
> execute if the DSA tree remains incomplete.
> 
> If the driver is unbound in this state, mt7530_remove_common() will evaluate
> priv->bus as true and pass a zero-initialized work struct to
> cancel_delayed_work_sync(). This usually triggers lockdep ("trying to
> register non-static key") and debugobjects ("assert_init not available")
> warnings.
> 
> Would it be better to move the INIT_DELAYED_WORK() call into the probe
> path or track whether the setup function was actually completed?

Not sure if this is real. The fix could be simply

	if (priv->bus && priv->ds->setup)
		cancel_delayed_work_sync(&priv->stats_work);

Anyone?

