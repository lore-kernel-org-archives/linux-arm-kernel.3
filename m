Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066A6C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 13:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XmQIDoksLE7oaKkO04hoo+Dpjd0npRHSzBhm6opESbI=; b=jNLai7giH1N3vgYten7vy2L7o/
	9TIDyg7rkok2WtojkPo9ZV70FUVZ6ah01/UV3EUy0ySCo9/yfjTlh2te0OnAijwS2nHACdlhJmluA
	c32iHhqTOnCxEj4ktJnrfcT/hQljYCd47EPg/rxcBV+Xn9H9Mu5v+Kb6c0qWpapBFAS0lXDKmbMTJ
	L0NJ40QybJ2xIqxvhXlZ2PxxiZJm+dZw5ultkPhXONh8BjPyg6QFNZdUQHFDEkEFDKDmcm4PnMcPL
	m3drhQ9xbVVKnNGlx+n9rY8+zKc+Ae0hiEwQ/BO0x26MwtELyGP/w9bTUf4K9fazcs+3RUY5zbN8b
	BkOiE7+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZsF-00000006zjO-2OSm;
	Mon, 07 Sep 2026 13:59:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Zs8-00000006ziV-2egi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 13:59:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FBF31476;
	Mon,  7 Sep 2026 06:58:50 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D385A3F528;
	Mon,  7 Sep 2026 06:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788789534; bh=NzNTBAk83y8XbyUgLM1mh1qrc9Ozm93iuKTO8tf07XU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MRKClLKvPgio3jdXujlosyDA32qA3RlgTkFD4Q2tAWuc05NA41F2XQnz+X4BHuCHL
	 PRcb0JZJ+oU9MskoG6yXVymOI/mM5/nFqpNvW6++qLhmZHLpHH8ymeBmBwFaIZ4KXz
	 T+UHNx3k6wbHuZdHECJJd6BUStNCTgCc38wgi77s=
Date: Mon, 7 Sep 2026 14:58:41 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Vincent Donnefort <vdonnefort@google.com>, maz@kernel.org, 
	oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, keirf@google.com
Subject: Re: [PATCH 02/20] KVM: arm64: Propagate host stage-2 annotated
 entries on block split
Message-ID: <s3p6em2fovzkpyy5lpslxl7nl6ojhoilyqlydidy4unef6wnuw@mzgrpwwkbaxn>
References: <20260803100904.3563942-1-vdonnefort@google.com>
 <20260803100904.3563942-3-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803100904.3563942-3-vdonnefort@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_065856_710756_CD205A2A 
X-CRM114-Status: GOOD (  13.17  )
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

On Mon, Aug 03, 2026 at 11:08:46AM +0100, Vincent Donnefort wrote:

[...]

>  static void stage2_map_prefault_idmap(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_t *ptep)
>  {
>  	kvm_pte_t block_pte = ctx->old;
> +	bool counted, valid;
>  	u64 pa;
>  	int i;
>  
> -	if (!kvm_pte_valid(block_pte))
> +	counted = stage2_pte_is_counted(block_pte);
> +	valid = kvm_pte_valid(block_pte);
> +
> +	if (!valid && !counted)
> +		return;
> +
> +	/*
> +	 * Shared walks not supported: cannot rollback refcounts on break
> +	 * failure.
> +	 */
> +	if (counted && WARN_ON_ONCE(kvm_pgtable_walk_shared(ctx)))

Doesn't patch 1 also need this shared walk check,

>  		return;
>  
>  	pa = ALIGN_DOWN(ctx->addr, kvm_granule_size(ctx->level));
>  	for (i = 0; i < PTRS_PER_PTE; ++i, ++ptep, pa += kvm_granule_size(ctx->level + 1)) {
> -		kvm_pte_t pte = kvm_init_valid_leaf_pte(pa, block_pte, ctx->level + 1);
> +		kvm_pte_t pte = valid ?
> +			kvm_init_valid_leaf_pte(pa, block_pte, ctx->level + 1) :
> +			block_pte;
>  
>  		/*
>  		 * Skip ptes in the range being modified by the caller if we're
> @@ -1053,8 +1066,11 @@ static void stage2_map_prefault_idmap(const struct kvm_pgtable_visit_ctx *ctx, k
>  		 * that should happen very infrequently.
>  		 */
>  		if ((ctx->level < (KVM_PGTABLE_LAST_LEVEL - 1)) ||
> -		    (pa < ctx->addr) || (pa >= ctx->end))
> +		    (pa < ctx->addr) || (pa >= ctx->end)) {
>  			*ptep = pte;
> +			if (counted)
> +				ctx->mm_ops->get_page(ptep);

and this get_page() ?

Thanks,
Wei-Lin Chang

[...]

