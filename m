Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBEBC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 10:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQwFKkNHohYJqLfEiVBsi1W4lxWzuV9PCdLiSox37RE=; b=zKnEw7AwROzcdpNxCz3FugXtiY
	GprZGudxju14cqj3vKcRyK+F1S5SpD4bS1x7EXkCDpUnmCnYxfbPH5CU9VH4z9XT2XLLzvF5gR7xj
	mZJh0NlkV7tMHWTwJ5iKKEFPRpTfgyCbA1dK5NJq+bwAarpZW7U7v9ikNjAkQtlkqlQvr7u7cO/FZ
	VnxS8kIvFdxUTL8gXaiq4lZ84LTH8rOG8rJmGkdeYeNTsfQvSXcpHHxeFTA+wtje3WYavXPnZHrTA
	fW91f59BZSV9KKB4RkkjDNNtGYbW7jvjCNEEgtUeXN+tn83JiPOrDKFa2MlljfksRQhqKxYw9wZQQ
	BYmJ7gZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sja-00000008jHF-45WV;
	Tue, 08 Sep 2026 10:07:22 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sjZ-00000008jGc-0Ger
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 10:07:22 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49d0b98d6d0so24627845e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 03:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788862038; x=1789466838; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VQwFKkNHohYJqLfEiVBsi1W4lxWzuV9PCdLiSox37RE=;
        b=ggLCbvVzPDv5wX1yzvKIzUVmXJhxVKkwTJedl42cU+t/xEcWqQD500rMpl+Bi6h72r
         On2SOTlhh6uZJ2lTkmqn2qclWDwTPVr1+0KhPyfvoVVG7ocQAmDylBOjRYxb91G4HDhs
         1+CWGsAqrZXZ/NjMltz9ttoNU1BhoyEXdcGGUgE9blb0xDAeQ/H18wL0r+0nK22B/mt4
         e5NaP5NvdiVx//EXeqjtCAJp6+TUztXkTYnrY/wB3LYXBNQKiCnT1NzMpb5NKAXvihQf
         0EJ2OAsZ5B4uidqnZl5rAXAKN9z7ia5jwCu3xexTCG+QLkIvC8VYy+wzF+mH4MDlcxCV
         sdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788862038; x=1789466838;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VQwFKkNHohYJqLfEiVBsi1W4lxWzuV9PCdLiSox37RE=;
        b=HULm0aIQSEKVVEvM6uHunFfdPPH58+vAUZ7JjrZ1EknElOs3AX3El1AQ29FxDxeYul
         r98fXHqUY5eMgj0UyFUvICPofeSvBHiJABORVeiv0OIdHizCelba477aw6Uv0i1wA+uL
         AmfNEPxIVe/ZAJzCtCLsRVwF9ewUhCDfpF6Iih5VVQu2cs5TEOoIk/FG8STxbv6g6AmW
         q6s288qv6fB+MFO19dZAbuYb5OZ64kurhBOKSMoxLd1GLFnzRJEJICs6jfLoUiDNzUlO
         lHaiYOcOGHlgRe4pyBttQBAm0n1sFgbIs3pS9PEQyAbXNf3Sa51RgHSnesOzwxfXlRbz
         nocg==
X-Forwarded-Encrypted: i=1; AKwUvBzPLA8w2W0kcjEUZPfCAjtSFYTrA1giTXMuu2fT5/z5ZRPQ7nVZ/STquZMmZVxVS4QK/UC/IRGRzx+GKoY6wBBm@lists.infradead.org
X-Gm-Message-State: AFuF++kqhQ6jva4kLCyaH1yZsoGp0Bfd0yFDIPTrTFI5K9nhNC2wvamu
	8J8zq7Tpc77WAClYAaoabUJRniBnWT+pgxdbUpdE2CVpYbqW1BVwZCPFpZH6rf4UWQ==
X-Gm-Gg: AYBFou0b08BGqCgtrxBjzvZG81qT4+UAqSrFXWx06SqFZSYtL0/z7kYMjL5bxxGY9jw
	YA/+r6x9HjJb4o8dujgzPlcehBpORL26uRVRev/wX2hUqezkXysIxkjNTeeSBz+Ve2eryJbQStU
	Ot6Frwd9686OT9JePu0ck3Cy3mXtRDVr3OKLvGwShIYa1wt/3RkGAVwCjOH3ljiXubOJ751lyXN
	eAljm5L5VoZzs9Z4svdfi2x70eUh4v4FPxwuY8BZQe02XGQ24NfidG4cOWv9IXqBT/87eUEB4TE
	ORRBYYDd2wzbyQ3KUw5eVFmj104pqc0uh64cjBuLkTNglayRv4Wa0LdkWaYDPnG23EeEmGTi6Yw
	qfodmG6xTlF1X319d/acMJhLEG7O/2bVFkZCo4c0unTr8+5a7IhvGsAxwdOnJeHcGt52TZfO800
	/lFE6V8+23XP0oP88wNhjart4sZ3rybEx5ipCRsT5DV0O5jBGWVsbju3iSXmCY+3aQJ/UZFmATc
	RNoGh6KLohm6gC95ffGYZ4ZAyXo6YNrMUWXbEFzWCc=
X-Received: by 2002:a05:600c:8b05:b0:49c:edd2:855 with SMTP id 5b1f17b1804b1-49cf823c411mr287008465e9.6.1788862036554;
        Tue, 08 Sep 2026 03:07:16 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7fec25sm544179385e9.13.2026.09.08.03.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:07:16 -0700 (PDT)
Date: Tue, 8 Sep 2026 11:07:12 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	fuad.tabba@linux.dev, qperret@google.com, keirf@google.com
Subject: Re: [PATCH 02/20] KVM: arm64: Propagate host stage-2 annotated
 entries on block split
Message-ID: <ap_eUDk2Oo2-qIcm@google.com>
References: <20260803100904.3563942-1-vdonnefort@google.com>
 <20260803100904.3563942-3-vdonnefort@google.com>
 <s3p6em2fovzkpyy5lpslxl7nl6ojhoilyqlydidy4unef6wnuw@mzgrpwwkbaxn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s3p6em2fovzkpyy5lpslxl7nl6ojhoilyqlydidy4unef6wnuw@mzgrpwwkbaxn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_030721_118631_C1D66044 
X-CRM114-Status: GOOD (  19.56  )
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

On Mon, Sep 07, 2026 at 02:58:41PM +0100, Wei-Lin Chang wrote:
> On Mon, Aug 03, 2026 at 11:08:46AM +0100, Vincent Donnefort wrote:
> 
> [...]
> 
> >  static void stage2_map_prefault_idmap(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_t *ptep)
> >  {
> >  	kvm_pte_t block_pte = ctx->old;
> > +	bool counted, valid;
> >  	u64 pa;
> >  	int i;
> >  
> > -	if (!kvm_pte_valid(block_pte))
> > +	counted = stage2_pte_is_counted(block_pte);
> > +	valid = kvm_pte_valid(block_pte);
> > +
> > +	if (!valid && !counted)
> > +		return;
> > +
> > +	/*
> > +	 * Shared walks not supported: cannot rollback refcounts on break
> > +	 * failure.
> > +	 */
> > +	if (counted && WARN_ON_ONCE(kvm_pgtable_walk_shared(ctx)))
> 
> Doesn't patch 1 also need this shared walk check,

Only the host stage-2 has the IDMAP flag and will run this function.

For the host stage-2, only non valid PTEs and non-RWX PTEs are refcounted.
  * non-valid PTEs are skipped in PATCH 1.
  * non-RWX PTEs are forced PTE-level.

So there's no risk of hitting a refcounted PTE in this function until PATCH 2.

-- 
Vincent

> 
> >  		return;
> >  
> >  	pa = ALIGN_DOWN(ctx->addr, kvm_granule_size(ctx->level));
> >  	for (i = 0; i < PTRS_PER_PTE; ++i, ++ptep, pa += kvm_granule_size(ctx->level + 1)) {
> > -		kvm_pte_t pte = kvm_init_valid_leaf_pte(pa, block_pte, ctx->level + 1);
> > +		kvm_pte_t pte = valid ?
> > +			kvm_init_valid_leaf_pte(pa, block_pte, ctx->level + 1) :
> > +			block_pte;
> >  
> >  		/*
> >  		 * Skip ptes in the range being modified by the caller if we're
> > @@ -1053,8 +1066,11 @@ static void stage2_map_prefault_idmap(const struct kvm_pgtable_visit_ctx *ctx, k
> >  		 * that should happen very infrequently.
> >  		 */
> >  		if ((ctx->level < (KVM_PGTABLE_LAST_LEVEL - 1)) ||
> > -		    (pa < ctx->addr) || (pa >= ctx->end))
> > +		    (pa < ctx->addr) || (pa >= ctx->end)) {
> >  			*ptep = pte;
> > +			if (counted)
> > +				ctx->mm_ops->get_page(ptep);
> 
> and this get_page() ?
> 
> Thanks,
> Wei-Lin Chang
> 
> [...]

