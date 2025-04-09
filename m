Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FF7C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 08:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beqSCrthJJ96ffNv3VxFRcPOEYbKMeCzBJvR9ZAwmRo=; b=RAX2rCcJQt2eb58xOZzXgD+UOQ
	tLbfbnM5A0tV/n3KsZSqpIzkJ4pvelvi3CpxSLBDR6ncXhJkZlavWZQdUcA5voOpHdvcsWUf71IAQ
	F2ZThdNkux4+JRMPXfO5dOEQo2N7wlXjqG9C9ATcY7nE8O4wjm0bExytVa+YrRQf0Edz/s8O1XZXd
	C5+t9dhXITcixH1W1FlEZEEXwFogttqfsHzKoxDzz2s5tqhC38MiZL+El51F6V6Fxdzs/XSl2lqQa
	5AKSogZYRKIH07KSbKVutUfmn8h9XDnz1rw3E5vsCF5dNodSGM/LNF86mkMcf29lmVVgRfi/nmt+D
	GBbs1esQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Qox-00000006aKb-3IOS;
	Wed, 09 Apr 2025 08:30:07 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QmM-00000006Zj0-381s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 08:27:27 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744187244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=beqSCrthJJ96ffNv3VxFRcPOEYbKMeCzBJvR9ZAwmRo=;
	b=cEqbhwTougUpomdumFtZLkpuEa6pFWI8Ce4+URMRNQwDpvuX3iLQ8D95jsn1TrL5ApN57d
	s1fYke81i0ORSg+/67l8P4xSEqb7rhdxujU9Bp3YZEu/f5hMjEsM4I9JkyHmN++E9hItRZ
	+ySNNZ+9reK6a7EE7/86AA3JVJF4vxB5uoOq56lNgr0cxWBKG6SBfRnTceifjiA5ur9g66
	DiDLKEZTqEHSBzdnUgYnrLClugiJPfiLuKzjrDo2xwnSEWtg5xbEE+2OL7VpIYN2NgkQUt
	H017FlRcZE7RaUO0hsf2lS7H/1ElA0H7QcejDvgA3ugefNS8X0uhKZcZ/pODlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744187244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=beqSCrthJJ96ffNv3VxFRcPOEYbKMeCzBJvR9ZAwmRo=;
	b=XU06grseNXk6NF5fs+KuOxKTjWZFrN7EUjv1zo7cX9FSdrHcycwpYCk0dxAwjpUSKQ9GQC
	PEVl8g+1LE5EuGDQ==
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
 <maz@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, Timothy Hayes
 <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lorenzo
 Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH 20/24] irqchip/gic-v5: Add GICv5 LPI/IPI support
In-Reply-To: <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
Date: Wed, 09 Apr 2025 10:27:24 +0200
Message-ID: <87wmbtu4cz.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_012726_921887_256AA410 
X-CRM114-Status: GOOD (  20.50  )
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

On Tue, Apr 08 2025 at 12:50, Lorenzo Pieralisi wrote:
> +/* Wait for completion of an IST change */
> +static int gicv5_irs_ist_wait_for_idle(struct gicv5_irs_chip_data *irs_data)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = readl_relaxed_poll_timeout_atomic(
> +			irs_data->irs_base + GICV5_IRS_IST_STATUSR, val,
> +			FIELD_GET(GICV5_IRS_IST_STATUSR_IDLE, val), 1,
> +			USEC_PER_SEC);
> +
> +	if (ret == -ETIMEDOUT)
> +		pr_err_ratelimited("IST_STATUSR.IDLE timeout...\n");
> +
> +	return ret;

I'm sure I've seen that code before and without looking I'm sure the
diff between the two functions is ~2 lines.

> +
> +	mtree_lock(&lpi_mt);
> +	ret = mas_empty_area(&mas, 0, num_lpis - 1, lpis);
> +	if (ret) {
> +		pr_err("Failed to perform a dynamic alloc in the LPI MT!\n");
> +		return ret;
> +	}
> +
> +	lpi_base = mas.index;
> +
> +	/*
> +	 * We don't really care about the entry itself, only about
> +	 * allocation of a maple tree ranges describing in use LPIs.
> +	 * That's why, upon allocation, we try to merge slots adjacent
> +	 * with the empty one we are allocating to minimize the number
> +	 * of slots we take from maple tree nodes for nothing, all
> +	 * we need to keep track of is in use ranges.
> +	 */

I'm really not convinced that you need a maple tree and the code
complexity for this. What's wrong with a simple bitmap other than that
it might need 1MB memory?

> +static int gicv5_irq_lpi_domain_alloc(struct irq_domain *domain,
> +				      unsigned int virq, unsigned int nr_irqs,
> +				      void *arg)
> +{
> +	irq_hw_number_t hwirq;
> +	struct irq_data *irqd;
> +	u32 *base_lpi = arg;
> +	int i, ret;
> +
> +	hwirq = *base_lpi;
> +
> +	for (i = 0; i < nr_irqs; i++) {
> +		irqd = irq_desc_get_irq_data(irq_to_desc(virq + i));

irq_get_irq_data() and irq_domain_get_irq_data() exist for a reason.

> +
> +		irq_domain_set_info(domain, virq + i, hwirq + i,
> +				    &gicv5_lpi_irq_chip, NULL,
> +				    handle_fasteoi_irq, NULL, NULL);
> +		irqd_set_single_target(irqd);
> +static int gicv5_irq_ipi_domain_alloc(struct irq_domain *domain,
> +				      unsigned int virq, unsigned int nr_irqs,
> +				      void *arg)
> +{
> +	int ret, i;
> +	u32 lpi;
> +	struct irq_data *irqd = irq_desc_get_irq_data(irq_to_desc(virq));

Again. Zero reason to fiddle with irq_desc.

Thanks,

        tglx

