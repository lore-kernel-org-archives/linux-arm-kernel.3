Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B517C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 12:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJTOrfSboZ5kBnfTci5EHjzBUJIqW0Jji9p+5UbooMI=; b=RKhoh0YvM9Dh9BV2AigR14MEWN
	e7sBDbPUkb4BQ61WbSnXkKXfRRUrKiMSZ/ecR7+jQEp7JLPgKO8gwnPUCYmYaQKL9umu5NSdY2bgR
	uMMumRhNRSvXsmAL/CxV+Fvt4ZvLjn2Ngd/VSPpsMD9ehHDlAOyw4X+J/R1RepCjIXmHm5/ruR9VP
	0nyKhQZVQNdVn0zXFen1Ey560IQeIMxziAvUymhWJ7+uUVYWzCcV+filAVqACOw7zjutvv7p7iwFA
	q+b9CLMteSZRJ4z+OPh3UtEV60+HdfwJzRMOd+S007k4KY+X2un1UL7bY0ibUeyrMmC/pSMK4lUhJ
	q41Vv9VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugjOW-0000000GiQn-007o;
	Tue, 29 Jul 2025 12:25:24 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugjAZ-0000000Gh5I-0aTo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 12:11:00 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1753791055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bJTOrfSboZ5kBnfTci5EHjzBUJIqW0Jji9p+5UbooMI=;
	b=vtH1wAm4o8ZwzxxHLKO8cxIM67H/br7RGJ8TODVhx6Bp7jAJV2cT73RtIebTma5fuwuRuc
	2Odr3BPEGTYZO4CVCJYPIYFKSfzwsFaKUOkxmioZPMAd9LCaLo2mYRlTeuWhhGQwHiAHN2
	+rV28pGPY42N+SI1Hz6UAMxV2Eg3lW9qnNHRZlxPGEZZjKDJfd4e29ioN/2eDVy1ONZn21
	sUMouBnZYgTWFwFb0zXmBSnjjUld/Mdl7mOSjiRTkbCN+72blr7sSGusl/hN/vonNBY9QR
	M74EGGApj2FnieVBV5cqpvgitt4NaQjSK2v5dbZflUibqZZaRA7Rd+KYUrnhLg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1753791055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bJTOrfSboZ5kBnfTci5EHjzBUJIqW0Jji9p+5UbooMI=;
	b=CODkKN93nKbR4BkRAHJ60sfY22CZ5gfznf78OK/QMCyHUOTixYw9DOEdo0kdo7yWfIHLVQ
	r58CG5qkBWbO+KAw==
To: enachman@marvell.com, andrew@lunn.ch, gregory.clement@bootlin.com,
 sebastian.hesselbarth@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: enachman@marvell.com
Subject: Re: [PATCH] irqchip/mvebu-gicp: clear pending irqs on init
In-Reply-To: <20250729084826.3222785-1-enachman@marvell.com>
References: <20250729084826.3222785-1-enachman@marvell.com>
Date: Tue, 29 Jul 2025 14:10:54 +0200
Message-ID: <87ldo7jiy9.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_051059_324640_603DACBC 
X-CRM114-Status: GOOD (  21.15  )
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

On Tue, Jul 29 2025 at 11:48, enachman@marvell.com wrote:
> From: Elad Nachman <enachman@marvell.com>
>
> For kexec case, left interrupt might generate spurious
> interrupts in various A7/A8/CN913x interrupt system
> from the I/O SB to the NB.

That's a lot of incomprehensible acronyms. Is any of that relevant for
understanding the problem?

What's a 'left' interrupt?

Just say something like this:

  When a kexec'ed kernel boots up, there might be stale unhandled
  interrupts pending in the interrupt controller. These are delivered as
  spurious interrupts once the boot CPU enables interrupts.

That's clear and sufficient, no?

> Clear all pending interrupts
> when the driver is initialized to prevent these spurious
> interrupts.

> Signed-off-by: Elad Nachman <enachman@marvell.com>
> ---
>  drivers/irqchip/irq-mvebu-gicp.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/irqchip/irq-mvebu-gicp.c b/drivers/irqchip/irq-mvebu-gicp.c
> index d3232d6d8dce..0fa21a45d4e1 100644
> --- a/drivers/irqchip/irq-mvebu-gicp.c
> +++ b/drivers/irqchip/irq-mvebu-gicp.c
> @@ -31,6 +31,7 @@ struct mvebu_gicp_spi_range {
>  
>  struct mvebu_gicp {
>  	struct mvebu_gicp_spi_range *spi_ranges;
> +	void __iomem *base;

Why?

>  	unsigned int spi_ranges_cnt;
>  	unsigned int spi_cnt;
>  	unsigned long *spi_bitmap;
> @@ -236,6 +237,14 @@ static int mvebu_gicp_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> +	gicp->base = devm_platform_ioremap_resource(pdev, 0);

There is no reason to create a permanent mapping, which is not used
anywhere else. Just map, write, unmap.

> +	if (IS_ERR(gicp->base))
> +		dev_err(&pdev->dev, "gicp - Cannot ioremap !\n");

So this emits a unspecific error message and then happily
continues. That does not make sense.

As the ioremap failure is not fatal, tell the user what this is about,
i.e. "ioremap() failed. Unable to clear pending interrupts."
or something to that effect.

> +	else {

Lacks parenthesis on the if clause for symmetry.

> +		for (i = 0; i < 64; i++)
> +			writel(i, gicp->base + GICP_CLRSPI_NSR_OFFSET);
> +	}
> +
>  	return msi_create_parent_irq_domain(&info, &gicp_msi_parent_ops) ? 0 : -ENOMEM;
>  }

Thanks,

        tglx

