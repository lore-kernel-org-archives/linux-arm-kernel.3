Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C76103E305
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 15:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GlDoUZqv12CD3hXKENcdmNwTrtdAgu339Wi9YV5GI0A=; b=xOAM0TLMVEzfzmz6kitTiUHslm
	6Px/4nxPiIad6aK2hf9E+s6eCC9Qh/xEVdAHfJbr/eIAY6YUi+ATpwlv3///skOsrpkfjENIqCVAr
	iwW5UvMrYLxymzxNy2ZM15xeeSdZR68lApbAL4ma34SS8JJe0hV4Oa6uKBa33Ka75x5pgzmx8xlFe
	DPc8e187vruf0xSr9Q0EXg+gz+bdO0F8mIc1heBVCkcB70I4HY6s5Wzcq+So1ibU6tVW+D87TBOOP
	Pt513eovGwNaAUrymw0P4dPQ9smy5jk5n3Jbrhgy/A9JiuCLvPNFbL2tKag+2OSn2ukA79o+xREnu
	da42fAcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14UK-00000000Ycu-33dE;
	Fri, 13 Mar 2026 15:31:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14UD-00000000YbV-1rbw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 15:31:39 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4852af55981so80395e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 08:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773415895; x=1774020695; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GlDoUZqv12CD3hXKENcdmNwTrtdAgu339Wi9YV5GI0A=;
        b=obYtzMALveTGBYGnDXBfocbdL1e1oWgZmGggovgMqGNqgQ2fl85M2Da0ToNlJT5KVR
         8w8fQA2/JVSSp5Gw5IgUaBCZw91uDg0a5V4O29Ast+Icho+QTlizIxApaNFp318AWoan
         83aaVg4Vtc1qal/2dQi7EajcM5n6fLv7IhSz3+8U2786eUoQkuq9Z6bfz4vw8jSoIF+f
         6Mz78fAWLPw7ZXXwkuzENi5o0Wh2sy38V0C2wCrAgA01HRwPweZLBPqQKfH9s+mXKSzH
         qLSBtymyuSfvWHEm/7h+hd/xkVmbch/BkKL6P9Rg4bFz4gbHj4ttfKGDpBiWe9HwTp1X
         lsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773415895; x=1774020695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GlDoUZqv12CD3hXKENcdmNwTrtdAgu339Wi9YV5GI0A=;
        b=lHAeYA0W3LY7Od5XAMBYrc8Pnhp+hJ4oIGieOL6QrSL6zH/8IktI1kWZlWyOS6A24m
         Iy6xsCuob2u+YlTaou0WB2+wHP445YehjdhoXnGiCf6fgf95bsBN2fIrlOveupAk7YyB
         Jtf/xsZhzN1ej8xg8QSETxv99kWeZR9pwW1h9STqazWQ9KQxegQBlY8JSgQBKqhoc2MM
         QLnqtBzXBVYeXCr3YPZcchvXR1Fx67thNkTKwFImVC22/rKyBtTdpeeAFdMC8gU8WeAG
         cBQENSSmZ4VtYJn9EKLhDzxNUAs8PecrvONHpeiA068kn7U7ejF+36VV1kcKC6LR+LKw
         obUA==
X-Forwarded-Encrypted: i=1; AJvYcCX2MHTGwYX8Lpi6oLDOU2bOIPzHxcppJdxF0BgG/Gd0+YEFTLU1ph+DjZvQu+zh3Qf4rc5xEfN4KhvluFLNQUCN@lists.infradead.org
X-Gm-Message-State: AOJu0Yye0U8rwZk7GyC5EQ3PJh+tKcEfebqFyri+gnNe7DLvw/0/3WqH
	BswOfjOYtJu9+Ucc9mSzkX8UKa6j4z3uUIgqPZAtB672Sn3Ynr5bglHsBP6QXLyHHw==
X-Gm-Gg: ATEYQzxYvlD4EMbO5kID9qzNVm0eLAvDkNuAFa4KH70nVKvlLiLXGyTsF8YBlAS6Vd0
	jlRp4DJkPbpwPV3pcIePw+7Sbc6D9oGy8Z+qkF5OiC5UKrz4+Pjo6hGo111RtkwsrGA0oDsH8tX
	7KYu18K9laPKnW/0beljyuOlnSSJo2JTCRYPnrWPH+gblSDxASsUXe9ZMTDhvTchnmuzQIrFvjh
	MXcLLlO6gU59MyQsw5Ni54Vwuf52Su0KxEExXet5mCmN5OcA2SmNS2x3kJm23MRUyFXZ7dZLeUB
	GNXsbdHcYTlt4tZwA+EjGi5t21MGTc2YQ6cbK1iTYAfEn1lPPbH+a0saTROqv2vqtDCjGZtzut0
	G91oUMXPhIl9WbfwT0+IKDdH/ar2IlOV1s0zPLLqeCrXLb3QwkrKJukAGeUCwjNoaVPgR5Ys+o1
	A3zipoIs98wWdhF6U6Nlw+QraDJvQbOia9KQONTLAfD/g6ed2Y1t0cu1AU
X-Received: by 2002:a05:600c:4848:b0:47e:dbb0:fbcd with SMTP id 5b1f17b1804b1-4855670e6c5mr696295e9.6.1773415894813;
        Fri, 13 Mar 2026 08:31:34 -0700 (PDT)
Received: from google.com (54.95.38.34.bc.googleusercontent.com. [34.38.95.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22e9ddsm15981754f8f.37.2026.03.13.08.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:31:34 -0700 (PDT)
Date: Fri, 13 Mar 2026 15:31:30 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>
Subject: Re: [PATCH 00/30] KVM: arm64: Add support for protected guest memory
 with pKVM
Message-ID: <abQt0l8BjwGJqXe-@google.com>
References: <20260105154939.11041-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105154939.11041-1-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_083137_533114_3926DC5F 
X-CRM114-Status: GOOD (  39.69  )
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

Hi Will,

On Mon, Jan 05, 2026 at 03:49:08PM +0000, Will Deacon wrote:
> Hi folks,
> 
> Although pKVM has been shipping in Android kernels for a while now,
> protected guest (pVM) support has been somewhat languishing upstream.
> This has partly been because we've been waiting for guest_memfd() but
> also because it hasn't been clear how to expose pVMs to userspace (which
> is necessary for testing) without getting everything in place beforehand.
> This has led to frustration on both sides of the fence [1] and so this
> patch series attempts to get things moving again by exposing pVM
> features in an incremental fashion based on top of anonymous memory,
> which is what we have been using in Android. The big difference between
> this series and the Android implementation is the graceful handling of
> host stage-2 faults arising from accesses made using kernel mappings.
> The hope is that this will unblock pKVM upstreaming efforts while the
> guest_memfd() work continues to evolve.
> 
> Specifically, this patch series implements support for protected guest
> memory with pKVM, where pages are unmapped from the host as they are
> faulted into the guest and can be shared back from the guest using pKVM
> hypercalls. Protected guests are created using a new machine type
> identifier and can be booted to a shell using the kvmtool patches
> available at [2], which finally means that we are able to test the pVM
> logic in pKVM. Since this is an incremental step towards full isolation
> from the host (for example, the CPU register state and DMA accesses are
> not yet isolated), creating a pVM requires a developer Kconfig option to
> be enabled in addition to booting with 'kvm-arm.mode=protected' and
> results in a kernel taint.
> 
> More information about what is and what isn't implemented is described
> in the pkvm.rst documentation added by this series. The intention is to
> update this file as we introduce additional protection features and
> ultimately to remove the taint.
> 
> The series is loosely structured as follows:
> 
>   Patch       1: A dependent pgtable fix that I sent out previously
>   Patches   2-8: Cleanups/fixes to the existing code to prepare for pVMs
>   Patches  9-14: Support for memory donation and reclaim
>   Patches 15-22: Handling of bad host accesses to protected memory
>   Patches 23-25: Support for SHARE and UNSHARE guest hypercalls
>   Patches 26-27: UAPI and developer documentation
>   Patches 28-30: Selftest additions for new page ownership transitions
> 
> Patches are based on v6.19-rc4 and are also available at [3].
> 
> All feedback welcome.
> 
> Cheers,
> 
> Will
> 
> [1] https://lore.kernel.org/all/aS9rmMgNna7I5g4F@kernel.org/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/log/?h=pkvm
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=kvm/protected-memory
> 
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: Joey Gouly <joey.gouly@arm.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Zenghui Yu <yuzenghui@huawei.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Quentin Perret <qperret@google.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: Vincent Donnefort <vdonnefort@google.com>
> Cc: Mostafa Saleh <smostafa@google.com>
> 
> --->8
> 
> Fuad Tabba (1):
>   KVM: arm64: Expose self-hosted debug regs as RAZ/WI for protected
>     guests
> 
> Quentin Perret (2):
>   KVM: arm64: Refactor enter_exception64()
>   KVM: arm64: Inject SIGSEGV on illegal accesses
> 
> Will Deacon (27):
>   KVM: arm64: Invert KVM_PGTABLE_WALK_HANDLE_FAULT to fix pKVM walkers
>   KVM: arm64: Remove redundant 'pgt' pointer checks from MMU notifiers
>   KVM: arm64: Rename __pkvm_pgtable_stage2_unmap()
>   KVM: arm64: Don't advertise unsupported features for protected guests
>   KVM: arm64: Remove pointless is_protected_kvm_enabled() checks from
>     hyp
>   KVM: arm64: Ignore MMU notifier callbacks for protected VMs
>   KVM: arm64: Prevent unsupported memslot operations on protected VMs
>   KVM: arm64: Split teardown hypercall into two phases
>   KVM: arm64: Introduce __pkvm_host_donate_guest()
>   KVM: arm64: Hook up donation hypercall to pkvm_pgtable_stage2_map()
>   KVM: arm64: Handle aborts from protected VMs
>   KVM: arm64: Introduce __pkvm_reclaim_dying_guest_page()
>   KVM: arm64: Hook up reclaim hypercall to pkvm_pgtable_stage2_destroy()
>   KVM: arm64: Generalise kvm_pgtable_stage2_set_owner()
>   KVM: arm64: Introduce host_stage2_set_owner_metadata_locked()
>   KVM: arm64: Annotate guest donations with handle and gfn in host
>     stage-2
>   KVM: arm64: Introduce hypercall to force reclaim of a protected page
>   KVM: arm64: Reclaim faulting page from pKVM in spurious fault handler
>   KVM: arm64: Return -EFAULT from VCPU_RUN on access to a poisoned pte
>   KVM: arm64: Add hvc handler at EL2 for hypercalls from protected VMs
>   KVM: arm64: Implement the MEM_SHARE hypercall for protected VMs
>   KVM: arm64: Implement the MEM_UNSHARE hypercall for protected VMs
>   KVM: arm64: Allow userspace to create protected VMs when pKVM is
>     enabled
>   KVM: arm64: Add some initial documentation for pKVM
>   KVM: arm64: Extend pKVM page ownership selftests to cover guest
>     donation
>   KVM: arm64: Register 'selftest_vm' in the VM table
>   KVM: arm64: Extend pKVM page ownership selftests to cover forced
>     reclaim

I tested the patches on Lenovo ideacenter Mini X Gen 10 Snapdragon with
nvhe as for some reason I am facing issues with hvhe on this HW even
with upstream.

I can boot ToT Linux kernel as both protected and non-protected VMs using
the kvmtool version in here.

For reference, I am using:
- Config: defconfig + CONFIG_PROTECTED_VM_UAPI + CONFIG_ARM_PKVM_GUEST
- Run: ./lkvm-static run --irqchip gicv3 -k Image -d rootfs.ext2 --force-pci -c 1  --debug (--protected)

For the whole series:
Tested-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> 
>  .../admin-guide/kernel-parameters.txt         |   4 +-
>  Documentation/virt/kvm/arm/index.rst          |   1 +
>  Documentation/virt/kvm/arm/pkvm.rst           | 101 ++++
>  arch/arm64/include/asm/kvm_asm.h              |   7 +-
>  arch/arm64/include/asm/kvm_emulate.h          |   5 +
>  arch/arm64/include/asm/kvm_host.h             |   7 +
>  arch/arm64/include/asm/kvm_pgtable.h          |  27 +-
>  arch/arm64/include/asm/kvm_pkvm.h             |   4 +-
>  arch/arm64/include/asm/virt.h                 |   6 +
>  arch/arm64/kvm/Kconfig                        |  10 +
>  arch/arm64/kvm/arm.c                          |   8 +-
>  arch/arm64/kvm/hyp/exception.c                | 100 ++--
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   9 +
>  arch/arm64/kvm/hyp/include/nvhe/memory.h      |   6 +
>  arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |   7 +-
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  95 ++--
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 500 ++++++++++++++++--
>  arch/arm64/kvm/hyp/nvhe/pkvm.c                | 223 +++++++-
>  arch/arm64/kvm/hyp/nvhe/switch.c              |   1 +
>  arch/arm64/kvm/hyp/nvhe/sys_regs.c            |   8 +
>  arch/arm64/kvm/hyp/pgtable.c                  |  22 +-
>  arch/arm64/kvm/mmu.c                          | 122 ++++-
>  arch/arm64/kvm/pkvm.c                         | 149 +++++-
>  arch/arm64/mm/fault.c                         |  31 +-
>  include/uapi/linux/kvm.h                      |   5 +
>  25 files changed, 1249 insertions(+), 209 deletions(-)
>  create mode 100644 Documentation/virt/kvm/arm/pkvm.rst
> 
> -- 
> 2.52.0.351.gbe84eed79e-goog
> 

