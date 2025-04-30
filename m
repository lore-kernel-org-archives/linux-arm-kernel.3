Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE4AC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 14:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2IvqGiOd1RFtqDBEzJbtP+MrAWxe3TDnb2uwpyIwoU=; b=4FMkl49UPLQmeZ9Kzc0Z9GmKuM
	//4pPA8OqTXSTcmO5Mni1l4V6nbhl5/n0bvRQC1zNaQpYBzsBCr9hvkdKsZMUFsRShrVh3S2WOecs
	PlMUcVJsYcve7Dr4u4XqpgnUgQXgJJyae5jj6GlqoL6Rq9HBk0BzZEWv/qDnfyB3XzBLtKI1R2VO5
	jvZuZhoFpbQyswTCfI7aLTIlAz32BKJB+VA1kvaM99fsTK4eB/tV8Ea8a3dK3AlO54KlrvKqZQKPe
	xvgw+whv1nwKEVhU4DjhFTQgJBOtd+QYym9kKnqK6YxoPxuAuF69dLng3/d/okqvAOQZYmt2WtW4H
	5GkCyBWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA8tR-0000000DC9c-19Bu;
	Wed, 30 Apr 2025 14:58:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA8rV-0000000DBvj-3EeT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 14:56:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E1FF540C52;
	Wed, 30 Apr 2025 14:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4615C4CEE7;
	Wed, 30 Apr 2025 14:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746024997;
	bh=ZDhemFI3wk7+oKmCQPnnKPrmu3o0K0L437vtWpHD45Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p4v+Q51DBosLKEYDP1xu8v1LSCpHW5tdNhk2McmtomzvDiGE0HFITW6RZ67nIetwg
	 nmhpIr8KxlRevmrSr7667phfz509ORcM73+MOb129oRrA3qM1WOvNmgTcFTSWMEkgu
	 SXLZnm5BAogrX/djef6MbfVMBjwIr4JjdxRNPCefxfqFZ3Lz+eJ6a92t1s3x/2+rt+
	 tUbyC/ZbXqJjDbqfX5VeeP2E/Sc7C+hWSfpmN3mlFMBnlJetbFLrWQo2Ae6OBOLsE0
	 00E1RG6nZNE07A8OWeejsGyGj7EW7KWj/jUkKJE8LubYQoOCVmC8exxzgel61ZpGdD
	 yF7WVZypse4zA==
Message-ID: <07c540a2-c645-460c-bfad-c9229d5d5ad0@kernel.org>
Date: Wed, 30 Apr 2025 17:56:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/4] net: ethernet: ti: am65-cpsw: fixup PHY mode
 for fixed RGMII TX delay
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Whitcroft <apw@canonical.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>,
 Jonathan Corbet <corbet@lwn.net>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Tero Kristo <kristo@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <32e0dffa7ea139e7912607a08e391809d7383677.1744710099.git.matthias.schiffer@ew.tq-group.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <32e0dffa7ea139e7912607a08e391809d7383677.1744710099.git.matthias.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_075637_928057_2D9B7471 
X-CRM114-Status: GOOD (  21.14  )
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

Matthias,

On 15/04/2025 13:18, Matthias Schiffer wrote:
> All am65-cpsw controllers have a fixed TX delay, so the PHY interface
> mode must be fixed up to account for this.
> 
> Modes that claim to a delay on the PCB can't actually work. Warn people
Could you please help me understand this statement? Which delay? TX or RX?

Isn't this patch forcing the device tree to have TX delay mentioned in it?

> to update their Device Trees if one of the unsupported modes is specified.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>  drivers/net/ethernet/ti/am65-cpsw-nuss.c | 27 ++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> index c9fd34787c998..a1d32735c7512 100644
> --- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> +++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> @@ -2602,6 +2602,7 @@ static int am65_cpsw_nuss_init_slave_ports(struct am65_cpsw_common *common)
>  		return -ENOENT;
>  
>  	for_each_child_of_node(node, port_np) {
> +		phy_interface_t phy_if;
>  		struct am65_cpsw_port *port;
>  		u32 port_id;
>  
> @@ -2667,14 +2668,36 @@ static int am65_cpsw_nuss_init_slave_ports(struct am65_cpsw_common *common)
>  
>  		/* get phy/link info */
>  		port->slave.port_np = port_np;
> -		ret = of_get_phy_mode(port_np, &port->slave.phy_if);
> +		ret = of_get_phy_mode(port_np, &phy_if);
>  		if (ret) {
>  			dev_err(dev, "%pOF read phy-mode err %d\n",
>  				port_np, ret);
>  			goto of_node_put;
>  		}
>  
> -		ret = phy_set_mode_ext(port->slave.ifphy, PHY_MODE_ETHERNET, port->slave.phy_if);
> +		/* CPSW controllers supported by this driver have a fixed
> +		 * internal TX delay in RGMII mode. Fix up PHY mode to account
> +		 * for this and warn about Device Trees that claim to have a TX
> +		 * delay on the PCB.
> +		 */
> +		switch (phy_if) {
> +		case PHY_INTERFACE_MODE_RGMII_ID:
> +			phy_if = PHY_INTERFACE_MODE_RGMII_RXID;
> +			break;
> +		case PHY_INTERFACE_MODE_RGMII_TXID:
> +			phy_if = PHY_INTERFACE_MODE_RGMII;
> +			break;
> +		case PHY_INTERFACE_MODE_RGMII:
> +		case PHY_INTERFACE_MODE_RGMII_RXID:
> +			dev_warn(dev,
> +				 "RGMII mode without internal TX delay unsupported; please fix your Device Tree\n");
> +			break;
> +		default:
> +			break;
> +		}
> +
> +		port->slave.phy_if = phy_if;
> +		ret = phy_set_mode_ext(port->slave.ifphy, PHY_MODE_ETHERNET, phy_if);
>  		if (ret)
>  			goto of_node_put;
>  

-- 
cheers,
-roger


