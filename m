Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2537C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 00:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OX/Q4Xcbeg0d5BQzko4QkNB2NOczHVBCeUwREevD7Z0=; b=M4H6aruRsallsR6RmoPiGvqYPR
	tza0Qw5tWCQ+6xYAH4ek8uSMWrrhkr2UXnyJqJZxuYOAsF7B6PTVTKLrjGuROFsLdqdvURpQ5TUzA
	6dOIWF5Syw2OozhgtSIBBX/lAd1+doWgtYw9gkh+jvFNcokhEUv+08v27hVqB0a1pi5o6mFMMIanS
	raM6Ofq6KyLkaiH3F1MJlE0zyLhiNORsH5sTtNweUTxRFRab93h7Q5BehDQOrAtafIxNHCMGh/3Tk
	cfph/AeSw9FXtz4RLgFWUj9Jwp3JIrc5nY1qWWHxkn+BW735pItOw0voo5OgYm8FgG4jvzCKWKDM5
	t3ddYqUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6dDz-000000085pa-1Xyk;
	Wed, 16 Sep 2026 00:10:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6dDx-000000085pQ-0pEf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 00:10:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 39A7F60008;
	Wed, 16 Sep 2026 00:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB61F1F000FF;
	Wed, 16 Sep 2026 00:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789517403;
	bh=OX/Q4Xcbeg0d5BQzko4QkNB2NOczHVBCeUwREevD7Z0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RdjvVjG3GIin6HVpH0/MUgK1Z5vnWCtgo5zie1W5Sd+hyQ5PimcvwW5vN7JoixCHQ
	 wbbsA6EUiakuhOD+ZFT9IlSRF24dUqRHYxHOQ2gNotP+hAxGTKF1NGVNqoFm+tLur/
	 rRnCXiUcBzLMPeqXe+TDaVDsljSo+q5BBuFc7r/UZyGfu+0E5932a+MRF9b/XHL9ba
	 PdssASIrSbDo//dye7rRvh693myIoAKtAkusy+aGg32eO4/gqLBZYP2xLQxYrtBT24
	 HB6TlSMRQZbT8JMz9FWwcoDidqPWj33D/TjYdxeRPABhSWmf7mP7YBzOjuZnjBrNIr
	 LZQdx8vc4TuoQ==
Date: Tue, 15 Sep 2026 17:10:02 -0700
From: Oliver Upton <oupton@kernel.org>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Tian Zheng <zhengtian10@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 5/5] KVM: arm64: Enable HAFDBS for guests not on
 migration
Message-ID: <aqneWnlsdpocLIl6@kernel.org>
References: <20260901171558.2674031-1-leo.bras@arm.com>
 <20260901171558.2674031-6-leo.bras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901171558.2674031-6-leo.bras@arm.com>
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

On Tue, Sep 01, 2026 at 06:15:56PM +0100, Leonardo Bras wrote:
> When dirty-logging is disabled, even non-write faults make a page dirty,
> which avoids a second fault when the page is actually written to.
> 
> On dirty-logging enable, this approach causes all (writable) pages on the
> memslot to be marked clean, even if they were not written to, which can
> take a lot of time, while holding the MMU lock, doing atomic writes to
> PTEs.

Do you have any performance numbers for this? Enabling HAFDBS seems a
bit involved to avoid some stores on the first pass.

> So, if the system supports VHE + HAFDBS, keep the non-write-faulted page as
> writable-clean, and let HAFDBS update that on demand when a write happens.
> 
> When dirty-tracking actually starts, disable HAFDBS as having it on
> avoids the same fault that is used for dirty-logging.
> 
> Signed-off-by: Leonardo Bras <leo.bras@arm.com>
> ---
>  arch/arm64/include/asm/kvm_mmu.h    |  6 ++++++
>  arch/arm64/include/asm/kvm_nested.h |  9 +++++++--
>  arch/arm64/kvm/arm.c                |  7 +++++++
>  arch/arm64/kvm/mmu.c                | 26 +++++++++++++++++++++++++-
>  4 files changed, 45 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
> index 6eae7e7e2a68..3defa1a988d3 100644
> --- a/arch/arm64/include/asm/kvm_mmu.h
> +++ b/arch/arm64/include/asm/kvm_mmu.h
> @@ -383,20 +383,26 @@ static inline void kvm_fault_unlock(struct kvm *kvm)
>   * and CMOs are NOP'd. This has the effect of no longer requiring a
>   * KVA for addresses mapped into the S2. The presence of these features
>   * are thus necessary to support cacheable S2 mapping of VM_PFNMAP.
>   */
>  static inline bool kvm_supports_cacheable_pfnmap(void)
>  {
>  	return cpus_have_final_cap(ARM64_HAS_STAGE2_FWB) &&
>  	       cpus_have_final_cap(ARM64_HAS_CACHE_DIC);
>  }
>  
> +static inline bool kvm_supports_hafdbs(struct kvm *kvm)
> +{
> +	return IS_ENABLED(CONFIG_ARM64_HW_AFDBM) &&

cpucap_is_possible() is the right place to park this.

> 						      has_vhe() &&

I don't see a reason why this needs to be constrained to VHE-only.

> +		!kvm_vcpu_has_nv(kvm) && cpus_have_final_cap(ARM64_HW_DBM);

Same thing goes for nested... KVM can make use of HAFDBS in the
canonical stage-2 MMU (or even a shadow stage-2) independent of the
guest hypervisor.

>  #ifdef CONFIG_PTDUMP_STAGE2_DEBUGFS
>  void kvm_s2_ptdump_create_debugfs(struct kvm *kvm);
>  void kvm_nested_s2_ptdump_create_debugfs(struct kvm_s2_mmu *mmu);
>  void kvm_nested_s2_ptdump_remove_debugfs(struct kvm_s2_mmu *mmu);
>  #else
>  static inline void kvm_s2_ptdump_create_debugfs(struct kvm *kvm) {}
>  static inline void kvm_nested_s2_ptdump_create_debugfs(struct kvm_s2_mmu *mmu) {}
>  static inline void kvm_nested_s2_ptdump_remove_debugfs(struct kvm_s2_mmu *mmu) {}
>  #endif /* CONFIG_PTDUMP_STAGE2_DEBUGFS */
>  
> diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
> index 1ed708335809..9242b5d665af 100644
> --- a/arch/arm64/include/asm/kvm_nested.h
> +++ b/arch/arm64/include/asm/kvm_nested.h
> @@ -1,24 +1,29 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  #ifndef __ARM64_KVM_NESTED_H
>  #define __ARM64_KVM_NESTED_H
>  
>  #include <linux/bitfield.h>
>  #include <linux/kvm_host.h>
>  #include <asm/kvm_emulate.h>
>  #include <asm/kvm_pgtable.h>
>  
> -static inline bool vcpu_has_nv(const struct kvm_vcpu *vcpu)
> +static inline bool kvm_vcpu_has_nv(const struct kvm *kvm)

The name would suggest this thing takes a vcpu pointer...

Thanks,
Oliver

