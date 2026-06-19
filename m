Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C54CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 10:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwdODZErkmq9zFiN5f+/KCnxhZZSgb/Gucmnhz4o3/8=; b=S42wmUVg5RYclTfmHivg09rlsr
	pmx8IWDPsxYzp2x37Cl3lczGbX1B7WbNMvxVB9OO79qvf9cUYzR8XKi6fAJsaoyKjmWO+bUCNTvKR
	UpBPHMIU9pGNU3cDeAcWalaYLWRrssjb1F8ow6klmgkutwK5xDDYyHwJ5UCYEIVWvworlO+7VSUTH
	xGDbbeTULDlcUrBRvJReaoW4zvfqvj9N1bfDZKFKoADCc5euFZSUOJOLozXgiZ2P4GX0voRW1JKQe
	bhe3BOiIbFg5lXCQGlfq8v/qByTQPdX0T/E0bU++i8D7LEHVy0sC6Mouha4SjfsfXx2qeqlTXA/XE
	+Z3ZM/og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWwC-00000002Jpa-2PcY;
	Fri, 19 Jun 2026 10:59:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWwB-00000002JpT-1CDm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 10:59:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FDE0601E1;
	Fri, 19 Jun 2026 10:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE321F000E9;
	Fri, 19 Jun 2026 10:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781866742;
	bh=vwdODZErkmq9zFiN5f+/KCnxhZZSgb/Gucmnhz4o3/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gsdvNACWZjgB+tnNLYPZOc5Vad1o0T/5N1Ua+tRAbo4pammFvs3vGp4FBb1q5HB+n
	 RirBUJ64NhS768KtBjmg0+LPWHzLEQJvsPf8+meziUJtOisjnktkkc8DUg7r6ajXHY
	 8KwU7V9FEp6vMTKUDfhRJnnYP+ik5QQ7uF3xHY51Cd+RlPQKPoK6BVwBL7QzxUoLWv
	 cY7AV/R5X0ERcW6+IFW57TDGW0owu0PxXARcSF4rJSwKp1fo6CHphFjRo4QETGpNed
	 qK09b5ncbrFw/GbAw/uerjxFThoZPz2rJald1hBy0GgTCwPUcga0F8ICXH+cZ7Xcxi
	 J1fsp/SzncFJQ==
Date: Fri, 19 Jun 2026 13:58:54 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Brendan Jackman <jackmanb@google.com>
Subject: Re: [RFC PATCH 4/6] arm64: mm: add helper to fill execmem with
 trapping instructions
Message-ID: <ajUg7gzX-F4Xg-5R@kernel.org>
References: <20260611130144.1385343-1-abarnas@google.com>
 <20260611130144.1385343-5-abarnas@google.com>
 <666a981f-44b6-4c19-a641-c1eff44fe54f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <666a981f-44b6-4c19-a641-c1eff44fe54f@arm.com>
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

On Fri, Jun 19, 2026 at 11:54:25AM +0100, Ryan Roberts wrote:
> On 11/06/2026 14:01, Adrian Barnaś wrote:
> > Implement the architecture-specific execmem_fill_trapping_insns() helper
> > to poison executable memory regions.
> > 
> > When CONFIG_ARCH_HAS_EXECMEM_ROX is enabled, the execmem subsystem
> > requires a way to fill unused or freed executable memory with
> > architecture-specific trapping instructions. This implementation fills
> > the specified region with AARCH64_BREAK_FAULT instructions and flushes
> > the icache to ensure the traps are immediately visible to execution.
> > 
> > Signed-off-by: Adrian Barnaś <abarnas@google.com>
> > ---
> >  arch/arm64/mm/init.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> > index c673a9a839dd..71aa745e0bef 100644
> > --- a/arch/arm64/mm/init.c
> > +++ b/arch/arm64/mm/init.c
> > @@ -408,6 +408,20 @@ void dump_mem_limit(void)
> >  }
> >  
> >  #ifdef CONFIG_EXECMEM
> > +
> > +#ifdef CONFIG_ARCH_HAS_EXECMEM_ROX
> > +void execmem_fill_trapping_insns(void *ptr, size_t size)
> > +{
> > +	int nr_inst = size / AARCH64_INSN_SIZE;
> 
> The x86 instruction is 1 byte, so it can exactly fill any provided buffer. For
> arm64, the instruction is 4 bytes so we can only exactly fill the buffer if it's
> size is 4 byte aligned.
> 
> I'm guessing that in practice, size will always be page aligned so we are good?

The size is always page aligned:

void *execmem_alloc(enum execmem_type type, size_t size)
{
	...

	size = PAGE_ALIGN(size);

-- 
Sincerely yours,
Mike.

