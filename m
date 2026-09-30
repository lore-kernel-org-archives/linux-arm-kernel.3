Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED36CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 00:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qjgKogqDJ4nU3WCcsiVuj/fs6MGqUehEm1aDK84/10=; b=GtmBOSJf4wlZNXAk0uDhp0EixC
	UQ7QGl3wDuAVXTDCTC46TqgDmTX+8szp/LxaUR3sSrowUdxjWV1vjIgJM2OXFaElAQGlpLeDpDGr/
	8bt47LyH84FFm7hZ3DV0kuXIDklxSW8akjkcwG/w1BjHu0ZhNT/2xoOsI3B47/d03ncoWdVf8gPUe
	bkhxIZXyGsmWHemHcesDea0TzISGhzWYnrRuCRmyqGchVRJe5pMfz71PD9kOdM/CvUChxhynYt0a6
	6nGRQd28vEuEFUw5CcgDBXsnLtPlHkwV6sdzTZXP53RLug2mUOkh8oUUFgP0Lbpv8s9h8t6lpq0qu
	uvQTqTww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBi8C-00000004ohk-2cHg;
	Wed, 30 Sep 2026 00:25:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBi8B-00000004ohd-0Htt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 00:25:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3907E600D4;
	Wed, 30 Sep 2026 00:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 811F51F00899;
	Wed, 30 Sep 2026 00:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790727905;
	bh=3qjgKogqDJ4nU3WCcsiVuj/fs6MGqUehEm1aDK84/10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NC3wN3NI6FGYkISLfmTPBTbQQ/lHzXUmcmXJy+yeHqcy3I63kghmoSWxVnM8GqZ1F
	 QAEuW772CeWzvRKQhjdZLeVNj2WCkTUYSc+Hpf53kInALjM0XRCPzN0SlvVPHSyPdg
	 19F54EGZI+vUJB+7OLplFQJa5s5EaP22fv6wxSTWS7eK1eKLqH4UGOYT8o8BL5+Cra
	 CoELMHbRU6v3bl4oXYDPdSsSxw0KcP05Imr7fAdopv+pxcND2/a6JT4rGXxKDT7H/Y
	 E8+D825YrmbSNdKIq5se6Xu0H2n8GAPUbuTxmcICepRpHCPVIPqowOBLdwsJ3D9Wb9
	 Ry3E/HpEbNZrg==
Date: Tue, 29 Sep 2026 17:25:04 -0700
From: Oliver Upton <oupton@kernel.org>
To: Tian Zheng <zhengtian10@huawei.com>
Cc: maz@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	corbet@lwn.net, pbonzini@redhat.com, leo.bras@arm.com,
	yuzenghui@huawei.com, wangzhou1@hisilicon.com,
	yangjinqian1@huawei.com, caijian11@h-partners.com,
	liuyonglong@huawei.com, tangchengchang@huawei.com,
	yezhenyu2@huawei.com, yubihong@huawei.com, linuxarm@huawei.com,
	joey.gouly@arm.com, kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, fuad.tabba@linux.dev,
	mark.rutland@arm.com, seanjc@google.com, rdunlap@infradead.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v5 01/15] KVM: arm64: pgtables: Change write bit from
 S2AP_W to DBM
Message-ID: <arxW4PUY3qqRkogl@kernel.org>
References: <20260929103655.85107-1-zhengtian10@huawei.com>
 <20260929103655.85107-2-zhengtian10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929103655.85107-2-zhengtian10@huawei.com>
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

Hi Tian,

On Tue, Sep 29, 2026 at 06:36:41PM +0800, Tian Zheng wrote:
> From: Leonardo Bras <leo.bras@arm.com>
> 
> As a first step of changing the encoding for the Stage2 PTE descriptor,
> introduce the DBM bit, and adapt every usage of writable to use the DBM
> bit (51) instead of S2AP[1]/Dirty bit (7).
> 
> With DBM as the write permission bit and S2AP[1] as the dirty state,
> the encoding follows the FEAT_S2PIE principle of managing permissions
> and dirty state independently.
> 
> For this step, we convert usages of RW(Dirty) -> WD(DBM|Dirty): every
> writable mapping sets both bits, read-only mappings clear both, and no
> behaviour changes.
> 
> Link: https://lore.kernel.org/all/20260901171558.2674031-2-leo.bras@arm.com/
> Signed-off-by: Leonardo Bras <leo.bras@arm.com>
> [zhengtian: keep the nested walker reading writability from S2AP[1]
> alone, document why, and reword the commit message]
> Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
> ---
>  arch/arm64/include/asm/kvm_pgtable.h | 3 +++
>  arch/arm64/kvm/hyp/pgtable.c         | 7 ++++---
>  arch/arm64/kvm/nested.c              | 5 +++++
>  arch/arm64/kvm/ptdump.c              | 4 ++--
>  4 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index 41a8687938eb..37baa86d6fd8 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -93,10 +93,13 @@ typedef u64 kvm_pte_t;
> 
>  #define KVM_PTE_LEAF_ATTR_HI_S2_XN	GENMASK(54, 53)
> 
> +#define KVM_PTE_LEAF_ATTR_HI_S2_DBM	BIT(51)
> +
>  #define KVM_PTE_LEAF_ATTR_HI_S1_GP	BIT(50)
> 
>  #define KVM_PTE_LEAF_ATTR_S2_PERMS	(KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R | \
>  					 KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W | \
> +					 KVM_PTE_LEAF_ATTR_HI_S2_DBM | \
>  					 KVM_PTE_LEAF_ATTR_HI_S2_XN)
> 
>  /* pKVM invalid pte encodings */
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index b74dd5ce1efd..50f4d3a74f77 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -732,7 +732,7 @@ static int stage2_set_prot_attr(struct kvm_pgtable *pgt, enum kvm_pgtable_prot p
>  		attr |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R;
> 
>  	if (prot & KVM_PGTABLE_PROT_W)
> -		attr |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
> +		attr |= KVM_PTE_LEAF_ATTR_HI_S2_DBM | KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;

Hmm... I'd actually like to see this structured where the "write" bit
could either be S2AP_W or DBM depending on if the system supports
FEAT_HAFDBS. Look at how HVHE is handled for selecting the right AP
encoding for the hyp stage-1 page tables.

> diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
> index 69899797dbad..b0cb8d84a9e9 100644
> --- a/arch/arm64/kvm/ptdump.c
> +++ b/arch/arm64/kvm/ptdump.c
> @@ -40,8 +40,8 @@ static const struct ptdump_prot_bits stage2_pte_bits[] = {
>  		.clear	= " ",
>  	},
>  	{
> -		.mask	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W,
> -		.val	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W,
> +		.mask	= KVM_PTE_LEAF_ATTR_HI_S2_DBM,
> +		.val	= KVM_PTE_LEAF_ATTR_HI_S2_DBM,
>  		.set	= "W",
>  		.clear	= " ",
>  	},
> --
> 2.43.0
> 

