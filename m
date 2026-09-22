Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B58C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 06:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNn+S45uuHSM1MevwqL8L/OLU6cXbDvK1jrtFFoJQRo=; b=Y8DzoSz+JGI+w5n1yFkdFJCWzE
	hIQJTniUZT7volirZWxnUT+O1+3clBYMt/eZ4crY2CoLD4K3QRhTv++w15Le3i+mF18sOuF1f9Nkk
	FmaEVLXx0nLYYXTs4SfUMi2uZPABO/BNiL1L42opFepHYEVl6dknnwArZS/8F3dQG4XQT1DpOTZa0
	BaYHtNYW9VlmP0zod+MvyfQimH2mwnO1+jjoXCnCY5poNk5TkUdben7XyX0YZ9MYwsHS3VYguW7i8
	+b607lD3sZFHutxVEbw8MMaLDw94UlekFuGMnOJjPxYKBRiQDxIUNM1xV/zOS+gsc6AzReexjS3Kt
	0CW65CYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uDp-00000004MPU-1vmx;
	Tue, 22 Sep 2026 06:43:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uDo-00000004MPD-4C1g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 06:43:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 17991600CB;
	Tue, 22 Sep 2026 06:43:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 537431F000FF;
	Tue, 22 Sep 2026 06:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790059399;
	bh=ZNn+S45uuHSM1MevwqL8L/OLU6cXbDvK1jrtFFoJQRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MdX9Ya7V1NXVARco19qfnbcVEbNm56zISiZkNG3b9akDoeSs0/EYgTd7QCnlnaoa6
	 j2PV5pmtakJaak1Co1gKLHuRiQlcvuwsQVoRCQbgks6IvTtVgn5Ypxr4Iu5PrPl4IA
	 Yf1e8Snkoq3cpLt6pTMAUx7tdUM6zilk6a/UUJ2ClgIao2M5/Wb7me08izuBgK/1Ar
	 kwpLRIdauWOmK9foRBd5P1ZbFjUQcVNcqytK16X+JIl4Pf6Xkg75w+lZFanHIgdaFK
	 +kL6xFN42h9oNj9HCgbS9x9NuXH6tolh7CmaQg6Vd8tWkKZB02d1OZutpNm+t8BUfG
	 ITmBh1WGyx0Kw==
Date: Mon, 21 Sep 2026 23:43:18 -0700
From: Oliver Upton <oupton@kernel.org>
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,
	Sean Christopherson <seanjc@google.com>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 08/21] Revert "KVM: arm64: PMU: Reload when resetting"
Message-ID: <arIjhlqqzt4AKTOr@kernel.org>
References: <20260920-hybrid-v11-0-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
 <20260920-hybrid-v11-8-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920-hybrid-v11-8-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
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

Hi Akihiko,

On Sun, Sep 20, 2026 at 08:15:49PM +0900, Akihiko Odaki wrote:
> This reverts commit fe53538069bb4f625bc8734103ba044a83138fea.
> 
> Restore PMU event teardown before system-register reset so existing
> perf events cannot retain configuration from the previous run. All
> counters are disabled by the reset PMCR_EL0 and MDCR_EL2 values, so
> reset does not need to request a PMU reload.

Sorry, I'm not following the intent here. KVM_REQ_RELOAD_PMU should
already be discarding + recomputing perf events based on the state of
the vPMU. What's the problem?

Thanks,
Oliver

> Assisted-by: Codex:gpt-6-astra
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> ---
>  arch/arm64/kvm/pmu-emul.c | 14 ++++++++++++++
>  arch/arm64/kvm/reset.c    |  3 +++
>  arch/arm64/kvm/sys_regs.c |  3 ---
>  include/kvm/arm_pmu.h     |  2 ++
>  4 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> index a5ccb6ae44d5..14fcdbdb4587 100644
> --- a/arch/arm64/kvm/pmu-emul.c
> +++ b/arch/arm64/kvm/pmu-emul.c
> @@ -258,6 +258,20 @@ void kvm_pmu_vcpu_init(struct kvm_vcpu *vcpu)
>  		pmu->pmc[i].idx = i;
>  }
>  
> +/**
> + * kvm_pmu_vcpu_reset - reset pmu state for cpu
> + * @vcpu: The vcpu pointer
> + *
> + */
> +void kvm_pmu_vcpu_reset(struct kvm_vcpu *vcpu)
> +{
> +	unsigned long mask = kvm_pmu_implemented_counter_mask(vcpu);
> +	int i;
> +
> +	for_each_set_bit(i, &mask, 32)
> +		kvm_pmu_stop_counter(kvm_vcpu_idx_to_pmc(vcpu, i));
> +}
> +
>  /**
>   * kvm_pmu_vcpu_destroy - free perf event of PMU for cpu
>   * @vcpu: The vcpu pointer
> diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
> index 10eb7249aa9e..adcb460a5287 100644
> --- a/arch/arm64/kvm/reset.c
> +++ b/arch/arm64/kvm/reset.c
> @@ -185,6 +185,9 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
>  	vcpu->arch.reset_state.reset = false;
>  	spin_unlock(&vcpu->arch.mp_state_lock);
>  
> +	/* Reset PMU outside of the non-preemptible section */
> +	kvm_pmu_vcpu_reset(vcpu);
> +
>  	preempt_disable();
>  	loaded = (vcpu->cpu != -1);
>  	if (loaded)
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 1481dd5c99a8..75624725adf1 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -5388,9 +5388,6 @@ void kvm_reset_sys_regs(struct kvm_vcpu *vcpu)
>  	}
>  
>  	set_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags);
> -
> -	if (kvm_vcpu_has_pmu(vcpu))
> -		kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
>  }
>  
>  /**
> diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
> index 6b4a118d17ca..51f5e4ca3326 100644
> --- a/include/kvm/arm_pmu.h
> +++ b/include/kvm/arm_pmu.h
> @@ -48,6 +48,7 @@ u64 kvm_pmu_implemented_counter_mask(struct kvm_vcpu *vcpu);
>  u64 kvm_pmu_accessible_counter_mask(struct kvm_vcpu *vcpu);
>  u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1);
>  void kvm_pmu_vcpu_init(struct kvm_vcpu *vcpu);
> +void kvm_pmu_vcpu_reset(struct kvm_vcpu *vcpu);
>  void kvm_pmu_vcpu_destroy(struct kvm_vcpu *vcpu);
>  void kvm_pmu_reprogram_counter_mask(struct kvm_vcpu *vcpu, u64 val);
>  void kvm_pmu_flush_hwstate(struct kvm_vcpu *vcpu);
> @@ -125,6 +126,7 @@ static inline u64 kvm_pmu_accessible_counter_mask(struct kvm_vcpu *vcpu)
>  	return 0;
>  }
>  static inline void kvm_pmu_vcpu_init(struct kvm_vcpu *vcpu) {}
> +static inline void kvm_pmu_vcpu_reset(struct kvm_vcpu *vcpu) {}
>  static inline void kvm_pmu_vcpu_destroy(struct kvm_vcpu *vcpu) {}
>  static inline void kvm_pmu_reprogram_counter_mask(struct kvm_vcpu *vcpu, u64 val) {}
>  static inline void kvm_pmu_flush_hwstate(struct kvm_vcpu *vcpu) {}
> 
> -- 
> 2.55.0
> 

