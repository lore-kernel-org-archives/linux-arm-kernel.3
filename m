Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248E4F436BE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 17:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=biaOA0d6mhik4+C4B1k5xj1AmZCR/Js0cBd8UJ64e+A=; b=V9mrMtTk9CoG9nkpOXvFluP3Nq
	EGzpMCOqGB19u33dApQAfcbGdoperi9MFO+vbQwPgZLzTgnXWOUgjV+MuZtonb75frjnDTmdUB6vb
	mJ3IG3ybrzyi5p7g6mqCjRS/71iwtFH9une563Q2Ou0MULgyCXhm6aj4asd/Em2Kc40Jh5jnl3Axz
	DQ59zVWye05cXL/W1gLGbQ4PB6DAnkLHuw00MUyIIOMguOwk4vDKj8myuHoUiFK5IhYKRLip/s+4f
	pQ8GEST/MIiVjLDJuMAqIOi1hR4QiEL1W4H9EPC4AhmcSApTgpsdFgzflk5tV3JOjUkzeoLdfZyx3
	Ur7sdINA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDmq7-00000004JVj-0t43;
	Fri, 17 Apr 2026 17:18:47 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDmq4-00000004JVO-2ufu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 17:18:45 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-50e237ae754so26441cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 10:18:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776446322; cv=none;
        d=google.com; s=arc-20240605;
        b=VkrYnJLJWtL+TXT9OMV9fAu8S+MYtAEauZhM8AC/16MxSbKXAMhxtnqGRn67w0xUF/
         enEVpUCo7OvzHy/SI4dzzPCtpYLrorZc5GBks50vYdi8NzetWnFIJ1rjfe+37ZMfePsK
         rUUaZIF5+KJ3P+Ub+mTU6M3eEzLSWPT6te0VJqADGO/MaouTWzPP0IoB43VOkml8YRt2
         Nvn/sb4nNwJMe6ZZbU5KOJn1Cr9TBCDTUZwmqqBfCt47/n17n5YNaJlM4ovSDVQDltkG
         lKSFHtNQQw0c4Z5rXotdVgANqwolPj7ddTq6TqDHLTb+uruPR8s+FgYT8qAxHmOhP5kB
         lX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=biaOA0d6mhik4+C4B1k5xj1AmZCR/Js0cBd8UJ64e+A=;
        fh=pgLbZMuddwAEVGXa58QMijWCaLUpWwyW1lTdQ3CL2L8=;
        b=Rk5PqW6TV0eAL6tGooi2GbQdCZFiRlDLsH02epKJgGBPd1DcMtql7aP9cMhTwmZuWK
         Irrr9dUcnrwBDDbmYas955oaG52SS+lrZLSixZBnT4YsVk0tFe29nxVBhXwad9FtoKSU
         Oh3kiS88DbiOCL6dOK1SplZtCFJ7igPvJHuuYwRL4gzbiO0Kd8yNmT0YPtQky9oluN9+
         ij/f3AKQ8akSvG6lkVRsd/h/r0iWtuJt6xTVP1RvpfhobWzIOtEP9Qt/WPhNzIVn8lwb
         aRWK3J1YCgxtnU4wFU/qJabRgZGEpvbTLKYo03EhSRAoDlaj+uQnxI/xKQnwU1ILmitJ
         wUGw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776446322; x=1777051122; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biaOA0d6mhik4+C4B1k5xj1AmZCR/Js0cBd8UJ64e+A=;
        b=wRVbrZryHrycYPRfDn+mmhvnlp2LCzl4Xv84odW0dj9QEYh5UaZFNtWkARc3jvsiVO
         p+4GhgG85oTnZfrtqcARtSIdHqZxPdBKmsJNkC+PuJoWHaOeU/8mg8C9fsucWl6bNUXH
         359RLJoqbbXpGmdm75cPYMFQxr3Rkx+owhZWUUwuX5n7skxYH0hSBGKGig9+d78Ztu7V
         47rSIxPJxNSrEWIZQTMopXba2JhaWaSUEUIgOBWlQn8c40zh10SQjdUforXn75bpgJke
         T3catfmPc7FjC1IkB8x50jdXoeThO4OHwQkOiFcyeFC/kNUmy3Pvy+92eIyEW9OHHoWJ
         BP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776446322; x=1777051122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=biaOA0d6mhik4+C4B1k5xj1AmZCR/Js0cBd8UJ64e+A=;
        b=VaNjGneO5x54Pr2QaMwJymuYbQrl1cBN5gFqmMUMOYU+jL0MAqr4eyxSz6yJU8Qq2p
         8XIKrCNv/4SGLUT908YgHqfdHKn1d5O4ZCcv0Q5yI9wIbRRF2bZu2e8d8BsT6rNOcgHv
         j5jjhDOOWCRv+jMRFJgA238d1tffa3WBF/kR2H/GKAEH6TdVzvLUZDuUgsUqNnYljt1y
         pbhPG5WRmkc9v55W/sfMxxzqrmDHYyUZWeonWXdzU7meaeX7qWiwZIyOcByrEXgPnGv/
         K85HSsqJNBuIHQNM9d3bGfvojTQzoDIPCIpAF7jFN8NQscFaKeXOpJ8whCt9Lu246B28
         nYSg==
X-Forwarded-Encrypted: i=1; AFNElJ8q1QCmlNWzEBTc50epyy7V5hs/XTgOTyYifYNRv/jSKJVlWdfT9W2S/oKv00ndmFOq43eoUmIIirpRD5FvcMrM@lists.infradead.org
X-Gm-Message-State: AOJu0YxPwN8B+BUHSnBi5rLKJJhfAPjaXFWyCAA8B6EaKQopRcxbjkRW
	v71IqDeCbdtmk4M5GD7ZRwTC2qGEZ9Tb2jE3MYXO9dtIH9O3uzZNXRGqafOQfvaKQf01K5zRO4C
	L0C3GmeqkD3TljjwTmszs3X6ptkvEm9KIjjjxy8L+
X-Gm-Gg: AeBDieu6Goia4/P6Fzub2jPtnJOKzwljI0nMSYqiFSLUbHHg7BVaec8OkHObIdyAxnM
	5dJhXnT2Ykm9eLRgyCYcT9bqsYvjRbQQYAh5QvegF844XrF+XFq9gqQ+bU+rjgua2YTAMXUbeV6
	f7OY9sBQ4CzdR16VgduIX/wlYc/cwpeTeSqvAQ7vGzeA6qqEs1RkUJaHu3TjxLFlMG/9LiQk1DF
	oECvazzbhPHoLFW4DahJd8Hf+K0KEApg5tLxdohTph+sxtwRabu2fYAhfNgaWjItFE1448UkklI
	T/eBRHnLZmvZ5tOVegDoEUytUGDfdm3JakLIIbQOBUr3R/D1zrEHAdMQw40rJg==
X-Received: by 2002:ac8:7d47:0:b0:4ff:bfd9:dd31 with SMTP id
 d75a77b69052e-50e42b292c2mr172191cf.5.1776446320593; Fri, 17 Apr 2026
 10:18:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260310124933.830025-1-sebastianene@google.com>
 <20260310124933.830025-2-sebastianene@google.com> <acJpy7unwLbRahPL@google.com>
In-Reply-To: <acJpy7unwLbRahPL@google.com>
From: Mostafa Saleh <smostafa@google.com>
Date: Fri, 17 Apr 2026 18:18:28 +0100
X-Gm-Features: AQROBzCCTRSV62IVPx6y330qpXgmkId4e0KId71ugobNpu16Ggl0mg0GgHYUJBg
Message-ID: <CAFgf54r3YmFXU+=btPtgtT2wUM0y0+qmPnJYvUX2ncdijHQCGw@mail.gmail.com>
Subject: Re: [PATCH 01/14] KVM: arm64: Donate MMIO to the hypervisor
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Sebastian Ene <sebastianene@google.com>, alexandru.elisei@arm.com, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, android-kvm@google.com, catalin.marinas@arm.com, 
	dbrazdil@google.com, joey.gouly@arm.com, kees@kernel.org, 
	mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, perlarsen@google.com, 
	qperret@google.com, rananta@google.com, suzuki.poulose@arm.com, 
	tabba@google.com, tglx@kernel.org, bgrzesik@google.com, will@kernel.org, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_101844_803078_EE1D9BB6 
X-CRM114-Status: GOOD (  36.19  )
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

On Tue, Mar 24, 2026 at 10:39=E2=80=AFAM Vincent Donnefort
<vdonnefort@google.com> wrote:
>
> On Tue, Mar 10, 2026 at 12:49:20PM +0000, Sebastian Ene wrote:
> > From: Mostafa Saleh <smostafa@google.com>
> >
> > Add a function to donate MMIO to the hypervisor so IOMMU hypervisor
> > drivers can use that to protect the MMIO of IOMMU.
> > The initial attempt to implement this was to have a new flag to
> > "___pkvm_host_donate_hyp" to accept MMIO. However that had many problem=
s,
> > it was quite intrusive for host/hyp to check/set page state to make it
> > aware of MMIO and to encode the state in the page table in that case.
> > Which is called in paths that can be sensitive to performance (FFA, VMs=
..)
> >
> > As donating MMIO is very rare, and we don=E2=80=99t need to encode the =
full
> > state, it=E2=80=99s reasonable to have a separate function to do this.
> > It will init the host s2 page table with an invalid leaf with the owner=
 ID
> > to prevent the host from mapping the page on faults.
>
> I am not sure I agree here:
>
> * Differentiating between MMIO and Memory is just a fast binary search in=
to the
>   memory regions.
>
> * host_donate_hyp isn't a fast path even for memory regions anyway.
>
> * Having common functions for changing ownership is more and more helpful=
 (see the
>   SME dvmsync workaround).
>
> * There's nothing preventing from having a range here which is safely han=
dled
>   already by host_donate_hyp()
>

I am working on v6 now. I'm not convinced that's a good enough reason
to have full-fledged MMIO state tracking, it will be unncessary
complicated and quite intrusive.

It might be useful when supporting device assignment where VMs can own
MMIO, otherwise, I'd try to avoid it.

Thanks,
Mostafa


> >
> > Also, prevent kvm_pgtable_stage2_unmap() from removing owner ID from
> > stage-2 PTEs, as this can be triggered from recycle logic under memory
> > pressure. There is no code relying on this, as all ownership changes is
> > done via kvm_pgtable_stage2_set_owner()
> >
> > For error path in IOMMU drivers, add a function to donate MMIO back
> > from hyp to host.
> >
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +
> >  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 90 +++++++++++++++++++
> >  arch/arm64/kvm/hyp/pgtable.c                  |  9 +-
> >  3 files changed, 94 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64=
/kvm/hyp/include/nvhe/mem_protect.h
> > index 5f9d56754e39..8b617e6fc0e0 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > @@ -31,6 +31,8 @@ enum pkvm_component_id {
> >  };
> >
> >  extern unsigned long hyp_nr_cpus;
> > +int __pkvm_host_donate_hyp_mmio(u64 pfn);
> > +int __pkvm_hyp_donate_host_mmio(u64 pfn);
> >
> >  int __pkvm_prot_finalize(void);
> >  int __pkvm_host_share_hyp(u64 pfn);
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp=
/nvhe/mem_protect.c
> > index 38f66a56a766..0808367c52e5 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -784,6 +784,96 @@ int __pkvm_host_unshare_hyp(u64 pfn)
> >       return ret;
> >  }
> >
> > +int __pkvm_host_donate_hyp_mmio(u64 pfn)
> > +{
> > +     u64 phys =3D hyp_pfn_to_phys(pfn);
> > +     void *virt =3D __hyp_va(phys);
> > +     int ret;
> > +     kvm_pte_t pte;
> > +
> > +     if (addr_is_memory(phys))
> > +             return -EINVAL;
> > +
> > +     host_lock_component();
> > +     hyp_lock_component();
> > +
> > +     ret =3D kvm_pgtable_get_leaf(&host_mmu.pgt, phys, &pte, NULL);
> > +     if (ret)
> > +             goto unlock;
> > +
> > +     if (pte && !kvm_pte_valid(pte)) {
> > +             ret =3D -EPERM;
> > +             goto unlock;
> > +     }
> > +
> > +     ret =3D kvm_pgtable_get_leaf(&pkvm_pgtable, (u64)virt, &pte, NULL=
);
> > +     if (ret)
> > +             goto unlock;
> > +     if (pte) {
> > +             ret =3D -EBUSY;
> > +             goto unlock;
> > +     }
> > +
> gg> +   ret =3D pkvm_create_mappings_locked(virt, virt + PAGE_SIZE, PAGE_=
HYP_DEVICE);
> > gg+   if (ret)
> > +             goto unlock;
> > +     /*
> > +      * We set HYP as the owner of the MMIO pages in the host stage-2,=
 for:
> > +      * - host aborts: host_stage2_adjust_range() would fail for inval=
id non zero PTEs.
> > +      * - recycle under memory pressure: host_stage2_unmap_dev_all() w=
ould call
> > +      *   kvm_pgtable_stage2_unmap() which will not clear non zero inv=
alid ptes (counted).
> > +      * - other MMIO donation: Would fail as we check that the PTE is =
valid or empty.
> > +      */
> > +     WARN_ON(host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.p=
gt, phys,
> > +                             PAGE_SIZE, &host_s2_pool, PKVM_ID_HYP));
> > +unlock:
> > +     hyp_unlock_component();
> > +     host_unlock_component();
> > +
> > +     return ret;
> > +}
> > +
> > +int __pkvm_hyp_donate_host_mmio(u64 pfn)
> > +{
> > +     u64 phys =3D hyp_pfn_to_phys(pfn);
> > +     u64 virt =3D (u64)__hyp_va(phys);
> > +     size_t size =3D PAGE_SIZE;
> > +     int ret;
> > +     kvm_pte_t pte;
> > +
> > +     if (addr_is_memory(phys))
> > +             return -EINVAL;
> > +
> > +     host_lock_component();
> > +     hyp_lock_component();
> > +
> > +     ret =3D kvm_pgtable_get_leaf(&pkvm_pgtable, (u64)virt, &pte, NULL=
);
> > +     if (ret)
> > +             goto unlock;
> > +     if (!kvm_pte_valid(pte)) {
> > +             ret =3D -ENOENT;
> > +             goto unlock;
> > +     }
> > +
> > +     ret =3D kvm_pgtable_get_leaf(&host_mmu.pgt, phys, &pte, NULL);
> > +     if (ret)
> > +             goto unlock;
> > +
> > +     if (FIELD_GET(KVM_INVALID_PTE_OWNER_MASK, pte) !=3D PKVM_ID_HYP) =
{
> > +             ret =3D -EPERM;
> > +             goto unlock;
> > +     }
> > +
> > +     WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, virt, size) !=3D siz=
e);
> > +     WARN_ON(host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.p=
gt, phys,
> > +                             PAGE_SIZE, &host_s2_pool, PKVM_ID_HOST));
> > +unlock:
> > +     hyp_unlock_component();
> > +     host_unlock_component();
> > +
> > +     return ret;
> > +}
> > +
> >  int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
> >  {
> >       u64 phys =3D hyp_pfn_to_phys(pfn);
> > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.=
c
> > index 9b480f947da2..d954058e63ff 100644
> > --- a/arch/arm64/kvm/hyp/pgtable.c
> > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > @@ -1152,13 +1152,8 @@ static int stage2_unmap_walker(const struct kvm_=
pgtable_visit_ctx *ctx,
> >       kvm_pte_t *childp =3D NULL;
> >       bool need_flush =3D false;
> >
> > -     if (!kvm_pte_valid(ctx->old)) {
> > -             if (stage2_pte_is_counted(ctx->old)) {
> > -                     kvm_clear_pte(ctx->ptep);
> > -                     mm_ops->put_page(ctx->ptep);
> > -             }
> > -             return 0;
> > -     }
> > +     if (!kvm_pte_valid(ctx->old))
> > +             return stage2_pte_is_counted(ctx->old) ? -EPERM : 0;
> >
> >       if (kvm_pte_table(ctx->old, ctx->level)) {
> >               childp =3D kvm_pte_follow(ctx->old, mm_ops);
> > --
> > 2.53.0.473.g4a7958ca14-goog
> >

