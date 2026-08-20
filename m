Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718F2C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 18:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5DSz7Dhgolc5+vGzvoxkdiS0aTJvyYw/OH/r7oaLxU=; b=xvLPkQNmqjttWG+BkZPPZ56gV9
	1kQZHI4PfAwWB1zmuo/J4L+wnPN7SxYDsd9m8apuXofi1Q5fxbUdecojidtWXcdtPGsfnVoIZyWr6
	QJPtfR+cAD50qGqOgtkn8GJxiJle7f+vw5pxH1VGsy0N8Qr/lzyt1VRagHY5+qXADb0FML1i/8bwu
	AWNPtR7wFwgG79uKMTskqyZIJjvXhyuuFmuHhHHYJD+zEY7k7ul3N6XKWRE2PEs37ds3zPhUcRDij
	vhoAFBYdcPAFK5THU+Lg6BhCqkRBD9F36Zcq+lEtDLUKnoZe/mGIs6wQiZnJEg+kV84EfZtJxrt6/
	pJ1EFiRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx7IK-0000000C21Z-0G5P;
	Thu, 20 Aug 2026 18:15:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx7ID-0000000C1zc-1DUF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 18:15:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6455202C;
	Thu, 20 Aug 2026 11:15:03 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A69CB3F85F;
	Thu, 20 Aug 2026 11:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787249707; bh=jU6zI6MIC9LRHB21fB6/8k5KXNhaDTI+dxJnt+Itj8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M6utw7K01T6RvxDb5Fxf+itP2QxURUCI9W6wXMyH5WbqbCTQ//OCF1LKW9rFjpwJM
	 TMnRTAOzs8YvET+6KIojUb/ASLBn8wD0MCE0Qg4p8ksWlxM2iMihkYnVI/tOa2QwQG
	 e0GYN8WTwdNakj5f96xV0tXH5k4IZ4RLjeaSglVQ=
Date: Thu, 20 Aug 2026 19:15:03 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Steven Price <steven.price@arm.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Marc Zyngier <maz@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	"T.J. Mercier" <tjmercier@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v2 1/4] irqchip/gic-v3-its: Zero shared pages after
 conversion
Message-ID: <aodEJ1bUDiHVGXBw@arm.com>
References: <20260820150034.88729-1-steven.price@arm.com>
 <20260820150034.88729-2-steven.price@arm.com>
 <aoc9CyxGPHPKFH1N@arm.com>
 <20260820174739.GA981928@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820174739.GA981928@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_111509_368466_64BFFCFE 
X-CRM114-Status: GOOD (  19.11  )
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

On Thu, Aug 20, 2026 at 02:47:39PM -0300, Jason Gunthorpe wrote:
> On Thu, Aug 20, 2026 at 06:44:43PM +0100, Catalin Marinas wrote:
> > On Thu, Aug 20, 2026 at 04:00:30PM +0100, Steven Price wrote:
> > > diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> > > index 6f5811aae59c..a055837832bc 100644
> > > --- a/drivers/irqchip/irq-gic-v3-its.c
> > > +++ b/drivers/irqchip/irq-gic-v3-its.c
> > > @@ -213,16 +213,18 @@ static gfp_t gfp_flags_quirk;
> > >  static struct page *its_alloc_pages_node(int node, gfp_t gfp,
> > >  					 unsigned int order)
> > >  {
> > > +	bool want_zero = gfp & __GFP_ZERO;
> > >  	struct page *page;
> > >  	int ret = 0;
> > >  
> > > -	page = alloc_pages_node(node, gfp | gfp_flags_quirk, order);
> > > +	page = alloc_pages_node(node, (gfp & ~__GFP_ZERO) | gfp_flags_quirk,
> > > +				order);
> > 
> > I don't think pKVM does any scrubbing on set_memory_decrypted(), so it
> > potentially exposes confidential guest data before it reaches
> > clear_pages() below.
> 
> IMHO that has got to be handled in the arch code implementing set
> memory decrypted.

I guess that's a better separation. It probably needs to clear the MTE
tags as well, it's not great to leak them (though not as bad as leaking
data).

OTOH, pKVM would no longer need the clear_pages() afterwards since
there's no encryption key changed. Not too bad, it's not a hot path.

> Further pointing that maybe we should have an alloc decrypted so we
> can at least try to minimize the number of times we write to this
> memory. :(

This would be better.

-- 
Catalin

