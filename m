Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3349BCAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 22:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JPVacn2PmZ4z0RLVYVdIubbfP3TwF2TL+jrZNbrpOZY=; b=ICsNQ3hj3G1/Jvvv2Q7+1KAbNo
	Lm92QzjRcdiNM+gXbpb+b0dVYR+Kqk/aS1hqrQdq76LmnKuIMPZ50QaaL09Prug5D802phkfzV3pD
	0lvntcx1X+zJurXKl5/6Skcx7GgszXaIbEkJjH3OH6wSBMjeGICg5FC42nx3olw8oWmDvB5KVV5MJ
	J3H4dtL98cRF86pVQ5sTD6vxcpMxHBQbjov02gwDmQxMuY8lTS+Af/79otbjmYK0tahWroprs2bqN
	7rBV5Xr/wt5xD1YUhCYeUgIYkgwnU7WpJtaDxFQGZI5O7ylpEEFpjraVd3EnlTSJW1S4NxvN7tXR3
	wkVC/SAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzjaF-00000004Bw6-0zBR;
	Fri, 19 Sep 2025 22:28:03 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzjaC-00000004BvY-2Zvw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 22:28:02 +0000
Date: Fri, 19 Sep 2025 15:27:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758320877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JPVacn2PmZ4z0RLVYVdIubbfP3TwF2TL+jrZNbrpOZY=;
	b=wnp+UmoBpZAXPiLW7xIF+MCTKCUgSQe49oVMjUVwo32FGzBFzYThwgln/M/PavQ5rmsWHK
	keJSMnkJTjwrtOWXId+jlkZhJivC4jle8gpL8K8e9N/ButtDNsdoPY87wCYwhUerRos2zj
	qP8Yu+AhdtLPbcQIWoumXqdkKDX2UNI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 10/16] KVM: arm64: Allow use of S1 PTW for non-NV vcpus
Message-ID: <aM3Y6DcAqhGJJer7@linux.dev>
References: <20250915114451.660351-1-maz@kernel.org>
 <20250915114451.660351-11-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915114451.660351-11-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_152801_035366_BF2B2E8B 
X-CRM114-Status: GOOD (  15.14  )
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

On Mon, Sep 15, 2025 at 12:44:45PM +0100, Marc Zyngier wrote:
> As we are about to use the S1 PTW in non-NV contexts, we must make
> sure that we don't evaluate the EL2 state when dealing with the EL1&0
> translation regime.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/at.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
> index 1230907d0aa0a..4f6686f59d1c4 100644
> --- a/arch/arm64/kvm/at.c
> +++ b/arch/arm64/kvm/at.c
> @@ -108,8 +108,9 @@ static bool s1pie_enabled(struct kvm_vcpu *vcpu, enum trans_regime regime)
>  	case TR_EL20:
>  		return vcpu_read_sys_reg(vcpu, TCR2_EL2) & TCR2_EL2_PIE;
>  	case TR_EL10:
> -		return  (__vcpu_sys_reg(vcpu, HCRX_EL2) & HCRX_EL2_TCR2En) &&
> -			(__vcpu_sys_reg(vcpu, TCR2_EL1) & TCR2_EL1_PIE);
> +		return ((!vcpu_has_nv(vcpu) ||
> +			 (__vcpu_sys_reg(vcpu, HCRX_EL2) & HCRX_EL2_TCR2En)) &&
> +			(__vcpu_sys_reg(vcpu, TCR2_EL1) & TCR2_EL1_PIE));

Hmm, dealing with the effectiveness of bits gated by HCRX_EL2.xEN is a
pain. Rather than open-coding this everywhere:

static bool __effective_tcr2_bit(struct kvm_vcpu *vcpu, enum trans_regime regime,
				 unsigned int idx)
{
	bool bit;

	if (tr != TR_EL10)
		return vcpu_read_sys_reg(vcpu, TCR2_EL2) & BIT(idx);

	bit = __vcpu_read_sys_reg(vcpu, TCR2_EL1) & BIT(idx);
	if (vcpu_has_nv(vcpu))
		bit &= (__vcpu_sys_reg(vcpu, HCRX_EL2) & HCRX_EL2_TCR2En);

	return bit;
}

static bool s1pie_enabled(struct kvm_vcpu *vcpu, enum trans_regime regime)
{
	return __effective_tcr2_bit(vcpu, regime, TCR2_EL1_PIE_SHIFT);
}

static void compute_s1poe(struct kvm_vcpu *vcpu, struct s1_walk_info *wi)
{
	if (!kvm_has_s1poe(vcpu->kvm)) {
		wi->poe = wi->e0poe = false;
		return;
	}

	wi->poe = __effective_tcr2_bit(vcpu, wi->regime, TCR2_EL1_POE_SHIFT);
	if (wi->regime != TR_EL2)
		wi->poe = __effective_tcr2_bit(vcpu, wi->regime, TCR2_EL1_E0POE_SHIFT);
}

Thoughts?

Thanks,
Oliver

