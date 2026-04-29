Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498C5FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 23:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3rUOLcSf4gwU7t6QJELeHz1xJS/vBkGU+U7yFU8cxw=; b=q6+2EvfltlAQ8vd3ax4DD8c7VT
	yPNSJ92JKn+RqtVRT+aUyjTeTNclgJZaoGD0n2elfPt0dnlg8o3jNkexgWNri9R4Cb8uDETdVWtz4
	DXohZc/pwGcLZfHAUmzl3Mg85Gp8VfA7+ybl1S+gVFEaXTyW6xJWl5FV5Xc7BuP28Do0FfSz4cYL6
	WmPdsrE8ONJuUqAsWU4fHX7lxrKZbU7JxB6OMBrfbVt5sFxc2r9V5JiIIueS3OvMekgLXOLde8lqh
	egzQyT8MGssciF5H88Iwn8/Iq/5gqRn8cSv1FsDitfgDMVREOVPvqtyzAvcLCa3nyj4LCslFFWPS7
	1eCzjs6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIEbn-00000004Jd3-29Y0;
	Wed, 29 Apr 2026 23:46:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIEbl-00000004Jct-3a34;
	Wed, 29 Apr 2026 23:46:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4731F6024D;
	Wed, 29 Apr 2026 23:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550CFC19425;
	Wed, 29 Apr 2026 23:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777506380;
	bh=AKOnTbZ/fLlnqhqvD803u8VOuwIHV1SefABXb7khWUg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D0PEiJXTVUTImHN8honj78SrualSm/j5yLbUEUOXiOK1OjBSPZsl52CI0BNJzqCYG
	 nt2llUvANFTSpjicOlBbOtmpJfwNjyRRbIAsS+IzZncuzvNGPoutdzaTDaxUI1W+iT
	 2p41QuGxnTg2hpBIwpZNliUtdP1y2NEsUcZlA6WOdb7GCeT6jjUw8g/OMrh86E6wYj
	 vA6u+4X20/AGINeIj4OdFJltsygijPsdieLFqgJjgiwi3KXa1EHC18RW3II6S1VKYf
	 OwP2OdCALu6nMSsjEnJSCvbM/79J1OqA1CP4x06eERkhIzdREJQ8chZxK7tYEhFwxX
	 QZIrvewMVCEPw==
From: Jakub Kicinski <kuba@kernel.org>
To: daniel@makrotopia.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	chester.a.unal@arinc9.com,
	andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux@armlinux.org.uk,
	ansuelsmth@gmail.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v4] net: dsa: mt7530: fix .get_stats64 sleeping in atomic context
Date: Wed, 29 Apr 2026 16:46:13 -0700
Message-ID: <20260429234612.2240476-2-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <16efd278e4f17776ccfbf8491e5be71a4689c137.1777385305.git.daniel@makrotopia.org>
References: <16efd278e4f17776ccfbf8491e5be71a4689c137.1777385305.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: dsa: mt7530: fix .get_stats64 sleeping in atomic context

This commit introduces a delayed workqueue to asynchronously poll MIB counters
for MDIO-connected switches. This caches the results so they can be returned
safely without sleeping in the atomic .get_stats64 callback.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index b9423389c2ef..66bff861a921 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c

[ ... ]

> @@ -3137,9 +3187,25 @@ mt753x_setup(struct dsa_switch *ds)
>  	if (ret && priv->irq_domain)
>  		mt7530_free_mdio_irq(priv);
>  
> +	if (!ret && priv->bus) {
> +		spin_lock_init(&priv->stats_lock);
> +		INIT_DELAYED_WORK(&priv->stats_work, mt7530_stats_poll);
> +		mt7530_stats_refresh(priv);
> +		schedule_delayed_work(&priv->stats_work,
> +				      MT7530_STATS_POLL_INTERVAL);
> +	}
> +
>  	return ret;
>  }

[ ... ]

> @@ -3409,6 +3476,9 @@ mt7530_remove_common(struct mt7530_priv *priv)
>  
>  	dsa_unregister_switch(priv->ds);
>  
> +	if (priv->bus)
> +		cancel_delayed_work_sync(&priv->stats_work);

Could this call cancel_delayed_work_sync() on an uninitialized work struct
if the driver is unbound before the DSA switch tree completes?

The priv->bus pointer is initialized during probe. However,
INIT_DELAYED_WORK() is only called in mt753x_setup(), which might never
execute if the DSA tree remains incomplete.

If the driver is unbound in this state, mt7530_remove_common() will evaluate
priv->bus as true and pass a zero-initialized work struct to
cancel_delayed_work_sync(). This usually triggers lockdep ("trying to
register non-static key") and debugobjects ("assert_init not available")
warnings.

Would it be better to move the INIT_DELAYED_WORK() call into the probe
path or track whether the setup function was actually completed?
-- 
pw-bot: cr

