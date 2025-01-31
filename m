Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60420C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 10:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yz/KxIbydOeOOFooJEz5fOc5OzGZK7HStt+5NRAP4Sw=; b=4TAXBETuJJjmaaRbk0sn6jaeAD
	wKQ2IVOzw4G87qkFjf6LF4xcFW0oyO52g6NHUh3cYfPFWbkPjs8W4eXH1t0+6aw1j3W/6vbNXhvUf
	eemJxIQjVAX5JgQJdKfaLz/k7GssJjxMmUZvXWEA4l0VCGKrQzBMjCxcK75+FJwCV9hIVJCFcep0t
	FGQsfSfFukat+9egRPkElnOICYfxAPozDt5Vxl7Mw9tWiwArAMcbD2s87Xucv9Sc4mHLFbshGO/Hr
	50doNyQiXQ47EC0CoZo2EA7U40AP+bUjd3jJqf7OBV+/se1YEDPgdA6MWoru+c8OTb5goD7aOdQnR
	/iXx5lIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdoMu-0000000API4-2KjI;
	Fri, 31 Jan 2025 10:35:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdoLb-0000000APC5-0PHR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 10:34:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 154D35C5B48;
	Fri, 31 Jan 2025 10:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B3EC4CED1;
	Fri, 31 Jan 2025 10:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738319641;
	bh=507IordbBCY3IYNuq34NGFeKCmJd+B5w6IiJLC+fePs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AJKwgYx4wGk4PbRGB4npZ2QBeZdqUHm9GDObPJLYwi4QVAeIiD/JUAEdJCA4jfVJX
	 rUJtHR6NXauwiMPCI8XW39mtJWVtbqbHXrWIojC0Q9wyE6Ha2DVWQz1qoFjicDUSz0
	 hxQIAv3AdOZAcrJShTqAxDvFYg4zExkFycMUDIy3KdBbHiTIwPuM4qfvswmshxj8dz
	 MQHzCMpmponYQWuk6LezAa/Qlzp5c3quNX8bQml4td8phwAx9E4ghEJBsP5T6Kjc1J
	 G9dXBO8Z8/Dak5ChT1OTFimS/bk21VAii6mJLZYx+xg9MbvJCPO9DGTYWtgX/cvHT/
	 gmD2oalMNaqzA==
Date: Fri, 31 Jan 2025 10:33:52 +0000
From: Simon Horman <horms@kernel.org>
To: Basharath Hussain Khaja <basharath@couthit.com>
Subject: Re: [RFC v2 PATCH 06/10] net: ti: prueth: Adds HW timestamping
 support for PTP using PRU-ICSS IEP module
Message-ID: <20250131103352.GH24105@kernel.org>
References: <20250124122353.1457174-1-basharath@couthit.com>
 <20250124134056.1459060-7-basharath@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124134056.1459060-7-basharath@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_023403_225747_6B9BED72 
X-CRM114-Status: GOOD (  23.09  )
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
Cc: nm@ti.com, vigneshr@ti.com, tony@atomide.com, edumazet@google.com, krishna@couthit.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, praneeth@ti.com, m-karicheri2@ti.com, jacob.e.keller@intel.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, richardcochran@gmail.com, prajith@ti.com, rogerq@kernel.org, ssantosh@kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, parvathi@couthit.com, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Jan 24, 2025 at 07:10:52PM +0530, Basharath Hussain Khaja wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> PRU-ICSS IEP module, which is capable of timestamping RX and
> TX packets at HW level, is used for time synchronization by PTP4L.
> 
> This change includes interaction between firmware and user space
> application (ptp4l) with required packet timestamps. The driver
> initializes the PRU firmware with appropriate mode and configuration
> flags. Firmware updates local registers with the flags set by driver
> and uses for further operation. RX SOF timestamp comes along with
> packet and firmware will rise interrupt with TX SOF timestamp after
> pushing the packet on to the wire.
> 
> IEP driver is available in upstream and we are reusing for hardware
> configuration for ICSSM as well. On top of that we have extended it
> with the changes for AM57xx SoC.
> 
> Extended ethtool for reading HW timestamping capability of the PRU
> interfaces.
> 
> Currently ordinary clock (OC) configuration has been validated with
> Linux ptp4l.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>

...

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c

...

> @@ -682,9 +899,22 @@ int icssm_emac_rx_packet(struct prueth_emac *emac, u16 *bd_rd_ptr,
>  		src_addr += actual_pkt_len;
>  	}
>  
> +	if (pkt_info->timestamp) {
> +		src_addr = (void *)roundup((uintptr_t)src_addr,
> +					   ICSS_BLOCK_SIZE);

Can PTR_ALIGN() be used here?

> +		dst_addr = &ts;
> +		memcpy(dst_addr, src_addr, sizeof(ts));
> +	}
> +
>  	if (!pkt_info->sv_frame) {
>  		skb_put(skb, actual_pkt_len);
>  
> +		if (icssm_prueth_ptp_rx_ts_is_enabled(emac) &&
> +		    pkt_info->timestamp) {
> +			ssh = skb_hwtstamps(skb);
> +			memset(ssh, 0, sizeof(*ssh));
> +			ssh->hwtstamp = ns_to_ktime(ts);
> +		}
>  		/* send packet up the stack */
>  		skb->protocol = eth_type_trans(skb, ndev);
>  		local_bh_disable();

The code preceding the hunk below is:

static int icssm_emac_request_irqs(struct prueth_emac *emac)
{
	struct net_device *ndev = emac->ndev;
	int ret;

	ret = request_threaded_irq(emac->rx_irq, NULL, icssm_emac_rx_thread,
				   IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
				   ndev->name, ndev);
	if (ret) {
		netdev_err(ndev, "unable to request RX IRQ\n");
		return ret;
	}

> @@ -855,9 +1085,64 @@ static int icssm_emac_request_irqs(struct prueth_emac *emac)
>  		return ret;
>  	}
>  
> +	if (emac->emac_ptp_tx_irq) {
> +		ret = request_threaded_irq(emac->emac_ptp_tx_irq,
> +					   icssm_prueth_ptp_tx_irq_handle,
> +					   icssm_prueth_ptp_tx_irq_work,
> +					   IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +					   ndev->name, ndev);
> +		if (ret) {
> +			netdev_err(ndev, "unable to request PTP TX IRQ\n");
> +			free_irq(emac->rx_irq, ndev);
> +			free_irq(emac->tx_irq, ndev);

This seems somewhat asymmetric. This function does request emac->rx_irq
but not emac->tx_irq. So I don't think it is appropriate to free emac->tx_irq
here.

Also, I would suggest using a goto label for unwind here.

> +		}
> +	}
> +
>  	return ret;
>  }
>  

...

