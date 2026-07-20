Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E2EC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 15:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=96sBccLuhfAamB65walQaZAlGWaFt0kDQVQYJZnpI9s=; b=nlpLz/ksKX2obVuioTt/sEhp0R
	Ms+ryAMealrTzh1OAMTWHh3mhMMXDyBzckgDi6kVGopiFW4TxEWaa+jRc5KsjAnJ/G8GVSPe3Ejln
	RL+iumsGDRf/uMP0Mu4Nart+3gvSqVbqOhki016ZqgM/ztyra7GtUZU+fmfeVf8RzoE0/nm0OKRrU
	qi4oWAYAGyrGgkqCz8eCAsJczEq5lS28bZe4mv9zzhsQgbaNG1Nv/z4hZk6Y1TirHCJR0WrdiYPrW
	xaiW8fjx5D3ZgzkWG5xTKn0k7bO/MtHcSJSgGF8jgHDOvfae4+vw51l1U0TH662WRAPoQTlo1r9BQ
	jFU1I1aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq9T-00000007FMs-3u9F;
	Mon, 20 Jul 2026 15:43:31 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq9R-00000007FK5-0Rks
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 15:43:30 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso510631f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 08:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562207; x=1785167007; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=96sBccLuhfAamB65walQaZAlGWaFt0kDQVQYJZnpI9s=;
        b=Dl4RdX2Sno3RTyWZnTMELHjmMt4MbtQ1hveCuqo1qxpqO03g4oYFGRHHj3uGqrl0Rt
         90h628XQujacJLlAFEk7vAXMxIfD2bQ8R1FF03DqXUPFQGIEHOtxNhktg9v4qTJWxFNB
         uHg/+i3TS8Unr0NvgnQQY7NxaFRuu82Qun0L4PYjYsFYOTBZHKadMRrMqg0QI3vwEJYT
         EYuWG2XqJwDrT1quZTS2Macrg8TgRx3InYrILYBxAEEok1Khn8J7+zrX2CR+f7iti2S8
         uUuki7t6nVCqGEqF68rX2zoVa6KDt7ItOVHTPEScs+HSYjLBLVnEwzKrzy1mke7KrloZ
         CIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562207; x=1785167007;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96sBccLuhfAamB65walQaZAlGWaFt0kDQVQYJZnpI9s=;
        b=MAyKhmCAY+5cwY5+HvrPM/rbdmaaCtbOWnMFDvMokMGdjEloj6hY+wY1QGRDW/gfkx
         1kYWoTzRRLvsGG5zkDwvlKQQfHqhMq9nNA4/0ADo6wPecA/D5MiYJb5NWiDjKZaRUMTn
         lEQHQoLXxz0jo5dTg3QjBVnywQGLX9ehYA6JCJaNNESxyW4IIEIS61/7mKmVwbyNIKze
         VQ+G4ZolFmGhZeT2I5+PnE5G7uFdOlwuCjm1c3+u2znY0V/3Kq6T/kSWvPpLq59O5gJz
         +uUQu6J89Ebfvl8guNtEPWTyU6oRRHxUJ33RyGeODK0LtukCMC93cAYpRWDb3xiq8CjV
         lV4Q==
X-Forwarded-Encrypted: i=1; AHgh+RoctuosYUjyoOrqdm6mV3+5h10uedzh9q2AJAqn7xko1xMrazKj1zhibTvplk6Vp4Gbtjn3UKrEZflRLjMr+ZZY@lists.infradead.org
X-Gm-Message-State: AOJu0YyITPIAjAMHkeve28t6V4dt8rqhxNuC6tYvUkI9+mXV5rCc/Xbj
	40QggFexHCV5MA22g2tCVAd9Dkxf/bhPYCF89HW4RvGI5bi8ZWH6W1+6
X-Gm-Gg: AR+sD10CiJZbWdiDamGqPshpiyVpAcpQ8u1OvF4bnrrpzb0VU0RUDGZLCpIvS2F93t1
	mTvxwwIea/lfLTY0JLwSldA1wyYuyCDVpSnrladSwjlc8NuLIPBqX6gj94vGVUdHoedQHXtDIT8
	elGaapcRGqJsP8Spr3tNpgzC3d8JYU8t4rcaM3WapEx9rO7QIg10cvmZGwyN4/xeBEDjpETiLRI
	IH+QqeZItujq+ZhngH3CSNq/rFDB0yKRPaVHY8fRLP+rY0WnFX0zlXTMT3MjDNpP3A/q5ohftQD
	U+bvEaPjTP+R8AOyi7Q7a2VqMgvkiY+nMszo6erRy/+A+wDWMxiMMQIXuSfPzLRVO9KKfxrTx99
	/rC2rPxwyUaWM8/BeeZKrfNXr0EiRNnF5yA3NrkS5X+gtO+2q5ScdXJVtIw4WlzOvV2NSFTrtJ9
	dxC9U8N2cXUF5ImtC9J5u1jtXXOjuP5odIytu1AZgJ0OCUAL1O2g==
X-Received: by 2002:a05:6000:40c5:b0:476:8a:5 with SMTP id ffacd0b85a97d-47f62326dbamr18346314f8f.34.1784562206551;
        Mon, 20 Jul 2026 08:43:26 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-246-252-39.retail.telecomitalia.it. [95.246.252.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed1911sm32898027f8f.22.2026.07.20.08.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:43:25 -0700 (PDT)
Message-ID: <6a5e421d.9099b29d.2f0302.1cf4@mx.google.com>
X-Google-Original-Message-ID: <al5CFxJ4UFPENmBB@Ansuel-XPS.>
Date: Mon, 20 Jul 2026 17:43:19 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH net-next v9 12/12] net: airoha: add phylink support
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
 <20260717065448.1498335-13-ansuelsmth@gmail.com>
 <al5AVLxWRhnpGzJ1@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al5AVLxWRhnpGzJ1@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_084329_284521_6502D4CF 
X-CRM114-Status: GOOD (  42.84  )
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

On Mon, Jul 20, 2026 at 05:35:48PM +0200, Lorenzo Bianconi wrote:
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
> > ---
> >  drivers/net/ethernet/airoha/Kconfig       |   1 +
> >  drivers/net/ethernet/airoha/airoha_eth.c  | 194 +++++++++++++++++++++-
> >  drivers/net/ethernet/airoha/airoha_eth.h  |   7 +-
> >  drivers/net/ethernet/airoha/airoha_regs.h |  12 ++
> >  4 files changed, 207 insertions(+), 7 deletions(-)
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
> > index 59001fd4b6f7..ed1ac032f337 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/of_reserved_mem.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/tcp.h>
> > +#include <linux/pcs/pcs.h>
> >  #include <linux/u64_stats_sync.h>
> >  #include <net/dst_metadata.h>
> >  #include <net/page_pool/helpers.h>
> > @@ -1837,7 +1838,7 @@ static void airoha_update_hw_stats(struct airoha_gdm_dev *dev)
> >  	struct airoha_gdm_port *port = dev->port;
> >  	int i;
> >  
> > -	spin_lock(&port->stats_lock);
> > +	spin_lock(&port->lock);
> 
> Hi Christian,
> 
> as pointed out in a previous email, I do not like the approach of reusing this
> spin_lock for airoha_mac_link_up(). Can we use rtl_lock() (when necessary) as
> pointed out before?
> 

For context, quoting from the previous series, the suggestion is to use
rtnl_is_locked() and then lock accordingly but I didn't find other usage of
that in other driver (aside from core net) and I don't like the use of
is_locked. I can already see the BOT saying that in the timeframe of
is_locked and writing the register another interface goes up causing a
race.

Guess I will add a simple mutex for this case and the other.

> >  
> >  	for (i = 0; i < ARRAY_SIZE(port->devs); i++) {
> >  		if (port->devs[i])
> > @@ -1848,7 +1849,7 @@ static void airoha_update_hw_stats(struct airoha_gdm_dev *dev)
> >  	airoha_fe_set(dev->eth, REG_FE_GDM_MIB_CLEAR(port->id),
> >  		      FE_GDM_MIB_RX_CLEAR_MASK | FE_GDM_MIB_TX_CLEAR_MASK);
> >  
> > -	spin_unlock(&port->stats_lock);
> > +	spin_unlock(&port->lock);
> >  }
> >  
> >  static void airoha_dev_set_xmit_frame_size(struct net_device *netdev)
> > @@ -1870,6 +1871,14 @@ static int airoha_dev_open(struct net_device *netdev)
> >  	u32 pse_port = FE_PSE_PORT_PPE1;
> >  	int err;
> >  
> > +	err = phylink_of_phy_connect(dev->phylink, netdev->dev.of_node, 0);
> > +	if (err) {
> > +		netdev_err(netdev, "could not attach PHY: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	phylink_start(dev->phylink);
> > +
> >  	netif_tx_start_all_queues(netdev);
> >  	err = airoha_set_vip_for_gdm_port(dev, true);
> >  	if (err)
> > @@ -1909,6 +1918,10 @@ static int airoha_dev_stop(struct net_device *netdev)
> >  		airoha_set_gdm_port_fwd_cfg(qdma->eth,
> >  					    REG_GDM_FWD_CFG(port->id),
> >  					    FE_PSE_PORT_DROP);
> > +
> > +	phylink_stop(dev->phylink);
> > +	phylink_disconnect_phy(dev->phylink);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -2389,6 +2402,24 @@ airoha_ethtool_get_rmon_stats(struct net_device *netdev,
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
> > @@ -3120,7 +3151,8 @@ static const struct ethtool_ops airoha_ethtool_ops = {
> >  	.get_drvinfo		= airoha_ethtool_get_drvinfo,
> >  	.get_eth_mac_stats      = airoha_ethtool_get_mac_stats,
> >  	.get_rmon_stats		= airoha_ethtool_get_rmon_stats,
> > -	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
> > +	.get_link_ksettings	= airoha_ethtool_get_link_ksettings,
> > +	.set_link_ksettings	= airoha_ethtool_set_link_ksettings,
> >  	.get_link		= ethtool_op_get_link,
> >  };
> >  
> > @@ -3176,6 +3208,155 @@ bool airoha_is_valid_gdm_dev(struct airoha_eth *eth,
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
> > +	}
> > +
> > +	spin_lock(&port->lock);
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
> > +
> > +	spin_unlock(&port->lock);
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
> > @@ -3239,7 +3420,7 @@ static int airoha_alloc_gdm_device(struct airoha_eth *eth,
> >  	dev->nbq = nbq;
> >  	port->devs[index] = dev;
> >  
> > -	return 0;
> > +	return airoha_setup_phylink(netdev);
> >  }
> >  
> >  static int airoha_alloc_gdm_port(struct airoha_eth *eth,
> > @@ -3274,7 +3455,7 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
> >  		return -ENOMEM;
> >  
> >  	port->id = id;
> > -	spin_lock_init(&port->stats_lock);
> > +	spin_lock_init(&port->lock);
> >  	eth->ports[p] = port;
> >  
> >  	err = airoha_metadata_dst_alloc(port);
> > @@ -3471,6 +3652,8 @@ static int airoha_probe(struct platform_device *pdev)
> >  			netdev = netdev_from_priv(dev);
> >  			if (netdev->reg_state == NETREG_REGISTERED)
> >  				unregister_netdev(netdev);
> > +			if (dev->phylink)
> > +				phylink_destroy(dev->phylink);
> >  			of_node_put(netdev->dev.of_node);
> >  		}
> >  		airoha_metadata_dst_free(port);
> > @@ -3509,6 +3692,7 @@ static void airoha_remove(struct platform_device *pdev)
> >  
> >  			netdev = netdev_from_priv(dev);
> >  			unregister_netdev(netdev);
> > +			phylink_destroy(dev->phylink);
> >  			of_node_put(netdev->dev.of_node);
> >  		}
> >  		airoha_metadata_dst_free(port);
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
> > index f6d01a8e8da1..b49fc5304b3a 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.h
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> > @@ -561,6 +561,9 @@ struct airoha_gdm_dev {
> >  	int nbq;
> >  
> >  	struct airoha_hw_stats stats;
> > +
> > +	struct phylink *phylink;
> > +	struct phylink_config phylink_config;
> >  };
> >  
> >  struct airoha_gdm_port {
> > @@ -568,8 +571,8 @@ struct airoha_gdm_port {
> >  	int id;
> >  	int users;
> >  
> > -	/* protect concurrent hw_stats accesses */
> > -	spinlock_t stats_lock;
> > +	/* protect concurrent hw_stats and frag register accesses */
> > +	spinlock_t lock;
> >  
> >  	struct metadata_dst *dsa_meta[AIROHA_MAX_DSA_PORTS];
> >  };
> > diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
> > index 6fed63d013b4..8df02f51211c 100644
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

