Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566B2C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 23:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMJjwbFob2j9uVvUPyLSbsFKQ78+Yo3uN+6VyHo6BnA=; b=DGm/T9TSS7FPYgPyXJyFOoKlb6
	G726YBVcdwRqcdCWCdWsJN85EzqgRoFv+AGT/xjC7thtQbQ/OlTDhAJuqrUwbPbr2izeiKssYr8dm
	vcaEwotnjd9FdXrhVAdDwz/11ado4mswYLB2/m9tjHWC5CK2qFaZ5uZvRPvwymwsvU4jQymONvkkB
	Odh5pUjLaBROgRBiG5TzUVORRPMGUGtrmD41G8IegG2I0giYu5pFCf5DTZRe1vl1baOH+zMAc8qgp
	gN2jWEJLg+fIsFabwtckevCq+n7o1eD5HTNMt11T6y5vi+uS9uwMhi+BJWd1izt72obHfnsZkRYEJ
	T2+rz0YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAGiT-0000000EF2B-2VAj;
	Wed, 30 Apr 2025 23:19:49 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAGgW-0000000EEph-1lsZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 23:17:49 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-4c31c219bf8so118900137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 16:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746055067; x=1746659867; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMJjwbFob2j9uVvUPyLSbsFKQ78+Yo3uN+6VyHo6BnA=;
        b=MmdOa7Upkp8st5/CeJzd1Mag3pfkjWu1yPSpuxHfYMBaLZ0sNcy1n0tiDnxE07nwGZ
         lWvuzMFvLOTauJHrTcEO9XhpFwuOSb8kkbSy4MuyQJ2zS0ox6D8grTK4fMn/bU+jkIQy
         pqEuGIrc4ge9atVuiDvROP+4UY8ngR2SE0Hp3WZzbFzzSHTe3407bteQl+lmqbpW/tnh
         ixV8cqN9jWG7BbWu72pCJiJqlKbM89Kdst7MKZh5RdbiF+zSF26l6PLdzgaVmzpRJ1V5
         CzdxNUPyam+kfhvMTsYYMNZNOlk+SQJnyuxc7mFglfmdP8yrgh/Me1UKvSO66f04tr6Y
         0BGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746055067; x=1746659867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMJjwbFob2j9uVvUPyLSbsFKQ78+Yo3uN+6VyHo6BnA=;
        b=QmueCUk/GrzAf9GQDkuPyRw8wWoyE4p+gDuIi7lZdUjdutgGndeZE5aT+RLFagWGWM
         HQI515kMWXr/h5DplXG0XW9e7bxd82wJiMRg7N4iiFeh3q2KqBxgZk2bOwXMmc2yK4ff
         WX1ISnesDMw9VMt/4+JJq9q5SB7dDmF7RozOX6Spz32myekl7tq4gXUWJHRTB/rtMNc8
         WzQDhePLeNyjUJBDEzxz9wTTAHjLOC1WNO+E9dmvz9kDAzy11E7xsLRDrmwkl2DrpLEE
         5Fqlwww12UBJ5eFvNf0mZDcVLzuC4WzI+CcqJZEhJ0NwI5iPvM3189m11ksOsW9g5mK4
         0w5w==
X-Forwarded-Encrypted: i=1; AJvYcCXaXqyfr2hAEDZcJRuUa74DvoEZBD86B6jZO7a1i/NiP47BoDbOQ9/Vwj2mDYumno+rFH8XtooZ23zvFHJvtMXC@lists.infradead.org
X-Gm-Message-State: AOJu0YwPNJLyClWtJqUJMwwpRR7kVBL91wkz51Q8LD3UZiOHVu5ITbHb
	iNRpDb0s6ApnKMU3uwMUCIhSRdbmYaOI9i/kDb1C3+UN8cVImRvRdTzJYVH4I7ON3e/a2Wy4TQM
	d5PJ04GLJjuXpiMVwAVexwByJd0o=
X-Gm-Gg: ASbGnculhIs7yR/Fj8/Thqq673qHk8cCIclKpDhNLdFk2QcN5SkH0DQ0OVlAp+WyIbL
	LMOwCb7CMkJ7XXdyQPi9POJX/micR4a3kAEB7EnqZ1KeWM3OyrejyRlcWhHgOWW9YZituFUKEcb
	vnh+6SYVjYLvMPRZ4h8KrWg/ah6KOKISUD
X-Google-Smtp-Source: AGHT+IHAA/waQcD+3hxTdxKRpBkAYVVBUimMufv/32HoNIa9AqwpHaAsPbictoZi3Fd+OWzRdB1CAALwrqwqZnkvdeI=
X-Received: by 2002:a05:6102:419e:b0:4c1:86bc:f959 with SMTP id
 ada2fe7eead31-4dad4908a42mr4199200137.8.1746055066988; Wed, 30 Apr 2025
 16:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <f0e109c7-6bb2-4218-bc76-c5de39184064@arm.com> <20250415082205.2249918-1-xavier_qy@163.com>
 <20250415082205.2249918-2-xavier_qy@163.com> <eba7a8fa-0b85-4b30-ab3e-9c0a65b7dc80@arm.com>
 <3d338f91.8c71.1965cd8b1b8.Coremail.xavier_qy@163.com>
In-Reply-To: <3d338f91.8c71.1965cd8b1b8.Coremail.xavier_qy@163.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 1 May 2025 11:17:36 +1200
X-Gm-Features: ATxdqUFXh3YdyU0-rztRQ7pM2vEUs5U0Cj5bSFkPEYsEBo8shrXPHJ00fd8j578
Message-ID: <CAGsJ_4yGuH4vOFSZM2o3-Nev4DnZmzWKUh7CRXxA2U-FT2W0xA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250430_161748_464538_9A3F0907 
X-CRM114-Status: GOOD (  34.26  )
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

On Tue, Apr 22, 2025 at 9:34=E2=80=AFPM Xavier <xavier_qy@163.com> wrote:
>
>
> Hi all,
>
>
> At 2025-04-16 20:54:47, "Ryan Roberts" <ryan.roberts@arm.com> wrote:
> >On 15/04/2025 09:22, Xavier wrote:
> >> This commit optimizes the contpte_ptep_get function by adding early
> >>  termination logic. It checks if the dirty and young bits of orig_pte
> >>  are already set and skips redundant bit-setting operations during
> >>  the loop. This reduces unnecessary iterations and improves performanc=
e.
> >>
> >> Signed-off-by: Xavier <xavier_qy@163.com>
> >> ---
> >>  arch/arm64/mm/contpte.c | 20 ++++++++++++++++++--
> >>  1 file changed, 18 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> >> index bcac4f55f9c1..0acfee604947 100644
> >> --- a/arch/arm64/mm/contpte.c
> >> +++ b/arch/arm64/mm/contpte.c
> >> @@ -152,6 +152,16 @@ void __contpte_try_unfold(struct mm_struct *mm, u=
nsigned long addr,
> >>  }
> >>  EXPORT_SYMBOL_GPL(__contpte_try_unfold);
> >>
> >> +/* Note: in order to improve efficiency, using this macro will modify=
 the
> >> + * passed-in parameters.*/
> >> +#define CHECK_CONTPTE_FLAG(start, ptep, orig_pte, flag) \
> >> +    for (; (start) < CONT_PTES; (start)++, (ptep)++) { \
> >> +            if (pte_##flag(__ptep_get(ptep))) { \
> >> +                            orig_pte =3D pte_mk##flag(orig_pte); \
> >> +                            break; \
> >> +            } \
> >> +    }
> >
> >I'm really not a fan of this macro, it just obfuscates what is going on.=
 I'd
> >personally prefer to see the 2 extra loops open coded below.
> >
> >Or even better, could you provide results comparing this 3 loop version =
to the
> >simpler approach I suggested previously? If the performance is similar (=
which I
> >expect it will be, especially given Barry's point that your test always =
ensures
> >the first PTE is both young and dirty) then I'd prefer to go with the si=
mpler code.
> >
>
> Based on the discussions in the previous email, two modifications were ad=
opted
> and tested, and the results are as follows:
>
> Modification 1
>
> pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
> {
>         pte_t pte;
>         int i;
>
>         ptep =3D contpte_align_down(ptep);
>
>         for (i =3D 0; i < CONT_PTES; i++, ptep++) {
>                 pte =3D __ptep_get(ptep);
>
>                 if (pte_dirty(pte)) {
>                         orig_pte =3D pte_mkdirty(orig_pte);
>                         if (pte_young(orig_pte))
>                                 break;
>                 }
>
>                 if (pte_young(pte)) {
>                         orig_pte =3D pte_mkyoung(orig_pte);
>                         if (pte_dirty(orig_pte))
>                                 break;
>                 }
>         }
>
>         return orig_pte;
> }
>
> Modification 2
>
> pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
> {
>         pte_t pte;
>         int i;
>
>         ptep =3D contpte_align_down(ptep);
>
>         for (i =3D 0; i < CONT_PTES; i++, ptep++) {
>                 pte =3D __ptep_get(ptep);
>
>                 if (pte_dirty(pte)) {
>                         orig_pte =3D pte_mkdirty(orig_pte);
>                         for (; i < CONT_PTES; i++, ptep++) {
>                                 pte =3D __ptep_get(ptep);
>                                 if (pte_young(pte)) {
>                                         orig_pte =3D pte_mkyoung(orig_pte=
);
>                                         break;
>                                 }
>                         }
>                         break;
>                 }
>
>                 if (pte_young(pte)) {
>                         orig_pte =3D pte_mkyoung(orig_pte);
>                         i++;
>                         ptep++;
>                         for (; i < CONT_PTES; i++, ptep++) {
>                                 pte =3D __ptep_get(ptep);
>                                 if (pte_dirty(pte)) {
>                                         orig_pte =3D pte_mkdirty(orig_pte=
);
>                                         break;
>                                 }
>                         }
>                         break;
>                 }
>         }
>
>         return orig_pte;
> }
>
> Test Code:
>
> #define PAGE_SIZE 4096
> #define CONT_PTES 16
> #define TEST_SIZE (4096* CONT_PTES * PAGE_SIZE)
> #define YOUNG_BIT 8
> void rwdata(char *buf)
> {
>         for (size_t i =3D 0; i < TEST_SIZE; i +=3D PAGE_SIZE) {
>                 buf[i] =3D 'a';
>                 volatile char c =3D buf[i];
>         }
> }
> void clear_young_dirty(char *buf)
> {
>         if (madvise(buf, TEST_SIZE, MADV_FREE) =3D=3D -1) {
>                 perror("madvise free failed");
>                 free(buf);
>                 exit(EXIT_FAILURE);
>         }
>         if (madvise(buf, TEST_SIZE, MADV_COLD) =3D=3D -1) {
>                 perror("madvise free failed");
>                 free(buf);
>                 exit(EXIT_FAILURE);
>         }
> }
> void set_one_young(char *buf)
> {
>         for (size_t i =3D 0; i < TEST_SIZE; i +=3D CONT_PTES * PAGE_SIZE)=
 {
>                 volatile char c =3D buf[i + YOUNG_BIT * PAGE_SIZE];
>         }
> }
>
> void test_contpte_perf() {
>         char *buf;
>         int ret =3D posix_memalign((void **)&buf, CONT_PTES * PAGE_SIZE, =
TEST_SIZE);
>         if ((ret !=3D 0) || ((unsigned long)buf % CONT_PTES * PAGE_SIZE))=
 {
>                 perror("posix_memalign failed");
>                 exit(EXIT_FAILURE);
>         }
>
>         rwdata(buf);
> #if TEST_CASE2 || TEST_CASE3
>         clear_young_dirty(buf);
> #endif
> #if TEST_CASE2
>         set_one_young(buf);
> #endif
>
>         for (int j =3D 0; j < 500; j++) {
>                 mlock(buf, TEST_SIZE);
>
>                 munlock(buf, TEST_SIZE);
>         }
>         free(buf);
> }
> ---
>
> Descriptions of three test scenarios
>
> Scenario 1
> The data of all 16 PTEs are both dirty and young.
> #define TEST_CASE2 0
> #define TEST_CASE3 0
>
> Scenario 2
> Among the 16 PTEs, only the 8th one is young, and there are no dirty ones=
.
> #define TEST_CASE2 1
> #define TEST_CASE3 0
>
> Scenario 3
> Among the 16 PTEs, there are neither young nor dirty ones.
> #define TEST_CASE2 0
> #define TEST_CASE3 1
>
>
> Test results
>
> |Scenario 1         |       Original|  Modification 1|  Modification 2|
> |-------------------|---------------|----------------|----------------|
> |instructions       |    37912436160|     18303833386|     18731580031|
> |test time          |         4.2797|          2.2687|          2.2949|
> |overhead of        |               |                |                |
> |contpte_ptep_get() |         21.31%|           4.72%|           4.80%|
>
> |Scenario 2         |       Original|  Modification 1|  Modification 2|
> |-------------------|---------------|----------------|----------------|
> |instructions       |    36701270862|     38729716276|     36115790086|
> |test time          |         3.2335|          3.5732|          3.0874|
> |Overhead of        |               |                |                |
> |contpte_ptep_get() |         32.26%|          41.35%|          33.57%|
>
> |Scenario 3         |       Original|  Modification 1|  Modification 2|
> |-------------------|---------------|----------------|----------------|
> |instructions       |    36706279735|     38305241759|     36750881878|
> |test time          |         3.2008|          3.5389|          3.1249|
> |Overhead of        |               |                |                |
> |contpte_ptep_get() |         31.94%|          41.30%|          34.59%|
>
>
> For Scenario 1, Modification 1 can achieve an instruction count benefit o=
f
> 51.72% and a time benefit of 46.99%. Modification 2 can achieve an instru=
ction
> benefit of 50.59% and a time benefit of 46.38%.
>
> For Scenarios 2, Modification 2 can achieve an instruction count benefit =
of
> 1.6% and a time benefit of 4.5%. while Modification 1 significantly incre=
ases
> the instructions and time due to additional conditional checks.
>
> For Scenario 3, since all the PTEs have neither the young nor the dirty f=
lag,
> the branches taken by Modification 1 and Modification 2 should be the sam=
e as
> those of the original code. In fact, the test results of Modification 2 s=
eem
> to be closer to those of the original code. I don't know why there is a
> performance regression in Modification 1.
>
> Therefore, I believe modifying the code according to Modification 2 can b=
ring
> maximum benefits. Everyone can discuss whether this approach is acceptabl=
e,
> and if so, I will send Patch V4 to proceed with submitting this modificat=
ion.
>

modification 2 is not correct. if pte0~pte14 are all young and no one
is dirty, we are
having lots of useless "for (; i < CONT_PTES; i++, ptep++)"

                 if (pte_young(pte)) {
                         orig_pte =3D pte_mkyoung(orig_pte);
                         i++;
                         ptep++;
                         for (; i < CONT_PTES; i++, ptep++) {
                                 pte =3D __ptep_get(ptep);
                                 if (pte_dirty(pte)) {
                                         orig_pte =3D pte_mkdirty(orig_pte)=
;
                                         break;
                                 }
                         }
                         break;
                 }

Thanks,
Xavier

