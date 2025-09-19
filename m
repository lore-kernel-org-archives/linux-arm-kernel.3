Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41739CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 22:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c10gttiRf4SwrPt9wISmA+SEZzX4oEt3NSpPnwS9bNc=; b=PmZcZocPRum+YUKGewlB+/Jupd
	IbuESKeyI2s2poxQZsGX/oowPnJe1nKKrUfBrLz5KPNHlGxT3OpV7zk30IFt807+96KRXwimQOxV9
	vYyMihL6lC2dCn5Ehgkr29EfbvoP4pljTvi3Mtplej4PwbRr4JEoBajsjlk6FvUQKf2uxwui7H99y
	ftjIb+FU29rf/yqFFjeGx8Z5NoCPsjywBaHpSXngGwECfUBMRIXZVFR4jeYNhpEGfGlrQ3agxCBAg
	mXaastn90LkXSHD79SMLVhBJzA1yRhwJJZbtZkeTjh1BrhWVoDOWovrh2fPJWIbjUs8LUtLs/cMPG
	efFwhvOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzjdu-00000004CEZ-3JTy;
	Fri, 19 Sep 2025 22:31:50 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzjds-00000004CE3-0zv2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 22:31:49 +0000
Date: Fri, 19 Sep 2025 15:31:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758321105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c10gttiRf4SwrPt9wISmA+SEZzX4oEt3NSpPnwS9bNc=;
	b=moW/wAEZCaFLtjdUpFOMoJ9WaiKHMnl5DCAHKBbwhzFtxozg6YXnTOu4k6uLrU3L5/gUOO
	kSSPQUPJkuEVEEOiB+hgG7TbO/EK2e4hijkZ9a0WEfyh0JdOP/N0gYPDqb4i2hOm7Tb5pG
	PONy+kddjYGuSUmiSTOLClct66G9H4w=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 14/16] KVM: arm64: Add S1 IPA to page table level
 walker
Message-ID: <aM3ZzSwdPsrz5wjI@linux.dev>
References: <20250915114451.660351-1-maz@kernel.org>
 <20250915114451.660351-15-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915114451.660351-15-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_153148_420880_B013ED7C 
X-CRM114-Status: GOOD (  24.57  )
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

On Mon, Sep 15, 2025 at 12:44:49PM +0100, Marc Zyngier wrote:
> Use the filtering hook infrastructure to implement a new walker
> that, for a given VA and an IPA, returns the level of the first
> occurence of this IPA in the walk from that VA.
> 
> This will be used to improve our SEA syndrome reporting.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_nested.h |  2 +
>  arch/arm64/kvm/at.c                 | 65 +++++++++++++++++++++++++++++
>  2 files changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
> index cce0e4cb54484..2be6c3de74e3d 100644
> --- a/arch/arm64/include/asm/kvm_nested.h
> +++ b/arch/arm64/include/asm/kvm_nested.h
> @@ -353,6 +353,8 @@ struct s1_walk_result {
>  
>  int __kvm_translate_va(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
>  		       struct s1_walk_result *wr, u64 va);
> +int __kvm_find_s1_desc_level(struct kvm_vcpu *vcpu, u64 va, u64 ipa,
> +			     int *level);
>  
>  /* VNCR management */
>  int kvm_vcpu_allocate_vncr_tlb(struct kvm_vcpu *vcpu);
> diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
> index c099bab30cb0d..117ce1ff5e767 100644
> --- a/arch/arm64/kvm/at.c
> +++ b/arch/arm64/kvm/at.c
> @@ -1578,3 +1578,68 @@ int __kvm_translate_va(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
>  
>  	return 0;
>  }
> +
> +struct desc_match {
> +	u64	ipa;
> +	int	level;
> +};
> +
> +static int match_s1_desc(struct s1_walk_context *ctxt, void *priv)
> +{
> +	struct desc_match *dm = priv;
> +	u64 ipa = dm->ipa;
> +
> +	/* Use S1 granule alignment */
> +	ipa &= GENMASK(52, ctxt->wi->pgshift);
> +

Bit 51 again

> +	/* Not the IPA we're looking for? Continue. */
> +	if (ipa != ctxt->table_ipa)
> +		return 0;
> +
> +	/* Note the level and interrupt the walk */
> +	dm->level = ctxt->level;
> +	return -EINTR;
> +}
> +
> +int __kvm_find_s1_desc_level(struct kvm_vcpu *vcpu, u64 va, u64 ipa, int *level)
> +{
> +	struct desc_match dm = {
> +		.ipa	= ipa,
> +	};
> +	struct s1_walk_info wi = {
> +		.filter	= &(struct s1_walk_filter){
> +			.fn	= match_s1_desc,
> +			.priv	= &dm,
> +		},
> +		.regime	= TR_EL10,
> +		.as_el0	= false,
> +		.pan	= false,
> +	};
> +	struct s1_walk_result wr = {};
> +	int ret;
> +
> +	ret = setup_s1_walk(vcpu, &wi, &wr, va);
> +	if (ret)
> +		return ret;
> +
> +	/* We really expect the S1 MMU to be on here... */
> +	if (WARN_ON_ONCE(wr.level == S1_MMU_DISABLED)) {
> +		*level = 0;
> +		return 0;
> +	}
> +
> +	/* Walk the guest's PT, looking for a match along the way */
> +	ret = walk_s1(vcpu, &wi, &wr, va);
> +	switch (ret) {
> +	case -EINTR:
> +		/* We interrupted the walk on a match, return the level */
> +		*level = dm.level;
> +		return 0;
> +	case 0:
> +		/* The walk completed, we failed to find the entry */
> +		return -ENOENT;
> +	default:
> +		/* Any other error... */
> +		return ret;
> +	}
> +}
> -- 
> 2.39.2
> 

