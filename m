Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52614C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 10:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H4bfa9HHC24yuJLwZA8fZyzCcgSpgEJuAlShy/vJ0og=; b=Zy7pnwjuWIX2ELKAhZ6QI67YhW
	lcFgX5r8mO+4ZoTfF3p5OANmAhWlvTBb+ZCgmkdaEKcUwElJVpDxgoY2VVWLEURCGVj8KXQ1LQJqi
	51dOjz03UqcSQoN+je28SmIIbVwv70fpA3H2aLiz6Ja5ytvLqHjxyjeAJbcBNGN7WbKNjhIIc+jXK
	VpKW8G9XCM5LtuQd+8IkK1yQGEVeG7ZXTI8U3EXNnOgPLktrZLM0slvkyGH32KKfISUBrbLajjDuI
	oG+g/FmfUF1L07pSfkTAM770ZB562g/NWkOIA3+aXBcnxOPuWqXCdqpc0mrbVnZNLGsf8hJAH+1WD
	DxDvGT1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2SjX-00000006qEl-3bY4;
	Wed, 09 Apr 2025 10:32:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Shl-00000006poV-2udy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 10:30:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 06CE443F6D;
	Wed,  9 Apr 2025 10:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E2FC4CEE3;
	Wed,  9 Apr 2025 10:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744194648;
	bh=CIzSWQr2fxowjjcyE1pGFvoBUxHTEzwh5eGjyymix3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qWmn87rlAUQYXSgWIh045wU/TuVqaNrrIrAVIA9E0PcXE1XiZHj4Ox8Y/420Wqy8P
	 Su+jrC/cfSsF3QJ9S9GWhW42ZNOkT0TfmDg8e7AbdLmsAqiReN7nTU068EbxZBI7BM
	 zYMq1vhcLyfg0E9GgXqhl6ns9f9uRh8tfJywEShHCl1G3XFgHXgNU/djyK7bQbRexR
	 HTRXKkn38VXbUu0iurAKH7lGf4h5vO5gTAdkXTHErirnfjZc0PCEfzcZvAK9/Y+/XD
	 N9ByBmt5FVUqPUaiQ3pEIVWq1rCFRKOD5QtXFcJ8TwS+KL9zXHzhjqyKQ+t3b/NbVp
	 /m39+4Fj4yPZg==
Date: Wed, 9 Apr 2025 12:30:41 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 20/24] irqchip/gic-v5: Add GICv5 LPI/IPI support
Message-ID: <Z/ZMUchUElp4AdCC@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
 <87wmbtu4cz.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmbtu4cz.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_033049_790780_A566DFA7 
X-CRM114-Status: GOOD (  27.83  )
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

On Wed, Apr 09, 2025 at 10:27:24AM +0200, Thomas Gleixner wrote:
> On Tue, Apr 08 2025 at 12:50, Lorenzo Pieralisi wrote:
> > +/* Wait for completion of an IST change */
> > +static int gicv5_irs_ist_wait_for_idle(struct gicv5_irs_chip_data *irs_data)
> > +{
> > +	int ret;
> > +	u32 val;
> > +
> > +	ret = readl_relaxed_poll_timeout_atomic(
> > +			irs_data->irs_base + GICV5_IRS_IST_STATUSR, val,
> > +			FIELD_GET(GICV5_IRS_IST_STATUSR_IDLE, val), 1,
> > +			USEC_PER_SEC);
> > +
> > +	if (ret == -ETIMEDOUT)
> > +		pr_err_ratelimited("IST_STATUSR.IDLE timeout...\n");
> > +
> > +	return ret;
> 
> I'm sure I've seen that code before and without looking I'm sure the
> diff between the two functions is ~2 lines.

Yep, you have a point, will do my best to consolidate them.

> > +
> > +	mtree_lock(&lpi_mt);
> > +	ret = mas_empty_area(&mas, 0, num_lpis - 1, lpis);
> > +	if (ret) {
> > +		pr_err("Failed to perform a dynamic alloc in the LPI MT!\n");
> > +		return ret;
> > +	}
> > +
> > +	lpi_base = mas.index;
> > +
> > +	/*
> > +	 * We don't really care about the entry itself, only about
> > +	 * allocation of a maple tree ranges describing in use LPIs.
> > +	 * That's why, upon allocation, we try to merge slots adjacent
> > +	 * with the empty one we are allocating to minimize the number
> > +	 * of slots we take from maple tree nodes for nothing, all
> > +	 * we need to keep track of is in use ranges.
> > +	 */
> 
> I'm really not convinced that you need a maple tree and the code
> complexity for this. What's wrong with a simple bitmap other than that
> it might need 1MB memory?

Yes, I wrote it in the cover letter (again, easy to miss), I have
to admit I am not convinced either. We need 24 bits max, so a 2MB
chunk of memory worst case but other than that I can't really argue
to be honest.

I also thought about re-using the GICv3 ITS LPI allocator (which
does the same thing - agree, it is an on-purpose one, so maybe
it is better to reuse a core code construct).

Marc obviously has more background knowledge on this - I am
open to reworking this LPI allocator and remove the MT.

> > +static int gicv5_irq_lpi_domain_alloc(struct irq_domain *domain,
> > +				      unsigned int virq, unsigned int nr_irqs,
> > +				      void *arg)
> > +{
> > +	irq_hw_number_t hwirq;
> > +	struct irq_data *irqd;
> > +	u32 *base_lpi = arg;
> > +	int i, ret;
> > +
> > +	hwirq = *base_lpi;
> > +
> > +	for (i = 0; i < nr_irqs; i++) {
> > +		irqd = irq_desc_get_irq_data(irq_to_desc(virq + i));
> 
> irq_get_irq_data() and irq_domain_get_irq_data() exist for a reason.

Point taken.

> > +
> > +		irq_domain_set_info(domain, virq + i, hwirq + i,
> > +				    &gicv5_lpi_irq_chip, NULL,
> > +				    handle_fasteoi_irq, NULL, NULL);
> > +		irqd_set_single_target(irqd);
> > +static int gicv5_irq_ipi_domain_alloc(struct irq_domain *domain,
> > +				      unsigned int virq, unsigned int nr_irqs,
> > +				      void *arg)
> > +{
> > +	int ret, i;
> > +	u32 lpi;
> > +	struct irq_data *irqd = irq_desc_get_irq_data(irq_to_desc(virq));
> 
> Again. Zero reason to fiddle with irq_desc.

I will update it.

Thanks Thomas,
Lorenzo

