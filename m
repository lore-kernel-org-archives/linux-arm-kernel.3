Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B2210F92E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 16:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDMDu+KQNPl9LVsfF1SGzQusDF9mr9eDLdnCQE4KcXY=; b=2LBthMseADMpsuy+bZhOI5/lTg
	PrEv2Mv9qjwfNN8gVXw5GUPihgVokJMRBg9JO3J3ZkOw1cabnveDdxF13GtHj7TFm/CffEHcQ+BN7
	T7PJc3mo2TMp0XppS13Y5P6An0fhalieRjtVRsZNoGLOjAgdApdsLLYSr9cPK0Gtg/Jq2oDRNMa79
	tmSEsO8J2qXvWYBb/AaYU8BrjCSmMUnN+5iPBGNs5RPccExjVaib1KnCwbxix7MFWT7z8NwBDTXoL
	socDWe95aGPCbFfZ1X8ngTxEWLSZgvSkxUAgPBeT/9fLy9VlGq6egR71gyq20BOCDHlZ0uQsVY8aD
	+sulcCgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bfU-0000000DEeg-1mP5;
	Tue, 31 Mar 2026 16:10:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bfS-0000000DEeH-04hi;
	Tue, 31 Mar 2026 16:10:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 03EA1417F5;
	Tue, 31 Mar 2026 16:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 336A5C19423;
	Tue, 31 Mar 2026 16:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774973412;
	bh=ijpDo/7JDayOQ1D9eDJjCZ11/E2WfbQpZeWsZEqb6ww=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rQI73jqXU6YI2gkO3mK+iz8h5EIxdGh44HXO3c1FtbeD3FDDwWl7IWu8703NDHEob
	 LhJNtt5HQRbebcFdvfX7gid3ym3Lf6UOsPdBPBVRpAucPdSpc69l/qDMWpKsyM9mlS
	 xIiF+1IR3jKxi+b81z9psAZGWpPT6XRQXSP5B1hp3/naLfjosz/ze3RkgiK9Nieqo6
	 fK0LLxoihbzuVGdXoZKVMzuHLXfaJWHjMi+RHa2dELqC1QNjZlahKUDiOkTLoyFo6W
	 BA7vhj+kPd7x1OWadIzRBTH3YyxIXIMcNu2LcDwA0r5V3p9SlxKB12q28gL8bgqjx9
	 CKBur4Mj/yn5w==
From: Thomas Gleixner <tglx@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@codeconstruct.com.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v4 2/4] irqchip/ast2700-intc: Add AST2700-A2 support
In-Reply-To: <20260330-irqchip-v4-2-3c0f1620cc06@aspeedtech.com>
References: <20260330-irqchip-v4-0-3c0f1620cc06@aspeedtech.com>
 <20260330-irqchip-v4-2-3c0f1620cc06@aspeedtech.com>
Date: Tue, 31 Mar 2026 18:10:08 +0200
Message-ID: <87tstw7zfj.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_091014_083394_69215BE9 
X-CRM114-Status: GOOD (  12.81  )
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

On Mon, Mar 30 2026 at 14:32, Ryan Chen wrote:
> +static int resolve_parent_range_for_output(const struct aspeed_intc0 *intc0,
> +					   const struct fwnode_handle *parent,
> +					   u32 output,
> +					   struct aspeed_intc_interrupt_range *resolved)

Please reduce the number of line breaks. You still have 100 characters.

> +{
> +	for (size_t i = 0; i < intc0->ranges.nranges; i++) {
> +		struct aspeed_intc_interrupt_range range =
> +			intc0->ranges.ranges[i];

No line break required.

> +static int aspeed_intc1_irq_domain_activate(struct irq_domain *domain,
> +					    struct irq_data *data, bool reserve)
> +{
> +	struct aspeed_intc1 *intc1 = irq_data_get_irq_chip_data(data);
> +	struct aspeed_intc_interrupt_range resolved;
> +	int rc, bank, bit;
> +	u32 mask;
> +
> +	if (WARN_ON_ONCE((data->hwirq >> INTC1_ROUTE_SHIFT) >= ARRAY_SIZE(aspeed_intc1_routes)))
> +		return -EINVAL;
> +
> +	/*
> +	 * outpin may be an error if the upstream is the BootMCU APLIC node, or
> +	 * anything except a valid intc0 driver instance
> +	 */
> +	rc = aspeed_intc0_resolve_route(intc1->upstream, INTC1_ROUTE_NUM,
> +					aspeed_intc1_routes[data->hwirq >> INTC1_ROUTE_SHIFT],
> +					intc1->ranges.nranges,
> +					intc1->ranges.ranges, &resolved);

Please test your code with CONFIG_PROVE_LOCKING=y, which is mandatory
for submission according to documentation.

This is invoked with the interrupt descriptor lock held and interrupts
disabled.

       aspeed_intc0_resolve_route()
                ....
                irq_find_matching_fwspec()
                	mutex_lock(&irq_domain_mutex); <---- FAIL

Thanks,

        tglx

        

