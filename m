Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F7CCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 08:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxB3Cha/PsBtuyJk6VtBE2+Wy+Unuom6P88kKuk/PeA=; b=nudgw3lysnAAtOYrbZ8MBBrkky
	WP/liYhfmYquU6sLCnDE3CvNw+JaIlvg89pWQALEnsEiCWk46gHf/dPTFkcRuAIIz1tnzVPeBNNDD
	dmHVed3ZqDugEsZ5m6wfrZW5WpGOsg8DH7LpClUdMOZ7mU0Ny+1xbu6jt/oDEfH/osmJRlU0qnc+n
	R2+ZDx/Ozz8GQ9zsRiFICDniKkYv9mkBxDXZZT4h89HqgxDqLBVTnWvCyZGhNk2ohgooY52ERQUcq
	uqTNSox0NG+hCcKPVSSFjoASC5gSVjLTHLE+1tX6ipr4W6glxFTga+I4KpPrpB9IYA6gaoZjth3Fe
	uITY/wtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF5f9-00000005mkq-0v1c;
	Fri, 09 Oct 2026 08:09:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF5f6-00000005mkk-1bdC
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 Oct 2026 08:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KxB3Cha/PsBtuyJk6VtBE2+Wy+Unuom6P88kKuk/PeA=; b=MM6z1mzuP9oqiWyz0hpRSh2tYu
	PHZb+l4RQHnCFl0iZU0XQg4wHVkGNdpNvFXQurbqaLhuv5VdD9evBO9czb0Sv3oHF/PkusS7EuF+a
	1gs6vd8h40sfVCAluSSSVbS440CvY/nPgCFKPA68i1VqRps569LxNTmbdesPidO05RfCtK+mS/b7y
	ot9mH/3NpffvoB6mvLPkg+6fnQNxLF/2CFe/SAo1N1tT2zCyxyNeAPtPisuXKEFIWeS+Z0RA1/Ikp
	k4lA8C4aj+4BKnOILiHihE+B6uVQ7z3eMBDhxBsJCEHUUppI0BirhNfI4ya98zB+cDtZJFbNJ5aNT
	TYnpZKXQ==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xF5f1-0000000B0zb-47Ge
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 08:09:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791533339; x=1823069339;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YqCj2DI45rBAiCTfBWTa8ZEjISoBAV0jHOtCtO+LHRQ=;
  b=UqPzd8aBy8NXZI+M86dO/gZUwhbF9gDnB9DsUx1TMEWM0OBd+yLYgm/r
   n+arK2euNP7kK70kKngZPgkMP+EzxUuHV1xlX7QXdqG6oSLM0PizIOQgE
   HQDRqU6AE5gPqv3FnRRlwCXALW/5SRY/jeRlg5e+RFm5wi7QbPPVpxZSJ
   8m37APXdsvMos/dIVGCZg00FxdPqu1/8122DlF26+3nR0jDbhwEIrwjvG
   6EYThRS1lKaHyK8FTzh9B0qLqyPqI24UxA5DZ2NogwZ6Nd0q/0OyOYCTg
   nAmaHRkNB4rHSj1bUNCsPzWlbEE1Lg89Z5wLnqECtmxWQa0mM05U9nlMQ
   Q==;
X-CSE-ConnectionGUID: dIsZ+WLRTeKwVkIRWHtgXQ==
X-CSE-MsgGUID: vZlShO7RSgiWPTorujsFvg==
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="75117816"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:08:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Fri, 9 Oct 2026 01:08:51 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 9 Oct 2026 01:08:49 -0700
Date: Fri, 9 Oct 2026 10:08:48 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Kusuma Vasana <kusuma.vasana@amd.com>
CC: <radhey.shyam.pandey@amd.com>, <andrew+netdev@lunn.ch>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <michal.simek@amd.com>, <git@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>
Subject: Re: [PATCH net-next V4] net: axienet: Clear stale AXI DMA TX/RX
 status before re-enabling interrupts
Message-ID: <20261009080848.peze77mpvcub5wqv@DEN-DL-M70577.microsemi.net>
References: <20261005090106.1594994-1-kusuma.vasana@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261005090106.1594994-1-kusuma.vasana@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_090901_122392_0E596EDB 
X-CRM114-Status: GOOD (  33.07  )
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

Hi Kusuma,

A few comments:

> The AXI DMA interrupt line is level-sensitive: it asserts whenever
> the IOC (XAXIDMA_IRQ_IOC_MASK) or DELAY (XAXIDMA_IRQ_DELAY_MASK) bits
> in the status register (XAXIDMA_TX_SR_OFFSET / XAXIDMA_RX_SR_OFFSET)
> are set and their corresponding enable bits in the control register
> are active.
> 
> During TX/RX, interrupts are disabled in the control register while
> NAPI runs. Completions arriving in this window cause hardware to latch
> IOC/DELAY into the status register regardless of the control register
> mask state. After NAPI completion, re-enabling interrupts immediately
> re-asserts the IRQ line due to these stale status register bits, even
> when no new work is pending.
> 
> This results in a stale interrupt and redundant NAPI poll cycle with
> no new work pending, causing unnecessary CPU processing.
> 
> In the initial driver, the status register was cleared after polling
> all packets, which naturally consumed any status accumulated during
> processing. In later versions of the driver, status register clearing
> was moved to the ISR before polling begins, leaving no mechanism to
> clear status bits that arrive during the NAPI poll window.
> 
> Clear the status register IOC/DELAY bits before re-enabling interrupts
> and recheck the next BD to catch race-window completions. Both are
> skipped on budget exhaustion. On the RX side, both are additionally
> skipped on refill failure.
> 
> Signed-off-by: Kusuma Vasana <kusuma.vasana@amd.com>
> ---
> Changes in v4:
> - Read back SR after W1C so the clear is posted before the BD recheck.
> - Document that poll may return @budget on that recheck.
> - Drop the incorrect "leave IRQ armed" wording for RX refill failure.
> 
> Changes in v3:
> - Updated the commit description.
> - Restricted TX/RX status-register clear and completion recheck to the
>   NAPI completion path, with RX only when refill succeeds.
> - Rechecked descriptor completion after status-register clear to handle
>   race-window completions.
> 
> Changes in v2:
> -Added net-next prefix in the subject
> -Updated the commit description
> 
> ---
>  .../net/ethernet/xilinx/xilinx_axienet_main.c | 29 +++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index fcf517069d16..4d8169fc39cd 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -986,7 +986,8 @@ axienet_start_xmit_dmaengine(struct sk_buff *skb, struct net_device *ndev)
>   * @napi:      Pointer to NAPI structure.
>   * @budget:    Max number of TX packets to process.
>   *
> - * Return: Number of TX packets processed.
> + * Return: Number of TX packets processed, or @budget to continue polling
> + * after a post-clear completion recheck.
>   *
>   * This function is invoked from the NAPI processing to notify the completion
>   * of transmit operation. It clears fields in the corresponding Tx BDs and
> @@ -1018,6 +1019,17 @@ static int axienet_tx_poll(struct napi_struct *napi, int budget)
>                         netif_wake_queue(ndev);
>         }
> 
> +       /* Clear stale IOC/DELAY bits, flush the clear, and re-check for
> +        * race-window completions. Skipped on budget exhaustion.
> +        */
> +       if (packets < budget) {
> +               axienet_dma_out32(lp, XAXIDMA_TX_SR_OFFSET,
> +                                 XAXIDMA_IRQ_IOC_MASK | XAXIDMA_IRQ_DELAY_MASK);
> +               axienet_dma_in32(lp, XAXIDMA_TX_SR_OFFSET);
> +               if (lp->tx_bd_v[lp->tx_bd_ci].status & XAXIDMA_BD_STS_COMPLETE_MASK)
> +                       return budget;
> +       }
> +

The patch does not apply on my tree.

This part was reworked in f9d58127380a ("net: axienet: do not report TX
completions as NAPI work") to not return budget-sized work, it now just returns
0.

>         if (packets < budget && napi_complete_done(napi, packets)) {
>                 /* Re-enable TX completion interrupts. This should
>                  * cause an immediate interrupt if any TX packets are
> @@ -1204,7 +1216,8 @@ static void axienet_dma_rx_cb(void *data, const struct dmaengine_result *result)
>   * @napi:      Pointer to NAPI structure.
>   * @budget:    Max number of RX packets to process.
>   *
> - * Return: Number of RX packets processed.
> + * Return: Number of RX packets processed, or @budget to continue polling
> + * after a post-clear completion recheck.
>   */
>  static int axienet_rx_poll(struct napi_struct *napi, int budget)
>  {
> @@ -1301,6 +1314,18 @@ static int axienet_rx_poll(struct napi_struct *napi, int budget)
>         if (tail_p)
>                 axienet_dma_out_addr(lp, XAXIDMA_RX_TDESC_OFFSET, tail_p);
> 
> +       /* Clear stale IOC/DELAY bits, flush the clear, and re-check for
> +        * race-window completions. Skipped on budget exhaustion and on
> +        * refill failure (cur_p->skb == NULL).
> +        */
> +       if (packets < budget && cur_p->skb) {
> +               axienet_dma_out32(lp, XAXIDMA_RX_SR_OFFSET,
> +                                 XAXIDMA_IRQ_IOC_MASK | XAXIDMA_IRQ_DELAY_MASK);
> +               axienet_dma_in32(lp, XAXIDMA_RX_SR_OFFSET);
> +               if (cur_p->status & XAXIDMA_BD_STS_COMPLETE_MASK)
> +                       return budget;
> +       }
> +
>         if (packets < budget && napi_complete_done(napi, packets)) {
>                 if (READ_ONCE(lp->rx_dim_enabled)) {
>

I think the RX side looks good.

>struct dim_sample sample = {
> --
> 2.43.0
> 
> 

/Daniel

