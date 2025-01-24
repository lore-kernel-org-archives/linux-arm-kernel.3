Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2C6C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 23:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0XaHocYpjBMm1kr/4P6FLGq+gbasSGEMI2ExACwoaU=; b=FshAQDQf3C+F4HAKl6XLvNaeA9
	Ip7vc2j9Y655+3DuGN/GzRPH7jYI7HdvGGtXynmErjKT5bS9PcflkUscq5vco3Bdz8KPzYisc1gcS
	YfY1ZZ05AhI7F22xhTZN2vdfOJrfA4Tz2Att+brIMTqU5Jy57piwPwwEr6W22opNSPv7kBRsno92U
	SaCDsbNUWklaqamSiR3JdlmtB7yaKajx3YDH/cVjUhbxRolQ1QC4E/JdMCtFsoto8awVh9BG7VoDQ
	soIbr9xGWB1+tYBsdpAcyxsHyX+JuqcoHD35N6wBlaftGZTtiwNeU0HagPydauNT27P4q4pynmiqB
	rk8kzNOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSw1-0000000Fh6H-0jEA;
	Fri, 24 Jan 2025 23:17:57 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSs0-0000000Fgg6-10wh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 23:13:50 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-844df397754so71059339f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 15:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1737760427; x=1738365227; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0XaHocYpjBMm1kr/4P6FLGq+gbasSGEMI2ExACwoaU=;
        b=B4vT0BuDXZclrkhTscT1WYId+uj2GxfKlEtbWGEzBznZlExbb19m1sILEf9dCwMl4A
         q5HMMgBojINqyDPxwvOydR6Frlwq48HKi5rJ3Qa+QNJhgvNHWHFbNEZ/u0IsFNQy1Zij
         +y39yAQauM39ArWztMPrD2rrsEwjnEKki0DjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737760427; x=1738365227;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h0XaHocYpjBMm1kr/4P6FLGq+gbasSGEMI2ExACwoaU=;
        b=TRNbFzYtObgbw0CnQyy00b7eoV7g0P2/twYHAW6jcn/w7/ufukASX0IqjqvehKxrub
         8ZyEx6Zshgq3dM8TWAlN4T8ocdQlmRwJx+e/9A3+cYYyn4C0In+AK5aGYK8GRGCViE1u
         5y4bZIESnDBhsAJynX5uUkNPV15u/9FwOkREzelDC5PDf6xSHJrH+AUdX8yQ4g92FOe8
         EehBUVyZNYRlbg/nmMjuLAllXF3ubqOS6bklWhnumwAlxonLmjygEOK2pMdomLrEodGD
         J9Jx8ONH28CiAnFSjo3G8F6caNel5uayOWSjZMqlcIYTXAK2hIvh/MYJXpV4rVzvqmpN
         zSJA==
X-Forwarded-Encrypted: i=1; AJvYcCVuzBi8JBvWLf3xIrCaE8q4iH9eo9TYDiI7tfrYRCN8nbIw5scSa00++EvkluCqzBf5pwS+4RnPORZAC2Kt2u8m@lists.infradead.org
X-Gm-Message-State: AOJu0YyqdZ6rzn5HYy8Slt+iAea6RSR8UKEPcWTq7VeYQ6BNqVCqnJ31
	Lz7aQZZkHoYbkRh09XM4KVc9X5jWM415Rih5SvYOjotYJZoivoN9F4Zim8BbElc=
X-Gm-Gg: ASbGncvyPp4otkVOiQ+TrtBQewRmlSfuMjZEj/qK2qDBaGs0G2tehCCvKQ/3LZLgKfW
	CCweu3R5fOxR6p0BqJpolK5r3LYi1RoumCW0TbaX7tXNxgOZcEf6lRhSHeP14zHMNAwO0WQ6dqw
	mp1n0rfCsYln7+l9VW6eydvAsKdLISo0t/cI/tbrHxkP6h9Iq/tCaWsWcu3GmLzsOvwGK9d40B4
	PdIjRs56EtWpO/zi34ICNTkFM8GMJwdoy8sMQyq1JRA4R8=
X-Google-Smtp-Source: AGHT+IGVVBGfEdi2ND44dQvzJycmDmT9wC964cNHWq8xu4fhYbtR7D+cmmqExueT+DEvZOFAxLuYGA==
X-Received: by 2002:a05:6602:3e88:b0:84f:41cb:1895 with SMTP id ca18e2360f4ac-851b616dc39mr2821802739f.1.1737760426589;
        Fri, 24 Jan 2025 15:13:46 -0800 (PST)
Received: from LQ3V64L9R2 ([75.104.111.203])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec1da4461dsm917901173.56.2025.01.24.15.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 15:13:45 -0800 (PST)
Date: Fri, 24 Jan 2025 15:13:04 -0800
From: Joe Damato <jdamato@fastly.com>
To: Basharath Hussain Khaja <basharath@couthit.com>
Subject: Re: [RFC v2 PATCH 04/10] net: ti: prueth: Adds link detection, RX
 and TX support.
Message-ID: <Z5QegAP71PkbppOO@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Basharath Hussain Khaja <basharath@couthit.com>, danishanwar@ti.com,
	rogerq@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
	ssantosh@kernel.org, tony@atomide.com, richardcochran@gmail.com,
	parvathi@couthit.com, schnelle@linux.ibm.com, rdunlap@infradead.org,
	diogo.ivo@siemens.com, m-karicheri2@ti.com, horms@kernel.org,
	jacob.e.keller@intel.com, m-malladi@ti.com,
	javier.carrasco.cruz@gmail.com, afd@ti.com, s-anna@ti.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, pratheesh@ti.com, prajith@ti.com,
	vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
	krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com
References: <20250124122353.1457174-1-basharath@couthit.com>
 <20250124123707.1457639-5-basharath@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124123707.1457639-5-basharath@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_151348_340678_B8E83B40 
X-CRM114-Status: GOOD (  42.93  )
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

On Fri, Jan 24, 2025 at 06:07:01PM +0530, Basharath Hussain Khaja wrote:
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
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> ---
>  drivers/net/ethernet/ti/icssm/icssm_prueth.c | 599 ++++++++++++++++++-
>  drivers/net/ethernet/ti/icssm/icssm_prueth.h |  46 ++
>  2 files changed, 640 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> index 82ed0e3a0d88..0ba1d16a7a15 100644
> --- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c

[...]

> +/**
> + * icssm_prueth_tx_enqueue - queue a packet to firmware for transmission
> + *
> + * @emac: EMAC data structure
> + * @skb: packet data buffer
> + * @queue_id: priority queue id
> + *
> + * Return: 0 (Success)
> + */
> +static int icssm_prueth_tx_enqueue(struct prueth_emac *emac,
> +				   struct sk_buff *skb,
> +				   enum prueth_queue_id queue_id)
> +{

[...]

> +
> +	/* which port to tx: MII0 or MII1 */
> +	txport = emac->tx_port_queue;
> +	src_addr = skb->data;
> +	pktlen = skb->len;
> +	/* Get the tx queue */
> +	queue_desc = emac->tx_queue_descs + queue_id;
> +	txqueue = &queue_infos[txport][queue_id];
> +
> +	buffer_desc_count = txqueue->buffer_desc_end -
> +			    txqueue->buffer_desc_offset;
> +	buffer_desc_count /= BD_SIZE;
> +	buffer_desc_count++;
> +
> +	bd_rd_ptr = readw(&queue_desc->rd_ptr);
> +	bd_wr_ptr = readw(&queue_desc->wr_ptr);
> +
> +	/* the PRU firmware deals mostly in pointers already
> +	 * offset into ram, we would like to deal in indexes
> +	 * within the queue we are working with for code
> +	 * simplicity, calculate this here
> +	 */
> +	write_block = (bd_wr_ptr - txqueue->buffer_desc_offset) / BD_SIZE;
> +	read_block = (bd_rd_ptr - txqueue->buffer_desc_offset) / BD_SIZE;

Seems like there's a lot of similar code repeated in the rx code
path.

Maybe there's a way to simplify it all with a helper of some sort?

> +	if (write_block > read_block) {
> +		free_blocks = buffer_desc_count - write_block;
> +		free_blocks += read_block;
> +	} else if (write_block < read_block) {
> +		free_blocks = read_block - write_block;
> +	} else { /* they are all free */
> +		free_blocks = buffer_desc_count;
> +	}
> +
> +	pkt_block_size = DIV_ROUND_UP(pktlen, ICSS_BLOCK_SIZE);
> +	if (pkt_block_size > free_blocks) /* out of queue space */
> +		return -ENOBUFS;
> +
> +	/* calculate end BD address post write */
> +	update_block = write_block + pkt_block_size;
> +
> +	/* Check for wrap around */
> +	if (update_block >= buffer_desc_count) {
> +		update_block %= buffer_desc_count;
> +		buffer_wrapped = true;
> +	}
> +
> +	/* OCMC RAM is not cached and write order is not important */
> +	ocmc_ram = (__force void *)emac->prueth->mem[PRUETH_MEM_OCMC].va;
> +	dst_addr = ocmc_ram + txqueue->buffer_offset +
> +		   (write_block * ICSS_BLOCK_SIZE);
> +
> +	/* Copy the data from socket buffer(DRAM) to PRU buffers(OCMC) */
> +	if (buffer_wrapped) { /* wrapped around buffer */
> +		int bytes = (buffer_desc_count - write_block) * ICSS_BLOCK_SIZE;
> +		int remaining;
> +
> +		/* bytes is integral multiple of ICSS_BLOCK_SIZE but
> +		 * entire packet may have fit within the last BD
> +		 * if pkt_info.length is not integral multiple of
> +		 * ICSS_BLOCK_SIZE
> +		 */
> +		if (pktlen < bytes)
> +			bytes = pktlen;
> +
> +		/* copy non-wrapped part */
> +		memcpy(dst_addr, src_addr, bytes);
> +
> +		/* copy wrapped part */
> +		src_addr += bytes;
> +		remaining = pktlen - bytes;
> +		dst_addr = ocmc_ram + txqueue->buffer_offset;
> +		memcpy(dst_addr, src_addr, remaining);
> +	} else {
> +		memcpy(dst_addr, src_addr, pktlen);
> +	}
> +
> +       /* update first buffer descriptor */
> +	wr_buf_desc = (pktlen << PRUETH_BD_LENGTH_SHIFT) &
> +		       PRUETH_BD_LENGTH_MASK;
> +	writel(wr_buf_desc, dram + bd_wr_ptr);
> +
> +	/* update the write pointer in this queue descriptor, the firmware
> +	 * polls for this change so this will signal the start of transmission
> +	 */
> +	update_wr_ptr = txqueue->buffer_desc_offset + (update_block * BD_SIZE);
> +	writew(update_wr_ptr, &queue_desc->wr_ptr);
> +
> +	return 0;
> +}

[...]

> +
> +/* get packet from queue
> + * negative for error
> + */

The comment above seems superfluous and does not seem to follow the
format of the tx comment which appears to use kdoc style

> +int icssm_emac_rx_packet(struct prueth_emac *emac, u16 *bd_rd_ptr,
> +			 struct prueth_packet_info *pkt_info,
> +			 const struct prueth_queue_info *rxqueue)
> +{

[...]

> +
> +	/* the PRU firmware deals mostly in pointers already
> +	 * offset into ram, we would like to deal in indexes
> +	 * within the queue we are working with for code
> +	 * simplicity, calculate this here
> +	 */
> +	buffer_desc_count = rxqueue->buffer_desc_end -
> +			    rxqueue->buffer_desc_offset;
> +	buffer_desc_count /= BD_SIZE;
> +	buffer_desc_count++;
> +	read_block = (*bd_rd_ptr - rxqueue->buffer_desc_offset) / BD_SIZE;
> +	pkt_block_size = DIV_ROUND_UP(pkt_info->length, ICSS_BLOCK_SIZE);
> +
> +	/* calculate end BD address post read */
> +	update_block = read_block + pkt_block_size;
> +
> +	/* Check for wrap around */
> +	if (update_block >= buffer_desc_count) {
> +		update_block %= buffer_desc_count;
> +		if (update_block)
> +			buffer_wrapped = true;
> +	}
> +
> +	/* calculate new pointer in ram */
> +	*bd_rd_ptr = rxqueue->buffer_desc_offset + (update_block * BD_SIZE);

Seems like there's a lot of repeated math here and in the above
function. Maybe this can be simplified with a helper function to
avoid repeating the math in multiple places?

> +
> +	/* Pkt len w/ HSR tag removed, If applicable */
> +	actual_pkt_len = pkt_info->length - start_offset;
> +
> +	/* Allocate a socket buffer for this packet */
> +	skb = netdev_alloc_skb_ip_align(ndev, actual_pkt_len);
> +	if (!skb) {
> +		if (netif_msg_rx_err(emac) && net_ratelimit())
> +			netdev_err(ndev, "failed rx buffer alloc\n");
> +		return -ENOMEM;
> +	}
> +
> +	dst_addr = skb->data;
> +
> +	/* OCMC RAM is not cached and read order is not important */
> +	ocmc_ram = (__force void *)emac->prueth->mem[PRUETH_MEM_OCMC].va;
> +
> +	/* Get the start address of the first buffer from
> +	 * the read buffer description
> +	 */
> +	src_addr = ocmc_ram + rxqueue->buffer_offset +
> +		   (read_block * ICSS_BLOCK_SIZE);
> +	src_addr += start_offset;
> +
> +	/* Copy the data from PRU buffers(OCMC) to socket buffer(DRAM) */
> +	if (buffer_wrapped) { /* wrapped around buffer */
> +		int bytes = (buffer_desc_count - read_block) * ICSS_BLOCK_SIZE;
> +		int remaining;
> +		/* bytes is integral multiple of ICSS_BLOCK_SIZE but
> +		 * entire packet may have fit within the last BD
> +		 * if pkt_info.length is not integral multiple of
> +		 * ICSS_BLOCK_SIZE
> +		 */
> +		if (pkt_info->length < bytes)
> +			bytes = pkt_info->length;
> +
> +		/* If applicable, account for the HSR tag removed */
> +		bytes -= start_offset;
> +
> +		/* copy non-wrapped part */
> +		memcpy(dst_addr, src_addr, bytes);
> +
> +		/* copy wrapped part */
> +		dst_addr += bytes;
> +		remaining = actual_pkt_len - bytes;
> +
> +		src_addr = ocmc_ram + rxqueue->buffer_offset;
> +		memcpy(dst_addr, src_addr, remaining);
> +		src_addr += remaining;
> +	} else {
> +		memcpy(dst_addr, src_addr, actual_pkt_len);
> +		src_addr += actual_pkt_len;
> +	}
> +
> +	if (!pkt_info->sv_frame) {
> +		skb_put(skb, actual_pkt_len);
> +
> +		/* send packet up the stack */
> +		skb->protocol = eth_type_trans(skb, ndev);
> +		local_bh_disable();
> +		netif_receive_skb(skb);
> +		local_bh_enable();
> +	} else {
> +		dev_kfree_skb_any(skb);
> +	}
> +
> +	/* update stats */
> +	ndev->stats.rx_bytes += actual_pkt_len;
> +	ndev->stats.rx_packets++;

See comment below about atomicity.

> +	return 0;
> +}
> +
> +/**
> + * icssm_emac_rx_thread - EMAC Rx interrupt thread handler
> + * @irq: interrupt number
> + * @dev_id: pointer to net_device
> + *
> + * EMAC Rx Interrupt thread handler - function to process the rx frames in a
> + * irq thread function. There is only limited buffer at the ingress to
> + * queue the frames. As the frames are to be emptied as quickly as
> + * possible to avoid overflow, irq thread is necessary. Current implementation
> + * based on NAPI poll results in packet loss due to overflow at
> + * the ingress queues. Industrial use case requires loss free packet
> + * processing. Tests shows that with threaded irq based processing,
> + * no overflow happens when receiving at ~92Mbps for MTU sized frames and thus
> + * meet the requirement for industrial use case.

That's interesting. Any idea why this is the case? Is there not
enough CPU for softirq/NAPI processing to run or something? I
suppose I'd imagine that NAPI would run and if data is arriving fast
enough, the NAPI would be added to the repoll list and processed
later.

So I guess either there isn't enough CPU or the ingress queues don't
have many descriptors or something like that ?

> + *
> + * Return: interrupt handled condition
> + */
> +static irqreturn_t icssm_emac_rx_thread(int irq, void *dev_id)
> +{
> +	struct net_device *ndev = (struct net_device *)dev_id;
> +	struct prueth_emac *emac = netdev_priv(ndev);
> +	struct prueth_queue_desc __iomem *queue_desc;
> +	const struct prueth_queue_info *rxqueue;
> +	struct prueth *prueth = emac->prueth;
> +	struct net_device_stats *ndevstats;
> +	struct prueth_packet_info pkt_info;
> +	int start_queue, end_queue;
> +	void __iomem *shared_ram;
> +	u16 bd_rd_ptr, bd_wr_ptr;
> +	u16 update_rd_ptr;
> +	u8 overflow_cnt;
> +	u32 rd_buf_desc;
> +	int used = 0;
> +	int i, ret;
> +
> +	ndevstats = &emac->ndev->stats;

FWIW the docs in include/linux/netdevice.h say:

/**
 ...
 *      @stats:         Statistics struct, which was left as a legacy, use
 *                      rtnl_link_stats64 instead
 ...
 */
struct net_device {
  ...
  struct net_device_stats stats; /* not used by modern drivers */
  ...
};

perhaps consider using rtnl_link_stats64 as suggested instead?

> +	shared_ram = emac->prueth->mem[PRUETH_MEM_SHARED_RAM].va;
> +
> +	start_queue = emac->rx_queue_start;
> +	end_queue = emac->rx_queue_end;
> +retry:
> +	/* search host queues for packets */
> +	for (i = start_queue; i <= end_queue; i++) {
> +		queue_desc = emac->rx_queue_descs + i;
> +		rxqueue = &queue_infos[PRUETH_PORT_HOST][i];
> +
> +		overflow_cnt = readb(&queue_desc->overflow_cnt);
> +		if (overflow_cnt > 0) {
> +			emac->ndev->stats.rx_over_errors += overflow_cnt;
> +			/* reset to zero */
> +			writeb(0, &queue_desc->overflow_cnt);
> +		}
> +
> +		bd_rd_ptr = readw(&queue_desc->rd_ptr);
> +		bd_wr_ptr = readw(&queue_desc->wr_ptr);
> +
> +		/* while packets are available in this queue */
> +		while (bd_rd_ptr != bd_wr_ptr) {
> +			/* get packet info from the read buffer descriptor */
> +			rd_buf_desc = readl(shared_ram + bd_rd_ptr);
> +			icssm_parse_packet_info(prueth, rd_buf_desc, &pkt_info);
> +
> +			if (pkt_info.length <= 0) {
> +				/* a packet length of zero will cause us to
> +				 * never move the read pointer ahead, locking
> +				 * the driver, so we manually have to move it
> +				 * to the write pointer, discarding all
> +				 * remaining packets in this queue. This should
> +				 * never happen.
> +				 */
> +				update_rd_ptr = bd_wr_ptr;
> +				ndevstats->rx_length_errors++;

See question below.

> +			} else if (pkt_info.length > EMAC_MAX_FRM_SUPPORT) {
> +				/* if the packet is too large we skip it but we
> +				 * still need to move the read pointer ahead
> +				 * and assume something is wrong with the read
> +				 * pointer as the firmware should be filtering
> +				 * these packets
> +				 */
> +				update_rd_ptr = bd_wr_ptr;
> +				ndevstats->rx_length_errors++;

in netdevice.h it says:

* struct net_device_stats* (*ndo_get_stats)(struct net_device *dev);
*      Called when a user wants to get the network device usage
*      statistics. Drivers must do one of the following:
*      1. Define @ndo_get_stats64 to fill in a zero-initialised
*         rtnl_link_stats64 structure passed by the caller.
*      2. Define @ndo_get_stats to update a net_device_stats structure
*         (which should normally be dev->stats) and return a pointer to
*         it. The structure may be changed asynchronously only if each
*         field is written atomically.
*      3. Update dev->stats asynchronously and atomically, and define
*         neither operation.

I didn't look in the other patches to see if ndo_get_stats is
defined or not, but are these increments atomic?

