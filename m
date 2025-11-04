Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2AECCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 13:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mnx42npIkvzns28CDivHWgsuCDKu+CS0bZXIcTv0ktE=; b=Ddn9H7CmQg/fj/mbr9cTx6YmxZ
	JqKEKph7C0gPZQwkOnGb3GHBkwprQcPQeJexWqdUU7PKiKyoIdOzB36ZR1JxY+mKEz9CGEFszYiGA
	ebryJJG8ROnJYMKlWtb0FcW1VaUA8mRF5qjPhGzY4MbN4c25cY1k8iGANJS4gkuLyhHSksGTF57bz
	KBjoo6HKUQ6mq2gXrzkhSETfloTvS7VT4HOxGvbPr8b6kbTIpXGoKcvsckcEDgC08CX8FTwiy0xm5
	C/YyQEzoBGydwuLeb69tSbJS7vWooII4UqqW+j4j7Zu5WnmX7wqVEKowzBwblBF6kUNTM5EQ0fqxB
	IVdvHA3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHL9-0000000Bu5E-2ACp;
	Tue, 04 Nov 2025 13:44:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHL6-0000000Bu4a-3AOP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 13:44:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FD161CE0;
	Tue,  4 Nov 2025 05:44:38 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D5CF3F66E;
	Tue,  4 Nov 2025 05:44:44 -0800 (PST)
Date: Tue, 4 Nov 2025 13:44:39 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, will@kernel.org,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, vladimir.murzin@arm.com
Subject: Re: [PATCH v1 1/8] KVM: arm64: Route MOPS exceptions to EL2 when
 guest lacks support
Message-ID: <20251104134439.GA285975@e124191.cambridge.arm.com>
References: <20251104125906.1919426-1-tabba@google.com>
 <20251104125906.1919426-2-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104125906.1919426-2-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_054448_838904_1138F4E2 
X-CRM114-Status: GOOD (  23.45  )
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

Hi Fuad,

On Tue, Nov 04, 2025 at 12:58:59PM +0000, Fuad Tabba wrote:
> MOPS exceptions must be routed to the hypervisor (EL2) when the guest
> does not support the feature. If the guest does support MOPS, exceptions
> should be handled by the guest at EL1.
> 
> The existing logic was inverted: exceptions were trapped to EL2 (by
> setting HCRX_EL2_MCE2) when the guest supported MOPS, and left to be
> handled at EL1 when it did not.
> 

This doesn't seem quite right? Check the commit message of 2de451a329:

  A KVM guest may use the instructions at EL1 at times when the guest is
  not able to handle the exception, expecting that the instructions will
  only run on one CPU (e.g. when running UEFI boot services in the guest).
  As KVM may reschedule the guest between different types of CPUs at any
  time (on an asymmetric system), it needs to also handle the resulting
  exception itself in case the guest is not able to. A similar situation
  will also occur in the future when live migrating a guest from one type
  of CPU to another.

So it's intentionally trapping MOPS to EL2.

Also with HCRX_EL2.MSCEn=0, execution of the MOPS instructions are UNDEFINED at
EL0/EL1, so you wouldn't take any MOPS exceptions to EL2 anyway.

Thanks,
Joey

> Fix this by moving the setting of HCRX_EL2_MCE2 from the feature-check
> block to the 'else' block, ensuring exceptions are only trapped to EL2
> when the guest cannot handle them.
> 
> Fixes: 84de212d739e ("KVM: arm64: Make FEAT_MOPS UNDEF if not advertised to the guest")
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  arch/arm64/include/asm/kvm_emulate.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index c9eab316398e..0f8311263edf 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -684,7 +684,9 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
>  		vcpu->arch.hcrx_el2 = HCRX_EL2_SMPME;
>  
>  		if (kvm_has_feat(kvm, ID_AA64ISAR2_EL1, MOPS, IMP))
> -			vcpu->arch.hcrx_el2 |= (HCRX_EL2_MSCEn | HCRX_EL2_MCE2);
> +			vcpu->arch.hcrx_el2 |= HCRX_EL2_MSCEn;
> +		else
> +			vcpu->arch.hcrx_el2 |= HCRX_EL2_MCE2;
>  
>  		if (kvm_has_tcr2(kvm))
>  			vcpu->arch.hcrx_el2 |= HCRX_EL2_TCR2En;
> -- 
> 2.51.2.997.g839fc31de9-goog
> 

