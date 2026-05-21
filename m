Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E811CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 13:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qcoIhRMp2hHtmr4CvB3pe37gaux5p82rVkRQn7hzrE=; b=zc3rr1Rl5y33BSxxdxfk0rwdaW
	IylUgY0GgP9MOtfdfB8g+eVB/sEcXIPjhvdC5NixMqBr8oD9xrHMbIhrQfGoa+jeZ83nQocW4/1MK
	tzSyOiBfx4MbC1iWWwzurcsmU/r3o81k8LFXpeyJ08M5AIteG5qLDVTW7XfAjwXsAYXpZqpqmitGL
	z1A9GIh3zqtak7tjQa8AVnjHyApLhVcb1NY1t4yPHMKUbdUqBx6VbOpz7gyT8Or/JTtETABH+iVWM
	wMFqx3Jcen9cJ6O7xMZlpUr2ySQ1NZSbLANpHC2M0gp9Q8qJldoL9pEIqWG0JxQiNPpSVNn5dx5Oz
	PzXzGtXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ38S-00000007onk-0dJZ;
	Thu, 21 May 2026 13:08:24 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ38M-00000007olR-3tuT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 13:08:20 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-50e61648f10so25431cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 06:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779368898; cv=none;
        d=google.com; s=arc-20240605;
        b=A3Wppr7h/O6evkkeMl3o7Le7pPITWEfXlXaahFIIch5GZg9R3YQJtv5nfkWMcrM/cX
         B48+qK34oMKbdEqj5G4wTU6jnVcIV8LtMeBIrvve3nu7zjyzfXUt57l2yB05jK4c4bXg
         bxD7lqwTyVE+o3t2EGFE0SaZFHCpKNKEbP8qdj6acOx1QLn2NPQMamQe8nA9THjgsScr
         N8oRQr9iXaxB8jgpnXpZ59oRi2kdotlP3s1k88l6gKkNAP2hGkyZ9+jo/vh/kpCFaw3j
         H48wlJEOOzCcJDS1XIMLxd5zWLrmMstoXVl4ffSkK+3Dc+7Xed0WghCtUVhUzZ4z8vwv
         1jtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7qcoIhRMp2hHtmr4CvB3pe37gaux5p82rVkRQn7hzrE=;
        fh=eORRtD76wHV8eGPJwysKOnNLPGwORV4v+GbTPybdWGs=;
        b=SFOrae7JnJxVVdw+UQQozbYl7r87kvTntr45144a52DutAvTbgOrBvCj1HXcjEql/i
         CR+MUE5RVL7FHrbqRWIO004sAn+fpX+KgrGHyYWmXY22sjUo+vTDesjGP5AJcX6BlzsR
         A9yZzcVSaZBiCfOFq9OAc6maerqVJ3VQ4YVIi1CQe1QPz7UR0aWC7gbqNrdOP7WbVHdL
         1F4WzeK6SaHxWM/h9aVT3rZ3+F3WVWlhkUUj/YxoN4Nu9lVm/qJ12/mTaKURU+V0OkfB
         wKj1sXutzyvSsuK+tjgcNSRhmhxNL7wPsYH3M80QAUUs9GpmBzbyuqses1YLyG70wwf6
         S7pA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779368898; x=1779973698; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7qcoIhRMp2hHtmr4CvB3pe37gaux5p82rVkRQn7hzrE=;
        b=dpaJPCXtsT5Os9yvD634FNHJawLSFaLmfgs2vkV+2kAXEuxBs07S+OVW0+YZSkY/lU
         A6SqyV19jF0ebx1ahYoLN3GObzS/1PDs8kUNjCL3mTJZ43NwxNVUe4H28CFusz957nCN
         X7p4w+MTGGtM9qxN0FxwgJhcnT967YDAOaiZ84+6h7dWOYbLUxfxzt4riWcwtR3aXHg1
         NyuSh5Gbw8q2QBNP/pvs/oWfR1/pfsJesOQ7O8TRbBUmW47cFN6M1RkaRomS1T72mal0
         qWE+PWaBBF3zSgCwAlMr8qYyTkHDkJNgY/yTmOJpsuDOcFFEw39n8aAV13YMrtDbHF7X
         WR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368898; x=1779973698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qcoIhRMp2hHtmr4CvB3pe37gaux5p82rVkRQn7hzrE=;
        b=MBGMBKaFj3tFbucffj1zVz17rq+7+M17s9vG1mlz3fsu2DEaJoQ0oUIwKflTyXx4R5
         VX5OxQzAyK80m7B4eUUGTm1S8SLDopJlRtk/SYIpTrqUGRw5ix7OvbUvBBE5HG6pHA6M
         BKi2WrEhikBr58M8tWdI3g6NExOrBjgkf5hibhsoIiRbiBv57AOVh/n6w79LR0AEm2Ib
         HJU4vytn+YbV9T8leLV2L7CvKkiEegP7PjgDU2pZdKWdv/Gi+CXfi0meQN77fBFXiL0r
         AxLEStuujQl2QR5yPH+z67D8GZ2Pp+939DvV4NoOZmDJL2RUZf4SER/o4XOvf9rIA8kP
         RBHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zpvPP+YRn536oRlPH8LxJL4VGkUkOIfqbODQCIM5bybK0PB06oZLyAiJb7A9yflWm6p6TxC2OEIypEDoJrjX9@lists.infradead.org
X-Gm-Message-State: AOJu0YwSCONqGnnUU2WXFzpK9ixDkWDXUu1fWeKKm99UDXa4P1KjpFRD
	gQGNAgDrJi+dzvnfKY6917v/drs0na1+i7SmD2admn8/gpr0eiOC6aXmGIPpToYdjxU3uY8U73I
	J9d2bNIvUrC/bLoVRWgSfTALccag2sIxFpOahSgfG
X-Gm-Gg: Acq92OFBKU3BMtE+ZOMtPhKPgOJ+/aSIo2B93W2MF83rkVEemR+3FBo0F1FlMsfbvEu
	7Lti2Vg/r/h8eOcfxLctgG3GBYHEIr74uVi5wQWIrGrWPJ7ROT7UXwldKUMJ+A6rPfu5dodaQTJ
	fs6EIqL10B5cfQl0jmCgVTrl9f/Xi5ww0Dusao0Sz4owab1W2eeitcp63LNi+primaIjy08xTLc
	hDFip+bzOZQnMP8uxmIGrGsPHhBi2y98nb6BoW21yZdW/VxdDtlXC7C6EMZ0W3VnMVaKQMEsvtg
	OneLAXZmOLhrhsivmbg=
X-Received: by 2002:a05:622a:5147:b0:509:15b6:f6a0 with SMTP id
 d75a77b69052e-516c533a032mr9305501cf.6.1779368896993; Thu, 21 May 2026
 06:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260521102149.804874-1-vdonnefort@google.com> <20260521102149.804874-3-vdonnefort@google.com>
In-Reply-To: <20260521102149.804874-3-vdonnefort@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 14:07:38 +0100
X-Gm-Features: AVHnY4IwdyJUF6N7KOmOm8J65aeDnjPa9uIN8Ouuh7oIvNZjx6QliKAb-K6hl-A
Message-ID: <CA+EHjTzq_Nvfwzyz6GOLkkLUaLijS6BoM9XOqMEwxtGguqqmHQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] KVM: arm64: Fix __pkvm_init_vm error path
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_060818_983576_EC5E0E1B 
X-CRM114-Status: GOOD (  17.70  )
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

On Thu, 21 May 2026 at 11:22, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> In the unlikely case where insert_vm_table_entry fails, __pkvm_init_vm
> release the memory donated by the host for the PGD, but as the stage-2
> is still set-up the hypervisor keeps a refcount on those pages,
> effectively leaking the references.
>
> Fix the rollback with the newly added kvm_guest_destroy_stage2().
>
> Fixes: 256b4668cd89 ("KVM: arm64: Introduce separate hypercalls for pKVM VM reservation and initialization")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


>
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index 3cbfae0e3dda..4f2b871199cb 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -56,6 +56,7 @@ int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot p
>  int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id);
>  int kvm_host_prepare_stage2(void *pgt_pool_base);
>  int kvm_guest_prepare_stage2(struct pkvm_hyp_vm *vm, void *pgd);
> +void kvm_guest_destroy_stage2(struct pkvm_hyp_vm *vm);
>  void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt);
>
>  int hyp_pin_shared_mem(void *from, void *to);
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 89eb20d4fee4..42b0b648f32f 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -306,16 +306,21 @@ int kvm_guest_prepare_stage2(struct pkvm_hyp_vm *vm, void *pgd)
>         return 0;
>  }
>
> +void kvm_guest_destroy_stage2(struct pkvm_hyp_vm *vm)
> +{
> +       guest_lock_component(vm);
> +       kvm_pgtable_stage2_destroy(&vm->pgt);
> +       vm->kvm.arch.mmu.pgd_phys = 0ULL;
> +       guest_unlock_component(vm);
> +}
> +
>  void reclaim_pgtable_pages(struct pkvm_hyp_vm *vm, struct kvm_hyp_memcache *mc)
>  {
>         struct hyp_page *page;
>         void *addr;
>
>         /* Dump all pgtable pages in the hyp_pool */
> -       guest_lock_component(vm);
> -       kvm_pgtable_stage2_destroy(&vm->pgt);
> -       vm->kvm.arch.mmu.pgd_phys = 0ULL;
> -       guest_unlock_component(vm);
> +       kvm_guest_destroy_stage2(vm);
>
>         /* Drain the hyp_pool into the memcache */
>         addr = hyp_alloc_pages(&vm->pool, 0);
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index eb1c10120f9f..3b2c4fbc34d8 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -853,10 +853,12 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
>         /* Must be called last since this publishes the VM. */
>         ret = insert_vm_table_entry(handle, hyp_vm);
>         if (ret)
> -               goto err_remove_mappings;
> +               goto err_destroy_stage2;
>
>         return 0;
>
> +err_destroy_stage2:
> +       kvm_guest_destroy_stage2(hyp_vm);
>  err_remove_mappings:
>         unmap_donated_memory(hyp_vm, vm_size);
>         unmap_donated_memory(pgd, pgd_size);
> --
> 2.54.0.746.g67dd491aae-goog
>

