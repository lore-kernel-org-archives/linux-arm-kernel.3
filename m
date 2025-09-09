Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E1FCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBMuUk3RpOsnJ1q6AJziguZ3KBNpJeQWKrHVFwiKIJE=; b=gpIgICDpiWEhhg8d37XQtlso5Q
	1yqSvGJiqVkDz6QWMHCm8g0haOvnYRvvMKEjoxVrzrqBADiMYcTgdB56TWFPMGMHKaJYEcEmvuwsS
	cwkMs/Si1HgkbapOQg0Pp4rJdfprxW8hbvEm5j6u6fMjEDB3v7N5+5x9LgoFRQDRHGiqTXhq1itgS
	8LtHrTBbsqOtcjJNCxtXelr1iHHq99yALGI8UgEpQ3bkSET789p0hXXWhMNSfRwCRXGf838BtOFv/
	A3Bi3Dlv70jouyYmhbCbUU8HPZLyHRzQj3xvfHz2gSHwFstijsDGkShvhLgEMI12cpeFFczQNoSfw
	f9DrZmvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw21U-00000008wx8-1kNj;
	Tue, 09 Sep 2025 17:20:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvz97-00000007g3H-429W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 14:16:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9034943294;
	Tue,  9 Sep 2025 14:16:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C963BC4CEF4;
	Tue,  9 Sep 2025 14:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757427393;
	bh=2l6KZN5Zc9kV5MLkJIQhcmAGY9mNemETDpLwFvQUzWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LLkqCTKJuacndmqViTJT4y49WssfoH6kozYjLZvwCQGsczOTRO59xxXjIa06L7nyl
	 Y+jhH6jCzDmqSpxCK0kZNL788FD2bxf5nhnWFyBA8I29dfOARW35OwBMoWq9QrEyfL
	 EwIz7nKNJxs+RcXRoNfAMvcpwL+k6DnZ5YXK+zDDiqMG1GRuJBoNXQCuL5yXrBWz/C
	 q/jaNfCOhjw7bsHjjt4p/YbSuZic7i7qjPOSoUO7KZ+zM0TEZPDa2c7AoT+CmwdQZm
	 W6x2eaIRuuuXgejOpBCMi8BbNfojSoL/A900rYDM0AejW8AgPoBo2wViMnRUUvZcXd
	 05P9Y3XnwAsag==
Date: Tue, 9 Sep 2025 15:16:26 +0100
From: Will Deacon <will@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 03/28] KVM: arm64: pkvm: Add pkvm_time_get()
Message-ID: <aMA2ugNakqrA1Pg0@willie-the-truck>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-4-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819215156.2494305-4-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_071634_041953_D3A6D19B 
X-CRM114-Status: GOOD (  23.32  )
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

On Tue, Aug 19, 2025 at 09:51:31PM +0000, Mostafa Saleh wrote:
> Add a function to return time in us.
> 
> This can be used from IOMMU drivers while waiting for conditions as
> for SMMUv3 TLB invalidation waiting for sync.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  2 ++
>  arch/arm64/kvm/hyp/nvhe/setup.c        |  4 ++++
>  arch/arm64/kvm/hyp/nvhe/timer-sr.c     | 33 ++++++++++++++++++++++++++
>  3 files changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> index ce31d3b73603..6c19691720cd 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> @@ -87,4 +87,6 @@ bool kvm_handle_pvm_restricted(struct kvm_vcpu *vcpu, u64 *exit_code);
>  void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu);
>  int kvm_check_pvm_sysreg_table(void);
>  
> +int pkvm_timer_init(void);
> +u64 pkvm_time_get(void);
>  #endif /* __ARM64_KVM_NVHE_PKVM_H__ */
> diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
> index a48d3f5a5afb..ee6435473204 100644
> --- a/arch/arm64/kvm/hyp/nvhe/setup.c
> +++ b/arch/arm64/kvm/hyp/nvhe/setup.c
> @@ -304,6 +304,10 @@ void __noreturn __pkvm_init_finalise(void)
>  	};
>  	pkvm_pgtable.mm_ops = &pkvm_pgtable_mm_ops;
>  
> +	ret = pkvm_timer_init();
> +	if (ret)
> +		goto out;
> +
>  	ret = fix_host_ownership();
>  	if (ret)
>  		goto out;
> diff --git a/arch/arm64/kvm/hyp/nvhe/timer-sr.c b/arch/arm64/kvm/hyp/nvhe/timer-sr.c
> index ff176f4ce7de..e166cd5a56b8 100644
> --- a/arch/arm64/kvm/hyp/nvhe/timer-sr.c
> +++ b/arch/arm64/kvm/hyp/nvhe/timer-sr.c
> @@ -11,6 +11,10 @@
>  #include <asm/kvm_hyp.h>
>  #include <asm/kvm_mmu.h>
>  
> +#include <nvhe/pkvm.h>
> +
> +static u32 timer_freq;
> +
>  void __kvm_timer_set_cntvoff(u64 cntvoff)
>  {
>  	write_sysreg(cntvoff, cntvoff_el2);
> @@ -68,3 +72,32 @@ void __timer_enable_traps(struct kvm_vcpu *vcpu)
>  
>  	sysreg_clear_set(cnthctl_el2, clr, set);
>  }
> +
> +static u64 pkvm_ticks_get(void)
> +{
> +	return __arch_counter_get_cntvct();
> +}
> +
> +#define SEC_TO_US 1000000
> +
> +int pkvm_timer_init(void)
> +{
> +	timer_freq = read_sysreg(cntfrq_el0);
> +	/*
> +	 * TODO: The highest privileged level is supposed to initialize this
> +	 * register. But on some systems (which?), this information is only
> +	 * contained in the device-tree, so we'll need to find it out some other
> +	 * way.
> +	 */
> +	if (!timer_freq || timer_freq < SEC_TO_US)
> +		return -ENODEV;
> +	return 0;
> +}

Right, I think the frequency should be provided by the host once the arch
timer driver has probed successfully. Relying on CNTFRQ isn't viable imo.

Will

