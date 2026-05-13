Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A20DCD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 07:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROnDivWnwYFkeb8Z5ptwvScw71M9agFStQ7jRmh5Bew=; b=EPsqKD+2jTRiA8EY8Tg3CheT9+
	jYxioDyhZVenXupZef3L4x7hBoWIna16Vr2+T7S7SZzEZfNpfglx6PjeTCeHGzHBhrsYlN9RMZRi9
	6QqpYUyndWhApvgrXdH+kHm3W6W77VFiKG06SZMqGwEpe5WFQJCmEBAL5Da7IcdChBZPwPbA5ahmf
	cLRjRyzJhS0zcvSAWn0aa1ecc1K7J+RIN5SwZtHT5ZbubLI0PgbjAV5T69QTa3sQ32sWKcrMgBys/
	iJssQakWkvqov7hTsoPVtwZu4hfpEcor+4TYjQkKhYgcwhThAkxhzPSW5D78WxwI1SV58909HIOGN
	BtrqVf9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4TT-00000001exZ-3XWD;
	Wed, 13 May 2026 07:57:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4TR-00000001ewo-1VWQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 07:57:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D51B94438E;
	Wed, 13 May 2026 07:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D17CC2BCC7;
	Wed, 13 May 2026 07:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778659064;
	bh=bR1i92frDxooM1/4hRznpgGK1PwGwO8I8wpOQKsxaig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=orykS+qrrrRNFxk7x/UmKrWLdvYQkQowPXI0p076mIuKFeymoBdbMkuIrhPF7xc1o
	 aVTVCBoGbkyvc48jQn598HmxZ9Ar+o/yssqekrG3bWfzyXG5A5A+Zfcswc7eY/pjMg
	 fT6a2+VyuOvcLb/vM8Hn2wK5zFC4yN2BLQTLNgrE0mXArVrIS3qNlmuAZ7q70TFYxR
	 bDEMt1EpMfDA/37IbfOnPT/dcluEhOvlwGEcl4ZArCPY1PaYqgmnCeAANHks7QtDBv
	 uMAoPxGcaERtzu4+rI623u1q+YlsWgG/fXhqcgzfnXIHC9OXl9EUnAlQfY9oRRp6Dv
	 19/arP+5NHgzw==
Date: Wed, 13 May 2026 00:57:42 -0700
From: Oliver Upton <oupton@kernel.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Alexandru Elisei <alexandru.elisei@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	James Clark <james.clark@linaro.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v7 09/20] KVM: arm64: Set up MDCR_EL2 to handle a
 Partitioned PMU
Message-ID: <agQu9kLnbHjSni-C@kernel.org>
References: <20260504211813.1804997-1-coltonlewis@google.com>
 <20260504211813.1804997-10-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504211813.1804997-10-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_005745_439200_11CEB68C 
X-CRM114-Status: GOOD (  23.27  )
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

On Mon, May 04, 2026 at 09:18:02PM +0000, Colton Lewis wrote:
> diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
> index 3ad6b7c6e4ba7..0ab89c91e19cb 100644
> --- a/arch/arm64/kvm/debug.c
> +++ b/arch/arm64/kvm/debug.c
> @@ -36,20 +36,43 @@ static int cpu_has_spe(u64 dfr0)
>   */
>  static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
>  {
> +	int hpmn = kvm_pmu_hpmn(vcpu);
> +
>  	preempt_disable();
>  
>  	/*
>  	 * This also clears MDCR_EL2_E2PB_MASK and MDCR_EL2_E2TB_MASK
>  	 * to disable guest access to the profiling and trace buffers
>  	 */
> -	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN,
> -					 *host_data_ptr(nr_event_counters));
> +
> +	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN, hpmn);
>  	vcpu->arch.mdcr_el2 |= (MDCR_EL2_TPM |
>  				MDCR_EL2_TPMS |
>  				MDCR_EL2_TTRF |
>  				MDCR_EL2_TPMCR |
>  				MDCR_EL2_TDRA |
> -				MDCR_EL2_TDOSA);
> +				MDCR_EL2_TDOSA |
> +				MDCR_EL2_HPME);
> +
> +	if (kvm_vcpu_pmu_is_partitioned(vcpu)) {
> +		/*
> +		 * Filtering these should be redundant because we trap
> +		 * all the TYPER and FILTR registers anyway and ensure
> +		 * they filter EL2, but set the bits if they are here.
> +		 */
> +		if (is_pmuv3p1(read_pmuver()))
> +			vcpu->arch.mdcr_el2 |= MDCR_EL2_HPMD;
> +		if (is_pmuv3p5(read_pmuver()))
> +			vcpu->arch.mdcr_el2 |= MDCR_EL2_HCCD;

Neither of these controls are of any consequence on unsupported
hardware (RES0). Set them unconditionally?

> +		/*
> +		 * Take out the coarse grain traps if we are using
> +		 * fine grain traps.
> +		 */
> +		if (kvm_vcpu_pmu_use_fgt(vcpu))

I think open coding the check here would actually improve readability.

		if (cpus_have_final_cap(ARM64_HAS_FGT) &&
		    (cpus_have_final_cap(ARM64_HAS_HPMN0) ||
		     vcpu->kvm->arch.nr_pmu_counters != 0))
			vcpu->arch.mdcr_el2 &= ~(MDCR_EL2_TPM | MDCR_EL2_TPMCR);
> +
> +/**
> + * kvm_pmu_hpmn() - Calculate HPMN field value
> + * @vcpu: Pointer to struct kvm_vcpu
> + *
> + * Calculate the appropriate value to set for MDCR_EL2.HPMN. If
> + * partitioned, this is the number of counters set for the guest if
> + * supported, falling back to max_guest_counters if needed. If we are not
> + * partitioned or can't set the implied HPMN value, fall back to the
> + * host value.
> + *
> + * Return: A valid HPMN value
> + */
> +u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
> +{
> +	u8 nr_guest_cntr = vcpu->kvm->arch.nr_pmu_counters;
> +
> +	if (kvm_vcpu_pmu_is_partitioned(vcpu)
> +	    && !vcpu_on_unsupported_cpu(vcpu)
> +	    && (cpus_have_final_cap(ARM64_HAS_HPMN0) || nr_guest_cntr > 0))
> +		return nr_guest_cntr;
> +
> +	return *host_data_ptr(nr_event_counters);
> +}

This helper isn't helpful. Just open code it in the place where we are
computing MDCR_EL2.

> @@ -542,6 +542,13 @@ u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
>  	if (cpus_have_final_cap(ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS))
>  		return 1;
>  
> +	/*
> +	 * If partitioned then we are limited by the max counters in
> +	 * the guest partition.
> +	 */
> +	if (kvm_pmu_is_partitioned(arm_pmu))
> +		return arm_pmu->max_guest_counters;
> +

Ok, this is exactly what I was getting at earlier. What about a VM with
an emulated PMU? It should use cntr_mask calculation, not the guest
range.

Thanks,
Oliver

