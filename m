Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0781FC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 06:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19yKS+O/fpA2riFL7dxV6VygyRkDnrquIviX6BjC4RY=; b=Yk/ml1IdD1lRDmQn91yKQCUczj
	7YEdDpxVHuX7rS/G9QDOsGIUHBll/goczy0ndmgfPiPKuHmyrCS3o2s7YQVcQCqTGFkfe88dduYGr
	sygGft+85BuOcdgVdYnkEnH3srA3jATCUe7DUmfTQsQaw4Qo3Lfyn7d0BMVormk9GrWBeB+nUFPfN
	8UL2a5ptmDOMdx6G5t78SPOP3HBmUW9iHJfatgiq6gC5edrgezV/ludffy8Qs5HxHQN7NWGorkNv8
	lgv0MzyGz9DQmR01e8d3wl7sgSk+EiZ7AHIMM92vNDNNnq2w5uIfP6xHQcfImAAe3rtPraGqkTj7+
	3GrrktXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkFqH-0000000GYug-3OWx;
	Thu, 16 Jul 2026 06:45:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkFqG-0000000GYu8-08oR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 06:45:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C88896001A;
	Thu, 16 Jul 2026 06:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D491F000E9;
	Thu, 16 Jul 2026 06:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784184306;
	bh=19yKS+O/fpA2riFL7dxV6VygyRkDnrquIviX6BjC4RY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Madks8dWlCdHfXJHxmAGI0CG2hqP5O5PJ1vfQVltwDeXMqF4CoUFAqybtIOY2nwVe
	 uHATZgU5Qn0zMOMhoze6BRx0aWylcMik1TiHczQIW82px6rKfKPYfj3yFg36qUEjyG
	 lZ1IxPvzq8kVAuaZYhJ3TCYkSfoy7Rgg7Y7LCVK+uOShbfc1ckL1GwjuZ3AHgMd/tT
	 3C6SDWvJ/s9AQeCwQjWwHjoyN24JukT25dI6VK5vvhrrKTFDfcD7ugDCPbr2/lLU7m
	 jo+NEhTYaPr098lFoug+ZzljiYICRLxYsp+M95bk9aLhMDDCoErGDbEP6RHTDhOIjE
	 EYFIHMesz26KA==
Date: Wed, 15 Jul 2026 23:45:05 -0700
From: Oliver Upton <oupton@kernel.org>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH v4 3/6] KVM: arm64: nv: Add nested revmap broken
 tracepoint
Message-ID: <alh98Zz42OdWo-jp@kernel.org>
References: <20260714115926.2044757-1-weilin.chang@arm.com>
 <20260714115926.2044757-4-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714115926.2044757-4-weilin.chang@arm.com>
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

Hi Wei-Lin,

On Tue, Jul 14, 2026 at 12:59:22PM +0100, Wei-Lin Chang wrote:
> Add a tracepoint to track when a nested reverse map becomes broken. This
> makes it easier to detect NV performance degradation caused by full
> shadow stage-2 unmaps.
> 
> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>

I'm not too excited about making a tracepoint out of this, especially
since a 'broken' reverse map is more of a KVM implementation detail
(that could change) than anything else.

BPF is quite popular at this point, do you think it's reasonable to
instead expect the curious KVM developer to attach a kprobe and inspect
the state of the nested MMU?

Thanks,
Oliver

> ---
>  arch/arm64/kvm/nested.c    |  7 ++++++-
>  arch/arm64/kvm/trace_arm.h | 27 +++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 065823e415ce..22f8a1daca93 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -17,6 +17,7 @@
>  #include <asm/sysreg.h>
>  
>  #include "sys_regs.h"
> +#include "trace.h"
>  
>  struct vncr_tlb {
>  	/* The guest's VNCR_EL2 */
> @@ -916,8 +917,12 @@ void kvm_record_nested_revmap(gpa_t canonical_ipa, struct kvm_s2_mmu *mmu,
>  
>  	mas_set_range(&mas_rmap, canonical_ipa, canonical_ipa_end);
>  	if (mas_store_gfp(&mas_rmap, xa_mk_value(new_entry),
> -			  GFP_NOWAIT | __GFP_ACCOUNT))
> +			  GFP_NOWAIT | __GFP_ACCOUNT)) {
> +		trace_kvm_nested_revmap_broken(mmu - mmu->arch->nested_mmus,
> +					       canonical_ipa, canonical_ipa_end,
> +					       nested_ipa, new_entry);
>  		mmu->nested_revmap_broken = true;
> +	}
>  unlock:
>  	mtree_unlock(revmap_mt);
>  }
> diff --git a/arch/arm64/kvm/trace_arm.h b/arch/arm64/kvm/trace_arm.h
> index 9c60f6465c78..0db90068ff63 100644
> --- a/arch/arm64/kvm/trace_arm.h
> +++ b/arch/arm64/kvm/trace_arm.h
> @@ -415,6 +415,33 @@ TRACE_EVENT(kvm_forward_sysreg_trap,
>  		      sys_reg_Op2(__entry->sysreg))
>  );
>  
> +TRACE_EVENT(kvm_nested_revmap_broken,
> +	    TP_PROTO(int mmu_idx, unsigned long canonical_ipa,
> +		     unsigned long canonical_ipa_end, unsigned long nested_ipa,
> +		     unsigned long revmap_entry),
> +	    TP_ARGS(mmu_idx, canonical_ipa, canonical_ipa_end, nested_ipa, revmap_entry),
> +
> +	    TP_STRUCT__entry(
> +		__field(int,			mmu_idx)
> +		__field(unsigned long,		canonical_ipa)
> +		__field(unsigned long,		nested_ipa)
> +		__field(size_t,			size)
> +		__field(unsigned long,		revmap_entry)
> +	    ),
> +
> +	    TP_fast_assign(
> +		__entry->mmu_idx = mmu_idx;
> +		__entry->canonical_ipa = canonical_ipa;
> +		__entry->nested_ipa = nested_ipa;
> +		__entry->size = canonical_ipa_end - canonical_ipa + 1;
> +		__entry->revmap_entry = revmap_entry;
> +	    ),
> +
> +	    TP_printk("mmu idx: %d, cipa: 0x%016lx, nipa: 0x%016lx, size: 0x%016lx, entry: %016lx",
> +		      __entry->mmu_idx, __entry->canonical_ipa, __entry->nested_ipa,
> +		      __entry->size, __entry->revmap_entry)
> +);
> +
>  #endif /* _TRACE_ARM_ARM64_KVM_H */
>  
>  #undef TRACE_INCLUDE_PATH
> -- 
> 2.43.0
> 

