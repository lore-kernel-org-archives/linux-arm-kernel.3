Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8554C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 17:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWuv6gUEHahmSEcdFXSzDw18Wc9BRfxVlwU/I9dRzTw=; b=0QpHGTqA4kur0xCDmVwrAjfyby
	gLCOH/95W2F+8iZ31f8u+KTsyQfxzyl+OSRHZpaocElXrffiWynB0zEqobyckqkhojU1/knR6Og3T
	cncfJ9CCNJyOl/W7xKOnXy7g9B6WpVVhqxzZsMFSRgcf5nZaXC0HB7lITb78I615IuHp9fF2iUlIl
	S9F0l2lM/jpmsPE5t7ik9/ek3Vxj41+SzdEXlMFX4og2+Av1/bmbBBFjCKPTH3aa1JwCUbHWQgSXQ
	ulbiBrwdW3WWF6DOox4J4Wnbkqx+CNNCQaCPd6qJ7dOyzy1wg1A1azULTc8OdMDN4N5IByUX74bd9
	hHSX+HYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujL6L-0000000DNH2-2kb1;
	Tue, 05 Aug 2025 17:05:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJku-0000000DAyd-26YA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 15:39:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7FA01A56620;
	Tue,  5 Aug 2025 15:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E53C4CEF0;
	Tue,  5 Aug 2025 15:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754408351;
	bh=Sfc3xMxHGqVoflK676SStVZbw5uDGyunMmKEB2eOesM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tvLIBxj8IsgIX41sw53OtzX3fdSThyLyVyGhoI1inGTzM5sMCj5lU9fDrUeBDXkUd
	 aKZd4ZF2s2RWT+H3CnkZFF+w7jF7GgHW8UBtprj+4UVk4Zk5LBFJVwPdVcgFwgu5zA
	 DpVn4bKnqDeuI7G9lSY1QVAjN4L7LkdnISkvQFOJjJbXhC1ONbkAwrSnfCWkiZScoI
	 b7dJkTlw1a8merA/t75DOoawK+KnPSH6o12t33UxdV/RJyve4f8cHuGdKPqdxIuoTB
	 0q99GD1EaJ7h6gVRa3dku3gsRFpk3Ba0r0dmdriLLPz/mcuSQ9C5s+4BJ+JjuyfwFK
	 mPLUnqRSi/iSg==
Date: Tue, 5 Aug 2025 10:39:08 -0500
From: Rob Herring <robh@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Eddie James <eajames@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] irqchip/aspeed-scu-ic: Add support for AST2700 SCU
 interrupt controllers
Message-ID: <20250805153908.GA1807801-robh@kernel.org>
References: <20250804053445.1482749-1-ryan_chen@aspeedtech.com>
 <20250804053445.1482749-3-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250804053445.1482749-3-ryan_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_083912_680303_B503ABED 
X-CRM114-Status: GOOD (  18.04  )
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

On Mon, Aug 04, 2025 at 01:34:45PM +0800, Ryan Chen wrote:
> The AST2700 SoC follows the multi-instance interrupt controller architecture
> introduced in the AST2600, where each SCU interrupt group (IC0–IC3) is treated
> as an independent interrupt domain.
> 
> Unlike the AST2600, which uses a combined register for interrupt enable and
> status bits, the AST2700 separates these into distinct registers: one for
> interrupt enable (IER) and another for interrupt status (ISR). This architectural
> change requires explicit handling of split registers for interrupt control.
> 
> - Register definitions and configuration for AST2700 SCU IC instances
>   (compatible: aspeed,ast2700-scu-ic0/1/2/3)
> - Initialization logic for handling split IER/ISR registers
> - Chained IRQ handling and mask/unmask logic
> - Table-driven registration using IRQCHIP_DECLARE per compatible
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  drivers/irqchip/irq-aspeed-scu-ic.c | 240 ++++++++++++++++++++++------
>  1 file changed, 195 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-aspeed-scu-ic.c b/drivers/irqchip/irq-aspeed-scu-ic.c
> index 1c7045467c48..b6f3ba269c5b 100644
> --- a/drivers/irqchip/irq-aspeed-scu-ic.c
> +++ b/drivers/irqchip/irq-aspeed-scu-ic.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> - * Aspeed AST24XX, AST25XX, and AST26XX SCU Interrupt Controller
> + * Aspeed AST24XX, AST25XX, AST26XX, AST27XX SCU Interrupt Controller
>   * Copyright 2019 IBM Corporation
>   *
>   * Eddie James <eajames@linux.ibm.com>
> @@ -34,11 +34,42 @@
>  	GENMASK(5, ASPEED_AST2600_SCU_IC1_SHIFT)
>  #define ASPEED_AST2600_SCU_IC1_NUM_IRQS	2
>  
> +#define ASPEED_AST2700_SCU_IC0_EN_REG	0x1d0
> +#define ASPEED_AST2700_SCU_IC0_STS_REG	0x1d4
> +#define ASPEED_AST2700_SCU_IC0_SHIFT	0
> +#define ASPEED_AST2700_SCU_IC0_ENABLE	\
> +	GENMASK(3, ASPEED_AST2700_SCU_IC0_SHIFT)
> +#define ASPEED_AST2700_SCU_IC0_NUM_IRQS	4
> +
> +#define ASPEED_AST2700_SCU_IC1_EN_REG	0x1e0
> +#define ASPEED_AST2700_SCU_IC1_STS_REG	0x1e4
> +#define ASPEED_AST2700_SCU_IC1_SHIFT	0
> +#define ASPEED_AST2700_SCU_IC1_ENABLE	\
> +	GENMASK(3, ASPEED_AST2700_SCU_IC1_SHIFT)
> +#define ASPEED_AST2700_SCU_IC1_NUM_IRQS	4
> +
> +#define ASPEED_AST2700_SCU_IC2_EN_REG	0x104
> +#define ASPEED_AST2700_SCU_IC2_STS_REG	0x100
> +#define ASPEED_AST2700_SCU_IC2_SHIFT	0
> +#define ASPEED_AST2700_SCU_IC2_ENABLE	\
> +	GENMASK(3, ASPEED_AST2700_SCU_IC2_SHIFT)
> +#define ASPEED_AST2700_SCU_IC2_NUM_IRQS	4
> +
> +#define ASPEED_AST2700_SCU_IC3_EN_REG	0x10c
> +#define ASPEED_AST2700_SCU_IC3_STS_REG	0x108
> +#define ASPEED_AST2700_SCU_IC3_SHIFT	0
> +#define ASPEED_AST2700_SCU_IC3_ENABLE	\
> +	GENMASK(1, ASPEED_AST2700_SCU_IC3_SHIFT)
> +#define ASPEED_AST2700_SCU_IC3_NUM_IRQS	2
> +

The reason for ic0/ic1 compatibles before was the enable field was 
different. Now it's at least at the same shift. Do you really need a 
different value for IC3? 

The register addresses should come from "reg". I don't understand why 
they are hardcoded in the driver.

Rob

