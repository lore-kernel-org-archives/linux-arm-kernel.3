Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EB1FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 14:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YywTAYzjXFOYP3ncEM1wtVzQAWbVsUfph15jdqDNJS4=; b=eo9AQNcGFs+3BzYpv6C1mDTOSI
	3Z4Ebi59U4VRW0a0G6e4D2vb0GhfSN0P9DNPIALgrAfWKE+rC4UNUmBs2va/uAE4ZwO/N9Q2UQKTl
	yqeo0497CWrb7WEWWjrgaSywYWMjDhsVTUuXSy9yqSGqLaKvXeTrKPh/u2K3E81YTEFiZyImgO3P0
	AK4zWnRPNWy98lyiqzZY8UocZCJUpjXBY4ZrrMj7OOz1qHPp7NozRPULxSQW2P6AqF3gz8cs7jpKG
	aIo6r+jlTl+ZkpJJQJwhBav+BspVCDu5uUsGgjWdMdNIwt1wT87KNVSrkvKQL+qj+eiS8YT4XGfmM
	1ILI7vIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIShL-00000005b3v-0GfV;
	Thu, 30 Apr 2026 14:49:03 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIShI-00000005b3O-0Vup
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 14:49:01 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-50d836552daso616071cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 07:48:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777560539; cv=none;
        d=google.com; s=arc-20240605;
        b=JEFoP2DzG8QoU2nGVQrH5cWFuHCZePEfmWjUlB1vmk7kLB4l69nvtTxFRb+l+4/oy/
         mKGxYkzi/+qiROGJMb8PiU9pj35wcLScse02Fy/ZsB368O1UCbRqhwIfiEeAS/66AJg7
         +R3cu5BbhnzAaYFlQu6L8FNyZclA+CfLmrNt4Rru4auEzSC2Z/4hMPB5LyQnY6D0ajpN
         ImZJMOD7/8FuS4iGjQf8yfZcazHx8dcFaZCDRj/xir0MJnIlIPWt42BQFyqDrg37DG5E
         Sh2sn8f/itAt8iBS3HVPYWgArnpxh9zbvKcuEX+gk1E+XYN5GgEi9q1vRQAy3C5F6aYs
         J2Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YywTAYzjXFOYP3ncEM1wtVzQAWbVsUfph15jdqDNJS4=;
        fh=cb3OyccWdEBSMbGhVeky1I0l8CToX8PnjHpjjSRB7v8=;
        b=FK+5vMBDYSlsn2M15a35M9YjHOGgU95w/2ml3r4R1rRzE0w38fMZVgLQB1r92doFvI
         6FDXSdZDHM0oGREQsIc2zAc954aJcNR4U52XcmcwFzIWzf+ImYRZQ0e34qiokv87jEoA
         DVG0PfZm5Yr1Vt/E/F1qPMuOqNha7ZN+HAOh5oORRARQPVoqp4tw3zP2h+wQhJ4CXhnm
         2GJHlDmgE4++Z4mZ22Q3CFsR+2HQW2TwOqSJCSYc8F0RSFCVAg09G5ZbboK1MKAu7ZN2
         ysrKnjHbP9n7uDo60mljY+ye7bTq+1Su0WPkkXevAbglex6YFDvnc1XoRaQIoEPeNAVo
         Nd6Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777560539; x=1778165339; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YywTAYzjXFOYP3ncEM1wtVzQAWbVsUfph15jdqDNJS4=;
        b=DRBysRlaFVg4QhQZCw7BCAbGgnlBknDWgeaamMyZ80Muxjl/XjmswptddJDItfWaaL
         FOilL7cg54Y0dTnEHm9kbElRG79ai9JGF4HPm2gZaZUQfrS2xU25E866wTTsCLaUw25u
         PE04nzn13pIzrJoMNn9qRizXP4cOOR8P/GOEJ8riPcQzEUGjga++ajdcjf1IFv63EaQ/
         Qxr/IIZp3Q+lbUsKh6n0tw15fmg/kAmfMFVozGz2X2uJxLyQW1ExtiiT/qflRod5hy4O
         2Hgpt+2YnnGNP7Am8aZfkFglueM4fjMVTVllguGKr3+SlgQK5ygDk7ydAEdVezZ0Rno+
         evpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777560539; x=1778165339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YywTAYzjXFOYP3ncEM1wtVzQAWbVsUfph15jdqDNJS4=;
        b=YEUe0ZNZ5QTKCx6wOYsoZEG7VSIPED94MQShrhzeduaDmDxs8EO6Ej74czbY96buwX
         O+cP2zmC3YN9VD86wIW3aLvQP86W/XLqFtxnxK4YcmC0085QnYSoWhW/WkDvCZSBzjua
         J61XHHO0Fu8N5tTuhTYXB1cwa33nGXwsq+oarZoOOMzZroVs5bzOEr4kUigbnGpMAzbQ
         wGkLSMMhZHhi5hkQGnhuKNiggA3Y29A8lc/u0S34AOWrMIFLY0BRfm0BMEzJpf+eDH3p
         V3axrEzWcZc3oGtnA2DB4dX3Og49+v6TnI/wy/MiPrHgfAYjUp1ASi0wqyaFr6ti5rwG
         ADeA==
X-Forwarded-Encrypted: i=1; AFNElJ+eNBFOiXMk6JxwvRepJXrfxHtAktuhhfteXpVYBB5ku4jERe0lrc2eJTNCSgGvOt7hxmb8KJQ69+VdXOhr08DT@lists.infradead.org
X-Gm-Message-State: AOJu0YxrS8+8hpRoMIfR59/5pFQuiegfXTukARI224A1e7SkPFe+mjC6
	Q0XdfCK8J+6tLRCm4wDk60Vao8Gz6sa/sGCVgfeQJTq+iHH9GiwWUqCkVSKWbBKKKLtLpBb6MfK
	L9N9JLjs8mawOKMAFEu/YEDhwqlUCpy/Gze7wHGTu75v2BelUcQaz8Tkc
X-Gm-Gg: AeBDietNJi96YVZ0WE60hXVsbqx60cNVjOUybteB+hUAg5PErpfhgVnjkgrFfb+LH3D
	rQBcfkH4xiP/DZdIr1o2x2190bBq6iMbpMM7vpKUDJbCi92eWwOq30f7UoUfjUktl6aMMMZuBmW
	29KlPtVdCHn8bXhCXZjbZTQ2LdCVZxoUJ7dFTPWuxRolv1bIdgFJVDssWwS4wNjBGYca4gIOi0l
	NlUAru8e+17A7T7ES/8dTB7yBfsFMknxVVkThv6g2Sbyqy/4nD6QjpT8id0hjU7GcGUjz+MBODW
	+8hFqox2H9uFdF8u5FZ7RrUIo98kH07a6QyCPr7D6697Ky+tCZJcM3uobWk=
X-Received: by 2002:ac8:59ca:0:b0:50e:5e19:587a with SMTP id
 d75a77b69052e-5102a3d3061mr12769181cf.3.1777560537878; Thu, 30 Apr 2026
 07:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260430132351.280766-1-alexandru.elisei@arm.com>
In-Reply-To: <20260430132351.280766-1-alexandru.elisei@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 30 Apr 2026 15:48:21 +0100
X-Gm-Features: AVHnY4JRtjA1RscP3600FnieC9wDru5uGeiEf45iBeDn0cWuzxNjfpWJrpgZjCk
Message-ID: <CA+EHjTwZ=yFx_NEyw5YEiGqCjsfM=QotHgsCUVQmWDr6cNKLZw@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Handle permission faults with guest_memfd
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_074900_212483_2B56B366 
X-CRM114-Status: GOOD (  33.29  )
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

Hi Alexandru,

On Thu, 30 Apr 2026 at 14:24, Alexandru Elisei <alexandru.elisei@arm.com> wrote:
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
> ---
>
> Lightly tested on an Orion O6 board, without pkvm, and without nested
> virtualisation.
>
> Doesn't apply cleanly on top of a7b57e099592, I can send a patch for that if
> needed.
>
>  arch/arm64/kvm/mmu.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index d089c107d9b7..dff58de7703b 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1576,6 +1576,7 @@ struct kvm_s2_fault_desc {
>  static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>  {
>         bool write_fault, exec_fault;
> +       bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
>         enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
>         enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
>         struct kvm_pgtable *pgt = s2fd->vcpu->arch.hw_mmu->pgt;
> @@ -1587,10 +1588,12 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
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

memcache is now uninitialized when perm_fault, and only read in the
!perm_fault branch below. It's safe today, but initializing it to NULL
would silence any defensive analyzer and keep things robust against
future churn.

>
>         if (s2fd->nested)
>                 gfn = kvm_s2_trans_output(s2fd->nested) >> PAGE_SHIFT;
> @@ -1631,9 +1634,16 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>                 goto out_unlock;
>         }
>
> -       ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, s2fd->fault_ipa, PAGE_SIZE,
> -                                                __pfn_to_phys(pfn), prot,
> -                                                memcache, flags);
> +       if (perm_fault) {
> +               /* Preserve the software bits from the existing table entry. */
> +               prot &= ~KVM_NV_GUEST_MAP_SZ;

Can you please phrase it the same way as the existing comment in
user_mem_abort, as that phrasing more precisely describes the
rationale? i.e.,

   /*
    * Drop the SW bits in favour of those stored in the
    * PTE, which will be preserved.
    */

> +               ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms(pgt, s2fd->fault_ipa,
> +                                                               prot, flags));

nit: args wrapped inside KVM_PGT_FN() is inconsistent with the rest of
the file (and with the else-branch immediately below). Every other
call site uses name-only inside the macro. Both expand the same way,
but it's better to stick to the convention.

> +       } else {
> +               ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, s2fd->fault_ipa, PAGE_SIZE,
> +                                                        __pfn_to_phys(pfn), prot,
> +                                                        memcache, flags);
> +       }
>
>  out_unlock:
>         kvm_release_faultin_page(kvm, page, !!ret, prot & KVM_PGTABLE_PROT_W);

With these fixed:

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731

> --
> 2.54.0
>

