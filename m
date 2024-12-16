Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE53FE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 18:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WIvO63JbCPAYWlPtJwQFaD85WRtYv7NId9N6OYZZ/Zg=; b=141SrlZcv+I4j0InEZqqFVlH7u
	3SI5dKMr+lteI8W9ToPzVuyOFvg9l2jaJZuRhH6tMljUc4jW8wKyfBKq2OJMIcS1ZHXp7BBuNQBCW
	Q76F1WTu9X2f/nDRcqSDtUqxwweTD+19PxpW+iOUrvJMCcFHUwa8mgAnRYOdIV4oLj9s6ulnEm/mL
	mMpHpfDX5kxFz2Yr9Ilb5FErKYAPZaFB2c2z9ByHEl0e9laJqoGTSy1mNBEZB9HNTzuH7M7dCItQo
	07RK41CuIYCUL4e3SItHjd3QmjIaXM9S4ZiUSXhZZm/IAjjK/YVD4/6t++8HZQf6XXSWOPOGNR/NJ
	oMsy2xKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFOT-0000000Arp1-3uPL;
	Mon, 16 Dec 2024 18:00:33 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFM8-0000000Aqrn-0Xi9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 17:58:09 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-aa6a1bf7a82so326149666b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 09:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734371885; x=1734976685; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WIvO63JbCPAYWlPtJwQFaD85WRtYv7NId9N6OYZZ/Zg=;
        b=B/u/+CRh3/ldzSfEkCSXagokTM4A9vRgUsUhZCP43x+UZPs3+KKs3PARzaqbsI7yQr
         QgeErUV+kpgWrCdFYFQY/I9H/n5pVxl9Oe53zoq9lf9muUTtZnhkWfKTCImo3eyDIMwA
         /OQSL29pQSK6nhSC1cxr5rDADYFBjBx/UejBYq6Y1aoPq2QX2o79RCDoiBnb0XQVba+S
         /xCe3T5yWyNO813d2VziJkrxlJEaKEzsLGm2GVvdZ2MUahRBIJxghZOqmKKGZqQ4G8x9
         dvtnQkTW5jAOgPl2fTiauzds0FA2qTwDPBsVYzY8bVJf3qlV6YJIfBlUtNdHfZmY37LB
         JYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371885; x=1734976685;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WIvO63JbCPAYWlPtJwQFaD85WRtYv7NId9N6OYZZ/Zg=;
        b=NV9IJdIy2b8o3PmC4DinWozUtPfFdguvwoIWxkXgIuSXI0jiZAWgGhe49C97o5T91b
         TtATWNoX+aMpsoPLsJTABIO50Ecvv86vc4y8h2QPBl7GWJ7l6HevZVc4lcC5KkfrIALo
         V7lXFjdbAqrAfOtBXAR8QqrKF5zbSU0Kimi5pMS4GYFESrDUhrygxjXo+A7rYfsrArje
         6bOYcJ6ZdlNYidUNCrc4VkQeThOmPQYnH7kL39ggDJt+SihEDJ96k8wXDu9mrX8CUaeL
         2+Cjww/jEgU+ju5K2YOY6Fm8oLQyhmNuS+EZ8qwRNT6/HkEDpEqPGfRPtNdSMr9XxBW4
         v4ew==
X-Forwarded-Encrypted: i=1; AJvYcCVN2KbAclC0bSOCsrabnh/g7EaGcyWj2u8KTx5B/huVlQkWHCxtHkhZOZdH5PBCU7QLRgT3NLwz30L5N4wZwdLT@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1lgByUw20fLaOA4liyL3PUgx6LuHY+BE7Kkbv+swFzpW1uq/Y
	RkeGB3tksF40xu+m948hsYMmMs4jGnxVN7DN4isdPr2V32wF1FQX2Tc+PrnuGWTR2In2B0peLLq
	Ykn+Xkw==
X-Google-Smtp-Source: AGHT+IEFD4waSVQTOAsVyudNcn7ejn8ek5PuLwOxwXNXNljOaLhuHKDLNM7nryfElBbu4DGNYAQqJVhQvzfM
X-Received: from educ20.prod.google.com ([2002:a05:6402:1014:b0:5d0:84dd:d775])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:7f0c:b0:aa6:5e35:d72d
 with SMTP id a640c23a62f3a-aab7793eb42mr1425279566b.24.1734371885432; Mon, 16
 Dec 2024 09:58:05 -0800 (PST)
Date: Mon, 16 Dec 2024 17:57:45 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216175803.2716565-1-qperret@google.com>
Subject: [PATCH v3 00/18] KVM: arm64: Non-protected guest stage-2 support for pKVM
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
X-CRM114-CacheID: sfid-20241216_095808_181099_D42E565C 
X-CRM114-Status: GOOD (  17.79  )
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

This is the v3 of the series adding support for non-protected guests
stage-2 to pKVM. Please refer to v1 for all the context:

  https://lore.kernel.org/kvmarm/20241104133204.85208-1-qperret@google.com/

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
 - Rebased on 6.13-rc1 (small conflicts with 2362506f7cff ("KVM: arm64:
   Don't mark "struct page" accessed when making SPTE young") in
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
 arch/arm64/include/asm/kvm_pkvm.h             |  23 ++
 arch/arm64/kvm/arm.c                          |  23 +-
 arch/arm64/kvm/hyp/include/nvhe/gfp.h         |   6 +-
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  38 +--
 arch/arm64/kvm/hyp/include/nvhe/memory.h      |  42 ++-
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |  16 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 201 ++++++++++-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 320 ++++++++++++++++--
 arch/arm64/kvm/hyp/nvhe/page_alloc.c          |  14 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  68 ++++
 arch/arm64/kvm/hyp/nvhe/setup.c               |   7 +-
 arch/arm64/kvm/hyp/pgtable.c                  |  13 +-
 arch/arm64/kvm/mmu.c                          | 113 +++++--
 arch/arm64/kvm/pkvm.c                         | 198 +++++++++++
 arch/arm64/kvm/vgic/vgic-v3.c                 |   6 +-
 19 files changed, 1010 insertions(+), 145 deletions(-)

-- 
2.47.1.613.gc27f4b7a9f-goog


