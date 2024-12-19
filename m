Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957D1E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 07:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NQVQSzUcgckGzNm/G+sHNAy/MIxr80U/xLcKk2Fov1Q=; b=LeYrYkUJcy7Ay2LGzsabcfzzyf
	UFpexHT3RbpS6LFNTr+n17Bt5ZM9hv5wnvTkpqAG6W8nCfCsAU381cPgdJ0p5yprpoWev+5o0nULP
	+2KyDFyse1LrPQPXIEmN+Rw3kn17+GJGOTDqmEBr8sdGPCXShZgLRfW9Ie9cVtLgThJWnLpfV3KVG
	7rAJ1wohdW3UIVVKsRg7Z2IWCDhcoVD2WYlK0qtXCRfld5rSSWBVieVPG0uPeNwXTSZD2aMfLwq9z
	cHC+q/N+YE3u4ZZMcvuyRwXMuMEMwBnmIezglSjMg+15lKwoYCh7L9PW8zWRjJli8kpi7hvFNHbYQ
	Bs/pgYCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOBET-000000018rG-41CM;
	Thu, 19 Dec 2024 07:46:05 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOB0G-000000015xs-3UWU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 07:31:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734593485; x=1766129485;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZZ4Yw8mnLFE9pr9KFpUOJ0wK/oQg7MB5V5+2UKyheDk=;
  b=dLt36csg+3ZY1poM1gGDnQLfNbHFl/Z+zdKThqB/jRk5M5jDLRiAiWVA
   C9sq4nZwZAoO4u4+tEmS8heJ5OIPVmIpWu8cPcKmhnuGBSWGtgCfobEfU
   lTvrNzYiAhEoVwHWbSGWP6j5+Q8leDnQsNRhL1i1HKfIcMRf4qQ89Fic6
   DV5Un8PAbPLB9HdsN0FWHlTndO3novhdwZTgGoIe2/hnw+OMVAmfdNflj
   asMILPYrvOFdqvapMlhgTR4hFP5EhMbxMN09rsmVfzDsNr3n6xgyhNX9p
   gvgNMe2CcBkv3vUHYUItPuXdKsK1CirwHQe9SfvfGdV/IvgXDr/gMJIkT
   w==;
X-CSE-ConnectionGUID: unmUa+VkT/C8395J6cuLiw==
X-CSE-MsgGUID: CiFlO8GFSkS+4YIAUS2MyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="52617402"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="52617402"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 23:31:24 -0800
X-CSE-ConnectionGUID: YXZ1m4t6Sk+gTUfnKbNs4g==
X-CSE-MsgGUID: 8cusURGOSjiiGLYNquOujQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102249969"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 23:31:19 -0800
Date: Thu, 19 Dec 2024 08:28:14 +0100
From: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: aleksander.lobakin@intel.com, lukma@denx.de, m-malladi@ti.com,
	diogo.ivo@siemens.com, rdunlap@infradead.org,
	schnelle@linux.ibm.com, vladimir.oltean@nxp.com, horms@kernel.org,
	rogerq@kernel.org, pabeni@redhat.com, kuba@kernel.org,
	edumazet@google.com, davem@davemloft.net, andrew+netdev@lunn.ch,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH net-next 3/4] net: ti: icssg-prueth: Add Multicast
 Filtering support for VLAN in MAC mode
Message-ID: <Z2PLDqqrLdXhLtAF@mev-dev.igk.intel.com>
References: <20241216100044.577489-1-danishanwar@ti.com>
 <20241216100044.577489-4-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216100044.577489-4-danishanwar@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_233124_887478_33D6D0FF 
X-CRM114-Status: GOOD (  31.63  )
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

On Mon, Dec 16, 2024 at 03:30:43PM +0530, MD Danish Anwar wrote:
> Add multicast filtering support for VLAN interfaces in dual EMAC mode
> for ICSSG driver.
> 
> The driver uses vlan_for_each() API to get the list of available
> vlans. The driver then sync mc addr of vlan interface with a locally
> mainatined list emac->vlan_mcast_list[vid] using __hw_addr_sync_multiple()
> API.
> 
> The driver then calls the sync / unsync callbacks and based on whether
> the ndev is vlan or not, driver passes appropriate vid to FDB helper
> functions.
> 
> This commit also exports __hw_addr_sync_multiple() in order to use it
> from the ICSSG driver.
> 
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---
>  drivers/net/ethernet/ti/icssg/icssg_prueth.c | 69 ++++++++++++++++----
>  drivers/net/ethernet/ti/icssg/icssg_prueth.h |  6 ++
>  include/linux/netdevice.h                    |  3 +
>  net/core/dev_addr_lists.c                    |  7 +-
>  4 files changed, 68 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> index e031bccf31dc..a18773ef6eab 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> @@ -472,30 +472,43 @@ const struct icss_iep_clockops prueth_iep_clockops = {
>  
>  static int icssg_prueth_add_mcast(struct net_device *ndev, const u8 *addr)
>  {
> -	struct prueth_emac *emac = netdev_priv(ndev);
> -	int port_mask = BIT(emac->port_id);
> +	struct net_device *real_dev;
> +	struct prueth_emac *emac;
> +	int port_mask;
> +	u8 vlan_id;
>  
> -	port_mask |= icssg_fdb_lookup(emac, addr, 0);
> -	icssg_fdb_add_del(emac, addr, 0, port_mask, true);
> -	icssg_vtbl_modify(emac, 0, port_mask, port_mask, true);
> +	vlan_id = is_vlan_dev(ndev) ? vlan_dev_vlan_id(ndev) : PRUETH_DFLT_VLAN_MAC;
> +	real_dev = is_vlan_dev(ndev) ? vlan_dev_real_dev(ndev) : ndev;
Looks like a helper for that can be nice to have.

> +	emac = netdev_priv(real_dev);
> +
> +	port_mask = BIT(emac->port_id) | icssg_fdb_lookup(emac, addr, vlan_id);
> +	icssg_fdb_add_del(emac, addr, vlan_id, port_mask, true);
> +	icssg_vtbl_modify(emac, vlan_id, port_mask, port_mask, true);
>  
>  	return 0;
>  }
>  
>  static int icssg_prueth_del_mcast(struct net_device *ndev, const u8 *addr)
>  {
> -	struct prueth_emac *emac = netdev_priv(ndev);
> -	int port_mask = BIT(emac->port_id);
> +	struct net_device *real_dev;
> +	struct prueth_emac *emac;
>  	int other_port_mask;
> +	int port_mask;
> +	u8 vlan_id;
> +
> +	vlan_id = is_vlan_dev(ndev) ? vlan_dev_vlan_id(ndev) : PRUETH_DFLT_VLAN_MAC;
> +	real_dev = is_vlan_dev(ndev) ? vlan_dev_real_dev(ndev) : ndev;
> +	emac = netdev_priv(real_dev);
>  
> -	other_port_mask = port_mask ^ icssg_fdb_lookup(emac, addr, 0);
> +	port_mask = BIT(emac->port_id);
> +	other_port_mask = port_mask ^ icssg_fdb_lookup(emac, addr, vlan_id);
>  
> -	icssg_fdb_add_del(emac, addr, 0, port_mask, false);
> -	icssg_vtbl_modify(emac, 0, port_mask, port_mask, false);
> +	icssg_fdb_add_del(emac, addr, vlan_id, port_mask, false);
> +	icssg_vtbl_modify(emac, vlan_id, port_mask, port_mask, false);
>  
>  	if (other_port_mask) {
> -		icssg_fdb_add_del(emac, addr, 0, other_port_mask, true);
> -		icssg_vtbl_modify(emac, 0, other_port_mask, other_port_mask, true);
> +		icssg_fdb_add_del(emac, addr, vlan_id, other_port_mask, true);
> +		icssg_vtbl_modify(emac, vlan_id, other_port_mask, other_port_mask, true);
>  	}
>  
>  	return 0;
> @@ -531,6 +544,28 @@ static int icssg_prueth_hsr_del_mcast(struct net_device *ndev, const u8 *addr)
>  	return 0;
>  }
>  
> +static int icssg_update_vlan_mcast(struct net_device *vdev, int vid,
> +				   void *args)
> +{
> +	struct net_device *vport_ndev;
> +	struct prueth_emac *emac;
> +
> +	if (!vdev || !vid)
> +		return 0;
> +
> +	vport_ndev = vlan_dev_real_dev(vdev);
> +	emac = netdev_priv(vport_ndev);
> +
> +	netif_addr_lock_bh(vdev);
> +	__hw_addr_sync_multiple(&emac->vlan_mcast_list[vid], &vdev->mc, vdev->addr_len);
Only question, why dev_mc_sync_multiple can't be used here?

> +	netif_addr_unlock_bh(vdev);
> +
> +	__hw_addr_sync_dev(&emac->vlan_mcast_list[vid], vdev,
> +			   icssg_prueth_add_mcast, icssg_prueth_del_mcast);
> +
> +	return 0;
> +}
> +
>  /**
>   * emac_ndo_open - EMAC device open
>   * @ndev: network adapter device
> @@ -772,12 +807,17 @@ static void emac_ndo_set_rx_mode_work(struct work_struct *work)
>  		return;
>  	}
>  
> -	if (emac->prueth->is_hsr_offload_mode)
> +	if (emac->prueth->is_hsr_offload_mode) {
>  		__dev_mc_sync(ndev, icssg_prueth_hsr_add_mcast,
>  			      icssg_prueth_hsr_del_mcast);
> -	else
> +	} else {
>  		__dev_mc_sync(ndev, icssg_prueth_add_mcast,
>  			      icssg_prueth_del_mcast);
> +		if (rtnl_trylock()) {
> +			vlan_for_each(ndev, icssg_update_vlan_mcast, NULL);
> +			rtnl_unlock();
> +		}
> +	}
>  }
>  
>  /**
> @@ -828,6 +868,7 @@ static int emac_ndo_vlan_rx_add_vid(struct net_device *ndev,
>  	if (prueth->is_hsr_offload_mode)
>  		port_mask |= BIT(PRUETH_PORT_HOST);
>  
> +	__hw_addr_init(&emac->vlan_mcast_list[vid]);
>  	netdev_err(emac->ndev, "VID add vid:%u port_mask:%X untag_mask %X\n",
>  		   vid, port_mask, untag_mask);
>  
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
> index f5c1d473e9f9..4da8b87408b5 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
> @@ -83,6 +83,10 @@
>  #define ICSS_CMD_ADD_FILTER 0x7
>  #define ICSS_CMD_ADD_MAC 0x8
>  
> +/* VLAN Filtering Related MACROs */
> +#define PRUETH_DFLT_VLAN_MAC	0
> +#define MAX_VLAN_ID		256
> +
>  /* In switch mode there are 3 real ports i.e. 3 mac addrs.
>   * however Linux sees only the host side port. The other 2 ports
>   * are the switch ports.
> @@ -201,6 +205,8 @@ struct prueth_emac {
>  	/* RX IRQ Coalescing Related */
>  	struct hrtimer rx_hrtimer;
>  	unsigned long rx_pace_timeout_ns;
> +
> +	struct netdev_hw_addr_list vlan_mcast_list[MAX_VLAN_ID];
>  };
>  
>  /**
> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> index d917949bba03..a5c169b19543 100644
> --- a/include/linux/netdevice.h
> +++ b/include/linux/netdevice.h
> @@ -4685,6 +4685,9 @@ int devm_register_netdev(struct device *dev, struct net_device *ndev);
>  /* General hardware address lists handling functions */
>  int __hw_addr_sync(struct netdev_hw_addr_list *to_list,
>  		   struct netdev_hw_addr_list *from_list, int addr_len);
> +int __hw_addr_sync_multiple(struct netdev_hw_addr_list *to_list,
> +			    struct netdev_hw_addr_list *from_list,
> +			    int addr_len);
>  void __hw_addr_unsync(struct netdev_hw_addr_list *to_list,
>  		      struct netdev_hw_addr_list *from_list, int addr_len);
>  int __hw_addr_sync_dev(struct netdev_hw_addr_list *list,
> diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
> index 166e404f7c03..90716bd736f3 100644
> --- a/net/core/dev_addr_lists.c
> +++ b/net/core/dev_addr_lists.c
> @@ -242,9 +242,9 @@ static void __hw_addr_unsync_one(struct netdev_hw_addr_list *to_list,
>  	__hw_addr_del_entry(from_list, ha, false, false);
>  }
>  
> -static int __hw_addr_sync_multiple(struct netdev_hw_addr_list *to_list,
> -				   struct netdev_hw_addr_list *from_list,
> -				   int addr_len)
> +int __hw_addr_sync_multiple(struct netdev_hw_addr_list *to_list,
> +			    struct netdev_hw_addr_list *from_list,
> +			    int addr_len)
>  {
>  	int err = 0;
>  	struct netdev_hw_addr *ha, *tmp;
> @@ -260,6 +260,7 @@ static int __hw_addr_sync_multiple(struct netdev_hw_addr_list *to_list,
>  	}
>  	return err;
>  }
> +EXPORT_SYMBOL(__hw_addr_sync_multiple);
>  
>  /* This function only works where there is a strict 1-1 relationship
>   * between source and destination of they synch. If you ever need to
> -- 
> 2.34.1

