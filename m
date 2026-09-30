Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104A2CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 14:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugl/kEsibxaOMxwiAB8ohvG+dBs5XjVCSnq2cxUbe8c=; b=rPg671H85fDGc3h0bgFHADtjQX
	Rjp/FE+st5UNHJ4oyf2a8g2fZ7HqpEUEK8bOfXjyZkwfiziG6ZSrPxNs74TcE/BJF7RlWbLs5Pmt4
	fz2RadDRNUt1ctt3cppauy02pQYYQQOLuq/RuyW4G+nK7RuDemImhXfEIgPZVneihwDAVfIrSGBKQ
	AsG/rpX7f95QbPOvJfqvwNS3+FbXWkGx2G96ngeLey6ptvd+bbuzSFgeEjpxDkn20XREVAdxzmmE9
	VnF8/UcLWKn5Uf2A506BUt949QwYwdE1KB0WyL1H0V/LoYyF+dpcruO1H48WRN3Pg/M3XrATzUz3x
	oe2vSSQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBve6-00000006NQL-0wN3;
	Wed, 30 Sep 2026 14:50:58 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvdo-00000006NE7-2vfl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 14:50:42 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so8751965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 07:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790779837; x=1791384637; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ugl/kEsibxaOMxwiAB8ohvG+dBs5XjVCSnq2cxUbe8c=;
        b=iKX1ibnHsEl93lYKBquhYuoomZ4ZaGdz/On2MxY3lv2KKuEyE2umo5uOGBM3WdZzMZ
         RG4zKdaUcS3J5EeabgBTh3enhXqoIsS1dSP6RlzSGth4F+L1AKuTbUfP3j17h81J5wRz
         U0hzjcK9sctRNx4LyixDhk1G9CZZElkahvKjspZGPgPmNE7mpWjkFZQDmT65YHPV4ffC
         Ti4yga/KROgR7y4girPl7h3j+bmu1A+L9E/zIf/x7nyX/lGdhxqqNh1DsOFt6vWYnn2I
         uoOn1UhQffusV8icthl9s7hC4zYm0MhdSS5M/1JRvn6gM4IMuQL7yrNZ31E58FiCubQ7
         vUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779837; x=1791384637;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ugl/kEsibxaOMxwiAB8ohvG+dBs5XjVCSnq2cxUbe8c=;
        b=ZjG+5/ATl7jkuvCpdIlqyELbLMYSzN/edP+koC+B6zBTNB3U0mpsxnvARQxoETyqik
         85PLj48pW3e1MlKegN466P9ZO8t/3VPwuedmjGckYF8goAX3/1RTErlRHfGYgyOipCq4
         JbTFQXZfrpYqqty+6fMeNH7zKleasKhgThNAgWSU6G4q63dT4vkDzSpu4j+w1QE/4g7G
         xEQPvHzd1TF+ETYknqklx0zPYCwWWMtBJjnQef9VT9hPz1LNLfnYDfE0nK8QAKCtHz+w
         daOmHhaZfVrLCo1YBj17GnnPQbc/6JAG8+inA+haivPsZX7XbwqVYguj9AwcJZPQcSEL
         V2gw==
X-Forwarded-Encrypted: i=1; AKwUvBydub3RwTQyNANQZBCtxxMb6kSDIKMbmiN6asS1JUNZCNCvtI+RtIXeLdwim2pJxmr4Iw56ChiXXBm1hQ7NBYD8@lists.infradead.org
X-Gm-Message-State: AFuF++mHLmnZcxFaHiF9PaAKl5hretmMQBRkJnTDnJDiWpv9il7rIklO
	1e9/Urlk/4Mw1E/SNxKxUBsDHPIS3uTszz9+wg5aFBqW90YpvqueQO4MrVDBbVJLOg==
X-Gm-Gg: AYBFou0bzIvbeZ9PdqHi6dTU5mTQsj9Z2cc+STXFlfAm4mH6vnQWxderTpzojhhwqHK
	GYRMRuFwxXXwrpIFPfTc3pAgdKR+WwcVYpG3+2rBu7+p1fS53FvDrG9CgABjv9c4B9G/pdJr5TJ
	vyVY8L+7VycCbnbN2x7bMiKJ6ifxw1hZnOJQYWMVRHMCf/M6BXHRiMqNXZDg344NAF+7e+cRbDO
	wDHU2JPHTzb/Y4zNh19GaTjqnqbgf7MpBJAalh3n8bX8/jwWYJ+6P0EKffaQaS7UE+F8wcEPe2E
	8VpE1AWPBvIgGZFEdqnZrz+JGNFpVQe3wlPTzAUXjhRcxgR1WXjb00+VVC8ZMZYH1Kp44Gi1jOz
	YRpcCgfSrOWStW2sSuGnroLa+T028+mMsmNSfQC7qS+wm+ZssFoAVVyYFMpglANvj7nxJmZ/t5y
	zq8VdpIpTsyHM0Fh4WWJC7qjRNCadGU6ZZv5erOfBvu0+9LvE8aA9oO8M1lLcHm68i/Ioz8SWIp
	XhzDfnkYkorbGAsuDyf79wU3yV1Pn32CzLe4Y704Rw=
X-Received: by 2002:a05:600c:1f95:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a01b1a1138mr26323985e9.8.1790779836298;
        Wed, 30 Sep 2026 07:50:36 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01e67e01esm3856325e9.13.2026.09.30.07.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:50:33 -0700 (PDT)
Date: Wed, 30 Sep 2026 15:50:29 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com
Subject: Re: [PATCH v5 00/18] KVM: arm64: Introduce pKVM hypervisor heap
 allocator
Message-ID: <ar0htZydVZdB9zVk@google.com>
References: <20260901080941.997769-1-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901080941.997769-1-vdonnefort@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_075040_812211_788EA9AC 
X-CRM114-Status: GOOD (  29.11  )
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

Gentle ping for this series, 

It's been fully reviewed by Fuad and is already based on 7.3-rc1.

-- 
Vincent

On Tue, Sep 01, 2026 at 09:09:23AM +0100, Vincent Donnefort wrote:
> pKVM historically lacked a dynamic memory allocator: all hypervisor-side
> VM and VCPU structures had to be sized on the host, allocated as
> contiguous pages and donated to the hypervisor.
> 
> This design tightly coupled the hypervisor's memory footprint to
> host-side constraints, complicated memory reclaim, and severely
> restricted VM scalability.
> 
> This patch series introduces a dynamically-mapped custom heap allocator
> (hyp_allocator) to the pKVM hypervisor. The initial users are the
> pkvm_hyp_vm and pkvm_hyp_vcpu structs, and the hypervisor tracing
> metadata.
> 
> In the near future, this heap allocator is expected to be leveraged to
> support SVE in protected VMs and in the distant future, it will also
> support dynamic device assignment.
> 
> By moving to a hypervisor-managed dynamic allocator, we also allow
> deduplicating the donation/reclaim path of EL2-private structures.
> 
> The main building blocks for this series are:
> 
> 1. pkvm_hyp_req:
> ----------------
> When the hypervisor heap allocator goes out of memory (-ENOMEM), it
> suspends the hypercall, embeds a PKVM_HYP_REQ_HYP_ALLOC top-up request
> into the SMCCC HVC return registers, and exits back to the host.
> 
> This building block will also be useful for the future huge-mapping
> support in protected guests, allowing EL2 to raise requests such as
> block splitting back to the host.
> 
> 2. hyp_allocator:
> ----------------
> This heap allocator manages a reserved VA space range, dynamically
> mapping and unmapping physical pages on-demand to minimise the pKVM
> hypervisor footprint. As memory is reclaimed and relinquished to the
> host, unmapped holes are introduced within the VA space. To prevent
> orphan mapped regions, neighboring unused chunks cannot be merged if
> they are separated by an unmapped region.
> 
> The allocator chunk metadata is stored directly into the VA space range.
> To minimize metadata overhead, chunks only link to each other via a
> relative 32-bit offset.
> 
> A simple hardening of the metadata is added via a simple 32-bit hash.
> 
> 3. shrinker:
> ------------
> As the heap allocator isn't reclaimed actively on VM or tracing
> teardown, a shrinker is added to allow the host to reclaim unused memory
> from the hypervisor when the host is under heavy memory pressure.
> 
> Changelog
> ---------
> 
> v5:
> 
>   - Remove unreachable !prev checks in hyp_allocator_destroy_chunk() (Fuad)
>   - Add kerneldoc to pkvm_call_hyp_req() (Fuad)
>   - Avoid duplicate handle___pkvm_hyp_alloc_selftest() definitions when !CONFIG_NVHE_EL2_DEBUG
>   - Chunk pkvm_hyp_reclaim() with cond_resched() to avoid blocking in EL2
>   - Allow shrinker to scan across all runtime topup IDs
>   - Reclaim chunks before draining allocator->mc in hyp_allocator_reclaim() (Fuad)
>   - Make is_ttbr1_addr() check in __kern_hyp_va() conditional to pKVM (Fuad)
>   - Rename pkvm_memcache to stage2_mc
>   - Rebased on 7.3-rc1
> 
> v4: https://lore.kernel.org/all/20260731143541.956291-1-vdonnefort@google.com/
> 
>   - Add kerneldoc to pkvm_remove_mappings
>   - Allow pkvm_private_va_range_pa() to work with block-level mappings (Sashiko)
>   - Add rollback and harden pkvm_map_private_va_range input (Sashiko)
>   - Add missing mc count into reclaimable memory
>   - Differentiate -ENOMEM from hyp_alloc in errno_to_smccc() (Sashiko)
>   - Collect Fuad's Tested-by
> 
> v3: https://lore.kernel.org/all/20260720171513.1415357-1-vdonnefort@google.com/
> 
>   - Remove unsafe WARN_ON(hyp_spin_is_locked(&pkvm_pgd_lock)) check in hyp_allocator_alloc() (Sashiko)
>   - Modify MIN_ALLOC_SIZE to 16-bytes to comply with FPSIMD alignment requirements (Sashiko)
>   - Allow hyp topup/reclaim HVCs pre-deprivilege
>   - Add enum symbols to pkvm_hyp_req_handle event (Fuad)
>   - Various clarification in commit descriptions (Fuad)
>   - Restore unmap_donated_memory() for PGD on error path (Fuad)
>   - Renamed __hyp_allocator_map -> pkvm_map_private_va_range (Fuad)
>   - Collected Fuad's Reviewed-by tags
>   - Rebased on 7.2-rc4
> 
> v2: https://lore.kernel.org/all/20260706175415.2604046-1-vdonnefort@google.com/
> 
>   - Rebased series on 7.2-rc2.
>   - Use scope-based hyp_spinlock.
>   - Fix best_missing/best_data_size priority in hyp_allocator_find_efficient_chunk() (Sashiko)
>   - Fix missing free_hyp_memcache() in pkvm_hyp_topup() (Sashiko)
>   - Fix unused selftest_init() warning when !CONFIG_NVHE_EL2_DEBUG (Sashiko)
>   - Fix missing shrinker_free() in teardown_hyp_mode() (Sashiko)
> 
> v1: https://lore.kernel.org/r/20260520152650.4107895-1-vdonnefort@google.com
> 
> Vincent Donnefort (18):
>   KVM: arm64: Add pkvm_private_va_range_pa
>   KVM: arm64: Add pkvm_remove_mappings
>   KVM: arm64: Add pkvm_map_private_va_range
>   KVM: arm64: Add a heap allocator for the pKVM hyp
>   KVM: arm64: Allow kvm_hyp_memcache usage outside of stage-2
>   KVM: arm64: Add pkvm_hyp_req infrastructure
>   KVM: arm64: Add PKVM_HYP_REQ_HYP_ALLOC request
>   KVM: arm64: Add reclaim interface for the pKVM heap alloc
>   KVM: arm64: Add selftests for the pKVM heap allocator
>   KVM: arm64: Add a shrinker for pKVM
>   KVM: arm64: Filter out non-kernel addresses in kern_hyp_va
>   KVM: arm64: Move hyp_vm refcount into the structure
>   KVM: arm64: Alloc pkvm_hyp_vm using pKVM heap allocator
>   KVM: arm64: Alloc pkvm_hyp_vcpu using pKVM heap allocator
>   KVM: arm64: Rename vCPU pkvm_memcache to stage2_mc
>   KVM: arm64: Reject hyp trace descriptors with fewer CPUs than
>     hyp_nr_cpus
>   KVM: arm64: Reject hyp trace descriptors with fewer than 3 pages
>   KVM: arm64: Alloc simple_buffer_page using pKVM hyp allocator
> 
>  arch/arm64/include/asm/kvm_asm.h           |    4 +
>  arch/arm64/include/asm/kvm_host.h          |   16 +-
>  arch/arm64/include/asm/kvm_mmu.h           |    3 +
>  arch/arm64/include/asm/kvm_pkvm.h          |  117 ++
>  arch/arm64/kvm/arm.c                       |    4 +-
>  arch/arm64/kvm/hyp/hyp-constants.c         |    2 -
>  arch/arm64/kvm/hyp/include/nvhe/alloc.h    |   28 +
>  arch/arm64/kvm/hyp/include/nvhe/mm.h       |    3 +
>  arch/arm64/kvm/hyp/include/nvhe/pkvm.h     |   19 +-
>  arch/arm64/kvm/hyp/include/nvhe/spinlock.h |    4 +
>  arch/arm64/kvm/hyp/nvhe/Makefile           |    2 +-
>  arch/arm64/kvm/hyp/nvhe/alloc.c            | 1211 ++++++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c         |  125 +-
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c      |   10 +-
>  arch/arm64/kvm/hyp/nvhe/mm.c               |   79 ++
>  arch/arm64/kvm/hyp/nvhe/pkvm.c             |  104 +-
>  arch/arm64/kvm/hyp/nvhe/setup.c            |    6 +
>  arch/arm64/kvm/hyp/nvhe/trace.c            |   70 +-
>  arch/arm64/kvm/hyp_trace.c                 |   15 +-
>  arch/arm64/kvm/mmu.c                       |    6 +-
>  arch/arm64/kvm/pkvm.c                      |  200 +++-
>  arch/arm64/kvm/trace_pkvm.h                |   45 +
>  22 files changed, 1915 insertions(+), 158 deletions(-)
>  create mode 100644 arch/arm64/kvm/hyp/include/nvhe/alloc.h
>  create mode 100644 arch/arm64/kvm/hyp/nvhe/alloc.c
>  create mode 100644 arch/arm64/kvm/trace_pkvm.h
> 
> 
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> -- 
> 2.55.0.897.gb25b4bd76c-goog
> 

