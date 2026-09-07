Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6256C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 18:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtDJpD2fxJE6IddEOBExRdVt6TIzNQJ6o5AAGWZJXas=; b=3E3rSbRQXCxGso+3l+QP2FVm7C
	Sqwk1/4VYo41VUDhaQ+gf8sspJOI2McqwrkjO8Oe6+PKR6AcR8EkO57OchAHaH29EMxWOYuhXTfa5
	wtjyUzW59a/59tMfPTelaIVaGvzjEIC9hxvXdJ3vn8wIisRwhFsONcugDmGYLiLQcnqxoxFz6kIUX
	lI+OrXJnzKE1hh95RMeCiR6mNysI+GEPexrBi08cmX4RuMnR9HT7BIbithh5pINVQxOdHCnULgZCl
	4AheLqWPB8dnVHMaoIqVvPme6ON9+J39KUkN4OfM2BJjv9yzwh9B2ZFL3q8NJowtU6qDXNgFOTwYp
	u/9ePs/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3eHx-00000007b4u-1NOA;
	Mon, 07 Sep 2026 18:41:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3eHu-00000007b3u-0fZ5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 18:41:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 986621476;
	Mon,  7 Sep 2026 11:41:45 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D57603F528;
	Mon,  7 Sep 2026 11:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788806509; bh=oOAJaNc8fwgBRGZou+YwG8GwcsoIvMJQ0k0a4TIZy/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M5eaoEi/0DWd2TdnMuk/JswwJZj75WRus7Ql1q+5a2MSL7qzb/IUiyPVu96k0DJxc
	 /UZNp1gsDy7VWFjgwh4krvW93L0Kit1sFpSeJbc3tYtwkog3asHDgLkWUJzqbcLQcs
	 r6ju8NUwqY2QKPfOpCHSesZ/5AD1JYKFD4kynPx4=
Date: Mon, 7 Sep 2026 19:41:30 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Vincent Donnefort <vdonnefort@google.com>, maz@kernel.org, 
	oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, keirf@google.com
Subject: Re: [PATCH 00/20] Huge mapping support for protected VMs
Message-ID: <g46hgnsj7rltrqzfmm7lgkdxteaxositebvrpasyjwesygwmq7@mcustodfb26v>
References: <20260803100904.3563942-1-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803100904.3563942-1-vdonnefort@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_114150_287212_E55B69E6 
X-CRM114-Status: GOOD (  18.61  )
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

Hi Vincent,

On Mon, Aug 03, 2026 at 11:08:44AM +0100, Vincent Donnefort wrote:
> Currently, pKVM handles stage-2 mappings and ownership tracking strictly
> at the PAGE_SIZE level. This series extends pKVM to support PMD_SIZE
> block mappings, thereby enabling Transparent Huge Pages (THP) for
> protected guests. hugetlbfs is currently unsupported as it does not
> appear as swapbacked.
> 
> Summary of changes:
> 
> 1. Enable host stage-2 block-level annotations:
> 
> The host stage-2 being annotated with the GFN of the guest on the
> host->guest donation transitions, we allow block-level annotations to
> ensure the host stage-2 mapping size matches the guest stage-2.
> 
> 2. Expand ownership transition HVCs:
> 
> Enable the ownership test to work with PMD_SIZE so we can test
> transitions supporting more than PAGE_SIZE.
> 
> 3. Implements the `PKVM_HYP_REQ_SPLIT` hypervisor request:
> 
> Allows the hypervisor to ask the host to split a mapping. This ensures
> the guest s2, pkvm_mapping tree and host s2 are always using the same
> mapping size.
> 
> 4. Wires up THP support for pKVM guests.
> 
> Keir Fraser (1):
>   KVM: arm64: Prefault host stage-2 entries on block split
> 
> Vincent Donnefort (19):
>   KVM: arm64: Propagate host stage-2 annotated entries on block split
>   KVM: arm64: Allow block-level stage-2 annotation
>   KVM: arm64: Use block-level annotations when setting up the host
>     stage-2
>   KVM: arm64: Make pKVM ownership selftest an HVC
>   KVM: arm64: Add a range to __pkvm_host_share/unshare_hyp()
>   KVM: arm64: Add a range to __pkvm_host_donate_guest()
>   KVM: arm64: Add a range to __pkvm_host_reclaim_page_guest()
>   KVM: arm64: Add a range to __pkvm_guest_share_host()
>   KVM: arm64: Add a range to __pkvm_guest_unshare_host()
>   KVM: arm64: Add a range to pKVM ownership selftest
>   KVM: arm64: Handle huge mappings in
>     __pkvm_host_force_reclaim_page_guest()
>   KVM: arm64: Handle huge mappings in __pkvm_vcpu_in_poison_fault()
>   KVM: arm64: pkvm: Warn on guest stage-2 block collapse
>   KVM: arm64: Add pkvm_hyp_req infrastructure
>   KVM: arm64: Add __pkvm_host_split_guest HVC
>   KVM: arm64: Extend pKVM page ownership selftests to cover guest block
>     split
>   KVM: arm64: Add PKVM_HYP_REQ_SPLIT
>   KVM: arm64: Raise PKVM_HYP_REQ_SPLIT on guest to host sharing
>   KVM: arm64: Stage-2 huge mappings for protected VMs
> 
>  arch/arm64/include/asm/kvm_asm.h              |  12 +-
>  arch/arm64/include/asm/kvm_host.h             |  19 +
>  arch/arm64/include/asm/kvm_pgtable.h          |   3 +-
>  arch/arm64/include/asm/kvm_pkvm.h             |  21 +-
>  arch/arm64/kvm/arm.c                          |   2 +
>  arch/arm64/kvm/handle_exit.c                  |   3 +
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  25 +-
>  arch/arm64/kvm/hyp/include/nvhe/memory.h      |   5 +
>  arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |   6 +-
>  arch/arm64/kvm/hyp/nvhe/ffa.c                 |  12 +-
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  47 +-
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 545 ++++++++++++------
>  arch/arm64/kvm/hyp/nvhe/pkvm.c                |  59 +-
>  arch/arm64/kvm/hyp/nvhe/setup.c               | 152 +++--
>  arch/arm64/kvm/hyp/pgtable.c                  | 113 +++-
>  arch/arm64/kvm/mmu.c                          |  72 ++-
>  arch/arm64/kvm/pkvm.c                         | 247 +++++++-
>  arch/arm64/kvm/trace_pkvm.h                   |  44 ++
>  18 files changed, 1036 insertions(+), 351 deletions(-)
>  create mode 100644 arch/arm64/kvm/trace_pkvm.h

The patches in this series are missing per patch stats like this here.
I would recommend including that to help reviewing.

Thanks,
Wei-Lin Chang

> 
> 
> base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
> -- 
> 2.55.0.508.g3f0d502094-goog
> 

