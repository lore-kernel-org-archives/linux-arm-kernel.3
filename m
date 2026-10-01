Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13589CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8AC7GbvuCCMMbO7MKRkTJUZ5RNbtzx9lp9nn1lg0M9w=; b=sloAkxFRQtbAQQtk1JMD7JI7OA
	Rk92H+VUCrh1m13JzeODnmSuXWj19lIQ7QmVGSA0x1p+xkH8QXf+XlerXK2+aFjbU2OoJ2QbX3bG9
	j/RsOTeULQCVZ/XM4/fgVgunUhqrINS7PRPuO+HHilmZrZBQL3Lwsg78DdK4LqyLQEjh07k4BzSgw
	Uh8qiREeHWwBF86xNgEhd/Wkjxl1TKIlbAWcV3bIn9QycAyzx0FfPxZ23qRSojfiQ5Lz87ZMXXj/K
	pPEMYMbbCgX+xNVs+OFUQsP9vO28PdnS2ejC56Cee4nILTI4XmgR+DuQOGBJSXphR0F8SEVOw61N5
	lV3Ci0cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHjE-00000009MmT-2C5b;
	Thu, 01 Oct 2026 14:25:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHjD-00000009MlR-0HvZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:25:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EE1EB6021D;
	Thu,  1 Oct 2026 14:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B1F1F000FF;
	Thu,  1 Oct 2026 14:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790864738;
	bh=8AC7GbvuCCMMbO7MKRkTJUZ5RNbtzx9lp9nn1lg0M9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iehR+JhNmWti4pt7pfdUdJ6fePSYT//2YUHfiZ2GH0gFzcTvh2uujKnreTPbdh9f3
	 InAhVQJauuzfMtHOROac9Sn4iUr2Jjiuf/5dsLjq+np/OXGSrrfwX4FbkLGWaOEwfC
	 SOpmvaH9GBGPE7YYvV9OX4mhXFOzAmcIiyqd3r6AOysyHvWbfeLFc2ZN2fxsGDwJvI
	 CfLvGrDiLGkpHpn67BrpwfZtN31KPXLEsyAzyDfQ616aG4PbKBiqPXJWGqwoKE4NuS
	 0/uH67EaBvXRO9WWtTh8DTHR41EpXacsiDhks8IoOxdDPuBTu6237B3FfonEih7AmT
	 kVO94jhXn8CRw==
Date: Thu, 1 Oct 2026 15:25:31 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Peter Maydell <peter.maydell@linaro.org>, 
	Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 07/15] KVM: arm64: Forward GCS exceptions to nested
 guests
Message-ID: <ar5cHWMczKd6yw7n@gremlin>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
 <20260930-arm64-gcs-v21-7-3556644cd927@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-arm64-gcs-v21-7-3556644cd927@kernel.org>
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

On Wed, Sep 30, 2026 at 10:48:17PM +0100, Mark Brown wrote:
> For nested guests where HFGITR_EL2.nGCSSTR_EL1 is clear or when there are

I see at [0] that, if HFGITR_EL2.nGCSSTR_EL1 is clear:

"If EL2 is implemented and enabled in the current Security state, and
either EL3 is not implemented or SCR_EL3.FGTEn == 1, then execution at EL1
using AArch64 of any of the specified instructions generates a GCS
exception with EC syndrome value 0x2D, unless the instruction generates a
higher priority exception."

For:

GCSSTR.
GCSSTTR when PSTATE.UAO is 1.
GCSSTTR when the Effective value of HCR_EL2.{NV, NV1} is {1, 1}.

So privileged GCS stores.

[0]: https://support.arm.com/documentation/111107/2026-09/AArch64-Registers/HFGITR-EL2--Hypervisor-Fine-Grained-Instruction-Trap-Register?lang=en

> L2 GCS data check exceptions we need to forward the exception to the guest.
> Add handling to do so.
>
> Reviewed-by: Leonardo Bras <leo.bras@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>

(A bunch of commentary here, just reasoning out loud for my own
understanding.)

All LGTM, so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
> index db37678dcb05..a8198e96fcb4 100644
> --- a/arch/arm64/kvm/handle_exit.c
> +++ b/arch/arm64/kvm/handle_exit.c

> +/*
> + * We might get GCS exceptions that need to be forwarded to the
> + * hypervisor when a nested guest has HFGITR_EL2.nGCSSTR_EL1 clear, or
> + * for a GCS data check exception for a L2 guest.
> + */

OK so I see this is used as a handler in:

static exit_handle_fn arm_exit_handlers[] = {
	...
	[ESR_ELx_EC_GCS]	= kvm_handle_gcs,
};

And as per the arm ref page, 0x2D == ESR_ELx_EC_GCS.

And it's always something being injected, so returning 1 (handled) is fine.

>  static int kvm_handle_gcs(struct kvm_vcpu *vcpu)
>  {
> -	/* We don't expect GCS, so treat it with contempt */
> -	if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, GCS, IMP))
> -		WARN_ON_ONCE(1);
> +	if (!kvm_has_gcs(vcpu->kvm)) {
> +		kvm_inject_undefined(vcpu);
> +		return 1;
> +	}

OK so make it not-a-kernel-warning if unsupported...

>
> +	if (vcpu_has_nv(vcpu)) {
> +		kvm_inject_nested_sync(vcpu, kvm_vcpu_get_esr(vcpu));

...And this is the L0 at physical EL2 -> vEL2 (in physical EL1) injecting a
synchronous exception.

So it seems to me the key point of the patch is to forward to nested
guests, hence the subject line :>)

> +		return 1;
> +	}
> +
> +	WARN_ON_ONCE(1);

And this is an 'impossible' case because it should have been handled
natively otherwise. So it's a bug in KVM if it ever happened.

--
Cheers, Lorenzo

