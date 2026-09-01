Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D59C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbSySvAorcA8Bd1WZykLMpA541GPoOwQGA04+HnMMXU=; b=ODQwhNPU5BDym7y8cPD5vrDP4W
	1hbzdd6De9Aczrn3mkBdFNf5CIH/aHe/wSxOjIWh5SugBjDj5pXU8Ndfm4nvfoGtpdsQfVBPEWzNj
	6IuxNl3NXKyuO4jaO6Rp7ul0SSNMDfTJJSjEeL/eXlGOf/5vIXG32nSAnpJbMbV+/AaxSKIyOp4iA
	94FWzcnCWViqsba7zjiVxOqpnZvqWRFQ7qDC26Mm5z97HVeBIDU3JVyUkLNPQ86xXoCODmEOr4xlu
	O/HwPtSNbvkfAuVmKrLO0yHfNVt3fY/eMf4GuMiR+EUBGEEQ4V4oqf2wddLGF19NdtgwKAkIkJnZV
	FTtXV/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Slc-0000000Cu77-1TQi;
	Tue, 01 Sep 2026 17:59:28 +0000
Received: from out-63.mta1.migadu.com ([2001:41d0:203:375::3f] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1SlZ-0000000Cu6m-3nwA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:59:27 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ghnI0dVMC0i09WYEQnlrUTKjsQ0zQIt9bBoCJHAIec4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788285563; v=1; x=1788890363;
 b=Vn8HyiPv7wQ4VRq1x73f8V6LaZ/H7qo1EY3HaVmA1qzQvdHJc6K93EBR+E1myUNBoBQpBUnj
 A3YCECRQMVpJt7B+KI9orJO4eBrW63KA4XB5x8VBXEdafu2FXu4rULTBS6iTdxvu/3/eSV60Jef
 PWZYf0WJMBDcEd2yUGdzskys=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2d0f795e098c9fdd;
	Tue, 01 Sep 2026 17:59:22 +0000
X-Mizu-Trace-ID: 2d0f795e098c9fdd
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b2a73da7e1so834e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 10:59:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwC5G+qKNeagBLQ3TobXuXxNa9SSJXBwsoQBP+uIjXD03BbAsLHHSoey1pdXGKMhguZsDVCXAqqL8Gqx8iNvnHd@lists.infradead.org
X-Gm-Message-State: AFuF++mggnrTwLqVt7GT33olng8xO0Eo9sgDlvGB7Cl5v0XUoJNdS9NU
	TvX8t5hLCeTHRPx7RzdTfmkl3FA2OYxxy7P7LW9nwIfFyFxSTDJDxPuymh3eO8N/JBHSvAaLwcc
	NTtagFOM1Ku0QYp3d4JnTXi863vO01TnkUkIGAhna
X-Received: by 2002:a05:6512:3baa:b0:5ae:cf5f:4a88 with SMTP id
 2adb3069b0e04-5b606b981f9mr11520e87.8.1788285561687; Tue, 01 Sep 2026
 10:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260901080941.997769-1-vdonnefort@google.com> <20260901080941.997769-16-vdonnefort@google.com>
In-Reply-To: <20260901080941.997769-16-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 1 Sep 2026 18:59:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx=dtrHxQ0npOo3aoaL0OtyXC8xcUuny6fVJzuQ1MXhXg@mail.gmail.com>
X-Gm-Features: AcwNN1WhPfiAtNZ-tbSiIqWiFtTbvqkjpgty2nafMUH-0LV6wNwKR0dVIOQ6iCE
Message-ID: <CA+EHjTx=dtrHxQ0npOo3aoaL0OtyXC8xcUuny6fVJzuQ1MXhXg@mail.gmail.com>
Subject: Re: [PATCH v5 15/18] KVM: arm64: Rename vCPU pkvm_memcache to stage2_mc
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_105926_324269_CB84031F 
X-CRM114-Status: GOOD (  19.97  )
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

On Tue, 1 Sept 2026 at 09:10, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> With the introduction of the pKVM hyp allocator, the memcache for vCPUs
> is now only used for carrying pages dedicated to the stage-2 page tables.
> Rename pkvm_memcache to stage2_mc to reflect its purpose.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Cheers,
/fuad


>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index fe5364b507f9..7aaa139ac89b 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -939,7 +939,7 @@ struct kvm_vcpu_arch {
>         struct kvm_mmu_memory_cache mmu_page_cache;
>
>         /* Pages to top-up the pKVM/EL2 guest pool */
> -       struct kvm_hyp_memcache pkvm_memcache;
> +       struct kvm_hyp_memcache stage2_mc;
>
>         /* Virtual SError ESR to restore when HCR_EL2.VSE is set */
>         u64 vsesr_el2;
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 09ae5431ce58..fa77abf8cff6 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -591,7 +591,7 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
>         if (!is_protected_kvm_enabled())
>                 kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_cache);
>         else
> -               free_hyp_memcache(&vcpu->arch.pkvm_memcache);
> +               free_hyp_memcache(&vcpu->arch.stage2_mc);
>         kvm_timer_vcpu_terminate(vcpu);
>         kvm_pmu_vcpu_destroy(vcpu);
>         kvm_vgic_vcpu_destroy(vcpu);
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index bc54f477c147..fc3a624b0c4c 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -407,9 +407,9 @@ static int pkvm_refill_memcache(struct pkvm_hyp_vcpu *hyp_vcpu)
>  {
>         struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
>
> -       return refill_memcache(&hyp_vcpu->vcpu.arch.pkvm_memcache,
> -                              host_vcpu->arch.pkvm_memcache.nr_pages,
> -                              &host_vcpu->arch.pkvm_memcache);
> +       return refill_memcache(&hyp_vcpu->vcpu.arch.stage2_mc,
> +                              host_vcpu->arch.stage2_mc.nr_pages,
> +                              &host_vcpu->arch.stage2_mc);
>  }
>
>  static void handle___pkvm_host_donate_guest(struct kvm_cpu_context *host_ctxt)
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 39aa8911f62c..dadd48431036 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -1023,7 +1023,7 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
>         ret = 0;
>         WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
>                                        pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_SHARED_OWNED),
> -                                      &vcpu->vcpu.arch.pkvm_memcache, 0));
> +                                      &vcpu->vcpu.arch.stage2_mc, 0));
>         WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_BORROWED));
>  unlock:
>         guest_unlock_component(vm);
> @@ -1058,7 +1058,7 @@ int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
>                                                       PKVM_ID_GUEST, meta));
>         WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
>                                        pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_OWNED),
> -                                      &vcpu->vcpu.arch.pkvm_memcache, 0));
> +                                      &vcpu->vcpu.arch.stage2_mc, 0));
>  unlock:
>         guest_unlock_component(vm);
>         host_unlock_component();
> @@ -1422,7 +1422,7 @@ static int __guest_check_pgtable_memcache(struct pkvm_hyp_vcpu *vcpu)
>  {
>         struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
>
> -       if (vcpu->vcpu.arch.pkvm_memcache.nr_pages < kvm_mmu_cache_min_pages(vm->pgt.mmu))
> +       if (vcpu->vcpu.arch.stage2_mc.nr_pages < kvm_mmu_cache_min_pages(vm->pgt.mmu))
>                 return -ENOMEM;
>
>         return 0;
> @@ -1456,7 +1456,7 @@ int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu)
>                                                       PKVM_ID_GUEST, meta));
>         WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
>                                        pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_OWNED),
> -                                      &vcpu->vcpu.arch.pkvm_memcache, 0));
> +                                      &vcpu->vcpu.arch.stage2_mc, 0));
>
>  unlock:
>         guest_unlock_component(vm);
> @@ -1527,7 +1527,7 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu
>
>         WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, size, phys,
>                                        pkvm_mkstate(prot, PKVM_PAGE_SHARED_BORROWED),
> -                                      &vcpu->vcpu.arch.pkvm_memcache, 0));
> +                                      &vcpu->vcpu.arch.stage2_mc, 0));
>
>  unlock:
>         guest_unlock_component(vm);
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index ee2060aa1131..8a8b694ca00f 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -760,7 +760,7 @@ struct pkvm_hyp_vcpu *init_selftest_vm(void *virt)
>                         continue;
>                 p[i].refcount = 1;
>                 if (seeded < min_pages) {
> -                       push_hyp_memcache(&selftest_vcpu.vcpu.arch.pkvm_memcache,
> +                       push_hyp_memcache(&selftest_vcpu.vcpu.arch.stage2_mc,
>                                           hyp_page_to_virt(&p[i]), hyp_virt_to_phys);
>                         seeded++;
>                 } else {
> @@ -1002,7 +1002,7 @@ int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
>                 if (!hyp_vcpu)
>                         continue;
>
> -               vcpu_mc = &hyp_vcpu->vcpu.arch.pkvm_memcache;
> +               vcpu_mc = &hyp_vcpu->vcpu.arch.stage2_mc;
>
>                 while (vcpu_mc->nr_pages) {
>                         void *addr = pop_hyp_memcache(vcpu_mc, hyp_phys_to_virt);
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 3163502cc7d2..afde0894ab15 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1553,7 +1553,7 @@ static void *get_mmu_memcache(struct kvm_vcpu *vcpu)
>         if (!is_protected_kvm_enabled())
>                 return &vcpu->arch.mmu_page_cache;
>         else
> -               return &vcpu->arch.pkvm_memcache;
> +               return &vcpu->arch.stage2_mc;
>  }
>
>  static int topup_mmu_memcache(struct kvm_vcpu *vcpu, void *memcache)
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 36e677e51f7d..83e18c0e30b5 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -182,7 +182,7 @@ static int __pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
>         pkvm_handle_t handle = vcpu->kvm->arch.pkvm.handle;
>         int ret;
>
> -       init_hyp_stage2_memcache(&vcpu->arch.pkvm_memcache);
> +       init_hyp_stage2_memcache(&vcpu->arch.stage2_mc);
>
>         ret = pkvm_call_hyp_req(__pkvm_init_vcpu, handle, vcpu);
>         if (!ret)
> --
> 2.55.0.897.gb25b4bd76c-goog
>

