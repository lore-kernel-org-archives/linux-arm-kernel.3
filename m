Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A165BC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 08:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EbjPmpN4k4kj61gbTaIz/v/P03tQOZqrCSncxNOLHhc=; b=PHXFfOiVONxuGSEFsuLYTjVN+4
	nmsu5vQY0eVkNIGbufXdcETOJx2sWWAxE0FrYkGHOb1/9jZ7NUJxynfXIziPtrMq6Xdb3kJcVcOM+
	Szv6DyeSWMtkEvo90zBueU95clepp3v81Wj4s31e3FExlA7U3FJjhKMAkUlQZ/+X4QAUBuhNllUWV
	FPGH2h5AAUqjB6uOXhtcIHEdwpQ8b8pJzas9IqcIAq3Fq4CZBrfm/eLCma6Zk0BePTSGEFEYX9xuV
	sVApk6fTlSzebyKdWRWl7S4sV5tMdjDR43P98Eyfu3Mze57WGmrTkdFZ+UVgPqE8dW6ej3idfs/WB
	oVn0bpDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSWlx-0000000F0Fc-0o04;
	Fri, 20 Jun 2025 08:06:53 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSWcX-0000000EzLB-34hS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 07:57:11 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ad883afdf0cso318736066b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 00:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750406228; x=1751011028; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbjPmpN4k4kj61gbTaIz/v/P03tQOZqrCSncxNOLHhc=;
        b=Hobnqfe0y5qM/03QVUfY5TupmNEaHZtkv2PffohvN1aENyDJ9PJh20GGKNyw7y3mdZ
         wZqtH2xqYNf7BpXM+RfzMDgGCVKiZu2dxM3QLwzGKhdcU4hicZHPJItPv0Yx0boib4xI
         Dg+GnWsXGqx5cLAjnoZ321lb1cqdeGyYSJnFg+pAdedpk2QDZqSs0lpddoJ5SE6XY2DF
         MUhoQSUO9IPGLDPVgr57YtP71tWRUfvRcW9rXy2yKL7fWabyGXnlZRfF2pAp8Do95lor
         iVRA2H4nqRQYmGd4O0jPYf447/AB4wk2KoonSLoShaigmLO8kAAmclv+X5Ttmm10v9cd
         M5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750406228; x=1751011028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbjPmpN4k4kj61gbTaIz/v/P03tQOZqrCSncxNOLHhc=;
        b=Ud9iuzO/U21+QPj+fpqP9cP78rUFFaPidUYV7Q4d2PnvPbU1i/nHvFdqWIQEOYh3aD
         VkhHAOC7N4MG/KKFMzxudFZ6KRhtXsLxxOugMXENe1RHLYXsxJjt1CDeOVV214Q7g5pO
         bJ2QncxpCQy9xYVLGfaL98mWihWQs1CetcXP7rRRWIPP8o6w2gmeTdYCFvlzJtOEZJc2
         fudToHcD4yafoJSk8o6cebRSExYllLhpJOdCVpLwNF6ynLAkRSwQRKBxHg0GtWaf4K/V
         7nyAKc0SWn0FSeE1Qu7hvCX2wKaxi6khLA0zSNvtLSzX5bgzlZ7eeHVlbdUzgDo87pmx
         hy/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUSg7ZRlxlmhRQhZorDcVRmFEMaxV2YPNkINAhmq//NnXRXQEf0cb3/bnTDfLVnd3U3nYgZQ5s3kCAuc69+K1zR@lists.infradead.org
X-Gm-Message-State: AOJu0Yxqjuz9PDCeiGE37lt+vhV6zHocYN9TDYrXVgDj2UUyPnCwd2U5
	3Mc03zWgyWgKLV+5zKFASs0yZWrYIaPR09Ui9/blcOWj+OnEzXIR6v0oZxrGUT3w0JHx5JSoJ52
	akzQsMDn3x1sjeAsj6PasBpb7BuxVDko=
X-Gm-Gg: ASbGncsIOuLg89l+M3eeja7j+LJQl7st6oIrNMQiE5+YoA3UeZn6T89oGqOZmBbavQY
	ZDZtlRQpkKfm5AnN7rIw1fqEh9L5sEO/4zPjl/9oDMOMxcz19k+ft/VtrWY6cpMlqzW/IdJsL+z
	4MJZYlxTUi8R2lKnophqEGvcEUMeJvlHwux5d15USsAeY=
X-Google-Smtp-Source: AGHT+IF+6VAuUMy2Nvt0MZJBmp7cJebHTpZAwXCTt5iJxnNBDyghc8/sLzCVmrIXjVnN1BmUqSI7tUkqqvgBuxrWVds=
X-Received: by 2002:a17:906:d7e3:b0:ad5:1bfd:30d2 with SMTP id
 a640c23a62f3a-ae057c1b50fmr165637966b.55.1750406227316; Fri, 20 Jun 2025
 00:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250510125948.2383778-1-xavier_qy@163.com> <99a0a2c8-d98e-4c81-9207-c55c72c00872@arm.com>
 <CAEmg6AUBf1wVjXSoqBseWffLbixUV7U-nY52ScKCeNXwrkBcqg@mail.gmail.com> <225fd9dd-2b97-4ec6-a9a6-fe148c4b901e@arm.com>
In-Reply-To: <225fd9dd-2b97-4ec6-a9a6-fe148c4b901e@arm.com>
From: Xavier Xia <xavier.qyxia@gmail.com>
Date: Fri, 20 Jun 2025 15:56:55 +0800
X-Gm-Features: AX0GCFvm3O18WCJzWjEGbk5vI8Iresz2_k3HB_QhB7hJ_3Y61_BnRY6cB-c-gac
Message-ID: <CAEmg6AW0ZoKf_8XK7EjA2sE6HEL3Tneg7-CKakTNdgZrd585Ng@mail.gmail.com>
Subject: Re: [PATCH v6] arm64/mm: Optimize loop to reduce redundant operations
 of contpte_ptep_get
To: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org
Cc: Xavier Xia <xavier_qy@163.com>, 21cnbao@gmail.com, dev.jain@arm.com, 
	ioworker0@gmail.com, akpm@linux-foundation.org, catalin.marinas@arm.com, 
	david@redhat.com, gshan@redhat.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, willy@infradead.org, ziy@nvidia.com, 
	Barry Song <baohua@kernel.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_005709_783372_2C0D8DAD 
X-CRM114-Status: GOOD (  47.83  )
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

Hi all,

May I follow up: Does this patch require any further changes? Is it
now meeting the merging criteria?

--

Thanks,
Xavier

On Thu, Jun 5, 2025 at 3:16=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com> =
wrote:
>
> On 05/06/2025 06:54, Xavier Xia wrote:
> > Hi Ryan,
> >
> > Thank you for your review, and for reproducing and verifying the test c=
ases.
> > I am using a Gmail email to reply to your message, hoping you can recei=
ve it.
> > Please check the details below.
>
> Ahh yes, this arrived in my inbox without issue!
>
> Thanks,
> Ryan
>
>
> >
> >
> >
> > On Thu, Jun 5, 2025 at 11:20=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.=
com> wrote:
> >>
> >> On 10/05/2025 13:59, Xavier Xia wrote:
> >>> This commit optimizes the contpte_ptep_get and contpte_ptep_get_lockl=
ess
> >>> function by adding early termination logic. It checks if the dirty an=
d
> >>> young bits of orig_pte are already set and skips redundant bit-settin=
g
> >>> operations during the loop. This reduces unnecessary iterations and
> >>> improves performance.
> >>>
> >>> In order to verify the optimization performance, a test function has =
been
> >>> designed. The function's execution time and instruction statistics ha=
ve
> >>> been traced using perf, and the following are the operation results o=
n a
> >>> certain Qualcomm mobile phone chip:
> >>>
> >>> Test Code:
> >>
> >> nit: It would have been good to include the source for the whole progr=
am,
> >> including #includes and the main() function to make it quicker for oth=
ers to get
> >> up and running.
> >
> > OK, I will pay attention to it in the future. This test case is quite
> > simple, so I didn't add it.
> >
> >>
> >>>
> >>>       #define PAGE_SIZE 4096
> >>>       #define CONT_PTES 16
> >>>       #define TEST_SIZE (4096* CONT_PTES * PAGE_SIZE)
> >>>       #define YOUNG_BIT 8
> >>>       void rwdata(char *buf)
> >>>       {
> >>>               for (size_t i =3D 0; i < TEST_SIZE; i +=3D PAGE_SIZE) {
> >>>                       buf[i] =3D 'a';
> >>>                       volatile char c =3D buf[i];
> >>>               }
> >>>       }
> >>>       void clear_young_dirty(char *buf)
> >>>       {
> >>>               if (madvise(buf, TEST_SIZE, MADV_FREE) =3D=3D -1) {
> >>>                       perror("madvise free failed");
> >>>                       free(buf);
> >>>                       exit(EXIT_FAILURE);
> >>>               }
> >>>               if (madvise(buf, TEST_SIZE, MADV_COLD) =3D=3D -1) {
> >>>                       perror("madvise free failed");
> >>>                       free(buf);
> >>>                       exit(EXIT_FAILURE);
> >>>               }
> >>
> >> nit: MADV_FREE clears both young and dirty so I don't think MADV_COLD =
is
> >> required? (MADV_COLD only clears young I think?)
> >
> > You're right, MADV_COLD here can probably be removed.
> >
> >>
> >>>       }
> >>>       void set_one_young(char *buf)
> >>>       {
> >>>               for (size_t i =3D 0; i < TEST_SIZE; i +=3D CONT_PTES * =
PAGE_SIZE) {
> >>>                       volatile char c =3D buf[i + YOUNG_BIT * PAGE_SI=
ZE];
> >>>               }
> >>>       }
> >>>
> >>>       void test_contpte_perf() {
> >>>               char *buf;
> >>>               int ret =3D posix_memalign((void **)&buf, CONT_PTES * P=
AGE_SIZE,
> >>>                               TEST_SIZE);
> >>>               if ((ret !=3D 0) || ((unsigned long)buf % CONT_PTES * P=
AGE_SIZE)) {
> >>>                       perror("posix_memalign failed");
> >>>                       exit(EXIT_FAILURE);
> >>>               }
> >>>
> >>>               rwdata(buf);
> >>>       #if TEST_CASE2 || TEST_CASE3
> >>>               clear_young_dirty(buf);
> >>>       #endif
> >>>       #if TEST_CASE2
> >>>               set_one_young(buf);
> >>>       #endif
> >>>
> >>>               for (int j =3D 0; j < 500; j++) {
> >>>                       mlock(buf, TEST_SIZE);
> >>>
> >>>                       munlock(buf, TEST_SIZE);
> >>>               }
> >>>               free(buf);
> >>>       }
> >>>
> >>>       Descriptions of three test scenarios
> >>>
> >>> Scenario 1
> >>>       The data of all 16 PTEs are both dirty and young.
> >>>       #define TEST_CASE2 0
> >>>       #define TEST_CASE3 0
> >>>
> >>> Scenario 2
> >>>       Among the 16 PTEs, only the 8th one is young, and there are no =
dirty ones.
> >>>       #define TEST_CASE2 1
> >>>       #define TEST_CASE3 0
> >>>
> >>> Scenario 3
> >>>       Among the 16 PTEs, there are neither young nor dirty ones.
> >>>       #define TEST_CASE2 0
> >>>       #define TEST_CASE3 1
> >>>
> >>> Test results
> >>>
> >>> |Scenario 1         |       Original|       Optimized|
> >>> |-------------------|---------------|----------------|
> >>> |instructions       |    37912436160|     18731580031|
> >>> |test time          |         4.2797|          2.2949|
> >>> |overhead of        |               |                |
> >>> |contpte_ptep_get() |         21.31%|           4.80%|
> >>>
> >>> |Scenario 2         |       Original|       Optimized|
> >>> |-------------------|---------------|----------------|
> >>> |instructions       |    36701270862|     36115790086|
> >>> |test time          |         3.2335|          3.0874|
> >>> |Overhead of        |               |                |
> >>> |contpte_ptep_get() |         32.26%|          33.57%|
> >>>
> >>> |Scenario 3         |       Original|       Optimized|
> >>> |-------------------|---------------|----------------|
> >>> |instructions       |    36706279735|     36750881878|
> >>> |test time          |         3.2008|          3.1249|
> >>> |Overhead of        |               |                |
> >>> |contpte_ptep_get() |         31.94%|          34.59%|
> >>>
> >>> For Scenario 1, optimized code can achieve an instruction benefit of =
50.59%
> >>> and a time benefit of 46.38%.
> >>> For Scenario 2, optimized code can achieve an instruction count benef=
it of
> >>> 1.6% and a time benefit of 4.5%.
> >>> For Scenario 3, since all the PTEs have neither the young nor the dir=
ty
> >>> flag, the branches taken by optimized code should be the same as thos=
e of
> >>> the original code. In fact, the test results of optimized code seem t=
o be
> >>> closer to those of the original code.
> >>
> >> I re-ran these tests on Apple M2 with 4K base pages + 64K mTHP.
> >>
> >> Scenario 1: reduced to 56% of baseline execution time
> >> Scenario 2: reduced to 89% of baseline execution time
> >> Scenario 3: reduced to 91% of baseline execution time
> >>
> >> I'm pretty amazed that scenario 3 got faster given it is doing the sam=
e number
> >> of loops.
> >
> > It seems that the data you obtained is similar to my test data. For
> > scenario 3, it's
> > faster even when running the same code, which I can't quite figure out =
either.
> >
> >>>
> >>> It can be proven through test function that the optimization for
> >>> contpte_ptep_get is effective. Since the logic of contpte_ptep_get_lo=
ckless
> >>> is similar to that of contpte_ptep_get, the same optimization scheme =
is
> >>> also adopted for it.
> >>>
> >>> Reviewed-by: Barry Song <baohua@kernel.org>
> >>> Signed-off-by: Xavier Xia <xavier_qy@163.com>
> >>
> >> I don't love the extra complexity, but this version is much tidier. Wh=
ile the
> >> micro-benchmark is clearly contrived, it shows that there will be case=
s where it
> >> will be faster and there are no cases where it is slower. This will pr=
obably be
> >> more valuable for 16K kernels because the number of PTEs in a contpte =
block is
> >> 128 there:
> >
> > Okay, this version has been revised multiple times based on your
> > previous feedback
> > and Barry's comments, and it seems much less complicated to understand =
now. :)
> >
> >>
> >> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> >> Tested-by: Ryan Roberts <ryan.roberts@arm.com>
> >>
> >>> ---
> >>> Changes in v6:
> >>> - Move prot =3D pte_pgprot(pte_mkold(pte_mkclean(pte))) into the cont=
pte_is_consistent(),
> >>>   as suggested by Barry.
> >>> - Link to v5: https://lore.kernel.org/all/20250509122728.2379466-1-xa=
vier_qy@163.com/
> >>>
> >>> Changes in v5:
> >>> - Replace macro CHECK_CONTPTE_CONSISTENCY with inline function contpt=
e_is_consistent
> >>>   for improved readability and clarity, as suggested by Barry.
> >>> - Link to v4: https://lore.kernel.org/all/20250508070353.2370826-1-xa=
vier_qy@163.com/
> >>>
> >>> Changes in v4:
> >>> - Convert macro CHECK_CONTPTE_FLAG to an internal loop for better rea=
dability.
> >>> - Refactor contpte_ptep_get_lockless using the same optimization logi=
c, as suggested by Ryan.
> >>> - Link to v3: https://lore.kernel.org/all/3d338f91.8c71.1965cd8b1b8.C=
oremail.xavier_qy@163.com/
> >>> ---
> >>>  arch/arm64/mm/contpte.c | 74 +++++++++++++++++++++++++++++++++++----=
--
> >>>  1 file changed, 64 insertions(+), 10 deletions(-)
> >>>
> >>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> >>> index bcac4f55f9c1..71efe7dff0ad 100644
> >>> --- a/arch/arm64/mm/contpte.c
> >>> +++ b/arch/arm64/mm/contpte.c
> >>> @@ -169,17 +169,46 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_=
pte)
> >>>       for (i =3D 0; i < CONT_PTES; i++, ptep++) {
> >>>               pte =3D __ptep_get(ptep);
> >>>
> >>> -             if (pte_dirty(pte))
> >>> +             if (pte_dirty(pte)) {
> >>>                       orig_pte =3D pte_mkdirty(orig_pte);
> >>> -
> >>> -             if (pte_young(pte))
> >>> +                     for (; i < CONT_PTES; i++, ptep++) {
> >>> +                             pte =3D __ptep_get(ptep);
> >>> +                             if (pte_young(pte)) {
> >>> +                                     orig_pte =3D pte_mkyoung(orig_p=
te);
> >>> +                                     break;
> >>> +                             }
> >>> +                     }
> >>> +                     break;
> >>> +             }
> >>> +
> >>> +             if (pte_young(pte)) {
> >>>                       orig_pte =3D pte_mkyoung(orig_pte);
> >>> +                     i++;
> >>> +                     ptep++;
> >>> +                     for (; i < CONT_PTES; i++, ptep++) {
> >>> +                             pte =3D __ptep_get(ptep);
> >>> +                             if (pte_dirty(pte)) {
> >>> +                                     orig_pte =3D pte_mkdirty(orig_p=
te);
> >>> +                                     break;
> >>> +                             }
> >>> +                     }
> >>> +                     break;
> >>> +             }
> >>>       }
> >>>
> >>>       return orig_pte;
> >>>  }
> >>>  EXPORT_SYMBOL_GPL(contpte_ptep_get);
> >>>
> >>> +static inline bool contpte_is_consistent(pte_t pte, unsigned long pf=
n,
> >>> +                                     pgprot_t orig_prot)
> >>> +{
> >>> +     pgprot_t prot =3D pte_pgprot(pte_mkold(pte_mkclean(pte)));
> >>> +
> >>> +     return pte_valid_cont(pte) && pte_pfn(pte) =3D=3D pfn &&
> >>> +                     pgprot_val(prot) =3D=3D pgprot_val(orig_prot);
> >>> +}
> >>> +
> >>>  pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
> >>>  {
> >>>       /*
> >>> @@ -202,7 +231,6 @@ pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
> >>>       pgprot_t orig_prot;
> >>>       unsigned long pfn;
> >>>       pte_t orig_pte;
> >>> -     pgprot_t prot;
> >>>       pte_t *ptep;
> >>>       pte_t pte;
> >>>       int i;
> >>> @@ -219,18 +247,44 @@ pte_t contpte_ptep_get_lockless(pte_t *orig_pte=
p)
> >>>
> >>>       for (i =3D 0; i < CONT_PTES; i++, ptep++, pfn++) {
> >>>               pte =3D __ptep_get(ptep);
> >>> -             prot =3D pte_pgprot(pte_mkold(pte_mkclean(pte)));
> >>>
> >>> -             if (!pte_valid_cont(pte) ||
> >>> -                pte_pfn(pte) !=3D pfn ||
> >>> -                pgprot_val(prot) !=3D pgprot_val(orig_prot))
> >>> +             if (!contpte_is_consistent(pte, pfn, orig_prot))
> >>>                       goto retry;
> >>>
> >>> -             if (pte_dirty(pte))
> >>> +             if (pte_dirty(pte)) {
> >>>                       orig_pte =3D pte_mkdirty(orig_pte);
> >>> +                     for (; i < CONT_PTES; i++, ptep++, pfn++) {
> >>> +                             pte =3D __ptep_get(ptep);
> >>> +
> >>> +                             if (!contpte_is_consistent(pte, pfn, or=
ig_prot))
> >>> +                                     goto retry;
> >>> +
> >>> +                             if (pte_young(pte)) {
> >>> +                                     orig_pte =3D pte_mkyoung(orig_p=
te);
> >>> +                                     break;
> >>> +                             }
> >>> +                     }
> >>> +                     break;
> >>
> >> I considered for a while whether it is safe for contpte_ptep_get_lockl=
ess() to
> >> exit early having not seen every PTE in the contpte block and confirme=
d that
> >> they are all consistent. I eventually concluded that it is, as long as=
 all the
> >> PTEs that it does check are consistent I believe this is fine.
> >
> > So, it looks like my changes here will be okay.
> >
> >>
> >>> +             }
> >>>
> >>> -             if (pte_young(pte))
> >>> +             if (pte_young(pte)) {
> >>>                       orig_pte =3D pte_mkyoung(orig_pte);
> >>> +                     i++;
> >>> +                     ptep++;
> >>> +                     pfn++;
> >>> +                     for (; i < CONT_PTES; i++, ptep++, pfn++) {
> >>> +                             pte =3D __ptep_get(ptep);
> >>> +
> >>> +                             if (!contpte_is_consistent(pte, pfn, or=
ig_prot))
> >>> +                                     goto retry;
> >>> +
> >>> +                             if (pte_dirty(pte)) {
> >>> +                                     orig_pte =3D pte_mkdirty(orig_p=
te);
> >>> +                                     break;
> >>> +                             }
> >>> +                     }
> >>> +                     break;
> >>> +             }
> >>>       }
> >>>
> >>>       return orig_pte;
> >>
>

