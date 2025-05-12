Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB62C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 14:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AASHpsRHnOZG9zKaO4b8aEY6Wtqtt0rsAjyKr+LKDW0=; b=SqL9jQPQq+EeLzO/hUZrI0VWhg
	HQBZHtrV2SfhAMTQ7Fb4YRE986DqKZeAc8SlfE3HbXqe/g9tX8fpGMtmVMJyFwrAqU/8E1Chc7A6p
	6fdiRQN1JqDW95/uzU6HG/eUU9RibH79lDslGrP1hBAPJCEOJ80fqWunPaoZnnRdp/q51g7ot6AWP
	oaSOkVpFBoyTUyacB8qYa4C2hasgQRvMqq/Afr61x8/33bD/yuHIBXzaWQwk3p0r2IPMpmmyKX45+
	0GJCWVOh0HVhkPUmnDIwtCI4hM+uxmEDt39S9Xrd43lh5Y9ZPhKjxI2MPX9XhlXN4fj9vkYv+hwuv
	yDTe83ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEU0Y-00000009hM4-20hn;
	Mon, 12 May 2025 14:19:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETHw-00000009ZRV-0zl2;
	Mon, 12 May 2025 13:33:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 04F855C6550;
	Mon, 12 May 2025 13:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A5B9C4CEE7;
	Mon, 12 May 2025 13:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747056827;
	bh=OSuhz6e6dWLHgaJVphGkxlbYoGHl5jGwOBDIywZ3Y+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sTxn49JHIXPhIbCuuiv+9AmgFbzDFHaISnc8qvXkrAFUEKgumncOY6oMUsqAGbaYw
	 7cZtl41uGkvMgncv8oLMjGidAWp2Ldjkj2nsM9OHDxTdFhxjXzq6G8rrqE7+1iSa36
	 NFl23db7pTc/PBBGp+YylsBcHHiv7RC6TlsTm1m2HHz7goXJnD/MevXpx2nhQ4uFgb
	 bzQn+T+60WJYVEiawF4RFFKz9t7zA0sSelsQ3AZ1UMsnz/JH7EhZe+1iOGjjgo51Zn
	 Nu361r8xEoe52fIPJfRpkWjfCARz7khX954eeyHpkWrKFA5dB6rxnWf8KwPQQkHu4q
	 kgnWRv2Bt7Nrw==
Date: Mon, 12 May 2025 14:33:42 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: airoha: Add the capability to
 allocate hw buffers in SRAM
Message-ID: <20250512133342.GB3339421@horms.kernel.org>
References: <20250509-airopha-desc-sram-v2-0-9dc3d8076dfb@kernel.org>
 <20250509-airopha-desc-sram-v2-2-9dc3d8076dfb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-airopha-desc-sram-v2-2-9dc3d8076dfb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_063348_356875_7F1DD3DF 
X-CRM114-Status: GOOD (  20.86  )
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

On Fri, May 09, 2025 at 04:51:34PM +0200, Lorenzo Bianconi wrote:
> In order to improve packet processing and packet forwarding
> performances, EN7581 SoC supports allocating buffers for hw forwarding
> queues in SRAM instead of DRAM if available on the system.
> Rely on SRAM for buffers allocation if available on the system and use
> DRAM as fallback.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>

> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 57 +++++++++++++++++++++++++++-----
>  1 file changed, 48 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c

...

> @@ -1088,12 +1091,45 @@ static int airoha_qdma_init_hfwd_queues(struct airoha_qdma *qdma)
>  
>  	airoha_qdma_wr(qdma, REG_FWD_DSCP_BASE, dma_addr);
>  
> -	size = AIROHA_MAX_PACKET_SIZE * HW_DSCP_NUM;
> -	qdma->hfwd.q = dmam_alloc_coherent(eth->dev, size, &dma_addr,
> -					   GFP_KERNEL);
> -	if (!qdma->hfwd.q)
> +	name = devm_kasprintf(eth->dev, GFP_KERNEL, "qdma%d-buf", id);
> +	if (!name)
>  		return -ENOMEM;
>  
> +	index = of_property_match_string(eth->dev->of_node,
> +					 "memory-region-names", name);
> +	if (index >= 0) { /* buffers in sram */
> +		struct reserved_mem *rmem;
> +		struct device_node *np;
> +		void *q;
> +
> +		np = of_parse_phandle(eth->dev->of_node, "memory-region",
> +				      index);
> +		if (!np)
> +			return -ENODEV;
> +
> +		rmem = of_reserved_mem_lookup(np);
> +		of_node_put(np);
> +
> +		/* SRAM is actual memory and supports transparent access just
> +		 * like DRAM. Hence we don't require __iomem being set and
> +		 * we don't need to use accessor routines to read from or write
> +		 * to SRAM.
> +		 */

Thanks for this comment. IMHO It is really useful.

> +		q = (void __force *)devm_ioremap(eth->dev, rmem->base,
> +						 rmem->size);
> +		if (!q)
> +			return -ENOMEM;
> +
> +		qdma->hfwd.q = q;
> +		dma_addr = rmem->base;
> +	} else {
> +		size = AIROHA_MAX_PACKET_SIZE * HW_DSCP_NUM;
> +		qdma->hfwd.q = dmam_alloc_coherent(eth->dev, size, &dma_addr,
> +						   GFP_KERNEL);
> +		if (!qdma->hfwd.q)
> +			return -ENOMEM;
> +	}
> +
>  	airoha_qdma_wr(qdma, REG_FWD_BUF_BASE, dma_addr);
>  
>  	airoha_qdma_rmw(qdma, REG_HW_FWD_DSCP_CFG,

...

