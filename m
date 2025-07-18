Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F9DC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 10:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvcvr0AK6YSE0JbmZUfdczos7CJhlpqAGW0SyiAlvmQ=; b=JAEsxKKq0xgUM6sErCVCpXaDv7
	r0m5kdnIUkCo9/ss7MbaZBfY6OeAC4FxvkvON0lYFRBCQDYimP3uqFFDpH3fgPpDdCoxIniD5yOp/
	D9qc89RBMkrkW4LZZ6KMhFXNDkxdShBr1rITLyMn0YLkjiUQvDzTQHUlxXkNYlaO4IK7PFjqPpO0v
	p0ogA16kiQCThtyWnuu2YN9wM3ejX57BUd8YKrF5gaXhbW35ZeXb/Ns5rhiYHqkng+B2ZaQqKOVeH
	Ete3Eeo58P8YaIndKBI+yC1GTSVaLUosKYweow9yHKW8JhDqniKCtl2n3clYG+C2pMdL/060Xv3zu
	2lep7cuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucihC-0000000CM35-2O8l;
	Fri, 18 Jul 2025 10:52:06 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uciF4-0000000CI57-0oAl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 10:23:03 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4561b43de62so71595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 03:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752834180; x=1753438980; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kvcvr0AK6YSE0JbmZUfdczos7CJhlpqAGW0SyiAlvmQ=;
        b=Ha9MCdo6s3Gg/m66xSHqOtLRRCD1HNLSc41LHTwja2kpbHq36W0DzIZ8NuNQBrup9R
         2Z/OrZ5PgJuYoyzwS7krTIjH5+mWFOBD1PCQ1NQ2aF4d8z3Err/0bPrdfnRKa+w9vSWI
         VkGfeMiB63+YpnVPEhs0aoFFtFcb/7dvSEWmUfVUUgVqQlDtVRLvCFfSoCVt2eio9FwS
         0KILlszsAWzd7dOX0HbDZbou3PEM18+HKueREuhyU/uGu4NK626vkiCZfw+EOa4kjZTw
         YV1zdN23KtoZiBt743OgUZxHyRjGoK0zUhkaImYgXLVF7YlubSGGNAnfZaeKdpLFt8eW
         dmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752834180; x=1753438980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvcvr0AK6YSE0JbmZUfdczos7CJhlpqAGW0SyiAlvmQ=;
        b=kG9I/hIKAQIkkEmI+KQ5ZBEo8CZ7sfNdjRcLFCKuUQb1mZzokq8xuAiFZnRqvcECuP
         LEAM4c8MMwraydFYUeyXGl0hRFkWE3+fmBqtvhEMl0GUscSDNn3VgiXO+WPAlYI+wCHs
         XnpAILbcjwVp3Vz+tTTo3fuu0S+o3MGwfe6zabKHTu+kRCZ7IWWF0SFM5c5JY7iEJKEQ
         kMhSO112BtYG4fq2jhGD7QaDCPH67LM6Frea+SHZ1ivGsg8P7V56nbxqhf32waKi4y6G
         CJid9xYtUQC66U8knGS/kcoXoKZaST3uuPP7MKvoIikJZ+HeC4f7MFSTYLE751DZ3Dhq
         6HWw==
X-Gm-Message-State: AOJu0Yxhm4WfWO/le9a7KU2EDKTN6Jz00MTHr/jiuv7m/Vjxkj2axoVl
	gwbZpA11AcOGncKESDP1KufcxUzQUmmyjr1nEUrocRpj78Vcm9bcFpzptmhoEss8/A==
X-Gm-Gg: ASbGncsNGYYeLvtqXv0ZMtdPJNuaVNhq4aMhLWwMUbnzWC5L0GaUmtFS5xK5xmuG81L
	ICRNJMEj1py+UJgSzZNpJc56vthyaBbeAkZ26reSa6IY7jEg7S5Fa5qIVY0B10VelNJP+k5Ys8K
	zTe27Ra62JfLGjGtvP2I1DaKxuXnQ0csR2cTUThWUbPhT3S0LOVf2FYbpdnoL9SqKpR8MaZ4Cl6
	AlQvBzIccJ/uhqi/IlJmjidQu3lYL2b5AmN2Zo+qnSE6q8JFBz68amzeMb71EGsB5BJU2dTtoRC
	SA36oFjz5hx0BOT7IVVQEQAagomSuaCu/XzarqrVlyxHGMva1V25ZM4sPfG12mQ63rdIikyBghi
	3lhgFYH2FYt82P4WSqllmV6v2ZfzGVjSrYi/i5EaZfZe+3fI39cwDynZXM7r+rJL1p/mD
X-Google-Smtp-Source: AGHT+IEXgWSB+NQ1xhdND89MDLioany2VPotHUOmf388VpQypRg114G/u7aLbJeTYE+lqaAILAgn1Q==
X-Received: by 2002:a05:600c:1c11:b0:450:ceac:62cf with SMTP id 5b1f17b1804b1-4563a79cddbmr1480885e9.5.1752834179584;
        Fri, 18 Jul 2025 03:22:59 -0700 (PDT)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48991sm1423585f8f.44.2025.07.18.03.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 03:22:59 -0700 (PDT)
Date: Fri, 18 Jul 2025 10:22:55 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, qperret@google.com,
	keirf@google.com
Subject: Re: [PATCH 2/2] KVM: arm64: Map hyp text as RO and dump instr on
 panic
Message-ID: <aHogf50CvjeSklRo@google.com>
References: <20250717234744.2254371-1-smostafa@google.com>
 <20250717234744.2254371-3-smostafa@google.com>
 <38b08607-b9d9-425b-81c4-b227dda427b3@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38b08607-b9d9-425b-81c4-b227dda427b3@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_032302_232244_0B1CEBFE 
X-CRM114-Status: GOOD (  31.94  )
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

Hi Ben,

On Fri, Jul 18, 2025 at 11:16:18AM +0100, Ben Horgan wrote:
> Hi Mostafa,
> 
> On 18/07/2025 00:47, Mostafa Saleh wrote:
> > Map the hyp text section as RO, there are no secrets there
> > and that allows the kernel extract info for debugging.
> > 
> > As in case of panic we can now dump the faulting instructions
> > similar to the kernel.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >   arch/arm64/kvm/handle_exit.c    |  4 +---
> >   arch/arm64/kvm/hyp/nvhe/setup.c | 12 ++++++++++--
> >   2 files changed, 11 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
> > index de12b4d4bccd..d59f33c40767 100644
> > --- a/arch/arm64/kvm/handle_exit.c
> > +++ b/arch/arm64/kvm/handle_exit.c
> > @@ -566,9 +566,7 @@ void __noreturn __cold nvhe_hyp_panic_handler(u64 esr, u64 spsr,
> >   	kvm_nvhe_dump_backtrace(hyp_offset);
> >   	/* Dump the faulting instruction */
> > -	if (!is_protected_kvm_enabled() ||
> > -	    IS_ENABLED(CONFIG_NVHE_EL2_DEBUG))
> > -		dump_instr(panic_addr + kaslr_offset());
> > +	dump_instr(panic_addr + kaslr_offset());
> This makes the dumping in nvhe no longer conditional on
> CONFIG_NVHE_EL2_DEBUG. A change from what you introduced in the patch.
> Perhaps it makes sense to reorder the patches; do the preparatory work for
> instruction dumping before the enabling.>

Yes, I thought about squashing both patches, but I was worried this patch
might be more controversial, so I split the code into 2 patches, where the
first one can be merged separately if needed. But no strong opinion.

Thanks,
Mostafa

> >   	/*
> >   	 * Hyp has panicked and we're going to handle that by panicking the
> > diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
> > index a48d3f5a5afb..90bd014e952f 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/setup.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/setup.c
> > @@ -192,6 +192,7 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
> >   	enum pkvm_page_state state;
> >   	struct hyp_page *page;
> >   	phys_addr_t phys;
> > +	enum kvm_pgtable_prot prot;
> >   	if (!kvm_pte_valid(ctx->old))
> >   		return 0;
> > @@ -210,11 +211,18 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
> >   	 * configured in the hypervisor stage-1, and make sure to propagate them
> >   	 * to the hyp_vmemmap state.
> >   	 */
> > -	state = pkvm_getstate(kvm_pgtable_hyp_pte_prot(ctx->old));
> > +	prot = kvm_pgtable_hyp_pte_prot(ctx->old);
> > +	state = pkvm_getstate(prot);
> >   	switch (state) {
> >   	case PKVM_PAGE_OWNED:
> >   		set_hyp_state(page, PKVM_PAGE_OWNED);
> > -		return host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HYP);
> > +		/* hyp text is RO in the host stage-2 to be inspected on panic. */
> > +		if (prot == PAGE_HYP_EXEC) {
> > +			set_host_state(page, PKVM_NOPAGE);
> > +			return host_stage2_idmap_locked(phys, PAGE_SIZE, KVM_PGTABLE_PROT_R);
> > +		} else {
> > +			return host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HYP);
> > +		}
> >   	case PKVM_PAGE_SHARED_OWNED:
> >   		set_hyp_state(page, PKVM_PAGE_SHARED_OWNED);
> >   		set_host_state(page, PKVM_PAGE_SHARED_BORROWED);
> -- 
> Thanks,
> 
> Ben
> 

