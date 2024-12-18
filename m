Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83471E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 19:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y0egGk+E5zbRv4inQflxneULbdFdTnonLDTj+BKj8O4=; b=mfLLuZjTxHzyHgF5ZAmT9H5VaE
	rM3AU3iw3DRywfJrG4cSBb1Cm5KyD6ITM9t4UncYJQr2Q4Dglnb7CH9n0kISZtSuH0hHPimKS2SIx
	kk4V+QJEM8u64o5V5pMl6Wm3Hmq+7GDIvIQrOWGTm5C+UXUJkHrI4xtqO0jRSTduB2hoB3km/BFPO
	Ng0mvMOenjuYygB6Vv1WMMiz/BFh2eAJfMIAUaB+TV/oUXGw+CpGKUo5nP44kvp00NBfDOdMcEuvG
	eklWgJL71ZIV1dUZ/3Tyt/NdssVNn2t4JYTHY2Jfp1TNGqJMFs0Cgf1mwJG5Qulg7rMOT6Nx0PuGX
	QXJBl5pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNzvw-0000000HYYL-27Hi;
	Wed, 18 Dec 2024 19:42:12 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNzuq-0000000HYHw-1D6u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 19:41:05 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-aa6704ffcaeso366549966b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 11:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734550862; x=1735155662; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y0egGk+E5zbRv4inQflxneULbdFdTnonLDTj+BKj8O4=;
        b=4bHGokmJTy8mAd1D9DT8o3STTb1LfQuVpdDFwljlkZOKL581JVfOKRQDr+dPinpJZd
         06iluqOFIlDNiJwJfn9CYWjcVZnIJ6PEWgk+OjkZtHXYJq5XJYZhZfoOXrbfQUpD27Qh
         sEmOcgfQx2GHeOpGR4P8VeN3WuS/Us6S8d31iG3He9goQuu15jN3J4MAPhBp9PyuIWBi
         +YdCwOUxkr2GtFlRJZ6nxxqfd/r4Jj8tmju5gfHJPucU6E5q+QZ2zBTEmOF7902XIiUu
         GkCu/cakb751O5axPh29aWSaq7Xto3UzcLkWgNwxssXoXOspb9xiU/7jssCjUCJ//d/S
         FnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734550862; x=1735155662;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y0egGk+E5zbRv4inQflxneULbdFdTnonLDTj+BKj8O4=;
        b=uxwsr7gQzxx7Cc/ZpfE3exn2VwfzMOLMvpDWvwAwXlPPH4C1g8hTUhCk2sfrFqM3Bf
         IVxVntzf84Qo4JtPSZCgf9g1hN8ADTQTijhVzs2wEJIGu54WxC4hzLcEJk8hvcRhcFH1
         IcOXvJOAj8LOM0TpsUReNRFJOMA4gBk/m33usMwckbOEg54ig5/l9SHdvza8ilBbYSwY
         3q/c+Ng+TH6CQ65WSsmfunIkr2H4NGQljFzZdUg+eS9vxmgbz8WksSAromVgo9ybjz3O
         my4wGAI3sRM+jrtm4c/lYp5kCmylGMEUFNI0oexB2StYalnhlqgpV3+HDs7GcM8N4vUC
         S8NA==
X-Forwarded-Encrypted: i=1; AJvYcCXX3vZuLynw6No8nNODqHRKLQlgSgOlR3qsUSTq4Kg7BabRtOMQsJRz8r8xn+oq6+P+HpfNG1HcIILj8NtoBvEG@lists.infradead.org
X-Gm-Message-State: AOJu0YwLhK/Nkh4IJRGLgRAz/hVZG9Q0F7fFNL2l/SA8qFTjRADoTOc1
	eXM+UugIzQleydzm0N71WYrYJi7NJld8xo5/+Z8ae6PsR2FTXMJJXhgeAdy7Bwd1NL6Y+hI6rJa
	MzzhpUA==
X-Google-Smtp-Source: AGHT+IFF9Bdl3ykGIZN5hSEGfg9Lfi7RyKI7xaF+0V/m/PtNz8TEdHZF7hKeCCrU7cTy07W+PAd0JMzpUqE1
X-Received: from ejcsr10.prod.google.com ([2002:a17:907:398a:b0:aa6:a5c6:7ad0])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:32c4:b0:aa6:762e:8c1c
 with SMTP id a640c23a62f3a-aac07a51ea1mr60053066b.48.1734550862066; Wed, 18
 Dec 2024 11:41:02 -0800 (PST)
Date: Wed, 18 Dec 2024 19:40:41 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241218194059.3670226-1-qperret@google.com>
Subject: [PATCH v4 00/18] KVM: arm64: Non-protected guest stage-2 support for pKVM
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_114104_334704_EA26823F 
X-CRM114-Status: GOOD (  19.31  )
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

Hi all,

This is the v4 of the series adding support for non-protected guests
stage-2 to pKVM. Please refer to v1 for all the context:

  https://lore.kernel.org/kvmarm/20241104133204.85208-1-qperret@google.com/

Please note that in its current form, this series has two main
limitations that will be addressed separately:

 - We don't support mapping devices into guests: this requires
   additional hypervisor support for tracking the 'state' of devices.
   No device assignment until then.

 - Stage-2 mappings are forced to page-granularity even when backed by a
   huge page for the sake of simplicity of this series. I'm only aiming
   at functional parity-ish (from userspace's PoV) for now, support for
   HP can be added on top later as a perf improvement.

The series is organized as follows:

 - Patches 01 to 04 move the host ownership state tracking from the
   host's stage-2 page-table to the hypervisor's vmemmap. This avoids
   fragmenting the host stage-2 for shared pages, which is only needed
   to store an annotation in the SW bits of the corresponding PTE. All
   pages mapped into non-protected guests are shared from pKVM's PoV,
   so the cost of stage-2 fragmentation will increase massively as we
   start tracking that at EL2. Note that these patches also help with
   the existing sharing for e.g. FF-A, so they could possibly be merged
   separately from the rest of the series.

 - Patches 05 to 07 implement a minor refactoring of the pgtable code to
   ease the integration of the pKVM MMU later on.

 - Patches 08 to 16 introduce all the infrastructure needed on the pKVM
   side for handling guest stage-2 page-tables at EL2.

 - Patches 17 and 18 plumb the newly introduced pKVM support into
   KVM/arm64.

Patches based on 6.13-rc3, tested on Pixel 6 and Qemu.

Changes in v4:
 - Collected Tested-by and Reviewed-by tags
 - Reworked KVM_S2_PGT to help ctags/grepping kvm_pgtable_* functions
 - Minor cleanups throughout

Changes in v3:
 - Rebased on 6.13-rc3
 - Applied Marc's rework of the for_each_mapping_in_range() macro mess
 - Removed mappings_lock in favor the mmu_lock
 - Dropped BUG_ON() from pkvm_mkstate()
 - Renamed range_is_allowed_memory() and clarified the comment inside it
 - Explicitly bail out when using host_stage2_set_owner_locked() on
   non-memory regions
 - Check PKVM_NOPAGE state as an equality rather than a bitwise
   operator
 - Reworked __pkvm_host_share_guest() to return -EPERM in case of
   illegal multi-sharing
 - Added get_np_pkvm_hyp_vm() to simplify HVC error handling in
   hyp-main.c
 - Cosmetic changes and improved coding consitency thoughout the series

Changes in v2:
 - Rebased on 6.13-rc1 (small conflicts with commit 2362506f7cff ("KVM:
   arm64: Don't mark "struct page" accessed when making SPTE young") in
   particular)
 - Fixed kerneldoc breakage for __unmap_stage2_range()
 - Fixed pkvm_pgtable_test_clear_young() to use correct HVC
 - Folded guest_get_valid_pte() into __check_host_unshare_guest() for
   clarity

Thanks,
Quentin

Marc Zyngier (1):
  KVM: arm64: Introduce __pkvm_vcpu_{load,put}()

Quentin Perret (17):
  KVM: arm64: Change the layout of enum pkvm_page_state
  KVM: arm64: Move enum pkvm_page_state to memory.h
  KVM: arm64: Make hyp_page::order a u8
  KVM: arm64: Move host page ownership tracking to the hyp vmemmap
  KVM: arm64: Pass walk flags to kvm_pgtable_stage2_mkyoung
  KVM: arm64: Pass walk flags to kvm_pgtable_stage2_relax_perms
  KVM: arm64: Make kvm_pgtable_stage2_init() a static inline function
  KVM: arm64: Add {get,put}_pkvm_hyp_vm() helpers
  KVM: arm64: Introduce __pkvm_host_share_guest()
  KVM: arm64: Introduce __pkvm_host_unshare_guest()
  KVM: arm64: Introduce __pkvm_host_relax_guest_perms()
  KVM: arm64: Introduce __pkvm_host_wrprotect_guest()
  KVM: arm64: Introduce __pkvm_host_test_clear_young_guest()
  KVM: arm64: Introduce __pkvm_host_mkyoung_guest()
  KVM: arm64: Introduce __pkvm_tlb_flush_vmid()
  KVM: arm64: Introduce the EL1 pKVM MMU
  KVM: arm64: Plumb the pKVM MMU in KVM

 arch/arm64/include/asm/kvm_asm.h              |   9 +
 arch/arm64/include/asm/kvm_host.h             |   4 +
 arch/arm64/include/asm/kvm_mmu.h              |  16 +
 arch/arm64/include/asm/kvm_pgtable.h          |  38 ++-
 arch/arm64/include/asm/kvm_pkvm.h             |  26 ++
 arch/arm64/kvm/arm.c                          |  23 +-
 arch/arm64/kvm/hyp/include/nvhe/gfp.h         |   6 +-
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  39 +--
 arch/arm64/kvm/hyp/include/nvhe/memory.h      |  50 ++-
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |  16 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 201 ++++++++++-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 320 ++++++++++++++++--
 arch/arm64/kvm/hyp/nvhe/page_alloc.c          |  14 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  69 ++++
 arch/arm64/kvm/hyp/nvhe/setup.c               |   7 +-
 arch/arm64/kvm/hyp/pgtable.c                  |  13 +-
 arch/arm64/kvm/mmu.c                          |  93 +++--
 arch/arm64/kvm/pkvm.c                         | 201 +++++++++++
 arch/arm64/kvm/vgic/vgic-v3.c                 |   6 +-
 19 files changed, 1006 insertions(+), 145 deletions(-)

-- 
2.47.1.613.gc27f4b7a9f-goog


