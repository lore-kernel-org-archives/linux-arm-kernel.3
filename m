Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CABD637DF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 00:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/wIXJseqEJr+K3I60IbTmraIwgve7KW70MrXB9muAA=; b=ey7VnGEi+C1CTCRvFij5uooX+F
	crXZbzL3dcCIOPL4EK6iHl5lIZ0DIHrLV5O5Y1UgGxhHNE9AZWAUMpRdsEhGabBTR54dGOWq+REu4
	15XBoMgQS72itjRWtGOSvI+w9d6vNn+jzkxbkwQiIUQwsBKM7za6MQ2GInmtp6ZG4Q5RiHkZN/gPJ
	DQZt3fPuXD08sCXvkNsyqCNCPpfzc+6YgQScYNcNYApgJC+S0hgdEXhpU586W/dELl2jBtHLWkZLK
	FqfrEESrl48l6kcd+f45fAYvUfCLdW4BZvTuTw9F3e5KygYpO4caR0N6YMpCFCF5iNBWd+C6YQpke
	7HLkie9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVfr3-000000060Vb-0obe;
	Wed, 17 Dec 2025 00:57:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVfr0-000000060VF-3KKc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 00:57:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E69834338F;
	Wed, 17 Dec 2025 00:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54E8BC4CEF1;
	Wed, 17 Dec 2025 00:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765933041;
	bh=z/6R4VG7TSlEesI3ViMverTeFsRJZ0O4JC2zjpfP2Qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CRrc1Bgy2SxAbkikgt/whkMk/lJo1AAfKhN2dGFMCLOJ3YBkBoz4vh5jprB7HPVhh
	 k3rgpO5yQu48UDdQFC6U+yUh1g1eDYQpMDVqIahRxzZn7W3Dn388xnfFvvvqgeeXQL
	 36Dl/4m5zU/b36HkromCRw+KNtP/7MRpLe6HbO3smygG3aAbShDZLRGUHmRURzge4N
	 LWD/8M0g+HPPzo7ok5wbyTPiBOKp8QrB1kjaaDMjuIlUDSudc9rZU4A39wMrIz2euG
	 Z5oJUkxEKac3d6wMFieFYAsyWkzVWhRTDF+7HeMhA9zuCdByVavMEOp5Q2NnLwK5bH
	 ybv1b3lbSRRnA==
Date: Tue, 16 Dec 2025 16:57:19 -0800
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
Message-ID: <aUH_7yYZsmFlRvEc@kernel.org>
References: <20251209205121.1871534-1-coltonlewis@google.com>
 <20251209205121.1871534-19-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209205121.1871534-19-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_165722_858772_2775DF80 
X-CRM114-Status: GOOD (  15.49  )
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

Re-reading this patch...

On Tue, Dec 09, 2025 at 08:51:15PM +0000, Colton Lewis wrote:
> The KVM API for event filtering says that counters do not count when
> blocked by the event filter. To enforce that, the event filter must be
> rechecked on every load since it might have changed since the last
> time the guest wrote a value.

Just directly state that this is guarding against userspace programming
an unsupported event ID.

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

Iterate the bitmask of counters and you'll handle the cycle counter 'for
free'.

<snip>

> +		val = __vcpu_sys_reg(vcpu, PMEVTYPER0_EL0 + i);
> +		evsel = val & kvm_pmu_event_mask(vcpu->kvm);
> +
> +		if (vcpu->kvm->arch.pmu_filter &&
> +		    !test_bit(evsel, vcpu->kvm->arch.pmu_filter))
> +			val |= evtyper_set;
> +
> +		val &= ~evtyper_clr;
> +		write_pmevtypern(i, val);

</snip>

This all needs to be shared with writethrough_pmevtyper() instead of
open-coding the same thing.

Thanks,
Oliver

