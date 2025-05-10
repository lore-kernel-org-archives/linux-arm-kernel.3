Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77962C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 07:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nx0wskzF7lPGM0fMaqGpAOnWB1jjL0vEOGxjCFWL2CA=; b=QQiU/c9DLtPwGQLK6HKguqt0Hd
	5eFU2dNVEWAawip1HZxZLN3dojiUirhW08+Q/W5Q8vrJE8GDzeRsQ7VeyCgRqzY3CkjrngwfohQ8x
	BUsoM1LHEjq6XMNcNUJztf+GTPKJhlSLHX4sbcraelB8Jfuul0HVkO07o5G7G1+uRbORyudjWuKOL
	WoxSbUIq6syh7ij+9RykJvo2AkZjGO74L76x2LQyFoqZKRhGJmSvmn5Hr/72Uf2S9czCCr60oh3Dq
	xCabiKNA/LVC6og/BBNS1buB3hgN4u73bMH5Qt9+jnP62gatOl2nBNqu0Ihhq7CVwhYE1TLgai/h4
	h2cLkirw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDeYB-00000005Xt1-2WAm;
	Sat, 10 May 2025 07:23:11 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDeW6-00000005Xo4-3fGO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 07:21:04 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-4ddac386a29so1097468137.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 May 2025 00:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746861661; x=1747466461; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nx0wskzF7lPGM0fMaqGpAOnWB1jjL0vEOGxjCFWL2CA=;
        b=Pi9MlG0t23isH32L3rNqj4ZOZNlvAbabXcWwrIjOqttXI1JDGQMl06LscL2sqhMjbX
         ZSqM03SR/I/jYI8FrYnWq37tKDLAfXit4T0attP1R58BhaakJaT5f3owo0tyGZQhebrg
         cy3sLxQIiXE6VVH8Vx35mTnQRIaqhhw9viutP6eY3vX1FVfFxFeXm4yzlMwTaLLaQRl4
         bF8HyLPBE1q/ZFnkZB10IuXqRrmQvJtber5vkJxqCtKYyMyRa3JjgoAjFzqwFTxsX6ZD
         KS0iDpitiEsHtQM/MIANu5GUfa6lsSRvPls0JxhkiNze5RGNRA0uTILul8dqxy6ezIbP
         ksyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746861661; x=1747466461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nx0wskzF7lPGM0fMaqGpAOnWB1jjL0vEOGxjCFWL2CA=;
        b=qIYbqzA89dEmhFusurxPKnksIO94OgG1fa0MpC/WTKvCXkUW49BEGetWLi2V03UsnQ
         YGuZZmaCd9HGq9vqjSvUE3wgnQtE97jI4tS9Z/Q48hULd+rhD72kROvlxF2Sn0VOIPVe
         FugiCdkMd2umGPhbNaTAMxQZmFnIeZR7+ZeFcFs8kE1VVnMIzEOWWMUdj6DLJH6yXe7e
         Yu4pIGi2QEM8m3YCNyMh9IWwa/Ab/vixJexQmOgazgVBBGO+0qB16rY9+O7GOHZz6AOb
         Cjl1MNy5NaZy1qmjHmSRVkuGT/35ZdS9pJ1ySVpcYFLJhQr2mprO3UhSM9yJpkcpUmKl
         QaJg==
X-Forwarded-Encrypted: i=1; AJvYcCXT3N83BtXPFumTNuAZ6aTivdOJENhvlEBAtL4bKL7lcyhXHTtXCNR3kE1Trd1DUWiBR/e/2ekZKacHQKuBkSFh@lists.infradead.org
X-Gm-Message-State: AOJu0YwHIHZc7eKHl6bYHQX0N723wVrRXPbrDS2AvcI16k6MRo+jB/p7
	dqkmIOD9R2CZxYF5iTDOIrB3ix83do8iDr2Z2AqoFtKwqEZ3o7D5gZcEzbGKFi2sgqCc0HKT/lP
	+7wkNnpm4X/vduB/3Mp1uO5hSjr4=
X-Gm-Gg: ASbGncsSKK7GZEitbzF2SgF46odIrU/S7eB3PEnuiofH5fml2MiUve+5V/paT84zjF6
	LsDZR8/yhmIfjlPsLYM8D+E7TQX6+aYx/CPXrECV9M5NYHBlWfAYVC3LE7mgGJyuJA2W8ErkG1C
	6lvj1pyCTaZWwYoOsaoPLBaKqSI45XNbex
X-Google-Smtp-Source: AGHT+IEXt5Ti5lUKkwRizUaWKeNerJpTRxZbpXYZNKWbPsLAOVGRmqul4dHQTeyVgguhthUDBeVC9TXVsHxKNX1to+o=
X-Received: by 2002:a05:6102:2c02:b0:4c1:8e07:40b8 with SMTP id
 ada2fe7eead31-4deed351f3dmr5634823137.6.1746861661022; Sat, 10 May 2025
 00:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250509122728.2379466-1-xavier_qy@163.com>
In-Reply-To: <20250509122728.2379466-1-xavier_qy@163.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 10 May 2025 15:20:48 +0800
X-Gm-Features: AX0GCFu_9RLyhTvQzpH-ZFel8zAHIad0gLC9B7J4ICA2NdsZuGGJzgfDT2omyvY
Message-ID: <CAGsJ_4wq0HD=Q-URO766zz=M8yyUxauhRoF9CTDkAgE5Favg-A@mail.gmail.com>
Subject: Re: [PATCH v5] arm64/mm: Optimize loop to reduce redundant operations
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
X-CRM114-CacheID: sfid-20250510_002102_917671_2E4F7527 
X-CRM114-Status: GOOD (  33.79  )
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

On Fri, May 9, 2025 at 8:29=E2=80=AFPM Xavier Xia <xavier_qy@163.com> wrote=
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


You can probably consolidate the logic below into contpte_is_consistent(), =
which
would allow you to

1. Eliminate the repeated pattern: prot =3D
pte_pgprot(pte_mkold(pte_mkclean(pte)))
2. Remove the argument  "pgprot_t prot" for contpte_is_consistent().

 +                               prot =3D pte_pgprot(pte_mkold(pte_mkclean(=
pte)));
 +
 +                               if (!contpte_is_consistent(pte, pfn,
prot, orig_prot))
 +                                       goto retry;

If performance takes precedence over code simplicity, and you're planning t=
o
send a new version with the above refinements, feel free to include:

Reviewed-by: Barry Song <baohua@kernel.org>

> ---
> Changes in v5:
> - Replace macro CHECK_CONTPTE_CONSISTENCY with inline function contpte_is=
_consistent
>   for improved readability and clarity, as suggested by Barry.
> - Link to v4: https://lore.kernel.org/all/20250508070353.2370826-1-xavier=
_qy@163.com/
>
> Changes in v4:
> - Convert macro CHECK_CONTPTE_FLAG to an internal loop for better readabi=
lity.
> - Refactor contpte_ptep_get_lockless using the same optimization logic, a=
s suggested by Ryan.
> - Link to v3: https://lore.kernel.org/all/3d338f91.8c71.1965cd8b1b8.Corem=
ail.xavier_qy@163.com/
> ---
>  arch/arm64/mm/contpte.c | 74 ++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 65 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index bcac4f55f9c1..1037450b68e9 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -169,17 +169,44 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
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
> +static inline bool contpte_is_consistent(pte_t pte, unsigned long pfn,
> +                                       pgprot_t prot, pgprot_t orig_prot=
)
> +{
> +       return pte_valid_cont(pte) && pte_pfn(pte) =3D=3D pfn &&
> +                       pgprot_val(prot) =3D=3D pgprot_val(orig_prot);
> +}
> +
>  pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
>  {
>         /*
> @@ -221,16 +248,45 @@ pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
>                 pte =3D __ptep_get(ptep);
>                 prot =3D pte_pgprot(pte_mkold(pte_mkclean(pte)));
>
> -               if (!pte_valid_cont(pte) ||
> -                  pte_pfn(pte) !=3D pfn ||
> -                  pgprot_val(prot) !=3D pgprot_val(orig_prot))
> +               if (!contpte_is_consistent(pte, pfn, prot, orig_prot))
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
> +                               if (!contpte_is_consistent(pte, pfn, prot=
, orig_prot))
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
> +                               if (!contpte_is_consistent(pte, pfn, prot=
, orig_prot))
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
Barry

