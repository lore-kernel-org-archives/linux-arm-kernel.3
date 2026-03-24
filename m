Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4632E9A761
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 10:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKbHXwptAaylPyPSr2r0cX4M87RTkTutiI0UCXtAsRA=; b=f5G5zHivyF5ZDU71c8EoVo12gK
	/nkZ1y2EOAhlcd/Lk870ShI6qh/JfFgfiCI5BbnBzuLsgHnD8aL/SmZ2iUnJoDcro9kfy3VzePdki
	qp4TmtbAQg/RHCSmP3IbMsCWETf9Kh8XYYuA//xqWNipJ4p1/JlgyGJG7ZVBAvnSVwn8EdyX/ZS4r
	B6c0GHnuOYpke8fT3CSqzkImw0OHlCqSd0+mHrZJKwCdrUIFGqIpwhA4S8Tjnfp0123mvJSUbqA6q
	ws0S0Z5iTr05nwUCknM2vh4GqaaJode/XBRk6FNDbIwqS7inXjGcVpATWSrAqrEKdp5RiSoJTMPbI
	UgywZ9dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4zHh-00000001EK7-2yyi;
	Tue, 24 Mar 2026 10:46:53 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4zHf-00000001EJ4-17Uc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 10:46:52 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-486fb112c09so33955575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 03:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774349209; x=1774954009; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BKbHXwptAaylPyPSr2r0cX4M87RTkTutiI0UCXtAsRA=;
        b=Gl35jQ0FZKgdkW5BPdtnnurynCrmrlsZrBNBtggvf8C8/5J8vjTPW0CtoPyFj9Ab1u
         7AkKdClQsKyfOWyvRV6jGHE2okT80xa/6DfezKyUi+U83I0uLHaO709X5lW2IuGR5HMC
         bpNRct/N96e66hwcxALehZRrS9cSMik+R0zAH+Eq24gvi3Z9ZhEQ4rdC3fHP7Cr46+vE
         xn6FOJH2s7YcsmxiYVgJ6QjqkZBixC6OveOnFI4E7G5bmgLISpGnNe10afAUaHbhOA8K
         EZ/Y87gcpIw7jCBHnpVCcxbcg6OuRF/9LszPls1teyZ6gHBTiseEmTW6/DfBLN/eEldg
         GKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349209; x=1774954009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKbHXwptAaylPyPSr2r0cX4M87RTkTutiI0UCXtAsRA=;
        b=Wx4Zk8nE1gjlwi6dmzGD1+w1blfNE6siqXHlQEs0Dbo91eKxj9Q8DJG3PqlN+H7XSt
         Ot/efn57tJVehwBks8CR8aIRSqGa6XRYI6VNU3T8B8oxOKM3DMAN5CbKBmNRgBX5LfGA
         ACSpRYr3AX5PQgNB3lEIJfKxm4/IL0vOdwLYeC7Wx+0Zjf8Dn65z1eQ5dG3g93t/dVD5
         BbBirxf3TO6B3xrPQ/rqP7tthaW4T0UPRK3a8p+7ZPMFsMxVl9K/soAU3TWkeyGYqXAg
         jzxb5uL6//7o4JOKVNywytK/V2w2J8X/8oUrHsR5MZLK87NuwKtVeOSQn3dkLd6RSJqh
         Mzqg==
X-Forwarded-Encrypted: i=1; AJvYcCXwKnssucMM5KMl/2Ff3B3xGJ4dmPZn3llvU1CkhKhAjAsnPNeXpqg8IhS6hRrIaVy2ZcdrGndPc0LlrL0SrkZi@lists.infradead.org
X-Gm-Message-State: AOJu0YyrwTT7M/dWLJ3C8sfpc4hyLxhLq4pfu6TEupig6P3Gy0xJ/h3c
	TgIsLUqcjmK50NNboFcazvDv2++7NNVqCFmVe9G6SfDB/Fso6z1rMm1pyS2jmaq5yA==
X-Gm-Gg: ATEYQzznBuiU6YRVJY3MMWtlOt6BBv0AKUIxY9yRuQaAMFToH446egG43kwKzwe8k3f
	CfWBZt/7xlqBSPd6CmYMreYDX7a5cmzOvw2AAA/pzJHrTGhfYkOePYuOHuTNjT5Kn7W4LBHwRHI
	UMrVV4XEE3srXqaSk20o9WRMCzHMpEk8DyyyTpmqyVDJ4LFhPnILB4EZ1jahbbohRAdRaxJB9qi
	jNCRkYpeXqkfqbQz8OoJiP2/b06tUKD7aKhjOzY4AYk8e1Enjh+xIgeY9SycKTFUxRX8F1JiJ0m
	JmYrF+lqmUOKBj7ZApHK9ee4cC4Q84DQFjWCStngIl/njuypotZOdviEOC3dzldIIaCbdThAfMu
	Ta2mOuYUojugaO2FyOHMB8jQ3aRyAtftlM5EHSMRmJ6WhE0PhLd8wwtp4VUqqJIJoXeQt2IyUZE
	mZobbR5BXGhDa5zNI66Bx8QITfgVAOROTlniuYwIRJkUQ6QKxtlPexGMpjU6np2aqb8TY=
X-Received: by 2002:a05:600c:698e:b0:486:f4d2:eac6 with SMTP id 5b1f17b1804b1-486fedd80c9mr200145585e9.13.1774349208987;
        Tue, 24 Mar 2026 03:46:48 -0700 (PDT)
Received: from google.com (198.115.140.34.bc.googleusercontent.com. [34.140.115.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116c0c13sm81982145e9.7.2026.03.24.03.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 03:46:48 -0700 (PDT)
Date: Tue, 24 Mar 2026 10:46:45 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: alexandru.elisei@arm.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, catalin.marinas@arm.com,
	dbrazdil@google.com, joey.gouly@arm.com, kees@kernel.org,
	mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org,
	perlarsen@google.com, qperret@google.com, rananta@google.com,
	smostafa@google.com, suzuki.poulose@arm.com, tabba@google.com,
	tglx@kernel.org, bgrzesik@google.com, will@kernel.org,
	yuzenghui@huawei.com
Subject: Re: [PATCH 02/14] KVM: arm64: Track host-unmapped MMIO regions in a
 static array
Message-ID: <acJrldyUBXgbvWw4@google.com>
References: <20260310124933.830025-1-sebastianene@google.com>
 <20260310124933.830025-3-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310124933.830025-3-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_034651_339677_405A07A5 
X-CRM114-Status: GOOD (  24.49  )
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

On Tue, Mar 10, 2026 at 12:49:21PM +0000, Sebastian Ene wrote:
> Introduce a registry to track protected MMIO regions that are unmapped
> from the host stage-2 page tables. These regions are stored in a
> fixed-size array and their ownership is donated to the hypervisor during
> initialization to ensure host-exclusion and persistent tracking.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  arch/arm64/include/asm/kvm_pkvm.h     | 10 ++++++++++
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c |  3 +++
>  arch/arm64/kvm/hyp/nvhe/setup.c       | 25 +++++++++++++++++++++++++
>  3 files changed, 38 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> index 757076ad4ec9..48ec7d519399 100644
> --- a/arch/arm64/include/asm/kvm_pkvm.h
> +++ b/arch/arm64/include/asm/kvm_pkvm.h
> @@ -17,6 +17,16 @@
>  
>  #define HYP_MEMBLOCK_REGIONS 128
>  
> +#define PKVM_PROTECTED_REGS_NUM	8
> +
> +struct pkvm_protected_reg {
> +	u64 start_pfn; 
> +	size_t num_pages; 

nit: "u64 pfn, u64 nr_pages" to align with everywhere else.

> +};
> +
> +extern struct pkvm_protected_reg kvm_nvhe_sym(pkvm_protected_regs)[];
> +extern unsigned int kvm_nvhe_sym(num_protected_reg);
> +
>  int pkvm_init_host_vm(struct kvm *kvm);
>  int pkvm_create_hyp_vm(struct kvm *kvm);
>  bool pkvm_hyp_vm_is_created(struct kvm *kvm);
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 0808367c52e5..7c125836b533 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -23,6 +23,9 @@
>  
>  struct host_mmu host_mmu;
>  
> +struct pkvm_protected_reg pkvm_protected_regs[PKVM_PROTECTED_REGS_NUM];
> +unsigned int num_protected_reg;
> +
>  static struct hyp_pool host_s2_pool;
>  
>  static DEFINE_PER_CPU(struct pkvm_hyp_vm *, __current_vm);
> diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
> index 90bd014e952f..ad5b96085e1b 100644
> --- a/arch/arm64/kvm/hyp/nvhe/setup.c
> +++ b/arch/arm64/kvm/hyp/nvhe/setup.c
> @@ -284,6 +284,27 @@ static int fix_hyp_pgtable_refcnt(void)
>  				&walker);
>  }
>  
> +static int unmap_protected_regions(void)
> +{
> +	struct pkvm_protected_reg *reg;
> +	int i, ret, j = 0;
> +
> +	for (i = 0; i < num_protected_reg; i++) {
> +		reg = &pkvm_protected_regs[i];
> +		for (j = 0; j < reg->num_pages; j++) {
> +			ret = __pkvm_host_donate_hyp_mmio(reg->start_pfn + j);

If this is to make this static at boot, we don't even need __pkvm_host_donate_hyp_mmio()

We can just map the region early enough in the hypervisor pkvm_create_mappings()
in recreate_hyp_mappings() and then let fix_host_ownership() do the host
stage2 unmapping.

> +			if (ret)
> +				goto err_setup;
> +		}
> +	}
> +
> +	return 0;
> +err_setup:
> +	for (j = j - 1; j >= 0; j--)
> +		__pkvm_hyp_donate_host_mmio(reg->start_pfn + j);
> +	return ret;
> +}
> +
>  void __noreturn __pkvm_init_finalise(void)
>  {
>  	struct kvm_cpu_context *host_ctxt = host_data_ptr(host_ctxt);
> @@ -324,6 +345,10 @@ void __noreturn __pkvm_init_finalise(void)
>  	if (ret)
>  		goto out;
>  
> +	ret = unmap_protected_regions();
> +	if (ret)
> +		goto out;
> +
>  	ret = hyp_ffa_init(ffa_proxy_pages);
>  	if (ret)
>  		goto out;
> -- 
> 2.53.0.473.g4a7958ca14-goog
> 

