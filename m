Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F74FC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 16:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZGOB++0RnrgvfXYOBKwSIM+lg1Zt40tDm0hhwPqgU4=; b=vKrPR7rcP/eyU+J46tzu05s5nk
	LTerMJ0qlmMmpSw2Pv6FcWYRNp8MOXBYNNF3lIRjKgpHwYBc6jP2WduKq3DbBxYd4SJxtjewb5Fkg
	Su4anIvewD1d3r+8V8au7kJ5MPO1m7kl9lCX1QdmDrWXZHqIa5CxadlrdS1iDn+IMLK+woJFTqwRZ
	SWeDlxKC+UD8y+XKpSTeSJoPSpEttdAi7aLN0b30USuSPGXeSpP6WZpmUyRfH0j/89p01ck79ZqDm
	PlDblGvg/xomGHrzx7EDTOrPvmutTTdQI1A+gxD/4DEGOuT7jz5CXyMFaRKTJmz1vjgbXZFVrXCVN
	rf3+sAOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdXkW-00000009CpF-0IcL;
	Thu, 30 Jan 2025 16:50:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdXfR-00000009CGX-3bs5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 16:45:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5FEC3A41F72;
	Thu, 30 Jan 2025 16:43:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C2FC4CED2;
	Thu, 30 Jan 2025 16:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738255524;
	bh=jWf2CZnQEG7SXBVcZ508uMx8eAuNJOnmC6clM+twjls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FKvn5QCOkmjdiW7oAvxSc53AAMbliawqVOmafoZBGgMUkKmyvWZEDSmgHMoULI265
	 Czvx3xXh7pri/q2XDmdAJggeTXuumXpkNCGzFdh/FFC5i8JjVxHY5tNwAN4a2DbFGI
	 /3Ge7T5ZCTdFiF9A695f99qEXU7XnGfRx3y8U20Oh+7qy/70naYUhuNrn5kTMsYTuW
	 U2D/kTuia4LZEq7qynyoPn2X409eLvRg/Wdjq7RrroTj6dsOYZDDSlFNhkqu63aFwt
	 FxLVcVl0evUzQJr5IWClNnoYuV4TUGdu8bQxghvDkmB+NVxFUW2I7F4V/rQBLuMQXU
	 +8GcAn12P9cmw==
Date: Thu, 30 Jan 2025 16:45:15 +0000
From: Simon Horman <horms@kernel.org>
To: Basharath Hussain Khaja <basharath@couthit.com>
Subject: Re: [RFC v2 PATCH 04/10] net: ti: prueth: Adds link detection, RX
 and TX support.
Message-ID: <20250130164515.GC13457@kernel.org>
References: <20250124122353.1457174-1-basharath@couthit.com>
 <20250124123707.1457639-5-basharath@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124123707.1457639-5-basharath@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_084526_025555_FA604186 
X-CRM114-Status: GOOD (  25.09  )
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

...

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

I think the return type of this function should be netdev_tx_t
rather than int to match the signature of ndo_start_xmit
in struct net_device_ops.

Flagged by W=1 build with clang-19
(-Wincompatible-function-pointer-types-strict).

...

>  static const struct net_device_ops emac_netdev_ops = {
>  	.ndo_open = icssm_emac_ndo_open,
>  	.ndo_stop = icssm_emac_ndo_stop,
> +	.ndo_start_xmit = icssm_emac_ndo_start_xmit,
>  };
>  
>  /* get emac_port corresponding to eth_node name */

...

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.h b/drivers/net/ethernet/ti/icssm/icssm_prueth.h

...

> @@ -76,6 +82,32 @@ struct prueth_queue_info {
>  	u16 buffer_desc_end;
>  } __packed;
>  
> +/**
> + * struct prueth_packet_info - Info about a packet in buffer
> + * @start_offset: start offset of the frame in the buffer for HSR/PRP
> + * @shadow: this packet is stored in the collision queue
> + * @port: port packet is on
> + * @length: length of packet
> + * @broadcast: this packet is a broadcast packet
> + * @error: this packet has an error
> + * @sv_frame: indicate if the frame is a SV frame for HSR/PRP
> + * @lookup_success: src mac found in FDB
> + * @flood: packet is to be flooded
> + * @timstamp: Specifies if timestamp is appended to the packet

nit: @timestamp

> + */
> +struct prueth_packet_info {
> +	bool start_offset;
> +	bool shadow;
> +	unsigned int port;
> +	unsigned int length;
> +	bool broadcast;
> +	bool error;
> +	bool sv_frame;
> +	bool lookup_success;
> +	bool flood;
> +	bool timestamp;
> +};

...

