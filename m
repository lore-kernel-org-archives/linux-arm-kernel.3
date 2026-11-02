Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98327606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ieL5BPNA;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gu7I7OIQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=c9786btBzdrmTnErj/Du/8VE2oO+29Q2S5v+Vg3Lpl0=; b=ieL5BPNAZ4wHqwpF7hiq+rbyHs
	Eb9tGhSUF5hbg2HC14k9y+XaYPFrH9mDZLlB3TaZVJrYmoDZ/5qID+Fr/53fYqQwFs9VdGOzk4JXA
	02iMySbkae0Oc46HSbKjJElSIHgteJYasqVHbuDLxOI+NdyQs5E44E4whkGl5BnLytJ8TMyOa4Ee+
	cfYtee53kO7g8sAoTGPpF5DcxX8ern9yUDBQDox07qKf/D8ruu5u9rQFNLKJqzW2r6ho2XmkNJlkj
	UOVUaG0+04SY0oncYTHmBvNf7cVqpLTnaIFIIvsoPuoTDd37c1/rtjCJ8uhRbEyVYf3LpefahNOGi
	IM51j1cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsQn-0000000Gg2a-1XJ3;
	Mon, 02 Nov 2026 13:50:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsQl-0000000Gg2G-4Ab4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 13:50:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 61928401A0;
	Mon,  2 Nov 2026 13:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B788C1F00A1B;
	Mon,  2 Nov 2026 13:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627435;
	bh=c9786btBzdrmTnErj/Du/8VE2oO+29Q2S5v+Vg3Lpl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gu7I7OIQLpg+cGvYJ+iHVS+rww5vJ8IJQ8JQZO8qPzloEfBBQSQpo8DQxihBJBVUX
	 NgF5F0RQ/frHgEgJISTniw0MrWcjz7jemL09rQgFsb2lcPyJ5wt3AJKffI5c52AHbp
	 wuslNCSk2AKkcENbYf4/i4g4AIx0O2H3K52EVWidOvbh4oOCafTwX8MAwjnkd50/6b
	 hWnv/VQAPGjv0wzDQdFCF/i6eM/tlyhMw1IKYWLUPW+HdzZtbTfqpxyFGst4wT3AbG
	 LoUNCryUVX+xhNaR+xmKHtdnwMBBuE8bdzIMN5ObtrMoGan08KmblZaFXLRTwzGweu
	 SGujMGEA8T5rA==
Date: Mon, 2 Nov 2026 14:50:30 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] irqchip/gic-v5: Reject SPIs not backed by an IRS
Message-ID: <auiVJuDPZr-ietKa@red-moon>
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
 <20261102-host_gicv5_fixes-v1-1-743b61626fc5@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-host_gicv5_fixes-v1-1-743b61626fc5@arm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 01:32:54PM +0000, Sascha Bischoff wrote:
> It is possible to build a multi-IRS GICv5 system where there are gaps
> in the global SPI range that are not backed by any IRS. In the current
> incarnation, this results in dereferencing a null pointer.
> 
> Reject cases where the firmware attempts to use those SPIs during IRQ
> allocation by catching the case where there is no chip_data associated
> with the irq (meaning that there is no IRS to back it). Spit out a
> warning about broken firmware when this is encountered as it shouldn't
> be using non-existent SPIs in the first place.
> 
> Fixes: 5cb1b6dab2def ("irqchip/gic-v5: Add GICv5 IRS/SPI support")
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
> index 8c0303af71e7d..f3cce2bd28cc3 100644
> --- a/drivers/irqchip/irq-gic-v5.c
> +++ b/drivers/irqchip/irq-gic-v5.c
> @@ -727,6 +727,15 @@ static int gicv5_irq_spi_domain_alloc(struct irq_domain *domain, unsigned int vi
>  
>  	irqd = irq_desc_get_irq_data(irq_to_desc(virq));
>  	chip_data = gicv5_irs_lookup_by_spi_id(hwirq);
> +	/*
> +	 * The global SPI range may contain IDs not covered by any IRS, i.e., it
> +	 * may have gaps, in which case there is no IRS to back the SPI. Catch
> +	 * broken firmware trying to use any of those SPIs.
> +	 */
> +	if (!chip_data) {
> +		pr_warn("Firmware bug! Unimplemented SPI (0x%lx)!\n", hwirq);
> +		return -EINVAL;
> +	}
>  
>  	irq_domain_set_info(domain, virq, hwirq, &gicv5_spi_irq_chip, chip_data,
>  			    handle_fasteoi_irq, NULL, NULL);
> 
> -- 
> 2.34.1
> 

