Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B532C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSjsOyZhkm+OarIp2DDhMFpCZd5ArExcqSVv0NgiTKM=; b=viZ4XcWeMNCM3Ba2bTXZaFH20W
	KAheUjpiwQyAkZfcCrrw+Fee29iu3BAkpXQ4YLdlgzERWoTd1OIFjCniu80OD6Ikl80w9kj8FrUKy
	Sw4glLO6b3UxlfILL3IaUIKFHKjqmvN2gRTF2perRNbtVQPOFAZZigmfocQgioJzTL3IWU4ynCnY4
	X7f/iqRpoGKWmRKnyV0pSQHQz2bePEuDbM/nsZ7MD5uAp1m0EuqrzAmiTutItJ+wmtoiKgGDxaEqv
	vA0DNd3BAG/y1upoCQ2EQndewphrkaAjsboYIpRRiaoGYolrYDHMmyGqg1nYax1V4bBHsfT8gbUG0
	7maCwpUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHDC-00000009VGB-2kDG;
	Mon, 13 Jul 2026 14:00:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHDB-00000009VDl-10CP
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 14:00:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FSjsOyZhkm+OarIp2DDhMFpCZd5ArExcqSVv0NgiTKM=; b=NhxbZ9XOs94PQZn/3n5GvlOh+x
	Z82AqwcLrJPl5WS2hsU0ufNqNNXheRaiDWXCkItN8RIYANp/ZSv3phwWo6B5q2fwCMMQLOphnsDIw
	bSRe1HeuZnC4Ppvz+YstHWXorV0LrSsdJIFmZwAYI2WRmv7wjc3sMiIkAA+xK3pHbySsjxxioUKjx
	zi+PbN4/NAwWuoaLfrgcSFZqzErLcdj0UUWiMc6chbE/Y0vhLkbg9F6TFydqyXcNb6J4uwGwf3oJA
	amhlYHe4B2JYVab0HyOBqP4gwKSpj3nSYQCpxc0s1zXwy5feSxfDYeXQYhLG37uU+vJQR/MQJxidD
	dipIC4cw==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjHD7-0000000BgFH-2KaK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 14:00:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-493c556ada3so102595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 07:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783951238; x=1784556038; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FSjsOyZhkm+OarIp2DDhMFpCZd5ArExcqSVv0NgiTKM=;
        b=IwzgeG+Oq9jf1VQPhjOPdo1ud+mwfYOeX7jm+tJAnKmXZNSMP6d4FsfeGGrc+wzTh9
         gAi3o5oEI25FM1BjB5B6klIO7XQLXr6vVULPkVYk30UY2POsyGL5/cMXi7yKln6gCkNe
         A1dXKpblM97jS1UKVY98BH0mow7vHJ8sRZUFUkqp50+p3cygTXhqt87pj+DXrKSy9Thp
         mQkaAwwt/91lCtjPF1KlzOQ52r4XA2hWFksA2P0nYAKeEhMERzZWKnCiOLFZOErp1bj0
         gW2lytkK6FRDPbn0H8cqCkMeTWk7PcRJTgStpK1bhNh4jOSQ/TjLALJ4WYQapOCyIAZ3
         tJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783951238; x=1784556038;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FSjsOyZhkm+OarIp2DDhMFpCZd5ArExcqSVv0NgiTKM=;
        b=XJ3OcV2Q45U04dHMuwRSyNatQVopGSpr5ZpcH7E4xuJdTyrarDd+UiR/eg5mR0VCnK
         qJBoNfzGgBgrWqVX16JJM4alMb9GD+LPrDEms5ANd6vDZNCrLkyZ+1H50sSRvQ443XhU
         l7cujbW+CbEKtPpK+UURglJs+LPjWsDXbx7CZloiFVIhQQcvfXqCCjFdHReZBCr538nn
         fsdz4h5kv1GQakMOuTCSdXthkdbzLbgYhvHxLc2axpVJwDCiXnWEdE7E+YkHADYa/nHo
         yU2xnO5z782yZJLHd7PC3O4ZgicTZpjXPvcyWlcWW5vOwlyUXEMFO2bJdqZ7nemvazfj
         uEYg==
X-Gm-Message-State: AOJu0YwdOxNoFNQ64TFReuN3MiLCi4gdRWILf30Ckk8PzqxVupRZIJC1
	ntemzOidzKuEx9+DdhmnS/yYexBGk7AvDKKrZvKbaBh5LtqaRcoPEJrQ3B9BedZjrUioikmC9g8
	LUrm0IA==
X-Gm-Gg: AfdE7ckOUuoyXXmmWOh1bEzAPNTKJo6LGWujRzmXUHY0Lj6c1S+o/QJnmxzTMnXBjvg
	slOjYU7GkFJqaK1Accy2jyaTeH3Np/vcfW6rA3xs6MwiabiBiWdH0S+7kluiTs+WT8kxt6J+gqS
	PMkxRE3/+As3ca1VWJX6G3TOM8i78k1zwL9Eo1WDABHiGn7WA+bHLAqmzMtYcvQKViPFZ7LpPHt
	KI2ZU0nVdJ8vj6MKX7els48Cd96mq/p+GumTiSegDOWWFLZxKUnfDVNqTt6ryI60VYTYLae+Nf4
	6Pot34AyOk++Zv3KWFxX0vlZ5NBZ7J4skHk+FLGQHrWg1IZy8dutuweOd9OZXt9YKeNKr/Tla4H
	+3TJU/OObNxoxq/RkCzih8saXjUi+N4Ele/innGnYSEwpjmheIQUVYtEM0WEbOXL6nllIckZdna
	Gog0beduuCnxABp2PlaypjGffAvUXFF1qGErasRmESEhE6iYXr
X-Received: by 2002:a05:600c:2942:b0:493:a96b:f9fe with SMTP id 5b1f17b1804b1-4945e4218c8mr367445e9.4.1783951237852;
        Mon, 13 Jul 2026 07:00:37 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2e0f165sm211046175e9.0.2026.07.13.07.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:00:36 -0700 (PDT)
Date: Mon, 13 Jul 2026 14:00:31 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	jgg@ziepe.ca, mark.rutland@arm.com, qperret@google.com,
	tabba@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 08/25] KVM: arm64: iommu: Shadow host stage-2 page
 table
Message-ID: <alTvf7iiOWn4PKE8@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-9-smostafa@google.com>
 <alTnAy7jvjUamwUA@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alTnAy7jvjUamwUA@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_150041_859372_0DD45BE0 
X-CRM114-Status: GOOD (  44.13  )
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

On Mon, Jul 13, 2026 at 02:24:19PM +0100, Vincent Donnefort wrote:
> On Fri, May 01, 2026 at 11:19:10AM +0000, Mostafa Saleh wrote:
> > Create a page-table for the IOMMU that shadows the host CPU stage-2
> > to establish DMA isolation.
> > 
> > An initial snapshot is created after the driver init, then
> > on every permission change a callback would be called for
> > the IOMMU driver to update the page table.
> > 

[...]

> > +	 */
> > +	if (pte && !kvm_pte_valid(pte))
> > +		return 0;
> > +
> > +	if (kvm_pte_valid(pte)) {
> > +		prot = pkvm_to_iommu_prot(kvm_pgtable_stage2_pte_prot(pte));
> > +		/* If the range is mapped in a single PTE, it must be the same type.*/
> > +		if (!addr_is_memory(start))
> > +			prot |= IOMMU_MMIO;
> > +
> > +		return kvm_iommu_ops->host_stage2_idmap(start, end, prot);
> 
> Do we really need to do that when is_memory()? 
> 
> fix_host_ownership_walker() by calling host_stage2_idmap_locked() and
> host_stage2_set_owner_locked() should already handle the memory region. That
> would also get rid of kvm_idmap_initialized.
> 
> So this one here could only take care of the MMIO?
> 
> Overall we would have a common point of synchro which is
> fix_host_ownership_walker() after which the host ownership is ready for both
> CPU stage-2 and the IOMMU?
> 

I am not sure I understand, this is another empty page table, so we
have to walk all of the host CPU stage-2 page table to shadow it in the
IOMMU. if you are refering to the case where it handle zero ptes for
memory, I can drop that but it will not change much in this logic.

> > +	}
> > +
> > +	/* In case of invalid PTE, we need to figure out which part of it is MMIO */

[...]

> >  #include <nvhe/mm.h>
> > @@ -481,6 +482,14 @@ static int check_range_allowed_memory(u64 start, u64 end)
> >  	return 0;
> >  }
> >  
> > +u64 find_mem_range_from(u64 start, bool *is_memory)
> > +{
> > +	struct kvm_mem_range r;
> > +
> > +	*is_memory = !!find_mem_range(start, &r);
> > +	return r.end;
> > +}
> > +
> >  static bool range_is_memory(u64 start, u64 end)
> >  {
> >  	struct kvm_mem_range r;
> > @@ -577,8 +586,34 @@ int host_stage2_idmap_locked(phys_addr_t addr, u64 size,
> >  
> >  static void __host_update_page_state(phys_addr_t addr, u64 size, enum pkvm_page_state state)
> 
> I would really split this. I know that this is convinient, but as the function
> says, it only update the page state so it shouldn't hide an update to the IOMMU.

I mention a couple of alternatives in the commit message, I tried to
implement it differently which was harder to reason about as the calls
was scattered everywhere and any small refactor will possibly break it.

Did you have a split in my mind? I open to rework it.

> 
> Beside, we have examples already in Android where we want to update the
> page-state but not the IOMMU, so it doesn't feel future-proof...
> 
> >  {
> > +	enum pkvm_page_state old = get_host_state(hyp_phys_to_page(addr));
> > +	enum kvm_pgtable_prot prot = 0;
> > +
> >  	for_each_hyp_page(page, addr, size)
> >  		set_host_state(page, state);
> > +
> > +	/*
> > +	 * Any transition to PKVM_NOPAGE, unmaps the page from the host
> > +	 * Any transition to PKVM_PAGE_SHARED_BORROWED, maps the page in the host
> > +	 * Any transition to PKVM_PAGE_SHARED_OWNED is ignored as page is already mapped.
> > +	 * Transitions to PKVM_PAGE_OWNED from anything but PKVM_NOPAGE are ignored.
> > +	 * Transitions to PKVM_PAGE_OWNED from PKVM_NOPAGE will map the page.
> > +	 */
> > +	if ((state == PKVM_PAGE_SHARED_OWNED) ||
> > +		((state == PKVM_PAGE_OWNED) && (old != PKVM_NOPAGE)))
> > +		return;
> > +
> > +	if ((state == PKVM_PAGE_SHARED_BORROWED) ||
> > +		(state == PKVM_PAGE_OWNED))
> > +		prot = PKVM_HOST_MEM_PROT;
> 
> ... and that would avoid that sort of things here. The caller decides if the IOMMU
> is updated or not.

Typically, the IOMMU is updated if the CPU is.

> 
> And as the patch says, we "shadow" the host stage2. So probably modifying
> host_stage2_idmap and host_stage2_set_owner_metdata() sounds really a better
> approach.

Initially, before the pKVM merge upstream I was doing something similar
as that only required one hook [1]. However, after rebasing I found that
would be too complicated and I have to add many more (as mentioned in
the commit message). But I can re-visit this approach in v7.

[1] https://lore.kernel.org/all/20250819215156.2494305-11-smostafa@google.com/

Thanks,
Mostafa


