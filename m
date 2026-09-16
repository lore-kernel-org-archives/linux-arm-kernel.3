Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AABC88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 19:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kiFVEsh+I4WNKTfJT4Epj9n55iRRTRrDI5RnRhBGvK8=; b=ODtNWhVQMwda6kbtLx4zD1VXMy
	Boc6Kek1LqoJy5IkgF8xf8UVofcGQCQtWgS/Iryj+opdJWawxZqKa4kqIs6CN8/jruXdhVSS5lvlN
	OhlDlfPiCkyPOw5iMERlr5GekwC1sX2YTMKTwu/PtSyfOmf3ewq2bF0WFA5DyPSezinAzJr5VAMkL
	zw9wVgdXdv6Pm8HQFmNjDtmKqxPx9YjjMmjMbyf0SXAI2n9nVJiD172h37xQzeOWHgsJ5Jhvw3OO9
	DHaukegU6MooKl/jjoZoAU0H5KFmppH6HyO6glVWT8cVND+7X5A6ncpHnLwpMEGRoOF8889WR0HGQ
	P0/SXxVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vDt-0000000A1T0-2k0S;
	Wed, 16 Sep 2026 19:23:13 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vDq-0000000A1Sd-3lTX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 19:23:12 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so31157a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 12:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789586589; x=1790191389; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kiFVEsh+I4WNKTfJT4Epj9n55iRRTRrDI5RnRhBGvK8=;
        b=TMDv1wqQ6rjqBUyHqg+64FjiEY6yvpD+5h1MGbvS78oEPS4FnKg8x7cn40S+mJvvuH
         s8bioWjoz0d1G0lamj5IA8NiKRAGdYSwA0lttH/pCyaY7nKWwxRG3FiF8CNkpLjrk/HQ
         qaIKxVzl8yqvtDxgeUtRjnmp/3pLWazVj2JKQmCpC7MFMCYEpZQbzuA1TFGWOh/wrQbD
         ohQy3Xa5VU9pLeaHrE8ARsVg+kHqueaIfFYQVdVfAfFbW1AxzV3AsGhsXbHFzdoQbRDs
         DyEwMwm/PVRhNc1hhXdnzCR7jsFA6JNKkDtV2+bwc+6QjG/ZERaCSgsMqNdENeE+4GaP
         fYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789586589; x=1790191389;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kiFVEsh+I4WNKTfJT4Epj9n55iRRTRrDI5RnRhBGvK8=;
        b=OgBFrIZrpaF7SHDs8UBv7A1jOpzMxdKdyZa4fLqJ94KswqVQMvL7MfkqxsomYKwlwO
         +M+rIpD6yL4XqOqlDPWI2fOPNxi6mziEBgWBHrBKDg3tW3/pdy2c9adPRDHMymyy6nyc
         w+HmaGaB755q+t8+I/q/0Ej7ADfEwAOWlf9tMpZhEt4Z9GTYJUE0P7JMKHm8vQRzAqhs
         S6jUBg78crogUyGtF0TuJha4Dz8j4ug0mTrakj8JT4S/dLaNv3j7XsyJn5Rbaou6Sre3
         js7cENAqVkIDq8hvsOOrv0ai+W+6f2eTvLkhdJJUziUE/KaVzI1n/WfrlHvrFq+8fz37
         lB7A==
X-Forwarded-Encrypted: i=1; AKwUvBxEANCaBBAGRmaQbP7I6ZD7KUIvugzn0XkSTuGZ8z3QwVWauRZltDsAFJfQRUPLVY7PcCfW7SLEHN8K7UjrWQM7@lists.infradead.org
X-Gm-Message-State: AFuF++nbxmYPT/jKoAVHrZdh1oijnp4r8ujQsMlGoa8jrimmmdeSx8Xu
	eV5pU+kX6ClJL84WFXvUuazMcpgJuq1jXpyb6WlBFeTTvqmJl3MDArNS96v/N4rL1Bw=
X-Gm-Gg: AYBFou3eubYytohcEy+AVsUtjf1GD8LyLjmK6oX3oulZ+B1vHOvcfnOQmZfUNgnFzmL
	Tic0H2bLUlwu7k3609KK89LfkAyhUMLaJdRZdSuHVujKgLDh9J+iQ0yiGLxC6gmyBxbuQXdIUeA
	zuuYR8aq8LWdG7Mp1tLz3CV+SLJgm7jLvrzPQjzMMeKG7qwhFm4od1O0aKJeI1osIvqa067zzTp
	zHW8h7EiE1/0g891RReCok8lIu9gzEdtEt/OBsHWIBzrb4N/htYHeKLkwcZsNA2wEzKlUFY9KFZ
	J7emKgDwE193dLN2o7i2C8uk6ee1Z6PnhrhnX47RoJq96aMRwtJUdIPOTUlt1wqNT9U5k2tfR78
	ZSIOQyiVyaPdKSLjrDliC++FJEhJHMsL9nBMf0oakNMi4Fp0py45U8qVQYzxJJ9CZL/YmE71LbB
	fPZxDQJA5mc+ahT5NYdjexCydB68qi4JB0MUWB8buCI2K3fqkapsPWVYYthNQ6eWyi4wqoqNuwz
	9U=
X-Received: by 2002:a17:90b:548f:b0:39d:f731:e5f3 with SMTP id 98e67ed59e1d1-39e1e4d2ce0mr8977702a91.24.1789586588851;
        Wed, 16 Sep 2026 12:23:08 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5703:e05c:9814:52a1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e362f0f07sm931459a91.17.2026.09.16.12.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 12:23:08 -0700 (PDT)
Date: Wed, 16 Sep 2026 13:23:05 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
	gshan@redhat.com, joey.gouly@arm.com, tabba@google.com,
	yuzenghui@huawei.com, linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v18 00/23] KVM: arm64: CCA: Add basic plumbing for Realms
Message-ID: <aqrsmUTxDVbKJn8k@p14s>
References: <20260915160141.3543048-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915160141.3543048-1-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_122310_955845_F7400BB7 
X-CRM114-Status: GOOD (  43.09  )
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

Hi Suzuki,

On Tue, Sep 15, 2026 at 05:01:18PM +0100, Suzuki K Poulose wrote:
> This series is a trimmed down version of the Arm CCA KVM support, previously
> posted here [0]. Like in the v17, we have tried to split the entire series
> into the following chunks.
> 
>  1) Base RMM RMI support under drivers/firmware/arm_rmm -> [1]
>  2) Linux Host support for handling GPFs - [2]
>  3) NEW: Enlighten KVM arm64 about the different VM types and use call
>     backs for the VM type, rather than spilling the is_this_type_of_vm()
>     everywhere. Adds VCPU and Stage2 MMU related callbacks with support
>     for the existing VM types. There are other places where we may be
>     able to abstract, but those need careful performance evaluations
>     to make sure they are fit (e.g., vcpu_run)
> 
>    Later in the series, we generalise the predicate "kvm_vm_is_protected()"
>    to cover all  "Confidential" VMs (which includes Protected VM and Realms),
>    which allows us to handle common themes without having to do things like :
>      if (kvm_vm_is_protected() || kvm_vm_is_realm()),
>      instead:
>      if (kvm_vm_is_confidential())
>    Also replaces the code with precise check for a given VM type to
>    avoiding combination of if (). e.g,, kvm_vm_is_unprotected_pkvm(kvm).
>    The checks under arch/arm64/kvm/{nvhe,pkvm} still retain the vm_is_protected()
>    check as pVMs are the only possible protected VMs there.
>    
>  4) Bare minimal Realm VM support without the actual functionality to
>     run a Realm. This would help the maintainers to review the series in
>     smaller chunks. This doesn't depend on [1] and can be independently
>     merged, without being "functional".
>     This series includes vcpu operations and the s2 vm operations, which
>     do need the RMI driver backend to be meaningful. But the KVM handler
>     is in the right shape. The remaining changes would be added once the
>     RMI firmware library lands.
>  5) Core implementation of the RMI driver for KVM and actual enablement of the
>     Realm support. This depends on (1), (2) and the guest-memfd-in-place
>     conversion series v12 from Ackerley. This is available here at the integration
>     branch [3]
> 
> This series is comprised of (3) and (4) above.
> 
> The integration branch has been tested with the following components:
>   tf-RMM:   main branch (commit 5e6e2acd) compliant to RMM-v2.0-beta3 [4]
>   kvmtool: git@git.gitlab.arm.com:linux-arm/kvmtool-cca.git cca/kvm-v18
> 
> [0] Arm CCA KVM Support v16 : https://lore.kernel.org/all/20260803134403.80630-1-steven.price@arm.com
> [1] Linux firmware RMI https://lore.kernel.org/all/20260912083611.2513845-1-suzuki.poulose@arm.com
> [2] Linux GPF Host https://lore.kernel.org/all/20260913070459.2547407-1-suzuki.poulose@arm.com
> [3] https://git.gitlab.arm.com/linux-arm/linux-cca/ cca/cca-host/kvm-v18/integration
> [4] https://support.arm.com/documentation/den0137/2-0bet3/

When testing on the FVP model with the above baselines, I get the following
error messagaes in a loop, preventing the system from reaching the command line:

[    3.112577] Freeing unused kernel memory: 3520K
[    3.115398] Run /sbin/init as init process
[    3.142926] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
total 512 (slots), used 511 (slots)
[    3.150111] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
total 512 (slots), used 511 (slots)
[    3.177190] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
total 512 (slots), used 511 (slots)
[    3.197194] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
total 512 (slots), used 511 (slots)
[    3.217188] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
total 512 (slots), used 511 (slots)
[    3.237194] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
total 512 (slots), used 511 (slots)
[    3.257181] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
total 512 (slots), used 511 (slots)
[    3.277189] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
total 512 (slots), used 511 (slots)
[    3.297193] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
total 512 (slots), used 511 (slots)
[    3.317188] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
total 512 (slots), used 511 (slots)
[    8.157185] swiotlb_tbl_map_single: 241 callbacks suppressed

I get the same result with v17.  Have you seen this before?  Perhaps a kernel
option that needs to be adjusted?

Thanks,
Mathieu

> 
> Changes since v17:
> https://lore.kernel.org/all/20260908162223.1683432-1-suzuki.poulose@arm.com 
> 
>  - Add a patch to fix pKVM handling of SYS_CNTVCT/CNTPCT to override the counter
>    offset (Patch1)
>  - Restrict Realms to VGIC v3 only - New patch
>  - Add kvm_vm_is_unprotected() to replace is_protected_kvm_enabled() &&
>    !kvm_vm_is_protected() - New patch
>  - Use macro to initialize the per-flavor vcpu, s2_vm ops
>  - Add a wrapper to initialise vcpu and s2_vm ops with a BUILD_BUG_ON()
>    for the array size checks against VM flavour types
>  - Drop forward decalaration of the vcpu, s2_vm operations that spoiled the
>    fun ;-)
>  - Remove irrelevant comment about the order of timer loading for !VHE
>  - Use the explicti kvm_call_hyp_nvhe for pKVM specific ops
>  - Don't call nvhe_vcpu_put from pkvm_vcpu_put, open code them
>  - Drop cpu argument for vcpu_load() callback. We set the cpu
>    before the callbacks are invoked
>  - Drop kvm_vm_is_confidential(), instead widen the scope of kvm_vm_is_protected()
>    to cover pVMs and Realms. Add an explicit helper kvm_vm_is_protected_pkvm()
>    for the cases where we need to check for a "pVM on pKVM"
>  - Add kvm_vm_hyp_is_pkvm() for checking if the VM is running on pKVM.
>    covers both unprotected and pvms. But really uses is_protected_kvm_enabled()
>    under the hood
>  - Add kvm_vm_hyp_is_distrusting() to cover pKVM guests (both protected and
>    unprotected) and Realms. Use this for preventing the vgic v2 mapping into
>    Stage2 for a guest
>  - Drop superfluous !kvm check from kvm_vm_ioctl_enable_cap() - Sashiko
>  - Drop KVM_CAP_CREATE_IRQCHIP, as we don't support VGIC_V2 for Realms
>  - Filter out the vm_ioctls that are based on blocked cap.
>  - Repurpose the pkvm plumbing for filtering the caps and ioctl to generic
>    and plumb the Realm support in
>  - s/PKVM/pKVM for the comments
>  - Drop type argument for pkvm_init_host_vm and also drop protected variable,
>    now that we have the vm_flavor to check.
>  - Use kvm_vm_hyp_is_pkvm() to replace is_protected_kvm_enabled() with valid
>    kvm instance
>  - CCA: Merge the GET/SET REG handling patches into a single patch
>  - CCA: Reword the commit description for SVE VL access handling
>  - Reordered the patches to group the Realm realted to changes to the rear end
> 
> Jean-Philippe Brucker (2):
>   KVM: arm64: CCA: Expose SVE VL register before VCPU finalization
>   KVM: arm64: CCA: Control user register access for Realms
> 
> Steven Price (3):
>   KVM: arm64: Avoid including linux/kvm_host.h in kvm_pgtable.h
>   KVM: arm64: CCA: Support timers in realm RECs
>   KVM: arm64: CCA: WARN on injected undef exceptions
> 
> Suzuki K Poulose (18):
>   KVM: arm64: protected VM: Handle set_one_reg CNTVCT_EL0/CNTPCT_EL0
>   KVM: arm64: Disable Steal time accounting for protected guests
>   KVM: arm64: Include kvm_emulate.h in kvm/arm_psci.h
>   KVM: arm64: Track the type of VM in kvm_arch
>   KVM: arm64: Refactor the vcpu_load to allow for VM specific callbacks
>   KVM: arm64: Add vcpu load/put call backs for flavors
>   KVM: arm64: Reuse kvm_stage2_unmap_range in kvm_unmap_gfn_range
>   KVM: arm64: Add VM specific callback for S2 MMU operations
>   KVM: arm64: Abstract out memory abort handling
>   KVM: arm64: Use kvm_vm_is_unprotected() for !kvm_vm_is_protected()
>   KVM: arm64: Widen the scope of "protected" VMs
>   KVM: arm64: Add a helper for VMs running on hyp that don't trust the
>     host
>   KVM: arm64: CCA: Add a new mode for supporting Realm guests
>   KVM: arm64: CCA: Add VCPU load/put for Realms
>   KVM: arm64: CCA: Add bare minimal S2 operations for Realm
>   KVM: arm64: CCA: Introduce Realms
>   KVM: arm64: CCA: Mandate VGIC_V3 for Realms
>   KVM: arm64: CCA: Don't expose unsupported capabilities for realm
>     guests
> 
>  .../admin-guide/kernel-parameters.txt         |   3 +
>  arch/arm64/include/asm/kvm_emulate.h          |  16 +
>  arch/arm64/include/asm/kvm_host.h             |  63 +++-
>  arch/arm64/include/asm/kvm_pgtable.h          |   6 +-
>  arch/arm64/include/asm/kvm_pkvm.h             |  25 +-
>  arch/arm64/include/asm/kvm_rmi.h              |  61 ++++
>  arch/arm64/include/asm/virt.h                 |   1 +
>  arch/arm64/kvm/Makefile                       |   2 +-
>  arch/arm64/kvm/arch_timer.c                   |  37 +-
>  arch/arm64/kvm/arm.c                          | 330 +++++++++++++++---
>  arch/arm64/kvm/guest.c                        |  73 +++-
>  arch/arm64/kvm/handle_exit.c                  |   2 +-
>  arch/arm64/kvm/hyp/nvhe/pkvm.c                |  28 +-
>  arch/arm64/kvm/hyp/pgtable.c                  |   1 +
>  arch/arm64/kvm/hypercalls.c                   |   4 +-
>  arch/arm64/kvm/inject_fault.c                 |   1 +
>  arch/arm64/kvm/mmu.c                          | 210 ++++++++---
>  arch/arm64/kvm/pkvm.c                         |   6 +-
>  arch/arm64/kvm/pvtime.c                       |  14 +-
>  arch/arm64/kvm/rmi.c                          |  18 +
>  arch/arm64/kvm/sys_regs.c                     |  29 +-
>  arch/arm64/kvm/vgic/vgic-init.c               |   3 +
>  include/kvm/arm_arch_timer.h                  |   3 +-
>  include/kvm/arm_psci.h                        |   2 +
>  24 files changed, 758 insertions(+), 180 deletions(-)
>  create mode 100644 arch/arm64/include/asm/kvm_rmi.h
>  create mode 100644 arch/arm64/kvm/rmi.c
> 
> -- 
> 2.43.0
> 
> 

