Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C55AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 06:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+okklJ0QrWgWJmErfTb4uE/aColv2ZM7UG+sQVjv9/g=; b=WwScTh/6G5as53rF6X8pDLpRVx
	cKGu7zBD9Nsupl1Kx4tYa4ycP9iuaqxJ2rwcQfqWd10p1V1CxqKJZ9eXz+sFNnovrlOo9RyR8dUbe
	B/SAbA3wwReBQg8Im4caYnoerdn84cb31bQ3ayTHb3uOI9EeelvMi5tpfBqgG4H9rSiUa2KXax/tz
	wwJixPCi5hvndpKPfF8LdtACe6HsN7X9tjPGUkBpvGb7Ny8CnmArEsQJqycAjq8AW5fTu4m16RN7J
	DBqUcA7frfvaM07vRwJls1H38HULyWTC3MR+kMqVwj3XAiTQCWLRqQ3nYQXZIOSGbmkQ6YpxiQ4Sg
	e5Gqhrtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiQex-00000006EQx-3ZJ4;
	Sat, 11 Jul 2026 05:53:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiQeu-00000006EQX-095d
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 05:53:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C0DD1477;
	Fri, 10 Jul 2026 22:53:44 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 271293F85F;
	Fri, 10 Jul 2026 22:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783749228; bh=/JDeLfUU8Vo4QZFaEJTH84CGrJxvZ/Cc/cC4kO3egWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QAtqyYGas00tRpskypOB10t0acxLWkPMef2DsGevap0wyGrlH5n7obg52O6t9D3Oe
	 iejfKw8G6Zo24BuK6ULpvhfpKoHhaKGmfMXULjWyTMWHu8yN3+YPm5z6R26omab/WY
	 +yAZRnr0PoBrcJDP4J7wOl28np+mzfCsgaMgljQk=
Date: Sat, 11 Jul 2026 06:53:28 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Leonardo Bras <leo.bras@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Raghavendra Rao Ananta <rananta@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] KVM: arm64: Introduce
 KVM_PGTABLE_WALK_SKIP_LEVEL* walk flags
Message-ID: <jiy6rtx24nqnnduze3uuvc2ifqrjlskhefyctlwyh2jshdjrw2@a2wpodq6ife6>
References: <20260708134101.2514759-1-leo.bras@arm.com>
 <20260708134101.2514759-3-leo.bras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708134101.2514759-3-leo.bras@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_225352_356212_933B669B 
X-CRM114-Status: GOOD (  23.55  )
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

Hi Leonardo,

On Wed, Jul 08, 2026 at 02:40:58PM +0100, Leonardo Bras wrote:
> Add the new walking flags that tell kvm_pgtable_walk() to skip lower levels
> when walking the pagetables.
> 
> Signed-off-by: Leonardo Bras <leo.bras@arm.com>
> ---
>  arch/arm64/include/asm/kvm_pgtable.h | 13 +++++++++++++
>  arch/arm64/kvm/hyp/pgtable.c         | 19 ++++++++++++++++---
>  2 files changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index 41a8687938eb..20c7c12e0e76 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -311,31 +311,44 @@ typedef bool (*kvm_pgtable_force_pte_cb_t)(u64 addr, u64 end,
>   * @KVM_PGTABLE_WALK_SHARED:		Indicates the page-tables may be shared
>   *					with other software walkers.
>   * @KVM_PGTABLE_WALK_IGNORE_EAGAIN:	Don't terminate the walk early if
>   *					the walker returns -EAGAIN.
>   * @KVM_PGTABLE_WALK_SKIP_BBM_TLBI:	Visit and update table entries
>   *					without Break-before-make's
>   *					TLB invalidation.
>   * @KVM_PGTABLE_WALK_SKIP_CMO:		Visit and update table entries
>   *					without Cache maintenance
>   *					operations required.
> + * @KVM_PGTABLE_WALK_SKIP_LEVEL0:	Skip visiting level-0+ entries
> + * @KVM_PGTABLE_WALK_SKIP_LEVEL1:	Skip visiting level-1+ entries
> + * @KVM_PGTABLE_WALK_SKIP_LEVEL2:	Skip visiting level-2+ entries
> + * @KVM_PGTABLE_WALK_SKIP_LEVEL3:	Skip visiting level-3 entries

Just a drive-by nit:
Maybe avoid the level-$LEVEL terminology? Since as you said there is
level -1 in the architecture, in that case you'd have to write
"level--1" which is awkward :)

Thanks,
Wei-Lin Chang

>   */
>  enum kvm_pgtable_walk_flags {
>  	KVM_PGTABLE_WALK_LEAF			= BIT(0),
>  	KVM_PGTABLE_WALK_TABLE_PRE		= BIT(1),
>  	KVM_PGTABLE_WALK_TABLE_POST		= BIT(2),
>  	KVM_PGTABLE_WALK_SHARED			= BIT(3),
>  	KVM_PGTABLE_WALK_IGNORE_EAGAIN		= BIT(4),
>  	KVM_PGTABLE_WALK_SKIP_BBM_TLBI		= BIT(5),
>  	KVM_PGTABLE_WALK_SKIP_CMO		= BIT(6),
> +	KVM_PGTABLE_WALK_SKIP_LEVEL0		= BIT(7),
> +	KVM_PGTABLE_WALK_SKIP_LEVEL1		= BIT(8),
> +	KVM_PGTABLE_WALK_SKIP_LEVEL2		= BIT(9),
> +	KVM_PGTABLE_WALK_SKIP_LEVEL3		= BIT(10),
>  };
>  
> +#define KVM_PGTABLE_WALK_SKIP_LEVELS 	(KVM_PGTABLE_WALK_SKIP_LEVEL0 | \
> +					 KVM_PGTABLE_WALK_SKIP_LEVEL1 | \
> +					 KVM_PGTABLE_WALK_SKIP_LEVEL2 | \
> +					 KVM_PGTABLE_WALK_SKIP_LEVEL3 )
> +
>  struct kvm_pgtable_visit_ctx {
>  	kvm_pte_t				*ptep;
>  	kvm_pte_t				old;
>  	void					*arg;
>  	struct kvm_pgtable_mm_ops		*mm_ops;
>  	u64					start;
>  	u64					addr;
>  	u64					end;
>  	s8					level;
>  	enum kvm_pgtable_walk_flags		flags;
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 4be1d51a6ac5..b9a2078efc51 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -137,20 +137,33 @@ static bool kvm_pgtable_walk_continue(const struct kvm_pgtable_walker *walker,
>  	 * Ignore the return code altogether for walkers outside a fault handler
>  	 * (e.g. write protecting a range of memory) and chug along with the
>  	 * page table walk.
>  	 */
>  	if (r == -EAGAIN)
>  		return walker->flags & KVM_PGTABLE_WALK_IGNORE_EAGAIN;
>  
>  	return !r;
>  }
>  
> +static __always_inline bool kvm_pgtable_skip_level(s8 level, enum kvm_pgtable_walk_flags flags)
> +{
> +	flags &= KVM_PGTABLE_WALK_SKIP_LEVELS;
> +
> +	if (likely(!flags))
> +		return false;
> +
> +	if (level >= (ffs(flags) - ffs(KVM_PGTABLE_WALK_SKIP_LEVELS)))
> +		return true;
> +
> +	return false;
> +}
> +
>  static int __kvm_pgtable_walk(struct kvm_pgtable_walk_data *data,
>  			      struct kvm_pgtable_mm_ops *mm_ops, kvm_pteref_t pgtable, s8 level);
>  
>  static inline int __kvm_pgtable_visit(struct kvm_pgtable_walk_data *data,
>  				      struct kvm_pgtable_mm_ops *mm_ops,
>  				      kvm_pteref_t pteref, s8 level)
>  {
>  	enum kvm_pgtable_walk_flags flags = data->walker->flags;
>  	kvm_pte_t *ptep = kvm_dereference_pteref(data->walker, pteref);
>  	struct kvm_pgtable_visit_ctx ctx = {
> @@ -185,35 +198,35 @@ static inline int __kvm_pgtable_visit(struct kvm_pgtable_walk_data *data,
>  	 * into a newly installed or replaced table.
>  	 */
>  	if (reload) {
>  		ctx.old = READ_ONCE(*ptep);
>  		table = kvm_pte_table(ctx.old, level);
>  	}
>  
>  	if (!kvm_pgtable_walk_continue(data->walker, ret))
>  		return ret;
>  
> -	if (!table) {
> +	if (!table || kvm_pgtable_skip_level(level + 1, ctx.flags)) {
>  		data->addr = ALIGN_DOWN(data->addr, kvm_granule_size(level));
>  		data->addr += kvm_granule_size(level);
>  		goto out;
>  	}
>  
>  	childp = (kvm_pteref_t)kvm_pte_follow(ctx.old, mm_ops);
>  	ret = __kvm_pgtable_walk(data, mm_ops, childp, level + 1);
>  	if (!kvm_pgtable_walk_continue(data->walker, ret))
>  		return ret;
>  
> -	if (ctx.flags & KVM_PGTABLE_WALK_TABLE_POST)
> +out:
> +	if (table && ctx.flags & KVM_PGTABLE_WALK_TABLE_POST)
>  		ret = kvm_pgtable_visitor_cb(data, &ctx, KVM_PGTABLE_WALK_TABLE_POST);
>  
> -out:
>  	if (kvm_pgtable_walk_continue(data->walker, ret))
>  		return 0;
>  
>  	return ret;
>  }
>  
>  static int __kvm_pgtable_walk(struct kvm_pgtable_walk_data *data,
>  			      struct kvm_pgtable_mm_ops *mm_ops, kvm_pteref_t pgtable, s8 level)
>  {
>  	u32 idx;
> -- 
> 2.55.0
> 

