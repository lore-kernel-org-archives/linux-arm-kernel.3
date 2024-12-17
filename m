Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18B4E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8ZMjen1yJSy70yGnNt9th+OC1qo4iE/tlrHQsp3QRY=; b=FTCxnxRZa2ioTeoaJ0kQ2bQJQ+
	CozSIg4FJvJBtiys6AQgRflqT2uXo6nb59DJPZp7zxS5JLMOyYN4j8Es0MYHdVgclR/ytCAqOCKJG
	bBaZgFdOaTqWQ1OgSDLlbPlXDsGMCOjGSCnBvHnewj48MQ9sbDp7vIvOYgOF2+iewxjfaHNTKFse7
	8qCIw08UwARc3yPfGCNOA7euCwLUlz6Qd049dFeHWlZC1Lz4Yz8WQyjBTBLgA3K+6nnH7XCySibFX
	eKyEJ844t10AeIBtkDlsrvu7Z3fJi/Q+d1u7qOaeJ50GDuTYrVWhZzNmevQJElKHXxZt9dqGed1Ev
	nq8axM1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUH7-0000000D0SC-3rUc;
	Tue, 17 Dec 2024 09:53:57 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTqY-0000000CupS-2eWe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 09:26:31 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43622893c3cso28725e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 01:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734427589; x=1735032389; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q8ZMjen1yJSy70yGnNt9th+OC1qo4iE/tlrHQsp3QRY=;
        b=wOjCJiP4RJ34qLPggWiMRZtCSRpX21/KlsvX534RVDi9pOA83aGfCSFeZtp9c25WUK
         +jVmOOxn/00hZM1ZkrOYRlyjvhJpbsnxRIA20PApXSmCkrGxyWglu07RB9Y2Dv2lGyft
         Auvs0v2AtdvRiM2QR+PI224m5KMvOohslSucg1cuVErRM5/ihLcbRZzW+pXW3cxuviIT
         KwvNyZGd7mhUov+8uEX8/gZFd/Q0IAVkLaHrrW3ySLhMMktCpxovLT8k3X5RVIXQf8Ae
         YzxYiV/EHouPPshgOJGMHwRzcpOjvgQcAWCvTWNSPNRar07dp/fOahkQOGPTjDrY1KFQ
         9bwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734427589; x=1735032389;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8ZMjen1yJSy70yGnNt9th+OC1qo4iE/tlrHQsp3QRY=;
        b=CjmjxJNGYTmxtnFtUqUrl05hDMnZssN9XxRAj7BYPOIuNHJpQU7vjrGODnFcDTT9Ex
         8aUFmqkp3yHdd0Q69doWBrfM/dxD9xUUn+b/45JIcHXSvc0U3OnN9gzuhuhXTC+O/r5W
         ix2sPyBwp8qAv4TruGWHKXdAIzspwLfe56y+j0cSiOp2rsxYAcq+mrtNID0QIfJ3sSMX
         0BS71W017ZHD40N+pQfkg0Eyjvro4zQE/u5RhtZ8FQFL2o/W+NDJca11RN5FF6S+M8B6
         7P86lVYWIF3VAAB+RerwL69Jlkr+d6gqFmAACe7prqIi8H4JUSk0GI7LeZ1fGEeauqJE
         ID6A==
X-Forwarded-Encrypted: i=1; AJvYcCUDP+LR3Kx0uoSrqqwomKKK24/2fo1WszxrZlg7Viz/maHv6bBXsl67DGUzvrphNiWeOqI0SyyU4bIo1ByXwmHv@lists.infradead.org
X-Gm-Message-State: AOJu0YxEONnfLI9HCj6+xF2miyjPyGBEdQclIP5ZwbZ3Onx5kddC8sxX
	5WAF7jgsvZKgySXzQyDrUC1TlWJYX7miWA3GtAphJRIvJPPJWMglFh0PGJfZ3PfF/uvjN2rH8Ki
	N1X2paRobKajCW/gGzojHrSpvXYh40cfW67T6LICeBMAyoFr8MQ==
X-Gm-Gg: ASbGncuJy7LWM8xtUyHTDVvGmR+VAOHP6TVf8fVBRBZ3YQm2917GpTkbZQujMs8Yvmk
	06cy0TPs1TSCD9dGsu2hgRX8ADKp3pZee3eV9npHXv9E/iTrZ+AOTAOBJAoSmMR3g52g=
X-Google-Smtp-Source: AGHT+IFF7byMDFVKlnmrBQvmNiNhFFA27+GN/MTPR1DNEbChmzax4aYAFvAEK6reIllga6gOu5vl+393+8r9UxeqysA=
X-Received: by 2002:a05:600c:3205:b0:436:4e4c:7bae with SMTP id
 5b1f17b1804b1-4364e4c7d7cmr388185e9.1.1734427589053; Tue, 17 Dec 2024
 01:26:29 -0800 (PST)
MIME-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com>
In-Reply-To: <20241216175803.2716565-1-qperret@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Dec 2024 09:25:52 +0000
Message-ID: <CA+EHjTz7=dRz5X-CjjniJgwd87Q4DQbRdXzi0on4C21urYnhOQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/18] KVM: arm64: Non-protected guest stage-2 support
 for pKVM
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_012630_670520_54961415 
X-CRM114-Status: GOOD (  28.09  )
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

On Mon, 16 Dec 2024 at 17:58, Quentin Perret <qperret@google.com> wrote:
>
> Hi all,
>
> This is the v3 of the series adding support for non-protected guests
> stage-2 to pKVM. Please refer to v1 for all the context:

For the series:

Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad



>
>   https://lore.kernel.org/kvmarm/20241104133204.85208-1-qperret@google.com/
>
> The series is organized as follows:
>
>  - Patches 01 to 04 move the host ownership state tracking from the
>    host's stage-2 page-table to the hypervisor's vmemmap. This avoids
>    fragmenting the host stage-2 for shared pages, which is only needed
>    to store an annotation in the SW bits of the corresponding PTE. All
>    pages mapped into non-protected guests are shared from pKVM's PoV,
>    so the cost of stage-2 fragmentation will increase massively as we
>    start tracking that at EL2. Note that these patches also help with
>    the existing sharing for e.g. FF-A, so they could possibly be merged
>    separately from the rest of the series.
>
>  - Patches 05 to 07 implement a minor refactoring of the pgtable code to
>    ease the integration of the pKVM MMU later on.
>
>  - Patches 08 to 16 introduce all the infrastructure needed on the pKVM
>    side for handling guest stage-2 page-tables at EL2.
>
>  - Patches 17 and 18 plumb the newly introduced pKVM support into
>    KVM/arm64.
>
> Patches based on 6.13-rc3, tested on Pixel 6 and Qemu.
>
> Changes in v3:
>  - Rebased on 6.13-rc3
>  - Applied Marc's rework of the for_each_mapping_in_range() macro mess
>  - Removed mappings_lock in favor the mmu_lock
>  - Dropped BUG_ON() from pkvm_mkstate()
>  - Renamed range_is_allowed_memory() and clarified the comment inside it
>  - Explicitly bail out when using host_stage2_set_owner_locked() on
>    non-memory regions
>  - Check PKVM_NOPAGE state as an equality rather than a bitwise
>    operator
>  - Reworked __pkvm_host_share_guest() to return -EPERM in case of
>    illegal multi-sharing
>  - Added get_np_pkvm_hyp_vm() to simplify HVC error handling in
>    hyp-main.c
>  - Cosmetic changes and improved coding consitency thoughout the series
>
> Changes in v2:
>  - Rebased on 6.13-rc1 (small conflicts with 2362506f7cff ("KVM: arm64:
>    Don't mark "struct page" accessed when making SPTE young") in
>    particular)
>  - Fixed kerneldoc breakage for __unmap_stage2_range()
>  - Fixed pkvm_pgtable_test_clear_young() to use correct HVC
>  - Folded guest_get_valid_pte() into __check_host_unshare_guest() for
>    clarity
>
> Thanks,
> Quentin
>
> Marc Zyngier (1):
>   KVM: arm64: Introduce __pkvm_vcpu_{load,put}()
>
> Quentin Perret (17):
>   KVM: arm64: Change the layout of enum pkvm_page_state
>   KVM: arm64: Move enum pkvm_page_state to memory.h
>   KVM: arm64: Make hyp_page::order a u8
>   KVM: arm64: Move host page ownership tracking to the hyp vmemmap
>   KVM: arm64: Pass walk flags to kvm_pgtable_stage2_mkyoung
>   KVM: arm64: Pass walk flags to kvm_pgtable_stage2_relax_perms
>   KVM: arm64: Make kvm_pgtable_stage2_init() a static inline function
>   KVM: arm64: Add {get,put}_pkvm_hyp_vm() helpers
>   KVM: arm64: Introduce __pkvm_host_share_guest()
>   KVM: arm64: Introduce __pkvm_host_unshare_guest()
>   KVM: arm64: Introduce __pkvm_host_relax_guest_perms()
>   KVM: arm64: Introduce __pkvm_host_wrprotect_guest()
>   KVM: arm64: Introduce __pkvm_host_test_clear_young_guest()
>   KVM: arm64: Introduce __pkvm_host_mkyoung_guest()
>   KVM: arm64: Introduce __pkvm_tlb_flush_vmid()
>   KVM: arm64: Introduce the EL1 pKVM MMU
>   KVM: arm64: Plumb the pKVM MMU in KVM
>
>  arch/arm64/include/asm/kvm_asm.h              |   9 +
>  arch/arm64/include/asm/kvm_host.h             |   4 +
>  arch/arm64/include/asm/kvm_mmu.h              |  16 +
>  arch/arm64/include/asm/kvm_pgtable.h          |  38 ++-
>  arch/arm64/include/asm/kvm_pkvm.h             |  23 ++
>  arch/arm64/kvm/arm.c                          |  23 +-
>  arch/arm64/kvm/hyp/include/nvhe/gfp.h         |   6 +-
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  38 +--
>  arch/arm64/kvm/hyp/include/nvhe/memory.h      |  42 ++-
>  arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |  16 +
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 201 ++++++++++-
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 320 ++++++++++++++++--
>  arch/arm64/kvm/hyp/nvhe/page_alloc.c          |  14 +-
>  arch/arm64/kvm/hyp/nvhe/pkvm.c                |  68 ++++
>  arch/arm64/kvm/hyp/nvhe/setup.c               |   7 +-
>  arch/arm64/kvm/hyp/pgtable.c                  |  13 +-
>  arch/arm64/kvm/mmu.c                          | 113 +++++--
>  arch/arm64/kvm/pkvm.c                         | 198 +++++++++++
>  arch/arm64/kvm/vgic/vgic-v3.c                 |   6 +-
>  19 files changed, 1010 insertions(+), 145 deletions(-)
>
> --
> 2.47.1.613.gc27f4b7a9f-goog
>

