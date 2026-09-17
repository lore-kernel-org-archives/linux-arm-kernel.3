Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786AFC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRPfZxZL7iiKajZEZpQuenLhAMrtnttjwuYtcsC7ahY=; b=C2/LD7golHOm9GnWHBK7CMkfYa
	BBe/itiHfl++/XhMv9IDekVCLC9+SV1l6wWWBUoXktIu3+xhYkCzToOAXAtsycWbtUj0mSPJdi4Xj
	tc3hsw2eKB1d7XtEfWcePHhwxMFYCrDLQuNegAoZYheoLmXgeody4qrvkqqokz3yxnLoidZHPa7y9
	9otXcYWZdudrzd5zKEyahI4YlFAdNGTI73DdV964BvCgW1ChR8x8N3DzdBild0I3F/78tZk0OO8VQ
	0KlhX1sYJFuHil/WegLbrG2Oou8s9zR52kdm2JPp6cZ1DVmMgO8n68tEfT5+AHI0UESIwwiZSfPD4
	LUnAxUBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DAM-0000000BY0l-3m6A;
	Thu, 17 Sep 2026 14:32:46 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DAJ-0000000BY06-2Tnl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:32:45 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5b83c1421ecso2847e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 07:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789655561; cv=none;
        d=google.com; s=arc-20260327;
        b=DDvJA4rqlVnD0F/9RiD8JJ7vwa/oSlVXHZSC8QYBTHV82U8rbVGuHtVu7UqsQM/dZs
         hAaf291nF8O5r5kRpu4pO7Gqk8rnqWL3qZWuQ0/GUZx4/D8tRsSKjLv53dQSWshOFG4s
         WMFy3FbmCcmXPeh3jK1tzul9K/5yssLTHSIJJpsvJeKLMHaFMJ+WkFK0S7llGRX5h9B5
         4nDr5rBTORRjT70XocQkwqc9Ha88B8jj6feE6KCljClwFJSuXdy+V7hRlEJESj6rUDfj
         qQw5G+k2zfpwAv2WF3y4yt++MSgtAygLa0CLJsb7IuMadrbideCAmBkBrUtWsk/Dgnc4
         6rnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PRPfZxZL7iiKajZEZpQuenLhAMrtnttjwuYtcsC7ahY=;
        fh=aV8RnjLUP0WCcfye62ZlgrVZAm7yzwy7slTJZ+drGAM=;
        b=g2LKLAZDc+1Aj3GpiP/o0JiCY3FjBc6+9Mkkq0smHjWZnCjEwU5EyNOLVej5CPYKIn
         r8I4R2YScmYiuWUehgj16b3hT40LZYCgagXPM6bMObqsXM84FVsQFUg8SPrxOQlIMEjx
         kJHIKvOSbVYk3b+wSxs1AzPzK5Ec/deMK3shiJ9Pm2ye2+uoFvzd+q11UNDXRX0Ph4fq
         8cw7nZ+XWp4WIZ8CS4+M06EttfvPzFb74OOtycFkYhI2tbKNxjakE12jsPSQiyDTsN6D
         3ldB55pe9ozz3VV7dK58aWHAFjqkztSaVdcgKqJdcQqoOI7KShXmWP4vpbKyOT6KII5I
         OtbQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789655561; x=1790260361; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRPfZxZL7iiKajZEZpQuenLhAMrtnttjwuYtcsC7ahY=;
        b=uN3NSK45QcEv4m6gZDzC7VEboOdqTTb5pF41MCo7dFPcpFxwplU9boPviUVFcXgAhE
         P4M1uI/8fvUZgaL2XFTuvFGLeST58pYrt9EPsMbXjNHrI/BAHZJSWcumusmYYCUiXE3P
         19zcrbQvV3fM9Vy5vrewqGcYBlYYc/dbirJATh3wrC6pUHvaqORlDWOdMuCTPNcyI+Ss
         w1gAlrSXoTh1G9DY5KmeSSBPDlej+ni6uHUYwYF/GCSmB2wGQgaqlfddLcvhQn7gsWMw
         xmL4sbImUgxjs3WlpZOLbvf68EfplZlyV3tuX2jwRpeGU3aVkKPXy1fAVNC43xyCTo7+
         UsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789655561; x=1790260361;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PRPfZxZL7iiKajZEZpQuenLhAMrtnttjwuYtcsC7ahY=;
        b=dr48hun5m08IeUKn6CrvzOOzo5ntNaG8vr4Xusj4wQNlT6PB+MfkbwROk3IpSzDN53
         4V5q3S8VxXyaSljNnK6GmVxF5+DvJm4gHIDFv+6nesglw1L7nIV4BXOT2n5AFdCI3nuC
         6gNvR4AovR0KOK3zSIAL4lC5UJEEU1IT66sajhAziV9fGxlCisbeXNn1PfPt9UtKLevv
         HAMVXoGun4l3dd/DcxTkCeQKrF024P5674WXTF+QQ7tuuJXR9ywDmy6arhadEwqX9m20
         z/Jor2y+4di/91Mg8a3MrYTv3whxQ9Mr2ptTVW8aK8F0NFmIB8XVu0hsr0SUzhe4IgsI
         cX2w==
X-Forwarded-Encrypted: i=1; AKwUvBxgxWNgUn9UpOPbIXdcHT8kgwjHHOMcBmpaEjuhJSK7E4I6hZMWNt/+22R+DgSPHwNnOF6lSJEiLs5LAepofw96@lists.infradead.org
X-Gm-Message-State: AFuF++njmWkS36H6p+e83lKgTBQhMk/eu5/+OXN2mxGszA7/ldtnqc+F
	yk8O5+UnTH8o5Gr6Zmin9Z3/VOLggY7hYV7+5YhW1bxJ4qf4tVUZRFknyn+iOQk8OweAk5niMA8
	rChWE7+PlRD1BN84aJ2KcWPJlNqFT0JpOpM6UwaXn
X-Gm-Gg: AYBFou186UfLW3OHPK3dCcIOP8bIvgCQEyWiQpEsogEZuHHhA/34gGWdYxPsrSR8NTt
	UBWTzcWdThp+KY2KdOpwabmCjYAYR7l+zrhd3CTbNhqyKwG7F01G5CAr+6NsnmtnxDE+eyv1McL
	i46uPr+cjbPVBEgowAqSR7ZgprJeonaizheDZQHk2Eymzh91cKGKzaSogWSHLeGH230wIeNIVfs
	FdKzWjXlGDxnh3Ksx+l4Lk6Foq0ZCDqti6+DVbI0dOCMv7tKT0KYXRbu+ZmlpcstDd6xvOqwcxs
	cftD+HNrtTyhtl2q6wVoleJA8ybXCSa90MjsQ3CoY1mX7l3gG0ZuOKppYOuZxlINHY6tdz3pRQx
	g0awFm2iYtQ7z71yxAD5OOAeo
X-Received: by 2002:ac2:5688:0:b0:5a4:ec:53d9 with SMTP id 2adb3069b0e04-5b8bff1625cmr55295e87.1.1789655560856;
 Thu, 17 Sep 2026 07:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260915160141.3543048-1-suzuki.poulose@arm.com>
In-Reply-To: <20260915160141.3543048-1-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 17 Sep 2026 15:32:04 +0100
X-Gm-Features: AcwNN1W_068MDIwpUtuw49Yy1PeVxQfVd9fKCVvGdj2PjeQoOQdH9b0b6js4h-g
Message-ID: <CA+EHjTzfgoZ6pxoGx-PjV5O4QfmPZrCjSrBAvoS-V2muLBVM8Q@mail.gmail.com>
Subject: Re: [PATCH v18 00/23] KVM: arm64: CCA: Add basic plumbing for Realms
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_073243_691256_CA3CC3EC 
X-CRM114-Status: GOOD (  39.27  )
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

On Tue, 15 Sept 2026 at 17:01, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> This series is a trimmed down version of the Arm CCA KVM support, previously
> posted here [0]. Like in the v17, we have tried to split the entire series
> into the following chunks.

FWIW, this boots and runs guests on VHE, nVHE and pKVM (protected and
non-protected) under QEMU, and on an M4; arch_timer and get-reg-list pass.
Didn't try it on FVP.

Cheers,
/fuad


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

