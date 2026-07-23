Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6837CC44524
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 07:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87tY0XBF0Spy12g+WsA7Jvhj0xZPDxN4sdYFmxhScf0=; b=yKA2811oqJjktOFdrlJw1DJlxO
	Hsq2EBzl26i/9njG0HGKWv5N9QmtmxMsM/T2LPkOA8IoW7v2dv0kOX/QVfwnd5c4QhlgybIAM22F4
	ImrXwqE+DTgrSa3wvIOJuigehI4eaN7OpR6KLCdlbjBVQxkc1GjJ/7j2MdeXPWT/Os3V4FK9h43jx
	tu8jtnCziysQEmusnqIi6L8aprp+J4TO1HHNqdFUuEDWaHhoH85iZJddfQZ4keienh00hoLQqatpQ
	LNwzd4ce6lEd1yA2VeU0zjM12whG6Q0Bt2iJs0s1gb5TFrXR9KMkZhjFuWhAts20K/7s8RlbFeIAD
	/MZKhT6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnjE-0000000Dd0F-3Y75;
	Thu, 23 Jul 2026 07:20:24 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnjC-0000000DczI-0q7j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 07:20:23 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-51c01c79467so176361cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 00:20:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784791219; cv=none;
        d=google.com; s=arc-20260327;
        b=L9tgsDbdtJKBRjWPyNPG5CYQPK4Tk7kEhRt/nbj5kgP/ZvH1P10IrniKjF5+Sar5mk
         HymqIBvcB7z4qji6P3qz3odv0KCYO4RYagnwiX8kh5oTElpmv02m8kY89ZMfDcxB4czk
         fPVBP9hLT//EyiiolTD2E/lh1HbjwDNjcjkbJFYUsesfc3epe4tO56vvFi9bZKc0EPZI
         TIz59KuQ0d0ksK0EG5r+s0HmWsoXFPrPPWP5r5tPJphMwe8BbYgy711CIgmP+fFtvcf4
         sKhmnhnjmdFuBG8zCX1PmXKiPV9HGeRINdOluOiFayq8OCQQA6LB1y/rr7otw1sVcB8x
         0o1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=87tY0XBF0Spy12g+WsA7Jvhj0xZPDxN4sdYFmxhScf0=;
        fh=bxBWsVVgQ3WSZppKoeAJwwYu+dssTwBCl0JIugv+wlw=;
        b=q8QCH+nUOvh++3Fpumq+el25LPK1kxCIGyTigguK1MW/X1QPjX12xPQlDIA/+XkgVt
         06MfVEIrgvHzWr5wdX2ToJhPXYpgEMC+nYAMf0Cd+HMI2xg+KRU50MAL7lKQcv6ZU7M7
         Jj1LrzLn4JRRAJnkrnGqMt1NTDpUO20rr7fkgaxgg2kCtp4Ro7t1nAuaaJPvUNh2rhE4
         fh6dbzV9rplQDeuXy3TYq/S9lgQOy18e5fOo1vs7YjvWCMvpRsPuti7Q/4NiSAQ2KeVn
         nBVjkjBFB5p/n+cmfVQY6r8k8Ed92IMXjZ5I+2iQ7WMm1QOk2MUcSRpg8Wh1SWqqdChF
         eVFw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784791219; x=1785396019; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87tY0XBF0Spy12g+WsA7Jvhj0xZPDxN4sdYFmxhScf0=;
        b=LDj6+O4NUmkhQoowQTcv9VlQmGp0HJX0HcZZEbGrmiyr3VXtKHx82a3Bq8S9i4hJqb
         B9J8DPo5CZkege+VkebZwwrpksNmAiMTkDJFIxE2Evdz48alwpfDKbrRH4wv1hf5eiPx
         7vkhRlXcmcUcKPS+YYlnFI4BFjo3UPeQL4bbOVyBmnkAaTDWBjNyWjdv1boelHdTIzMG
         YpMsCglRAV07cJnwCtPJmCBmIfPzLF5C4txMxemiHAGq6fXhqTunLX27ZDDTU2eNsBJA
         TzmCDidYY2M5zdvkkGO0qdXxirlZOy5xseqQGxl4bkPJ8rcb7/mUkc9dYU+lrK5rVJmX
         3z1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784791219; x=1785396019;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=87tY0XBF0Spy12g+WsA7Jvhj0xZPDxN4sdYFmxhScf0=;
        b=hvJFD9pMqmYj4QcIFyoKLRtdiS4VGg9jNqQjpLH9ajIs697LUaCtAKWUn1IuAHUrvO
         lsv7Rqe01FR4HinUMekUoq5O6N4y1e9qEELs2OD03Bixp33cSoyIf1BktCioN2lYoUKF
         9dJQw7Hf+pMdRuXWA8tfg3oTTUuZiKj5IeQH5DyH6h0xRDCjcUYdFJjnccypDaeyZdKi
         YGxLUgzHnijp7GrPUyzStVYXa0b1nEbDtoQVZs5C3u/ZtE/d7mOR70XlocHoccYEYlP7
         29Wb6Md5vyXEcUyxWeTH2dogTQqvjZFNEfHoTL/mUOIqDuEYp0MzrQXwD1M64r9LcuRB
         XY0A==
X-Forwarded-Encrypted: i=1; AHgh+Rr0XM+MRogCcVxJibRibmeUn9+kRrSnGqoumtUbpf3wmuwJnCCF+0owAc4HdP8+u3VCEh6lrooRmIAWd2ndHlCv@lists.infradead.org
X-Gm-Message-State: AOJu0YwHrPz5NGumwuOo46NckQm64bqdjFl5Kr8sLX3D/AKFluOqkDnE
	D5pUtfQ76RNhKdOSoC+XKh7rhtGxtwGF3s0U8K8uuV2sUTM3kNXsLY2yT1jmRvmafI+bQ8pvZHP
	aoJNFw0Wg0o2lTsthds3nSvkLE1ETOvKAN4Pz5Z5R
X-Gm-Gg: AR+sD11cU8uma/OxnbQ3qScOMRaJBZ5PH/hIu3/NE8SeUv3G1a218zyNhc384ENmpRx
	MOtls8t7Teof3OfcnTlieGx0fkVkZfQGKekxKh59D3VaLilT4be7idrvM60s7/E8qNVQhK6hW0+
	QgNQSiihU7H1Kk6F2JxTBFzhHiB/QSYMJZWWMdawAfTXFFrDJt8pZyQLMtLvBuy8PKXb+yNIt5X
	ZH+LZ72MkjzHNuxJkcjNUdjDrpKeBqinH87Yw6gVsTItEPWOBWKK+sDEkQXAA==
X-Received: by 2002:a05:622a:9006:b0:51c:7a8b:c3ff with SMTP id
 d75a77b69052e-5283bbeb11cmr7210611cf.24.1784791218948; Thu, 23 Jul 2026
 00:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260720171513.1415357-1-vdonnefort@google.com>
In-Reply-To: <20260720171513.1415357-1-vdonnefort@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 23 Jul 2026 08:19:41 +0100
X-Gm-Features: AUfX_myAcHFefmBWGcQK4TCfe3jKMad7iXPD1hE8cSakhsQCWUus-2VShzvp7rI
Message-ID: <CA+EHjTzN-68kBkOGfOqdBnRHs8HRotDuQaPACYK_N4Vw8S4ehw@mail.gmail.com>
Subject: Re: [PATCH v3 00/17] KVM: arm64: Introduce pKVM hypervisor heap allocator
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_002022_535609_FFBCCF75 
X-CRM114-Status: GOOD (  25.45  )
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

Tested on QEMU: npVM/pVM boots, the in-hyp allocator selftest, and
hyp-trace buffer load; allocator top-up path confirmed via the
kvm_handle_pkvm_hyp_req tracepoint (HYP_ALLOC).

Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Cheers,
/fuad

On Mon, 20 Jul 2026 at 18:15, Vincent Donnefort <vdonnefort@google.com> wrote:
>
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
> v2 -> v3:
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
> v1 -> v2:
>   - Rebased series on 7.2-rc2.
>   - Use scope-based hyp_spinlock.
>   - Fix best_missing/best_data_size priority in hyp_allocator_find_efficient_chunk() (Sashiko)
>   - Fix missing free_hyp_memcache() in pkvm_hyp_topup() (Sashiko)
>   - Fix unused selftest_init() warning when !CONFIG_NVHE_EL2_DEBUG (Sashiko)
>   - Fix missing shrinker_free() in teardown_hyp_mode() (Sashiko)
>
> v1: https://lore.kernel.org/r/20260520152650.4107895-1-vdonnefort@google.com
>
> Vincent Donnefort (17):
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
>   KVM: arm64: Reject hyp trace descriptors with fewer CPUs than
>     hyp_nr_cpus
>   KVM: arm64: Reject hyp trace descriptors with fewer than 3 pages
>   KVM: arm64: Alloc simple_buffer_page using pKVM hyp allocator
>
>  arch/arm64/include/asm/kvm_asm.h           |    4 +
>  arch/arm64/include/asm/kvm_host.h          |   14 +-
>  arch/arm64/include/asm/kvm_mmu.h           |    3 +
>  arch/arm64/include/asm/kvm_pkvm.h          |  102 ++
>  arch/arm64/kvm/arm.c                       |    2 +
>  arch/arm64/kvm/hyp/hyp-constants.c         |    2 -
>  arch/arm64/kvm/hyp/include/nvhe/alloc.h    |   24 +
>  arch/arm64/kvm/hyp/include/nvhe/mm.h       |    3 +
>  arch/arm64/kvm/hyp/include/nvhe/pkvm.h     |   19 +-
>  arch/arm64/kvm/hyp/include/nvhe/spinlock.h |    4 +
>  arch/arm64/kvm/hyp/nvhe/Makefile           |    2 +-
>  arch/arm64/kvm/hyp/nvhe/alloc.c            | 1223 ++++++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c         |  124 +-
>  arch/arm64/kvm/hyp/nvhe/mm.c               |   51 +
>  arch/arm64/kvm/hyp/nvhe/pkvm.c             |  100 +-
>  arch/arm64/kvm/hyp/nvhe/setup.c            |    6 +
>  arch/arm64/kvm/hyp/nvhe/trace.c            |   70 +-
>  arch/arm64/kvm/hyp_trace.c                 |   15 +-
>  arch/arm64/kvm/mmu.c                       |    4 +-
>  arch/arm64/kvm/pkvm.c                      |  159 ++-
>  arch/arm64/kvm/trace_pkvm.h                |   45 +
>  21 files changed, 1831 insertions(+), 145 deletions(-)
>  create mode 100644 arch/arm64/kvm/hyp/include/nvhe/alloc.h
>  create mode 100644 arch/arm64/kvm/hyp/nvhe/alloc.c
>  create mode 100644 arch/arm64/kvm/trace_pkvm.h
>
>
> base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
> --
> 2.55.0.229.g6434b31f56-goog
>

