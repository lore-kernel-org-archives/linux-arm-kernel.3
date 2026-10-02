Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B695CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 01:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kzLbFV0dwlxOBcT/RyJ42nswcrqycHxeUvPWMKQHOM=; b=jEKpVyMuTZG7uLy/micLxXYYSc
	3e3wDEb/33Nvi60dZnqPUChIl+qkgrVH+MbLLAy16THXH34NnKXodNUiiCtqW3s3aHJdWFh2H8dCH
	XAt8/H2KqMuJq/raaVUemzJoliAz9CdmGcIDrdtSb/5W35e+X4wZShKBJW4RACuPyhJGDsFINfo+K
	4T5oyKoPEX/NKy5Wx3663VK0Vq7m3592RShI/1+HcUUm7uwUxdOTkgpPbjQYFeqwzStHhAjHwAfaT
	khPfeckXPczsgZVM4icY1KB/e5uqrDQUL3sn0Pj6PRTD6EElUcYZL17xdmpVlCmrgPOpyFTvF0wtZ
	ZnD2XaHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCSAV-0000000ATez-0MBr;
	Fri, 02 Oct 2026 01:34:35 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCSAS-0000000ATeV-2UFb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 01:34:33 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48affce98dcso316341f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 18:34:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790904870; cv=none;
        d=google.com; s=arc-20260327;
        b=e12+TtFw07xTOesJNwx5HcWheqSUaTXTjAgRMtU0junAVKlSipo40itrs/xifCrNMZ
         /0hryR+Iiooy0MWE6K+i4oHGBFLOqG4kKcBIUgh14fSzhhSksjQQ6GdtlDMoyQXk1Nyq
         MW2HgLGu19stkhrvklGBpj4Rx/Vf8Sr1Ufbx+Cyg2XgmHVMDzTaoUxYTGpUsLH2BM51w
         CoX19MqNghdEgVHV8mwYeJEuUn0vRrN1ZseYtW/u7pKHZ53mtumeOyfHWpseKLcmXQQE
         vaRMO1oqDYVOYZYRh/SpDNnuXdQpF+Y2L9mjPRM79WhlJdVkJc1MK4mFXK1vOSdZ0btP
         rpGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7kzLbFV0dwlxOBcT/RyJ42nswcrqycHxeUvPWMKQHOM=;
        fh=x6BANayjJ3Ow2n1XIN39uGPeBpvtC5ymmQQWojTXpsc=;
        b=EpHuj4/Z6ADGAKs3sdE5rh97Hm0Pq9utQNti/5zSqhRE0H1fxvRoGN1xp9OcyBF51h
         Y1q4AR/r+uirI5zEW7OY63djDlzoBud2r2iEhY2EveQvFkrgfC84NCgU/Xmu1Q6fC+ZW
         QpN6ufPKl4Jbrw/X48ikzYNpTXGloyUm8fka3NsePpHERqCqt724Qxvk8ecah7nTK0XC
         EHwT3tsC6+JO/PWnM/MeGIFMKKvl0+3mXoiyP+hWKNjqZpCYTlMR/TgW0WUUsE0Mpwqs
         ACkzLesMT76XcaEJIgoVMHXPJ78ZG0An99/t9//Eo/2lcYDyz3KOdJOjiIM2h9t/noWT
         8dnA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790904870; x=1791509670; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7kzLbFV0dwlxOBcT/RyJ42nswcrqycHxeUvPWMKQHOM=;
        b=b7QzQO2kR9aCyoxKW2v8FFGHwb1aWsqNnTvwAlmLI0hzNRRJAZV7QQDDiV4MVckm2e
         6B+4T3pKEPJkeAZB/WG3+LBERFqGe0KLGpTO771+lC0Sy2R0t9pzSc42F1B79au/7wJA
         v/9lzQ5myKBYRWYhbyj4H3aOQyq7VduF5mBgruefuQHQEyR2DySf1lpaqevkChC3r4NT
         5hlmCGWicg/ld+E+Yrk3HMeSa0ZHddU76tj/ITJY0vq/L90lqLOQ6NoC4ynhbi8wKHJH
         867DsBauI68jlvrBmyaFrN/sWE21CNs76X7ZWAF2ATPHQ78mHFbc82dSqQHg60MNWw2O
         KsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790904870; x=1791509670;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7kzLbFV0dwlxOBcT/RyJ42nswcrqycHxeUvPWMKQHOM=;
        b=r4lkPmn64tV5+Su62EWJ9tgqFaIr6v0qRTXeuFEJjpVk6XzetTuTg2r93HC1oSHieM
         op2dejTf7+XFyyQNpBiCgJmVj64V9nZwmF12vd39zvg/znwZn9QW/nkrZLoBn2oxMWIE
         U2Na0PcjV+gb7MoeVNDS0x6H2RlrPYB792nQRxyTL3O1zguC2AN62apSnV4IZHq8gUNF
         U3TaWnl4N5DfAhKxxBj8FA8Dpt+71vkvRmUgg5ZPik15biH8S+VaJ8M3s1ZA2hUg6KBt
         kzgT8ofR96uFywm5x8onuxiw4KBS4+dSaQDvhLyc/7P29IIwhT7YeVnwgUAvBoX/kQPo
         MzzA==
X-Forwarded-Encrypted: i=1; AKwUvBxFsTr6HlUPUSvQFbYNVROrDpU7AcKBJ8JZ92/5rtMFs/FalfClInIs40C5eo9E3PvpIQOL7FzOEFLes9UTAOjp@lists.infradead.org
X-Gm-Message-State: AFq9FYL0B3Q+Mw73zaFWYNJh4k6SalGP4DVWSDEohXV3qVTFkMYyXvGF
	8J1O78KSobXjdjm0uIe9Qq84Qn2FCf4veXXeW/QJD86wg8g5N+54yAedpOi9WDNUFglhaO9cq45
	6Cs1zh/BGBNGkF6W4hwJ9+AqIlFl7NUQ=
X-Gm-Gg: AYBFou2Bm9TveR0EXHErKHxjIksj9/mq9lFp0i8t3rHDFmvJfIsvecmzUcccgNxma80
	GHfUVRfUJvQ59za/tUVSwed/EfWdUkd43JgSXeiRmtegU5AX8T04MMAs6B4f4fMJBQplsZcK7i1
	xPERjOLp10DIHFyG8npdkXL6Hrvww2iJTSYnd0dA4JM9Pn3SBmb5Ze3GLiqfJHOv+2WRGzL0ZZc
	ry3jXskJozp/kIOLG/f2KA62B35T2i+1NBvcier/zqnZHXn1BvnCbYPZzABW2Km9Tc5tHJmMnDO
	hHZuvblb6SQ2xMU8nLllRBx04DsY/bp4ml+S7vTyOMM+bOL6UpiilZPlH4UG723kqDH2GUTpxrC
	4B2jK+Olf5sNvTWgpBzlr/qV/Y93hFPlJpac0X5g=
X-Received: by 2002:a05:6000:4553:b0:48a:fb21:57ff with SMTP id
 ffacd0b85a97d-48b126b18a8mr1280078f8f.1.1790904869631; Thu, 01 Oct 2026
 18:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-3-xueyuan.chen21@gmail.com> <arvJbQmr9GwToA8R@willie-the-truck>
In-Reply-To: <arvJbQmr9GwToA8R@willie-the-truck>
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Fri, 2 Oct 2026 09:34:17 +0800
X-Gm-Features: AclHuK_utlXfpNApdIg0tCcQS_k28vJDN8Yu8dMba1JX-4Q5uJzs9ebkm6k6FjA
Message-ID: <CA+qSx6zV32EN18S+GjESz-Es+6=Zh-m8U=-UovA=rsoBnLWWww@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] arm64/mm: add set_direct_map_ro()
To: Will Deacon <will@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	usama.arif@linux.dev, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, kas@kernel.org, 
	rppt@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	luto@kernel.org, peterz@infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_183432_687370_66EFCD27 
X-CRM114-Status: GOOD (  18.73  )
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

On Tue, Sep 29, 2026 at 10:21=E2=80=AFPM Will Deacon <will@kernel.org> wrot=
e:
>
> On Tue, Sep 01, 2026 at 11:18:17PM +0800, Xueyuan Chen wrote:
> > Implement set_direct_map_ro() for arm64 and flush the TLB internally.
> >
> > Co-developed-by: Lance Yang <lance.yang@linux.dev>
> > Signed-off-by: Lance Yang <lance.yang@linux.dev>
> > Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > ---
> >  arch/arm64/include/asm/set_memory.h |  2 ++
> >  arch/arm64/mm/pageattr.c            | 12 ++++++++++++
> >  2 files changed, 14 insertions(+)
> >
> > diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/a=
sm/set_memory.h
> > index 0091ba12200e..1be86dc11543 100644
> > --- a/arch/arm64/include/asm/set_memory.h
> > +++ b/arch/arm64/include/asm/set_memory.h
> > @@ -13,6 +13,8 @@ int set_memory_valid(unsigned long addr, int numpages=
, int enable);
> >
> >  int set_direct_map_invalid_noflush(struct page *page, unsigned int num=
pages);
> >  int set_direct_map_default_noflush(struct page *page, unsigned int num=
pages);
> > +int set_direct_map_ro(struct page *page, unsigned int nr);
> > +#define set_direct_map_ro set_direct_map_ro
> >  bool kernel_page_present(struct page *page);
> >
> >  int set_memory_encrypted(unsigned long addr, int numpages);
> > diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> > index 132938b32eb1..0e95cd904ccb 100644
> > --- a/arch/arm64/mm/pageattr.c
> > +++ b/arch/arm64/mm/pageattr.c
> > @@ -355,6 +355,18 @@ int realm_register_memory_enc_ops(void)
> >       return arm64_mem_crypt_ops_register(&realm_crypt_ops);
> >  }
> >
> > +int set_direct_map_ro(struct page *page, unsigned int nr)
> > +{
> > +     unsigned long addr =3D (unsigned long)page_address(page);
> > +
> > +     if (!can_set_direct_map())
> > +             return 0;
> > +
> > +     return __change_memory_common(addr, PAGE_SIZE * nr,
> > +                                   __pgprot(PTE_RDONLY),
> > +                                   __pgprot(PTE_WRITE));
> > +}
>
> I haven't quite followed whether or not you intend to send a v8
> making set_memory_ro() handle linear addresses, but fwiw the
> implementation you have here at least looks correct to me, so:
>
> Acked-by: Will Deacon <will@kernel.org>

Thanks for taking a look!

>
> Will

