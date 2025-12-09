Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A50D3B999
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 21:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVPeiXLP1Q+wMLj4c0/UiziS0RPxjm/bLd9OFvKRd/Y=; b=Wo2ctoqpsHYA98I2zCc+c/0Tqf
	rGitamTROKkCUtme6gSi5RfaxZd1hi9cTx4LXH0YcIiG5+FrCKRLp+VfCZPVWp7mPmOUuQzXYPSqv
	xTxkaXUHF5Tqnu0IJ9tdd3H0gWhBjuJ+d/ukYQ36mQ1V42zl7tiEfF6ax/1JDGkkDy4wSZ4zJOkDq
	tsci6PtqobPLRUErJoNuLdVI/SzUgL/jgc9akMnU5+VyHKV8XZEHBDcKEsMtuvyS7oNGjEg+Ta2uI
	wwD0ZA8bP44AErPNYQEjFliIyGWBEyfCdHXTv7J6n1BPJGVYQ8xbW654DegR3vZniJ92r2pVkByoH
	gwXi92rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT5PA-0000000EpYY-1LGs;
	Tue, 09 Dec 2025 21:37:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT5P8-0000000EpYC-1yh6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 21:37:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CA3BA40A0B;
	Tue,  9 Dec 2025 21:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 639F8C4CEF5;
	Tue,  9 Dec 2025 21:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765316273;
	bh=XR5vtOZeRkf01d/Ct5rjvNJD3R18U5Yi718NBSanjc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fM8UojGjllf3TBTDAJ88lf1uWoTb4CAWsA2qO0WoLsjOJLDUCQcGOdBp6LpWZ/MtE
	 GAptIFSFYRqbNnqlbw8M/rPdHN1t+UuB4x2Chs6yBAwtC1k4Dg0gk1EzWR8NxrUx0o
	 MXEgBFNivOHwxdUn5qe4HXzdwCj0cA85pfrxUdis9PpjwANGpSKxfMv8gfZqbrwtyg
	 ER4ORjxaiZD+PYVjmFy+y6oqBC8mQ2lggjftYiW8UZlIABkPLdRarQD+oZ3NLYb41O
	 hfPKsUZH0c1xPijUuhtcP1hCcxcFwb6UpoRZsOrJIr9Eyi//DtUJkRoR/QZXO275Ke
	 X9f3W4lQVQcBg==
Date: Tue, 9 Dec 2025 13:37:52 -0800
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
Subject: Re: [PATCH v5 16/24] KVM: arm64: Account for partitioning in
 PMCR_EL0 access
Message-ID: <aTiWsAvK9krnEw7V@kernel.org>
References: <20251209205121.1871534-1-coltonlewis@google.com>
 <20251209205121.1871534-17-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209205121.1871534-17-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_133754_531764_C44695EB 
X-CRM114-Status: GOOD (  17.70  )
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

On Tue, Dec 09, 2025 at 08:51:13PM +0000, Colton Lewis wrote:
> Make sure reads and writes to PMCR_EL0 conform to additional
> constraints imposed when the PMU is partitioned.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>  arch/arm64/kvm/pmu.c      | 2 +-
>  arch/arm64/kvm/sys_regs.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
> index 1fd012f8ff4a9..48b39f096fa12 100644
> --- a/arch/arm64/kvm/pmu.c
> +++ b/arch/arm64/kvm/pmu.c
> @@ -877,7 +877,7 @@ u64 kvm_pmu_accessible_counter_mask(struct kvm_vcpu *vcpu)
>  u64 kvm_vcpu_read_pmcr(struct kvm_vcpu *vcpu)
>  {
>  	u64 pmcr = __vcpu_sys_reg(vcpu, PMCR_EL0);
> -	u64 n = vcpu->kvm->arch.nr_pmu_counters;
> +	u64 n = kvm_pmu_guest_num_counters(vcpu);

Why can't the value of vcpu->kvm->arch.nr_pmu_counters be trusted?

> @@ -1360,7 +1360,7 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
>  	 */
>  	if (!kvm_vm_has_ran_once(kvm) &&
>  	    !vcpu_has_nv(vcpu)	      &&
> -	    new_n <= kvm_arm_pmu_get_max_counters(kvm))
> +	    new_n <= kvm_pmu_hpmn(vcpu))
>  		kvm->arch.nr_pmu_counters = new_n;

This is the legacy UAPI for setting the number of PMU counters by
writing to PMCR_EL0.N.

The 'partitioned' implementation should take a dependency on the
SET_NR_COUNTERS attribute and reject attempts to change the value of
PMCR_EL0.N. Just like nested.

Thanks,
Oliver

