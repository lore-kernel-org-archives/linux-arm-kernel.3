Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CA1C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 05:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpjwKaFokunhUDCn+gTRF/HY7rsYKAP4TBiw2uLyuvU=; b=MtwjznBuNU/4oV4NkHiR3b+dHW
	Z6HLRitRasRnus8Mg/ifrASly70I1KCzH2iOyUBwM2mmDK056s1O2mBjjoXgBWiTPhTtiOvDt0BCI
	vAnchfmdbeQoCTTROjT+oAh7f1iXA3i92htV7vH2HH1BvVZxUadsJa09livmOi92aZG4IfawUS+3e
	tHe6nnhb27dBOqUhViMORycUZ3/5UGCtBYxYhUz+MiOCfGvYGArchpz9fGraTCjjl6pqmEaTgQIAl
	Z5wLOhEui3H07AButJOXkWj4brTluGx9dnoxZxTvO1mYuAwiM8cqCipDC52hNo0RDss9N3qbXILNk
	2g1jXg8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXvYe-0000000AeO4-1dt0;
	Wed, 15 Jan 2025 05:03:12 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXvXP-0000000AeHN-2Ou7;
	Wed, 15 Jan 2025 05:01:56 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5d3e6274015so10700433a12.0;
        Tue, 14 Jan 2025 21:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736917314; x=1737522114; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpjwKaFokunhUDCn+gTRF/HY7rsYKAP4TBiw2uLyuvU=;
        b=GgzWtbGs1RQMY/o9ld1ynSrSXDMx0vMNmCLZJiETeIwbIJXAWorb3PYHHyDkbtBwms
         ENIb8P6pV6XPMwhfAkJnLKB6Zkprg6pBkZPWWAZJEzUOZC+7MzKOXyMaVSPyWeegbUmh
         GlgIuEbr1MrVFGe/XmACxZGe2Y48t/HbjrM0Nj6KoRYXILHy6DfzMRTn79YjUdrejjZL
         snijggp5LPqWyrT98BWAn/tFZiv4QO85AyMxC1V6MHtqGCfn2TuD83FivQzePgMC4+Yq
         7g5PfYa2GelLPEJt+AEpQc6F6rBVZlK8UbuZrlRfxe/77yV7RraQHIj4NqgzOxYdeVvV
         lU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736917314; x=1737522114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpjwKaFokunhUDCn+gTRF/HY7rsYKAP4TBiw2uLyuvU=;
        b=gK2TmezeSEA7WRHQmvSzWjG0e4zYRlLmwGHkK3LDXqj+kzlX4/PYQDePesvAuK6XH/
         VPmnKyPoqJr7wRvtKPxs5ROe1b1g3w2heo5TjIN1LHTSvVrZlm5dDsipFCmRhH/72FLZ
         lFodQJOLofaBPn+PkYXJoEEdLW/b6wbXJPizaTKXGO63feZYVbbgK7DrzRwHPJ1ZgvwS
         ll2pzB/N4MB/7Qn+nPwxv9TKcqDo7QLgXfS1E69B8MFiy2Jb7EEhau6AK4XPiJ6BiABn
         BNJQFQ3FUrqzhLWP3uAoVoLmZyHsR83CHlsexVFuUWNSmM2tSCKmSp8EASBgXnmhDcOy
         uhXw==
X-Forwarded-Encrypted: i=1; AJvYcCU56IImRaDaeI1DEXDcNq/MwkpeayZVKt3W+OuCbtdgSaBJnT9BAk8wbp/RLaCreO901oQZb0L0yIHPDFT5jTEL@lists.infradead.org, AJvYcCW1cEE7pcBBgrDy2yQFI+Cb3thToGO3CwC/kSM01EbimlZ8N9J4Up8BgZwUMGGU/bhsFsmJpmNo4TqVgkA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6jEjm4yGMPcBXuXCY/vfa/+8hdeg+QQvmJePxTo2HXkgJtCNV
	1gWeBH134o/2PkNyJ2PVje6P1vqwDrKzLCxJxhBkxIr147gGEBakZW2uFzkZI5+BuIh8sZivmuJ
	fiVRuqhm76W8XTtP7GpppCB1EsFw=
X-Gm-Gg: ASbGncuRCuuGyvmvgRYpjOLaKLpkS57YbOc13SvLyx/EhQ+14Hpobo9ekY5XMVkiZqd
	bv6cXp4vzfG2kMrqrwBdunun2loIHaU3V2qNZyQ==
X-Google-Smtp-Source: AGHT+IHceNGH9qkj3lFCn0ed4ep2WR2I07p3gIVDoQCCIubWvsQ93/RAcStI6icLSGHpztzeKXwp5UPmBTQXAHdFcYw=
X-Received: by 2002:a05:6402:358c:b0:5d2:be16:de1f with SMTP id
 4fb4d7f45d1cf-5d972e4cc0fmr24995916a12.23.1736917313425; Tue, 14 Jan 2025
 21:01:53 -0800 (PST)
MIME-Version: 1.0
References: <20250115033808.40641-1-21cnbao@gmail.com> <20250115033808.40641-5-21cnbao@gmail.com>
In-Reply-To: <20250115033808.40641-5-21cnbao@gmail.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Wed, 15 Jan 2025 13:01:16 +0800
X-Gm-Features: AbW1kvYZxRhl5faO24sqrqwlpz3djqt4jY4QfeBoUbeiR1_VP6OzN66fRVqwvPg
Message-ID: <CAK1f24=3LmQMzgosB0o9OKV-P8f6cPO2ZCPBA64QXQqZYPk=ww@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] mm: Avoid splitting pmd for lazyfree pmd-mapped
 THP in try_to_unmap
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, david@redhat.com, 
	kasong@tencent.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_210155_611653_FF182320 
X-CRM114-Status: GOOD (  23.34  )
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

On Wed, Jan 15, 2025 at 11:38=E2=80=AFAM Barry Song <21cnbao@gmail.com> wro=
te:
>
> From: Barry Song <v-songbaohua@oppo.com>
>
> The try_to_unmap_one() function currently handles PMD-mapped THPs
> inefficiently. It first splits the PMD into PTEs, copies the dirty
> state from the PMD to the PTEs, iterates over the PTEs to locate
> the dirty state, and then marks the THP as swap-backed. This process
> involves unnecessary PMD splitting and redundant iteration. Instead,
> this functionality can be efficiently managed in
> __discard_anon_folio_pmd_locked(), avoiding the extra steps and
> improving performance.
>
> The following microbenchmark redirties folios after invoking MADV_FREE,
> then measures the time taken to perform memory reclamation (actually
> set those folios swapbacked again) on the redirtied folios.
>
>  #include <stdio.h>
>  #include <sys/mman.h>
>  #include <string.h>
>  #include <time.h>
>
>  #define SIZE 128*1024*1024  // 128 MB
>
>  int main(int argc, char *argv[])
>  {
>         while(1) {
>                 volatile int *p =3D mmap(0, SIZE, PROT_READ | PROT_WRITE,
>                                 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>
>                 memset((void *)p, 1, SIZE);
>                 madvise((void *)p, SIZE, MADV_FREE);
>                 /* redirty after MADV_FREE */
>                 memset((void *)p, 1, SIZE);
>
>                 clock_t start_time =3D clock();
>                 madvise((void *)p, SIZE, MADV_PAGEOUT);
>                 clock_t end_time =3D clock();
>
>                 double elapsed_time =3D (double)(end_time - start_time) /=
 CLOCKS_PER_SEC;
>                 printf("Time taken by reclamation: %f seconds\n", elapsed=
_time);
>
>                 munmap((void *)p, SIZE);
>         }
>         return 0;
>  }
>
> Testing results are as below,
> w/o patch:
> ~ # ./a.out
> Time taken by reclamation: 0.007300 seconds
> Time taken by reclamation: 0.007226 seconds
> Time taken by reclamation: 0.007295 seconds
> Time taken by reclamation: 0.007731 seconds
> Time taken by reclamation: 0.007134 seconds
> Time taken by reclamation: 0.007285 seconds
> Time taken by reclamation: 0.007720 seconds
> Time taken by reclamation: 0.007128 seconds
> Time taken by reclamation: 0.007710 seconds
> Time taken by reclamation: 0.007712 seconds
> Time taken by reclamation: 0.007236 seconds
> Time taken by reclamation: 0.007690 seconds
> Time taken by reclamation: 0.007174 seconds
> Time taken by reclamation: 0.007670 seconds
> Time taken by reclamation: 0.007169 seconds
> Time taken by reclamation: 0.007305 seconds
> Time taken by reclamation: 0.007432 seconds
> Time taken by reclamation: 0.007158 seconds
> Time taken by reclamation: 0.007133 seconds
> =E2=80=A6
>
> w/ patch
>
> ~ # ./a.out
> Time taken by reclamation: 0.002124 seconds
> Time taken by reclamation: 0.002116 seconds
> Time taken by reclamation: 0.002150 seconds
> Time taken by reclamation: 0.002261 seconds
> Time taken by reclamation: 0.002137 seconds
> Time taken by reclamation: 0.002173 seconds
> Time taken by reclamation: 0.002063 seconds
> Time taken by reclamation: 0.002088 seconds
> Time taken by reclamation: 0.002169 seconds
> Time taken by reclamation: 0.002124 seconds
> Time taken by reclamation: 0.002111 seconds
> Time taken by reclamation: 0.002224 seconds
> Time taken by reclamation: 0.002297 seconds
> Time taken by reclamation: 0.002260 seconds
> Time taken by reclamation: 0.002246 seconds
> Time taken by reclamation: 0.002272 seconds
> Time taken by reclamation: 0.002277 seconds
> Time taken by reclamation: 0.002462 seconds
> =E2=80=A6
>
> This patch significantly speeds up try_to_unmap_one() by allowing it
> to skip redirtied THPs without splitting the PMD.
>
> Suggested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Suggested-by: Lance Yang <ioworker0@gmail.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>  mm/huge_memory.c | 24 +++++++++++++++++-------
>  mm/rmap.c        | 13 ++++++++++---
>  2 files changed, 27 insertions(+), 10 deletions(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 3d3ebdc002d5..47cc8c3f8f80 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3070,8 +3070,12 @@ static bool __discard_anon_folio_pmd_locked(struct=
 vm_area_struct *vma,
>         int ref_count, map_count;
>         pmd_t orig_pmd =3D *pmdp;
>
> -       if (folio_test_dirty(folio) || pmd_dirty(orig_pmd))
> +       if (pmd_dirty(orig_pmd))
> +               folio_set_dirty(folio);
> +       if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE)) {
> +               folio_set_swapbacked(folio);
>                 return false;
> +       }

If either the PMD or the folio is dirty, should we just return false right =
away,
regardless of VM_DROPPABLE? There=E2=80=99s no need to proceed further in t=
hat
case, IMHO ;)

Thanks,
Lance

>
>         orig_pmd =3D pmdp_huge_clear_flush(vma, addr, pmdp);
>
> @@ -3098,8 +3102,15 @@ static bool __discard_anon_folio_pmd_locked(struct=
 vm_area_struct *vma,
>          *
>          * The only folio refs must be one from isolation plus the rmap(s=
).
>          */
> -       if (folio_test_dirty(folio) || pmd_dirty(orig_pmd) ||
> -           ref_count !=3D map_count + 1) {
> +       if (pmd_dirty(orig_pmd))
> +               folio_set_dirty(folio);
> +       if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE)) {
> +               folio_set_swapbacked(folio);
> +               set_pmd_at(mm, addr, pmdp, orig_pmd);
> +               return false;
> +       }
> +
> +       if (ref_count !=3D map_count + 1) {
>                 set_pmd_at(mm, addr, pmdp, orig_pmd);
>                 return false;
>         }
> @@ -3119,12 +3130,11 @@ bool unmap_huge_pmd_locked(struct vm_area_struct =
*vma, unsigned long addr,
>  {
>         VM_WARN_ON_FOLIO(!folio_test_pmd_mappable(folio), folio);
>         VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
> +       VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
> +       VM_WARN_ON_FOLIO(folio_test_swapbacked(folio), folio);
>         VM_WARN_ON_ONCE(!IS_ALIGNED(addr, HPAGE_PMD_SIZE));
>
> -       if (folio_test_anon(folio) && !folio_test_swapbacked(folio))
> -               return __discard_anon_folio_pmd_locked(vma, addr, pmdp, f=
olio);
> -
> -       return false;
> +       return __discard_anon_folio_pmd_locked(vma, addr, pmdp, folio);
>  }
>
>  static void remap_page(struct folio *folio, unsigned long nr, int flags)
> diff --git a/mm/rmap.c b/mm/rmap.c
> index be1978d2712d..a859c399ec7c 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1724,9 +1724,16 @@ static bool try_to_unmap_one(struct folio *folio, =
struct vm_area_struct *vma,
>                 }
>
>                 if (!pvmw.pte) {
> -                       if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw=
.pmd,
> -                                                 folio))
> -                               goto walk_done;
> +                       if (folio_test_anon(folio) && !folio_test_swapbac=
ked(folio)) {
> +                               if (unmap_huge_pmd_locked(vma, pvmw.addre=
ss, pvmw.pmd, folio))
> +                                       goto walk_done;
> +                               /*
> +                                * unmap_huge_pmd_locked has either alrea=
dy marked
> +                                * the folio as swap-backed or decided to=
 retain it
> +                                * due to GUP or speculative references.
> +                                */
> +                               goto walk_abort;
> +                       }
>
>                         if (flags & TTU_SPLIT_HUGE_PMD) {
>                                 /*
> --
> 2.39.3 (Apple Git-146)
>

