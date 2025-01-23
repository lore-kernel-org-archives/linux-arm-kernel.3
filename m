Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28349C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 07:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcGfEedhE7m9EkCg6qCuIbrFQfNbCC4sY3ipNadpGYM=; b=o9XwAp8hCXEvH1hTLFpyxd0kUN
	kiR7vmqYZinPFfZsC1NV6Wr57NQIXklOuCHIgWB9vZDxgZXBfrHO1KqYhNZ+MPr4coKhsJ6KMWAn8
	84csg8Npp2P76i2AgR55RciJ9lHfc8TTHpf2vrkc2B7nWj2WwWaKnr8Yk5FCOdc6WfFb20HejC1O2
	TRvZRY0kAV72zE6qnLNcM+8atjUhX8jG9gl94ODS+iTb1VRXZmKSDd6ymOUJ4JlZgYLs1Vf3s+Znf
	U2S/2v62SHCtE6lVL9VOyfq0SMkhOHoUGsYCUtIenVToBhgai/2/9h7Wocyv0oKFXxBr67QlnQ68E
	dfe3++9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tarTJ-0000000BqRh-1tKK;
	Thu, 23 Jan 2025 07:17:49 +0000
Received: from smtp-78.smtpout.orange.fr ([80.12.242.78] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tarRz-0000000BqMC-3aum
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 07:16:29 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id arRhtWwm7puS4arRktmPw9; Thu, 23 Jan 2025 08:16:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1737616579;
	bh=hcGfEedhE7m9EkCg6qCuIbrFQfNbCC4sY3ipNadpGYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=RCJG0LZST/c9iDLh1h2eAi6tSx/hpX4+/bh3htnH7e0khwHvVG9w0wmLaMSqWoIKp
	 Dj5MuOopdZZPzFZYTVgeAZP4r2kEpipHdhLDaXRcWSFYkFdOQIpMyxwZRoAMy2ktAn
	 Bje5JvwCdghoQ+Lc979DeoZ1Hp86EW8rXBWf9vsznO3tlugwsDRcD88SPPpHSLw/zo
	 MElRrxYMfPZt3Mo6dn1oOk5onWSMY+Nzc/GUus2vqY28VyMd5DkisxlmxxqXjzLfQX
	 J8Q+ovpUs4OrHzP4QjQjV3YjYnNw726t2qx+ebfn8P6xe+c0g4FSEXAqp/a/O9M0Wy
	 97uvgBG44uDDQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 23 Jan 2025 08:16:19 +0100
X-ME-IP: 90.11.132.44
Message-ID: <6ac6161b-373a-47ce-801d-9e4ff1ef258c@wanadoo.fr>
Date: Thu, 23 Jan 2025 08:16:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 04/10] net: ti: prueth: Adds link detection, RX and TX
 support.
To: Basharath Hussain Khaja <basharath@couthit.com>, danishanwar@ti.com,
 rogerq@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org,
 tony@atomide.com, richardcochran@gmail.com, parvathi@couthit.com,
 schnelle@linux.ibm.com, rdunlap@infradead.org, diogo.ivo@siemens.com,
 m-karicheri2@ti.com, horms@kernel.org, jacob.e.keller@intel.com,
 m-malladi@ti.com, javier.carrasco.cruz@gmail.com, afd@ti.com, s-anna@ti.com
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, pratheesh@ti.com, prajith@ti.com,
 vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
 krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com
References: <20250109105600.41297-1-basharath@couthit.com>
 <20250109105600.41297-5-basharath@couthit.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250109105600.41297-5-basharath@couthit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_231628_443905_C4EA33CA 
X-CRM114-Status: GOOD (  15.33  )
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

Le 09/01/2025 à 11:55, Basharath Hussain Khaja a écrit :
> From: Roger Quadros <rogerq@ti.com>
> 
> Changes corresponding to link configuration such as speed and duplexity.
> IRQ and handler initializations are performed for packet reception.Firmware
> receives the packet from the wire and stores it into OCMC queue. Next, it
> notifies the CPU via interrupt. Upon receiving the interrupt CPU will
> service the IRQ and packet will be processed by pushing the newly allocated
> SKB to upper layers.
> 
> When the user application want to transmit a packet, it will invoke
> sys_send() which will inturn invoke the PRUETH driver, then it will write
> the packet into OCMC queues. PRU firmware will pick up the packet and
> transmit it on to the wire.

Hi,
a few nitpicks.

...

> +static int icssm_prueth_tx_enqueue(struct prueth_emac *emac,
> +				   struct sk_buff *skb,
> +				   enum prueth_queue_id queue_id)
> +{
> +	struct prueth_queue_desc __iomem *queue_desc;
> +	const struct prueth_queue_info *txqueue;
> +	u16 bd_rd_ptr, bd_wr_ptr, update_wr_ptr;
> +	struct net_device *ndev = emac->ndev;
> +	unsigned int buffer_desc_count;
> +	int free_blocks, update_block;
> +	bool buffer_wrapped = false;
> +	int write_block, read_block;
> +	void *src_addr, *dst_addr;
> +	int pkt_block_size;
> +	void __iomem *dram;
> +	int txport, pktlen;
> +	u32 wr_buf_desc;
> +	void *ocmc_ram;
> +
> +	dram = emac->prueth->mem[emac->dram].va;
> +	if (eth_skb_pad(skb)) {
> +		if (netif_msg_tx_err(emac) && net_ratelimit())
> +			netdev_err(ndev, "packet pad failed");

Missing trailing \n.

> +		return -ENOMEM;
> +	}
> +
> +	/* which port to tx: MII0 or MII1 */
> +	txport = emac->tx_port_queue;

...

> +static int icssm_emac_request_irqs(struct prueth_emac *emac)
> +{
> +	struct net_device *ndev = emac->ndev;
> +	int ret = 0;

No need to init.

> +
> +	ret = request_threaded_irq(emac->rx_irq, NULL, icssm_emac_rx_thread,
> +				   IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +				   ndev->name, ndev);
> +	if (ret) {
> +		netdev_err(ndev, "unable to request RX IRQ\n");
> +		return ret;
> +	}

...

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

\n

> +		goto fail_tx;
> +	}
> +
> +	qid = icssm_prueth_get_tx_queue_id(emac->prueth, skb);...
CJ

