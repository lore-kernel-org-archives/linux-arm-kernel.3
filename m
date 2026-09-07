Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD9BC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 19:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r92QJnEK1Mm6AeF5NI2zhBEQ+pWTenUKONO/hQTom24=; b=EDO49IaOhdZ9rygCIuqXYrwMYN
	jJ1FN4fMQT7wxSPrLO8KZXETWlt7KKaB7mcasM9+s4lPIbCi79vSFoS4UMvzH5aKMZyi9f7caDQGQ
	vwV2sDUBxmbwwVvLJv5nJoHgb4SO9/MZH+JnCofoxPGfJpVK0ZxjAVeANyobFVy9vyOYI+Vj1oEMW
	t1bf9v4bITlVKiQfGNr+ad8ToXxLpFAKEYm3ZKoj1LhY740iGi61wWpVtUxqLOofeZ/oTBl+ovKqB
	aswxJm9s/5S81rLPuXvAkfhksPagyP2fdRJzh0C/IVLqft37KiaE72lb/0r+aZkQBzcOqSZMONc9M
	ZUn4wQVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3f6m-00000007ehT-1Oem;
	Mon, 07 Sep 2026 19:34:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3f6f-00000007egG-2J4G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 19:34:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F23D1601DE;
	Mon,  7 Sep 2026 19:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59DD1F00A3D;
	Mon,  7 Sep 2026 19:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788809656;
	bh=r92QJnEK1Mm6AeF5NI2zhBEQ+pWTenUKONO/hQTom24=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=o3IT22GsD/B/QO6WNgY5PQIJ76IODUIckqWiQ+Hw3qQ2Q7opXkBr9CefeZJwgLrax
	 n568KOyUbUgX3kDMuRavlwXNvF7uRsqxwqU5IccTl6YBlLsyiFnqP4iKqJBq6+8PWJ
	 rbk7wzMVsZvIn0foCDyiUxoRnDt+Q9e5SaD1ygSHVq8NJnk72HgXC+KctyLnhEENj/
	 q8lcbrxxvmNMyhX0R9/t4nG4Lz+WFfMsYupa1yphMTF1ogBenckleqsBTBNOUo4xdT
	 upJVfxkykf2DP2vpxc/qMYuAQQ4+BJlERJTwZW4NKjTPdMDf7MqPSItUQXP7stUinq
	 zSJafXEEDtPSA==
Subject: Re: [PATCH net-next v5 3/3] net: xilinx: axienet: Fix IRQ error handling
From: netdev-bot+sashiko@kernel.org
To: phucduc.bui@gmail.com
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
 horms@kernel.org, andre.przywara@arm.com, hancock@sedsystems.ca,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 07 Sep 2026 19:34:15 +0000
Message-ID: <178880965548.219967.14368880612178322930@kernel.org>
In-Reply-To: <20260903073252.339250-4-phucduc.bui@gmail.com>
References: <20260903073252.339250-4-phucduc.bui@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 1 · Medium: 0 (1) · Low: 0

- [High] Incomplete fix: the axistream-connected branch of
  axienet_probe() still cannot request a probe retry, and this patch now…

Pre-existing issues:
- [Medium] DT binding and driver disagree on interrupt index ordering.

--

net: xilinx: axienet: Fix IRQ error handling

This changes the DMA IRQ validation in axienet_probe() so that a zero
result from irq_of_parse_and_map() returns -EINVAL instead of -ENOMEM,
and adds explicit propagation of negative error codes coming from
platform_get_irq().

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

[Severity: High]
Does turning the zero case into a permanent -EINVAL remove the chance of a
probe retry for the axistream-connected branch?

In that branch the IRQs come from:

		lp->rx_irq = irq_of_parse_and_map(np, 1);
		lp->tx_irq = irq_of_parse_and_map(np, 0);

irq_of_parse_and_map() folds every failure into 0, including the case where
the interrupt provider's IRQ domain is not registered yet:

drivers/of/irq.c:irq_of_parse_and_map() {
	if (of_irq_parse_one(dev, index, &oirq))
		return 0;

	return irq_create_of_mapping(&oirq);
}

irq_create_of_mapping() also returns 0 when no domain is found, so
"not ready yet" and "malformed DT" are indistinguishable here, and
axienet_probe() now converts both into a terminal -EINVAL with no
-EPROBE_DEFER path.

Would of_irq_get(np, index) be a better fit? It is documented to return
-EPROBE_DEFER if the IRQ domain is not yet created, and 0 only when the
interrupt is genuinely absent, which would let a single pair of checks

		if (irq < 0)
			return irq;
		if (!irq)
			return -EINVAL;

cover both the axistream and the platform_get_irq() branches.

Could the commit message also mention that the deferral case stays
unhandled with irq_of_parse_and_map(), or use of_irq_get() so that it is?

> +		if (lp->rx_irq < 0)
> +			return lp->rx_irq;
> +		if (lp->tx_irq < 0)
> +			return lp->tx_irq;

Are these two checks reachable for the axistream-connected branch?
irq_of_parse_and_map() returns an unsigned int virq, so they only ever fire
for the values obtained from platform_get_irq(), which makes the added
error handling asymmetric between the two IRQ sources.

>  		if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO)
>  			return lp->eth_irq;
>

[Severity: Medium]
This is a pre-existing issue and was not introduced by this patch, but since
the patch hardens validation on exactly this branch, it may be worth
reconciling: the driver and the binding disagree on the interrupt index
order.

The direct-resource branch of axienet_probe() reads:

		lp->rx_irq = platform_get_irq(pdev, 1);
		lp->tx_irq = platform_get_irq(pdev, 0);
		lp->eth_irq = platform_get_irq_optional(pdev, 2);

Documentation/devicetree/bindings/net/xlnx,axi-ethernet.yaml describes the
opposite positional order:

  interrupts:
    items:
      - description: Ethernet core interrupt
      - description: Tx DMA interrupt
      - description: Rx DMA interrupt

The same probe function treats index 0 on the ethernet node as the Ethernet
core IRQ in the axistream and dmas branches:

		lp->eth_irq = platform_get_irq_optional(pdev, 0);

so index 0 has two meanings inside one function and at most one of them can
match the binding.

The binding text is also self-inconsistent: it says the Ethernet core
interrupt is optional while placing it first in a positional items list with
minItems: 1, which is only expressible when the optional entry is last, as
the driver assumes.

For a three-interrupt DT written from the documented order, all three values
are positive, so neither !lp->rx_irq || !lp->tx_irq nor the new < 0 tests
reject it, and axienet_init_legacy_dma() goes on to request_irq() the
Ethernet core line as a DMA handler. Should the binding or the driver be
corrected so the two agree?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260903073252.339250-1-phucduc.bui%40gmail.com

