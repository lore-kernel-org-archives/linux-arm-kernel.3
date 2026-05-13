Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120A0CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 07:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFOzrYaW++AmTHyOncKUNG2vqhFQ0/GWfCseoe5OOkk=; b=PNBbxb9ymEFmSy1Ggl0rMmm0+v
	BTy+ygtdZQPdIMxhkqOqvzotE23SMvNb5TtlCneH6kJ23KPkWItU5jVaKMXBlRtyY/ZDk1bBOPkE4
	3HKZtfu2zoac4xVsSEJfEBC2C1f0KxnPKhvuSPwirCSpUtsiiyLCuEmhV8y6GQaquEuwDnR9+XlYL
	IIf6DiL0UAXrzRPmPgSg4FUL2+h88pxYNQY8VRnmLYx5T4kGgnLUh+19T9rNTyX7rLCGbTpTFLzIU
	vNYiAMolvXqtjNWJ4WQjGhkKWudvp0JW7JnZ9VZIOt2gD82sJ9KI8xvJe/WnOjknt+ypTQ+GoDzr+
	DSbWZduQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN46d-00000001aG6-2TCb;
	Wed, 13 May 2026 07:34:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN46c-00000001aFf-0sqP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 07:34:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DEAD60120;
	Wed, 13 May 2026 07:34:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB0AC2BCB7;
	Wed, 13 May 2026 07:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778657648;
	bh=i70caX1Yr5xAdjGQu0SXobJw2EJJdoR0JSUg6QLPi5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XmwXSoztVYi0JmtDTF/XDCIcWyHqle3fQy8GbLdpa7GwP7KTGVNBfb3T8L+pqoKdT
	 Jseo6mKI2e0vaGaMiw01h9ZdhNcgpKbB+2yFWnBnMlZ9mgujkMCkgSVrggkSTMZGrQ
	 ZpHTMWWa607c+IJAEvbirha6JAHVkIiSf10SoJ77c60Nw/AUFI8MkXdDKZ5Epx4uLJ
	 +ng7sEf14h+pQUidmmgiVXyql3Nqi1xKaPOSqIwRjpWnR7MUA0RwSG2BPMtlmGLeD/
	 sYZlKWzHE78JsgTUbxsz5yYPlOhD38S6iZlh480kqGJ8XKNBrw4DWHJlH2KDeQ/Sre
	 Tksnt5laoe59g==
Date: Wed, 13 May 2026 00:34:06 -0700
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
Subject: Re: [PATCH v7 07/20] KVM: arm64: Set up FGT for Partitioned PMU
Message-ID: <agQpbiD8Fi6fzomf@kernel.org>
References: <20260504211813.1804997-1-coltonlewis@google.com>
 <20260504211813.1804997-8-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504211813.1804997-8-coltonlewis@google.com>
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

On Mon, May 04, 2026 at 09:18:00PM +0000, Colton Lewis wrote:
> +static void __compute_hdfgrtr(struct kvm_vcpu *vcpu)
> +{
> +	__compute_fgt(vcpu, HDFGRTR_EL2);
> +
> +	*vcpu_fgt(vcpu, HDFGRTR_EL2) |=
> +		HDFGRTR_EL2_PMOVS
> +		| HDFGRTR_EL2_PMCCFILTR_EL0
> +		| HDFGRTR_EL2_PMEVTYPERn_EL0
> +		| HDFGRTR_EL2_PMCEIDn_EL0
> +		| HDFGRTR_EL2_PMMIR_EL1;
> +}
> +

I've given this feedback at least twice already...

Operators go on the preceding line in the case of line continuations.

> +
> +/**
> + * kvm_pmu_is_partitioned() - Determine if given PMU is partitioned
> + * @pmu: Pointer to arm_pmu struct
> + *
> + * Determine if given PMU is partitioned by looking at hpmn field. The
> + * PMU is partitioned if this field is less than the number of
> + * counters in the system.
> + *
> + * Return: True if the PMU is partitioned, false otherwise
> + */
> +bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
> +{
> +	if (!pmu)
> +		return false;
> +
> +	return pmu->max_guest_counters >= 0 &&
> +		pmu->max_guest_counters <= *host_data_ptr(nr_event_counters);
> +}
> +
> +/**
> + * kvm_vcpu_pmu_is_partitioned() - Determine if given VCPU has a partitioned PMU
> + * @vcpu: Pointer to kvm_vcpu struct
> + *
> + * Determine if given VCPU has a partitioned PMU by extracting that
> + * field and passing it to :c:func:`kvm_pmu_is_partitioned`
> + *
> + * Return: True if the VCPU PMU is partitioned, false otherwise
> + */
> +bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
> +{
> +	return kvm_pmu_is_partitioned(vcpu->kvm->arch.arm_pmu) &&
> +		false;
> +}

Ok, I'm thoroughly confused about these predicates.

Whether or not a vCPU is using a partitioned PMU is a per-VM property.
This is separate from whether or not the backing arm_pmu has a range of
available counters for the guest to use.

It is entirely possible that a VM *isn't* using the partitioned PMU
feature (i.e. backed with perf events) yet the supporting arm_pmu has a
guest counter range.

 
> +#if !defined(__KVM_NVHE_HYPERVISOR__)
> +bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu);
> +bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu);
> +#else
> +static inline bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
> +{
> +	return false;
> +}
> +
> +static inline bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu)
> +{
> +	return false;
> +}
> +#endif
> +

Don't use ifdeffery for this. Aim to have a single definition and rely
on has_vhe() to do the rest of the work.
 
Thanks,
Oliver

