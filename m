Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5796C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZtyOCXOdSpPncxX9X95K21xTpnlgw4ERbigVVrepMHc=; b=Nl06HUp6FU46nGPyB7EOmNphPg
	ZWQ1L1yBGCCzjCyxksxLlNeVYcWe0hzkQENwpHbPFvSK7aJIjKc8JTdxDkySHqnYoy9AMN3Rf/1if
	u4y920QTLyMjY9SZHpAySskcfnoPnlHiCK/3ZXk1+6R9o9xgAtfNtFUTxe7QoyxbEeDOqoNScq4eh
	OJ0lAk1eMXtX9bch3p49yQKVf+P6AWvPK48tabjtZlDWw9yaTSXttMcg4nVLfp6bk3xOpjWj0BuK/
	ZbrklnZ1gt+ApTbEYk1H9gDR6iFj+UxrPKJZVTD9VMsJUAnfrw08jGyNhTyc8Z/gs5NrJ8KmpFk85
	v/QeGuFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1f6-00000006LX2-1WCL;
	Thu, 06 Aug 2026 17:13:44 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1f3-00000006LVw-1TYu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 17:13:43 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4980dc26022so24260035e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 10:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786036419; x=1786641219; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZtyOCXOdSpPncxX9X95K21xTpnlgw4ERbigVVrepMHc=;
        b=JPRKxRpe6Iafzab5D0yuGjLRM1XK1BOnZOyP5v1qfIE0+4ujcFvNPVD5mdBuU1bMtS
         eQ6K/3W7M9nUXwYUQF2y5FpSpM6+rEtRumiHhunB4OsTbnHBplL1O9PYOwUfYu3cba0k
         D30jv7H6dd3bx4fe4v+byAljBj5Q/NnOs5yqeNSCG5lpgsHdZrsMNVYegSJVqmff2J/l
         eMdd7ePNXnnTZmP1hhFBG8VXJnD6uHBvTDH6EZy5CM1pYLieTMq4qcJd6+j6oy5KzryG
         1Ig8yea/e1FXZ9cMAEHngYJauj1YLqpTU5jyJq5JO3Bblrko6O/YTRIITFZXsmPWW3n2
         IEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786036419; x=1786641219;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZtyOCXOdSpPncxX9X95K21xTpnlgw4ERbigVVrepMHc=;
        b=XUYEzp4pC+s0baDPyWX7gvbpBmswneXEUiUNBBvMRyXMs4uJM/UEWuCEei9kKqNKgV
         FxY7U7QcmyvSvR7QOzbg8A/MmY8MBHmdxWPhwaUsHX7mD49HClfTx+X7Q4gkMgwet+gd
         8dsRBvCSM1j06rLxtz31yy5T2WHf9Kwu9hwU777EaJOlvy+EEgn9M0dM2KwAUNbJS4sC
         zP8P2xCGwZnB6IfD/0F6nTX2GvgxxKKwRWUOZOomaRl2PA4SokdIaA5mS02ueKaHku+2
         qfo9moZzeo7/rLWrKPy1Sien+KLO8v9meE/rzr03Xik+N6zK9eBHMUZeyzdfMvAExMev
         xtLw==
X-Forwarded-Encrypted: i=1; AHgh+Rono4JR5TuiBXyqbNGsOlGvziDLjPpykMuiPzXUCVGybB4EjDSisQOjOdXB7W8o5R5WbmnX2ZCfeVk+kHEuiMXG@lists.infradead.org
X-Gm-Message-State: AOJu0YzlHPbbvmHMFUy2tyNrFsQs1BFZlF/L+XwxK3d5C3wGeULtHY/X
	cLxPT3kdL3TJ72X/wpXxXJ1CIMeCcwp+a10XkEkU3jzhCh3IXcOrbTF/
X-Gm-Gg: AR+sD11IdxVujnThr3KtasMdJdaCpE6OGwOEVl0ArSYq4fXIi7Ck4u97ApYd2RHzJtO
	7FVFPrIYEhW7a1CHOqZWw04pIKyh5dA/UbjtYd/F+BULVAFr5sC9w5SFkWE0eS+j2gYSZvpvxrD
	ounWZphIcbTdQkvi5mE2a69Q2q360ynucO/SdrkfwB8XSGwN66qfXiu4iOmoE0y3OewK2lSBUnt
	7nV6Is/af4csGuHCcznfxmUODll7kXKPLkj/JfYnJ/iR0cRwanVS6kjHyJoJbdxoMmY/Afwvjg7
	1rJfKfzkiWQwNwt8LuA29wxjXu4BVLcANPYOy2aiv0axirWXcDh8kgeXjp/1wpoqCCQkUGzBLBV
	lGo7trE7OiLqhP+5kN/b5kCJ6nyjnu5rhh1vjzfwLf46s2sQgcaM1z0nunPTyO7ghLTresgpe7c
	P3rUgZ2uYO0TP/4JFt6jHL2Y1av2HJh6X7z1YyVKfCnxTT1hirR3NO/3uto8X8gQt051N7aC/Sm
	+VuAxlHAyYUGSxsbje4HiFv+bpQlyaI3QOV
X-Received: by 2002:a05:600c:5251:b0:499:5b04:6920 with SMTP id 5b1f17b1804b1-4995b04695bmr7965295e9.16.1786036419254;
        Thu, 06 Aug 2026 10:13:39 -0700 (PDT)
Received: from Ansuel-XPS. (host-79-42-255-151.retail.telecomitalia.it. [79.42.255.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995bb81731sm1732145e9.0.2026.08.06.10.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 10:13:38 -0700 (PDT)
Message-ID: <6a74c0c2.1c04d3ff.d716d.a9f0@mx.google.com>
X-Google-Original-Message-ID: <anTAvad1j37P3ZfY@Ansuel-XPS.>
Date: Thu, 6 Aug 2026 19:13:33 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v10 11/11] net: airoha: add phylink support
References: <20260730102444.1967900-1-ansuelsmth@gmail.com>
 <20260730102444.1967900-12-ansuelsmth@gmail.com>
 <ams72wEsCiACYh-k@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ams72wEsCiACYh-k@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_101341_463615_3CD2483F 
X-CRM114-Status: GOOD (  41.16  )
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

On Thu, Jul 30, 2026 at 01:56:11PM +0200, Lorenzo Bianconi wrote:
> > Add phylink support for each GDM port. For GDM1 add the internal interface
> > mode as the only supported mode. For GDM2/3/4 add the required
> > configuration of the PCS to make the external PHY or attached SFP cage
> > work.
> > 
> > These needs to be defined in the GDM port node using the pcs-handle
> > property.
> > 
> > Update and provide a .get/set_link_ksettings function that use phylink
> > for ethtool OPs now that we fully support phylink.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> 
> Hi Christian,
> 
> just some nits inline. Fixing them:
> 
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> Regards,
> Lorenzo
> 
> > ---
> >  drivers/net/ethernet/airoha/Kconfig       |   1 +
> >  drivers/net/ethernet/airoha/airoha_eth.c  | 189 +++++++++++++++++++++-
> >  drivers/net/ethernet/airoha/airoha_eth.h  |   5 +
> >  drivers/net/ethernet/airoha/airoha_regs.h |  12 ++
> >  4 files changed, 205 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/airoha/Kconfig b/drivers/net/ethernet/airoha/Kconfig
> > index 1f6640a15fc9..789906516bf8 100644
> > --- a/drivers/net/ethernet/airoha/Kconfig
> > +++ b/drivers/net/ethernet/airoha/Kconfig
> > @@ -20,6 +20,7 @@ config NET_AIROHA
> >  	depends on NET_DSA || !NET_DSA
> >  	select NET_AIROHA_NPU
> >  	select PAGE_POOL
> > +	select PHYLINK
> >  	help
> >  	  This driver supports the gigabit ethernet MACs in the
> >  	  Airoha SoC family.
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> > index dba7c52c0896..5065d6583b9f 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/of_reserved_mem.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/tcp.h>
> > +#include <linux/pcs/pcs.h>
> 
> nit: alphabetic order.
> 
> >  #include <linux/u64_stats_sync.h>
> >  #include <net/dst_metadata.h>
> >  #include <net/page_pool/helpers.h>
> > @@ -1915,6 +1916,14 @@ static int airoha_dev_open(struct net_device *netdev)
> >  	struct airoha_qdma *qdma;
> >  	int err;
> >  
> > +	err = phylink_of_phy_connect(dev->phylink, netdev->dev.of_node, 0);
> > +	if (err) {
> > +		netdev_err(netdev, "could not attach PHY: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	phylink_start(dev->phylink);
> 
> Should it be last operation in airoha_dev_open()?
>

I checked also other ethernet driver for this pattern and it seems
phylink_start is always called before any netif_start_queues.

I'm addressing all the other suggestion and adding the Ack if you are ok
with keeping this as is.
 
> > +
> >  	netif_tx_start_all_queues(netdev);
> >  	err = airoha_set_vip_for_gdm_port(dev, true);
> >  	if (err)
> > @@ -1954,6 +1963,10 @@ static int airoha_dev_stop(struct net_device *netdev)
> >  		airoha_set_gdm_port_fwd_cfg(dev->eth,
> >  					    REG_GDM_FWD_CFG(port->id),
> >  					    FE_PSE_PORT_DROP);
> > +
> > +	phylink_stop(dev->phylink);
> 
> Should it be the first one? (reverse order of airoha_dev_open()).
> 
> > +	phylink_disconnect_phy(dev->phylink);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -2509,6 +2522,24 @@ airoha_ethtool_get_rmon_stats(struct net_device *netdev,
> >  	} while (u64_stats_fetch_retry(&dev->stats.syncp, start));
> >  }
> >  
> > +static int
> > +airoha_ethtool_get_link_ksettings(struct net_device *netdev,
> > +				  struct ethtool_link_ksettings *cmd)
> > +{
> > +	struct airoha_gdm_dev *dev = netdev_priv(netdev);
> > +
> > +	return phylink_ethtool_ksettings_get(dev->phylink, cmd);
> > +}
> > +
> > +static int
> > +airoha_ethtool_set_link_ksettings(struct net_device *netdev,
> > +				  const struct ethtool_link_ksettings *cmd)
> > +{
> > +	struct airoha_gdm_dev *dev = netdev_priv(netdev);
> > +
> > +	return phylink_ethtool_ksettings_set(dev->phylink, cmd);
> > +}
> > +
> >  static int airoha_qdma_set_chan_tx_sched(struct net_device *netdev,
> >  					 int channel, enum tx_sched_mode mode,
> >  					 const u16 *weights, u8 n_weights)
> > @@ -3353,7 +3384,8 @@ static const struct ethtool_ops airoha_ethtool_ops = {
> >  	.get_drvinfo		= airoha_ethtool_get_drvinfo,
> >  	.get_eth_mac_stats      = airoha_ethtool_get_mac_stats,
> >  	.get_rmon_stats		= airoha_ethtool_get_rmon_stats,
> > -	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
> > +	.get_link_ksettings	= airoha_ethtool_get_link_ksettings,
> > +	.set_link_ksettings	= airoha_ethtool_set_link_ksettings,
> >  	.get_link		= ethtool_op_get_link,
> >  };
> >  
> > @@ -3409,6 +3441,155 @@ bool airoha_is_valid_gdm_dev(struct airoha_eth *eth,
> >  	return false;
> >  }
> >  
> > +/* Nothing to do in MAC, everything is handled in PCS */
> > +static void airoha_mac_config(struct phylink_config *config, unsigned int mode,
> > +			      const struct phylink_link_state *state)
> > +{
> > +}
> > +
> > +static void airoha_mac_link_up(struct phylink_config *config, struct phy_device *phy,
> > +			       unsigned int mode, phy_interface_t interface,
> > +			       int speed, int duplex, bool tx_pause, bool rx_pause)
> > +{
> > +	struct airoha_gdm_dev *dev = container_of(config, struct airoha_gdm_dev,
> > +						  phylink_config);
> > +	struct airoha_gdm_port *port = dev->port;
> > +	struct airoha_eth *eth = dev->eth;
> > +	u32 frag_size_tx, frag_size_rx;
> > +	u32 mask, val;
> > +
> > +	/* TX/RX frag is configured only for GDM4 */
> > +	if (port->id != AIROHA_GDM4_IDX)
> > +		return;
> > +
> > +	switch (speed) {
> > +	case SPEED_10000:
> > +	case SPEED_5000:
> > +		frag_size_tx = 8;
> > +		frag_size_rx = 8;
> > +		break;
> > +	case SPEED_2500:
> > +		frag_size_tx = 2;
> > +		frag_size_rx = 1;
> > +		break;
> > +	default:
> > +		frag_size_tx = 1;
> > +		frag_size_rx = 0;
> 
> Missing break here.
> 
> > +	}
> > +
> > +	mutex_lock(&port->reg_lock);
> > +
> > +	/* Configure TX/RX frag based on speed */
> > +	if (dev->nbq == 1) {
> > +		mask = GDM4_SGMII1_TX_FRAG_SIZE_MASK;
> > +		val = FIELD_PREP(GDM4_SGMII1_TX_FRAG_SIZE_MASK,
> > +				 frag_size_tx);
> > +	}  else {
> > +		mask = GDM4_SGMII0_TX_FRAG_SIZE_MASK;
> > +		val = FIELD_PREP(GDM4_SGMII0_TX_FRAG_SIZE_MASK,
> > +				 frag_size_tx);
> > +	}
> > +	airoha_fe_rmw(eth, REG_FE_GDM4_TMBI_FRAG, mask, val);
> > +
> > +	if (dev->nbq == 1) {
> > +		mask = GDM4_SGMII1_RX_FRAG_SIZE_MASK;
> > +		val = FIELD_PREP(GDM4_SGMII1_RX_FRAG_SIZE_MASK,
> > +				 frag_size_rx);
> > +	} else {
> > +		mask = GDM4_SGMII0_RX_FRAG_SIZE_MASK;
> > +		val = FIELD_PREP(GDM4_SGMII0_RX_FRAG_SIZE_MASK,
> > +				 frag_size_rx);
> > +	}
> > +	airoha_fe_rmw(eth, REG_FE_GDM4_RMBI_FRAG, mask, val);
> 
> nit: I guess you can have just one if/else block here running airoha_fe_rmw()
> inside the block and getting rid of val/mask.
> 
> > +
> > +	mutex_unlock(&port->reg_lock);
> > +}
> > +
> > +/* Nothing to do in MAC, everything is handled in PCS */
> > +static void airoha_mac_link_down(struct phylink_config *config, unsigned int mode,
> > +				 phy_interface_t interface)
> > +{
> > +}
> > +
> > +static const struct phylink_mac_ops airoha_phylink_ops = {
> > +	.mac_config = airoha_mac_config,
> > +	.mac_link_up = airoha_mac_link_up,
> > +	.mac_link_down = airoha_mac_link_down,
> > +};
> > +
> > +static int airoha_fill_available_pcs(struct phylink_config *config,
> > +				     struct phylink_pcs **available_pcs,
> > +				     unsigned int num_possible_pcs)
> > +{
> > +	struct device *dev = config->dev;
> > +
> > +	return fwnode_phylink_pcs_parse(dev_fwnode(dev), available_pcs,
> > +					num_possible_pcs);
> > +}
> > +
> > +static int airoha_setup_phylink(struct net_device *netdev)
> > +{
> > +	struct airoha_gdm_dev *dev = netdev_priv(netdev);
> > +	struct device_node *np = netdev->dev.of_node;
> > +	struct airoha_gdm_port *port = dev->port;
> > +	struct phylink_config *config;
> > +	phy_interface_t phy_mode;
> > +	struct phylink *phylink;
> > +	int err;
> > +
> > +	err = of_get_phy_mode(np, &phy_mode);
> > +	if (err) {
> > +		dev_err(&netdev->dev, "incorrect phy-mode\n");
> > +		return err;
> > +	}
> > +
> > +	config = &dev->phylink_config;
> > +	config->dev = &netdev->dev;
> > +	config->type = PHYLINK_NETDEV;
> > +
> > +	/*
> > +	 * GDM1 only supports internal for Embedded Switch
> > +	 * and doesn't require a PCS.
> > +	 */
> > +	if (port->id == AIROHA_GDM1_IDX) {
> > +		config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> > +					   MAC_10000FD;
> > +
> > +		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
> > +			  config->supported_interfaces);
> > +	} else {
> > +		config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> > +					   MAC_10 | MAC_100 | MAC_1000 |
> > +					   MAC_2500FD | MAC_5000FD | MAC_10000FD;
> > +
> > +		config->num_possible_pcs = fwnode_phylink_pcs_count(dev_fwnode(config->dev));
> > +		config->fill_available_pcs = airoha_fill_available_pcs;
> > +
> > +		__set_bit(PHY_INTERFACE_MODE_SGMII,
> > +			  config->supported_interfaces);
> > +		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
> > +			  config->supported_interfaces);
> > +		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
> > +			  config->supported_interfaces);
> > +		__set_bit(PHY_INTERFACE_MODE_10GBASER,
> > +			  config->supported_interfaces);
> > +		__set_bit(PHY_INTERFACE_MODE_USXGMII,
> > +			  config->supported_interfaces);
> > +
> > +		phy_interface_copy(config->pcs_interfaces,
> > +				   config->supported_interfaces);
> > +	}
> > +
> > +	phylink = phylink_create(config, of_fwnode_handle(np),
> > +				 phy_mode, &airoha_phylink_ops);
> > +	if (IS_ERR(phylink))
> > +		return PTR_ERR(phylink);
> > +
> > +	dev->phylink = phylink;
> > +
> > +	return 0;
> > +}
> > +
> >  static int airoha_alloc_gdm_device(struct airoha_eth *eth,
> >  				   struct airoha_gdm_port *port,
> >  				   int nbq, struct device_node *np)
> > @@ -3474,7 +3655,7 @@ static int airoha_alloc_gdm_device(struct airoha_eth *eth,
> >  	dev->nbq = nbq;
> >  	port->devs[index] = dev;
> >  
> > -	return 0;
> > +	return airoha_setup_phylink(netdev);
> >  }
> >  
> >  static int airoha_alloc_gdm_port(struct airoha_eth *eth,
> > @@ -3510,6 +3691,7 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
> >  
> >  	port->id = id;
> >  	spin_lock_init(&port->stats_lock);
> > +	mutex_init(&port->reg_lock);
> >  	eth->ports[p] = port;
> >  
> >  	err = airoha_metadata_dst_alloc(port);
> > @@ -3706,6 +3888,8 @@ static int airoha_probe(struct platform_device *pdev)
> >  			netdev = netdev_from_priv(dev);
> >  			if (netdev->reg_state == NETREG_REGISTERED)
> >  				unregister_netdev(netdev);
> > +			if (dev->phylink)
> > +				phylink_destroy(dev->phylink);
> >  			of_node_put(netdev->dev.of_node);
> >  		}
> >  		airoha_metadata_dst_free(port);
> > @@ -3744,6 +3928,7 @@ static void airoha_remove(struct platform_device *pdev)
> >  
> >  			netdev = netdev_from_priv(dev);
> >  			unregister_netdev(netdev);
> > +			phylink_destroy(dev->phylink);
> >  			of_node_put(netdev->dev.of_node);
> >  		}
> >  		airoha_metadata_dst_free(port);
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
> > index fa9a8edce22f..6396a5aec384 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.h
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> > @@ -595,6 +595,9 @@ struct airoha_gdm_dev {
> >  	 * QDMA migration.
> >  	 */
> >  	spinlock_t txq_lock[AIROHA_NUM_NETDEV_TX_RINGS];
> > +
> > +	struct phylink *phylink;
> > +	struct phylink_config phylink_config;
> >  };
> >  
> >  struct airoha_gdm_port {
> > @@ -604,6 +607,8 @@ struct airoha_gdm_port {
> >  
> >  	/* protect concurrent hw_stats accesses */
> >  	spinlock_t stats_lock;
> > +	/* protect concurrent GDM4 register access */
> > +	struct mutex reg_lock;
> 
> nit: naming is always hard, maybe link_lock?
> 
> >  
> >  	struct metadata_dst *dsa_meta[AIROHA_MAX_DSA_PORTS];
> >  };
> > diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
> > index 442b48c9b991..4ea89057b560 100644
> > --- a/drivers/net/ethernet/airoha/airoha_regs.h
> > +++ b/drivers/net/ethernet/airoha/airoha_regs.h
> > @@ -357,6 +357,18 @@
> >  #define IP_FRAGMENT_PORT_MASK		GENMASK(8, 5)
> >  #define IP_FRAGMENT_NBQ_MASK		GENMASK(4, 0)
> >  
> > +#define REG_FE_GDM4_TMBI_FRAG		0x2028
> > +#define GDM4_SGMII1_TX_WEIGHT_MASK	GENMASK(31, 26)
> > +#define GDM4_SGMII1_TX_FRAG_SIZE_MASK	GENMASK(25, 16)
> > +#define GDM4_SGMII0_TX_WEIGHT_MASK	GENMASK(15, 10)
> > +#define GDM4_SGMII0_TX_FRAG_SIZE_MASK	GENMASK(9, 0)
> > +
> > +#define REG_FE_GDM4_RMBI_FRAG		0x202c
> > +#define GDM4_SGMII1_RX_WEIGHT_MASK	GENMASK(31, 26)
> > +#define GDM4_SGMII1_RX_FRAG_SIZE_MASK	GENMASK(25, 16)
> > +#define GDM4_SGMII0_RX_WEIGHT_MASK	GENMASK(15, 10)
> > +#define GDM4_SGMII0_RX_FRAG_SIZE_MASK	GENMASK(9, 0)
> > +
> >  #define REG_MC_VLAN_EN			0x2100
> >  #define MC_VLAN_EN_MASK			BIT(0)
> >  
> > -- 
> > 2.53.0
> > 



-- 
	Ansuel

