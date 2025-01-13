Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972F8C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 17:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOSmiUaw3uKM6/i/45JB6mso7bisVDnAMGBo9d15CcY=; b=FqVQcicrmWi12PsiIATqFl6nlz
	w8+Olvya+iqB0J0+6qMQeeeiY5QGF4wM5j/OoMgOyc01t3NzPxfl1gDqmBj4TUUz7frpuTcRunkAk
	A44CPFHYlKG32prPAysgrSIViXSjsACEsVn9BZ81tORQL9iefHXLKb1XfPw9ETGZaGsdbe0udMuBE
	MYzU48RmUxHjNET4Ng8zN+jm9Fk/uHt1pIEhk2uVDwVkLTGByXJjHuyDmNckqOFZkpzFeCbHv/wjm
	N7TyvivotR081OI1KQa2PHROr572F054+jFnDS4E+tmJzUOvuV/iVo9pAeU7fC2/1QKmYdlGeCfEA
	E2vlnl6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXOQT-000000064t3-44iO;
	Mon, 13 Jan 2025 17:40:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXOPE-000000064Gq-1W6G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 17:39:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5931CA4126A;
	Mon, 13 Jan 2025 17:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A83C4CED6;
	Mon, 13 Jan 2025 17:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736789955;
	bh=gQO929TF1zG4isHV+Ba2Rq5IQvrjzSjfb92qIyMfByY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YHabkGtgN29J8ZSfisP47q69iaLm5PM59Nr1dEy0Tt2FyWPEYsA+0WgTlvfOLoX8Q
	 UA8vWvhrEo8Yh9CUtBKNB+o0Q38kpo7tOLFE4oOpFdyv5nW3mdovZUz80K6VbJb4wI
	 WH7kfTOn+XtWTjhSDr4TFmUHnr5Kbr7Ay+P6sd9Qg70kl7gOKPN2wGURNCpKg6xc7I
	 2waTjRoC4IsmlL0/svh79xMrRiocfGS04bbcBOZSHyid9J2yO3Yjw5Fk0lLKRHqEIx
	 gVpuhH438kbnJfEb++BgeqqvydV1ERyq09QSJN/a0YhhAgw/sd3T9a42qN4730o6YI
	 eIsnTkobrjYpA==
Date: Mon, 13 Jan 2025 17:39:10 +0000
From: Simon Horman <horms@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Shannon Nelson <shannon.nelson@amd.com>,
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 5/6] net: xilinx: axienet: Get coalesce
 parameters from driver state
Message-ID: <20250113173910.GF5497@kernel.org>
References: <20250110192616.2075055-1-sean.anderson@linux.dev>
 <20250110192616.2075055-6-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110192616.2075055-6-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_093916_537737_AFF9933D 
X-CRM114-Status: GOOD (  23.02  )
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

On Fri, Jan 10, 2025 at 02:26:15PM -0500, Sean Anderson wrote:
> The cr variables now contain the same values as the control registers
> themselves. Extract/calculate the values from the variables instead of
> saving the user-specified values. This allows us to remove some
> bookeeping, and also lets the user know what the actual coalesce
> settings are.
> 
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> Reviewed by: Shannon Nelson <shannon.nelson@amd.com>

Hi Sean,

Unfortunately this series does not appear to apply cleanly to net-next.
Which is our CI is currently unable to cope with :(

Please consider rebasing and reposting.

> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - New
> 
>  drivers/net/ethernet/xilinx/xilinx_axienet.h  |  8 ---
>  .../net/ethernet/xilinx/xilinx_axienet_main.c | 70 +++++++++++++------
>  2 files changed, 47 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
> index 6b8e550c2155..45d8d80dbb1a 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
> @@ -533,10 +533,6 @@ struct skbuf_dma_descriptor {
>   *		  supported, the maximum frame size would be 9k. Else it is
>   *		  1522 bytes (assuming support for basic VLAN)
>   * @rxmem:	Stores rx memory size for jumbo frame handling.
> - * @coalesce_count_rx:	Store the irq coalesce on RX side.
> - * @coalesce_usec_rx:	IRQ coalesce delay for RX
> - * @coalesce_count_tx:	Store the irq coalesce on TX side.
> - * @coalesce_usec_tx:	IRQ coalesce delay for TX
>   * @use_dmaengine: flag to check dmaengine framework usage.
>   * @tx_chan:	TX DMA channel.
>   * @rx_chan:	RX DMA channel.
> @@ -615,10 +611,6 @@ struct axienet_local {
>  	u32 max_frm_size;
>  	u32 rxmem;
>  
> -	u32 coalesce_count_rx;
> -	u32 coalesce_usec_rx;
> -	u32 coalesce_count_tx;
> -	u32 coalesce_usec_tx;
>  	u8  use_dmaengine;
>  	struct dma_chan *tx_chan;
>  	struct dma_chan *rx_chan;

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c

...

> @@ -260,6 +264,23 @@ static u32 axienet_calc_cr(struct axienet_local *lp, u32 count, u32 usec)
>  	return cr;
>  }
>  
> +/**
> + * axienet_cr_params() - Extract coalesce parameters from the CR

nit: axienet_coalesce_params

> + * @lp: Device private data
> + * @cr: The control register to parse
> + * @count: Number of packets before an interrupt
> + * @usec: Idle time (in usec) before an interrupt
> + */
> +static void axienet_coalesce_params(struct axienet_local *lp, u32 cr,
> +				    u32 *count, u32 *usec)
> +{
> +	u64 clk_rate = axienet_dma_rate(lp);
> +	u64 timer = FIELD_GET(XAXIDMA_DELAY_MASK, cr);
> +
> +	*count = FIELD_GET(XAXIDMA_COALESCE_MASK, cr);
> +	*usec = DIV64_U64_ROUND_CLOSEST(timer * XAXIDMA_DELAY_SCALE, clk_rate);
> +}
> +
>  /**
>   * axienet_dma_start - Set up DMA registers and start DMA operation
>   * @lp:		Pointer to the axienet_local structure

