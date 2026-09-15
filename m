Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EA4C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 11:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHwyY5462BrNWWKD44RzYZzQAA37vw/UFKE/mNnKI2s=; b=BsfngzkNoXYHY0XVVKjt79dt6c
	5Cl61tThHfm4Y0lb/lisA2T1KQcn0+hx7EyLmK8r/+Bh71DVha3PDZTSdMvMWpwGEb1ua6RalTJph
	BbkXxmtFLNtWUnRRIVqJe/1jd2GJqywQ93gbwtBUZ+T9O5dfr70LuGXiyEg8lra81wVmONvYc4B6N
	qVhtFrI9aOrlwTAZSBU4Xk8JqDzs7kr3fqfMq3q7QnbeIzxX1Whau4MJtxWZ+ZBAS6ZAj4hLYP9gm
	zvewLki4v/RhsE0xog52trxXz7itdgpI0FRmee/9yPq7c4AT3Zd9zVuLFPq9iXkED/CxPD5+2nO+x
	fzTFt/Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RAv-000000065Tb-0y6w;
	Tue, 15 Sep 2026 11:18:09 +0000
Received: from out-207.mta0.migadu.com ([2001:41d0:1004:224b::cf] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RAs-000000065SJ-0BeH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 11:18:07 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=iJi4C1JJslEGfBsCdIjHmlbU2EkydfNefg0zh5bL9nk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789471083; v=1; x=1790075883;
 b=sxp2JoL2mRoYqxFq2dVWhEoVIt3iN5lkUZ8Ge3klF99/ntV+olztEZySE84/QxRgqN30HtL6
 4jlmMTJYCawLTD/wPft5SY2RoqTqc/DnUTBIEdF+YRtQK1gWF5jZ96xAZ+SSRqy2Wk+b4BxzP9c
 YOtOEiAaOe6gnmZs/fHdWTq0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 562f687ebddcb625;
	Tue, 15 Sep 2026 11:18:03 +0000
X-Mizu-Trace-ID: 562f687ebddcb625
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b78e073980so4627e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 04:17:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzXkFCc507LRMU0Vtq/bVdGobdf4wGQ+92EFlXFrSbvus9Evf3nwJfe+4Dw9TbQSe6b6hP1ddWAtIiTZ4SMEv54@lists.infradead.org
X-Gm-Message-State: AFuF++nhwGsJf6PLuojyot9ZOoy+cDWfkNXDZ0c1YwYkGa2G5W/2UZnO
	9utfKjp9SiUAUZP8hk5LOQwBsp9M5P5qNZnwS8BPcqe9RT+4JgXeDHXAoUgPm/+PrSIdx7tcTeQ
	Bgjoxzot8URbn9jO/b1x10Asz5FzDX2iqqdByd5BO
X-Received: by 2002:a05:6512:2251:b0:5b6:bcb:26c4 with SMTP id
 2adb3069b0e04-5b8b2d57c88mr134440e87.16.1789471077790; Tue, 15 Sep 2026
 04:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260915091606.2111217-1-vdonnefort@google.com>
In-Reply-To: <20260915091606.2111217-1-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 15 Sep 2026 12:17:21 +0100
X-Gmail-Original-Message-ID: <CA+EHjTz_c5BS3XgFuv61AtwgxD7WWELwuWZ3crd7_7RMvGA2Gw@mail.gmail.com>
X-Gm-Features: AcwNN1W8tXPkaYaAzpBOVgD68ymVthdN91Jk0rdnos-skeuAGBrhz5xWmc71Bek
Message-ID: <CA+EHjTz_c5BS3XgFuv61AtwgxD7WWELwuWZ3crd7_7RMvGA2Gw@mail.gmail.com>
Subject: Re: [PATCH v3] KVM: arm64: Fix protected VM fault on system with
 pages larger than 4K
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_041806_228827_35B716D3 
X-CRM114-Status: GOOD (  32.80  )
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

Hi Vincent,

On Tue, 15 Sept 2026 at 10:16, 'Vincent Donnefort' via kernel-team
<kernel-team@android.com> wrote:
>
> Just like commit 08f97454b7fa ("KVM: arm64: Fix protected mode handling
> of pages larger than 4kB") fixed the boot of non-protected VMs on system
> larger than 4K pages, align the fault IPA down to the page-size for
> protected VMs.
>
> To paraphrase Marc, pkvm_pgtable_stage2_map() assumes the address passed
> as a parameter is aligned to the size of the intended mapping, while
> HPFAR_EL2 gives the IPA minus the bottom 12 bits, regardless of the
> system page size configuration.
>
> Add a check at the start of pkvm_pgtable_stage2_map() as we do not
> support !PAGE_ALIGNED arguments and ensure callers pass a page-aligned
> IPA.

The fix is correct, and I can reproduce the bug. On a 16K-page host an
unpatched v7.3-rc2 never gets a pVM to a prompt: no guest console
output at all, a core pegged at 100% when I sampled it a minute in,
killed at the 120s timeout. A guest_memfd-backed non-protected VM
times out the same way, while one without guest_memfd boots fine,
which puts the failure on the two paths you fix. With the patch all
three boot clean, and 4K still boots both. That is QEMU with kvmtool
guests; the same three 16K legs also pass on an M4 running pKVM at EL2
on the silicon.

Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

> Fixes: ea03466e806f ("KVM: arm64: Handle aborts from protected VMs")

A second Fixes: for the gmem_abort() half? a7b57e099592 ("KVM: arm64:
Handle guest_memfd-backed guest page faults") added that call site,
and the ranges differ: ea03466e806f is in v7.1, a7b57e099592 in v6.18.

Should this carry Cc: stable@vger.kernel.org? 08f97454b7fa, the fix
this one follows, did, and 16K-page hosts are a shipping Android
configuration.

> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> ---
>  arch/arm64/kvm/mmu.c  | 12 +++++++-----
>  arch/arm64/kvm/pkvm.c |  3 +++
>  2 files changed, 10 insertions(+), 5 deletions(-)
>
> Changelog:
>
> v3:
>   - Fix nested case in gmem_abort() (Sashiko)
>
> v2: https://lore.kernel.org/all/20260914075839.4019904-1-vdonnefort@google.com/
>
>   - Use gfn_to_gpa(gfn)
>   - Drop "phys" from the PAGE_ALIGNED check, it isn't a requirement.
>   - Fix gmem_abort() as well (Sashiko)
>
> v1: https://lore.kernel.org/all/20260913173516.3122436-1-vdonnefort@google.com/
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 9ba86450fe4a..e199dd339583 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1610,6 +1610,7 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>         bool write_fault, exec_fault;
>         bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
>         enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
> +       phys_addr_t ipa = ALIGN_DOWN(s2fd->fault_ipa, PAGE_SIZE);
>         enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
>         struct kvm_pgtable *pgt = s2fd->vcpu->arch.hw_mmu->pgt;
>         unsigned long mmu_seq;

One more in gmem_abort(): the memory fault exit at mmu.c:1647 still
reports the unaligned address, and that one is userspace-visible.

    kvm_prepare_memory_fault_exit(s2fd->vcpu, s2fd->fault_ipa, PAGE_SIZE,
         write_fault, exec_fault, false);

api.rst defines the range as [gpa, gpa + size), so on a 16K host it
starts mid-page. gfn_to_gpa(gfn) is the one to use: gfn is what
kvm_gmem_get_pfn() failed on, and the L1 IPA in the nested case. x86
passes fault->gfn << PAGE_SHIFT.

> @@ -1672,12 +1673,12 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>                  * PTE, which will be preserved.
>                  */
>                 prot &= ~KVM_NV_GUEST_MAP_SZ;
> -               ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, s2fd->fault_ipa,
> +               ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, ipa,
>                                                                  prot, flags);
>         } else {
> -               ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, s2fd->fault_ipa, PAGE_SIZE,
> -                                                        __pfn_to_phys(pfn), prot,
> -                                                        memcache, flags);
> +               ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, ipa, PAGE_SIZE,
> +                                                        __pfn_to_phys(pfn),
> +                                                        prot, memcache, flags);
>         }
>
>  out_unlock:
> @@ -1710,6 +1711,7 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>         unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
>         struct kvm_vcpu *vcpu = s2fd->vcpu;
>         struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
> +       gfn_t gfn = gpa_to_gfn(s2fd->fault_ipa);
>         struct mm_struct *mm = current->mm;
>         struct kvm *kvm = vcpu->kvm;
>         void *hyp_memcache;
> @@ -1756,7 +1758,7 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>         }
>
>         write_lock(&kvm->mmu_lock);
> -       ret = pkvm_pgtable_stage2_map(pgt, s2fd->fault_ipa, PAGE_SIZE,
> +       ret = pkvm_pgtable_stage2_map(pgt, gfn_to_gpa(gfn), PAGE_SIZE,
>                                       page_to_phys(page), KVM_PGTABLE_PROT_RWX,
>                                       hyp_memcache, 0);
>         write_unlock(&kvm->mmu_lock);
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 8e4c6e4bec12..b7340c430ed6 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -414,6 +414,9 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
>         u64 end = addr + size;
>         int ret;
>
> +       if (!PAGE_ALIGNED(addr | size))
> +               return -EINVAL;
> +

Could this be if (WARN_ON_ONCE(!PAGE_ALIGNED(addr | size)))? The three
checks just below WARN on the same class of caller bug, and this one
runs first, so a bad size now returns -EINVAL with no splat.

With the memory fault exit fixed:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

>         lockdep_assert_held_write(&kvm->mmu_lock);
>         mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, addr, end - 1);
>
>
> base-commit: df2908090cda368b01ff43709f51890076c56157
> --
> 2.55.0.1032.g73a4cd73de-goog
>
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>

