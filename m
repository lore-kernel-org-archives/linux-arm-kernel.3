Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5CAC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHnT+GMhZhgB49AXdS40CMB1qPWsP3S6DBlSvAeDhzQ=; b=dyMrGSigqNyVWk1XbTcpk2fz+m
	4MJEK2LzGqdoRTouanAw4t0Mu9ug8kkic21HLLAr1svZV6bF+pd6sxbAqCPoBIY39RK84IPGKWRRr
	gb05kXoEn1+3HDvFqqBpTlmCWP3HWklSdXbc9VLg6Am/dup7Htd/4N5rk2WdKzpJSZ7Sj7OlQ28wc
	8sVhtcoiEWSgWH0rlFvD2dh5J+6Baj7LIyXBJMD7E8lsRCBnp5lwi1+R0CDQuyxZ5nTMDdkzpABYw
	Y2ccMWXaKcoz5lsPSOT+xdRh/orAs+1kI29XFEQSVFVJPsFKBwHAI7u9e6vPtazJlokuvPo1fR2xY
	rYF1JEAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nPP-0000000BnmB-3jzi;
	Thu, 24 Sep 2026 17:38:59 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nPN-0000000BnlR-25Au
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:38:58 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49ccf12bed0so3425e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790271534; x=1790876334; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fHnT+GMhZhgB49AXdS40CMB1qPWsP3S6DBlSvAeDhzQ=;
        b=fsk6GKIOOzn55b0K0uRfTNae9a+rA8pRox4/6rkgLkvhfad8nsOsuUl3f2kcZm5kFD
         6mCh7HgbfeR8AoiwD7jwjZzwvzltWnXApPflg398Btvn1os5ddhyI5UlKoKrerdUaRMm
         e+guRIO7eusOzsGG6ws5CMChkIUgoNNU9cWDQtE6y4HFojwyW2i0VwNlYXe621ELaixS
         LIXbce4djLBMPF4kc+I48aXj05qeVSAyzaUr64lNg2XhbmLuM2dNaM+T8qSTSOdTVpc+
         5tmp3ZOiRC1jwKBGGg3bfBg26qXC0Bvqb5+35JSEyTM3PkmJrllHKm+MjQMNmPnaevZ8
         tCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271534; x=1790876334;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fHnT+GMhZhgB49AXdS40CMB1qPWsP3S6DBlSvAeDhzQ=;
        b=MbWiAJHPKwT074pX6n5R5Raxyl7GrGXMRMdRVpxyZwyC5X5x5038pMOMEFONGOVy4N
         yM3PqtvWH1GAf7bOySH2B3XtM/obNU3KaSmAiMt7LMiKQa/oo1+QlCHmc2JEV1fwOB21
         krGwGXCWSriR3PmkcMu4JgYuPn4c+4S3hrXFYlxVvDJHj+yAnSIbTE3RS0VdFqDGAcIp
         5SWUcIRSFg04IY/RgH48ZyTVSZZ5Tw3zlqp6uUQVkEDwlwqOVv6eGfKfOO+tjEmPpuxu
         Aa6fsLDdfkrMD5O3WMf06DPlDPwOyoqdohDLKv/dFaLvTwpS23nefkeu3kF05RShcmHZ
         BMLw==
X-Forwarded-Encrypted: i=1; AKwUvBxwZ0TULnFtQxMv5TSWdv1i49sgWFZFYop1xd0feoTvUIlSpgSDlCtdRYB4VG0MPxEcx5h3UqfKjx8xZmMiWDd3@lists.infradead.org
X-Gm-Message-State: AFuF++lajl12wbRHG4DcW1A2T+tTQBQ2Hcgk6nOEXFC9pmqSjK1ySWMI
	QIVy0Ybzu3a5vlAcM6kpMha9cC6dg51CqMMPU0dPYKfWKc4TvJcNBIqqaGblwN1/aw==
X-Gm-Gg: AYBFou2PePBXuZ+QMrlNJHEEzpqEizYqrf5NLJnRIdr8NVzTvIaJCx1AOGSx/ZshCKn
	Ch4kC3JYqcP+gwaPfuaDQu1YNdOw2rqSX33Zr7tX7eeqGFWWJycLxviNu6mkRvMWRNlAvxAuZ8f
	9/8AAywPsUbxZbNCAgTcxzDa1QHhCIhjkwkruyyn+ICl8rp7byeAayHh9gLr63JgaYldsFydSGX
	oSYY6LHLquKw73GpXfZf8YrWqHHLA/Aivd91oHjNrTAvjt6ggEerCpyBOa2zfTmrGtlQ4ro+zp8
	2/OfRDaAS1XhjvOHBZsMJcrqeHCaKoP88EB96dK8zzmHT3py+7fSyIcKjm8a8HxX2syBHF1a4d7
	BNFGxz2JmK0q3FA2GAKtstqi5vDH1/wvvgK3INLrQ+Pd4gcJpm31SzAF2ekL1VfK5As8TYRE7kF
	vn0f1On6zH61ZyRCASBoGd+mct8X/g6cZAzgSScXxymtrUj8daY2Rg+RJL0dGAjrb4r05kfmWNY
	0GwqKIqWA9vUPB/Rcoc6Jh7Aa90Axd3a0u6WiYt
X-Received: by 2002:a05:600d:1b:b0:49c:ca44:63db with SMTP id 5b1f17b1804b1-49feef0df76mr39215e9.13.1790271534149;
        Thu, 24 Sep 2026 10:38:54 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm129441475e9.12.2026.09.24.10.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:38:53 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:38:49 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	fuad.tabba@linux.dev, qperret@google.com, weilin.chang@arm.com,
	Keir Fraser <keirf@google.com>
Subject: Re: [PATCH v2 01/22] KVM: arm64: Prefault host stage-2 entries on
 block split
Message-ID: <arVgKRqRRon00wTD@google.com>
References: <20260911135053.146435-1-vdonnefort@google.com>
 <20260911135053.146435-2-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911135053.146435-2-vdonnefort@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_103857_559613_82967CB3 
X-CRM114-Status: GOOD (  26.90  )
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

On Fri, Sep 11, 2026 at 02:50:32PM +0100, 'Vincent Donnefort' via kernel-team wrote:
> From: Keir Fraser <keirf@google.com>
> 
> For the host stage-2 that is idmap, we can avoid lazy-mapping on block
> splitting by propagating existing valid mappings to neighbouring entries
> of the new table.
> 
> Signed-off-by: Keir Fraser <keirf@google.com>
> Co-developed-by: Quentin Perret <qperret@google.com>
> Signed-off-by: Quentin Perret <qperret@google.com>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> ---
>  arch/arm64/kvm/hyp/pgtable.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index b74dd5ce1efd..34f78a58cded 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -1030,10 +1030,39 @@ static int stage2_map_walk_table_pre(const struct kvm_pgtable_visit_ctx *ctx,
>  	return 0;
>  }
>  
> +static void stage2_map_prefault_idmap(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_t *ptep)
> +{
> +	kvm_pte_t block_pte = ctx->old;
> +	u64 pa;
> +	int i;
> +
> +	if (!kvm_pte_valid(block_pte))
> +		return;
> +
> +	pa = ALIGN_DOWN(ctx->addr, kvm_granule_size(ctx->level));
> +	for (i = 0; i < PTRS_PER_PTE; ++i, ++ptep, pa += kvm_granule_size(ctx->level + 1)) {
> +		kvm_pte_t pte = kvm_init_valid_leaf_pte(pa, block_pte, ctx->level + 1);
> +
> +		/*
> +		 * Skip ptes in the range being modified by the caller if we're
> +		 * installing last level entries. Otherwise, we need to
> +		 * temporarily put in a valid mapping to make sure the
> +		 * prefaulting logic is triggered on the next
> +		 * stage2_map_walk_leaf(). This adds an unnecessary TLBI as
> +		 * we'll presumably re-break the freshly installed block, but
> +		 * that should happen very infrequently.
> +		 */
> +		if ((ctx->level < (KVM_PGTABLE_LAST_LEVEL - 1)) ||
> +		    (pa < ctx->addr) || (pa >= ctx->end))
> +			*ptep = pte;

Do we need now to call get_page() on the table as we are installing a
new PTE?

Also, I think we need a WRITE_ONCE() for the PTE write.

Thanks,
Mostafa

> +	}
> +}
> +
>  static int stage2_map_walk_leaf(const struct kvm_pgtable_visit_ctx *ctx,
>  				struct stage2_map_data *data)
>  {
>  	struct kvm_pgtable_mm_ops *mm_ops = ctx->mm_ops;
> +	struct kvm_pgtable *pgt = data->mmu->pgt;
>  	kvm_pte_t *childp, new;
>  	int ret;
>  
> @@ -1051,6 +1080,9 @@ static int stage2_map_walk_leaf(const struct kvm_pgtable_visit_ctx *ctx,
>  	if (!childp)
>  		return -ENOMEM;
>  
> +	if (pgt->flags & KVM_PGTABLE_S2_IDMAP)
> +		stage2_map_prefault_idmap(ctx, childp);
> +
>  	if (!stage2_try_break_pte(ctx, data->mmu)) {
>  		mm_ops->put_page(childp);
>  		return -EAGAIN;
> -- 
> 2.55.0.1007.g17ff1f9808-goog
> 
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
> 

