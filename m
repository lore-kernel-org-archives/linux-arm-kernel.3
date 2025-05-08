Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CE2C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 01:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVJzNTCKEauhBAcQiyH5AThCTr+uy9aWK1SGxWCuAN0=; b=O0Q9XfUu3Cn3XbZZEGlENyXVpu
	jzAPVeJv926d6yVt1cZItyqyef/+YUcD6mjvxskZ9PXMHXQ+UItfS4F9Zr3wMNbWxeajEW2kjmAu8
	9+0ETV2Nk4NYsgAuR8tyqu31P7gKRjUasY2MvVuI2VhT/dz8XL5C/Vply0b6bE3pDql3qKISo1f16
	JZdcmcRU9kYAlc32TEUuajsA6IaKuIbBOnUFxP0Y8LacJvsnhvneOmvrgx4Ohw2XJaAL8Otf5+rMQ
	la70nl/sn7CO/QNylgQrn7LwCA98X/lujQeo/F8Fu6b9rV2Cj0KdtDMKXELIlc43DpDZ2rr9fmwle
	aU27n9/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCq72-0000000H6Lm-1b7j;
	Thu, 08 May 2025 01:31:48 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCq54-0000000H6Ce-030E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 01:29:47 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-5259327a93bso130983e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 18:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746667784; x=1747272584; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVJzNTCKEauhBAcQiyH5AThCTr+uy9aWK1SGxWCuAN0=;
        b=TO9feiRJQsE1LO3930/fk9BKhZ3UH6Wz3qG2wiQXd3mjjCeH5oekn3bDjUJcMtKGi4
         rBUEDaIKl3YC0p6YqTT9/dXU7EkPrd6+jm0NRDBlIh6TE7sbrDYXv7jUaU1P8yxEmjml
         o+Scz1EnDZIkRWPzo+jlMEC95YuUzoQ7WIMIWOj4RINqmDLgq+iA361kGVvercGotsE3
         w9PlGtB9fZkHROtO7PyY9dqaxyQuxb2JMOP+cZkRWltAF3wLfL0jrmxMy73W7eFiFqXt
         OdSdIZVBY1Ic6Yz9M95Gpfhh9m+MJ40nZeXp6OH7j5GQtMvVIqGHdhOqeFx4kj/qF0Xr
         IdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746667784; x=1747272584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HVJzNTCKEauhBAcQiyH5AThCTr+uy9aWK1SGxWCuAN0=;
        b=U9wEiRBoztIx2SjgjVTpjwNfMohqfHNP5vqdQXAQSswlfO7YTs+KfUVqFCttCME/Cq
         ucL1kkSO2J6+NgIOo2UD5auVBytfQaVnvGlWHetAWaBiTooL42JfBiobPqXidgYHP6po
         PpSBRPoXjZQxylreyW3nBg5R6hXvcHh1RYz6Mo1huFP3llV3BaPddfaLX3iqmIJ5Ol8N
         Q0r1vr7BBSG6rxOr5n1V3xvpY4KapNPPr53wSNyqHkamSfkdPUF6umExHBPZ0COPy6W5
         u4X5/YDNuzrr4oFjRoxtISeVhdedRUg2JZGFi4LLL4hdNJkn43JqYuQefLIm+kl+an5P
         Kdog==
X-Forwarded-Encrypted: i=1; AJvYcCXI5mTBbv7LsdT8KeNqVvC+3ajqZK/pKvmTyqldycqtVgdGaMP1x/5T8Pg1W9jQMtnHiXsg89fMsoke4x3PB+0f@lists.infradead.org
X-Gm-Message-State: AOJu0YwMO1ctW+i7GsuUcMytIKcZXMOoA54JgF25tXbodYzA+NLJ5hop
	piUK5ZhTEjE5CmPat6Bcp8cP3Y8pgQNc3xq/79TO4hDyhdWi/YXRWiUiiYgKJwBbydeGqZ/pnjF
	PjSw7Xa+5i5Rp23BbBPom+LPDxI8=
X-Gm-Gg: ASbGnctH6N51Cz/6127QoIitUGdazy3LNS3CeNTryE4AOaLWS7dG6DiZZUzZy52xCv0
	E29wEGyvrMkFKVdIJEWiaYW2dzCDLVvG3K88UnAJJoxgDxIQxfikm0ge9YlFdW7eDK92tv5tYTv
	8WySKI8QZJuJp2vBXaaBaMhg==
X-Google-Smtp-Source: AGHT+IHgStb+NWeETA2WAAJKh7FpoD/R+H14jNrUYPJYK4dDnHHCkuB7EbVeH/lxQLNHjnZkeqV2P50przmWRQHomps=
X-Received: by 2002:a05:6122:168c:b0:520:3536:feb5 with SMTP id
 71dfb90a1353d-52c44224230mr1289143e0c.11.1746667783964; Wed, 07 May 2025
 18:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <f0e109c7-6bb2-4218-bc76-c5de39184064@arm.com> <20250415082205.2249918-1-xavier_qy@163.com>
 <20250415082205.2249918-2-xavier_qy@163.com> <eba7a8fa-0b85-4b30-ab3e-9c0a65b7dc80@arm.com>
 <3d338f91.8c71.1965cd8b1b8.Coremail.xavier_qy@163.com> <CAGsJ_4yGuH4vOFSZM2o3-Nev4DnZmzWKUh7CRXxA2U-FT2W0xA@mail.gmail.com>
 <1a8020d3.1f27.1968bdc27d8.Coremail.xavier_qy@163.com> <CAGsJ_4zKFiCEUnFjb3qThoM2FG4XCsmeU=JeTLDXjMU2KONu-Q@mail.gmail.com>
 <CAGsJ_4xVFDioe4G9wtjfRCKZMLBu94GaFG1z5j0YrHs3j1PkAw@mail.gmail.com> <5a98b8dc.755.1969929a1ea.Coremail.xavier_qy@163.com>
In-Reply-To: <5a98b8dc.755.1969929a1ea.Coremail.xavier_qy@163.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 8 May 2025 13:29:30 +1200
X-Gm-Features: ATxdqUFhlyl8SqQgJ0lXPoL-pbd7ZQNqvTin0Pnx-17OQStXuYTz0eR2gvvxI68
Message-ID: <CAGsJ_4wUZrxqdzObpEk_gpcHEO6e75ai=8q-fsv4eXN2wNEbOw@mail.gmail.com>
Subject: Re: [mm/contpte v3 1/1] mm/contpte: Optimize loop to reduce redundant operations
To: Xavier <xavier_qy@163.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, dev.jain@arm.com, ioworker0@gmail.com, 
	akpm@linux-foundation.org, catalin.marinas@arm.com, david@redhat.com, 
	gshan@redhat.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, will@kernel.org, willy@infradead.org, 
	ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_182946_063365_AAF25B77 
X-CRM114-Status: GOOD (  35.66  )
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

On Sun, May 4, 2025 at 2:56=E2=80=AFPM Xavier <xavier_qy@163.com> wrote:

> At 2025-05-02 05:32:50, "Barry Song" <21cnbao@gmail.com> wrote:
> >On Fri, May 2, 2025 at 9:19=E2=80=AFAM Barry Song <21cnbao@gmail.com> wr=
ote:
> >>
> >> On Fri, May 2, 2025 at 12:41=E2=80=AFAM Xavier <xavier_qy@163.com> wro=
te:
> >> >
> >> >
> >> >
> >> > Hi Barry,
> >> >
> >> >
> >> > At 2025-05-01 07:17:36, "Barry Song" <21cnbao@gmail.com> wrote:
> >> > >On Tue, Apr 22, 2025 at 9:34=E2=80=AFPM Xavier <xavier_qy@163.com> =
wrote:
> >> > >>
> >> > >>
> >> > >> Hi all,
> >> > >>
> >> > >>
> >> > >> At 2025-04-16 20:54:47, "Ryan Roberts" <ryan.roberts@arm.com> wro=
te:
> >> > >> >On 15/04/2025 09:22, Xavier wrote:
> >> > >> >> This commit optimizes the contpte_ptep_get function by adding =
early
> >> > >> >>  termination logic. It checks if the dirty and young bits of o=
rig_pte
> >> > >> >>  are already set and skips redundant bit-setting operations du=
ring
> >> > >> >>  the loop. This reduces unnecessary iterations and improves pe=
rformance.
> >> > >> >>
> >> > >> >> Signed-off-by: Xavier <xavier_qy@163.com>
> >> > >> >> ---
> >> > >> >>  arch/arm64/mm/contpte.c | 20 ++++++++++++++++++--
> >> > >> >>  1 file changed, 18 insertions(+), 2 deletions(-)
> >> > >> >>
> >> > >> >> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> >> > >> >> index bcac4f55f9c1..0acfee604947 100644
> >> > >> >> --- a/arch/arm64/mm/contpte.c
> >> > >> >> +++ b/arch/arm64/mm/contpte.c
> >> > >> >> @@ -152,6 +152,16 @@ void __contpte_try_unfold(struct mm_struc=
t *mm, unsigned long addr,
> >> > >> >>  }
> >> > >> >>  EXPORT_SYMBOL_GPL(__contpte_try_unfold);
> >> > >> >>
> >> > >> >> +/* Note: in order to improve efficiency, using this macro wil=
l modify the
> >> > >> >> + * passed-in parameters.*/
> >> > >> >> +#define CHECK_CONTPTE_FLAG(start, ptep, orig_pte, flag) \
> >> > >> >> +    for (; (start) < CONT_PTES; (start)++, (ptep)++) { \
> >> > >> >> +            if (pte_##flag(__ptep_get(ptep))) { \
> >> > >> >> +                            orig_pte =3D pte_mk##flag(orig_pt=
e); \
> >> > >> >> +                            break; \
> >> > >> >> +            } \
> >> > >> >> +    }
> >> > >> >
> >> > >> >I'm really not a fan of this macro, it just obfuscates what is g=
oing on. I'd
> >> > >> >personally prefer to see the 2 extra loops open coded below.
> >> > >> >
> >> > >> >Or even better, could you provide results comparing this 3 loop =
version to the
> >> > >> >simpler approach I suggested previously? If the performance is s=
imilar (which I
> >> > >> >expect it will be, especially given Barry's point that your test=
 always ensures
> >> > >> >the first PTE is both young and dirty) then I'd prefer to go wit=
h the simpler code.
> >> > >> >
> >> > >>
> >> > >> Based on the discussions in the previous email, two modifications=
 were adopted
> >> > >> and tested, and the results are as follows:
> >> > >>
> >> > >> Modification 1
> >> > >>
> >> > >> pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
> >> > >> {
> >> > >>         pte_t pte;
> >> > >>         int i;
> >> > >>
> >> > >>         ptep =3D contpte_align_down(ptep);
> >> > >>
> >> > >>         for (i =3D 0; i < CONT_PTES; i++, ptep++) {
> >> > >>                 pte =3D __ptep_get(ptep);
> >> > >>
> >> > >>                 if (pte_dirty(pte)) {
> >> > >>                         orig_pte =3D pte_mkdirty(orig_pte);
> >> > >>                         if (pte_young(orig_pte))
> >> > >>                                 break;
> >> > >>                 }
> >> > >>
> >> > >>                 if (pte_young(pte)) {
> >> > >>                         orig_pte =3D pte_mkyoung(orig_pte);
> >> > >>                         if (pte_dirty(orig_pte))
> >> > >>                                 break;
> >> > >>                 }
> >> > >>         }
> >> > >>
> >> > >>         return orig_pte;
> >> > >> }
> >> > >>
> >> > >> Modification 2
> >> > >>
> >> > >> pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
> >> > >> {
> >> > >>         pte_t pte;
> >> > >>         int i;
> >> > >>
> >> > >>         ptep =3D contpte_align_down(ptep);
> >> > >>
> >> > >>         for (i =3D 0; i < CONT_PTES; i++, ptep++) {
> >> > >>                 pte =3D __ptep_get(ptep);
> >> > >>
> >> > >>                 if (pte_dirty(pte)) {
> >> > >>                         orig_pte =3D pte_mkdirty(orig_pte);
> >> > >>                         for (; i < CONT_PTES; i++, ptep++) {
> >> > >>                                 pte =3D __ptep_get(ptep);
> >> > >>                                 if (pte_young(pte)) {
> >> > >>                                         orig_pte =3D pte_mkyoung(=
orig_pte);
> >> > >>                                         break;
> >> > >>                                 }
> >> > >>                         }
> >> > >>                         break;
> >> > >>                 }
> >> > >>
> >> > >>                 if (pte_young(pte)) {
> >> > >>                         orig_pte =3D pte_mkyoung(orig_pte);
> >> > >>                         i++;
> >> > >>                         ptep++;
> >> > >>                         for (; i < CONT_PTES; i++, ptep++) {
> >> > >>                                 pte =3D __ptep_get(ptep);
> >> > >>                                 if (pte_dirty(pte)) {
> >> > >>                                         orig_pte =3D pte_mkdirty(=
orig_pte);
> >> > >>                                         break;
> >> > >>                                 }
> >> > >>                         }
> >> > >>                         break;
> >> > >>                 }
> >> > >>         }
> >> > >>
> >> > >>         return orig_pte;
> >> > >> }
> >> > >>
> >> > >> Test Code:
> >> > >>
> >> > >> #define PAGE_SIZE 4096
> >> > >> #define CONT_PTES 16
> >> > >> #define TEST_SIZE (4096* CONT_PTES * PAGE_SIZE)
> >> > >> #define YOUNG_BIT 8
> >> > >> void rwdata(char *buf)
> >> > >> {
> >> > >>         for (size_t i =3D 0; i < TEST_SIZE; i +=3D PAGE_SIZE) {
> >> > >>                 buf[i] =3D 'a';
> >> > >>                 volatile char c =3D buf[i];
> >> > >>         }
> >> > >> }
> >> > >> void clear_young_dirty(char *buf)
> >> > >> {
> >> > >>         if (madvise(buf, TEST_SIZE, MADV_FREE) =3D=3D -1) {
> >> > >>                 perror("madvise free failed");
> >> > >>                 free(buf);
> >> > >>                 exit(EXIT_FAILURE);
> >> > >>         }
> >> > >>         if (madvise(buf, TEST_SIZE, MADV_COLD) =3D=3D -1) {
> >> > >>                 perror("madvise free failed");
> >> > >>                 free(buf);
> >> > >>                 exit(EXIT_FAILURE);
> >> > >>         }
> >> > >> }
> >> > >> void set_one_young(char *buf)
> >> > >> {
> >> > >>         for (size_t i =3D 0; i < TEST_SIZE; i +=3D CONT_PTES * PA=
GE_SIZE) {
> >> > >>                 volatile char c =3D buf[i + YOUNG_BIT * PAGE_SIZE=
];
> >> > >>         }
> >> > >> }
> >> > >>
> >> > >> void test_contpte_perf() {
> >> > >>         char *buf;
> >> > >>         int ret =3D posix_memalign((void **)&buf, CONT_PTES * PAG=
E_SIZE, TEST_SIZE);
> >> > >>         if ((ret !=3D 0) || ((unsigned long)buf % CONT_PTES * PAG=
E_SIZE)) {
> >> > >>                 perror("posix_memalign failed");
> >> > >>                 exit(EXIT_FAILURE);
> >> > >>         }
> >> > >>
> >> > >>         rwdata(buf);
> >> > >> #if TEST_CASE2 || TEST_CASE3
> >> > >>         clear_young_dirty(buf);
> >> > >> #endif
> >> > >> #if TEST_CASE2
> >> > >>         set_one_young(buf);
> >> > >> #endif
> >> > >>
> >> > >>         for (int j =3D 0; j < 500; j++) {
> >> > >>                 mlock(buf, TEST_SIZE);
> >> > >>
> >> > >>                 munlock(buf, TEST_SIZE);
> >> > >>         }
> >> > >>         free(buf);
> >> > >> }
> >> > >> ---
> >> > >>
> >> > >> Descriptions of three test scenarios
> >> > >>
> >> > >> Scenario 1
> >> > >> The data of all 16 PTEs are both dirty and young.
> >> > >> #define TEST_CASE2 0
> >> > >> #define TEST_CASE3 0
> >> > >>
> >> > >> Scenario 2
> >> > >> Among the 16 PTEs, only the 8th one is young, and there are no di=
rty ones.
> >> > >> #define TEST_CASE2 1
> >> > >> #define TEST_CASE3 0
> >> > >>
> >> > >> Scenario 3
> >> > >> Among the 16 PTEs, there are neither young nor dirty ones.
> >> > >> #define TEST_CASE2 0
> >> > >> #define TEST_CASE3 1
> >> > >>
> >> > >>
> >> > >> Test results
> >> > >>
> >> > >> |Scenario 1         |       Original|  Modification 1|  Modificat=
ion 2|
> >> > >> |-------------------|---------------|----------------|-----------=
-----|
> >> > >> |instructions       |    37912436160|     18303833386|     187315=
80031|
> >> > >> |test time          |         4.2797|          2.2687|          2=
.2949|
> >> > >> |overhead of        |               |                |           =
     |
> >> > >> |contpte_ptep_get() |         21.31%|           4.72%|           =
4.80%|
> >> > >>
> >> > >> |Scenario 2         |       Original|  Modification 1|  Modificat=
ion 2|
> >> > >> |-------------------|---------------|----------------|-----------=
-----|
> >> > >> |instructions       |    36701270862|     38729716276|     361157=
90086|
> >> > >> |test time          |         3.2335|          3.5732|          3=
.0874|
> >> > >> |Overhead of        |               |                |           =
     |
> >> > >> |contpte_ptep_get() |         32.26%|          41.35%|          3=
3.57%|
> >> > >>
> >> > >> |Scenario 3         |       Original|  Modification 1|  Modificat=
ion 2|
> >> > >> |-------------------|---------------|----------------|-----------=
-----|
> >> > >> |instructions       |    36706279735|     38305241759|     367508=
81878|
> >> > >> |test time          |         3.2008|          3.5389|          3=
.1249|
> >> > >> |Overhead of        |               |                |           =
     |
> >> > >> |contpte_ptep_get() |         31.94%|          41.30%|          3=
4.59%|
> >> > >>
> >> > >>
> >> > >> For Scenario 1, Modification 1 can achieve an instruction count b=
enefit of
> >> > >> 51.72% and a time benefit of 46.99%. Modification 2 can achieve a=
n instruction
> >> > >> benefit of 50.59% and a time benefit of 46.38%.
> >> > >>
> >> > >> For Scenarios 2, Modification 2 can achieve an instruction count =
benefit of
> >> > >> 1.6% and a time benefit of 4.5%. while Modification 1 significant=
ly increases
> >> > >> the instructions and time due to additional conditional checks.
> >> > >>
> >> > >> For Scenario 3, since all the PTEs have neither the young nor the=
 dirty flag,
> >> > >> the branches taken by Modification 1 and Modification 2 should be=
 the same as
> >> > >> those of the original code. In fact, the test results of Modifica=
tion 2 seem
> >> > >> to be closer to those of the original code. I don't know why ther=
e is a
> >> > >> performance regression in Modification 1.
> >> > >>
> >> > >> Therefore, I believe modifying the code according to Modification=
 2 can bring
> >> > >> maximum benefits. Everyone can discuss whether this approach is a=
cceptable,
> >> > >> and if so, I will send Patch V4 to proceed with submitting this m=
odification.
> >> > >>
> >> > >
> >> > >modification 2 is not correct. if pte0~pte14 are all young and no o=
ne
> >> > >is dirty, we are
> >> > >having lots of useless "for (; i < CONT_PTES; i++, ptep++)"
> >> > >
> >> > >                 if (pte_young(pte)) {
> >> > >                         orig_pte =3D pte_mkyoung(orig_pte);
> >> > >                         i++;
> >> > >                         ptep++;
> >> > >                         for (; i < CONT_PTES; i++, ptep++) {
> >> > >                                 pte =3D __ptep_get(ptep);
> >> > >                                 if (pte_dirty(pte)) {
> >> > >                                         orig_pte =3D pte_mkdirty(o=
rig_pte);
> >> > >                                         break;
> >> > >                                 }
> >> > >                         }
> >> > >                         break;
> >> > >                 }
> >> > >
> >> >
> >> > I didn't understand which part you referred to when you said there w=
ere a lot of
> >> > useless loops. According to the scenario you mentioned, "if pte0~pte=
14 are all
> >> > young and no one is dirty", Modification 2 will enter the following =
branch when
> >> > judging pte0:
> >> >
> >> > if (pte_young(pte)) {
> >> >         orig_pte =3D pte_mkyoung(orig_pte);
> >> >         // The dirty status of pte0 has already been checked, skip i=
t.
> >> >         i++;
> >> >         ptep++;
> >> >         // Then we only need to check whether pte1~pte15 are dirty.
> >> >         for (; i < CONT_PTES; i++, ptep++) {
> >> >                 pte =3D __ptep_get(ptep);
> >> >                 if (pte_dirty(pte)) {
> >> >                         // Exit as soon as a dirty entry is found.
> >> >                         orig_pte =3D pte_mkdirty(orig_pte);
> >> >                         break;
> >> >                 }
> >> >         }
> >> >         // Exit directly here without going through the outer loop a=
gain.
> >> >         break;
> >> > }
> >> >
> >> > In this scenario, the total number of judgments in Modification 2 is=
 nearly half less
> >> > than that of the original code. I should have understood it correctl=
y, right?
> >>
> >> You're right=E2=80=94I missed the part where you're also taking a brea=
k, even though
> >> no one is dirty. Based on your data, modification 2 seems to be good.
> >>
> >> But I don't quite understand why you are doing
> >>          i++;
> >>          ptep++;
> >> before for (; i < CONT_PTES; i++, ptep++).
> >>
> >> it seems to be wrong. if i=3D=3D15, you will get i=3D16. you are skipp=
ing
> >> the pte_dirty
> >> check for i=3D=3D15. it is also true for any value between 0 and 15. M=
y
> >> point is that
> >> you should drop it and re-test.
> >
> >Sorry, I missed that you already checked pte_dirty(pte) before calling
> >pte_young(). So please ignore my comment. The code's a bit hard to
> >follow now. :-)
> >
>
> The modification 2 is indeed a bit difficult to understand, but this is a=
lso to improve
> the execution efficiency. Thanks for your careful review. :-)

Agreed. Personally, I have no objections to Modification 2, as it demonstra=
tes
performance improvements in nearly all cases according to your data.

>
> --
> Thanks,
> Xavier

Thanks
Barry

