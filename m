Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB71C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 07:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfSbHWDyusSaFZKr0dcTk0xSKATYzU4MTiJnOrUwtHY=; b=fxZXBpTTvH0yVSM94MwapQyeWi
	mH03zMDUMDpDWBTzPduWPz01RqxaBBHKtvNqNKdxFdzeoM2/DIzyRgvZFfW4U5Fj0SMwRQmZTPwvb
	Ah5dXRK1U5x8hmIVkWCtaPxIgx3ZtocWhaklDNG0sWJgMRgQdpjDC6mjGnAyeXXDnbrmwt+1ynwJD
	cwkhi3Zi1zn5VIXv63LuVrPQvTp6UeeE3yQHkfc+DYaIe3NBZJai9j0Ivl1yfc7y8gweaFXjR+J25
	au3hKK08hVPYYP9TUI1KjmvrkZ6gQbh5fkysTcjiAtZGyuLDzoVjplc89zP6ifq/k129TdO3tht84
	7+/mq+GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAkdi-000000014oG-07c4;
	Fri, 02 May 2025 07:16:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAkbk-000000014aM-39DQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 07:14:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5CB1B5C53E1;
	Fri,  2 May 2025 07:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FBAEC4CEE4;
	Fri,  2 May 2025 07:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746170091;
	bh=WZMcB7IZq0pU+GD0KzLwmI2O89KEodLSHYG0SH/X1LM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j/semb5nvJ6TikEwk5ZY1owF/dZjIMrvygoezgB9u7bzZXekMwUoqoggKKOQgI/bu
	 DUVl5qePcZlEicoD9cB/dvNIjdCqyLVRemKoT1aBQcJNnUa4LoiQ2PXvJdkWWJU2zm
	 Pg5oL1EcR3IxkOBLXYcKNwA5kWjRByIrtZvc2R9XQBHHm5B+YO/IGncBcHQpGH0Mta
	 Ezz05Us9N3jjNpxOOS+WnNh/Xsd1K6Fft+DCCZpMQ5WZcfu053MYlSV0hUjjtL3ZMw
	 ZoAgIduZ/aHhadHxsl20vpetMgE9EpymkQBLwHBQEyj3lw35ZN4jfNdAxNU84E0z1T
	 92/L2POJBmvgg==
Message-ID: <074a9a19-9050-44dd-a0bf-536ae8318da2@kernel.org>
Date: Fri, 2 May 2025 09:14:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 4/4] net: ti: icssg-prueth: Fix kernel panic during
 concurrent Tx queue access
To: Meghana Malladi <m-malladi@ti.com>, dan.carpenter@linaro.org,
 john.fastabend@gmail.com, daniel@iogearbox.net, ast@kernel.org,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, andrew+netdev@lunn.ch
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>,
 danishanwar@ti.com
References: <20250428120459.244525-1-m-malladi@ti.com>
 <20250428120459.244525-5-m-malladi@ti.com>
Content-Language: en-US
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <20250428120459.244525-5-m-malladi@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_001452_910057_738FD685 
X-CRM114-Status: GOOD (  21.25  )
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



On 28/04/2025 14.04, Meghana Malladi wrote:
> Add __netif_tx_lock() to ensure that only one packet is being
> transmitted at a time to avoid race conditions in the netif_txq
> struct and prevent packet data corruption. Failing to do so causes
> kernel panic with the following error:
> 
> [ 2184.746764] ------------[ cut here ]------------
> [ 2184.751412] kernel BUG at lib/dynamic_queue_limits.c:99!
> [ 2184.756728] Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
> 
> logs: https://gist.github.com/MeghanaMalladiTI/9c7aa5fc3b7fb03f87c74aad487956e9
> 
> The lock is acquired before calling emac_xmit_xdp_frame() and released after the
> call returns. This ensures that the TX queue is protected from concurrent access
> during the transmission of XDP frames.
> 
> Fixes: 62aa3246f462 ("net: ti: icssg-prueth: Add XDP support")
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
> ---
>   drivers/net/ethernet/ti/icssg/icssg_common.c | 7 ++++++-
>   drivers/net/ethernet/ti/icssg/icssg_prueth.c | 7 ++++++-
>   2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
> index a120ff6fec8f..e509b6ff81e7 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_common.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
> @@ -660,6 +660,8 @@ static u32 emac_run_xdp(struct prueth_emac *emac, struct xdp_buff *xdp,
>   			struct page *page, u32 *len)
>   {
>   	struct net_device *ndev = emac->ndev;
> +	struct netdev_queue *netif_txq;
> +	int cpu = smp_processor_id();
>   	struct bpf_prog *xdp_prog;
>   	struct xdp_frame *xdpf;
>   	u32 pkt_len = *len;
> @@ -679,8 +681,11 @@ static u32 emac_run_xdp(struct prueth_emac *emac, struct xdp_buff *xdp,
>   			goto drop;
>   		}
>   
> -		q_idx = smp_processor_id() % emac->tx_ch_num;
> +		q_idx = cpu % emac->tx_ch_num;
> +		netif_txq = netdev_get_tx_queue(ndev, q_idx);
> +		__netif_tx_lock(netif_txq, cpu);
>   		result = emac_xmit_xdp_frame(emac, xdpf, page, q_idx);
> +		__netif_tx_unlock(netif_txq);
>   		if (result == ICSSG_XDP_CONSUMED) {
>   			ndev->stats.tx_dropped++;
>   			goto drop;
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> index ee35fecf61e7..b31060e7f698 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> @@ -1075,20 +1075,25 @@ static int emac_xdp_xmit(struct net_device *dev, int n, struct xdp_frame **frame
>   {
>   	struct prueth_emac *emac = netdev_priv(dev);
>   	struct net_device *ndev = emac->ndev;
> +	struct netdev_queue *netif_txq;
> +	int cpu = smp_processor_id();
>   	struct xdp_frame *xdpf;
>   	unsigned int q_idx;
>   	int nxmit = 0;
>   	u32 err;
>   	int i;
>   
> -	q_idx = smp_processor_id() % emac->tx_ch_num;
> +	q_idx = cpu % emac->tx_ch_num;
> +	netif_txq = netdev_get_tx_queue(ndev, q_idx);
>   
>   	if (unlikely(flags & ~XDP_XMIT_FLAGS_MASK))
>   		return -EINVAL;
>   
>   	for (i = 0; i < n; i++) {
>   		xdpf = frames[i];
> +		__netif_tx_lock(netif_txq, cpu);
>   		err = emac_xmit_xdp_frame(emac, xdpf, NULL, q_idx);
> +		__netif_tx_unlock(netif_txq);

Why are you taking and releasing this lock in a loop?

XDP gain performance by sending a batch of 'n' packets.
This approach looks like a performance killer.


>   		if (err != ICSSG_XDP_TX) {
>   			ndev->stats.tx_dropped++;
>   			break;



