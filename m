Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90731CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 17:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8FrX2hmOlVQ5C5PaQtgWU6a7JBMWQKmFs4RW3KDCcg=; b=bhaqk+ZNbjMBGG9SH9mfTjDmfw
	RxhPU1xchCysO2Im7I9kDByHZP/Xt+p8GBL1dir1OxaUe7HFM7pxbSix1w60jUbwrp/XAXfg2bkdl
	2Em9NfMkv7xkjbito1hdSiJ4DndGamxlAFDvkfkSF2/FBy1NTdvndQvMl9UywENfQIK/z+tIbJoXw
	ZhdAO3U9idKCLoSOEcIjyP2vcbH0EHzOOrk2w5WL536ggGFLWgxlLBZxmGWtJDqjeLYia8RxF6E+5
	DOUq+EO3DQonhNRwhk2pGqxSaGkIu688toQXxqJHBa4ECDFFRNUqqGdsiJNlfRicD/Gl4q20TWRx5
	SdvgEUeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOsU-0000000778C-1Ap6;
	Fri, 08 May 2026 17:20:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOsP-0000000775p-3jPW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 17:20:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F3DC22D7;
	Fri,  8 May 2026 10:20:30 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A1A783F836;
	Fri,  8 May 2026 10:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778260835; bh=VIpaIdq08wjRpBWfnPXJEwTJDQEICZVJcS3hyR9NLpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oZlzpBvM3kB4R3YSBeQz6gKgJmqfggBligCcpTqgEZXTpNWvuOS6tcb8YSZFF1+Fp
	 kWnWUogxR1+d6Lsf9g9rsdrHZqLJNTKjJ1N1dWhsJRabhzYObA4PglPOeM69C9nq/z
	 qCOQcg0gdCUWunQoEjjmnB+fLCkzhxF+ZBpNE7M4=
Date: Fri, 8 May 2026 18:20:27 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v10 15/30] KVM: arm64: Support SME control registers
Message-ID: <af4bWxiOogfPz_dp@J2N7QTR9R3>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-15-43f7683a0fb7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-kvm-arm64-sme-v10-15-43f7683a0fb7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_102038_655591_0BEB3E6F 
X-CRM114-Status: GOOD (  26.40  )
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

On Fri, Mar 06, 2026 at 05:01:07PM +0000, Mark Brown wrote:
> SME is configured by the system registers SMCR_EL1 and SMCR_EL2, add
> definitions and userspace access for them.  These control the SME vector
> length in a manner similar to that for SVE and also have feature enable
> bits for SME2 and FA64.  A subsequent patch will add management of them
> for guests as part of the general floating point context switch, as is
> done for the equivalent SVE registers.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_emulate.h  | 14 ++++++++++++
>  arch/arm64/include/asm/kvm_host.h     |  2 ++
>  arch/arm64/include/asm/vncr_mapping.h |  1 +
>  arch/arm64/kvm/sys_regs.c             | 42 ++++++++++++++++++++++++++++++++++-
>  4 files changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index 5bf3d7e1d92c..7a11dd7d554c 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -89,6 +89,14 @@ static inline void kvm_inject_nested_sve_trap(struct kvm_vcpu *vcpu)
>  	kvm_inject_nested_sync(vcpu, esr);
>  }
>  
> +static inline void kvm_inject_nested_sme_trap(struct kvm_vcpu *vcpu)
> +{
> +	u64 esr = FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SME) |
> +		  ESR_ELx_IL;
> +
> +	kvm_inject_nested_sync(vcpu, esr);
> +}

This implicilty has the SMTC field as 0b000, which is correct for traps
of SMCR_EL{1,2} due to SMEN, but wouldn't be right for other traps (e.g.
traps of ZT0).

If we only use this for traps of SMCR_EL{1,2}, that's ok, but I think
it's worth a comment, and possibly a more specific name. Perhaps
kvm_inject_nested_sme_smen_trap() for now.

[...]

> +static bool access_smcr_el2(struct kvm_vcpu *vcpu,
> +			    struct sys_reg_params *p,
> +			    const struct sys_reg_desc *r)
> +{
> +	unsigned int vq;
> +	u64 smcr;
> +
> +	if (guest_hyp_sme_traps_enabled(vcpu)) {
> +		kvm_inject_nested_sme_trap(vcpu);
> +		return false;
> +	}
> +
> +	if (!p->is_write) {
> +		p->regval = __vcpu_sys_reg(vcpu, SMCR_EL2);
> +		return true;
> +	}
> +
> +	smcr = p->regval & ~SMCR_ELx_RES0;
> +	if (!vcpu_has_fa64(vcpu))
> +		smcr &= ~SMCR_ELx_FA64;
> +	if (!vcpu_has_sme2(vcpu))
> +		smcr &= ~SMCR_ELx_EZT0;
> +
> +	vq = SYS_FIELD_GET(SMCR_ELx, LEN, smcr) + 1;
> +	vq = min(vq, vcpu_sme_max_vq(vcpu));
> +	smcr &= ~SMCR_ELx_LEN_MASK;
> +	smcr |= SYS_FIELD_PREP(SMCR_ELx, LEN, vq - 1);

I'm not sure this sanitization is correct or necessary, and the same
concern applies to ZCR_ELx.LEN.

AFAICT, none of the values for the SMCR_ELx.LEN and ZCR_ELx.LEN fields
are reserved or unallocated. Thus all the bits of those fields should be
stateful, and a read should observe the last value written, regardless
of the effective value of the field.

That means that the following at EL2 or vEL2 shouldn't produce a
warning:
		
	int len_write, len_read;

	for (len_write = 0; len_write < 16; len_write++) {
		write_sysreg_s(len_write, SYS_SMCR_EL2);

		len_read = read_sysreg_s(SYS_SMCR_EL2) & SMCR_ELx_LEN_MASK;
		WARN_ON(len_read != len_write);
	}

Either what we're doing is wrong, or the architcture requires a
clarification to say that values corresponding to unimplmented vector
lengths are reserved.

If those bit are always stateful, the the logic to sanitize the LEN
field shouldn't live here, and that will need to happen when consuming
the effective value.

Mark.

