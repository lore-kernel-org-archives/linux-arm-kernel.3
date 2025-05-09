Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4F1C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 02:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJWILqSuQUqMcjyRYENm/e5hp/+befMiV/pFyfxyYOw=; b=KJGPRz4iCEpYXIA2M6ZAQISkRy
	/D+V5FiOO+HrnGkGGdM/VrdzkzKno5ROk53rExtk5vnK26QL2mWhZS4QaVEYsP0wYqA4jsG+Zi7w2
	yx9AxlVksKyMCLXW03pkrEmMY355CTcEO1GLgFvlINZCUJh/uU2xLVMlN5iWcWaaIN6os0wOWTjmx
	dU37zIV0gUu37ZamQEIVYLl1C8TfKg3g1etyaKQp+roP2SNphCsjcaLuNmdKpLkFFKUeQuElLY72c
	PJ/JU15/Rp9C7WIgrJVLs5ALcoy70wWrdMvtH2D0Zq8kAVmMnOSKBN8y6EocH0zGEgs9WN7cIGRWD
	1U+nWTiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDDDG-00000002E8O-2VGV;
	Fri, 09 May 2025 02:11:46 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDDBI-00000002DzA-2HyQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 02:09:45 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6f549550d96so21659606d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 19:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746756583; x=1747361383; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJWILqSuQUqMcjyRYENm/e5hp/+befMiV/pFyfxyYOw=;
        b=m0xlXBzZoELHOIrIkxfC7JLJP6nAqJcefq0yiPfW7Uz8oHrppfRhHBiiC8+G6qDkFD
         j32aRhTE9S3/QIEhSnkncoIP6LlkC+xqIeSIRHJBG+fJZGHG/JMj0MxygDvOKbAxBKkD
         M//dt+MnK2exDhVc1oNbQOFKZiKR9IeBwNRm/OyMroz2/2GcrqWznWdLmoZu9OnGfMtd
         ymn+19hw29SpItjn3yWLiaJWa6siVNgzYyjCFqUAG9PrZKnDULUindYJP7eSwnegmBVD
         QNAWG9UArU7vutMLOdWfcqd5/QM0aZ8PJJd2uHXO8II0bxzZYMZUYZ4j3sjf16Ixn89N
         LF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746756583; x=1747361383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJWILqSuQUqMcjyRYENm/e5hp/+befMiV/pFyfxyYOw=;
        b=WMG+A4OBJtfXiBPQDMzs05Fb1e5OwCyVGjBwPVhi1sRcQd88cC69qyg7sXvQcJpc5T
         3dhIMnCMDbtjrjy2PeKpY71e3AmtVEcQrujE/V46cCDiEdRVsowEvQYhTzLEnkdeITkT
         WnG4FOG92FgeCogjeNK5ZznCNTT/o4d1jDpMVTW7wTyLI8q+VKbuQlIeYzDw9cGf/v4X
         JkIskauaQEqwzeEQrmqfdpXzGs0+q9NbLLkVrPSmEUZr2Afu8NhohOQ5SkAUzXazpXcI
         stHj/YprgOjw9SDegNdoiMWzLo/PxjIi4DUxaP4ILu76OWYQCngUTdFDnTpJjF3rc3zM
         svPg==
X-Forwarded-Encrypted: i=1; AJvYcCXGAXJudoAZag0WwiDwUkKfI+YTPk/35pVqPQ+VN8xEIKFwhRefKelSt5Szu8p/VYH5kTLvYzclrm8PSMaXz/pm@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ+NCWrzNt/jCshCYGsrKk8nI+KBo+7S/JmYfQug1X0p0ut/2O
	O28OJRtuHz5dXDV6+y+GzCvkl70v8JqxSNhjrfpmzgfvoVqQDbw7v2NhkEgepwlim25NFt9idq6
	8jtu6XKOUTPwpuiJwlbdXbJ+g9Ag9jXYM
X-Gm-Gg: ASbGncs2qGGBwUMymnqHsSee6LWSLUneJd8x6JgksJkrsmB3a396epS8UACMlJIM84B
	/uF1OIL6sm6eLG+syf9jqlBFqYBL7B1WviAP2LX2Sj0BhrScH5+dmUAO91TUkHXDVYi/L1mnAO7
	k9pNKTawO21ebtEqC1g0LzPQ==
X-Google-Smtp-Source: AGHT+IHnDz0AopexNXOEOqaKPyIa2CirpYwBoeddjpfAfctDH6n6tzTj0r1o3P1bA5PLo6dWzzL84x+IkacDuDaZbA8=
X-Received: by 2002:a05:6102:3fa9:b0:4de:ed21:480a with SMTP id
 ada2fe7eead31-4deed404d57mr1682001137.25.1746756572306; Thu, 08 May 2025
 19:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAGsJ_4xVFDioe4G9wtjfRCKZMLBu94GaFG1z5j0YrHs3j1PkAw@mail.gmail.com>
 <20250508070353.2370826-1-xavier_qy@163.com>
In-Reply-To: <20250508070353.2370826-1-xavier_qy@163.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 9 May 2025 14:09:21 +1200
X-Gm-Features: AX0GCFucevbRFctKcPJOmiahNkLZmoUip90mOFFWmStQgaEASz-Ses9gLPs8cN4
Message-ID: <CAGsJ_4y9tC-=8dv7W1Q=D+bBA2Qr=TLiMDJ-TGv506w=iGe42w@mail.gmail.com>
Subject: Re: [PATCH v4] arm64/mm: Optimize loop to reduce redundant operations
 of contpte_ptep_get
To: Xavier Xia <xavier_qy@163.com>
Cc: ryan.roberts@arm.com, dev.jain@arm.com, ioworker0@gmail.com, 
	akpm@linux-foundation.org, catalin.marinas@arm.com, david@redhat.com, 
	gshan@redhat.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, will@kernel.org, willy@infradead.org, 
	ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_190944_588559_57D05C14 
X-CRM114-Status: GOOD (  31.59  )
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

On Thu, May 8, 2025 at 7:04=E2=80=AFPM Xavier Xia <xavier_qy@163.com> wrote=
:
>
> This commit optimizes the contpte_ptep_get and contpte_ptep_get_lockless
> function by adding early termination logic. It checks if the dirty and
> young bits of orig_pte are already set and skips redundant bit-setting
> operations during the loop. This reduces unnecessary iterations and
> improves performance.
>
> In order to verify the optimization performance, a test function has been
> designed. The function's execution time and instruction statistics have
> been traced using perf, and the following are the operation results on a
> certain Qualcomm mobile phone chip:
>
> Test Code:
>
>         #define PAGE_SIZE 4096
>         #define CONT_PTES 16
>         #define TEST_SIZE (4096* CONT_PTES * PAGE_SIZE)
>         #define YOUNG_BIT 8
>         void rwdata(char *buf)
>         {
>                 for (size_t i =3D 0; i < TEST_SIZE; i +=3D PAGE_SIZE) {
>                         buf[i] =3D 'a';
>                         volatile char c =3D buf[i];
>                 }
>         }
>         void clear_young_dirty(char *buf)
>         {
>                 if (madvise(buf, TEST_SIZE, MADV_FREE) =3D=3D -1) {
>                         perror("madvise free failed");
>                         free(buf);
>                         exit(EXIT_FAILURE);
>                 }
>                 if (madvise(buf, TEST_SIZE, MADV_COLD) =3D=3D -1) {
>                         perror("madvise free failed");
>                         free(buf);
>                         exit(EXIT_FAILURE);
>                 }
>         }
>         void set_one_young(char *buf)
>         {
>                 for (size_t i =3D 0; i < TEST_SIZE; i +=3D CONT_PTES * PA=
GE_SIZE) {
>                         volatile char c =3D buf[i + YOUNG_BIT * PAGE_SIZE=
];
>                 }
>         }
>
>         void test_contpte_perf() {
>                 char *buf;
>                 int ret =3D posix_memalign((void **)&buf, CONT_PTES * PAG=
E_SIZE,
>                                 TEST_SIZE);
>                 if ((ret !=3D 0) || ((unsigned long)buf % CONT_PTES * PAG=
E_SIZE)) {
>                         perror("posix_memalign failed");
>                         exit(EXIT_FAILURE);
>                 }
>
>                 rwdata(buf);
>         #if TEST_CASE2 || TEST_CASE3
>                 clear_young_dirty(buf);
>         #endif
>         #if TEST_CASE2
>                 set_one_young(buf);
>         #endif
>
>                 for (int j =3D 0; j < 500; j++) {
>                         mlock(buf, TEST_SIZE);
>
>                         munlock(buf, TEST_SIZE);
>                 }
>                 free(buf);
>         }
>
>         Descriptions of three test scenarios
>
> Scenario 1
>         The data of all 16 PTEs are both dirty and young.
>         #define TEST_CASE2 0
>         #define TEST_CASE3 0
>
> Scenario 2
>         Among the 16 PTEs, only the 8th one is young, and there are no di=
rty ones.
>         #define TEST_CASE2 1
>         #define TEST_CASE3 0
>
> Scenario 3
>         Among the 16 PTEs, there are neither young nor dirty ones.
>         #define TEST_CASE2 0
>         #define TEST_CASE3 1
>
> Test results
>
> |Scenario 1         |       Original|       Optimized|
> |-------------------|---------------|----------------|
> |instructions       |    37912436160|     18731580031|
> |test time          |         4.2797|          2.2949|
> |overhead of        |               |                |
> |contpte_ptep_get() |         21.31%|           4.80%|
>
> |Scenario 2         |       Original|       Optimized|
> |-------------------|---------------|----------------|
> |instructions       |    36701270862|     36115790086|
> |test time          |         3.2335|          3.0874|
> |Overhead of        |               |                |
> |contpte_ptep_get() |         32.26%|          33.57%|
>
> |Scenario 3         |       Original|       Optimized|
> |-------------------|---------------|----------------|
> |instructions       |    36706279735|     36750881878|
> |test time          |         3.2008|          3.1249|
> |Overhead of        |               |                |
> |contpte_ptep_get() |         31.94%|          34.59%|
>
> For Scenario 1, optimized code can achieve an instruction benefit of 50.5=
9%
> and a time benefit of 46.38%.
> For Scenario 2, optimized code can achieve an instruction count benefit o=
f
> 1.6% and a time benefit of 4.5%.
> For Scenario 3, since all the PTEs have neither the young nor the dirty
> flag, the branches taken by optimized code should be the same as those of
> the original code. In fact, the test results of optimized code seem to be
> closer to those of the original code.
>
> It can be proven through test function that the optimization for
> contpte_ptep_get is effective. Since the logic of contpte_ptep_get_lockle=
ss
> is similar to that of contpte_ptep_get, the same optimization scheme is
> also adopted for it.
>
> Signed-off-by: Xavier Xia <xavier_qy@163.com>
> ---
>  arch/arm64/mm/contpte.c | 71 +++++++++++++++++++++++++++++++++++------
>  1 file changed, 62 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index bcac4f55f9c1..e9882ec782fc 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -169,17 +169,41 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>         for (i =3D 0; i < CONT_PTES; i++, ptep++) {
>                 pte =3D __ptep_get(ptep);
>
> -               if (pte_dirty(pte))
> +               if (pte_dirty(pte)) {
>                         orig_pte =3D pte_mkdirty(orig_pte);
> -
> -               if (pte_young(pte))
> +                       for (; i < CONT_PTES; i++, ptep++) {
> +                               pte =3D __ptep_get(ptep);
> +                               if (pte_young(pte)) {
> +                                       orig_pte =3D pte_mkyoung(orig_pte=
);
> +                                       break;
> +                               }
> +                       }
> +                       break;
> +               }
> +
> +               if (pte_young(pte)) {
>                         orig_pte =3D pte_mkyoung(orig_pte);
> +                       i++;
> +                       ptep++;
> +                       for (; i < CONT_PTES; i++, ptep++) {
> +                               pte =3D __ptep_get(ptep);
> +                               if (pte_dirty(pte)) {
> +                                       orig_pte =3D pte_mkdirty(orig_pte=
);
> +                                       break;
> +                               }
> +                       }
> +                       break;
> +               }
>         }
>
>         return orig_pte;
>  }
>  EXPORT_SYMBOL_GPL(contpte_ptep_get);
>
> +#define CHECK_CONTPTE_CONSISTENCY(pte, pfn, prot, orig_prot) \
> +       (!pte_valid_cont(pte) || pte_pfn(pte) !=3D pfn || \
> +               pgprot_val(prot) !=3D pgprot_val(orig_prot))

maybe make it a static inline function to improve readability. Also,
the name appears to
be not good: CHECK_CONTPTE_CONSISTENCY is actually checking for inconsisten=
cy,
not consistency.

it might be:

static inline bool contpte_is_consistent(...)
{
        return pte_valid_cont(pte) && pte_pfn(pte) =3D=3D pfn &&
               pgprot_val(prot) =3D=3D pgprot_val(orig_prot);
}

or another better name.

> +
>  pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
>  {
>         /*
> @@ -221,16 +245,45 @@ pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
>                 pte =3D __ptep_get(ptep);
>                 prot =3D pte_pgprot(pte_mkold(pte_mkclean(pte)));
>
> -               if (!pte_valid_cont(pte) ||
> -                  pte_pfn(pte) !=3D pfn ||
> -                  pgprot_val(prot) !=3D pgprot_val(orig_prot))
> +               if (CHECK_CONTPTE_CONSISTENCY(pte, pfn, prot, orig_prot))
>                         goto retry;
>
> -               if (pte_dirty(pte))
> +               if (pte_dirty(pte)) {
>                         orig_pte =3D pte_mkdirty(orig_pte);
> -
> -               if (pte_young(pte))
> +                       for (; i < CONT_PTES; i++, ptep++, pfn++) {
> +                               pte =3D __ptep_get(ptep);
> +                               prot =3D pte_pgprot(pte_mkold(pte_mkclean=
(pte)));
> +
> +                               if (CHECK_CONTPTE_CONSISTENCY(pte, pfn, p=
rot, orig_prot))
> +                                       goto retry;
> +
> +                               if (pte_young(pte)) {
> +                                       orig_pte =3D pte_mkyoung(orig_pte=
);
> +                                       break;
> +                               }
> +                       }
> +                       break;
> +               }
> +
> +               if (pte_young(pte)) {
>                         orig_pte =3D pte_mkyoung(orig_pte);
> +                       i++;
> +                       ptep++;
> +                       pfn++;
> +                       for (; i < CONT_PTES; i++, ptep++, pfn++) {
> +                               pte =3D __ptep_get(ptep);
> +                               prot =3D pte_pgprot(pte_mkold(pte_mkclean=
(pte)));
> +
> +                               if (CHECK_CONTPTE_CONSISTENCY(pte, pfn, p=
rot, orig_prot))
> +                                       goto retry;
> +
> +                               if (pte_dirty(pte)) {
> +                                       orig_pte =3D pte_mkdirty(orig_pte=
);
> +                                       break;
> +                               }
> +                       }
> +                       break;
> +               }
>         }
>
>         return orig_pte;
> --
> 2.34.1
>

Thanks
barry

