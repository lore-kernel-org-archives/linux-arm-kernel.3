Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C0CCA1010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqaO+SeV+juuMOmuDP+CCM9/ezm8a+cuzkEOZBsIzaY=; b=fd1B8zVAxZa5DejWGyOt5ZjWgx
	9d1ZTXFrjgAVSWsom1hz6iD7XS+G7OZoxRl9b5cu0e4a0TD63bswoTwSTBihv+AI55tBsxmOMdC9d
	3CZHqslZFkACTVfGlAhxEHrQEpx0MTX5L2XndPU6jIMbkH4vJu2l55mxqfVGkWldklJS+jmmacYjQ
	tBYeIt9T6bgidiNJVSYWrf+k1yB+Ype/Xom4TwLux1Ng3kyPYiPCd2L1zPFV7Ce4nNrSN8ZCew4bn
	jv2HiCL1OPCJFwo+xV14RCM1XqsU+Aod6O3hU/VDNRlBAaQPK9mlyEnDYRAq0k/GIh0MFuRHsf+q/
	Yu9jMpvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWNU-00000001Z1Q-2U0N;
	Tue, 02 Sep 2025 19:09:12 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQYa-0000000HSog-1YKF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 12:56:17 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756817773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fqaO+SeV+juuMOmuDP+CCM9/ezm8a+cuzkEOZBsIzaY=;
	b=Jl3Ir6pnSxJZNrlzEafpDbybEzAsScYMj2qFx4iAZKmr8ZcHniinwHLqQDkswxZdZVwrkH
	5TJRXTmcz57EvPHj07PBTrvCJaCEGuftAp+3rgQ14QaoTSXSxu2pyf09OnP9PC7+LX4MbZ
	pQwN9gposebgqqLa4aLFRNqXgYFOdRtp+CKIn30FTYyvvsgQq6NUwVdqkgqYE+m4/8Rmu1
	iihZDcz5qzDmpdQgKJMCMh9pVlcg9XvBKwujlRU3ep7YCsASiKAChlRfP3sWpCnFoGkof0
	ZtDCtMl5DH4mL9cvIsD3CD7GndYOqN9OBv0vEvmDqSizBOTr4ViVXZ3rzoqu4A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756817773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fqaO+SeV+juuMOmuDP+CCM9/ezm8a+cuzkEOZBsIzaY=;
	b=cSY2/ZxwSkTcM3n6h5dg0DWREVEm4aceh5FyNagu4bT+lojglO0U9ENF3AeFej8rv30yCv
	HhNHiyDBYRxVUcBg==
To: Ryan Chen <ryan_chen@aspeedtech.com>, ryan_chen
 <ryan_chen@aspeedtech.com>, Eddie James <eajames@linux.ibm.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] irqchip/aspeed-scu-ic: Refactor driver to
 support variant-based initialization
In-Reply-To: <20250831021438.976893-2-ryan_chen@aspeedtech.com>
References: <20250831021438.976893-1-ryan_chen@aspeedtech.com>
 <20250831021438.976893-2-ryan_chen@aspeedtech.com>
Date: Tue, 02 Sep 2025 14:56:12 +0200
Message-ID: <871pop2etv.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_055616_546967_088236AC 
X-CRM114-Status: GOOD (  10.70  )
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

On Sun, Aug 31 2025 at 10:14, Ryan Chen wrote:
>  	scu_ic->irq_domain = irq_domain_create_linear(of_fwnode_handle(node), scu_ic->num_irqs,
> -						   &aspeed_scu_ic_domain_ops,
> -						   scu_ic);
> +						      &aspeed_scu_ic_domain_ops,
> +						      scu_ic);

Please move scu_ic to the previous line.

> +aspeed_scu_ic_find_variant(struct device_node *np)
>  {
> -	struct aspeed_scu_ic *scu_ic = kzalloc(sizeof(*scu_ic), GFP_KERNEL);
> -
> -	if (!scu_ic)
> -		return -ENOMEM;
> +	for (int i = 0; i < ARRAY_SIZE(scu_ic_variants); i++)
> +		if (of_device_is_compatible(np, scu_ic_variants[i].compatible))
> +			return &scu_ic_variants[i];

the for loop wants curly brackets.

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#bracket-rules

> +	scu_ic->irq_enable    = variant->irq_enable;
> +	scu_ic->irq_shift     = variant->irq_shift;
> +	scu_ic->num_irqs      = variant->num_irqs;

Please use a TAB not spaces when you want to align things.

> +IRQCHIP_DECLARE(ast2600_scu_ic0, "aspeed,ast2600-scu-ic0", aspeed_scu_ic_of_init);
> +IRQCHIP_DECLARE(ast2600_scu_ic1, "aspeed,ast2600-scu-ic1",     aspeed_scu_ic_of_init);

Stray TAB in the last line.

Thanks,

        tglx

