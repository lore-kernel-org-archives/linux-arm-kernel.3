Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A964C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8L3uGHgLcf/igUtWS55TK+4P/oGWvA3mv3iBU6z/Aw=; b=u4TdZGxD98QKfI6iC/2VF9SteZ
	1H9puTTMZ0bVkPvP6927D4ENpzDA+oZx/LnckJ8AL0vYN8dQqFXzY777G4887yHf9H8AEOFUCPnGM
	5KO+tas9vSVvRC8CTrg5zgSVey8LXkFNxi5wII12PbJ4b439QGPsfd6ktV9lSb4mf8xnVuG9hmwfV
	eQd4sJnGTlLDFILFUJG9Fpz8WzqfNtJdBT/IYK6Axd5rU2SRsevbJnJeAf1o4NTl0/j2ZM36T6Pqn
	i9KGn2JK1tyFycac2yDUqQ3DC2RAOklpHcj+EuWHbkIARFSyLmz4DNrLQ/fZbDSAfx734ILcrD+eO
	Q+hYumdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvsF-0000000EJfq-3Se8;
	Wed, 15 Jul 2026 09:25:51 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvsD-0000000EJf4-0icc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 09:25:50 +0000
X-Forwarded-Encrypted: i=1; AHgh+RqIjCzHABOjPM2ouePk1tGgQl96p9DFhmjHkvNQfJU2UQYrPMuUZri1C76b5SbE+Gr5VuvffzvMtAdbGNNokpQh@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784107545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D8L3uGHgLcf/igUtWS55TK+4P/oGWvA3mv3iBU6z/Aw=;
	b=gHJVcQLjSVyz3IgK18YHSUGjzdffeo0OX5OFdrefAx/KZFLpche3bzqkhUy/tkH9FxStRi
	3toBelyXbHZlJlcdX/wONyVrkNTJTjRjtARxsqEQMNxcn9wIKOnsMWHAdIu7ZyRhu0YP3C
	Q1YP7r0J4Y2d6HZk60d89DmrAsWTHfE=
X-Gm-Message-State: AOJu0YwH3+/+IQma1ezTo1mf1HvEuG+iDFzjsufY8ZP2KeIXo6w60Xxe
	/VxO3SwYhCxohKuEkvebjnb0pU2rRWymuTk0IQ/TTdgE+A+hy90wxcjhbQ92jCoFza2UkGLx3pl
	1nPv06g7/kJ/IEXUTGL/OvRA7xkKfmG7/KVHn1Y8j
X-Received: by 2002:a05:622a:1b1e:b0:51c:e80:9e88 with SMTP id
 d75a77b69052e-51d7bdcb646mr22804061cf.16.1784107508780; Wed, 15 Jul 2026
 02:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com>
 <20260706175415.2604046-4-vdonnefort@google.com> <CA+EHjTwMz+Ojq18Fq9USJqz_pZmemryNhy99Sw36sOejtpaf4w@mail.gmail.com>
 <aldLr8Q8ovbwJn65@google.com>
In-Reply-To: <aldLr8Q8ovbwJn65@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 15 Jul 2026 10:24:31 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyGvdtdRxg26vn=Q+WmvD_SbtGv8k16n4cmjj5F=iA16A@mail.gmail.com>
X-Gm-Features: AUfX_mzCdU7u3cBE7CE0uYYU76Eti9noWqGhANeOIbGRQdNqLbyidXbeHXiJ9DA
Message-ID: <CA+EHjTyGvdtdRxg26vn=Q+WmvD_SbtGv8k16n4cmjj5F=iA16A@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] KVM: arm64: Add __hyp_allocator_map for the pKVM hyp
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_022549_373818_FF8B6DE6 
X-CRM114-Status: GOOD (  23.28  )
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

On Wed, 15 Jul 2026 at 09:58, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> On Tue, Jul 14, 2026 at 06:53:55PM +0100, Fuad Tabba wrote:
> > On Mon, 6 Jul 2026 at 18:54, Vincent Donnefort <vdonnefort@google.com> wrote:
> > >
> > > In preparation for the pKVM heap allocator, introduce __hyp_allocator_map()
> > > to map a single physical page to a given virtual address in the hypervisor
> > > stage-1 page-table.
> > >
> > > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > >
> > > diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
> > > index 725bb0fb941d..98a7774b541c 100644
> > > --- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
> > > +++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
> > > @@ -32,5 +32,6 @@ int __pkvm_create_private_mapping(phys_addr_t phys, size_t size,
> > >  int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr);
> > >  int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr);
> > >  phys_addr_t __pkvm_private_range_pa(void *va);
> > > +int __hyp_allocator_map(void *va, phys_addr_t phys);
> > >
> > >  #endif /* __KVM_HYP_MM_H */
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
> > > index ec59da1322a7..c1c01f81ac5f 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/mm.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/mm.c
> > > @@ -160,6 +160,11 @@ void pkvm_remove_mappings(void *from, void *to)
> > >         hyp_spin_unlock(&pkvm_pgd_lock);
> > >  }
> > >
> > > +int __hyp_allocator_map(void *va, phys_addr_t phys)
> > > +{
> > > +       return __pkvm_create_mappings((unsigned long)va, PAGE_SIZE, phys, PAGE_HYP);
> > > +}
> > > +
> >
> > nit: __hyp_allocator_map() is named for its caller rather than what it does
> > (map a single hyp page). Its siblings here (pkvm_create_mappings,
> > pkvm_remove_mappings) are named for the operation. Consider a name like
> > pkvm_map_page() so it reads as a generic primitive.
>
> IIRC (it was a few years ago) this was a suggestion from Quentin who didn't want
> to expose too much of mm and suggested to make it clear that was a function
> private to the allocator.
>
> But looking at what we have now. perhaps
>
> int __pkvm_map_private_pages(phys_addr_t phys, void *addr, size_t size);
>
> And this could verify that addr is actually aprt of the private range
>
> WDYS?

I think this sounds better. That was a nit, so up to you.

Thanks,
/fuad

>
> >
> > That said, naming is hard:
> >
> > Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> >
> > Cheers,
> > /fuad
> >
> > >  int hyp_back_vmemmap(phys_addr_t back)
> > >  {
> > >         unsigned long i, start, size, end = 0;
> > > --
> > > 2.55.0.rc2.803.g1fd1e6609c-goog
> > >

