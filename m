Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7442C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 05:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjoW9fqYDbdAgIJcygrRxaRvrAzlodyZzlebWAHe+B0=; b=hz56wVcfVDLaDQnKx2dULN55jX
	R0RtDYBz91pgbjsNg1rlFrzxA8p52W6lbXUAYQd5GXbf3lDE2CLioF/10SVjh20M/ehR6MJw1XjPX
	bf80Pns8nDJaUU7x8/nHvfZatd7HaDg8y3fPwE36fJ9KY5GXJNqy8ED4sMa4UvyL37ktfPbHiI3N6
	FLAFxzf3qpaBbDNh87DVBmqSmhareyQwd5U1JvZMjMKq730gfsjaXEV+yEbCiBU/8o6aRdvqKwG1J
	cVG4ojZupRCMg1SetNG7Z/AqBGgs3u3LN1i0JPekP914TEQyXXyZasMVcOg1lJJxDdIZpY3XVk/Lb
	N2MAMl3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3b5-0000000EnD4-0uea;
	Thu, 05 Jun 2025 05:57:03 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3Yx-0000000En2u-3oRd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 05:54:53 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-52f05bb975bso227363e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 22:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749102890; x=1749707690; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjoW9fqYDbdAgIJcygrRxaRvrAzlodyZzlebWAHe+B0=;
        b=hfRhFZCSZLpuvHJXMxSCG/hxwhz2e0t7Yhal23txXmmG1R/SXyCuo5QNzG83iYpKLO
         2ZgiphBQReirhf6DAC3+3q/uyfSAe1sYNyky6TD62wFl3wvmv/AR8y+FEOBKTTA4Yy0A
         ZWUXSBQVYhR2InanNJLss9EmbOHn+ZTwUOHv4IWQ4TpEn17qkni3w6FLpjw7DVIzuV+b
         w8AQmx9zfEK+oUxNSnatctd0EVfIZJz46ftr8Ox45kLstwH2fjnkbQfu2obz8jHVs54f
         lZymkU/h7VuI6dkg9rznDmmv1BBSckw+WdJOy7oikOm+hBuqhIwesSYOgII7KTdQ3YwZ
         26JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749102890; x=1749707690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjoW9fqYDbdAgIJcygrRxaRvrAzlodyZzlebWAHe+B0=;
        b=K5hWecWjbFye6BYotGMWYCsczZIxOIax9M1nOj8ePGDtL7UyawErBXJzMuHXswpffy
         gmHj00yCdmmIOOzREl8Wvc/R5k1s2ieST/ATTv3KcI1EKjVNb+ruTTFRzm71haXa7PTq
         UE1z6rjkPJZKIapUXqBdpxY1tv0kOVu4A0KkCSJOMC51Ib2o3XAuReSpGsd3CbcY6J5L
         v6BKuCkAsYu572BbBGINF22vJPY5Qu3lAPT/OSslr4rI4e97zBeJV8bS/IfXnF4XRPNV
         3jiPq9sM825ZbFS+OwJ4gc6uf3MxdU2LJgi0ZPob7b9uY/UUAHbksmFgOHa6z0LwoZEW
         rKQg==
X-Forwarded-Encrypted: i=1; AJvYcCXfP7PyG50ZRRc+bR5fQn6bFi1cbUHTq4vkRL9W1egNFAVmvAwi4GRTUzAzVDfWAA42eHHqmqzdJJXora1mNY1I@lists.infradead.org
X-Gm-Message-State: AOJu0YxxxT2ZgbkymaUxYEantKvEEhlrDdJyJofzChvS8LHmKTDqvsMI
	ZQLjWYbpyxdyRRh4dyrnL/sfIfPVrf5dl8oJqAcJg2TeTtGxP1iNoUvyFETBCoEkqb/qjk+H7pD
	WpTbRAaSFjXN+u+KwRWU9mSldwCUTPaY=
X-Gm-Gg: ASbGncurGb6zW/DvEaCZH6L3jRJruAUEwRZcLwakl4AQDMfsjP+3KOXu74t1bVi7cAB
	STDFwj15umnaDb/SqEhk645RFnK2Wn21Un0TekKhRoEMqIjz7RPHZagDUXB3K596UUOFDj6jLOO
	gbrP0xAKXY/bkbSp2QvNi6DC3dh2wyXgfJYpFtdZ30iSU=
X-Google-Smtp-Source: AGHT+IGHkmhnOe/ChO5I7mBfEFWzYWFhL+wlRB45syXvKYQqTeZmaKk/TDtDJwJhE0PPYIFdmsygYwuPVWhJMdFnqeU=
X-Received: by 2002:a05:6122:32d0:b0:530:72da:d13d with SMTP id
 71dfb90a1353d-530c73159d2mr4234227e0c.1.1749102890022; Wed, 04 Jun 2025
 22:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250510125948.2383778-1-xavier_qy@163.com> <99a0a2c8-d98e-4c81-9207-c55c72c00872@arm.com>
In-Reply-To: <99a0a2c8-d98e-4c81-9207-c55c72c00872@arm.com>
From: Xavier Xia <xavier.qyxia@gmail.com>
Date: Thu, 5 Jun 2025 13:54:38 +0800
X-Gm-Features: AX0GCFtPY6x3OM3e1kDkzDNs9hUNTSh7pijFHunjo15MxF1T0wx51pniOzvmFXw
Message-ID: <CAEmg6AUBf1wVjXSoqBseWffLbixUV7U-nY52ScKCeNXwrkBcqg@mail.gmail.com>
Subject: Re: [PATCH v6] arm64/mm: Optimize loop to reduce redundant operations
 of contpte_ptep_get
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Xavier Xia <xavier_qy@163.com>, 21cnbao@gmail.com, dev.jain@arm.com, 
	ioworker0@gmail.com, akpm@linux-foundation.org, catalin.marinas@arm.com, 
	david@redhat.com, gshan@redhat.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, will@kernel.org, willy@infradead.org, 
	ziy@nvidia.com, Barry Song <baohua@kernel.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_225451_957864_57EB0EA7 
X-CRM114-Status: GOOD (  47.52  )
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

Hi Ryan,

Thank you for your review, and for reproducing and verifying the test cases=
.
I am using a Gmail email to reply to your message, hoping you can receive i=
t.
Please check the details below.



On Thu, Jun 5, 2025 at 11:20=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:
>
> On 10/05/2025 13:59, Xavier Xia wrote:
> > This commit optimizes the contpte_ptep_get and contpte_ptep_get_lockles=
s
> > function by adding early termination logic. It checks if the dirty and
> > young bits of orig_pte are already set and skips redundant bit-setting
> > operations during the loop. This reduces unnecessary iterations and
> > improves performance.
> >
> > In order to verify the optimization performance, a test function has be=
en
> > designed. The function's execution time and instruction statistics have
> > been traced using perf, and the following are the operation results on =
a
> > certain Qualcomm mobile phone chip:
> >
> > Test Code:
>
> nit: It would have been good to include the source for the whole program,
> including #includes and the main() function to make it quicker for others=
 to get
> up and running.

OK, I will pay attention to it in the future. This test case is quite
simple, so I didn't add it.

>
> >
> >       #define PAGE_SIZE 4096
> >       #define CONT_PTES 16
> >       #define TEST_SIZE (4096* CONT_PTES * PAGE_SIZE)
> >       #define YOUNG_BIT 8
> >       void rwdata(char *buf)
> >       {
> >               for (size_t i =3D 0; i < TEST_SIZE; i +=3D PAGE_SIZE) {
> >                       buf[i] =3D 'a';
> >                       volatile char c =3D buf[i];
> >               }
> >       }
> >       void clear_young_dirty(char *buf)
> >       {
> >               if (madvise(buf, TEST_SIZE, MADV_FREE) =3D=3D -1) {
> >                       perror("madvise free failed");
> >                       free(buf);
> >                       exit(EXIT_FAILURE);
> >               }
> >               if (madvise(buf, TEST_SIZE, MADV_COLD) =3D=3D -1) {
> >                       perror("madvise free failed");
> >                       free(buf);
> >                       exit(EXIT_FAILURE);
> >               }
>
> nit: MADV_FREE clears both young and dirty so I don't think MADV_COLD is
> required? (MADV_COLD only clears young I think?)

You're right, MADV_COLD here can probably be removed.

>
> >       }
> >       void set_one_young(char *buf)
> >       {
> >               for (size_t i =3D 0; i < TEST_SIZE; i +=3D CONT_PTES * PA=
GE_SIZE) {
> >                       volatile char c =3D buf[i + YOUNG_BIT * PAGE_SIZE=
];
> >               }
> >       }
> >
> >       void test_contpte_perf() {
> >               char *buf;
> >               int ret =3D posix_memalign((void **)&buf, CONT_PTES * PAG=
E_SIZE,
> >                               TEST_SIZE);
> >               if ((ret !=3D 0) || ((unsigned long)buf % CONT_PTES * PAG=
E_SIZE)) {
> >                       perror("posix_memalign failed");
> >                       exit(EXIT_FAILURE);
> >               }
> >
> >               rwdata(buf);
> >       #if TEST_CASE2 || TEST_CASE3
> >               clear_young_dirty(buf);
> >       #endif
> >       #if TEST_CASE2
> >               set_one_young(buf);
> >       #endif
> >
> >               for (int j =3D 0; j < 500; j++) {
> >                       mlock(buf, TEST_SIZE);
> >
> >                       munlock(buf, TEST_SIZE);
> >               }
> >               free(buf);
> >       }
> >
> >       Descriptions of three test scenarios
> >
> > Scenario 1
> >       The data of all 16 PTEs are both dirty and young.
> >       #define TEST_CASE2 0
> >       #define TEST_CASE3 0
> >
> > Scenario 2
> >       Among the 16 PTEs, only the 8th one is young, and there are no di=
rty ones.
> >       #define TEST_CASE2 1
> >       #define TEST_CASE3 0
> >
> > Scenario 3
> >       Among the 16 PTEs, there are neither young nor dirty ones.
> >       #define TEST_CASE2 0
> >       #define TEST_CASE3 1
> >
> > Test results
> >
> > |Scenario 1         |       Original|       Optimized|
> > |-------------------|---------------|----------------|
> > |instructions       |    37912436160|     18731580031|
> > |test time          |         4.2797|          2.2949|
> > |overhead of        |               |                |
> > |contpte_ptep_get() |         21.31%|           4.80%|
> >
> > |Scenario 2         |       Original|       Optimized|
> > |-------------------|---------------|----------------|
> > |instructions       |    36701270862|     36115790086|
> > |test time          |         3.2335|          3.0874|
> > |Overhead of        |               |                |
> > |contpte_ptep_get() |         32.26%|          33.57%|
> >
> > |Scenario 3         |       Original|       Optimized|
> > |-------------------|---------------|----------------|
> > |instructions       |    36706279735|     36750881878|
> > |test time          |         3.2008|          3.1249|
> > |Overhead of        |               |                |
> > |contpte_ptep_get() |         31.94%|          34.59%|
> >
> > For Scenario 1, optimized code can achieve an instruction benefit of 50=
.59%
> > and a time benefit of 46.38%.
> > For Scenario 2, optimized code can achieve an instruction count benefit=
 of
> > 1.6% and a time benefit of 4.5%.
> > For Scenario 3, since all the PTEs have neither the young nor the dirty
> > flag, the branches taken by optimized code should be the same as those =
of
> > the original code. In fact, the test results of optimized code seem to =
be
> > closer to those of the original code.
>
> I re-ran these tests on Apple M2 with 4K base pages + 64K mTHP.
>
> Scenario 1: reduced to 56% of baseline execution time
> Scenario 2: reduced to 89% of baseline execution time
> Scenario 3: reduced to 91% of baseline execution time
>
> I'm pretty amazed that scenario 3 got faster given it is doing the same n=
umber
> of loops.

It seems that the data you obtained is similar to my test data. For
scenario 3, it's
faster even when running the same code, which I can't quite figure out eith=
er.

> >
> > It can be proven through test function that the optimization for
> > contpte_ptep_get is effective. Since the logic of contpte_ptep_get_lock=
less
> > is similar to that of contpte_ptep_get, the same optimization scheme is
> > also adopted for it.
> >
> > Reviewed-by: Barry Song <baohua@kernel.org>
> > Signed-off-by: Xavier Xia <xavier_qy@163.com>
>
> I don't love the extra complexity, but this version is much tidier. While=
 the
> micro-benchmark is clearly contrived, it shows that there will be cases w=
here it
> will be faster and there are no cases where it is slower. This will proba=
bly be
> more valuable for 16K kernels because the number of PTEs in a contpte blo=
ck is
> 128 there:

Okay, this version has been revised multiple times based on your
previous feedback
and Barry's comments, and it seems much less complicated to understand now.=
 :)

>
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Tested-by: Ryan Roberts <ryan.roberts@arm.com>
>
> > ---
> > Changes in v6:
> > - Move prot =3D pte_pgprot(pte_mkold(pte_mkclean(pte))) into the contpt=
e_is_consistent(),
> >   as suggested by Barry.
> > - Link to v5: https://lore.kernel.org/all/20250509122728.2379466-1-xavi=
er_qy@163.com/
> >
> > Changes in v5:
> > - Replace macro CHECK_CONTPTE_CONSISTENCY with inline function contpte_=
is_consistent
> >   for improved readability and clarity, as suggested by Barry.
> > - Link to v4: https://lore.kernel.org/all/20250508070353.2370826-1-xavi=
er_qy@163.com/
> >
> > Changes in v4:
> > - Convert macro CHECK_CONTPTE_FLAG to an internal loop for better reada=
bility.
> > - Refactor contpte_ptep_get_lockless using the same optimization logic,=
 as suggested by Ryan.
> > - Link to v3: https://lore.kernel.org/all/3d338f91.8c71.1965cd8b1b8.Cor=
email.xavier_qy@163.com/
> > ---
> >  arch/arm64/mm/contpte.c | 74 +++++++++++++++++++++++++++++++++++------
> >  1 file changed, 64 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> > index bcac4f55f9c1..71efe7dff0ad 100644
> > --- a/arch/arm64/mm/contpte.c
> > +++ b/arch/arm64/mm/contpte.c
> > @@ -169,17 +169,46 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pt=
e)
> >       for (i =3D 0; i < CONT_PTES; i++, ptep++) {
> >               pte =3D __ptep_get(ptep);
> >
> > -             if (pte_dirty(pte))
> > +             if (pte_dirty(pte)) {
> >                       orig_pte =3D pte_mkdirty(orig_pte);
> > -
> > -             if (pte_young(pte))
> > +                     for (; i < CONT_PTES; i++, ptep++) {
> > +                             pte =3D __ptep_get(ptep);
> > +                             if (pte_young(pte)) {
> > +                                     orig_pte =3D pte_mkyoung(orig_pte=
);
> > +                                     break;
> > +                             }
> > +                     }
> > +                     break;
> > +             }
> > +
> > +             if (pte_young(pte)) {
> >                       orig_pte =3D pte_mkyoung(orig_pte);
> > +                     i++;
> > +                     ptep++;
> > +                     for (; i < CONT_PTES; i++, ptep++) {
> > +                             pte =3D __ptep_get(ptep);
> > +                             if (pte_dirty(pte)) {
> > +                                     orig_pte =3D pte_mkdirty(orig_pte=
);
> > +                                     break;
> > +                             }
> > +                     }
> > +                     break;
> > +             }
> >       }
> >
> >       return orig_pte;
> >  }
> >  EXPORT_SYMBOL_GPL(contpte_ptep_get);
> >
> > +static inline bool contpte_is_consistent(pte_t pte, unsigned long pfn,
> > +                                     pgprot_t orig_prot)
> > +{
> > +     pgprot_t prot =3D pte_pgprot(pte_mkold(pte_mkclean(pte)));
> > +
> > +     return pte_valid_cont(pte) && pte_pfn(pte) =3D=3D pfn &&
> > +                     pgprot_val(prot) =3D=3D pgprot_val(orig_prot);
> > +}
> > +
> >  pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
> >  {
> >       /*
> > @@ -202,7 +231,6 @@ pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
> >       pgprot_t orig_prot;
> >       unsigned long pfn;
> >       pte_t orig_pte;
> > -     pgprot_t prot;
> >       pte_t *ptep;
> >       pte_t pte;
> >       int i;
> > @@ -219,18 +247,44 @@ pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
> >
> >       for (i =3D 0; i < CONT_PTES; i++, ptep++, pfn++) {
> >               pte =3D __ptep_get(ptep);
> > -             prot =3D pte_pgprot(pte_mkold(pte_mkclean(pte)));
> >
> > -             if (!pte_valid_cont(pte) ||
> > -                pte_pfn(pte) !=3D pfn ||
> > -                pgprot_val(prot) !=3D pgprot_val(orig_prot))
> > +             if (!contpte_is_consistent(pte, pfn, orig_prot))
> >                       goto retry;
> >
> > -             if (pte_dirty(pte))
> > +             if (pte_dirty(pte)) {
> >                       orig_pte =3D pte_mkdirty(orig_pte);
> > +                     for (; i < CONT_PTES; i++, ptep++, pfn++) {
> > +                             pte =3D __ptep_get(ptep);
> > +
> > +                             if (!contpte_is_consistent(pte, pfn, orig=
_prot))
> > +                                     goto retry;
> > +
> > +                             if (pte_young(pte)) {
> > +                                     orig_pte =3D pte_mkyoung(orig_pte=
);
> > +                                     break;
> > +                             }
> > +                     }
> > +                     break;
>
> I considered for a while whether it is safe for contpte_ptep_get_lockless=
() to
> exit early having not seen every PTE in the contpte block and confirmed t=
hat
> they are all consistent. I eventually concluded that it is, as long as al=
l the
> PTEs that it does check are consistent I believe this is fine.

So, it looks like my changes here will be okay.

>
> > +             }
> >
> > -             if (pte_young(pte))
> > +             if (pte_young(pte)) {
> >                       orig_pte =3D pte_mkyoung(orig_pte);
> > +                     i++;
> > +                     ptep++;
> > +                     pfn++;
> > +                     for (; i < CONT_PTES; i++, ptep++, pfn++) {
> > +                             pte =3D __ptep_get(ptep);
> > +
> > +                             if (!contpte_is_consistent(pte, pfn, orig=
_prot))
> > +                                     goto retry;
> > +
> > +                             if (pte_dirty(pte)) {
> > +                                     orig_pte =3D pte_mkdirty(orig_pte=
);
> > +                                     break;
> > +                             }
> > +                     }
> > +                     break;
> > +             }
> >       }
> >
> >       return orig_pte;
>

