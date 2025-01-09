Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A04E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 17:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTXini+czMs1unGWfy+9RDBWtdxNH7Ox1uD++fpTx/0=; b=nfAZfs+MlhsOnnatLVQ7wbIwB5
	VAa+iecp+ud2gf+utih0rvQCrI7G1wTDvnFiw5rGdY+oGPGoL3FqtWMVoxGWm8y3ScEU+cEFicW57
	36n0m3LfnG8EqltwQXEQekwIu/AXZIcxHhsoIgd9UWEhy+DY3CWK1KVO0AINf00wYOD5muRP7GErr
	Utb+uBAuxXnpXhGnP8Sq5iJD0RlXlYCVnq0agFDr4FAfF28Pvn/RBkMzQWVGjKCoh+JzLivk6uZLl
	CAv9DSPLTCw8Uwgj+hLaLBTQQnksaWju8BIdXFj0Ec2N4m9hZFDgDJmq9XyV5p8z2rvYaeHLEH0iw
	DNvgcVAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwTE-0000000Cr5M-2j1R;
	Thu, 09 Jan 2025 17:37:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvLj-0000000Cfx2-40o6;
	Thu, 09 Jan 2025 16:25:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TTXini+czMs1unGWfy+9RDBWtdxNH7Ox1uD++fpTx/0=; b=OGnb5MsefkDFY+rcMZQ0/+FS8B
	GUqpjoaq6hbKQhyq/3TAVowGz2RfHWM0wi4r1ZjPSmRLQR/v1E+3ZcWtPIE1iDqMHsNWaIPKrc0eW
	xcJOamjb2S+fVxFn4m0nZ2Lw3uD6pgvh0Af5u6Odbk/BfoOonPhuK5Li5qszipXQyFq0yOpObX945
	kzzRZUJMMavCbCNKDahLz72fvLoVZAIhnE/aXJZjd1/5IeTk6Yt/WUBPHw3KVcl7DaOE8C0YzupZa
	bY0izOM5k3ByJ2KzqcVSItGkbh22c7P9YR6QE1qut2g+iYmpkYV65NMhvnluxX0rFyVhBu9GSVBXs
	UsGXf+OQ==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvLh-000000072UA-0xGg;
	Thu, 09 Jan 2025 16:25:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TTXini+czMs1unGWfy+9RDBWtdxNH7Ox1uD++fpTx/0=; b=mv7JKCcr1Vdbzmm78Cb8yDIma2
	KvWR974hzYEBNpvuEPDgEKZPrL4Y28RUqK0390pXSfABbnf8X0Q501h5s9MAW6asQgLZdd0jPB8gk
	/ndpidG2eAMuZX2FV2ktO5JdhBglJmtuTui7VkmSIhLXTO7iVf4uzoW8asKW9YIfxiK4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tVvL9-002wx8-Ey; Thu, 09 Jan 2025 17:24:59 +0100
Date: Thu, 9 Jan 2025 17:24:59 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Basharath Hussain Khaja <basharath@couthit.com>
Subject: Re: [RFC PATCH 04/10] net: ti: prueth: Adds link detection, RX and
 TX support.
Message-ID: <fce8d698-2ae2-460c-a288-3d70d61dbf9e@lunn.ch>
References: <20250109105600.41297-1-basharath@couthit.com>
 <20250109105600.41297-5-basharath@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109105600.41297-5-basharath@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_162533_281504_D806632A 
X-CRM114-Status: GOOD (  11.01  )
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
Cc: nm@ti.com, vigneshr@ti.com, tony@atomide.com, edumazet@google.com, krishna@couthit.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, praneeth@ti.com, m-karicheri2@ti.com, jacob.e.keller@intel.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, richardcochran@gmail.com, prajith@ti.com, rogerq@kernel.org, ssantosh@kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, parvathi@couthit.com, horms@kernel.org, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> +/* update phy/port status information for firmware */
> +static void icssm_emac_update_phystatus(struct prueth_emac *emac)
> +{
> +	struct prueth *prueth = emac->prueth;
> +	u32 phy_speed, port_status = 0;
> +	enum prueth_mem region;
> +	u32 delay;
> +
> +	region = emac->dram;
> +	phy_speed = emac->speed;
> +	icssm_prueth_write_reg(prueth, region, PHY_SPEED_OFFSET, phy_speed);
> +
> +	if (phy_speed == SPEED_10)
> +		delay = TX_CLK_DELAY_10M;

How can speed to 10? You removed those link modes?

> +/**
> + * icssm_emac_ndo_start_xmit - EMAC Transmit function
> + * @skb: SKB pointer
> + * @ndev: EMAC network adapter
> + *
> + * Called by the system to transmit a packet  - we queue the packet in
> + * EMAC hardware transmit queue
> + *
> + * Return: success(NETDEV_TX_OK) or error code (typically out of desc's)
> + */
> +static int icssm_emac_ndo_start_xmit(struct sk_buff *skb,
> +				     struct net_device *ndev)
> +{
> +	struct prueth_emac *emac = netdev_priv(ndev);
> +	int ret = 0;
> +	u16 qid;
> +
> +	if (unlikely(!emac->link)) {
> +		if (netif_msg_tx_err(emac) && net_ratelimit())
> +			netdev_err(ndev, "No link to transmit");
> +		goto fail_tx;
> +	}

Do many other MAC drivers have this test?

> --- a/drivers/net/ethernet/ti/icssm/icssm_prueth.h
> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.h
> @@ -17,6 +17,11 @@
>  
>  /* PRUSS local memory map */
>  #define ICSS_LOCAL_SHARED_RAM	0x00010000
> +#define EMAC_MAX_PKTLEN		(ETH_HLEN + VLAN_HLEN + ETH_DATA_LEN)
> +/* Below macro is for 1528 Byte Frame support, to Allow even with
> + * Redundancy tag
> + */
> +#define EMAC_MAX_FRM_SUPPORT (ETH_HLEN + VLAN_HLEN + ETH_DATA_LEN + 6)

This looks familiar....

	Andrew

