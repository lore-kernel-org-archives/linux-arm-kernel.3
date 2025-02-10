Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C156C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 09:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sx0DR0yeLfWSTZQtAIVc9iV0+XVhDpRSY8kJ+UcbHEg=; b=qSl8P7yU9p8kxcwvnGuedjlTmA
	P2cJMez0sTV5L9bu745od1/PeK6UgI23TSq2BhsesA9JiNIwfy8sA+D2W2C6+XjtnWoKrEN8LenHI
	1P/CvE1U6GLJhZ5zE9Dd95f0U/UEVO/6UEWfsDtLqbtWfenHAJIwFgOXzZE2MoM8dvQ0LXLaAVZAW
	y/RRPLGaWkb2aRq8tGy8VqWIpETHKUDyWcWzK2fb1IuY7UNg8X0rntr/4RT521XRCNBhtGVLMPH4M
	IvAQ0NUPYLuNUrxCQK0zm4XHkTE9M5bL6xnAoKTpgnzEt+75TNHl/9PtK9S/o7crHSeq8VXzxRnbU
	G6jvBBng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQMD-0000000GrsD-0Vcl;
	Mon, 10 Feb 2025 09:45:37 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQKn-0000000GriE-3wSy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 09:44:11 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ab771575040so802379166b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 01:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739180647; x=1739785447; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sx0DR0yeLfWSTZQtAIVc9iV0+XVhDpRSY8kJ+UcbHEg=;
        b=ANXYqsPK7LJ6CIsrE+CLV074t3uRch2f/W3vNChhSIUU3u2bKsORj25D/4kByayjQg
         PMRuNJZ2dihn518YEhgLMYhAVMcelPn7xEo0YP1xCQdkWQ0LXWqCfNHUrQVStzpgz3a7
         UHQOjKMNQzVQdF4JFPAW46s+27XIsghpXcPhDRk0F/23xbiyfxpqX4Orijb52dXBweS4
         U7fZbO29KXYZhMIdC13/7fENBHMXsGyNT5LusbPfJNBqo0LNoDT41uSYl45iGhz2aBdy
         8bcyyExPy+5e98HhgvU7QsggI88dgbS5+2n+eKKmlA0WmAi+KnwQRDdlRGSpKrdTEcWN
         cxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739180647; x=1739785447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sx0DR0yeLfWSTZQtAIVc9iV0+XVhDpRSY8kJ+UcbHEg=;
        b=e2sQNNmatHNK5OVrmjLHpX5QhFkCdCKp0SanfG7SUAZmbH8JT943ytflrNC2MRqI9Q
         CHASpOkYefUP4jCPW2BK4RDs7OEObwEzgugpRvIyNYC+ykkuuppEllD3GO2Qn1V+/eg2
         B3NLUmEZAp+wh+x93Ltjkm4OeR+hgeVxQpuJ00Bt1qvRX1YRH2QUgN5mUsWyIqfpRG94
         r/D+1d3I1lLjVcgv/vPgo8rUV8s4pePw0atZ/BPAnkXI9T3PYK+HiAlBuY/5YLDya4eF
         14NyHbZUA5Uc+CvsjDZquwrU4GCqFemggvT4XQwdHcavRGKD3FBA9xUVHxjCfsYHkb0x
         2PKw==
X-Forwarded-Encrypted: i=1; AJvYcCWmdeqnxs7RVYbql0erFxw7DjRAs3t5/osrgDUA4p4N0jfU940H0GF1B+hfdMB1KNRGEqCgahfBfwMPbnOAozN3@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/6KJiJoOeCDDYgig5Y/skFhLKWvrMdaTm90Y2Mf6d1MzZLWEh
	TxIqk+B/FvRH/DDvlezVgvOWm2jwV5jUXg4wlYBhOkdxdA15zcYKMs2+vvmGzylqdVMp40JVVHC
	7zg==
X-Gm-Gg: ASbGncuN5WvNhE0xhCiz5fDmisXTLWjkyYtQzSs+AOmKUED+JyuTf50RHcwSqf+O2a/
	YEzqm+6KAEcaLKw91Zv0cALG0Y/3CSn0M122S9KH7pvEqpFX9LFYEgNEnEEWS9AsN7IBbw0+q4H
	C1NSsujAnmLbS5gInkPc+aq102l/ozplsiu2OH8M7RK9OM6068T06gTrccHmOlV8SMa4t1gQstq
	hFq+Ky2slncZcck0MtWV1phXg4YcMrRhJIfDQsI+dPhotyLu6Hq52WHKaN8lejMainPckgNs7sz
	FxZKTu5OOqQl+BI4BGpXAlewFXnT50jcq4EXj/LKmkvM58O5JZ7f
X-Google-Smtp-Source: AGHT+IGq4+VDwLnmzyRrx/5Pn45AUXiFF/r1y3uPPxUK12orNdApKFEVnjBeRhkqscbld2aCnNFHCQ==
X-Received: by 2002:a17:906:4fd6:b0:ab6:d4ce:568c with SMTP id a640c23a62f3a-ab789b48b85mr1438191766b.13.1739180647430;
        Mon, 10 Feb 2025 01:44:07 -0800 (PST)
Received: from google.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7be7ac8a9sm206859666b.39.2025.02.10.01.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 01:44:06 -0800 (PST)
Date: Mon, 10 Feb 2025 09:44:02 +0000
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu, Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [kvmarm:fixes 18/18]
 arch/arm64/kvm/hyp/nvhe/mem_protect.c:1086:9: warning: variable 'ret' is
 uninitialized when used here
Message-ID: <Z6nKYtyJO2bNycJw@google.com>
References: <202502100911.8c9DbtKD-lkp@intel.com>
 <868qqetasm.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <868qqetasm.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_014409_977345_7DF80364 
X-CRM114-Status: GOOD (  29.97  )
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

On Monday 10 Feb 2025 at 09:21:29 (+0000), Marc Zyngier wrote:
> On Mon, 10 Feb 2025 01:39:04 +0000,
> kernel test robot <lkp@intel.com> wrote:
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git fixes
> > head:   eabc7aaef7a553b64bf6e631ce04526af6c8d104
> > commit: eabc7aaef7a553b64bf6e631ce04526af6c8d104 [18/18] KVM: arm64: Simplify np-guest hypercalls
> > config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250210/202502100911.8c9DbtKD-lkp@intel.com/config)
> > compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502100911.8c9DbtKD-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202502100911.8c9DbtKD-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> arch/arm64/kvm/hyp/nvhe/mem_protect.c:1086:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
> >     1086 |         return ret;
> >          |                ^~~
> >    arch/arm64/kvm/hyp/nvhe/mem_protect.c:1076:9: note: initialize the variable 'ret' to silence this warning
> >     1076 |         int ret;
> >          |                ^
> >          |                 = 0
> >    1 warning generated.
> 
> Nice catch. I wish the compiler would warn for these by default...

So do I...

> Quentin, are you happy with the following patch that I can stash on
> top of the current set of fixes?

Absolutely, thanks for the patch and sorry the mess!

    Reviewed-by: Quentin Perret <qperret@google.com>

> From 5da62486aeda7d7d11107db8ed4e6421e3a2a364 Mon Sep 17 00:00:00 2001
> From: Marc Zyngier <maz@kernel.org>
> Date: Mon, 10 Feb 2025 09:17:58 +0000
> Subject: [PATCH] KVM: arm64: Fix __pkvm_host_mkyoung_guest() return value
> 
> Don't use an uninitialised stack variable, and just return 0
> on the non-error path.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202502100911.8c9DbtKD-lkp@intel.com/
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 4c2f6a6a2efe1..19c3c631708ce 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -1073,7 +1073,6 @@ int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu)
>  {
>  	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
>  	u64 ipa = hyp_pfn_to_phys(gfn);
> -	int ret;
>  
>  	if (pkvm_hyp_vm_is_protected(vm))
>  		return -EPERM;
> @@ -1083,5 +1082,5 @@ int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu)
>  	kvm_pgtable_stage2_mkyoung(&vm->pgt, ipa, 0);
>  	guest_unlock_component(vm);
>  
> -	return ret;
> +	return 0;
>  }
> -- 
> 2.39.2
> 
> 
> -- 
> Without deviation from the norm, progress is not possible.

