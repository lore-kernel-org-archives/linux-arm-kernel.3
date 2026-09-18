Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65405C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 08:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0yQ4rBAEiKMEofLz40Ao8DmOY1a2/mbTmLdfwCpmzU=; b=q0ig67+5pamCc4s0QYFibuNWM1
	ThGLgEajx4zRe96cEpwcj/t1UkTKlGvWHdFMrXodgsu8+vLej1j4ftuMacqJ7UgfiZsEYgKA3M4yx
	RUroC3GwYdOLFAy8dpshUw5tsfwRIubJKqEYc/yHWOpBg5CG7yezr5SW0Wo3IHgD0Yrrg2UW7o6do
	luH0ora5nr71aLHeMHd21tP2RVYS0d+lDHPvjBpWwq99AXeW1IMsPZvAzQcrGV2Sd5AGLHjYhQkIa
	AFmvQqgqaxgc1UlZVc+Qu3h9xDj5UdVZOysJT4bJEqw74ItChTmDptHzs8ZRC3W4Tb8SeVMjQeCEI
	zuUxUi2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7U6P-0000000Dpnm-3Fdn;
	Fri, 18 Sep 2026 08:37:49 +0000
Received: from mail-wr2-x1f.google.com ([2a00:1450:4864:30::1f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7U6N-0000000Dpmw-199U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 08:37:48 +0000
Received: by mail-wr2-x1f.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so201508f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 01:37:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789720665; cv=none;
        d=google.com; s=arc-20260327;
        b=foGdBsqCCljG79++vJE4Cw4h93jBV9KRzMP8TMkbaR1e5K7zuFzwzg/MZuASnJ94pR
         21qpISbddM1M3mPa6rLc/f1tWeq9I7Zmo1WphoSHHpWRBJ1Xqp7yofSZD+BQH+Fvam1i
         5bKDj2ywmiUq//td96HN0tzAI6CWMQtitXwoDXhTOwCa4Oky+L7ccmpuTa1Nc+mc53b7
         b3N2pN6DnmXx2SiGlriYkiIEsJAjDQxQC5xS6WFW83k1q9/vNEW7AQQ6ks8js9ASZBsl
         O4FE2ov+a+R5JCByz+nlf4SXKzsxirxRyK0M9I5AxOrZKgWC5Dmwt6eoaT/eizqwuNde
         BCmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m0yQ4rBAEiKMEofLz40Ao8DmOY1a2/mbTmLdfwCpmzU=;
        fh=CVmWG8GV3mJRFP11oHxVWNnyYwqdHmXiu4f/DmvEUjI=;
        b=TQv9Nr3lUEt6MfkED67Whuajhpeyrexk62I0Kw3tIXQtnP4QzX6rPEIz2+eCxmtx01
         GKHMGaOUw+vjwi5Cvzb/xW2QY/7KhR5TDeA/0vVC4dr337er8cjEM6c8CygNR0bsDJFK
         EM8K7EPnk++p70uQJc54X0PdAQIAFl5fUTR/Mev2qsKO61iUAQGK9nh0xRJoDYaUuWil
         miv/JfR0EOwtdaKVrCQE027o1ysdx6YjWly47l+FAlGM7Tvwv54RyPV2dZO14ENK+yX8
         4ZFo+rpx/CNGUW3pefx+EjtmkZV4cj3iG604TvNExVghDiek9Nqm/LnCUEv2S9k40eWD
         nL9g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789720665; x=1790325465; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m0yQ4rBAEiKMEofLz40Ao8DmOY1a2/mbTmLdfwCpmzU=;
        b=diFgJVe0RD345ALi8K21ul1om56W2Vv8ZHyid8o4ySA6znfxFx+fY3+lshogjNQcP8
         bOl6sp9vtOXQXEmNVfJyJmXpN2+jWzHPjXM4AE0MOaqzBSgQVkqX/sMXh+Vo7Izm6FAQ
         UMtz14zLXF+4YStKRfsKvpbOSmlzobTtbfoMxIUHRMkLS21bvXlLin0cNupzPGJW4O4V
         CS25dmpnVHPey9w5QeH0Du9b9w7rylUGCexvDTCxJ++CJsuiziXFAlyPNyPa+wAZAw87
         +lJQKCHMEPPbsOePLYAKOsYgfMhDo7ccQrxOgU1nVnSyreDY5u3sOmIKvbFbcXPBLRH4
         hTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789720665; x=1790325465;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m0yQ4rBAEiKMEofLz40Ao8DmOY1a2/mbTmLdfwCpmzU=;
        b=Up6fq6DIKm384DmwpubqK9VGKd/7Px67R4Yz0v25SmyZ6q7qvzNRP26AK5Il7wQ/Bn
         Mb5/rIRKlkcQuhZHHc/0c3v+VF76CdaxyYX0U0mCmx1aRlnPpQOnt/FFeSzmDqXZ43Dx
         m3+BYPxeeUNU1UveZP9sIVATVMKCQNDlCT74pEmr9Yv/Wd6Yj2gBGRqPTAqK7tBHFZA/
         2nmZ8mafgut8d9843Fo4HPc3QDjRWyuR6WxvGw52mZ7Qt/c7qVTxKe/w2BAffpkR9xY3
         KtaRPTtezETMbbyYV8E4XYIuGLszAA9tVYavw2hZypjZWheoRa6ELCBtQ/zhXAeiAAe9
         KhyA==
X-Forwarded-Encrypted: i=1; AKwUvBzGs7GbFm8nvtc3GKZW+MRoxvoFEWJ55lTjk2SEWCC8q+rg9gZsaHSGikKsKMed+UnGP1/qJ6DmML9tPU4whjag@lists.infradead.org
X-Gm-Message-State: AFuF++mlid8l1Y/LfFggVkWsMaur/frFm1DmLIhRh0ytfSNhA4ehbPJD
	MILH2kxFiXKfua5ChhN+0j8BJK54K2P/f1I+w2KtfEP7Q3UBLH+GGb8140ma3GOjJGG63riqyMD
	fhEOnohTFUTldUlZo3jBDJjntUNjpMLrpPq/ZKPA=
X-Gm-Gg: AYBFou3RCzyAsiZAdKvaxA5nTIFQP9XIMnXUIFpqyVTJwTl5jLhiIsYJNUg/CvM22+Z
	OAYqql0I2TV1v1mTggpDq4QGMuEk/VGnUidwrSDlHkC/FfAmp6T8ZdHA83+ycqHd7URedccmsK6
	zrx8tB1XF/Rq04xtsM8cQMLmHcUBmwOa9Sx7v+VAeIVad9bNPVVDBOvrzf8PBREdj3DH6Dq/hYK
	IaEEQZXeAaB11Nj7i1r3fJ0Fjz7v/xcI590PcLsDOOj4jtgK2k6i11tjZButiWJk6upfjHswDMx
	ht7ACEvCPURn+m71rzAO+f3glk9niQPZ6ZuJ1qVQs//tKxV2/BwMJo+C
X-Received: by 2002:a5d:5f4f:0:b0:486:f4ae:72a2 with SMTP id
 ffacd0b85a97d-4871e2131a7mr2297716f8f.1.1789720665326; Fri, 18 Sep 2026
 01:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
 <20260917052933.188679-4-jiangwenxiaomi@gmail.com> <27072d94-13bf-4bea-948a-d8a67976601e@kernel.org>
 <CAHKocdE_zyUQT459AiTBDzQHk0jh+VpXuSMDdgHjkg-dAkgBNg@mail.gmail.com>
 <CAGsJ_4yJ-KCHbJ9S2GKXfO51KB8g-y2Q_MikqE9-6VesR-RC9Q@mail.gmail.com>
 <2462f67c-f7d3-4eb3-a093-6a338ef49f14@kernel.org> <CAGsJ_4zMG6v-ioi8-NhveqowPVAnsHkFCNy_c7+KHDMRW3JH-Q@mail.gmail.com>
 <24aedc8c-a5c6-418b-a37e-051f0d6d9fa7@kernel.org>
In-Reply-To: <24aedc8c-a5c6-418b-a37e-051f0d6d9fa7@kernel.org>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Fri, 18 Sep 2026 16:37:34 +0800
X-Gm-Features: AcwNN1XBh3Wey2x3l7KbPhov9h79lwYf3qMIq1ZNnS7cqxD6HqWXu6Gr_vbTLnA
Message-ID: <CAHKocdEmb-Hsxu8FCxvzhz3XdzmrPddGo4wv6GqjeHvAYfxVrQ@mail.gmail.com>
Subject: Re: [PATCH v8 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge()
 for PTE-level block mappings
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Barry Song <baohua@kernel.org>, akpm@linux-foundation.org, catalin.marinas@arm.com, 
	linux-mm@kvack.org, urezki@gmail.com, will@kernel.org, 
	Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, anshuman.khandual@arm.com, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_013747_369697_B423DCB1 
X-CRM114-Status: GOOD (  36.70  )
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

On Fri, 18 Sept 2026 at 15:04, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
>
>
> Le 18/09/2026 =C3=A0 08:14, Barry Song a =C3=A9crit :
> > On Fri, Sep 18, 2026 at 2:05=E2=80=AFPM Christophe Leroy (CS GROUP)
> > <chleroy@kernel.org> wrote:
> >>
> >>
> >>
> >> Le 17/09/2026 =C3=A0 23:44, Barry Song a =C3=A9crit :
> >>> On Thu, Sep 17, 2026 at 10:41=E2=80=AFPM Wen Jiang <jiangwenxiaomi@gm=
ail.com> wrote:
> > [...]
> >
> >>>>>>
> >>>>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> >>>>>> index cdd68ed3ae1a9..349ced999f959 100644
> >>>>>> --- a/include/linux/pgtable.h
> >>>>>> +++ b/include/linux/pgtable.h
> >>>>>> @@ -2134,6 +2134,35 @@ static inline int pmd_free_pte_page(pmd_t *=
pmd, unsigned long addr)
> >>>>>>     }
> >>>>>>     #endif      /* CONFIG_HAVE_ARCH_HUGE_VMAP */
> >>>>>>
> >>>>>> +/*
> >>>>>> + * PTE-level block mappings for vmap.
> >>>>>> + *
> >>>>>> + * pte_set_huge() only has to be implemented by architectures who=
se
> >>>>>> + * arch_vmap_pte_range_map_size() can return a size other than PA=
GE_SIZE.
> >>>>>> + */
> >>>>>> +#ifndef __HAVE_ARCH_PTE_SET_HUGE
> >>>>>> +static inline void pte_set_huge(pte_t *ptep, unsigned long addr,
> >>>>>> +                             phys_addr_t phys, pgprot_t prot,
> >>>>>> +                             unsigned long size)
> >>>>>> +{
> >>>>>> +     WARN_ON_ONCE(1);
> >>>>>
> >>>>> BUILD_BUG_ON() would be better here.
> >>>>>
> >>>>> It should be possible because fallback arch_vmap_pte_range_map_size=
()
> >>>>> will constant-fold PAGE_SIZE so pte_set_huge() will never be called=
.
> >>>>>
> >>>>
> >>>> Agreed. These fallbacks exist only to keep the build working on
> >>>> architectures with PTE-level block mappings and should never actuall=
y
> >>>> be reached, so BUILD_BUG_ON() is right. I'll make that change in v9.
> >>>>
> >>>
> >>> I am not quite sure. It won't be called at runtime because
> >>> `vmap size`/`unmap size` return `PAGE_SIZE`, so the code won't
> >>> reach this branch. But it will still be built.
> >>
> >> The fallbacks are defined as:
> >>
> >> #ifndef arch_vmap_pte_range_map_size
> >> static inline unsigned long arch_vmap_pte_range_map_size(unsigned long
> >> addr, unsigned long end,
> >>                                                           u64 pfn, uns=
igned int max_page_shift)
> >> {
> >>          return PAGE_SIZE;
> >> }
> >> #endif
> >>
> >> #ifndef arch_vmap_pte_range_unmap_size
> >> static inline unsigned long arch_vmap_pte_range_unmap_size(unsigned lo=
ng
> >> addr,
> >>                                                             pte_t *pte=
p)
> >> {
> >>          return PAGE_SIZE;
> >> }
> >> #endif
> >>
> >> Therefore in:
> >>
> >>                   size =3D arch_vmap_pte_range_unmap_size(addr, pte);
> >>                   if (size !=3D PAGE_SIZE) {
> >>
> >> GCC knows 'size' is const and its value is PAGE_SIZE, so it won't emit
> >> the branch at all.
> >>
> >> It is call constant folding, some explanation here:
> >> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fen=
.wikipedia.org%2Fwiki%2FConstant_folding&data=3D05%7C02%7Cchristophe.leroy%=
40csgroup.eu%7C869dac21f28d45988a3d08df154c225a%7C8b87af7d86474dc78df45f69a=
2011bb5%7C0%7C0%7C639253088878897551%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcG=
kiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D=
%3D%7C0%7C%7C%7C&sdata=3DDvtz1%2FAHvAbVYO%2BRaHTOizcD%2FclJ9FqTcWXKMhIFVyw%=
3D&reserved=3D0
> >>
> >>>
> >>> So, would a `BUILD_BUG_ON()` trigger a build failure here?
> >>
> >> It shouldn't, if it does it is a compiled bug or this is because someo=
ne
> >> has redefined arch_vmap_pte_range_map_size() and not pte_set_huge()
> >> which we'd better know at build time rather than at runtime.
> >
> > Thanks, Christophe. I was also thinking about compiler optimization. I
> > was just a bit worried that we're touching the common MM code, which
> > affects almost all architectures, so I'm not quite sure whether this is
> > supported by all GCC versions used by those architectures.
> >
> > If it is supported by all of them, I agree that `BUILD_BUG_ON()` is a
> > perfect approach.
>
> AFAIU this is the assumption made by the kernel, see
> https://docs.kernel.org/process/coding-style.html#conditional-compilation
>
> This is the same compiler, I see no reason why ability to constant-fold
> would be dependant on architecture.
>
> Christophe

Hi Barry and Christophe,

pgtable.h already does this in a few places, the !THP fallback of
pmdp_clear_flush_young() is just BUILD_BUG(), and its caller in mm/rmap.c,
a file that is built unconditionally, is guarded by
IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) rather than #ifdef. So on every
THP=3Dn build, on every architecture, that call has to be eliminated by
the compiler or the build breaks.

I built it with BUILD_BUG() on x86_64, arm64 and powerpc (8xx) to be sure,
and all three are clean.

It will be BUILD_BUG() rather than BUILD_BUG_ON(1): BUILD_BUG_ON() expects =
a
condition the compiler should know is false, while BUILD_BUG() is documente=
d
as the way to flag code that is expected to be eliminated at build time.

Thanks,
Wen

