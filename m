Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA249104BECF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/mMgJgBp5NGPUR+UeJAWPbefuAnvnCqo/QYTM57YQHk=; b=ZBmNJhiOJkA7lEVvO4+DBLhf/5
	bIIB/RDl/hmBGUqGM+c28NY/ALxASV+SN2OuTVO2XTR5UU4koH28HGzi7iKTCg3vvz/YV24UbFvrT
	nPpMEVkTQjmHbtn4Ut39gKLF9gVct9O8mkdsGup6a4kqeZ/APATyV0Lg9ruKlVniqrIvE1k8qpguf
	QFdiSSVD0u+als0vm1e40OY+vsxgwCpEXoaezzIHaecQhlnmYWYSu3oR/Ndx4wPKAM7zuIxqLbyES
	0PNiKEHYa5puLfDBVrN1fE3osBpNj7mQ+RuIX0Cs/9op3/0n8aF5B+o8bSDDuo1Qzlgfm8SSgn5xZ
	SoJyUTNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gip-0000000BPZs-2NmX;
	Wed, 11 Mar 2026 10:23:23 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gin-0000000BPZB-15BJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:23:22 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-50906a98ffeso521211cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 03:23:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773224600; cv=none;
        d=google.com; s=arc-20240605;
        b=PD8PHewiCoAjDnZlp8UVCSY6ZPLpH7iGoybykXkjGVqGod+oz/JZ+NUSR+EytjCcZS
         5stlhMQscOu+6UHQq6MFDaEF3Bk17hQDDKg3v1l4cX974I+OiTtmV5os7V1ur0FeBHR+
         En7Yc4HiN+yaX0QYtTj6f184dsk1tFbPJeuCYuC4UJxafVpOI7Q2HZoIo3oP1ORRJqTA
         t91NBm0Tn31nP9R3ZFIZg44BB1S/wQ4T6va4nJ4mofdLJVuuYew/NDO46vhte4DpWDTf
         bZ1ARCLCl8Q1tuMF87+Dju11bdcHa31czi18phA+qd2TNICtj7Cr+dnqb30tQk3fSYVb
         mQfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/mMgJgBp5NGPUR+UeJAWPbefuAnvnCqo/QYTM57YQHk=;
        fh=+IVR+qfUXczzFnl7cVOShXuqEj9glytXep5xJf9cIwk=;
        b=aKWaYozRG5/SUOucN1rNjLXmH0JprbmbmoDr5dIhZipG9x2TDxIgg9Qk1WQ94yneY1
         qKr8HMp+U1uS92/YlmIRxO2g7Khd6RZ/lq8raxw4YhcTMrGVMxsdGvyc54ZqzrdAkWKc
         VX3EdLCe4lrFeNt/dwVr8zdIviMpLtGigrEGolxwmbSyMWqRJ5SBbYDXS45T30+6vTfh
         sb7u0TXqGVOgkTMVvohYAPQTgr5pufKFCejfVm6DF89q0hFvWUM86znLXemCqUE8FqOo
         hmaqaA7ZqDM33jVuNtRMBWmUvLN66MGqmZMfw71v92Wf3JO5xIomv03ScTJBq+2aoSiD
         NOog==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773224600; x=1773829400; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/mMgJgBp5NGPUR+UeJAWPbefuAnvnCqo/QYTM57YQHk=;
        b=GnJywcmct5n8fgzPLyuWLTtcGQ/1UBteXI8n0SQPvgG0ajGQOJm4w5SCZZHJe+weqs
         9RGZrsLsZfBmM0K24Mn5jcWE4Xklm2NbyEU6JCp9sZu2UBeOjh00/Y9W8NT8JFlgrJHW
         PzAVKwmQokt4g1IoPrcd/SI5p4/Zzda2M0s1mfcQmOXkgpCzVLDlcVXdme0HEr+3cpL8
         4LxngwdOL62TVgC+mhZ3MvWBRe8Sl7JOs8Saw5OvntEt21+ubdH6OsnrureQkwgWOUAe
         TWD4dbeSklH6kPgLprvjrWNT5Hk1CDJzTjz6XDn7ONEfBlPV+xFrDu0hvWODJQSxT7cx
         jcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224600; x=1773829400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mMgJgBp5NGPUR+UeJAWPbefuAnvnCqo/QYTM57YQHk=;
        b=h5EUD52OAJzUSO6T4N4kCnzMoaaAxvNX5daqI3Mv7DxZEyX4T+1HLixVkm8cobhopx
         AAmydWjOMIGkrq6iAY0fSQzHA+OiiyFKANpW5+qMTY+4l0vyIxddU4Wl2IpImRTC3fcH
         AhgU7O5wpioE3O3MIGbs8ymWNLIAtJ7NWnOvZg4p0rydikZa6H42dplvNXMAPJvj+M5I
         h0fuQ89LD7WXdTZD4+mWGOe5zcXu3OA2+qHMRQHgDBVE42bwKtQWSVM9siTNxAMn0XIc
         /AxB5OQjK/rPokYLMzZqvOK1MH7CwcelojIENYXFiFOJ3CC/3lLJIdbQJfmVvRfpTGLP
         79MA==
X-Forwarded-Encrypted: i=1; AJvYcCXIQ2TxHSiEYBW62AyV2dzHsYd6kJmWNQxyUfN8IyH3L0mXFYMfC5LwDYpt/VzR/FXVGdBLh3pPDCwhzpN1B5wP@lists.infradead.org
X-Gm-Message-State: AOJu0Yye6WCjnRY6Esv2l0Oj0EezT6sAYS7vgQFou+nR8kODqZrqeip0
	z4IfSajCU4sOA0y4FFdwQK00YNxHJdXI2Nqh8cbrrWN+NKCftQg/54Ni/yHjllr+/WsNHS7CRe8
	nthxaTl5zCP4KSCkvV2aV4Nt8EryCsz1YgViV9Rcz
X-Gm-Gg: ATEYQzx/NsmBdEfN0T7NrQCmuJBomaw2o/b4K5daI5d21pvsBXDORz/Vvtbt1PoiLtL
	r2xmVxhuHlCeijXy5ffG2Zq9dtzHds17wNn6WG8WhN5RNsOBV/j98Z9cI6d3CqPGDMOKeu+/36p
	R15U7oUFVfoKDEGdd72pMZfemdX6Cc1CD3feqlLKj1Zb4LWdHbpP7HFMqcNi+HTsND3d7LHSrt0
	LOTj/dKPkAFlJp1z55fvnRuKz2XgSxjoAiF+JxXwHn1UE6NXfww11YAVva7HeVWyVaC4lykTkfj
	OySK/daPzUu/KtV7g+JUsQ59g7UMjbJdeSxrbA==
X-Received: by 2002:a05:622a:28c:b0:509:45f:fdd2 with SMTP id
 d75a77b69052e-50939a712c1mr9774361cf.15.1773224599463; Wed, 11 Mar 2026
 03:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260305144351.17071-1-will@kernel.org> <20260305144351.17071-11-will@kernel.org>
In-Reply-To: <20260305144351.17071-11-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Mar 2026 10:22:42 +0000
X-Gm-Features: AaiRm53QOriN6Gt_aOTc2-7qjZSAT70BFViqYooL3P-uIiVREeASlFd3nnmxw4E
Message-ID: <CA+EHjTygODdT5tKs7qx_8a0NwWpw7x8LRmH26bt685N7N6_iVg@mail.gmail.com>
Subject: Re: [PATCH v3 10/36] KVM: arm64: Split teardown hypercall into two phases
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_032321_342783_5DF002DF 
X-CRM114-Status: GOOD (  30.05  )
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

On Thu, 5 Mar 2026 at 14:44, Will Deacon <will@kernel.org> wrote:
>
> In preparation for reclaiming protected guest VM pages from the host
> during teardown, split the current 'pkvm_teardown_vm' hypercall into
> separate 'start' and 'finalise' calls.
>
> The 'pkvm_start_teardown_vm' hypercall puts the VM into a new 'is_dying'
> state, which is a point of no return past which no vCPU of the pVM is
> allowed to run any more.  Once in this new state,
> 'pkvm_finalize_teardown_vm' can be used to reclaim meta-data and
> page-table pages from the VM. A subsequent patch will add support for
> reclaiming the individual guest memory pages.
>
> Co-developed-by: Quentin Perret <qperret@google.com>
> Signed-off-by: Quentin Perret <qperret@google.com>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/include/asm/kvm_asm.h       |  3 ++-
>  arch/arm64/include/asm/kvm_host.h      |  7 +++++
>  arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  4 ++-
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c     | 14 +++++++---
>  arch/arm64/kvm/hyp/nvhe/pkvm.c         | 36 ++++++++++++++++++++++----
>  arch/arm64/kvm/pkvm.c                  |  7 ++++-
>  6 files changed, 60 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index 7b72aac4730d..df6b661701b6 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -89,7 +89,8 @@ enum __kvm_host_smccc_func {
>         __KVM_HOST_SMCCC_FUNC___pkvm_unreserve_vm,
>         __KVM_HOST_SMCCC_FUNC___pkvm_init_vm,
>         __KVM_HOST_SMCCC_FUNC___pkvm_init_vcpu,
> -       __KVM_HOST_SMCCC_FUNC___pkvm_teardown_vm,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_start_teardown_vm,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_finalize_teardown_vm,
>         __KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
>         __KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
>         __KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 2ca264b3db5f..911819e6e757 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -255,6 +255,13 @@ struct kvm_protected_vm {
>         struct kvm_hyp_memcache stage2_teardown_mc;
>         bool is_protected;
>         bool is_created;
> +
> +       /*
> +        * True when the guest is being torn down. When in this state, the
> +        * guest's vCPUs can't be loaded anymore, but its pages can be
> +        * reclaimed by the host.
> +        */
> +       bool is_dying;
>  };
>
>  struct kvm_mpidr_data {
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> index 184ad7a39950..04c7ca703014 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> @@ -73,7 +73,9 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
>                    unsigned long pgd_hva);
>  int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu,
>                      unsigned long vcpu_hva);
> -int __pkvm_teardown_vm(pkvm_handle_t handle);
> +
> +int __pkvm_start_teardown_vm(pkvm_handle_t handle);
> +int __pkvm_finalize_teardown_vm(pkvm_handle_t handle);
>
>  struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
>                                          unsigned int vcpu_idx);
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 127decc2dd2b..634ea2766240 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -553,11 +553,18 @@ static void handle___pkvm_init_vcpu(struct kvm_cpu_context *host_ctxt)
>         cpu_reg(host_ctxt, 1) = __pkvm_init_vcpu(handle, host_vcpu, vcpu_hva);
>  }
>
> -static void handle___pkvm_teardown_vm(struct kvm_cpu_context *host_ctxt)
> +static void handle___pkvm_start_teardown_vm(struct kvm_cpu_context *host_ctxt)
>  {
>         DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
>
> -       cpu_reg(host_ctxt, 1) = __pkvm_teardown_vm(handle);
> +       cpu_reg(host_ctxt, 1) = __pkvm_start_teardown_vm(handle);
> +}
> +
> +static void handle___pkvm_finalize_teardown_vm(struct kvm_cpu_context *host_ctxt)
> +{
> +       DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
> +
> +       cpu_reg(host_ctxt, 1) = __pkvm_finalize_teardown_vm(handle);
>  }
>
>  typedef void (*hcall_t)(struct kvm_cpu_context *);
> @@ -598,7 +605,8 @@ static const hcall_t host_hcall[] = {
>         HANDLE_FUNC(__pkvm_unreserve_vm),
>         HANDLE_FUNC(__pkvm_init_vm),
>         HANDLE_FUNC(__pkvm_init_vcpu),
> -       HANDLE_FUNC(__pkvm_teardown_vm),
> +       HANDLE_FUNC(__pkvm_start_teardown_vm),
> +       HANDLE_FUNC(__pkvm_finalize_teardown_vm),
>         HANDLE_FUNC(__pkvm_vcpu_load),
>         HANDLE_FUNC(__pkvm_vcpu_put),
>         HANDLE_FUNC(__pkvm_tlb_flush_vmid),
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index 2f029bfe4755..c4e05ab8b605 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -255,7 +255,10 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
>
>         hyp_spin_lock(&vm_table_lock);
>         hyp_vm = get_vm_by_handle(handle);
> -       if (!hyp_vm || hyp_vm->kvm.created_vcpus <= vcpu_idx)
> +       if (!hyp_vm || hyp_vm->kvm.arch.pkvm.is_dying)
> +               goto unlock;
> +
> +       if (hyp_vm->kvm.created_vcpus <= vcpu_idx)
>                 goto unlock;
>
>         hyp_vcpu = hyp_vm->vcpus[vcpu_idx];
> @@ -859,7 +862,32 @@ teardown_donated_memory(struct kvm_hyp_memcache *mc, void *addr, size_t size)
>         unmap_donated_memory_noclear(addr, size);
>  }
>
> -int __pkvm_teardown_vm(pkvm_handle_t handle)
> +int __pkvm_start_teardown_vm(pkvm_handle_t handle)
> +{
> +       struct pkvm_hyp_vm *hyp_vm;
> +       int ret = 0;
> +
> +       hyp_spin_lock(&vm_table_lock);
> +       hyp_vm = get_vm_by_handle(handle);
> +       if (!hyp_vm) {
> +               ret = -ENOENT;
> +               goto unlock;
> +       } else if (WARN_ON(hyp_page_count(hyp_vm))) {
> +               ret = -EBUSY;
> +               goto unlock;
> +       } else if (hyp_vm->kvm.arch.pkvm.is_dying) {
> +               ret = -EINVAL;
> +               goto unlock;
> +       }
> +
> +       hyp_vm->kvm.arch.pkvm.is_dying = true;
> +unlock:
> +       hyp_spin_unlock(&vm_table_lock);
> +
> +       return ret;
> +}
> +
> +int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
>  {
>         struct kvm_hyp_memcache *mc, *stage2_mc;
>         struct pkvm_hyp_vm *hyp_vm;
> @@ -873,9 +901,7 @@ int __pkvm_teardown_vm(pkvm_handle_t handle)
>         if (!hyp_vm) {
>                 err = -ENOENT;
>                 goto err_unlock;
> -       }
> -
> -       if (WARN_ON(hyp_page_count(hyp_vm))) {
> +       } else if (!hyp_vm->kvm.arch.pkvm.is_dying) {
>                 err = -EBUSY;
>                 goto err_unlock;
>         }
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 20d50abb3b94..a39dacd1d617 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -88,7 +88,7 @@ void __init kvm_hyp_reserve(void)
>  static void __pkvm_destroy_hyp_vm(struct kvm *kvm)
>  {
>         if (pkvm_hyp_vm_is_created(kvm)) {
> -               WARN_ON(kvm_call_hyp_nvhe(__pkvm_teardown_vm,
> +               WARN_ON(kvm_call_hyp_nvhe(__pkvm_finalize_teardown_vm,
>                                           kvm->arch.pkvm.handle));
>         } else if (kvm->arch.pkvm.handle) {
>                 /*
> @@ -350,6 +350,11 @@ void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
>         if (!handle)
>                 return;
>
> +       if (pkvm_hyp_vm_is_created(kvm) && !kvm->arch.pkvm.is_dying) {
> +               WARN_ON(kvm_call_hyp_nvhe(__pkvm_start_teardown_vm, handle));
> +               kvm->arch.pkvm.is_dying = true;
> +       }
> +
>         __pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
>  }
>
> --
> 2.53.0.473.g4a7958ca14-goog
>

