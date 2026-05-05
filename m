Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AB1FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 12:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/BvEwyq6RtfUN9ToJaYs9n24jZfPYPRCO7RFZzu7hcY=; b=GpIg8IoFkeyRg65gt1UXzlpBdI
	Kryl7imdHHpSICBta/i6qMw/ecNNL2++O16gPy0uYL0oTqh5FmZ95ZlsJJLDhdqkN2OFBUk37gbIi
	xVsR/SKcT8svAuiaBNkaNeIuBY4dMklqYEp7T17hLpAO9SeOf/fkKHrXBIAdeg/WFld2H+XypfF4s
	ZfCMPe9QGzlFncwOYBAF+4ZSRy8B9JD7WgWARYNQLbizwHBrjHUx6E4LJfL0PD95fQwpizMTalIOP
	nC62k1aA0SKTsbfBY2AkgpnrA41/R6T8i+/405bbX1lWRWYslb4nzTM0eTX3swS7IccNzX6cxbNVZ
	Xmke2wZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKESb-0000000G7b0-11SQ;
	Tue, 05 May 2026 12:01:09 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKESZ-0000000G7aJ-0G8m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 12:01:08 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-50d864c23bdso497851cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 05:01:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777982465; cv=none;
        d=google.com; s=arc-20240605;
        b=bvvsbsDkQ0mVaLo11v6Nnv+1wptOey9u7UFAPwHokSUVVzj30TmE1ljREZlOvCtXIl
         4z5/4a/UtlRtic+HQfb9+3HgZKsdiSPDUOO4zSA/Smcu0iq0TuicBqhLE+10nBDW3jq1
         pJGJv1VRBbSS5+mfOF7EFiV76XaQXtEQYEG7+FqdNMkimd+yNOntC1+1f68yHiJwRFAK
         iHGGkfCet/p1t3tM83Hah+u/qdSw8zRBrdoWLcJsexKpGwFtD7ArSLm3dPGCfT0D9fI1
         wKWz3s11eHmYjjCaH0b3F0fgu8f835B4CTbW8isEHyc2L83110eJRit23JoJI3mDCEXx
         ma9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/BvEwyq6RtfUN9ToJaYs9n24jZfPYPRCO7RFZzu7hcY=;
        fh=OhJ4auKq2HM+AQCqgwXci4+7MbTKuqoH/BXfzceEerM=;
        b=KpqeAaLlV/Q/D/tiJuxV290L+tHmsqKGDdeQncA3prBq5+J7mCiBq44L/k5+gMW7tF
         uyJFNfMLFM86Rzb1nR0zSblVfkwyeyC0c6MwGaHN+PLZBLiL6vJGFfkCx4z98XOjzfu6
         fPF+H0/37vd+W3VxCjKAO1dz5RfIdfH43SUFvRYh9Vw3xLrdovWifZFmnw9GgoaLHwQ3
         345hpXsryKk1lw4/NEprPomH/d56FjMRcn9+pWoRyAqJnS5AOQRxJinPcLn+Rzylqaxd
         A/if7ZrbnnkcdT4FZb7iPPpaBII58xj9M8oR0CCA2Dw+KPHX/0rz4KTTT+GpYgaVId81
         8JHg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777982465; x=1778587265; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/BvEwyq6RtfUN9ToJaYs9n24jZfPYPRCO7RFZzu7hcY=;
        b=SFpb4wUe/1Z0QiVtw1awUe4NOzKT7vSvu9QMmMLgA7POshqjBBDZkkvZl20GT3GVlP
         d4LdgtsKnEqOrNM3ITTvy6IXfRyRS+BrxcD7WryTbifWrqWmgSuWTyErxzOF3NvPmmmG
         BRFoolcglz+zDKVquqb46hVaFRH/xz7TqgWA55kadaVeYi3t4lAkqCoyRQvOQcL0uCdO
         d78CLo47ZNYhHRnzcTPp+1aNvXZ5XpgY8zKxJBmnVd/8GItiABnof4shpye3jNQb4uCt
         rDW2V3HpHfLgrOLtB97Nr2vkpqbtaHo8iVBSJHFfir4QEaCCawWZDkUGVX/oWJneXPc8
         NJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777982465; x=1778587265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BvEwyq6RtfUN9ToJaYs9n24jZfPYPRCO7RFZzu7hcY=;
        b=A9wmYXOzKMPHY8XWeODVyd2rFjwRbGeNvWrPEpe5F/qn7eJwbiwu66liRMwOI7yq3J
         jWWMo0HlGOGC+EKTVSbWqhPUAh9rBxxRotDRlpZItieHvdivmECZZTOcrfR9BoI3sXSb
         4ip7tNOLoZAB+9HT0rBSqeG8k5nzlYe/zC3K1L2P2ZPl7EdFSPggcsZ7aO5+Rlp0u17x
         NlSvbIzj9WW2UUQj4m/awF3fbQiNS6sfdIG6LU7GjA3T28DJ5ky8Uj+KiM66ibjRv0D8
         LdlHYB9ufsho7ZbB2j+zra23IpCFtpJ3urYZlpJkQfRasFPzLalFDZvj5Gz0k4ulPLFO
         vrgQ==
X-Forwarded-Encrypted: i=1; AFNElJ8PUKzRNEfy6UCz5RinApr8KZfxZTmQrQl9oXbC5PBO1kC7c16RZdr4EruTIdwgeU/zK+ZalXRE8Gbs1B80wgKk@lists.infradead.org
X-Gm-Message-State: AOJu0YwDSXzW07qDUYYpQKuwGsAF26TP4w98CjaXDSXBQDcv52AiR0Dd
	N/Mdv8jeLv3hA9Ivk8jYr1xvh2xRos6uNUz+OA0dmPB63LHIMMtph5d//2XAkwI6KmvlqFAUA3U
	5PafUQ9krCJTQSz9cXjA2fov+u4OTsUOIzh/wRWyh
X-Gm-Gg: AeBDiesPVC7Jl7fEvcTbjXk6GRHbl+giox3xtW+aEIYbnsEykHF6hu+BrhBnQsCHeno
	1uy3tDD1Ggnq3YjPxuwKDp+7+UQIIjaFaLxyZ7vi5A53yVL26pFMhCWVd9fhgHyHCfewm7OcZZH
	/83zbn+eOum2fe0eN6yR6pWTbmEyyWDLPUOEOXDcDtdeD9MhieEoWX3MAffoNWAZqLTJGKEw4CL
	FXeSnmxP//uSSW10NLiW/Q3eHSU+st27aK52ZhfqRI1mWMIzxwv+mKIGV3NM24yg4Ogg6oln0yC
	Nw+ewLqr3fDGzTkkotJUicvZZiancA==
X-Received: by 2002:a05:622a:a95c:b0:50e:5eba:cadd with SMTP id
 d75a77b69052e-51305867464mr11541251cf.2.1777982463977; Tue, 05 May 2026
 05:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260505094913.75317-1-alexandru.elisei@arm.com>
In-Reply-To: <20260505094913.75317-1-alexandru.elisei@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 5 May 2026 13:00:00 +0100
X-Gm-Features: AVHnY4JaDYMfB-bS23GJEZJxoVLgopq4yapMzLa4Y79cLpgf8PCSU_XNoIqvWqg
Message-ID: <CA+EHjTy1FDraLaj520-gdP6E201qLUA9jDjDWuE4ODwXKF5V5A@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: Handle permission faults with guest_memfd
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_050107_137920_D6AF5C59 
X-CRM114-Status: GOOD (  32.00  )
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

On Tue, 5 May 2026 at 10:49, Alexandru Elisei <alexandru.elisei@arm.com> wrote:
>
> gmem_abort() calls kvm_pgtable_stage2_map() to make changes to stage 2. It
> does this for both relaxing permissions on an existing mapping and to
> install a missing mapping.
>
> kvm_pgtable_stage2_map() doesn't make changes to stage 2 if there is an
> existing, valid entry and the new entry modifies only the permissions.
> This is checked in:
>
> kvm_pgtable_stage2_map()
>   stage2_map_walk_leaf()
>      stage2_map_walker_try_leaf()
>        stage2_pte_needs_update()
>
> and if only the permissions differ, kvm_pgtable_stage2_map() returns
> -EAGAIN and KVM returns to the guest to replay the instruction. The
> assumption is that a concurrent fault on a different VCPU already mapped
> the faulting IPA, and replaying the instruction will either succeed, or
> cause a permission fault, which should be handled with
> kvm_pgtable_stage2_relax_perms().
>
> gmem_abort(), on a read or write fault on a system without DIC (instruction
> cache invalidation required for data to instruction coherence), installs a
> valid entry with read and write permissions, but without executable
> permissions. On an execution fault on the same page, gmem_abort() attempts
> to relax the permissions to allow execution, but calls
> kvm_pgtable_stage2_map() to change the existing, valid, entry.
> kvm_pgtable_stage2_map() returns -EAGAIN and KVM resumes execution from the
> faulting instruction, which leads to an infinite loop of permission faults
> on the same instruction.
>
> Allow the guest to make progress by using kvm_pgtable_stage2_relax_perms()
> to relax permissions.
>
> Fixes: a7b57e099592 ("KVM: arm64: Handle guest_memfd-backed guest page faults")
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>
> v1: https://lore.kernel.org/kvmarm/20260430132351.280766-1-alexandru.elisei@arm.com/
>
> Changes from v1:
> - Rebased on top of v7.1-rc2.
> - Initialised memcache to NULL (Fuad).
> - Copied kvm_pgtable_stage2_relax_perms() comment from kvm_s2_fault_map()
>   (Fuad).
> - Fixed KVM_PGT_FN() macro invocation (Fuad).
>
> Same as before, tested booting a linux VM on Orion O6, no pkvm, no nested virt.
>
>  arch/arm64/kvm/mmu.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index d089c107d9b7..4da9281312eb 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1576,21 +1576,24 @@ struct kvm_s2_fault_desc {
>  static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>  {
>         bool write_fault, exec_fault;
> +       bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
>         enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
>         enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
>         struct kvm_pgtable *pgt = s2fd->vcpu->arch.hw_mmu->pgt;
>         unsigned long mmu_seq;
>         struct page *page;
>         struct kvm *kvm = s2fd->vcpu->kvm;
> -       void *memcache;
> +       void *memcache = NULL;
>         kvm_pfn_t pfn;
>         gfn_t gfn;
>         int ret;
>
> -       memcache = get_mmu_memcache(s2fd->vcpu);
> -       ret = topup_mmu_memcache(s2fd->vcpu, memcache);
> -       if (ret)
> -               return ret;
> +       if (!perm_fault) {
> +               memcache = get_mmu_memcache(s2fd->vcpu);
> +               ret = topup_mmu_memcache(s2fd->vcpu, memcache);
> +               if (ret)
> +                       return ret;
> +       }
>
>         if (s2fd->nested)
>                 gfn = kvm_s2_trans_output(s2fd->nested) >> PAGE_SHIFT;
> @@ -1631,9 +1634,19 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>                 goto out_unlock;
>         }
>
> -       ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, s2fd->fault_ipa, PAGE_SIZE,
> -                                                __pfn_to_phys(pfn), prot,
> -                                                memcache, flags);
> +       if (perm_fault) {
> +               /*
> +                * Drop the SW bits in favour of those stored in the
> +                * PTE, which will be preserved.
> +                */
> +               prot &= ~KVM_NV_GUEST_MAP_SZ;
> +               ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, s2fd->fault_ipa,
> +                                                                prot, flags);
> +       } else {
> +               ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, s2fd->fault_ipa, PAGE_SIZE,
> +                                                        __pfn_to_phys(pfn), prot,
> +                                                        memcache, flags);
> +       }
>
>  out_unlock:
>         kvm_release_faultin_page(kvm, page, !!ret, prot & KVM_PGTABLE_PROT_W);
>
> base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
> --
> 2.54.0
>

