Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DB6FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 20:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqk5KRpr2QM7zZel/mc+QHCJaqF1SuWyHsWctnUBoxM=; b=U9SbF1Vzy8npurHA6mxz4LVbsL
	qspMHw6fVwaxSHTCNDULr9eXqcx6JRRC8QTiVUKyNWlZKshmcAmizd6et/fWH0fn+1PmwWgTUsmNt
	RovtIIL4h7P3k35O4+UZO57Dj4CuUTjxRbfYzr/yOcbJOHX1f2NKwbxlDsc4Rvzm/BvYlJzKrCFQk
	owaXj9V74EXDVu4VTNASfbyX1DFDW7o9FqZO6rkwdeUKb1lDiFyxDWWeGeqPID/awrD4T0qgJP0IC
	Fj18boT474jsesRwhxUiO30fU/7KrBW735OdZV5Da2hUhrxXV1kmUnn5GUeqC5FNWCaZtl1LZMLWm
	u4s43G7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLyj-0000000HNAL-0aMG;
	Tue, 05 May 2026 20:02:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLyh-0000000HNA5-3f7w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 20:02:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DFEA60181;
	Tue,  5 May 2026 20:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D40DEC2BCB4;
	Tue,  5 May 2026 20:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778011366;
	bh=S4mPz1gHjU8JPLMFTOh6+Yltl18mwFwYQmcVdfoQwYE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hKf4MOXtyo3lBpMYJ6Kt9fwcEE6MvbIRoZTODnNG4oG3FchXQVHyHvCt6mUU6hWEm
	 2KL8rM6TvPuav81DG/3vMEpUqZi6Vb1t4u/opmYKBLoNDP3pH+zKIFORb0xxFtO6QT
	 JqqUvGlRVkHGHVQxpe2RbLoQOsUSsa7kR5nRq18CDYwo5SPupLvptoyyPKXhcupBSE
	 /2qyNYCqoRmmZT0Xf/EssG8TMCDPFtNBq+j7faJvGfBIZpKkbMumkJKnuq8APsu8T3
	 3X2BKPwu3Jv9H7PqTJoUa0+EQp52ihbup4AU4yVBiHsTgcLAFDC0Gyxk5ssz9elJPu
	 QpPt1DchVlb/Q==
From: Thomas Gleixner <tglx@kernel.org>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Cc: nd <nd@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
 <maz@kernel.org>
Subject: Re: [PATCH 1/3] irqchip/gic-v5: Move LPI alloc/free into LPI domain
In-Reply-To: <20260430153352.3654325-2-sascha.bischoff@arm.com>
References: <20260430153352.3654325-1-sascha.bischoff@arm.com>
 <20260430153352.3654325-2-sascha.bischoff@arm.com>
Date: Tue, 05 May 2026 22:02:43 +0200
Message-ID: <873405y68s.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, Apr 30 2026 at 15:34, Sascha Bischoff wrote:

> Rather than relying on the domains built on top of GICv5's LPI domain
> to manage LPI allocations and frees, move that into the LPI domain
> itself. This, rightly, ensures that domains other than the LPI itself
> have no knowledge of LPI allocations themselves. This not only cleans
> up the LPI domain itself, but also the IPI and ITS MSI domains which
> build upon it.
>
> While we're at it, drop the helpers wrapping the helpers -
> gicv5_alloc_lpi() and gicv5_free_lpi() - and directly use alloc_lpi()
> and release_lpi() instead.

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#changelog

>  
> +static void gicv5_irq_lpi_domain_free(struct irq_domain *domain, unsigned int virq,
> +				      unsigned int nr_irqs)
> +{
> +	struct irq_data *d;
> +
> +	if (WARN_ON_ONCE(nr_irqs != 1))
> +		return;
> +
> +	d = irq_domain_get_irq_data(domain, virq);
> +
> +

Stray extra newline.

> +	release_lpi(d->hwirq);
> +
> +	irq_set_handler(virq, NULL);
> +	irq_domain_reset_irq_data(d);
> +}

Otherwise this looks good.

