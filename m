Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4631BC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 14:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8dpkx4FQCWeQxSBhikdqg+aYBugs2YQ1ISPCSllKYPA=; b=BZlmJcreyhg+yURMnfIub3xGNE
	IrdV8jxVRrH5SjBptZX2OlJBn1qlKi5zTRxKRujOENqcFjtQ/Nd8SpHIjRhE+9oe9377y7SCFA3OB
	Tx14ucDv0eLSav3EnLW8VKI7vER3B14kpIGTIWy3B9Cq9pvwZPTDgdpH6o0IlHS0YnK2xWM7rZDiJ
	H8VUbi8y49A+0EFN4gku5+FgYV6zt5jvv3wTCjEPBXkuzNKCJEInZA75f2eBXR+DsHRgMZvUZwST8
	Pgriy4clbthETjGfj0s6iA5jGpj+lO2T4ojvwDUVxVWKP3M76NO5/kbT+OKWEgA0CA3PZKkezWOxg
	FQQDpN4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVMe-0000000G16f-3IWq;
	Thu, 01 May 2025 14:58:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVKk-0000000G0p6-1Wrq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 14:56:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D37E5C553C;
	Thu,  1 May 2025 14:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96135C4CEE3;
	Thu,  1 May 2025 14:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746111377;
	bh=MX3wK1gITwvKn9W4CUlzrPrwvL5OfB/8if8y5oLIEGE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kF2iDmMJQ4GyE2K52WiyrmCkHHd6xa5zZjEUJqhGzNvQShuuA0CHAZuw+agLE1DEL
	 4jPAW3h5o9WVFrbfmg1NtcEZLwwruNf1At+Xni4BNtLoWS8JO49bMUeiGGq2gizlPa
	 DcktDOrm0lIgJM762Kz9ZusWCFFTXU7oD6vA4LkoLp6hGagOzKQnPg5KRthO2YAuiw
	 KjjGr8Qvr/b5AXPqgzG+47gpQQIGfXHQ+bSdhPafLs19l122+9PYaTTzY8Ze+Q+UGp
	 UAvQRG2uF2FYi92CLTjAsr8/10+tW1ivUWWNyJHu/UKUUaaaF/dtyO5wbfdJFe/VO8
	 PIuCSvRaK6k3g==
Date: Thu, 1 May 2025 07:56:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: <dan.carpenter@linaro.org>, <john.fastabend@gmail.com>,
 <hawk@kernel.org>, <daniel@iogearbox.net>, <ast@kernel.org>,
 <pabeni@redhat.com>, <edumazet@google.com>, <davem@davemloft.net>,
 <andrew+netdev@lunn.ch>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: Re: [PATCH net 3/4] net: ti: icssg-prueth: Fix race condition for
 traffic from different network sockets
Message-ID: <20250501075615.34573158@kernel.org>
In-Reply-To: <20250428120459.244525-4-m-malladi@ti.com>
References: <20250428120459.244525-1-m-malladi@ti.com>
	<20250428120459.244525-4-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_075618_503896_CEAE173A 
X-CRM114-Status: GOOD (  16.27  )
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

On Mon, 28 Apr 2025 17:34:58 +0530 Meghana Malladi wrote:
> When dealing with transmitting traffic from different network
> sockets to a single Tx channel, freeing the DMA descriptors can lead
> to kernel panic with the following error:
> 
> [  394.602494] ------------[ cut here ]------------
> [  394.607134] kernel BUG at lib/genalloc.c:508!
> [  394.611485] Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
> 
> logs: https://gist.github.com/MeghanaMalladiTI/ad1d1da3b6e966bc6962c105c0b1d0b6
> 
> The above error was reproduced when sending XDP traffic from XSK
> socket along with network traffic from BSD socket. This causes
> a race condition leading to corrupted DMA descriptors. Fix this
> by adding spinlock protection while accessing the DMA descriptors
> of a Tx ring.

IDK how XSK vs normal sockets matters after what is now patch 4.
The only possible race you may be protecting against is pushing 
work vs completion. Please double check this is even needed, 
and if so fix the commit msg.

> Fixes: 62aa3246f462 ("net: ti: icssg-prueth: Add XDP support")
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
> ---
>  drivers/net/ethernet/ti/icssg/icssg_common.c | 7 +++++++
>  drivers/net/ethernet/ti/icssg/icssg_prueth.h | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
> index 4f45f2b6b67f..a120ff6fec8f 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_common.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
> @@ -157,7 +157,9 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
>  	tx_chn = &emac->tx_chns[chn];
>  
>  	while (true) {
> +		spin_lock(&tx_chn->lock);
>  		res = k3_udma_glue_pop_tx_chn(tx_chn->tx_chn, &desc_dma);
> +		spin_unlock(&tx_chn->lock);
>  		if (res == -ENODATA)
>  			break;
>  
> @@ -325,6 +327,7 @@ int prueth_init_tx_chns(struct prueth_emac *emac)
>  		snprintf(tx_chn->name, sizeof(tx_chn->name),
>  			 "tx%d-%d", slice, i);
>  
> +		spin_lock_init(&tx_chn->lock);
>  		tx_chn->emac = emac;
>  		tx_chn->id = i;
>  		tx_chn->descs_num = PRUETH_MAX_TX_DESC;
> @@ -627,7 +630,9 @@ u32 emac_xmit_xdp_frame(struct prueth_emac *emac,
>  	cppi5_hdesc_set_pktlen(first_desc, xdpf->len);
>  	desc_dma = k3_cppi_desc_pool_virt2dma(tx_chn->desc_pool, first_desc);
>  
> +	spin_lock_bh(&tx_chn->lock);
>  	ret = k3_udma_glue_push_tx_chn(tx_chn->tx_chn, first_desc, desc_dma);
> +	spin_unlock_bh(&tx_chn->lock);

I'm afraid this needs to be some form of spin_lock_irq
The completions may run from hard irq context when netpoll/netconsole
is used.
-- 
pw-bot: cr

