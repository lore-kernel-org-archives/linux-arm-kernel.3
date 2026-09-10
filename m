Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF01C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 05:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PEC6nt3vrsRKDroa5BH8c3PyJBsiu7afAiaLn+a4ork=; b=qEfuVVX0mqiiR2KR6wvxLBbof4
	l5Pa25wDhGJh8SJGvTJq3efwAnLaPUsWP5uJOcNjZIHu7l90K6QDz0cVseirgMWestaB58ia0wiJg
	G8/Wfk4hPYQbhXBzR9l9daGGbot+Y25Zbud4HhJdoptumrn6AfEbjtZT46jC2Flec6ydt/BUab0Hf
	uXao1zcYX180KI1/zIrFy1izZkK1MaDT+5eaDuMDHa8Aki6bsG3A4PfDWaXRLCzKZuW/RlFTXXdkC
	fpcu3I95yjBrx74phEz0lK9cqGy7+1aou3s1ERndwyqHlNZTWL3Ocb3SOirofKWdoVNTSf5iCsBM9
	h9A5/dIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XH2-0000000DQvy-3dev;
	Thu, 10 Sep 2026 05:24:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XH1-0000000DQvc-1MzT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 05:24:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 795A2600CB;
	Thu, 10 Sep 2026 05:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9847F1F00893;
	Thu, 10 Sep 2026 05:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789017874;
	bh=PEC6nt3vrsRKDroa5BH8c3PyJBsiu7afAiaLn+a4ork=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OywiKZtQhA1ucXk0nlPEYGcui0A5w6vks8qaYrmsZQDyqHnDgn1rvD0ivb9bdqKWi
	 aimNMcgjsw6UDGABHBI8BaoOwyfbqdUbEYqV+fu05QV7IIPHKtgNXP7t7hxYtXiob+
	 Ep2OKXtULqUdGtVViITSffLDXKZcQ/wNAhSgZCUQuUlGsPCFVgRCuPY6y4oymp0DJC
	 nBUjAcljHtzQqUN0hcuWiLgrvZmUJq8Xp8bqZPYJUTGUKQHJn3dJyWHvdd6uLKcsVp
	 mkQYhlM7YMf15126ZskGT8aiKSE/Bb/y2EQWBKMHksY4JlbD3kmV42G0GGKdJxmurH
	 xeu0SSW/Noyug==
Subject: Re: [PATCH net-next v6 3/3] net: xilinx: axienet: Fix IRQ error handling
From: netdev-bot+sashiko@kernel.org
To: phucduc.bui@gmail.com
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
 horms@kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 10 Sep 2026 05:24:33 +0000
Message-ID: <178901787314.219967.14642070814356568514@kernel.org>
In-Reply-To: <20260909045450.16176-4-phucduc.bui@gmail.com>
References: <20260909045450.16176-4-phucduc.bui@gmail.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 (2) · Low: 0

- [Medium] Understated impact / missing Fixes: tag.

Pre-existing issues:
- [Medium] DT binding and driver disagree on the ethernet-node
  `interrupts` list.
- [Medium] IRQ mapping leaked on probe error paths.

--

net: xilinx: axienet: Fix IRQ error handling

The probe path in axienet_probe() gets its DMA interrupts either from
irq_of_parse_and_map(), which returns 0 on failure, or from
platform_get_irq(), which returns a negative errno. The patch splits the
old combined "<= 0" test so that a zero mapping returns -EINVAL and a
negative platform_get_irq() result is propagated unchanged.

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 3927ababf833..782f903d318f 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -2971,10 +2971,14 @@ static int axienet_probe(struct platform_device *pdev)
>  			dev_err(&pdev->dev, "could not map DMA regs\n");
>  			return PTR_ERR(lp->dma_regs);
>  		}
> -		if (lp->rx_irq <= 0 || lp->tx_irq <= 0) {
> +		if (!lp->rx_irq || !lp->tx_irq) {
>  			dev_err(&pdev->dev, "could not determine irqs\n");
> -			return -ENOMEM;
> +			return -EINVAL;
>  		}
> +		if (lp->rx_irq < 0)
> +			return lp->rx_irq;
> +		if (lp->tx_irq < 0)
> +			return lp->tx_irq;

[Severity: Medium]
Is the commit message understating what these two new checks change?

In the branch without "axistream-connected", the interrupts come from:

	lp->rx_irq = platform_get_irq(pdev, 1);
	lp->tx_irq = platform_get_irq(pdev, 0);

and platform_get_irq() -> platform_get_irq_optional() -> __platform_get_irq()
-> of_irq_get() returns -EPROBE_DEFER when irq_find_host() finds no domain
for the parsed interrupt parent. The code being removed turned that into
-ENOMEM:

	if (lp->rx_irq <= 0 || lp->tx_irq <= 0) {
		dev_err(&pdev->dev, "could not determine irqs\n");
		return -ENOMEM;
	}

The driver core does not retry probing on -ENOMEM, so an axienet instance
whose interrupt controller is registered after the ethernet device never
appears at all. With the new "lp->rx_irq < 0" / "lp->tx_irq < 0" returns,
the deferred probe request reaches the driver core again.

The commit message describes this only as "propagate the original error code
returned by platform_get_irq() instead of returning -ENOMEM", and the
changelog says "Drop the Fixes: tag as this patch is intended for net-next".
Could the message mention the restored deferred probe behaviour, and would a
Fixes: tag be appropriate given that behaviour change?

[Severity: Medium]
This isn't a bug introduced by this patch, but the block being reworked here
enforces an interrupt ordering that disagrees with the binding.

Documentation/devicetree/bindings/net/xlnx,axi-ethernet.yaml documents:

  interrupts:
    items:
      - description: Ethernet core interrupt
      - description: Tx DMA interrupt
      - description: Rx DMA interrupt
    ...
    minItems: 1

while the no-"axistream-connected" branch of axienet_probe() reads:

	lp->rx_irq = platform_get_irq(pdev, 1);
	lp->tx_irq = platform_get_irq(pdev, 0);
	lp->eth_irq = platform_get_irq_optional(pdev, 2);

that is, index 0 as Tx DMA, index 1 as Rx DMA and index 2 as the Ethernet
core interrupt.

For a device tree written to the documented order, does this put the Ethernet
core interrupt into tx_irq and the Tx DMA interrupt into rx_irq while probe
still succeeds? And does a binding-legal single-entry interrupts list get
rejected by exactly this block, now with -EINVAL or a propagated
platform_get_irq() error?

Which of the two is correct, the binding or the driver?

>  		if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO)
>  			return lp->eth_irq;
>  

[Severity: Medium]
This is a pre-existing issue, but does this error path leak the virq mapping
created by irq_of_parse_and_map()?

The "axistream-connected" branch does:

	lp->rx_irq = irq_of_parse_and_map(np, 1);
	lp->tx_irq = irq_of_parse_and_map(np, 0);

and irq_dispose_mapping() does not appear anywhere in
drivers/net/ethernet/xilinx/xilinx_axienet_main.c, including in
axienet_remove().

So if rx_irq maps successfully and tx_irq comes back as 0, the new

	if (!lp->rx_irq || !lp->tx_irq) {
		dev_err(&pdev->dev, "could not determine irqs\n");
		return -EINVAL;
	}

returns with the rx_irq mapping still in place. The same applies to the later
returns in this branch, for example the platform_get_irq_optional() error, the
__axienet_device_reset() failure and dma_set_mask_and_coherent(). The old
-ENOMEM return had the same problem, so this isn't a new leak, but should the
mapping be disposed on these paths?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909045450.16176-1-phucduc.bui%40gmail.com

