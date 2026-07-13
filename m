Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3D2C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 10:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTqU3dT6rzoa78gvVlfTAv7/fiNLfAlCGxoZbc0EA5A=; b=mAYaNa6tPf3VCbSaNM3P9kKFzX
	ywYPmEtgKa5XiZeIFlOwAc/ZG8qLQzdU2+h8eSegKhnoSpb0/kxGZIHBND9Lod+aOZBwfiZb/kYbM
	jloE9Md0vjsErTYDFfgA2lparFtWMme7S2gunMY6OIg+Zo7vPNGzTwiKeFMS7RlTFGyOzXDMQdRtz
	NiwIgA4Siuji2JHPXeoeH6E26tStOZZ8ZGsU4d/EZcm0ZwQIgcqLls3OsoezQMZA7gaeZ5jDiacZD
	5PvtRzaHE1ncUIS8AgVwsq/4ZUdMktAjWbJVPnqN4WmvqFtGR33+r07FC/d6kaGIpmn9wMCthpl/O
	BJu2IumQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDx4-00000008tbY-08oF;
	Mon, 13 Jul 2026 10:31:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDx1-00000008tax-3KkK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 10:31:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B37A3152B;
	Mon, 13 Jul 2026 03:31:46 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1EE503F93E;
	Mon, 13 Jul 2026 03:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783938711; bh=2vc9t6B108vjh8OZgKdBi0NW18wPseEjqvmkpgNcas0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=caaVXN7+HkmYFEIkjnbg1V0D09tJ1taUdZpyFpfkeefbzWb5Qc7rvcHloS4iD39Bg
	 itoLyzAmdV8gyNuviTOCt6ga7UL+xGxWnD2nG3eRypXbSrKLxYhGyFys8JVMJ5w/iY
	 p25v5MH2urDLktoOIhgcqHi6aP078fNagADwpQFc=
From: Leonardo Bras <leo.bras@arm.com>
To: Tian Zheng <zhengtian10@huawei.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	maz@kernel.org,
	oupton@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	yuzenghui@huawei.com,
	wangzhou1@hisilicon.com,
	yangjinqian1@huawei.com,
	caijian11@h-partners.com,
	liuyonglong@huawei.com,
	yezhenyu2@huawei.com,
	yubihong@huawei.com,
	linuxarm@huawei.com,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com
Subject: Re: [PATCH v4 0/6] Support the FEAT_HDBSS introduced in Armv9.5
Date: Mon, 13 Jul 2026 11:31:46 +0100
Message-ID: <alS-kcwvlASwPIzL@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709104026.2612599-1-zhengtian10@huawei.com>
References: <20260709104026.2612599-1-zhengtian10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_033151_914984_DDAE246F 
X-CRM114-Status: GOOD (  30.90  )
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

On Thu, Jul 09, 2026 at 06:40:20PM +0800, Tian Zheng wrote:
> This series of patches add support to the Hardware Dirty state tracking
> Structure (HDBSS) feature, which is introduced by the ARM architecture
> in the DDI0601 (ID121123) version.
> 
> The HDBSS feature is an extension to the architecture that enhances
> tracking translation table descriptors' dirty state, identified as
> FEAT_HDBSS. This feature utilizes hardware assistance to achieve dirty
> page tracking, aiming to significantly reduce the overhead of scanning
> for dirty pages.
> 
> The purpose of this feature is to make the execution overhead of live
> migration lower to both the guest and the host, compared to existing
> approaches (write-protect or search stage-2 tables).
> 
> The required sysreg definitions for FEAT_HDBSS have been merged into
> arm64 /sysregs:
>   [1/5] arm64/sysreg: Add HDBSS related register information
>         https://git.kernel.org/arm64/c/72f7be0c2e30
> 
> 
> After these patches, the kernel automatically enables HDBSS when dirty
> logging is enabled on any memslot, and disables HDBSS when dirty logging
> is disabled on all memslots. This series does not support dirty ring
> mode.
> 
> Depends-on: "KVM: arm64: Enable eager hugepage splitting if HDBSS is available"
> 	https://lore.kernel.org/linux-arm-kernel/20260629111820.1873540-3-leo.bras@arm.com/

On this, FYI, there have been some discussion on this:
https://lore.kernel.org/all/alETGFD2Ogx6N0HB@LeoBrasDK/

Oliver's suggestion is that we don't automatically enable eager splitting, 
but instead we have different behaviours if the user enables it.

This is still under discussion there, but I think it can be useful reading. 

> 
> This dependency is mandatory. Unlike v3, where DBM was added lazily on
> the first dirty access via a page fault, v4 injects DBM into pgt->flags
> at stage-2 MMU initialization time. Combined with HDBSS being auto-enabled
> during migration setup, the first dirty access no longer triggers a page
> fault. Consequently, if lazy hugepage splitting were relied upon (which
> requires a page fault to trigger splitting), hugepages would never be
> split, leading to guest hang after migration. Leonardo's patch above
> ensures eager hugepage splitting is enabled (chunk_size != 0) when HDBSS
> is available, guaranteeing that hugepages are properly split before
> migration starts.
> 
> v3: https://lore.kernel.org/linux-arm-kernel/20260225040421.2683931-1-zhengtian10@huawei.com/
> 
> v3->v4 changes:
> - Merge sysreg definitions into the FEAT_HDBSS detection patch (was a
>   separate patch in v3).
> - Add auto DBM (Dirty Bit Modifier) support as a new patch, suggested
>   by Leonardo Bras. DBM is now controlled as a page-table level flag
>   (KVM_PGTABLE_S2_DBM) rather than per-PTE. Note that DBM is injected
>   at stage-2 MMU creation time, not lazily on first dirty access. This
>   means the first write to a dirty-logged page does not generate a
>   page fault, which is a key reason for the mandatory dependency on
>   Leonardo's eager hugepage splitting patch (see Depends-on above).
> - Split the v3 "Enable HDBSS support and handle HDBSSF events" patch
>   into three patches: per-vCPU buffer management, fault handling and
>   buffer flush, and auto enable/disable on dirty logging change. This
>   implements kernel-managed automatic HDBSS enable/disable.
> - Remove the KVM_CAP_ARM_HW_DIRTY_STATE_TRACK ioctl for manual HDBSS
>   on/off. HDBSS is now automatically enabled/disabled based on dirty
>   logging state via kvm_arch_commit_memory_region().
> - Change HDBSS buffer flush triggers to vcpu_put, check_vcpu_requests,
>   and kvm_handle_guest_abort.
> - Store hdbss_order at VM level (kvm->arch.hdbss_order) instead of
>   per-vCPU, since all vCPUs share the same order.
> - Document patch is not included in this version; will be sent in a
>   follow-up series.
> 
> Leonardo Bras (1):
>   KVM: arm64: Enable eager hugepage splitting if HDBSS is available
> 
> Tian Zheng (2):
>   KVM: arm64: Add support for FEAT_HDBSS
>   KVM: arm64: Add auto DBM support for hardware dirty tracking
> 
> eillon (3):
>   KVM: arm64: Add HDBSS per-vCPU buffer management
>   KVM: arm64: Add HDBSS fault handling and buffer flush
>   KVM: arm64: Add auto HDBSS enable/disable on dirty logging change
> 
>  arch/arm64/include/asm/cpufeature.h    |   5 +
>  arch/arm64/include/asm/esr.h           |   5 +
>  arch/arm64/include/asm/kvm_dirty_bit.h |  29 ++++
>  arch/arm64/include/asm/kvm_host.h      |  14 ++
>  arch/arm64/include/asm/kvm_pgtable.h   |   4 +
>  arch/arm64/include/asm/sysreg.h        |  11 ++
>  arch/arm64/kernel/cpufeature.c         |  12 ++
>  arch/arm64/kvm/Makefile                |   1 +
>  arch/arm64/kvm/arm.c                   |  29 ++++
>  arch/arm64/kvm/dirty_bit.c             | 219 +++++++++++++++++++++++++
>  arch/arm64/kvm/hyp/pgtable.c           |  35 +++-
>  arch/arm64/kvm/hyp/vhe/switch.c        |  15 ++
>  arch/arm64/kvm/mmu.c                   |  19 ++-
>  arch/arm64/kvm/reset.c                 |   4 +
>  arch/arm64/tools/cpucaps               |   1 +
>  15 files changed, 399 insertions(+), 4 deletions(-)
>  create mode 100644 arch/arm64/include/asm/kvm_dirty_bit.h
>  create mode 100644 arch/arm64/kvm/dirty_bit.c
> 
> --
> 2.33.0
> 

