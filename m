Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E24D3B9A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 22:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtSM3qOVQ2E2kl6/BnRehBv24IpY5ZfwPWoP4cP/Uh0=; b=pJGYsKHSmlRyTZb2bEVLgs3INf
	VkCW+YUVXantHO2pbCxrjDl662WAyQY5iAebTkryJrr0qpSca0k8m7ISucjXVCkBL0HdFfA7qk2VZ
	/Y4ORkjRIGxvxFoxtVsELLVq6G2PTlC5oToQEZS3jtBg1XZMii8+R8sg2ZCDp3+WBvP3Modj/qDMW
	dGPTAjUdG1k4avVngnMmhJquoPaft5ggsp95d30sarANjafCL2VwD1hDsL77W23TCYjrVdVuMIOP9
	NwaXMBLi19NKgdJt+kFj6fVcN/88DDaaQzIidEZIEZqs8j+ln9e/bJnHPw6v224AUE5a8Ge0NxqoF
	SZeLGf2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT5lM-0000000EqR3-2832;
	Tue, 09 Dec 2025 22:00:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT5lJ-0000000EqQE-2nIO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 22:00:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF94543695;
	Tue,  9 Dec 2025 22:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2D3C4CEF5;
	Tue,  9 Dec 2025 22:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765317648;
	bh=najPzs8LYqpcbLVewNTZ9DCSClDe9lHdNLzwaQhA54E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CE/ZjdtPRs9rqbGD+S9DbYpCi/RdsPfmWXx3GEwbjcr3jPddlTbo5HemszHqS9FMB
	 /URO/MU+8Q5yPEF5fjERYGyEw9CZD2IGY9hTC/5h+M4BEa7g6nfj8xbwgpMci9tHAF
	 a9VI/96XXwggpqtURd08bniSHXarcxoOJYhEm7a8zmM1XcGG73UcC/tlHDNsJARxgx
	 rsISbY/jH4SU6DcLCv0UgeCIFL3rcoTcv7Y1/BfxguWNtGlfktTUA/EDJ/EUdL+X+x
	 2Gu/M9cvBDnsZTq2zj4jKn7+/w0hi4Uh+BxrtbJ1kAh3vGdtBe7ENgC28Ph4+2ZYRe
	 KRcOy74UxjoUg==
Date: Tue, 9 Dec 2025 14:00:47 -0800
From: Oliver Upton <oupton@kernel.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
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
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 18/24] KVM: arm64: Enforce PMU event filter at
 vcpu_load()
Message-ID: <aTicD5hlKhZ3rkIn@kernel.org>
References: <20251209205121.1871534-1-coltonlewis@google.com>
 <20251209205121.1871534-19-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209205121.1871534-19-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_140049_746489_804573DA 
X-CRM114-Status: GOOD (  24.61  )
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

On Tue, Dec 09, 2025 at 08:51:15PM +0000, Colton Lewis wrote:
> The KVM API for event filtering says that counters do not count when
> blocked by the event filter. To enforce that, the event filter must be
> rechecked on every load since it might have changed since the last
> time the guest wrote a value. If the event is filtered, exclude
> counting at all exception levels before writing the hardware.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>  arch/arm64/kvm/pmu-direct.c | 44 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
> index 71977d24f489a..8d0d6d1a0d851 100644
> --- a/arch/arm64/kvm/pmu-direct.c
> +++ b/arch/arm64/kvm/pmu-direct.c
> @@ -221,6 +221,49 @@ u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
>  	return nr_host_cnt_max;
>  }
>  
> +/**
> + * kvm_pmu_apply_event_filter()
> + * @vcpu: Pointer to vcpu struct
> + *
> + * To uphold the guarantee of the KVM PMU event filter, we must ensure
> + * no counter counts if the event is filtered. Accomplish this by
> + * filtering all exception levels if the event is filtered.
> + */
> +static void kvm_pmu_apply_event_filter(struct kvm_vcpu *vcpu)
> +{
> +	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
> +	u64 evtyper_set = ARMV8_PMU_EXCLUDE_EL0 |
> +		ARMV8_PMU_EXCLUDE_EL1;
> +	u64 evtyper_clr = ARMV8_PMU_INCLUDE_EL2;
> +	u8 i;
> +	u64 val;
> +	u64 evsel;
> +
> +	if (!pmu)
> +		return;
> +
> +	for (i = 0; i < pmu->hpmn_max; i++) {
> +		val = __vcpu_sys_reg(vcpu, PMEVTYPER0_EL0 + i);
> +		evsel = val & kvm_pmu_event_mask(vcpu->kvm);
> +
> +		if (vcpu->kvm->arch.pmu_filter &&
> +		    !test_bit(evsel, vcpu->kvm->arch.pmu_filter))
> +			val |= evtyper_set;
> +
> +		val &= ~evtyper_clr;
> +		write_pmevtypern(i, val);
> +	}
> +
> +	val = __vcpu_sys_reg(vcpu, PMCCFILTR_EL0);
> +
> +	if (vcpu->kvm->arch.pmu_filter &&
> +	    !test_bit(ARMV8_PMUV3_PERFCTR_CPU_CYCLES, vcpu->kvm->arch.pmu_filter))
> +		val |= evtyper_set;
> +
> +	val &= ~evtyper_clr;
> +	write_pmccfiltr(val);
> +}

This doesn't work for nested. I agree that the hardware value of
PMEVTYPERn_EL0 needs to be under KVM control, but depending on whether
or not we're in a hyp context the meaning of the EL1 filtering bit
changes. Have a look at kvm_pmu_create_perf_event().

Thanks,
Oliver

