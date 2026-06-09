Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B0ECD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 23:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEcoODBbAmHhF71HEbR7vlQdemMO8cJnQFdN0SVH2Vk=; b=4axlrOe3kCxS9UWxp/ZDWTF327
	waWRFQqno39ggkVPtOG1/2KAd/Zv1loIvTt7CkOyE1BTGr8FOYjFbqTZcHiYVbXnjg923MIxqSqKh
	MeIKx3WA4LQIOPoxquq/4sASM1tPaeQLqMtPJ+/JAeU9uxSSRYohTClGXc8+xnoNNyoIRRQO75AIg
	AGaxxdLhX8eUNB/6d7NOeAqSqFoh7quU2oZt+wM8nBUQj3Df0JEz8CSBsnfchGZZhSmqQ//7B2IWY
	wirumkL0PsFH4WiB738cP2X/J07DrJ5jlEmfDC9UQvtfwP3cq3ZCNGVmUBAr2zaE8Xr46iM8mZavk
	uFMotxkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX6EX-00000006WbP-1LTu;
	Tue, 09 Jun 2026 23:51:49 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX6EU-00000006Wae-0msv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 23:51:47 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4908b92904fso70518885e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 16:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781049104; x=1781653904; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sEcoODBbAmHhF71HEbR7vlQdemMO8cJnQFdN0SVH2Vk=;
        b=nOjNOAW17LNAraewBfQw5JAb3VkPerHgWSZazYh2UF9eM6v2lP8wey0VM7rkkLyLac
         10mv+vwcpVJEvekVs+OMp/rSnWGei+0VgK/gPz//8wx2BdwAJzci+UtavEFy9dAAoGDZ
         9HlDh1f2QLy5GLtES5bhUcz1/2VS30/cLhVFCPKRn50MY3cS6fB9yD/PubSYBtZq8kST
         Q7xkVIFlBg7Dgfg2q37mOrNwV+181RCKLVszAjrcym/Zx0ELCLxI+PUKoY7bx8lgE8/v
         Efm3rVLQcCgQs8A+v3R5i9nNTPjCoGS2tro+Hi296q0fu1VEIFK4P3nv6G12fwYg5ydT
         X0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781049104; x=1781653904;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sEcoODBbAmHhF71HEbR7vlQdemMO8cJnQFdN0SVH2Vk=;
        b=bJUZZQxGq7LscIG/DdXSOS+rkuc8wg5BmoIGqjCqPilMKwN+AzKsTNE6bP15MJR0k2
         aVLR7Jffoj5shLvkjgetC7cwWABMOOM14FcHN76V7HRSHnT/Ou5fd7l9OK1m+s1BUhvX
         OxZSMiUt6oAIlUBZ8ir4kLHIBOafsbvn94it1PjdQXUnow6OBndhn2MA/QBGLc6P/Vgq
         ai9uyOXQxXHIadPWCtW/08f8yTJiHtcWLw8PsIms+yYsYh72lomDFIy+m1zi/UE1yMh8
         nv8RWG8R3hC5lClic84PsqrlSBHbmwMG5DzR+yQCCEGBjeUEgiEuUAETT1CCGbsl2J1Y
         wuHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/tFnWNWZP0JD8Iemja6xKUZOWOUZ8IjTQmWg/2GhYhpe5f8JdDRMir3qZCFYPtCtdZtyQQ3bPFyVHj0kTPqH26@lists.infradead.org
X-Gm-Message-State: AOJu0YzXJV39HVTlJHlhdqLBSKsEllamxmZH2F4WstHBNoV8vgnaKNxp
	TFsznOMBUo0tG22iuFh+WWR9l2VGYqRg0U76j0b3Diw7laONGJQWin4r
X-Gm-Gg: Acq92OEBowqtOD1WG93GHSJvHPXMMUayorESE28tdLmFHxhSjqQLFtaG5iL3EAOAnXs
	n8uGFGfmbbhdgoUQgXqBhflqzez0WJZ6zSA/trh9WGQ5/eHZPN2H+r6s/K5Hffk3o7XEUh47c38
	B+zB4ACHqaFGJnibPlcXnBRzrPWcKqFCkmX4CQ22K/GH+f1j5HByU6jqe/GgltUaEyMWaegmdxi
	zRd2/BVoTornoBbpoDOAXaDQkAkD5CsxD/L6LcivLlQLIvte4woAhawwdpJGfS8baVg3EsTH12D
	QVOxaEzFoRXeZayxkBTmxXQdJ1Jqs5PLDx8P4REPwB7GZVFDp2bjxxFxFXpX6dFMoVJkJpdvvRh
	Or7AO5I8XalRjm1k6DARekT+aWrscmHZe+qX98UmzaK5c+SZhLKGrMq0RGCE+RfZmXzt6Exx+9c
	GphkTHM9PGdSk+hx/c8zr8o6RFZnhc2opuqtJS1Bw6I1GflYpQFfzlv3Dnzh+p+bX7
X-Received: by 2002:a05:600c:c165:b0:490:a2fd:e1e5 with SMTP id 5b1f17b1804b1-490c2623527mr425785595e9.17.1781049103934;
        Tue, 09 Jun 2026 16:51:43 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dcaa924bsm23335215e9.1.2026.06.09.16.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 16:51:43 -0700 (PDT)
Message-ID: <6a28a70f.3dabba3e.312002.39c0@mx.google.com>
X-Google-Original-Message-ID: <aiinCyCvlCBpEVQX@Ansuel-XPS.>
Date: Wed, 10 Jun 2026 01:51:39 +0200
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v6 12/12] net: airoha: add phylink support
References: <20260609151212.29469-1-ansuelsmth@gmail.com>
 <20260609151212.29469-13-ansuelsmth@gmail.com>
 <aigxaDtZDnI-RTwN@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aigxaDtZDnI-RTwN@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_165146_292104_5694020E 
X-CRM114-Status: GOOD (  40.10  )
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

On Tue, Jun 09, 2026 at 05:29:44PM +0200, Lorenzo Bianconi wrote:
> > Add phylink support for each GDM port. For GDM1 add the internal interface
> > mode as the only supported mode. For GDM2/3/4 add the required
> > configuration of the PCS to make the external PHY or attached SFP cage
> > work.
> > 
> > These needs to be defined in the GDM port node using the pcs-handle
> > property.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> 
> Hi Christian,
> 
> some nits inline.
> 
> Regards,
> Lorenzo
> 
> > ---
> >  drivers/net/ethernet/airoha/Kconfig       |   1 +
> >  drivers/net/ethernet/airoha/airoha_eth.c  | 167 +++++++++++++++++++++-
> >  drivers/net/ethernet/airoha/airoha_eth.h  |   3 +
> >  drivers/net/ethernet/airoha/airoha_regs.h |  12 ++
> >  4 files changed, 181 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/airoha/Kconfig b/drivers/net/ethernet/airoha/Kconfig
> > index ad3ce501e7a5..38dcc76e5998 100644
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
> > index 5a8e84fa9918..eabd7b058f82 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/of_reserved_mem.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/tcp.h>
> > +#include <linux/pcs/pcs.h>
> 
> Can you please respect the alphabetic order?
> 
> >  #include <linux/u64_stats_sync.h>
> >  #include <net/dst_metadata.h>
> >  #include <net/page_pool/helpers.h>
> > @@ -1779,6 +1780,15 @@ static int airoha_dev_open(struct net_device *netdev)
> >  	u32 cur_len, pse_port = FE_PSE_PORT_PPE1;
> >  	struct airoha_qdma *qdma = dev->qdma;
> >  
> > +	err = phylink_of_phy_connect(dev->phylink, netdev->dev.of_node, 0);
> > +	if (err) {
> > +		netdev_err(netdev, "%s: could not attach PHY: %d\n", __func__,
> > +			   err);
> 
> Do we need specify the __func__ argument here?
>

I was following a pattern also used in other driver. Maybe we should stop
following it?
 
> > +		return err;
> > +	}
> > +
> > +	phylink_start(dev->phylink);
> > +
> >  	netif_tx_start_all_queues(netdev);
> >  	err = airoha_set_vip_for_gdm_port(dev, true);
> >  	if (err)
> > @@ -1876,6 +1886,9 @@ static int airoha_dev_stop(struct net_device *netdev)
> >  		}
> >  	}
> >  
> > +	phylink_stop(dev->phylink);
> > +	phylink_disconnect_phy(dev->phylink);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -3148,6 +3161,153 @@ bool airoha_is_valid_gdm_dev(struct airoha_eth *eth,
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
> > +	if (port->id != 4)
> 
> 	if (port->id != AIROHA_GDM4_IDX)
> 		...
> 
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
> > +	/* Configure TX/RX frag based on speed */
> > +	if (dev->nbq == 1) {
> > +		mask = GDMA4_SGMII1_TX_FRAG_SIZE_MASK;
> > +		val = FIELD_PREP(GDMA4_SGMII1_TX_FRAG_SIZE_MASK,
> > +				 frag_size_tx);
> > +	}  else {
> > +		mask = GDMA4_SGMII0_TX_FRAG_SIZE_MASK;
> > +		val = FIELD_PREP(GDMA4_SGMII0_TX_FRAG_SIZE_MASK,
> > +				 frag_size_tx);
> > +	}
> > +	airoha_fe_rmw(eth, REG_GDMA4_TMBI_FRAG, mask, val);
> > +
> > +	if (dev->nbq == 1) {
> > +		mask = GDMA4_SGMII1_RX_FRAG_SIZE_MASK;
> > +		val = FIELD_PREP(GDMA4_SGMII1_RX_FRAG_SIZE_MASK,
> > +				 frag_size_tx);
> > +	} else {
> > +		mask = GDMA4_SGMII0_RX_FRAG_SIZE_MASK;
> > +		val = FIELD_PREP(GDMA4_SGMII0_RX_FRAG_SIZE_MASK,
> > +				 frag_size_tx);
> > +	}
> > +	airoha_fe_rmw(eth, REG_GDMA4_RMBI_FRAG, mask, val);
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
> > +				     unsigned int num_available_pcs)
> > +{
> > +	struct device *dev = config->dev;
> > +
> > +	return fwnode_phylink_pcs_parse(dev_fwnode(dev), available_pcs,
> > +					&num_available_pcs);
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
> 
> remove new-line here.
> 
> > +
> > +	config->dev = &netdev->dev;
> > +	config->type = PHYLINK_NETDEV;
> > +	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |  MAC_10000FD;
> > +	if (port->id > AIROHA_GDM1_IDX)
> 
> maybe
> 	if (port->id != AIROHA_GDM1_IDX)
> 		...
> 
> > +		config->mac_capabilities |= MAC_10 | MAC_100 | MAC_1000 |
> > +					    MAC_2500FD | MAC_5000FD;
> > +
> > +	err = fwnode_phylink_pcs_parse(dev_fwnode(&netdev->dev), NULL,
> > +				       &config->num_available_pcs);
> > +	if (err)
> > +		return err;
> > +
> > +	config->fill_available_pcs = airoha_fill_available_pcs;
> > +
> > +	/*
> > +	 * GDM1 only supports internal for Embedded Switch
> > +	 * and doesn't require a PCS.
> > +	 */
> > +	if (port->id == AIROHA_GDM1_IDX) {
> > +		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
> > +			  config->supported_interfaces);
> > +	} else {
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
> > @@ -3210,7 +3370,7 @@ static int airoha_alloc_gdm_device(struct airoha_eth *eth,
> >  	dev->nbq = nbq;
> >  	port->devs[index] = dev;
> >  
> > -	return 0;
> > +	return airoha_setup_phylink(netdev);
> >  }
> >  
> >  static int airoha_alloc_gdm_port(struct airoha_eth *eth,
> > @@ -3435,8 +3595,10 @@ static int airoha_probe(struct platform_device *pdev)
> >  				continue;
> >  
> >  			netdev = netdev_from_priv(dev);
> > -			if (netdev->reg_state == NETREG_REGISTERED)
> > +			if (netdev->reg_state == NETREG_REGISTERED) {
> > +				phylink_destroy(dev->phylink);
> >  				unregister_netdev(netdev);
> > +			}
> >  			of_node_put(netdev->dev.of_node);
> >  		}
> >  		airoha_metadata_dst_free(port);
> > @@ -3472,6 +3634,7 @@ static void airoha_remove(struct platform_device *pdev)
> >  				continue;
> >  
> >  			netdev = netdev_from_priv(dev);
> > +			phylink_destroy(dev->phylink);
> >  			unregister_netdev(netdev);
> >  			of_node_put(netdev->dev.of_node);
> >  		}
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
> > index 8f42973f9cf5..1b25603dc64d 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.h
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> > @@ -554,6 +554,9 @@ struct airoha_gdm_dev {
> >  
> >  	u32 flags;
> >  	int nbq;
> > +
> > +	struct phylink *phylink;
> > +	struct phylink_config phylink_config;
> >  };
> >  
> >  struct airoha_gdm_port {
> > diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
> > index 436f3c8779c1..27f2583e143a 100644
> > --- a/drivers/net/ethernet/airoha/airoha_regs.h
> > +++ b/drivers/net/ethernet/airoha/airoha_regs.h
> > @@ -358,6 +358,18 @@
> >  #define IP_FRAGMENT_PORT_MASK		GENMASK(8, 5)
> >  #define IP_FRAGMENT_NBQ_MASK		GENMASK(4, 0)
> >  
> > +#define REG_GDMA4_TMBI_FRAG		0x2028
> > +#define GDMA4_SGMII1_TX_WEIGHT_MASK	GENMASK(31, 26)
> > +#define GDMA4_SGMII1_TX_FRAG_SIZE_MASK	GENMASK(25, 16)
> > +#define GDMA4_SGMII0_TX_WEIGHT_MASK	GENMASK(15, 10)
> > +#define GDMA4_SGMII0_TX_FRAG_SIZE_MASK	GENMASK(9, 0)
> > +
> > +#define REG_GDMA4_RMBI_FRAG		0x202c
> > +#define GDMA4_SGMII1_RX_WEIGHT_MASK	GENMASK(31, 26)
> > +#define GDMA4_SGMII1_RX_FRAG_SIZE_MASK	GENMASK(25, 16)
> > +#define GDMA4_SGMII0_RX_WEIGHT_MASK	GENMASK(15, 10)
> > +#define GDMA4_SGMII0_RX_FRAG_SIZE_MASK	GENMASK(9, 0)
> > +
> >  #define REG_MC_VLAN_EN			0x2100
> >  #define MC_VLAN_EN_MASK			BIT(0)
> >  
> > -- 
> > 2.53.0
> > 



-- 
	Ansuel

