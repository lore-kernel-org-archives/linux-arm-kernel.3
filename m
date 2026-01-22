Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776B2D3EE75
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 15:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0BxcwiL+Qsr+b49XAdCQspH1hqmlax6jstGSGYyVec=; b=r21nNTjerF76WRorXjgfYxGR/u
	TayfRsolVkKMNqSGrbLfktNBrdP05FhiyBgvJzQ3vZDLZlwyTLaUSgBxwvQvqOL+9ZxbS5l4gjAgo
	V68GyhewWj6KjhmqrkEiT3ztJZQ/oU4PVH+Nxu0YDOSFkkrKNPmRltfRpKMT9+jqNKtGvatnGAfx3
	giFohmUzmDmTZN2t7p+xoq9vA+HE7XWfH9y66aWnaDnvLEpzyjubk/EaRHpyfhV68do5vTT3jNMXk
	PRkm4+6+dqO6uxwSOr8HF9knqOzgHzWmlfzlG3wBIAjuavPXYeDEWbR5bS5Y+MwvpllJqj6IoCRHH
	WTgU2GiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwDf-00000007I5b-1H5H;
	Thu, 22 Jan 2026 15:03:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwDc-00000007I4W-0rOl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 15:03:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 78288419EF;
	Thu, 22 Jan 2026 15:03:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8546CC116C6;
	Thu, 22 Jan 2026 15:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769094211;
	bh=W7OL1DzXiTNMqnoJ2zpzUEZ753uxhw9UxvzRwjFtEyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JSCY3zfMOG2pyN9chEr5QNrJet6vWraeb0GFj+2Gc2JMh9b4hWS1+dH5uZ4p7MAhk
	 upJmDaKq1bG8Zb+8Ty/Q6C0SUSOF5KlTmb6rjCcPv/l6AHESoh8YLCL+LjBT2fvZpu
	 ezEEshS82H3rIKcv2ZCpBcrsikiohMyrjOM4SgDJPeyflNGP128ChDjGV4E47catyY
	 gFD7Axsn+wCPMvC79Y4+W4ZBnOlQkQk75Vzgw44Jh2Ms4LbkijT+nPTe4xXxkLTaZi
	 Sya/Z3gch/vT+UyA7cHvGszxfsp2x9f+b+SKtnBRvhJrLyixLHBajT+CiQ2kCuiUqC
	 U2mHZaJDY1mbQ==
Date: Thu, 22 Jan 2026 15:03:26 +0000
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 6/6] KVM: arm64: Simplify PAGE_S2_MEMATTR
Message-ID: <aXI8PqEi0tnn6RP6@willie-the-truck>
References: <20260119105651.255693-1-maz@kernel.org>
 <20260119105651.255693-7-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119105651.255693-7-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_070332_264580_1D3C5D52 
X-CRM114-Status: GOOD (  15.10  )
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

On Mon, Jan 19, 2026 at 10:56:51AM +0000, Marc Zyngier wrote:
> Restore PAGE_S2_MEMATTR() to its former glory, keeping the use of
> FWB as an implementation detail.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/pgtable-prot.h | 4 ++--
>  arch/arm64/kvm/hyp/pgtable.c          | 6 ++----
>  2 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
> index 161e8660edddc..d27e8872fe3c8 100644
> --- a/arch/arm64/include/asm/pgtable-prot.h
> +++ b/arch/arm64/include/asm/pgtable-prot.h
> @@ -109,10 +109,10 @@ static inline bool __pure lpa2_is_enabled(void)
>  #define PAGE_KERNEL_EXEC	__pgprot(_PAGE_KERNEL_EXEC)
>  #define PAGE_KERNEL_EXEC_CONT	__pgprot(_PAGE_KERNEL_EXEC_CONT)
>  
> -#define PAGE_S2_MEMATTR(attr, has_fwb)					\
> +#define PAGE_S2_MEMATTR(attr)						\
>  	({								\
>  		u64 __val;						\
> -		if (has_fwb)						\
> +		if (cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))		\
>  			__val = PTE_S2_MEMATTR(MT_S2_FWB_ ## attr);	\
>  		else							\
>  			__val = PTE_S2_MEMATTR(MT_S2_ ## attr);		\
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 3c2f7967fdc03..34c9afa442932 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -660,11 +660,9 @@ void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
>  	({								\
>  		kvm_pte_t __attr;					\
>  		if((pgt)->flags & KVM_PGTABLE_S2_AS_S1)			\
> -			__attr = PAGE_S2_MEMATTR(AS_S1,			\
> -						 stage2_has_fwb());	\
> +			__attr = PAGE_S2_MEMATTR(AS_S1);		\
>  		else							\
> -			__attr = PAGE_S2_MEMATTR(attr,			\
> -						 stage2_has_fwb());	\
> +			__attr = PAGE_S2_MEMATTR(attr);			\
>  									\


tbh, I'd probably just kill stage2_has_fwb() entirely and use the cap
everywhere...

Up to you.

Will

