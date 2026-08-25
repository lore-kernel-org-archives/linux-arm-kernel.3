Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4637EC5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 00:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOccCJ+s3b7MTFGKQlT/SH3M4GxfcnJ6QVVNw7oc3jc=; b=k6HdrzIithneyXfS83EWvrxdFh
	122Oli4by36s+EJzp/icladq6aRx/8kzd08iJiEJVcwBvZ167Q40sprHKijNP1AQJND9RcONualId
	RQ/K4Tm7p8Edl9S9TlJQUGrbJele8UlHFiSEwo2GfP1NQVkMt/5w5d5E7KrmfY4RyRl4RZFqO3P+T
	afC2hhauGPzxHAhz5uzxK/6HAlJHa+OCj2H6es5wn/zKAq3s6RuyW759Qa5xg7/ySsMlByTkSOiFs
	+Qn3ZGoken73O7ARzjoYEuhIxtkx7rQhio/oeEEy5ZsfCEvhOuj1RSKUlBf6t0IKwUgxP3HBEAN9h
	h8UUoYIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyeue-0000000HXGp-13wf;
	Tue, 25 Aug 2026 00:21:12 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyeuX-0000000HXGK-1RnL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 00:21:09 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so7503168a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 17:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787617263; cv=none;
        d=google.com; s=arc-20260327;
        b=f9c4MH4JVGsU2wZclYoMKJ/+DqWLzLDbL4DVVhapMkUC9isgeg2XA2jW0zk7iHRPrw
         LA40OVM7+/v5zQuJgLs0J2axzkfslMj7s3B0QKUPwLQq4T8sdZgPEilMX18xEmUqZx3q
         9GcgpSvoCCrk/Lmz0cInnJSbkjrwSCMHNY9Y/i4t2j0lZV5Jb33b+h6z0JkDYvZf7nsJ
         gfDDbbsuwP/LaAo2nUvH10I0nBNPhEfYqrqPa4MaTxAhH0Q1gMRlRh8utwyZN87OQDcr
         EwlIlUweiWVkXqkq+2dkaOjg3AuPmdwRTeZQNRTZofbdcuHRYspzLvhPGEXE2xDHg0zx
         6rEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MOccCJ+s3b7MTFGKQlT/SH3M4GxfcnJ6QVVNw7oc3jc=;
        fh=cPCcfw/X70vjsfjNHn5IqNqARYwMU/rpmRRNZqLEoJs=;
        b=R+8T10jTj/8jPUQcj7EtuzOZgsQRg2WkNPJ2S3TohS9MGHDc/nhRc4cPYljTsLcNTC
         ioHXgQ6meWTV834Yc5ZOZSRtEqW7AiBv+pRQupE07BAKu0KtHV1R4DiWx3TEM+G9hQ0p
         8gnINE886IpjNBxqsGE5CQ6DEK172ILFKAOaoyTdWl5y44kruFT8wT/oC5X5IylYAEEs
         7GKKQtZuQaccCez5epG+IQes6Az+ZIMtRcXExJdOYFo5mu9wrDCHrvDphbwmCgYMxUp1
         rafRoMgJDN0uMh3Aj21vSn3/WaL9dnOR//GT/IFzKVMTTXNCnpX0tU/JS48wnl4VWFkw
         UbNA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787617263; x=1788222063; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MOccCJ+s3b7MTFGKQlT/SH3M4GxfcnJ6QVVNw7oc3jc=;
        b=Tzp5G8NwpxM6i3lpuDL46ch+9fYoQF/oe2rzzWI+PhZU+oI078G5o4qqPrTrMFH+wo
         9zKn65gbrtJ1z7rrozxLaVSyN0jSQDFR8ZBD/tgTgBITTDl7qCfCL6FEc+gv/eL29JQm
         ZkiFghWOoHFqAv+Gi0Ok9E0DfIbTXcJDf07vnuqc5mgAckg6wARTz4Y4OSIKr471dKw2
         cskh2PUPzqHJ/0CHCDfOlsNkHIEjjKATD71vQJiBk7s2J9f0/5uLtnZXZghjhdm9tzwv
         T7c8eKmbz2nNKg1vCHMXmEqLmK1/AhuDUbSrQpFW9ryxYSSPKN/4KGFeu6U1aqa/iENi
         Dq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787617263; x=1788222063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MOccCJ+s3b7MTFGKQlT/SH3M4GxfcnJ6QVVNw7oc3jc=;
        b=MpHgcj7yQXvGNcodDAJ8H+aVWfNB+2u4SyAUS+8FR0Z01lqEUHYc2KjV/u2ZOpM9X3
         79iiYynMQ+4uIW5TjNe1cRyJk7/yx5tgkdAgjgEF1YJwKEt7FqomnuN3EBvkaorqbhun
         5FUp9G/i5uPl4A27Bjr3R+Fxp93O81BpRBEER2FSvFyk2iFQ6Pefu+HQvvEm9JW8/KIi
         qF/NB3wtWRX6exNXARd+oiGjLxxNuVmRE4KniwqhsN7Tp5NCppprm4eRa73gZSyZMCb6
         2p17PXzCG/e9sxa5O8u/e+th1n62fJ5LLIEosSNZLOZeMtFZbUsC1IMn9tylULmo7+Ue
         V0Nw==
X-Forwarded-Encrypted: i=1; AHgh+Ro5sOoX8lbg+Bp7DvNqyAv+7laLGekYPDPQVZgmRzrVjeaKe3d/yDKzgx9zG0AJMHf/NpNSCvlpjjOGtEVDbAGs@lists.infradead.org
X-Gm-Message-State: AFuF++m2K5Fb+un2SZRS1jZ5wqeyCT6AlcnCaB5rmEEImL4b5wxFWGtP
	V0jLjWs+EAuHDQxi5vKG1rG9VlPiNIbXUQjwNKChEFBSkLxbZFttB8srngEPD7/iuFn6/RCAy1T
	DiA2kdrSHefSRdnchNbTB2AMfKJXPMQHw9QCAabeS
X-Gm-Gg: AR+sD12E1MuHt6O+8/zjDcCummLMqoZMQEkzHcIHtgtBw4q1KhLtotGHJqViYy0k5e2
	cVebE9TtgfXMRv0a+UZMIu5X8KJ0cVo1mUGUJ45M4leY42iD2/cd40RxB/QcN+pkkWgtBZLiC4v
	Yn27qrlNdeCtU+Vk/7o4klyvpcEth/kp4aEr3FoaxUUtYS3cKPglOELIMR4iA5fP6JFVSnAguUl
	80mpOhHZ7VMlnimpKGTuJc3hCyVzzOn+5NRYA73tp7+Fco9NVuxLkOyR+wGvUpMjgH8MtdhEjB5
	Cr9Rl0Y1HA0WxZaxABZ3ZgjCGa6OGwYWTiEwW71c1hzrgKnuNn1/0N+gN83VINimd9ZG1p5G7iy
	apb+I99Jvoy6ecXrLNQVxv0g3jQix8gOW65KS2FszJMIbxZHfzbIDHuoK1carHhTjSRUQ5AOdiI
	T0Kz4SH+6i6d3YGE5nnA==
X-Received: by 2002:a17:907:930e:b0:c1c:4e36:eec6 with SMTP id
 a640c23a62f3a-c2492099898mr2233901066b.18.1787617262791; Mon, 24 Aug 2026
 17:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
 <20260708031129.3503195-9-jthoughton@google.com> <aoRn3Fn1dhTdsk6d@arm.com>
In-Reply-To: <aoRn3Fn1dhTdsk6d@arm.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 24 Aug 2026 17:20:25 -0700
X-Gm-Features: AcwNN1VDT0z61JeW37ejfojh06XWJMZpjbgbk_244A1kNUnBGA4i1Z7ktlukd9E
Message-ID: <CADrL8HVaa9a=E3+ABThCFzZWd15RPvXzR3QafDrztgJMAoG_Nw@mail.gmail.com>
Subject: Re: [PATCH 08/18] arm64: Implement try_update_vmemmap_pte using the
 AF trick
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_172108_862910_030E46E7 
X-CRM114-Status: GOOD (  36.24  )
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

On Tue, Aug 18, 2026 at 7:10=E2=80=AFAM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
>
> On Wed, Jul 08, 2026 at 03:11:18AM +0000, James Houghton wrote:
> > diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/=
pgtable.h
> > index 5f21d3a738ee..7b11aa41d0a0 100644
> > --- a/arch/arm64/include/asm/pgtable.h
> > +++ b/arch/arm64/include/asm/pgtable.h
> > @@ -1302,8 +1302,7 @@ static inline void __pte_clear(struct mm_struct *=
mm,
> >       __set_pte(ptep, __pte(0));
> >  }
> >
> > -static inline bool __ptep_test_and_clear_young(struct vm_area_struct *=
vma,
> > -             unsigned long address, pte_t *ptep)
> > +static inline pte_t __ptep_clear_young(pte_t *ptep)
> >  {
> >       pte_t old_pte, pte;
> >
> > @@ -1315,7 +1314,13 @@ static inline bool __ptep_test_and_clear_young(s=
truct vm_area_struct *vma,
> >                                              pte_val(old_pte), pte_val(=
pte));
> >       } while (pte_val(pte) !=3D pte_val(old_pte));
> >
> > -     return pte_young(pte);
> > +     return pte;
> > +}
>
> At some point, we should use LSE atomics directly here if supported
> rather than a CAS loop (well, this is LSE as well if supported but it
> doesn't guarantee forward progress of the loop). I reckon we can replace
> it with some test_and_clear_bit_relaxed() call.

I'll put a patch (or two) at the front of this series to do this. :)
Will mentioned it too in my offline discussions with him.

Will also pointed out that FEAT_LSE relaxed some of the forward
progress guarantees[1], pretty strong justification to just use LDCLR.
So unless you feel strongly, I'll skip performance testing for this
change.

[1] B2.12.5 (M.c) The bullet that begins with "If FEAT_LSE is not implement=
ed".

> > +static inline bool __ptep_test_and_clear_young(struct vm_area_struct *=
vma,
> > +             unsigned long address, pte_t *ptep)
> > +{
> > +     return pte_young(__ptep_clear_young(ptep));
> >  }
> >
> >  static inline bool __ptep_clear_flush_young(struct vm_area_struct *vma=
,
> > @@ -1793,6 +1798,48 @@ static inline void pte_clear(struct mm_struct *m=
m,
> >       __pte_clear(mm, addr, ptep);
> >  }
> >
> > +#define __HAVE_ARCH_TRY_UPDATE_VMEMMAP_PTE
> > +static inline int try_update_vmemmap_pte(unsigned long addr, pte_t *pt=
ep,
> > +                                      const pte_t pte)
> > +{
> > +     const int max_attempts =3D 16;
> > +     int attempts =3D 0;
> > +     pte_t old_pte;
> > +
> > +     if (!system_supports_hvo())
> > +             return -EOPNOTSUPP;
> > +
> > +     /* This routine is only to be used for valid-to-valid transitions=
. */
> > +     if (WARN_ON_ONCE(!pte_valid(pte)))
> > +             return -EINVAL;
> > +
> > +     old_pte =3D __ptep_get(ptep);
> > +
> > +     do {
> > +             if (WARN_ON_ONCE(!pte_valid(old_pte)))
> > +                     return -EINVAL;
> > +
> > +             /* We should never get a contiguous PTE here. */
> > +             if (WARN_ON_ONCE(pte_valid_cont(old_pte)))
> > +                     return -EINVAL;
> > +
> > +             if (pte_young(old_pte)) {
> > +                     /* __ptep_clear_young() returns the overwritten P=
TE */
> > +                     old_pte =3D pte_mkold(__ptep_clear_young(ptep));
> > +
> > +                     flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> > +             }
>
> I think this is going to do a lot of TLBIs given that the default kernel
> prot has PTE_AF. It somewhat defeats the VMEMMAP_REMAP_NO_TLB_FLUSH
> flag but I haven't figured exactly how this optimisation works.
>
> If it becomes a problem, we could do a first pass to clear AF as an
> optimisation or later via vmemmap_split_pmd(), only map with AF=3D0. We
> still have some page copying that touches the vmemmap, bringing AF back.
> Of course, you'd still need the above flush, just wondering whether we
> can reduce/coalesce it.

We could reduce/coalesce the TLBIs (it should be very unlikely for the
page structs of a to-be-optimized (or to-be-unoptimized) HugeTLB folio
to be accessed, which is nice), but as far as I can tell, the TLBIs
don't seem *too* slow yet.

On my test system (single-socket, 80 CPUs, Neoverse V2), the TLBIs
seem to take about half the total time required to free the vmemmap.
This isn't great, but the absolute time taken isn't a problem for me
(maybe because my machine is single-socket?).
```
$ echo 0 > /sys/kernel/mm/hugepages/hugepages-1048576kB/nr_hugepages
$ time perf record -g -- bash -c "echo 288 >
/sys/kernel/mm/hugepages/hugepages-1048576kB/nr_hugepages"

real    0m1.271s
user    0m0.076s # this is just perf :)
sys     0m1.180s

Trimmed perf report:
+   47.44%    47.44%  bash     [kernel.kallsyms]  [k] try_update_vmemmap_pt=
e
# In try_update_vmemmap_pte, it's the TLBI + ISB taking all of the time
+   33.66%    33.62%  bash     [kernel.kallsyms]  [k] prep_new_page
+   10.71%    10.71%  bash     [kernel.kallsyms]  [k]
_raw_spin_unlock_irqrestore
+    8.57%     4.86%  bash     [kernel.kallsyms]  [k] __free_pages
```

Also checking to see if HugeTLB-2M is problematic; it doesn't appear to be.
```
HugeTLB-2M
$ echo 0 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
$ time echo 10000 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages

real    0m0.080s
user    0m0.001s
sys     0m0.079s
```




> > +     /*
> > +      * Translations without AF cannot be cached, so we can replace
> > +      * them without BBM.
> > +      */
> > +     } while (!try_cmpxchg_relaxed(&pte_val(*ptep), &pte_val(old_pte),
> > +                                   pte_val(pte)) &&
> > +              ++attempts < max_attempts);
> > +
> > +     return attempts =3D=3D max_attempts ? -EAGAIN : 0;
> > +}
>
> Here, indeed, we do need this bounded, otherwise some pathological cases
> may set the AF continuously.
>
> --
> Catalin

