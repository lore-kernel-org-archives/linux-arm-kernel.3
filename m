Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E15CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 20:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFb8a4MiQzJjJNDBUT9PdXXwC4utxv2vDZJA5zBqRTg=; b=dSaVg1QB5wCq2O5kW2tulVxUYn
	Q9livVFUzQts+GcKoBw/2Mpu1FUkzFGnbjF0FST6ZvyvLuQBde33LxsDWch4IwQNtNCRgJhnskG5T
	ZJ7zfyVg3CATieQlnnMOZdIpzfOm4Tc/O00789A78vybVRje3gDug9PoVk29G9LwENpoT6v7RkykK
	7PV9hHGDmkif7+IvjOaMaXD8nmqJGEjzmJr+TtMm8XQ8AuC7/ea73pG7HbtuK0lR6Bnt3EhXsjWzh
	JoeRNEAlh8WVdXenzJ1yHw5/JEKf9ixoCX0ClIMhC9RZo37qSxuoSBZtmm0qdZVmQoyg3nC73nfJM
	5BMsWHjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCl01-0000000Bj8B-3gr6;
	Sat, 25 Oct 2025 20:36:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCkzz-0000000Bj7E-0ont;
	Sat, 25 Oct 2025 20:36:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fFb8a4MiQzJjJNDBUT9PdXXwC4utxv2vDZJA5zBqRTg=; b=fTxVjdRABNw94iQ5qsgAUSOe0Z
	lggkW4Q1HlDvl+ZCNtZDZmxmJ+/3tTd2rzw/xUEn3N+JdQp6UYuj9hm4StBZmzw9TndQbJ/BfgrBe
	pq1R5qOSaOq566qLKoY2LEEe0zytQmx38TbAmhhjHeZYbeFBgK8/hpjCSMGzoFIB/94sf8PBZou9a
	Noi49bH2TVsBceWtsssjU5Wv8CNTjji2Iyu8nnZWvety2VIFVGpWzI5ZotjLIFRxX4OByl6NlXihY
	LT9ZgGqHFYdfls4sgDl32n2comvEL2wgWBCIhO7xpBeJqlwltytD/MMGhHGr++302FztABLBhln8r
	CMmlP9NA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44906)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vCkzs-000000000Ns-3tE4;
	Sat, 25 Oct 2025 21:36:21 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vCkzr-000000003zc-1IOQ;
	Sat, 25 Oct 2025 21:36:19 +0100
Date: Sat, 25 Oct 2025 21:36:19 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v2 2/2] net: airoha: add phylink support for GDM1
Message-ID: <aP00w4CQdeX9GIJA@shell.armlinux.org.uk>
References: <20251023145850.28459-1-ansuelsmth@gmail.com>
 <20251023145850.28459-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023145850.28459-3-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_133627_257718_518096F4 
X-CRM114-Status: GOOD (  28.24  )
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

On Thu, Oct 23, 2025 at 04:58:49PM +0200, Christian Marangi wrote:
> In preparation for support of GDM2+ port, fill in phylink OPs for GDM1
> that is an INTERNAL port for the Embedded Switch.
> 
> Add all the phylink start/stop and fill in the MAC capabilities and the
> internal interface as the supported interface.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/net/ethernet/airoha/Kconfig      |  1 +
>  drivers/net/ethernet/airoha/airoha_eth.c | 77 +++++++++++++++++++++++-
>  drivers/net/ethernet/airoha/airoha_eth.h |  3 +
>  3 files changed, 80 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/airoha/Kconfig b/drivers/net/ethernet/airoha/Kconfig
> index ad3ce501e7a5..3c74438bc8a0 100644
> --- a/drivers/net/ethernet/airoha/Kconfig
> +++ b/drivers/net/ethernet/airoha/Kconfig
> @@ -2,6 +2,7 @@
>  config NET_VENDOR_AIROHA
>  	bool "Airoha devices"
>  	depends on ARCH_AIROHA || COMPILE_TEST
> +	select PHYLIB

This looks wrong if you're using phylink.

>  	help
>  	  If you have a Airoha SoC with ethernet, say Y.
>  
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index ce6d13b10e27..deba909104bb 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1613,6 +1613,8 @@ static int airoha_dev_open(struct net_device *dev)
>  	struct airoha_gdm_port *port = netdev_priv(dev);
>  	struct airoha_qdma *qdma = port->qdma;
>  
> +	phylink_start(port->phylink);
> +
>  	netif_tx_start_all_queues(dev);
>  	err = airoha_set_vip_for_gdm_port(port, true);
>  	if (err)

phylink_start() _can_ bring the carrier up immediately. Is the netdev
ready to start operating at the point phylink_start() has been called?
This error handling suggests the answer is "no", and the lack of
phylink_stop() in the error path is also a red flag.

> @@ -1665,6 +1667,8 @@ static int airoha_dev_stop(struct net_device *dev)
>  		}
>  	}
>  
> +	phylink_stop(port->phylink);
> +
>  	return 0;
>  }
>  
> @@ -2813,6 +2817,18 @@ static const struct ethtool_ops airoha_ethtool_ops = {
>  	.get_link		= ethtool_op_get_link,
>  };
>  
> +static struct phylink_pcs *airoha_phylink_mac_select_pcs(struct phylink_config *config,
> +			phy_interface_t interface)

I'd write this as:

static struct phylink_pcs *
airoha_phylink_mac_select_pcs(struct phylink_config *config,
			      phy_interface_t interface)

but:

> +{
> +	return NULL;
> +}

Not sure what the point of this is, as this will be the effect if
this function is not provided.

> +
> +static void airoha_mac_config(struct phylink_config *config,
> +			      unsigned int mode,
> +			      const struct phylink_link_state *state)
> +{
> +}
> +
>  static int airoha_metadata_dst_alloc(struct airoha_gdm_port *port)
>  {
>  	int i;
> @@ -2857,6 +2873,57 @@ bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
>  	return false;
>  }
>  
> +static void airoha_mac_link_up(struct phylink_config *config,
> +			       struct phy_device *phy, unsigned int mode,
> +			       phy_interface_t interface, int speed,
> +			       int duplex, bool tx_pause, bool rx_pause)
> +{
> +}
> +
> +static void airoha_mac_link_down(struct phylink_config *config,
> +				 unsigned int mode, phy_interface_t interface)
> +{
> +}
> +
> +static const struct phylink_mac_ops airoha_phylink_ops = {
> +	.mac_select_pcs = airoha_phylink_mac_select_pcs,
> +	.mac_config = airoha_mac_config,
> +	.mac_link_up = airoha_mac_link_up,
> +	.mac_link_down = airoha_mac_link_down,
> +};

All the called methods are entirely empty, meaning that anything that
phylink reports may not reflect what is going on with the device.

Is there a plan to implement these methods?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

