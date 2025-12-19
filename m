Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A98D78776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 13:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VleMoK08F+B68G5VTPi8LM4DvserlKrC+oR/8/2ddtk=; b=r8BtiXPoInnLKvY3+7LFVGOUBt
	uSlB1xS1q7kfhgOSmr0biV9FeCIU5YDi8SH77lPpYCJgqu2zsIZOl5P+g2FYs0Gi5N8FU8XaP965J
	T5KMVPhmdbE9nq30O6t0owKn5SBTc9jDCfNvZiwjO7LuPRWNZoue6C1A8Jh6wYZedCM1AgQ5PK97P
	72NtmjM/losJdknVtGeXANEDJU8btqa8MTEQw2y8NQeramF+HQiP6EBBPksYfwgAvHOEjD5pdTeBk
	ZxVWxGg/yW4v6BKrGhq4+/W5JQtciQgWSjHuLw/aNnk35WyY/XeDn0O5AIBqsKNFt4iX8fEG2PccJ
	FNPenCow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWahw-0000000AMTK-0QJH;
	Fri, 19 Dec 2025 13:39:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWaht-0000000AMSz-0pBJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 13:39:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3ECCDFEC;
	Fri, 19 Dec 2025 05:39:34 -0800 (PST)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 085403F73F;
	Fri, 19 Dec 2025 05:39:38 -0800 (PST)
From: Leonardo Bras <leo.bras@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH v2 1/6] KVM: arm64: Fix EL2 S1 XN handling for hVHE setups
Date: Fri, 19 Dec 2025 13:38:50 +0000
Message-ID: <aURFlcm6szeSfLmH@devkitleo>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210173024.561160-2-maz@kernel.org>
References: <20251210173024.561160-1-maz@kernel.org> <20251210173024.561160-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_053945_279835_5DDD16A2 
X-CRM114-Status: GOOD (  16.06  )
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

On Wed, Dec 10, 2025 at 05:30:19PM +0000, Marc Zyngier wrote:
> The current XN implementation is tied to the EL2 translation regime,
> and fall flat on its face with the EL2&0 one that is used for hVHE,
> as the permission bit for privileged execution is a different one.
> 
> Fixes: 6537565fd9b7f ("KVM: arm64: Adjust EL2 stage-1 leaf AP bits when ARM64_KVM_HVHE is set")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_pgtable.h | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index fc02de43c68dd..be68b89692065 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -87,7 +87,15 @@ typedef u64 kvm_pte_t;
>  
>  #define KVM_PTE_LEAF_ATTR_HI_SW		GENMASK(58, 55)
>  
> -#define KVM_PTE_LEAF_ATTR_HI_S1_XN	BIT(54)
> +#define __KVM_PTE_LEAF_ATTR_HI_S1_XN	BIT(54)
> +#define __KVM_PTE_LEAF_ATTR_HI_S1_UXN	BIT(54)
> +#define __KVM_PTE_LEAF_ATTR_HI_S1_PXN	BIT(53)
> +
> +#define KVM_PTE_LEAF_ATTR_HI_S1_XN					\
> +	({ cpus_have_final_cap(ARM64_KVM_HVHE) ?			\
> +			(__KVM_PTE_LEAF_ATTR_HI_S1_UXN |		\
> +			 __KVM_PTE_LEAF_ATTR_HI_S1_PXN) :		\
> +			__KVM_PTE_LEAF_ATTR_HI_S1_XN; })
>  
>  #define KVM_PTE_LEAF_ATTR_HI_S2_XN	GENMASK(54, 53)
>  
> -- 
> 2.47.3
> 

Cool,
Is this according to the following in Arm ARM?

Figure D8-16
Stage 1 attribute fields in VMSAv8-64 Block and Page descriptors

Thanks!
Leo

