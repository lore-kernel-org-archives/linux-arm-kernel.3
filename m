Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA13E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 07:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emCQUp2iCegmjn8dVAAlwAqY2WeeCPJQsucYkMaAOWQ=; b=jHWA6qsHW/AQf7gZxFs2/cdjXe
	PV9ZjonUPM0cZJehiEHvKb/X34L3d0tF5NJf5Seoe4JlY9cK5f4UJNz5nS8ai4p4DDdR6uKr2qCDS
	Drt4tIQVff4Dn6yVIz/EK6OoTY/csWGva1ymEaKQvSCFaSJ+Sd2XaaPdSCdtzP1Vhq3ENk2fPQvGa
	mldZoEAyrc8sUn8IGMqEdpYfwMpWw5n8/HLP+yR8w1kOFl8EapQFtE9nfqD9HEvXOQXbUugzW/UHD
	dvzN2CaHggI6lzYHcEm8SZxFN/hdCKDWyunO4OMoFDMHNP2Bj281ZKnD7T+tYKY1RpsSu+PEB2itt
	M1BrUAVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOAcB-000000011vK-1XYW;
	Thu, 19 Dec 2024 07:06:31 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOAb4-000000011i7-0NbH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 07:05:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734591922; x=1766127922;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qi2UEcvbZZoPHvb/nA7ujItzrBvcTHn280pAgV2Vk1A=;
  b=bGUUfLTPvnJ/Rl4Bm4KaSEgvQo466a0Dvt2Zpcqq9OQvNd/QhxZlp+B3
   c0Ev/GQn/4oS0YgjFLzlb5qAJVee+pF1YYBcBzheUor5pToALfedvBxmg
   F2lM8/EF8kM9H8oMttu/NIMFD4Mbqs9KW/w70rZP9b51pI5zp7KzRuHxk
   +TLg2q9qbnXIOVNjaFh4+JMceZkS/hXDhztRZRTjz3Dqy7aZ8aClnMixn
   /dJ1H1y98NUR/hHCT9rKT6VGsy6PatLa4T3724sFAZ2MySUOzfa0M/oXg
   WzemORux3MDJy78lJGh08pxbXjCnFRX11lPIOu6rLhUzz9PioXqQtBqD1
   g==;
X-CSE-ConnectionGUID: rzNQvS+iQA+TdNYcfz+L+g==
X-CSE-MsgGUID: eks1xei4R+iBPb5Aayze0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35307906"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="35307906"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 23:05:21 -0800
X-CSE-ConnectionGUID: hE6NrnDXQzaTx3E7puYn5Q==
X-CSE-MsgGUID: zfsYTSODRbeRyMtWKoA6aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="102960238"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 23:05:16 -0800
Date: Thu, 19 Dec 2024 08:02:10 +0100
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
Subject: Re: [PATCH net-next 2/4] net: ti: icssg-prueth: Add VLAN support in
 EMAC mode
Message-ID: <Z2PE5m8R5lM4/YRT@mev-dev.igk.intel.com>
References: <20241216100044.577489-1-danishanwar@ti.com>
 <20241216100044.577489-3-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216100044.577489-3-danishanwar@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_230522_348909_89D77372 
X-CRM114-Status: GOOD (  15.49  )
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

On Mon, Dec 16, 2024 at 03:30:42PM +0530, MD Danish Anwar wrote:
> Add support for vlan filtering in dual EMAC mode.
> 
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---
>  drivers/net/ethernet/ti/icssg/icssg_prueth.c | 29 +++++++++-----------
>  1 file changed, 13 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> index c568c84a032b..e031bccf31dc 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> @@ -822,19 +822,18 @@ static int emac_ndo_vlan_rx_add_vid(struct net_device *ndev,
>  {
>  	struct prueth_emac *emac = netdev_priv(ndev);
>  	struct prueth *prueth = emac->prueth;
> +	int port_mask = BIT(emac->port_id);
>  	int untag_mask = 0;
> -	int port_mask;
>  
> -	if (prueth->is_hsr_offload_mode) {
> -		port_mask = BIT(PRUETH_PORT_HOST) | BIT(emac->port_id);
> -		untag_mask = 0;
> +	if (prueth->is_hsr_offload_mode)
> +		port_mask |= BIT(PRUETH_PORT_HOST);
>  
> -		netdev_dbg(emac->ndev, "VID add vid:%u port_mask:%X untag_mask %X\n",
> -			   vid, port_mask, untag_mask);
> +	netdev_err(emac->ndev, "VID add vid:%u port_mask:%X untag_mask %X\n",
> +		   vid, port_mask, untag_mask);
> +
> +	icssg_vtbl_modify(emac, vid, port_mask, untag_mask, true);
> +	icssg_set_pvid(emac->prueth, vid, emac->port_id);
>  
> -		icssg_vtbl_modify(emac, vid, port_mask, untag_mask, true);
> -		icssg_set_pvid(emac->prueth, vid, emac->port_id);
> -	}
>  	return 0;
>  }
>  
> @@ -843,18 +842,16 @@ static int emac_ndo_vlan_rx_del_vid(struct net_device *ndev,
>  {
>  	struct prueth_emac *emac = netdev_priv(ndev);
>  	struct prueth *prueth = emac->prueth;
> +	int port_mask = BIT(emac->port_id);
>  	int untag_mask = 0;
> -	int port_mask;
>  
> -	if (prueth->is_hsr_offload_mode) {
> +	if (prueth->is_hsr_offload_mode)
>  		port_mask = BIT(PRUETH_PORT_HOST);
> -		untag_mask = 0;
>  
> -		netdev_dbg(emac->ndev, "VID del vid:%u port_mask:%X untag_mask  %X\n",
> -			   vid, port_mask, untag_mask);
> +	netdev_err(emac->ndev, "VID del vid:%u port_mask:%X untag_mask  %X\n",
> +		   vid, port_mask, untag_mask);
Why error? It doesn't look like error path, previously there was
netdev_dbg (made more sense in my opinion)

> +	icssg_vtbl_modify(emac, vid, port_mask, untag_mask, false);
>  
> -		icssg_vtbl_modify(emac, vid, port_mask, untag_mask, false);
> -	}
>  	return 0;
>  }
>  
> -- 
> 2.34.1

