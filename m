Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCCFCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 10:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sW+5aQtpAHw6Hz+OCK0Iwnwql8doCPJ/S20KIQFxHlM=; b=v4K5K7mC+YiIFovIkv0iu+Omi6
	/tDKoy5JisHOOLwF2N4MPEEWYSoX4WT8E2WWqPY1XteowICIdC0/LWs/oO/fiugXT3LJvOUtiWvv/
	hT+PAf623zO/OviLYV7KDmmZuuTBuIHfKY1DKCDnkxWzvQCC0uW7ZmmWU7Xhltava2C44eOcFVUPZ
	O9hCWacm0MJFrh9CIB/6SAvm/A3rxMA2m3DDJoBv16wqqpktjniKjWku1bdgSJHhLWtcRNZgBzZYZ
	U9hqmMPYf7M96H+/SibZXdXsCCFoLFivAK3VYQ8UPbdgcV7e8qPly84oactKhe3M/bQBxVzS4f/KK
	AN4IM88A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXz9K-0000000AkjI-2Fpj;
	Fri, 12 Jun 2026 10:30:06 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXz9I-0000000AkiL-15CK;
	Fri, 12 Jun 2026 10:30:05 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wXz92-0000000030H-3xgm;
	Fri, 12 Jun 2026 10:29:49 +0000
Date: Fri, 12 Jun 2026 11:29:45 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 8/8] net: dsa: mt7530: implement
 port_change_conduit op
Message-ID: <aivfmaWBpTw6LwFp@makrotopia.org>
References: <cover.1781119435.git.daniel@makrotopia.org>
 <91ae0f87a6ca2cce3d072dba548545e02347bf13.1781119435.git.daniel@makrotopia.org>
 <02ad5de0-ea6a-4267-8686-72e3f98fce4e@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02ad5de0-ea6a-4267-8686-72e3f98fce4e@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_033004_301300_2B4054DE 
X-CRM114-Status: GOOD (  18.24  )
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

On Fri, Jun 12, 2026 at 07:36:35AM +0000, Chester A. Unal wrote:
> On 10/06/2026 20:56, Daniel Golle wrote:
> > Allow changing the CPU port affinity of user ports at runtime via
> > the IFLA_DSA_CONDUIT netlink attribute. This updates the port matrix
> > to forward to the new CPU port instead of the old one.
> > 
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> Fabulous!
> 
> Acked-by: Chester A. Unal <chester.a.unal@arinc9.com>
> 
> > ---
> >   drivers/net/dsa/mt7530.c | 29 +++++++++++++++++++++++++++++
> >   1 file changed, 29 insertions(+)
> > 
> > diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> > index c96420c291d5..2f3e734b9f53 100644
> > --- a/drivers/net/dsa/mt7530.c
> > +++ b/drivers/net/dsa/mt7530.c
> > @@ -3206,6 +3206,34 @@ static int mt753x_set_mac_eee(struct dsa_switch *ds, int port,
> >   	return 0;
> >   }
> > +static int
> > +mt753x_port_change_conduit(struct dsa_switch *ds, int port,
> > +			   struct net_device *conduit,
> > +			   struct netlink_ext_ack *extack)
> > +{
> > +	struct dsa_port *new_cpu_dp = conduit->dsa_ptr;
> > +	struct dsa_port *dp = dsa_to_port(ds, port);
> > +	struct mt7530_priv *priv = ds->priv;
> > +
> > +	if (priv->id != ID_MT7531)
> > +		return -EOPNOTSUPP;
> 
> Why do we limit this to MT7531 only?

I could test it only on MT7531 (BPi R64), and that's also where it
makes most sense imho: On MT7530 we got PHY muxing, on the MMIO
switches we physically got only a single CPU port.

