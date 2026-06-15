Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672DFCD98E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 23:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJvU7XOIbSyX9Zm4EZO5FyKhGmgcOkVUxZvYfOyaTQE=; b=zvr9fqpxYEi9GEof3RFzleBOYp
	Xv6kP96cA02SOviMhnnnapfUTfUbJWiqI6NAMu6pt+2ueueXsWDsIix77xqNEswbVBLx2xQoggcgN
	HvdLuRZW/yK5g+F8oLDJYUfyglVzjmhcTLTdSs7WaA70OFwI6QmQNC/aTV0bWtnmR4OK2SNLcZdC9
	Tls3ZFfimPsCJf/uvUQoHiRbNvhGrhFGlIlEzF7ea93QKJvh/U0VbngoyzWm8VOWP0ASO5eoTeLrW
	RzTPLBVLYd/wsrSb/yJX3B4/0ODLByxw4YQrkhjLNEQ66LcILl4DRU4aAjTSK8Z0B3G8a8hMgXbyw
	qS2m5hHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHAt-0000000EyTK-3FQH;
	Mon, 15 Jun 2026 23:57:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHAq-0000000EyRg-1qqq;
	Mon, 15 Jun 2026 23:57:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 35BD640C21;
	Mon, 15 Jun 2026 23:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D0491F000E9;
	Mon, 15 Jun 2026 23:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781567820;
	bh=kJvU7XOIbSyX9Zm4EZO5FyKhGmgcOkVUxZvYfOyaTQE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=csXy83IrQ+/9BMRoGJEi/VDlG3CXFWEBKqtWSWTCSusM3nwspAb6S2W8QCU5OwP6w
	 lTO9gFwH1kjLEN+UjdezTZhvdVpqa+uDLzXmd+noDXwbl+uTm75M9ow4ur7rOEu8r6
	 ofwkVyVhXJYX2U6unvGcsejPPVL95+/joy/DZdxoGu/6Bs9CeUSZ/QSzMHHQnRrf2G
	 VdPoKcUm+KEdchc5pvuOTQrFtB5bmWgI0lyhOOiVskDDLLGEv1e7N9kDPSrW7wKyS0
	 usmpyC6JdBMmNtt699G+Z3cFbp4XidIRz4zgjAR28+nL8UGbM1t1EXTy0RNn3C7NYI
	 QjvLYP1HSfDaA==
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
Subject: Re: [PATCH net-next v2 7/8] net: dsa: mt7530: implement port_fast_age
Date: Mon, 15 Jun 2026 16:56:58 -0700
Message-ID: <20260615235658.1060805-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <e6cdb705f0ec142283071e1966000d3a76f71a16.1781312667.git.daniel@makrotopia.org>
References: <e6cdb705f0ec142283071e1966000d3a76f71a16.1781312667.git.daniel@makrotopia.org>
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
Subject: net: dsa: mt7530: implement port_fast_age

This change adds a .port_fast_age operation for the mt7530 DSA driver.
The implementation triggers an ATC flush of all non-static MAC address
entries and polls ATC_BUSY for completion.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index dcf72ab0cd66..c96420c291d5 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -193,6 +193,21 @@ mt7530_fdb_cmd(struct mt7530_priv *priv, enum mt7530_fdb_cmd cmd, u32 *rsp)
>  	return 0;
>  }
>  
> +static void mt7530_port_fast_age(struct dsa_switch *ds, int port)
> +{
> +	struct mt7530_priv *priv = ds->priv;
> +	struct mt7530_dummy_poll p;
> +	u32 val;
> +
> +	/* Flush all non-static MAC address entries */
> +	val = ATC_BUSY | ATC_MAT_NON_STATIC_MAC | MT7530_FDB_FLUSH;
> +	regmap_write(priv->regmap, MT7530_ATC, val);

[High]
Should this transaction be serialised against priv->reg_mutex?

Every other accessor that touches MT7530_ATC wraps the write+poll
sequence in mutex_lock(&priv->reg_mutex)/mutex_unlock(&priv->reg_mutex).
For example mt7530_port_fdb_add(), mt7530_port_fdb_del(),
mt7530_port_fdb_dump(), mt7530_port_mdb_add() and mt7530_port_mdb_del()
all hold reg_mutex around the call to mt7530_fdb_cmd():

	mutex_lock(&priv->reg_mutex);
	mt7530_fdb_write(priv, vid, port_mask, addr, -1, STATIC_ENT);
	ret = mt7530_fdb_cmd(priv, MT7530_FDB_WRITE, NULL);
	mutex_unlock(&priv->reg_mutex);

If .port_fast_age runs concurrently with one of those operations, can
the two write-then-busy-poll sequences on the same MT7530_ATC register
overlap?

Could one thread's poll loop observe ATC_BUSY clearing for the other
thread's command, leading mt7530_port_fdb_dump() to read stale ATRD
data, or could one thread's freshly written ATC command be overwritten
by the other before the controller has executed it?

> +
> +	INIT_MT7530_DUMMY_POLL(&p, priv, MT7530_ATC);
> +	readx_poll_timeout(mt7530_mii_poll, &p, val,
> +			   !(val & ATC_BUSY), 20, 20000);
> +}

[Medium]
Is there a reason the return value of readx_poll_timeout() is ignored
here?

The structurally identical helper mt7530_fdb_cmd() in the same file
checks the result and emits a diagnostic on timeout:

	ret = readx_poll_timeout(mt7530_mii_poll, &p, val,
				 !(val & ATC_BUSY), 20, 20000);
	if (ret < 0) {
		dev_err(priv->dev, "reset timeout\n");
		return ret;
	}

Peer DSA drivers also log on failure (b53_br_fast_age prints "fast
ageing failed"; rtl83xx_port_fast_age prints "failed to fast age on
port %d: %d").

If the ATC engine fails to clear ATC_BUSY within the 20ms timeout,
mt7530_port_fast_age() returns silently and a subsequent
mt7530_fdb_cmd() will write a new command on top of the in-flight
operation. Should this path emit dev_err() on timeout to make a wedged
ATC engine visible to operators?

> +
>  static void
>  mt7530_fdb_read(struct mt7530_priv *priv, struct mt7530_fdb *fdb)
>  {

[ ... ]

[Low]
Is the claim in the commit message accurate?

  "This is consistent with what other DSA drivers do (b53, realtek)
  and relearning is fast."

Both drivers cited actually implement per-port fast aging.

In b53, b53_br_fast_age() calls b53_fast_age_port() which writes the
target port to B53_FAST_AGE_PORT_CTRL and selects FAST_AGE_PORT mode.

In realtek, rtl83xx_port_fast_age() calls
priv->ops->l2_flush(priv, port, 0), and rtl8366rb_port_fast_age()
flushes only BIT(port) via RTL8366RB_SECURITY_CTRL.

The mt7530 implementation flushes globally and ignores the port
argument entirely, which is the opposite of the cited examples. The
hardware-limitation rationale ("switch does not offer combined
non-static AND per-port match mode") may be valid, but the b53/realtek
comparison appears to be the wrong precedent.

A side effect not mentioned is that an STP transition on one port will
flush dynamic FDB entries on every other port and every other bridge
sharing the switch. Should this divergence from the typical
.port_fast_age contract be called out?

> diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
> index abf19aa69520..decad7a93dbd 100644
> --- a/drivers/net/dsa/mt7530.h
> +++ b/drivers/net/dsa/mt7530.h
> @@ -165,6 +165,7 @@ enum mt753x_to_cpu_fw {
>  #define  ATC_MAT_MASK			GENMASK(11, 8)
>  #define  ATC_MAT(x)			FIELD_PREP(ATC_MAT_MASK, x)
>  #define  ATC_MAT_MACTAB			ATC_MAT(0)
> +#define  ATC_MAT_NON_STATIC_MAC	ATC_MAT(4)

[Low]
The new ATC_MAT_NON_STATIC_MAC define uses a single tab between the
macro name and its value, while the surrounding ATC_MAT_* macros use
multiple tabs and align the values at the same column. Should this
follow the existing alignment?

>  
>  enum mt7530_fdb_cmd {
>  	MT7530_FDB_READ	= 0,

