Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B39BCD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 23:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDHskcalX1Eyf5uU4t/aR1BqkGPnh3W34m8qlSr4iSY=; b=nrnsVTMVx+C4GwmtWPQCyv45ao
	Uunwl0TygnVcwX71vON1ZpTDB0EiorsWD982Twm/zWHeGEERsgeXvj48Rak5MBaEf1OTIUozToK2X
	I3PCCCBVZTM58KEDbXi6ofpUH32dBtDcnqAdx7FBH2LjR6chMra6UdYZbWP+yGMYBXMqI+pj63I9n
	QqLZN0rrVHgaM16j1BZ5MhP2iNIEHfPUUuUSddrMXZss61kbfH2LI0CEwHhI1cts63JHidCcWkQo/
	34GT0sUG1kthd1O/lersLoaUPU7SKXJpXeSkhAIWlXjIfduLIIx5q1uQdgWvJbAqXgbOiUSnIp8Cq
	fMRK/hrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHAy-0000000EyW4-1Rev;
	Mon, 15 Jun 2026 23:57:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHAs-0000000EySk-1otU;
	Mon, 15 Jun 2026 23:57:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D9CC2436B4;
	Mon, 15 Jun 2026 23:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15D791F00A3A;
	Mon, 15 Jun 2026 23:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781567821;
	bh=fDHskcalX1Eyf5uU4t/aR1BqkGPnh3W34m8qlSr4iSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mlTm9La1e0PbaoG/565k376Z7ZCfCgpox1mynJ7RroJibim8k/kSsGsiaEZ8gTNKa
	 Lt1aOHaq8+DYXADx1lL51u2FfCCYRjSDaOSUi8hg88zbBEEXpfZKDsImEiLv29pw8y
	 u0LAB5GO6wxDuwN4ycTFKeALNH2IJYOhdlVX2hKmh9q5jmfVSqqyKV8OBAxmZwd8+n
	 mtCX+Er52/f/SzKn4UofoIwWpvSwBEZh9QwYhBawPgG7kr4VBahNHGUubXoAC+pD43
	 2+ZmEJwoDTZDovIX46ufp5e47L4GDnT1teBNxFDs/NPdxfgxnWbkDdhUelGfRSWGGI
	 SUkw8h4sS5xJw==
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
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 8/8] net: dsa: mt7530: implement port_change_conduit op
Date: Mon, 15 Jun 2026 16:57:00 -0700
Message-ID: <20260615235700.1060843-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <8dd8cfe32bc8e38b92c49e30a6255090fb0998fb.1781312667.git.daniel@makrotopia.org>
References: <8dd8cfe32bc8e38b92c49e30a6255090fb0998fb.1781312667.git.daniel@makrotopia.org>
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
net: dsa: mt7530: implement port_change_conduit op

Implements the port_change_conduit operation for the mt7530 driver,
updating the port matrix to forward to a new CPU port. The op is
restricted to MT7531 because MT7530/MT7621 cannot honour per-port CPU
affinity for trapped frames and the MT7988/EN7581/AN7583 switches have
only a single CPU port.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index c96420c291d5..2f3e734b9f53 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -3206,6 +3206,34 @@ static int mt753x_set_mac_eee(struct dsa_switch *ds, int port,
>  	return 0;
>  }
>  
> +static int
> +mt753x_port_change_conduit(struct dsa_switch *ds, int port,
> +			   struct net_device *conduit,
> +			   struct netlink_ext_ack *extack)
> +{
> +	struct dsa_port *new_cpu_dp = conduit->dsa_ptr;
> +	struct dsa_port *dp = dsa_to_port(ds, port);
> +	struct mt7530_priv *priv = ds->priv;
> +
> +	if (priv->id != ID_MT7531)
> +		return -EOPNOTSUPP;

[Low]
Should this branch populate the supplied extack with NL_SET_ERR_MSG_MOD()
before returning -EOPNOTSUPP?

Because port_change_conduit is registered in the shared mt7530_switch_ops
table, the DSA core's fallback message in dsa_user_change_conduit() ("Driver
does not support changing DSA conduit") is bypassed; that branch only runs
when ds->ops->port_change_conduit is NULL. Neither dsa_port_change_conduit()
nor __dsa_port_change_conduit() in net/dsa/port.c synthesize an extack on
callback failure either.

The result is that on MT7530, MT7621, MT7988, EN7581 and AN7583, userspace
invoking IFLA_DSA_CONDUIT receives EOPNOTSUPP with an empty extack, with
none of the per-chip context that the commit message itself spells out
(single CPU port; MT7530 MFC CPU_PORT trapping limitation). Would a short
NL_SET_ERR_MSG_MOD() naming the reason be appropriate here?

> +
> +	mutex_lock(&priv->reg_mutex);
> +
> +	/* dp->cpu_dp still points to the old CPU port */
> +	priv->ports[port].pm &= ~PCR_MATRIX(BIT(dp->cpu_dp->index));
> +	priv->ports[port].pm |= PCR_MATRIX(BIT(new_cpu_dp->index));
> +	if (priv->ports[port].enable)
> +		regmap_update_bits(priv->regmap, MT7530_PCR_P(port),
> +				   PCR_MATRIX_MASK, priv->ports[port].pm);
> +
> +	mutex_unlock(&priv->reg_mutex);
> +
> +	mt7530_port_fast_age(ds, port);
> +
> +	return 0;
> +}

