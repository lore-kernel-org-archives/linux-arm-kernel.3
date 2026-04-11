Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5803FF3ED55
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 14:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vxu41SqGbYZD/cPmYXQ8rh9mdWBgl1Z1C7ZzbZtPCjY=; b=hpUFPGCGJAuuMGqfVqP0S7PoCb
	ZVZv/G+x3lO82Crs2r5JQBfU3KUftjBv7F7TMoukHaNxPz9qAXAhG3n3vZuV5fI1ck+qhGbp6Tez5
	OXbypF2K+zrvdpS4jA4rVgDMX2PIBH74QQEH6IECazbAvOjLHKHAcWgXgI28ymHLLmZ0CQwKHAKl1
	b3UWrwYiSN/+jx/itBFyvDkog+1Kqoi4GcLmgIp5ZvJCbrw3xyB2Y9SmkUgsHDXWLLTzamJQ61Ch9
	hU8KPhCuN+SvqjyY45ZaCMQWCxJoD13RqNBRV52z/NE+gLpkY/XQKBu0a/mryZ6QZWxT9rOQ3PTyS
	5Aitx0Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBYtE-0000000DUMb-3zXc;
	Sat, 11 Apr 2026 14:00:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBYt6-0000000DUGy-2y3G
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 14:00:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B4B63542;
	Sat, 11 Apr 2026 07:00:31 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1F8E3F632;
	Sat, 11 Apr 2026 07:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775916037; bh=SXW3Q/MqNoCRHOMZlzD/EseY8OJA01AhSX2LP5F3J1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EAdIU7aILiap/xHxm4EoMkUNNKDkWaxUa6jXxZJmV8KMNI5I9aqYQ3HF+Z37IEgXh
	 T8DgodG58z4FHc5oCBDm5drh2SX3OJY+86xZVm9Y27WJhufbN05d6GV+aLdFvnknx0
	 VCpysyj6nalOjUZEYCCsdwb1dzegHZkNMGiGEJBw=
Date: Sat, 11 Apr 2026 15:00:23 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 0/1] KVM: arm64: nv: Implement nested stage-2 reverse
 map
Message-ID: <e2rdpxn6t3ygxi3qkausk5quroqy43p6jsqz5oennzaewz3uar@2w5cs57ndsvm>
References: <20260411125024.3735989-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411125024.3735989-1-weilin.chang@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_070041_134736_C72A515F 
X-CRM114-Status: GOOD (  30.05  )
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

Hi,

Sorry, I missed changing the title to v2.
I'll add this to my checklist before sending next time.

Thanks,
Wei-Lin Chang

On Sat, Apr 11, 2026 at 01:50:23PM +0100, Wei-Lin Chang wrote:
> Hi,
> 
> This is v2 of optimizing the shadow s2 mmu unmapping during MMU
> notifiers. Thanks to Sashiko, who helped point out the many problems [1]
> in v1.
> 
> * Changes from v1 [2]:
> 
>   - Rebased on to a newer kvmarm/next, where user_mem_abort() underwent
>     a significant refactor.
> 
>   - Added a flag VALID_ENTRY (bit 63) to each non-polluted reverse map
>     entry, so that if nested IPA == 0, we still insert a non-zero entry
>     to the maple tree.
> 
>   - Added usage of the maple tree lock while using the tree. Previously
>     I though I could piggyback on kvm->mmu_lock, but this doesn't work
>     for 2 reasons:
>       1. The maple tree advanced API (mas_*) expects the maple tree lock
>          to be held.
>       2. At stage-2 fault time, kvm->mmu_lock is only taken for read.
>          Therefore even if 1. does not matter, parallel accesses to the
>          maple tree could still happen.
> 
>   - Changed from using GFP_KERNEL_ACCOUNT to (GFP_NOWAIT | __GFP_ACCOUNT)
>     in maple tree operations. This is done because GFP_KERNEL_ACCOUNT
>     can sleep, and we are holding kvm->mmu_lock while doing the
>     operations.
> 
>   - Made the code able to tolerate reverse map creation failure. In v1
>     if a maple tree operation fails, the error is reported back to the
>     caller which in the end fails the vCPU run. It shouldn't be this way
>     as the reverse map is an optimization and it shouldn't fail the
>     normal operation as we can fallback to a full unmap.
> 
>   - Added a boolean nested_revmap_broken in struct kvm_s2_mmu. If
>     reverse map creation fails, the reverse map becomes unreliable. Keep
>     this failure information with nested_revmap_broken so that we can
>     fallback when we need to unmap.
> 
>   - Removed patch 2,3,4 for now. After we start using the maple tree
>     lock, and keeping track of the reverse map failure state in
>     nested_revmap_broken, the s2 mmu look up acceleration in v1 patch 2
>     becomes very complicated, as the canonical maple tree used to speed
>     up s2 mmu look up can also encounter allocation failures which we
>     also need to keep track of and fallback. In the mean time the
>     consistency between the trees is not easy to reason about when
>     errors happen. Additionally, the extra lock of the canonical maple
>     tree also needs to be considered and care must be taken to not
>     introduce lock order inversion.
>     Given the above I believe it is best to leave the reverse map
>     improvements out for now, so as to not use too much time thinking
>     about optimization before the initial version of the reverse map is
>     even good.
> 
> Thanks!
> 
> [1]: https://sashiko.dev/#/patchset/20260330100633.2817076-1-weilin.chang%40arm.com
> [2]: https://lore.kernel.org/kvmarm/20260330100633.2817076-1-weilin.chang@arm.com/
> 
> Wei-Lin Chang (1):
>   KVM: arm64: nv: Avoid full shadow s2 unmap
> 
>  arch/arm64/include/asm/kvm_host.h   |   4 +
>  arch/arm64/include/asm/kvm_nested.h |   4 +
>  arch/arm64/kvm/mmu.c                |  30 ++++--
>  arch/arm64/kvm/nested.c             | 147 +++++++++++++++++++++++++++-
>  4 files changed, 177 insertions(+), 8 deletions(-)
> 
> -- 
> 2.43.0
> 

