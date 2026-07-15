Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABC2C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 11:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wutSnxvNy6igvRaEMd3gbXrLUSUMVfUeeNmLPMM/BOY=; b=aeQATV+vAGc9EBdnT1gQDilBiv
	MYfJ2Sd7fzfDmGqLDHI2HouQT6RlMY5DTypCpB3v589e4ydwFnJkKpXDDAMnBWCluSMZtA1compBc
	SHdwsTbJINvby5Up+XaKLNjMp5cUYQ4yW9dxzuewlhhmpx+RuKeFUmm82VqYeA3OWKNAGMC4/n1Sn
	cG56PRAuoZfhfuidrTRTM9QrMDTSJGH2qfdSS4JDdKG0N09cG8v74wUKNbSGaWIV4I8ci8N2sYa/S
	3XfB/GokmbqXB9a+nOkfdOc3HJOGNTCdVhQOKBeR0BX+pgBSOeTMej6uKSAepJW0W/pGfi0vmeweX
	kcgXwOWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxLm-0000000EW9V-3Q93;
	Wed, 15 Jul 2026 11:00:26 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxLj-0000000EW8P-2Irs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:00:24 +0000
X-Forwarded-Encrypted: i=1; AHgh+RoO068I169FcUZIwv0H1gyZzJeOIzeo//usNzzNYxq5RMnbltNgQCg/f7yZ9ZiUiS/ZsGCwmNzCh8UIiaSoVbyU@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784113219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wutSnxvNy6igvRaEMd3gbXrLUSUMVfUeeNmLPMM/BOY=;
	b=FJ69lpDf1y7vx+cXX5auYo9etM9nhmMc2uJcEMCqPSUJFBmdATV1e0QwGxsd5Uu+FQ4gVe
	ycWISX2dfwXB0blmGcfkgp5s6CMTXJZrjG4K6hMLLu+hFgrgmFdCJ7cwBIY3rP0rEn7RDh
	tbSIx7zWgf68f6fSB6DOYUeAB4iUmq4=
X-Gm-Message-State: AOJu0Yx3+bK+omziN+BrjkgL9RRNSuc3T1z0VEQhw37VVarSuocA1Lut
	CZU/feJeWowMbkRozRXgQPcUlklWtSMdUFlY++VIW7J3i+5sm9VkOkjBjFGMHu3J2EN8uR9VZfo
	OJWnKCzzyOnkUtIc5Fy3RKqUccUU44poEiiLIxssE
X-Received: by 2002:a05:622a:448:b0:51c:ca9:3d17 with SMTP id
 d75a77b69052e-51d7bdcb639mr25256371cf.12.1784113203159; Wed, 15 Jul 2026
 04:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com>
 <20260706175415.2604046-5-vdonnefort@google.com> <CA+EHjTzbQukkKpNfdTHKS5aAPCn4hnCxu+EHnm6OWpW=mTS+Gw@mail.gmail.com>
In-Reply-To: <CA+EHjTzbQukkKpNfdTHKS5aAPCn4hnCxu+EHnm6OWpW=mTS+Gw@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 15 Jul 2026 11:59:26 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwSupmgbjbeUap4EEwy8DP7y8euZRHd2tXc=FSDGzrghA@mail.gmail.com>
X-Gm-Features: AUfX_mxVJTjJv08F71yWXWNugINBRmANHQetyviK4RJokRf0LnDH0xcjy4A1SwY
Message-ID: <CA+EHjTwSupmgbjbeUap4EEwy8DP7y8euZRHd2tXc=FSDGzrghA@mail.gmail.com>
Subject: Re: [PATCH v2 04/18] KVM: arm64: Add a heap allocator for the pKVM hyp
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_040023_736515_5A3A27AE 
X-CRM114-Status: GOOD (  22.00  )
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

On Tue, 14 Jul 2026 at 19:35, Fuad Tabba <fuad.tabba@linux.dev> wrote:
>
> On Mon, 6 Jul 2026 at 18:54, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> ...
>
> > +static u32 chunk_hash_compute(const struct chunk_hdr *chunk)
> > +{
> > +       u32 hash = 0;
> > +
> > +       BUILD_BUG_ON(sizeof(*chunk) != 16);
> > +
> > +       hash ^= hash_64(*(const u64 *)chunk, 32);
> > +       hash ^= hash_32(chunk->__unmapped, 32);
>
> Could you state the threat model in the commit msg? The VA range is
> hyp-private and the hash is unkeyed (anything that can write EL2
> memory recomputes it), so this only catches _accidental_ corruption,
> i.e. a debug aid.
>
> Since that's the goal, should it be gated on CONFIG_NVHE_EL2_DEBUG
> like the other checks here? As written it's O(n) hashing per
> hyp_alloc(), in production, for a check that only fires on a hyp bug.
> And a plain XOR/additive checksum would be cheaper and just as good
> for accidental corruption.

Thinking about it, I was wrong to say that it would be just as good,
slightly cheaper, but it would detect things like swaps.

Still, I think this should be gated.

Cheers,
/fuad

>
> > +       return hash;
> > +}
> > +
>
> ...
>
>
> > diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
> > index 75b00c323310..1c10cf78c869 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/setup.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/setup.c
> > @@ -10,6 +10,7 @@
> >  #include <asm/kvm_pgtable.h>
> >  #include <asm/kvm_pkvm.h>
> >
> > +#include <nvhe/alloc.h>
> >  #include <nvhe/early_alloc.h>
> >  #include <nvhe/ffa.h>
> >  #include <nvhe/gfp.h>
> > @@ -363,6 +364,10 @@ int __pkvm_init(phys_addr_t phys, unsigned long size, unsigned long *per_cpu_bas
> >         if (ret)
> >                 return ret;
> >
> > +       ret = hyp_alloc_init(SZ_128M);
>
> Where does 128M come from? A comment would help.
>
> Cheers,
> /fuad
>
>
>
> > +       if (ret)
> > +               return ret;
> > +
> >         update_nvhe_init_params();
> >
> >         /* Jump in the idmap page to switch to the new page-tables */
> > --
> > 2.55.0.rc2.803.g1fd1e6609c-goog
> >

