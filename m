Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B43106ACD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 17:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvAML1TXhwJrNBapt3bY/fy2P/HQmzT8RWNB/11cH/k=; b=U2u1TAdWAs+OdGNHWpnfswLIDL
	q71sC3Ao9xxqDy2dEKzPrX64PVANg6XY3LYdIbAex9VgJuYm0bkt+aqGYCzc+BWfAEWnSBjYWgo9U
	o1rg6/AInxBcuNZLwcbuAUQoyoZHtRWMCsycDwA2TmfLHhV/JkPkahIx4eGStzT62Fk0cN8L8tRX3
	CWlVEb38S727W7WRxS2ZnnzHlqcbHbZ05LT2t9e4z5uOZieHHL9JCRFpuw/Fq3RO7cOJsaY30E8l8
	z/yAqDCy2tqRBpFcW+BGD5+QM8VHI9eXuHQy4849muwV5YqhOYFPTL42Ha6lbT9oYroXGYMm/PDt5
	zhCdnOiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kI8-0000000EoOg-0IRY;
	Thu, 12 Mar 2026 17:57:48 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kI5-0000000EoO2-3cDk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 17:57:47 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-50906a98ffeso59401cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 10:57:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773338264; cv=none;
        d=google.com; s=arc-20240605;
        b=NFjhMs0owdAeiBcYk5iy+g2uh4fi8kCc5oOL3LuBVNm3PHjpW7E4obfJ7gp/X3ZqYl
         ePbK4zUC3RbnScolrR4k/5v4+qWyZ6dG7VwrAHbavFEomyV/5XYZdTaE/ZVm+Z/9YFO+
         gTkzB97ovLPgSDgx0IELy/jr9DOke/1S54XjgVrJSdj0iELoLjYZnGKLgm3zKM0b3hpJ
         E3hf67nmsa+eB0x8aCxnvjB8uGYY/YslH1m4g7eoTqZQ7Ssw279m/1pjO8yN0StpXtVK
         kJnR5pHwnK6i4q9SzY3zbZnF0OcBUPbIW6tAI2Zkyx/NJdTLUfa5VI9ld7uPQ+h4BZRK
         7DWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zvAML1TXhwJrNBapt3bY/fy2P/HQmzT8RWNB/11cH/k=;
        fh=3qgFmdi+lY8Tn3Id5EJESvvQ7LktVwNA4kKWvVqUJS4=;
        b=g14wjG+5BQ2eW4FqKMLjfE+Cikq+YsvK/zFqVzlk4Js/N7I12LJkUDyWZv8bjV7FDU
         rOPWX6NIgQPXMPwUC+q1hgH7OazRfWx9OT3kOGYEJqztVGdAoS1UMtu1CrO5+AmW5974
         DsanGutv37kmHobCVjxuqSl5pggebFHK2fQ8cjMmyLSW8Gv9M0OhrFytdtcdsChZfL49
         v0zCNmpmifPEcEMhXjq/ciIs5Xe9/oe/bnSRuiEFYw0upTxyyH8OXUStg+fDHw6FcmjU
         5iM7kO3sAYi8NE66wZ/aVt0B6phPAUUumMnafic1CpKwDkilT7Rf/1ZZU5EvsEFyLAkJ
         C0mg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773338264; x=1773943064; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvAML1TXhwJrNBapt3bY/fy2P/HQmzT8RWNB/11cH/k=;
        b=rVnz4Npprn0xhP9eIuM+pHNXPbhqiSD61PbyvVLSvDyBZPFMMH8ooEelqmIV1ta8F+
         Bti74VZKfTO3xlDYGLaUsz0IRyo6gVMH9/B2+wkWg/q5JxMkmclhGbu70iLyR42TYUU/
         yxFPDC4GhPmypwMX4krztM7BwjnoPRbC9CU0aWGDsJovTf9teS5Pwr9EPFjyE6tFC9as
         l3A6m3oUU/Jf8ORomPEj5k2TX4msG4PV1MSoMy0QH4mxfp/w4bVUEOXVQ3K54cF8/YWf
         8GCWremn1bf0xW5KpzncKFUOLHr1Wn572gNPtD+N7gPugZJ0HvYM076DyYF6PPp/MxSN
         iS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773338264; x=1773943064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zvAML1TXhwJrNBapt3bY/fy2P/HQmzT8RWNB/11cH/k=;
        b=UFjCjqYWheLWHFwoRDSN28xZFgxnjphaiw+G5QifjLYEKlat5/ZMiKP3PE9sOI1zQ3
         mdbVFjG21RZ1v3PqPPfZm05vR0sisPMrJogzRqUi/PkATlx4XO7Pzijm/7elUruAHqlZ
         egT8kAMb8azNWaD5ajh+DfPAVKP01xkKLTGZfcl5YEbhv7sdDObaCjpZRHyAr2FYzoP8
         Ul9bem5MBFHuJYsQBiEbWkNT7srrmnmtjiY5CG9Vd/bjpf0gP8iaIKCA6h5NP9agkhc1
         wb+52Le0VmhxeAzvfw714ZBFT/Q9lRDkp02JdomDgozLvFyVYKIvwsFR5qgTvTnwZ3rF
         S6Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUUKIjH2cQXj+J10FwomlMkw6akH0XslwNvmggpZMyZ7SoKgsL2kUb2xo4k3Z1qu/8/4LHqQPIWPFYV5Q4LxNkh@lists.infradead.org
X-Gm-Message-State: AOJu0YyqK9AUT60dcYeLfKlG0y+c0xBq58NrxPpTkwPaJasW6tATe21X
	gNdAPbYNLe2Rg5FAkkV4qDShCisyuEov2sZc3pCcEGVlDIj5stUTRZs/odIultqiu42q9qzuQmw
	pLvCdF62H/Uges6k32JwDVVyvYu9yqEmViKbVki4x
X-Gm-Gg: ATEYQzyiaFA2KaSny6W2piVeVhqlLi0D6LeVgWCjPuRT7WACvUuGpsE/E+r3oYNgI8o
	qZjvV+3iTQ4dc6wgJZChDpmX5woI+jkxHO18bq8nUHhvu8VkrHtukfwME6JaHkxSmGCq9UxJew6
	2sqVKbZFqdazTKyX+YffIjZfIqrokHquhjhC7c3gUG8XUaZsvc124womm9Tgsi7/49wwHHU3/4U
	27iYET2WrbaEuBeuwfwUeMjSSuCXr1bv4wV5DL8XBuGzR4RtQwj0ep8y1Lse18ygaClgRcFAWSy
	4/d3Yd3uPx7J3K3CvXo=
X-Received: by 2002:a05:622a:54f:b0:509:174d:3224 with SMTP id
 d75a77b69052e-509585fc0dfmr794461cf.11.1773338263919; Thu, 12 Mar 2026
 10:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260310124933.830025-1-sebastianene@google.com> <20260310124933.830025-2-sebastianene@google.com>
In-Reply-To: <20260310124933.830025-2-sebastianene@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 12 Mar 2026 17:57:06 +0000
X-Gm-Features: AaiRm50UHS0HJHwYvTvytsFBXYKCFdJYIPpWhfhpkM3kMBPTBsr_hCDbfbubjhg
Message-ID: <CA+EHjTxSgAbak_j+emSHNk9Em-m=gU44w_S2DtFovz5Q_Ci=Wg@mail.gmail.com>
Subject: Re: [PATCH 01/14] KVM: arm64: Donate MMIO to the hypervisor
To: Sebastian Ene <sebastianene@google.com>
Cc: alexandru.elisei@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, catalin.marinas@arm.com, dbrazdil@google.com, 
	joey.gouly@arm.com, kees@kernel.org, mark.rutland@arm.com, maz@kernel.org, 
	oupton@kernel.org, perlarsen@google.com, qperret@google.com, 
	rananta@google.com, smostafa@google.com, suzuki.poulose@arm.com, 
	tglx@kernel.org, vdonnefort@google.com, bgrzesik@google.com, will@kernel.org, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_105745_924468_D07BF4B2 
X-CRM114-Status: GOOD (  29.92  )
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

Hi Sebastian (and Mostafa),

On Tue, 10 Mar 2026 at 12:49, Sebastian Ene <sebastianene@google.com> wrote=
:
>
> From: Mostafa Saleh <smostafa@google.com>
>
> Add a function to donate MMIO to the hypervisor so IOMMU hypervisor
> drivers can use that to protect the MMIO of IOMMU.
> The initial attempt to implement this was to have a new flag to
> "___pkvm_host_donate_hyp" to accept MMIO. However that had many problems,
> it was quite intrusive for host/hyp to check/set page state to make it
> aware of MMIO and to encode the state in the page table in that case.
> Which is called in paths that can be sensitive to performance (FFA, VMs..=
)
>
> As donating MMIO is very rare, and we don=E2=80=99t need to encode the fu=
ll
> state, it=E2=80=99s reasonable to have a separate function to do this.
> It will init the host s2 page table with an invalid leaf with the owner I=
D
> to prevent the host from mapping the page on faults.
>
> Also, prevent kvm_pgtable_stage2_unmap() from removing owner ID from
> stage-2 PTEs, as this can be triggered from recycle logic under memory
> pressure. There is no code relying on this, as all ownership changes is
> done via kvm_pgtable_stage2_set_owner()
>
> For error path in IOMMU drivers, add a function to donate MMIO back
> from hyp to host.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 90 +++++++++++++++++++
>  arch/arm64/kvm/hyp/pgtable.c                  |  9 +-
>  3 files changed, 94 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/k=
vm/hyp/include/nvhe/mem_protect.h
> index 5f9d56754e39..8b617e6fc0e0 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -31,6 +31,8 @@ enum pkvm_component_id {
>  };
>
>  extern unsigned long hyp_nr_cpus;
> +int __pkvm_host_donate_hyp_mmio(u64 pfn);
> +int __pkvm_hyp_donate_host_mmio(u64 pfn);
>
>  int __pkvm_prot_finalize(void);
>  int __pkvm_host_share_hyp(u64 pfn);
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/n=
vhe/mem_protect.c
> index 38f66a56a766..0808367c52e5 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -784,6 +784,96 @@ int __pkvm_host_unshare_hyp(u64 pfn)
>         return ret;
>  }
>
> +int __pkvm_host_donate_hyp_mmio(u64 pfn)
> +{
> +       u64 phys =3D hyp_pfn_to_phys(pfn);
> +       void *virt =3D __hyp_va(phys);
> +       int ret;
> +       kvm_pte_t pte;

nit: prefer reverse-christmas tree ordering for declarations.


> +
> +       if (addr_is_memory(phys))
> +               return -EINVAL;
> +
> +       host_lock_component();
> +       hyp_lock_component();
> +
> +       ret =3D kvm_pgtable_get_leaf(&host_mmu.pgt, phys, &pte, NULL);
> +       if (ret)
> +               goto unlock;
> +
> +       if (pte && !kvm_pte_valid(pte)) {
> +               ret =3D -EPERM;
> +               goto unlock;
> +       }
> +
> +       ret =3D kvm_pgtable_get_leaf(&pkvm_pgtable, (u64)virt, &pte, NULL=
);
> +       if (ret)
> +               goto unlock;
> +       if (pte) {
> +               ret =3D -EBUSY;
> +               goto unlock;
> +       }
> +
> +       ret =3D pkvm_create_mappings_locked(virt, virt + PAGE_SIZE, PAGE_=
HYP_DEVICE);
> +       if (ret)
> +               goto unlock;
> +       /*
> +        * We set HYP as the owner of the MMIO pages in the host stage-2,=
 for:
> +        * - host aborts: host_stage2_adjust_range() would fail for inval=
id non zero PTEs.
> +        * - recycle under memory pressure: host_stage2_unmap_dev_all() w=
ould call
> +        *   kvm_pgtable_stage2_unmap() which will not clear non zero inv=
alid ptes (counted).
> +        * - other MMIO donation: Would fail as we check that the PTE is =
valid or empty.
> +        */

Rephrasing this to see if I got this right. Because MMIO pages are not
tracked in the hyp_vmemmap, the host's stage-2 PTE serves as the sole
record of ownership. We encode PKVM_ID_HYP into an invalid PTE (a
"counted" PTE) to ensure:
- Fault Handling: host_stage2_adjust_range() will explicitly fail if
the host attempts to legitimately map or adjust the protected range.
- Reclaim Protection: Under memory pressure,
host_stage2_unmap_dev_all() will not erase this ownership marker,
because you changed stage2_unmap_walker() to preserve counted PTEs.
- Exclusive Ownership: Subsequent donation attempts (to HYP or a
guest) will safely fail, as donation requires the host PTE to be
either valid (host-owned) or completely empty.

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad









> +       WARN_ON(host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.p=
gt, phys,
> +                               PAGE_SIZE, &host_s2_pool, PKVM_ID_HYP));
> +unlock:
> +       hyp_unlock_component();
> +       host_unlock_component();
> +
> +       return ret;
> +}
> +
> +int __pkvm_hyp_donate_host_mmio(u64 pfn)
> +{
> +       u64 phys =3D hyp_pfn_to_phys(pfn);
> +       u64 virt =3D (u64)__hyp_va(phys);
> +       size_t size =3D PAGE_SIZE;
> +       int ret;
> +       kvm_pte_t pte;
> +
> +       if (addr_is_memory(phys))
> +               return -EINVAL;
> +
> +       host_lock_component();
> +       hyp_lock_component();
> +
> +       ret =3D kvm_pgtable_get_leaf(&pkvm_pgtable, (u64)virt, &pte, NULL=
);
> +       if (ret)
> +               goto unlock;
> +       if (!kvm_pte_valid(pte)) {
> +               ret =3D -ENOENT;
> +               goto unlock;
> +       }
> +
> +       ret =3D kvm_pgtable_get_leaf(&host_mmu.pgt, phys, &pte, NULL);
> +       if (ret)
> +               goto unlock;
> +
> +       if (FIELD_GET(KVM_INVALID_PTE_OWNER_MASK, pte) !=3D PKVM_ID_HYP) =
{
> +               ret =3D -EPERM;
> +               goto unlock;
> +       }
> +
> +       WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, virt, size) !=3D siz=
e);
> +       WARN_ON(host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.p=
gt, phys,
> +                               PAGE_SIZE, &host_s2_pool, PKVM_ID_HOST));
> +unlock:
> +       hyp_unlock_component();
> +       host_unlock_component();
> +
> +       return ret;
> +}
> +
>  int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
>  {
>         u64 phys =3D hyp_pfn_to_phys(pfn);
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 9b480f947da2..d954058e63ff 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -1152,13 +1152,8 @@ static int stage2_unmap_walker(const struct kvm_pg=
table_visit_ctx *ctx,
>         kvm_pte_t *childp =3D NULL;
>         bool need_flush =3D false;
>
> -       if (!kvm_pte_valid(ctx->old)) {
> -               if (stage2_pte_is_counted(ctx->old)) {
> -                       kvm_clear_pte(ctx->ptep);
> -                       mm_ops->put_page(ctx->ptep);
> -               }
> -               return 0;
> -       }
> +       if (!kvm_pte_valid(ctx->old))
> +               return stage2_pte_is_counted(ctx->old) ? -EPERM : 0;
>
>         if (kvm_pte_table(ctx->old, ctx->level)) {
>                 childp =3D kvm_pte_follow(ctx->old, mm_ops);
> --
> 2.53.0.473.g4a7958ca14-goog
>

