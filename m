Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A553C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 12:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WkMzrjoUx6ZJyd3KWX/rbJeUctcg1WNARwpXb82Kers=; b=FkBdethxCp9zAxvlwgOu8Cz21R
	tRACq9HnxsJyxp/XzHtUqoLf8UoB60+7sHSBWPNV2Tmn51JmWuYKfdyGfA8IX9c/dOxSD4iKrZoKh
	3ga1zFxFJbksNYwMDttW6jLRMXhvepyMI78xN5THNGh5LhnFw+SSqOWyiAtjIWhOux7RF+mI3Tb5D
	xDpFKUwvJjG5mbIntm+PXuiM9/Q0dggPrsTHkvvmTqH7unL3DD9wX+Tu3N1th+RpIQx+7Ia6vxL6S
	DtdO9fvv4UoecHqQvq3nvstgF3oxyzjXKGBX8P4ATgkKHNbE+5u7HL1gGBu7p6zL/Wfc3mrmqlmrX
	VBvzQI2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wln90-00000006hQn-3ggj;
	Mon, 20 Jul 2026 12:30:50 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wln8y-00000006hOd-2m8n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 12:30:49 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-476a130c138so6553912f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 05:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784550646; x=1785155446; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WkMzrjoUx6ZJyd3KWX/rbJeUctcg1WNARwpXb82Kers=;
        b=pKFtsK46s2yM99MEumOkFDZ3QT4mlcpJC6m7efuFmJr3PJlifDPDqK1OCW55ib/P7H
         EjWU4MR4pyf1tkeYQrNu+bNZJ0z99fNWB9mOnPUrSo+QfkoIjOAVZ1miiZEQpeJqoj6i
         /uT/9EnO0/eNY3hqwcRGgA35w5KZxLYOuqDLgY3LjNZTRU/lvPGcyEtww7QQOtQMnHbX
         gK49GKNyfqJH4GCg54cD0eUmiYB6q7CNO5haLY5Cwy4YoXWckNpM8wnwRtUuYHuuJpgV
         iUDK3EJqHTn9M9VTWM1NOLcddrvy88omMn+sZJyEP4sLInUnEKRu4nFE8L49xnIAAst6
         MdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784550646; x=1785155446;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WkMzrjoUx6ZJyd3KWX/rbJeUctcg1WNARwpXb82Kers=;
        b=PRpIULd/+2kt2Xy6oF9jQmjKVtQnc9GUjz8Z8M6JsnAP9BHUKpRjgbYrJyEgyTbJgf
         dhUE2I5ZSW1osFmzBd+0quvcfOUguYEBr2NuCdfQqqAIN9MQ1rT50vojclnnK44WYb6x
         b393MNN4915xBjtxVl2wtVWVjtLmjwKt6i/hKnIZ8iPiiQrfjW5UPHNFXe6Ucpg7AnDM
         PD6Ta6Q7lKLvay228xAXiZ17A40WhL7xNRwnRdx+97+S3enF60LONArfU1J0aoQaH/1n
         3s6ETVHgjcuTFauabkY0G23liOOuTpSW1zpuhUliKeSAIdbjH0BovxUcvsc/8oNQKlpZ
         l1Sw==
X-Forwarded-Encrypted: i=1; AHgh+RrR8z+l2H8TYZ9phXK84I+i7adehp6MyqW3uC7Vpek5+mKdZKnUqcgAyGDrQn9GGVDJYWhiytU6+9+bYDqD6UyQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5VDgz5np59nGEbJhJ54ciJI+LXzvY8xADn2VPO5bu7K6EXNaA
	WcJ91PqzxtuPEMMY/QYiWCr1XjnkEe7/1nulbKCFl5ehB8FEmFHIAq6tPo/S4oVflQ==
X-Gm-Gg: AR+sD10uaGLvsDoykBdKDbVXd808sa5AxZJ2ilCyawxdnNgXlh2XTV6QS0JCpVKL03w
	IzhZm91RbGrXUJ6HhLCQljEcyR78DMrNHsnlPtgS2uCoMNTOWIGy9XEacY/KGfTpK5BI3+yyls1
	3hvIyTzFxHsSiz2YwtilHHoF0eL8la5GllvY7r9LtE50l2U1vTDqW8lVZ8vgNzh1zg6dpcSjTuf
	mwvjUQI79FRxJnJo4IftMtrk1Se7Je0xNxq8a2rQ+bck+5NP7HD1Ii2ZpFqZXF/fIJAi4WOqxqm
	tfazat8SXObYct16p6Qija5eNjRXCHA8GUmHHsbBlAwqLuENjfTPv1RT9EbfU68/926aIENt6bD
	SbHvTbpVVkJfn36gV0mQpLorkLmFNGLHfFqesBhEi1Ru7fc8bODiyjafRcNTAw3OQWvi4J4AF8S
	BsYLdirDSHwAWdKjicNV/BlsNzxB7sMNEQj2G/qxvM3npzun0lgCQ=
X-Received: by 2002:a05:6000:228a:b0:46f:f12b:e45a with SMTP id ffacd0b85a97d-47f622fe81bmr16676873f8f.23.1784550644845;
        Mon, 20 Jul 2026 05:30:44 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7c69sm31567542f8f.17.2026.07.20.05.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 05:30:43 -0700 (PDT)
Date: Mon, 20 Jul 2026 13:30:39 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kernel-team@android.com, qperret@google.com
Subject: Re: [PATCH v2 04/18] KVM: arm64: Add a heap allocator for the pKVM
 hyp
Message-ID: <al4U7xB4ySWVAQT_@google.com>
References: <20260706175415.2604046-1-vdonnefort@google.com>
 <20260706175415.2604046-5-vdonnefort@google.com>
 <CA+EHjTzbQukkKpNfdTHKS5aAPCn4hnCxu+EHnm6OWpW=mTS+Gw@mail.gmail.com>
 <CA+EHjTwSupmgbjbeUap4EEwy8DP7y8euZRHd2tXc=FSDGzrghA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTwSupmgbjbeUap4EEwy8DP7y8euZRHd2tXc=FSDGzrghA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_053048_715907_BB168862 
X-CRM114-Status: GOOD (  29.68  )
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

On Wed, Jul 15, 2026 at 11:59:26AM +0100, Fuad Tabba wrote:
> On Tue, 14 Jul 2026 at 19:35, Fuad Tabba <fuad.tabba@linux.dev> wrote:
> >
> > On Mon, 6 Jul 2026 at 18:54, Vincent Donnefort <vdonnefort@google.com> wrote:
> >
> > ...
> >
> > > +static u32 chunk_hash_compute(const struct chunk_hdr *chunk)
> > > +{
> > > +       u32 hash = 0;
> > > +
> > > +       BUILD_BUG_ON(sizeof(*chunk) != 16);
> > > +
> > > +       hash ^= hash_64(*(const u64 *)chunk, 32);
> > > +       hash ^= hash_32(chunk->__unmapped, 32);
> >
> > Could you state the threat model in the commit msg? The VA range is
> > hyp-private and the hash is unkeyed (anything that can write EL2
> > memory recomputes it), so this only catches _accidental_ corruption,
> > i.e. a debug aid.
> >
> > Since that's the goal, should it be gated on CONFIG_NVHE_EL2_DEBUG
> > like the other checks here? As written it's O(n) hashing per
> > hyp_alloc(), in production, for a check that only fires on a hyp bug.
> > And a plain XOR/additive checksum would be cheaper and just as good
> > for accidental corruption.
> 
> Thinking about it, I was wrong to say that it would be just as good,
> slightly cheaper, but it would detect things like swaps.
> 
> Still, I think this should be gated.

After a longer offline discussion, we concluded this doesn't cost anything while
the weak protection can still be effective against attackers who may not always
control the entire bit-width.

I'll add some details in the commit message.

> 
> Cheers,
> /fuad
> 
> >
> > > +       return hash;
> > > +}
> > > +
> >
> > ...
> >
> >
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
> > > index 75b00c323310..1c10cf78c869 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/setup.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/setup.c
> > > @@ -10,6 +10,7 @@
> > >  #include <asm/kvm_pgtable.h>
> > >  #include <asm/kvm_pkvm.h>
> > >
> > > +#include <nvhe/alloc.h>
> > >  #include <nvhe/early_alloc.h>
> > >  #include <nvhe/ffa.h>
> > >  #include <nvhe/gfp.h>
> > > @@ -363,6 +364,10 @@ int __pkvm_init(phys_addr_t phys, unsigned long size, unsigned long *per_cpu_bas
> > >         if (ret)
> > >                 return ret;
> > >
> > > +       ret = hyp_alloc_init(SZ_128M);
> >
> > Where does 128M come from? A comment would help.

This is arbitrary, big enough to allow us to allocate plenty of VMs with tracing
enable. But I will add something.

> >
> > Cheers,
> > /fuad
> >
> >
> >
> > > +       if (ret)
> > > +               return ret;
> > > +
> > >         update_nvhe_init_params();
> > >
> > >         /* Jump in the idmap page to switch to the new page-tables */
> > > --
> > > 2.55.0.rc2.803.g1fd1e6609c-goog
> > >

