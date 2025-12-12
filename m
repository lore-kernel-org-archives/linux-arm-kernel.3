Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9E9D59D77
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 16:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xntMN7KPVJPELoX3ISyewD3Jx6XXAgpV9fEuOGbBoDg=; b=2mviEVAiFYQJPQIf2rjzUdUizG
	UeWUS0+ycmAl4YtqHCX0RZmSCUSOGK3gj/k4hLvSiS0IYSTpolhDbsQgytV7T31P+rkyFFV/NBlfu
	JcUUhcSYPHS7SQShhe2znRydUjFnuf9qmPFXHmHImBATdIh3Peg3Y7DjZXj+lvmkxjQVWuxe3x9sA
	cf+dRMrkb8ToIXfHLkeR1sx8eXgq0w6moeS7nPKoho7Ek2e10lHeehrogqMaYNO5KuYQei9hKa7IC
	++UUMJbrDAJCr2iDByUOhVGtxqPOMAHt+n8e+6wqQ91v5XbZZh7jelmLKkXyOKNXEkvwSbTTwh3+7
	9NkPCAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5Zj-00000000n72-0upS;
	Fri, 12 Dec 2025 16:00:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5Zg-00000000n6A-29di
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 16:00:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAD7D1063;
	Fri, 12 Dec 2025 08:00:42 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FEBA3F762;
	Fri, 12 Dec 2025 08:00:47 -0800 (PST)
Date: Fri, 12 Dec 2025 16:00:42 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH v2 6/6] KVM: arm64: Honor UX/PX attributes for EL2 S1
 mappings
Message-ID: <20251212160042.GA978851@e124191.cambridge.arm.com>
References: <20251210173024.561160-1-maz@kernel.org>
 <20251210173024.561160-7-maz@kernel.org>
 <20251211151810.GA867614@e124191.cambridge.arm.com>
 <86tsxxng5b.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86tsxxng5b.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_080056_704070_75C8A6EF 
X-CRM114-Status: GOOD (  28.15  )
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

On Thu, Dec 11, 2025 at 04:21:20PM +0000, Marc Zyngier wrote:
> On Thu, 11 Dec 2025 15:18:51 +0000,
> Joey Gouly <joey.gouly@arm.com> wrote:
> > 
> > Question,
> > 
> > On Wed, Dec 10, 2025 at 05:30:24PM +0000, Marc Zyngier wrote:
> > > Now that we potentially have two bits to deal with when setting
> > > execution permissions, make sure we correctly handle them when both
> > > when building the page tables and when reading back from them.
> > > 
> > > Reported-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > ---
> > >  arch/arm64/include/asm/kvm_pgtable.h | 12 +++---------
> > >  arch/arm64/kvm/hyp/pgtable.c         | 24 +++++++++++++++++++++---
> > >  2 files changed, 24 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> > > index be68b89692065..095e6b73740a6 100644
> > > --- a/arch/arm64/include/asm/kvm_pgtable.h
> > > +++ b/arch/arm64/include/asm/kvm_pgtable.h
> > > @@ -87,15 +87,9 @@ typedef u64 kvm_pte_t;
> > >  
> > >  #define KVM_PTE_LEAF_ATTR_HI_SW		GENMASK(58, 55)
> > >  
> > > -#define __KVM_PTE_LEAF_ATTR_HI_S1_XN	BIT(54)
> > > -#define __KVM_PTE_LEAF_ATTR_HI_S1_UXN	BIT(54)
> > > -#define __KVM_PTE_LEAF_ATTR_HI_S1_PXN	BIT(53)
> > > -
> > > -#define KVM_PTE_LEAF_ATTR_HI_S1_XN					\
> > > -	({ cpus_have_final_cap(ARM64_KVM_HVHE) ?			\
> > > -			(__KVM_PTE_LEAF_ATTR_HI_S1_UXN |		\
> > > -			 __KVM_PTE_LEAF_ATTR_HI_S1_PXN) :		\
> > > -			__KVM_PTE_LEAF_ATTR_HI_S1_XN; })
> > > +#define KVM_PTE_LEAF_ATTR_HI_S1_XN	BIT(54)
> > > +#define KVM_PTE_LEAF_ATTR_HI_S1_UXN	BIT(54)
> > > +#define KVM_PTE_LEAF_ATTR_HI_S1_PXN	BIT(53)
> > >  
> > >  #define KVM_PTE_LEAF_ATTR_HI_S2_XN	GENMASK(54, 53)
> > >  
> > > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> > > index e0bd6a0172729..97c0835d25590 100644
> > > --- a/arch/arm64/kvm/hyp/pgtable.c
> > > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > > @@ -342,6 +342,9 @@ static int hyp_set_prot_attr(enum kvm_pgtable_prot prot, kvm_pte_t *ptep)
> > >  	if (!(prot & KVM_PGTABLE_PROT_R))
> > >  		return -EINVAL;
> > >  
> > > +	if (!cpus_have_final_cap(ARM64_KVM_HVHE))
> > > +		prot &= ~KVM_PGTABLE_PROT_UX;
> > 
> > Trying to understand this part. We don't consider KVM_PGTABLE_PROT_UX below
> > when !HVHE, and we don't set it in kvm_pgtable_hyp_pte_prot() when !HVHE
> > either, so can it ever actually be set?
> 
> Because KVM_PGTABLE_PROT_X, which is directly passed by the high-level
> code, is defined as such:
> 
> 	KVM_PGTABLE_PROT_X			= KVM_PGTABLE_PROT_PX	|
> 						  KVM_PGTABLE_PROT_UX,
> 

This was the main missing part!

> We *could* make that value dependent on HVHE, but since that's in an
> enum, it is pretty ugly to do (not impossible though).
> 
> But it is in the following code that this becomes useful...
> 
> >
> > Otherwise LGTM!
> > 
> > Thanks,
> > Joey
> > 
> > > +
> > >  	if (prot & KVM_PGTABLE_PROT_X) {
> > >  		if (prot & KVM_PGTABLE_PROT_W)
> > >  			return -EINVAL;
> 
> ... here. If you were passed UX (and only that), and that you're
> !HVHE, you won't have execution at all, and can allow writes.
> 
> Does that make sense?

Yes, thanks!

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

