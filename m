Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540F0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 14:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S37+Tr1u2ck0VLNMPer9SSEFBbV2lCDeoh8L8L9B4Z0=; b=NB2DwbNguX/aRChj0Shfg/Jn73
	xFRX5vXT+lrlvDnn7SGghUhccJ6B3Y0e5aqD/6YDoVZB3qQK1axvmjCWlFaBF2D509FYRFKN2ELbe
	VjOCi81/qVVxT5J0T0ooHfARU1tfLS2XKeJOdc83DkMmQViV/r9nqn2kS/NG+5IjXF98cSMT7JxE+
	TQ/wDuMhT4a9z6XoWZTvzZzk47OgeSSCbMsj7HG2t+wAwo1lZgmOgiuHABYjXxMMBm1Sbn6A3tv+D
	0kXMg89rLgYGMRXpcZMrOu+mVcwsYvYZ9H1sfk2j/Ng12d/rcdA7nO2HEXVquyRYUQaZtmCnRxeKZ
	z1c77qQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiC9j-000000054pQ-3jaR;
	Fri, 10 Jul 2026 14:24:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiC9h-000000054oc-1zxL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 14:24:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B967176A;
	Fri, 10 Jul 2026 07:24:34 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.2.213.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72CA23F7B4;
	Fri, 10 Jul 2026 07:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783693478; bh=57yy5wTX9Ho7bi/LUfyKbKgFguqEUaBdyCNXSxpomDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KDnsVFPm01cedCI0/W1Ov+nbDD+1CVJd5UTLnCY0bXSpzfghDgwZjWbC4VNF/nwbR
	 Sw6NUD/64kRr4B57VVC9r61PBA4BnXdMfvEAXl7Vv2thWhBX1vyo6aIqWlg2EtNB6T
	 yjCYS77HwzB9up7X1ro8yvb8QBGSGCEPVfpgKS8k=
Date: Fri, 10 Jul 2026 15:24:34 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 27/28] KVM: arm64: Expose FEAT_NV3 to guests
Message-ID: <20260710142434.GC12293@e124191.cambridge.arm.com>
References: <20260702160248.1377250-1-maz@kernel.org>
 <20260702160248.1377250-28-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702160248.1377250-28-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_072441_741088_80785A08 
X-CRM114-Status: GOOD (  15.83  )
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

On Thu, Jul 02, 2026 at 05:02:47PM +0100, Marc Zyngier wrote:
> Further enable FEAT_NV3 by making it visible to NV guests.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/kvm/nested.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index c9bf04944f9cb..64c8fb82fadf6 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1728,7 +1728,7 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
>  		 * You get EITHER
>  		 *
>  		 * - FEAT_VHE without FEAT_E2H0
> -		 * - FEAT_NV limited to FEAT_NV2(p1)
> +		 * - FEAT_NV limited to FEAT_NV2(p1)/NV3
>  		 * - HCR_EL2.NV1 being RES0
>  		 *
>  		 * OR
> @@ -1740,7 +1740,9 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
>  		if (test_bit(KVM_ARM_VCPU_HAS_EL2_E2H0, kvm->arch.vcpu_features)) {
>  			val = 0;
>  		} else {
> -			if (cpus_have_final_cap(ARM64_HAS_NV2P1))
> +			if (cpus_have_final_cap(ARM64_HAS_NV3))
> +				val = ID_REG_LIMIT_FIELD_ENUM(val, ID_AA64MMFR4_EL1, NV_frac, NV3);
> +			else if (cpus_have_final_cap(ARM64_HAS_NV2P1))
>  				val = ID_REG_LIMIT_FIELD_ENUM(val, ID_AA64MMFR4_EL1, NV_frac, NV2P1);
>  			else
>  				val = SYS_FIELD_PREP_ENUM(ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY);
> -- 
> 2.47.3
> 

