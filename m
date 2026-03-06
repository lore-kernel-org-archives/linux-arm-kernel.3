Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D3DFCC079
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 21:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dv/UW2GkYnjd7ljmBiu2DiN4ZeUG4vxqQWP+FlCaVsE=; b=ZM5JrabRgbQusp2M0IQoNXMJXD
	mU2iN88qU4IY/fts4RUS84XtEdP4Hh4bDfswbUn4RdS1VbG3HXsraK8+YcPs2GVS0Hak51TBqMwm6
	EG1imf1F0caZjIYE8Ee5vF2qopZHRxnTmy+/D2mwIz7QADSUA3EaHZ8gyUszU59g3Z1vadFJ3Txpg
	JTZEDicfj/+Nn1WtrOR2ItjDdH/30vEPj8lyRzHniFE+T7po+J2k+S6HoGebgq1vuCmq5tu6wmAjP
	fC2fDzuSGEMR4biC0iffXwATsLIsusdizD+hpvuSvhGyUBVS/BpEHsPfVaaho71g+pvUJt6VqXxer
	KAcq7xsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vycOP-00000004VAL-1tDA;
	Fri, 06 Mar 2026 21:07:29 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vycON-00000004V9u-1X2l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 21:07:28 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-8cd7284782dso40726085a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 13:07:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772831245; cv=none;
        d=google.com; s=arc-20240605;
        b=LLhbkVF2oKHhFO08mOkTSuc2xq3Qr1d7BQOI+6ah6VtMFwqNgPyXTutWLqR9J7wPLn
         RlN9r/k2MUQ0qzk1mB/CCIyGuY13sdo1aKu68icojuZvCR8cVtmuoedF2tayrb+lCKmA
         gy8ABqlK2IyKa1tocx4zHoNy+yx3yXDFSOX6x6UVZDN7xmSYtSc5mD/nyRpWPhzcI4Fi
         KMwjS9K4I2NxH8XpAp92XRuhX/G91PUpDWH/3+AODJVQAH+6GiVpZaqy5tXlKQXOLIRU
         tTvwuQRr/k/BzE3Adb9Lu8MbiYt95DUteH2ENuaVNcDrlPmL+MbT6ONvEA2BTvr0ZG0a
         B75w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dv/UW2GkYnjd7ljmBiu2DiN4ZeUG4vxqQWP+FlCaVsE=;
        fh=I06dbZniIv0pKtJCcvUqoP4fAWICO5uLXYIdoKaI7fw=;
        b=CtQzDIedgCoA+cOJHOpKpuZeLmJZt06c+hmNHlzlvvby9pFoPdj1GHZASah9e44lrG
         gBxujWxduBYuHAY9Rm6JUkS1i/HSvus667D8UWkA5/s0p8qYEaE2PAWEcwuDDY17l4PG
         vpHdXyYjh60w+Xwi+6bgNtPEUj88lohaaKuLHkSRUZRwT0LF7vCYjQq18Sm6zTSleGmc
         CeKl5naSKxBzZWBc9xR/0XKpZX+03E5/A9p+sWm0poBwnrcC8MvCYkPsfR9cHmpfE7Zy
         9mZwc8mpP5CntfJKqyHbT+LE3ynRy/oWx0Lbg+mc8WUMDq1Z1+i6fmfNfLIFBqZO1Icp
         DRJw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772831245; x=1773436045; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dv/UW2GkYnjd7ljmBiu2DiN4ZeUG4vxqQWP+FlCaVsE=;
        b=afyC29fHyTxLaz+ATgOpnmMdWryNxGnJU9lbn7tkxfja6YO/hGx7gj6JRfGsnYH9rD
         vgm4dASl6eT5Q2NsHbRkehHcEpM6gmFOJtpRNQndnOWIO8Hm76Sp6vlz5jgaW7IwN3ra
         kfs12AFhT393kOOOlN7jZCT/FbRO+/D0fZiCPfISGztV891CaYqpNY2Z/QEEEl+eiKDm
         ARKPTGiaJk2pMtMWPsEMG4nJeCcSNFnQnWvbKkg0i5KxhdzWULLTeykh+N0YVus5Je75
         CqZ+ouE1Axt1eEs2N7LIDmUZtwFHlDVdTqaqTcFl4ctcAEr+fTUF70DekGaja15i1sty
         gX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772831245; x=1773436045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dv/UW2GkYnjd7ljmBiu2DiN4ZeUG4vxqQWP+FlCaVsE=;
        b=Zz9vKX7K76BP9r+SqF/vSXhyl2309isO/qQXp2mFAfhgpJ5qumPG//80Ej3+lTBSFX
         bmIRtXwJf0YrZGSoxPgD3xrm2goVCFOIWElq0KpBth7DYxFoLAUEwYXsZp3r77+MJK7e
         2t+eu4wRRDrcSr6zDO3hubw3EZ45hL/d5OVn3ef2s9I/5v31bpwuK9ZH51wV/mwAuncq
         20cEXdLcSEw4yUCSecxT0z2UDk/OSrT7d3SOT66kedwMn7egDxKEXt9oOED7h8d0jmwU
         h0Z9gehkc6jiPu/+mvT7qJbsM1iFOo2jWvt3trKT1rl+iQTAkafopz1+MhrR+em23Fx4
         8y+A==
X-Forwarded-Encrypted: i=1; AJvYcCWjEjHU4w1yA+kg0GcrLWrP0hjIpo2C60NIjn0L/2symNOhArO1PqQ7p9AuRl5IqsDPnuhGPItJAS2CxAJDAohY@lists.infradead.org
X-Gm-Message-State: AOJu0YygCjfH5UDrGLF95iCfZC6ME3n7be3YMiYdeXcnFz2DDgo6UC+D
	uA5XudHThSmjRL0NR3dbrAZylby3DkcNrK4wCIQKLa+8qirsMVE3w5V0DLYdZPRagfhswk+1h3I
	040NIqsZ2Ydx5baq0iziGSLLYfyO+H8w=
X-Gm-Gg: ATEYQzwpBV1fb70OnCKcRz3hKvRqNf08HRKnsJ65tkkAD6W/q3jkUcliqDcedjSTmsB
	PZr9l6V0rKvU/bm+jiBS2wjIo4OYfqTOAOLtABPbGYW1EzFSaHLZJ3N2oVwmK6smD10sFCq+va9
	uKz5EfJ5oERYRgZga7xHgVGMcQ6K/Dpd6mTQ3uP6Lvdqsphv7BYgFHE/HP+KvPhHAghBl95YMq3
	jX7+1RiS9SVeOD1BBuYkpEUrWIl6Gu+q/1G38nU+s36NNPhCEgPqvIVwsbEEFsw2cc4SJ1dZmx0
	o9QWyg==
X-Received: by 2002:a05:620a:1aaa:b0:8cb:3870:5c1d with SMTP id
 af79cd13be357-8cd6d36dc64mr466631885a.27.1772831245013; Fri, 06 Mar 2026
 13:07:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770645603.git.baolin.wang@linux.alibaba.com> <12132694536834262062d1fb304f8f8a064b6750.1770645603.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <12132694536834262062d1fb304f8f8a064b6750.1770645603.git.baolin.wang@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 7 Mar 2026 05:07:13 +0800
X-Gm-Features: AaiRm5151EfBymLyRlhPC4FnFR4OyGEYd8ZUdO9wgCPfV6jTdSKsfU7KlZGNXtg
Message-ID: <CAGsJ_4yEWn3kVZPQZatOJX7NLLv-OK9pAqUDuWz25XxG5hpV=w@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] mm: rmap: support batched checks of the references
 for large folios
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com, 
	willy@infradead.org, dev.jain@arm.com, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_130727_424869_89E26676 
X-CRM114-Status: GOOD (  25.45  )
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

On Mon, Feb 9, 2026 at 10:07=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> Currently, folio_referenced_one() always checks the young flag for each P=
TE
> sequentially, which is inefficient for large folios. This inefficiency is
> especially noticeable when reclaiming clean file-backed large folios, whe=
re
> folio_referenced() is observed as a significant performance hotspot.
>
> Moreover, on Arm64 architecture, which supports contiguous PTEs, there is=
 already
> an optimization to clear the young flags for PTEs within a contiguous ran=
ge.
> However, this is not sufficient. We can extend this to perform batched op=
erations
> for the entire large folio (which might exceed the contiguous range: CONT=
_PTE_SIZE).
>
> Introduce a new API: clear_flush_young_ptes() to facilitate batched check=
ing
> of the young flags and flushing TLB entries, thereby improving performanc=
e
> during large folio reclamation. And it will be overridden by the architec=
ture
> that implements a more efficient batch operation in the following patches=
.
>
> While we are at it, rename ptep_clear_flush_young_notify() to
> clear_flush_young_ptes_notify() to indicate that this is a batch operatio=
n.
>
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

LGTM,

Reviewed-by: Barry Song <baohua@kernel.org>

> ---
>  include/linux/mmu_notifier.h |  9 +++++----
>  include/linux/pgtable.h      | 35 +++++++++++++++++++++++++++++++++++
>  mm/rmap.c                    | 28 +++++++++++++++++++++++++---
>  3 files changed, 65 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
> index d1094c2d5fb6..07a2bbaf86e9 100644
> --- a/include/linux/mmu_notifier.h
> +++ b/include/linux/mmu_notifier.h
> @@ -515,16 +515,17 @@ static inline void mmu_notifier_range_init_owner(
>         range->owner =3D owner;
>  }
>
> -#define ptep_clear_flush_young_notify(__vma, __address, __ptep)         =
       \
> +#define clear_flush_young_ptes_notify(__vma, __address, __ptep, __nr)  \
>  ({                                                                     \
>         int __young;                                                    \
>         struct vm_area_struct *___vma =3D __vma;                         =
 \
>         unsigned long ___address =3D __address;                          =
 \
> -       __young =3D ptep_clear_flush_young(___vma, ___address, __ptep);  =
 \
> +       unsigned int ___nr =3D __nr;                                     =
 \
> +       __young =3D clear_flush_young_ptes(___vma, ___address, __ptep, __=
_nr);    \
>         __young |=3D mmu_notifier_clear_flush_young(___vma->vm_mm,       =
 \
>                                                   ___address,           \
>                                                   ___address +          \
> -                                                       PAGE_SIZE);     \
> +                                                 ___nr * PAGE_SIZE);   \
>         __young;                                                        \
>  })
>
> @@ -650,7 +651,7 @@ static inline void mmu_notifier_subscriptions_destroy=
(struct mm_struct *mm)
>
>  #define mmu_notifier_range_update_to_read_only(r) false
>
> -#define ptep_clear_flush_young_notify ptep_clear_flush_young
> +#define clear_flush_young_ptes_notify clear_flush_young_ptes
>  #define pmdp_clear_flush_young_notify pmdp_clear_flush_young
>  #define ptep_clear_young_notify ptep_test_and_clear_young
>  #define pmdp_clear_young_notify pmdp_test_and_clear_young
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 21b67d937555..a50df42a893f 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1068,6 +1068,41 @@ static inline void wrprotect_ptes(struct mm_struct=
 *mm, unsigned long addr,
>  }
>  #endif
>
> +#ifndef clear_flush_young_ptes
> +/**
> + * clear_flush_young_ptes - Mark PTEs that map consecutive pages of the =
same
> + *                         folio as old and flush the TLB.
> + * @vma: The virtual memory area the pages are mapped into.
> + * @addr: Address the first page is mapped at.
> + * @ptep: Page table pointer for the first entry.
> + * @nr: Number of entries to clear access bit.
> + *
> + * May be overridden by the architecture; otherwise, implemented as a si=
mple
> + * loop over ptep_clear_flush_young().
> + *
> + * Note that PTE bits in the PTE range besides the PFN can differ. For e=
xample,
> + * some PTEs might be write-protected.
> + *
> + * Context: The caller holds the page table lock.  The PTEs map consecut=
ive
> + * pages that belong to the same folio.  The PTEs are all in the same PM=
D.
> + */
> +static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
> +               unsigned long addr, pte_t *ptep, unsigned int nr)
> +{
> +       int young =3D 0;
> +
> +       for (;;) {
> +               young |=3D ptep_clear_flush_young(vma, addr, ptep);
> +               if (--nr =3D=3D 0)
> +                       break;
> +               ptep++;
> +               addr +=3D PAGE_SIZE;
> +       }
> +
> +       return young;
> +}
> +#endif

We might have an opportunity to batch the TLB synchronization,
using flush_tlb_range() instead of calling flush_tlb_page()
one by one. Not sure the benefit would be significant though,
especially if only one entry among nr has the young bit set.

Best Regards
Barry

