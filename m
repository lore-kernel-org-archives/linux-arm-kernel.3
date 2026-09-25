Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3DFC9832E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 20:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9e4w1HegrYk5Lp2N7aLikUozmLDaONnQ9sVyram9egM=; b=o2vcbQzs8zQwCk8h8p/8qMJV4u
	Y140oHerVsfRoGoXfMYVhNbnSqmxKqnXpzX0hNGzurcxiUdeMlCMwuS7znlycjqjvP3wa5ShKEBek
	GVPbxlNgJohxqUImJwiw67RpFkBBnWsuV/D5Gc9/OtmyiMAqokCEh/QUpSRC82x/0Dg6j4ufrMvgM
	MByBVjV7LrQebrl03v9y8EKoqx6zAlCX7ohxBOgqGETvCPq35k2ddVCi5/btJ1EybdnGAGbodmDc3
	qJdreuY3GVRs5LcnFHOi3kEILr0maFnWuZeKl8s/G0gbMu1HD0VA1U7Yq7kCWTsgPyhwPImqYT9Ta
	bD5RWHpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xACuU-0000000EQWy-0e3w;
	Fri, 25 Sep 2026 20:52:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xACuD-0000000EQQn-0fXT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 20:52:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3398043FFE;
	Fri, 25 Sep 2026 20:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C33E91F000FF;
	Fri, 25 Sep 2026 20:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790369548;
	bh=9e4w1HegrYk5Lp2N7aLikUozmLDaONnQ9sVyram9egM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=h25wICG84BRyEmXhXedEq/yuF0YggA2lBxwDGUVLK9AW9Hg2igJzA028PPCtS+VGe
	 2nASm30RVCtHPzHYAMJsYOF+VypKmtTGEiWov2+Oteudmp8QQwUhDd8jwkx4vqOfRd
	 2K/NTAvc7j7AltgUGRkbwPO0aakrznAclhYZkb9Rw8oBctujkhkOq2KQOWsqVbURGE
	 jodcc9LJsf9NKhEcy5/E07XWuwytjVndmyoZhnw8gnmXwVou+q5sBchqICz2EjIcmr
	 6OZGHjCb6Lj8K7vJFZFKNtqBnvREyjKZSvA1/09SXy96UlfJ1D8eUovgjMoujFh8bL
	 B+CHM7PkrOPpA==
Subject: Re: [PATCH net-next v8 10/15] net: lan966x: add shutdown callback to
 stop the FDMA on reboot
From: netdev-bot+sashiko@kernel.org
To: daniel.machon@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horatiu.vultur@microchip.com,
 steen.hegelund@microchip.com, UNGLinuxDriver@microchip.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, herve.codina@bootlin.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, mohsin.bashr@gmail.com, horms@kernel.org,
 richardcochran@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 25 Sep 2026 20:52:26 +0000
Message-ID: <179036954633.2160803.10091756742386448294@kernel.org>
In-Reply-To: <20260924-lan966x-pci-fdma-v8-10-201c7b707d8b@microchip.com>
References: <20260924-lan966x-pci-fdma-v8-10-201c7b707d8b@microchip.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 2 · Medium: 0 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Baseline decision: false positive; not reachable at this commit,
  and closed later in the series.
- [High] Baseline decision: false positive; not reachable at this commit,
  and closed later in the series.
- [Low] The part of lan966x_shutdown() that actually runs on PCIe at this
  commit fixes behaviour that has existed since PCIe support for lan966x…
- [Low] Baseline decision: false positive.

--

net: lan966x: add shutdown callback to stop the FDMA on reboot

This adds a .shutdown callback to the lan966x switch driver. The callback
only acts on the PCIe instantiation, where it frees the xtr, ana and FDMA
irqs, masks the analyzer interrupt, detaches the netdevs, disables both
FDMA channels and unmaps the outbound ATU windows.

It also restores the full FDMA_INTR_ENA enable in lan966x_fdma_rx_start(),
because that register persists across a warm reboot.

> diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> index 259d81e759076..024ce9f9916c7 100644
> --- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> @@ -1324,9 +1324,65 @@ static void lan966x_remove(struct platform_device *pdev)
>  	debugfs_remove_recursive(lan966x->debugfs_root);
>  }
>
> +static void lan966x_shutdown(struct platform_device *pdev)
> +{
> +	struct lan966x *lan966x = platform_get_drvdata(pdev);
> +

[ ... ]

> +	if (!lan966x_is_pci(lan966x))
> +		return;
> +
> +	if (lan966x->xtr_irq > 0)
> +		devm_free_irq(lan966x->dev, lan966x->xtr_irq, lan966x);
> +	if (lan966x->ana_irq > 0)
> +		devm_free_irq(lan966x->dev, lan966x->ana_irq, lan966x);
> +	if (lan966x->fdma_irq > 0)
> +		devm_free_irq(lan966x->dev, lan966x->fdma_irq, lan966x);
> +
> +	lan_wr(0, lan966x, ANA_ANAINTR);

[Severity: Low]
The code here looks correct, but should this change carry a Fixes: tag?

At this point in the series, the only part of lan966x_shutdown() that runs
on PCIe is the part that frees the xtr and ana irqs and clears ANA_ANAINTR.

The xtr and ana interrupts were wired up by commit 185686beb464 ("misc: Add
support for LAN966x PCI device"), in drivers/misc/lan966x_pci.dtso:

    interrupt-names = "xtr", "ana";

Since that commit, a warm host reboot leaves these OIC sources enabled on an
endpoint that is not reset. The same is true of the analyzer interrupt
armed by lan966x_init(). This matches what the commit message describes:

  "As a PCIe endpoint, lan966x is not reset by a host reboot: its FDMA
  channels and interrupt sources stay armed, and the OIC ORs every
  source into the shared PCIe INTx, asserted before the driver has
  re-probed."

Could the xtr/ana part be split out as a standalone fix with:

  Fixes: 185686beb464 ("misc: Add support for LAN966x PCI device")

As written, it depends on lan966x_is_pci() and lan966x->dma_dev, which were
added earlier in this series. That means it can't be identified for stable
or backported on its own.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260924-lan966x-pci-fdma-v8-0-201c7b707d8b%40microchip.com

