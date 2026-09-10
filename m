Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE878C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVdmkaSk3ZG55nEhsYcH95ArBxXEWXCCMZcHoDFV5Og=; b=ZqNtRjntJK5sLJgkJ43f1Xsgsh
	1IkBnVVkC4iw8Xvxq3XHq3mZ7AtbhhcgTQUl/Vc9NvXPIrS3xqE1EJ9DF1b+/lKepFUtyXTjMB9Sz
	Q+jMdW9oOuD1JdOwkLmYcFpN7K4/A2/tB5ljUglAVY4gQ81pXyr0cVZbOGizPSh8DL7aehvuLHqW1
	j62I+LWs71cpSDZpEZ/dVyCRlEXBbFZMtNu/yoyjptyUuq90ia8yf8cLF2UO9BgFaZxI+lNPegZxY
	KQJTiG4nU0TignG7obYn7JPBNnpnukpgOLABFbQXMP+XFHz7PiS6iK89uvgTnIXM9Cf89ijoc5C1R
	Sjch49eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gmE-0000000Ent9-219r;
	Thu, 10 Sep 2026 15:33:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gmD-0000000Ensw-40ri
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:33:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D01140938;
	Thu, 10 Sep 2026 15:33:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC1B1F000FF;
	Thu, 10 Sep 2026 15:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789054405;
	bh=BVdmkaSk3ZG55nEhsYcH95ArBxXEWXCCMZcHoDFV5Og=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CiD6n5R1z57QgmIKQnJ5Ajzku3sxKwqHMfxaB3mDlbzMea9AtA1NwcKXXtJx0LpgT
	 2C+FRSyKXwy3L6xS/pdLkxg7fFmUG8YIgu0U4DxW9Ah845f2plLu/j8LPQsPNYXos0
	 27A0xWLpZrJFMnd/tPxNxM8Iey3y6yUtrPqGeYE2lSIjOZygpZWGaI2VWxy6lqJ8bc
	 /s+S7zOYwylvbRn1vZJ58Zvd7pHkLBSyzT71ntpSfTB+cvVXada0/uO+nLcijHwzx+
	 oCOpmFKllmeDjeZ0kaLIVQbH5FXZxx1b8iheGr4oYEvOwYZC/345xMbF1K7YURGP3v
	 oPq7odcg1/+1A==
Subject: Re: [PATCH net-next V3] net: axienet: Clear stale AXI DMA TX/RX
 status before re-enabling interrupts
From: netdev-bot+sashiko@kernel.org
To: kusuma.vasana@amd.com
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
 git@amd.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Date: Thu, 10 Sep 2026 15:33:24 +0000
Message-ID: <178905440414.219967.6111426130109067474@kernel.org>
In-Reply-To: <20260906153243.1903501-1-kusuma.vasana@amd.com>
References: <20260906153243.1903501-1-kusuma.vasana@amd.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider:

Critical: 0 · High: 1 · Medium: 0 · Low: 2

- [High] Unordered write-1-to-clear of the AXI DMA status register
  followed by a descriptor read can silently swallow a DMA completion.
- [Low] Both new blocks can `return budget` while `packets` is less than
  budget (possibly zero), which contradicts the unchanged kernel-doc of…
- [Low] The new RX comment at
  drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1314-1318 states…

--

net: axienet: Clear stale AXI DMA TX/RX status before re-enabling interrupts

This adds a write-1-to-clear of the IOC/DELAY bits in the AXI DMA TX/RX
status registers at the end of axienet_tx_poll() and axienet_rx_poll(),
followed by a re-check of the next buffer descriptor, in order to avoid
one redundant NAPI poll caused by status latched while interrupts were
masked.

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 1722b7038f340..ae43b9744cb90 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -1018,6 +1018,16 @@ static int axienet_tx_poll(struct napi_struct *napi, int budget)
>  			netif_wake_queue(ndev);
>  	}
>  
> +	/* Clear stale IOC/DELAY bits and re-check for race-window completions.
> +	 * Skipped on budget exhaustion.
> +	 */
> +	if (packets < budget) {
> +		axienet_dma_out32(lp, XAXIDMA_TX_SR_OFFSET,
> +				  XAXIDMA_IRQ_IOC_MASK | XAXIDMA_IRQ_DELAY_MASK);
> +		if (lp->tx_bd_v[lp->tx_bd_ci].status & XAXIDMA_BD_STS_COMPLETE_MASK)
> +			return budget;
> +	}

[Severity: High]
Can this sequence lose a DMA completion?  The status-register clear is a
posted write with nothing after it to flush or order it:

drivers/net/ethernet/xilinx/xilinx_axienet.h:
static inline void axienet_dma_out32(struct axienet_local *lp,
				     off_t reg, u32 value)
{
	iowrite32(value, lp->dma_regs + reg);
}

The descriptor status that follows is a plain load from
dma_alloc_coherent() memory, so on arm/arm64 the Device-nGnRE store is not
ordered against the subsequent Normal-memory load (iowrite32() only emits
__iowmb() before the store).

That allows this interleaving:

  CPU				DMA engine
  ----				----------
  write IOC|DELAY to SR		(write still in flight)
  read tx_bd_v[tx_bd_ci].status
    -> not COMPLETE
				descriptor writeback, latch IOC/DELAY
  (queued W1C lands, wipes IOC/DELAY)
  napi_complete_done()
  write lp->tx_dma_cr

after which IOC/DELAY are enabled in the control register but the status
register is clean, so the level-sensitive line stays de-asserted while a
COMPLETE descriptor sits in the ring.

Before this patch there was no such window: the status word was acked only
in axienet_tx_irq()/axienet_rx_irq() before NAPI ran:

	axienet_dma_out32(lp, XAXIDMA_TX_SR_OFFSET, status);

so anything the hardware latched during the poll window kept the line
asserted and produced exactly the extra poll this patch removes.

The RX hunk below has the same ack-then-scan shape, and it is issued right
after the XAXIDMA_RX_TDESC_OFFSET doorbell, i.e. when the engine is most
likely to complete a descriptor concurrently.  On TX the skb is not freed
and netdev_completed_queue()/BQL accounting stays skewed until some later
completion; note that axienet_netdev_ops has no .ndo_tx_timeout, and
netdev_watchdog_up() returns early without one, so there is no software
watchdog fallback.  On RX the frame is delivered late, or on an idle link
not until the peer retransmits.

Would reading back XAXIDMA_TX_SR_OFFSET / XAXIDMA_RX_SR_OFFSET (or
otherwise ordering the clear ahead of the descriptor scan) close this?

[Severity: Low]
This return can hand back budget while packets is smaller than budget, and
possibly zero.  The kernel-doc above axienet_tx_poll() still says:

 * Return: Number of TX packets processed.

and the one above axienet_rx_poll() says:

 * Return: Number of RX packets processed.

The commit message describes the change only as

    "recheck the next BD to catch race-window completions"

without mentioning that the poll now returns a sentinel work value.
__napi_poll() treats work == weight specially:

net/core/dev.c:__napi_poll() {
	...
	if (likely(work < weight))
		return work;
	...
	gro_flush_normal(&n->gro, HZ >= 1000);
	...
	*repoll = true;
}

and net_rx_action() charges the returned value against netdev_budget with
budget -= napi_poll(n, &repoll), so a poll that reclaimed nothing consumes
a full weight of the softirq budget.  On RX the same path also skips the
net_dim() sample in the napi_complete_done() branch.

Returning budget does look like the required idiom here, since returning a
smaller value without calling napi_complete_done() would leave the instance
scheduled but off the poll list.  Could the kernel-doc and changelog be
updated to describe the sentinel return instead?

>  	if (packets < budget && napi_complete_done(napi, packets)) {
>  		/* Re-enable TX completion interrupts. This should
>  		 * cause an immediate interrupt if any TX packets are
> @@ -1301,6 +1311,18 @@ static int axienet_rx_poll(struct napi_struct *napi, int budget)
>  	if (tail_p)
>  		axienet_dma_out_addr(lp, XAXIDMA_RX_TDESC_OFFSET, tail_p);
>  
> +	/* Clear stale IOC/DELAY bits and re-check for race-window completions.
> +	 * Skipped on budget exhaustion and on refill failure (cur_p->skb ==
> +	 * NULL) to leave the level-sensitive IRQ armed so the poll is
> +	 * rescheduled on the next hardware completion.
> +	 */

[Severity: Low]
Is the "leave the level-sensitive IRQ armed so the poll is rescheduled on
the next hardware completion" part of this comment accurate?

axienet_rx_irq() already writes back the whole status word before NAPI is
scheduled:

	axienet_dma_out32(lp, XAXIDMA_RX_SR_OFFSET, status);

so unless the hardware latched a new IOC/DELAY during the poll window there
is no bit left to keep the line asserted, and the skip is a no-op rather
than something that arms the interrupt.

When a bit was latched during the window, the following block is not gated
on cur_p->skb:

	if (packets < budget && napi_complete_done(napi, packets)) {
		...
		axienet_dma_out32(lp, XAXIDMA_RX_CR_OFFSET, lp->rx_dma_cr);

so the line asserts an interrupt immediately, not "on the next hardware
completion".

The RX tail was also only advanced to the last successfully refilled
descriptor:

	if (tail_p)
		axienet_dma_out_addr(lp, XAXIDMA_RX_TDESC_OFFSET, tail_p);

so a further completion past the stalled slot is not guaranteed either.
Could the comment (and the matching sentence in the commit message) be
reworded to match what the code does?

> +	if (packets < budget && cur_p->skb) {
> +		axienet_dma_out32(lp, XAXIDMA_RX_SR_OFFSET,
> +				  XAXIDMA_IRQ_IOC_MASK | XAXIDMA_IRQ_DELAY_MASK);
> +		if (cur_p->status & XAXIDMA_BD_STS_COMPLETE_MASK)
> +			return budget;
> +	}
>  
>  	if (packets < budget && napi_complete_done(napi, packets)) {

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260906153243.1903501-1-kusuma.vasana%40amd.com

