Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CFEF99C88
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 18:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FnOo4DBqc9z3yprR5F+4D1BbbX9kRlkofnogug2d28=; b=wS+jJ7JLl2usXtesLRZvMDqaCt
	GGhmcOfn+04RHhLGCVKsY92S7tZuSqH4hQizEfokFDAFGrHFzjhK9/OQF1nF9w1tpjBe3XkgXMUZu
	YveTbrRxldx8OoWpmmzy2U0VC6UuGsP9CVzom3Z1d/xrUNRqYhw9/Ec1h04fZ+wyjbB30Z00/nFUM
	L5k4mrMqLarbWP7vtn4T+p7293/UINExJPt+VoAFquEDp2agjGlV4wPKM2PVKj6EwEHlzz1XiDGgR
	ZZK5jHXTcXagWfr8qCSvggzlnJQpxvq78f4d8FAOV7eJnA6ZI3EJd5mxTiEf3VdJFGWsP3mGWxwNE
	DcSCrB1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wE9yc-000000058Gd-3zao;
	Sat, 18 Apr 2026 18:01:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wE9ya-000000058GS-1FFG;
	Sat, 18 Apr 2026 18:01:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CA8256013A;
	Sat, 18 Apr 2026 18:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89E5C19424;
	Sat, 18 Apr 2026 18:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776535262;
	bh=gfCnfVv+6IRcfetQm4ukDI1hhxp2kXNRzZ9OCpuJKNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SL4xBmWncX6eqD+Qm1sWsTokqcFl7OJjdnW78wvTqznlWwnlGOPgAeYOdt+tSHreM
	 lucAOmker/15lTJ7qHtbOpD8KvLvJ6T/SwIK+MEqob6e8rQLm/OPXS7ARA876Rj4aF
	 3MdICvlTEnFiyfk+e4b1PnnQ2oduHC4CMHzMRBmEIbJ0ti51rSd8GR6jxDfT7BJnRZ
	 ya58Xw3R4RQgt2fQ43dT16NkQkmD/bk5c6E6Ipn9HEJzLtgDPsn2GFuNCIg/+8W0c7
	 oXVvGWTi89TJagM34DfJKpQEK9lNBAZyiEU619mdHuA/fWvdPk13LUq0SGbu/B9bp3
	 qfbmo9fCekeYw==
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
	linux-mediatek@lists.infradead.org,
	frank-w@public-files.de,
	john@phrozen.org
Subject: Re: [PATCH net] net: dsa: mt7530: fix .get_stats64 sleeping in atomic context
Date: Sat, 18 Apr 2026 11:01:00 -0700
Message-ID: <20260418180100.131392-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <79dc0ec5b6be698b14cb66339d6f63033ca2934a.1776397542.git.daniel@makrotopia.org>
References: <79dc0ec5b6be698b14cb66339d6f63033ca2934a.1776397542.git.daniel@makrotopia.org>
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
Subject: net: dsa: mt7530: fix .get_stats64 sleeping in atomic context

This commit addresses a sleep-in-atomic bug when reading MDIO-connected
switch port statistics by delegating the register reads to a delayed
workqueue. The get_stats64 callback now returns cached values protected
by a spinlock instead of synchronously reading from the MDIO bus.
MMIO-connected switches are unaffected and continue to read counters
directly.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index b9423389c2ef0..786d3a8492bcb 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c

[ ... ]

> @@ -951,6 +952,43 @@ static void mt7530_get_stats64(struct dsa_switch *ds, int port,
>  			       &storage->rx_crc_errors);
>  }
>  
> +static void mt7530_stats_poll(struct work_struct *work)
> +{
> +	struct mt7530_priv *priv = container_of(work, struct mt7530_priv,
> +						stats_work.work);
> +	struct rtnl_link_stats64 stats = {};
> +	struct dsa_port *dp;
> +	int port;
> +
> +	dsa_switch_for_each_user_port(dp, priv->ds) {
> +		port = dp->index;
> +
> +		mt7530_read_port_stats64(priv, port, &stats);
> +
> +		spin_lock(&priv->stats_lock);

Are we at risk of a deadlock here?

The get_stats64 callback can be called by dev_get_stats(), which runs in
softirq context.

If this delayed work runs in process context and is preempted by a softirq
that attempts to acquire the lock via dev_get_stats(), a deadlock could
occur. Both paths should likely use spin_lock_bh() and spin_unlock_bh().

> +		priv->ports[port].stats = stats;
> +		spin_unlock(&priv->stats_lock);
> +	}
> +
> +	schedule_delayed_work(&priv->stats_work,
> +			      MT7530_STATS_POLL_INTERVAL);
> +}
> +
> +static void mt7530_get_stats64(struct dsa_switch *ds, int port,
> +			       struct rtnl_link_stats64 *storage)
> +{
> +	struct mt7530_priv *priv = ds->priv;
> +
> +	if (priv->bus) {
> +		spin_lock(&priv->stats_lock);
> +		*storage = priv->ports[port].stats;
> +		spin_unlock(&priv->stats_lock);
> +		mod_delayed_work(system_wq, &priv->stats_work, 0);

Could this unconditional background refresh cause a denial of service on
the MDIO bus?

If an unprivileged user continually reads network statistics in a tight
loop, mt7530_stats_poll() will execute continuously, potentially starving
other MDIO tasks like PHY link-state monitoring.

Additionally, is it possible for this call to re-arm the workqueue during
teardown?

In mt7530_remove_common(), cancel_delayed_work_sync() is called before
dsa_unregister_switch(). If get_stats64() is called during or after
dsa_unregister_switch(), it would re-arm the workqueue after it was
explicitly cancelled, potentially causing a use-after-free when priv is
freed.

> +	} else {
> +		mt7530_read_port_stats64(priv, port, storage);
> +	}
> +}

[ ... ]

> @@ -3137,6 +3175,13 @@ mt753x_setup(struct dsa_switch *ds)
>  	if (ret && priv->irq_domain)
>  		mt7530_free_mdio_irq(priv);
>  
> +	if (!ret && priv->bus) {
> +		spin_lock_init(&priv->stats_lock);
> +		INIT_DELAYED_WORK(&priv->stats_work, mt7530_stats_poll);
> +		schedule_delayed_work(&priv->stats_work,
> +				      MT7530_STATS_POLL_INTERVAL);

If dsa_register_switch() encounters an error after this setup callback
completes successfully, the DSA core will attempt to clean up.

Since mt7530_switch_ops does not implement a teardown callback to cancel
this delayed work, will the work remain scheduled and eventually
dereference freed priv memory once the driver core frees it via devres?

> +	}
> +
>  	return ret;
>  }
-- 
pw-bot: cr

