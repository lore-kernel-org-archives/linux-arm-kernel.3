Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184A1D1F9B6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 10:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUUFo/JYtPLxPWo8yYGptUVKrq8OoUEPbA2NQAD4prI=; b=cNr96mzX0bOwTdiNbboGbnxomp
	VrGHZQ5w4QQbF/jGCAHWtj8cOF1oC5P4w7g5IdBl72aUQQNrY/pn77jVdfL/n+iR1zutWYrYwNRSa
	I9M9w/9FvjOnkeHFZZkyA0wW5D+3zWiJCCQ/EgbBo3HMcazgDH2O4y6aY3tKv3VHHzXcIDqvW87EX
	AA08aszFjY7BkKtdRx9BTd0kZFhMwHx3pcCa2Yw+MSHxQQ1iCjUzhKzn2VjgqE3mUrJxZwTlpxf5D
	KBwskXy05TwDxDsahAm9hhQhJJCRVeRgAJIqCtMPpgxK2Qfp/Hw/p5S3T1UKCaYWsxDBiOgWwSlHh
	dDRBZ5+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR6wx-00000007sHx-00Cb;
	Thu, 04 Dec 2025 10:52:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR6wu-00000007sHY-2fwR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 10:52:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5717A339;
	Thu,  4 Dec 2025 02:52:27 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AD8A3F59E;
	Thu,  4 Dec 2025 02:52:32 -0800 (PST)
Date: Thu, 4 Dec 2025 10:52:30 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: Re: [PATCH v3 4/9] KVM: arm64: Handle FEAT_IDST for sysregs without
 specific handlers
Message-ID: <20251204105230.GB98666@e124191.cambridge.arm.com>
References: <20251204094806.3846619-1-maz@kernel.org>
 <20251204094806.3846619-5-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204094806.3846619-5-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_025236_718471_CAB9D41C 
X-CRM114-Status: GOOD (  20.24  )
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

On Thu, Dec 04, 2025 at 09:48:01AM +0000, Marc Zyngier wrote:
> Add a bit of infrastrtcture to triage_sysreg_trap() to handle the
> case of registers falling into the Feature ID space that do not
> have a local handler.
> 
> For these, we can directly apply the FEAT_IDST semantics and inject
> an EC=0x18 exception. Otherwise, an UNDEF will do.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/emulate-nested.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> index 616eb6ad68701..fac2707221b47 100644
> --- a/arch/arm64/kvm/emulate-nested.c
> +++ b/arch/arm64/kvm/emulate-nested.c
> @@ -2588,6 +2588,26 @@ bool triage_sysreg_trap(struct kvm_vcpu *vcpu, int *sr_index)
>  
>  		params = esr_sys64_to_params(esr);
>  
> +		/*
> +		 * This implements the pseudocode UnimplementedIDRegister()
> +		 * helper for the purpose of fealing with FEAT_IDST.
                                            *dealing

> +		 *
> +		 * The Feature ID space is defined as the System register
> +		 * space in AArch64 with op0==3, op1=={0, 1, 3}, CRn==0,
> +		 * CRm=={0-7}, op2=={0-7}.
> +		 */
> +		if (params.Op0 == 3 &&
> +		    !(params.Op1 & 0b100) && params.Op1 != 2 &&
> +		    params.CRn == 0 &&
> +		    !(params.CRm & 0b1000)) {
> +			if (kvm_has_feat_enum(vcpu->kvm, ID_AA64MMFR2_EL1, IDS, IMP))
> +				kvm_inject_sync(vcpu, kvm_vcpu_get_esr(vcpu));
> +			else
> +				kvm_inject_undefined(vcpu);
> +
> +			return true;
> +		}
> +
>  		/*
>  		 * Check for the IMPDEF range, as per DDI0487 J.a,
>  		 * D18.3.2 Reserved encodings for IMPLEMENTATION
> -- 
> 2.47.3
> 

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

