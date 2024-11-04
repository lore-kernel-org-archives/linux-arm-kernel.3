Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6730DD132CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 14:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqm2eUmpjGk/yKTlbBeYIAzibuRGzydeHrU/c1RILbA=; b=BEJkmkTnguv1ijrDdj9DzihVCO
	VQ6pc+UjC2yGsMWL8VTPb246TTPAj/DrFRlZYaHDYROK6gVXj1DIplTfJpK9nXqtfbjQl89v6XZaQ
	JdTwN0C03kfR+ZgeTBMzcj+nbt1jsfGG6KQwf2XiyRxJ54nwgDreDtYKjatJgFPXZ2JJJvoe7NPdE
	yycmJC3cqNiqQGDcsRGWmzso16cEHcIcrQfGdXwRFP1AM/gxqNyiV+oTqHartkRynRJGghK6YPPCC
	8I1jO4c4FZqtsrlL2SeawyJjWuO6tTEpuZ7IE0a9tawStfYp9MS25rTZ+jgvWUDIk4ENuzUUyNMoh
	m5O5SjCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7y8b-0000000E3lo-2QEu;
	Mon, 04 Nov 2024 14:33:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xaK-0000000DxeI-3lNC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:57:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 27E705C5602
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 Nov 2024 13:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD05C4AF10
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 Nov 2024 13:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730728654;
	bh=ATGMRNYib3E3d70xFtfquwImqeHY2Vx+HKA83DyFm/s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F2zA0jXuUfDUOSoYsl0ARLRTXEZB/7hm6NSR2dObeTVRBaBHzidrJVy4uvNWkJRn4
	 YKM6YGkPxB2gn1sCNyvA7EHur0/zAdou1eMEKZouXoCWbErOAmrCOwgrbwIOfxn3Hj
	 FN9N+Qbq7awFlpiD5qm7XKhuMhJ04BdVUXHoSY0ZyptJg3bDipih3e3Fq4gWMjoKBr
	 KCxmEF6X6uWBG/8+qDhOZAdP4q7IhuwvFemrd2T4m9r1ehuvqZrtOSTmNoPK0YTXNV
	 NQb34FStrNYg5cUo65v0nu0eDBWJoz1HZ8jq1bABMZY0DDL9Nne5marO9uFC3wtOWk
	 VbpSD4/HvNF1w==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb599aac99so35636371fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 05:57:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUt0LkOF4Cya3Mp5AzmFQCtCEGJR4ASUR0BajgJscI5Z/Vs6w/Ko238e+KUDOOeuQf1OadshmkCElxp3t/pfqRe@lists.infradead.org
X-Gm-Message-State: AOJu0YwGOEShTOuyDZHixZ+lZzCBT2cYhcS17Ta6hCz2uVKXl+ff2RoB
	uaXB41T+yNXVvcOTSeT9HOps130s+RIM76FOsku4RRNFAXefDUGwRWCkMyEGM25prC8+5lfw2ei
	NStzGEUmS3/hk3twMbffIeZzFE1U=
X-Google-Smtp-Source: AGHT+IGYiNOgDi5Le3J7P4DzKkREuD910/yQdlYsMmB6aCbgiaBYJiXQh7PKpRRmxOJ2QdTqpHKpGMi2KG1wHsQSe/0=
X-Received: by 2002:a2e:a904:0:b0:2fb:510c:7236 with SMTP id
 38308e7fff4ca-2fedb831551mr63647191fa.40.1730728652759; Mon, 04 Nov 2024
 05:57:32 -0800 (PST)
MIME-Version: 1.0
References: <20241101155800.3917462-2-ardb+git@google.com> <ZyjREXyABoQtkV8O@arm.com>
In-Reply-To: <ZyjREXyABoQtkV8O@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 4 Nov 2024 14:57:21 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFMBU1aPmL58NtyPu2kKpWurHBOYE4rmKvPwj0SA5Z+Dg@mail.gmail.com>
Message-ID: <CAMj1kXFMBU1aPmL58NtyPu2kKpWurHBOYE4rmKvPwj0SA5Z+Dg@mail.gmail.com>
Subject: Re: [PATCH] arm64/mm: Sanity check PTE address before runtime P4D/PUD folding
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_055737_046725_000A78B9 
X-CRM114-Status: GOOD (  22.40  )
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

On Mon, 4 Nov 2024 at 14:50, Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Fri, Nov 01, 2024 at 04:58:01PM +0100, Ard Biesheuvel wrote:
> > diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> > index dd5dcf7ae056..0d729adf894c 100644
> > --- a/arch/arm64/include/asm/pgtable.h
> > +++ b/arch/arm64/include/asm/pgtable.h
> > @@ -740,6 +740,11 @@ static inline bool pud_table(pud_t pud) { return true; }
> >                                PUD_TYPE_TABLE)
> >  #endif
> >
> > +static inline long sign_of(unsigned long addr)
> > +{
> > +     return (int)(addr >> 24) >> 31L; // bit 55 is the sign bit
> > +}
>
> That's a pretty generic name that trickles into the core code. It should
> be renamed to something that suggests arm64 addresses (and maybe some
> underscores to imply private).

Fair enough.

> Also, this assumes untagged addresses but
> I haven't checked whether that's the case for all call sites.
>

Isn't bit #55 always guaranteed to be the sign bit?

> >  extern pgd_t init_pg_dir[];
> >  extern pgd_t init_pg_end[];
> >  extern pgd_t swapper_pg_dir[];
> > @@ -932,6 +937,8 @@ static inline phys_addr_t p4d_page_paddr(p4d_t p4d)
> >
> >  static inline pud_t *p4d_to_folded_pud(p4d_t *p4dp, unsigned long addr)
> >  {
> > +     VM_BUG_ON(((u64)p4dp / sizeof(p4d_t) - sign_of(addr)) % PTRS_PER_P4D);
> > +
> >       return (pud_t *)PTR_ALIGN_DOWN(p4dp, PAGE_SIZE) + pud_index(addr);
> >  }
>
> I think I get it but please add a comment in the code, otherwise in a
> week time I'll wonder what this is.
>
> Even better if it could be written in a less cryptic way ;).
>

Yeah, I tried to keep it concise so the code for the VM_BUG_ON()
doesn't bloat the function.

