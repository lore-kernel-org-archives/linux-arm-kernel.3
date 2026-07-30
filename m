Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC20EC54FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 09:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mF7Z5wX8EXbWIN2+rivpRL+1Kmo3FWpkiMD2J5REZno=; b=fRokyJLAQyUXZrAgxhLh2OeAUp
	eXQXUfp4eipLD/CMOWKxeJtwgfDvKI4xtRob0rWo5PvV2iPYTLOCUqq8CIr/xOFIyK47WS5xZyg1i
	Ii2ct1gnLw+6H5CxYS8BG32J87OyYg2gElXJb5cjR6chHzYej7f3zNY3StUOYyIEEB8i526Ng2I5s
	wmZS26JyycGwIVBhTQCCmhUixbVEfX/M7O5gnMbEI9lTl5pOtDJMBL/IwPoVz6bUBysMe0gMfthrJ
	GGxG8Pc9DNCMRGFu5cXkmIEqjcuH0enLWPe2HhbRsdCaH/ZdNtb3jnlIpjr6am6MH7r+AzsyMKvrZ
	YDzOeAhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNHX-0000000A2jI-1SG4;
	Thu, 30 Jul 2026 09:42:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNHU-0000000A2im-2JW0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 09:42:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21F751684;
	Thu, 30 Jul 2026 02:42:19 -0700 (PDT)
Received: from e143914.arm.com (e143914.arm.com [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 901423F763;
	Thu, 30 Jul 2026 02:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785404543; bh=lHBav+NnSbaievhmsIcyM4nMmorZWzeCuHUGA/WlAUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bvf4P35ZuMEw6g5GS4WbbaROy2H5MVn8hCWTX5hoPi10fjAcJRak4SEwjGFv+PawJ
	 IId/lbdJHF2TF9n29cyx3OswKHL1dwPGhZ88DwVyaQ9zRqzHO3xx4MU4Q57S4mV9rg
	 T2mXeYo764JP3APdwbZ5HLfBdtWUQCWYQhH42/rw=
Date: Thu, 30 Jul 2026 10:42:16 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>
Subject: Re: [PATCH v4 03/29] KVM: arm64: Merge guest's HCRX_EL2 using
 NV_HCRX_GUEST_EXCLUDE
Message-ID: <amscW_LCL_5RkJFQ@e143914.arm.com>
References: <20260730071022.296811-1-maz@kernel.org>
 <20260730071022.296811-4-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730071022.296811-4-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_024224_758589_34042675 
X-CRM114-Status: GOOD (  26.96  )
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

On Thu, Jul 30, 2026 at 08:09:56AM +0100, Marc Zyngier wrote:
> The way we merge the guest-provided HCRX_EL2 value with the host's
> is bonkers. We try to make it look like the FGT registers by using
> positive and negative polarities for traps, but most of these bits
> are not strictly about trapping, as they actively change the way
> some architectural state is managed.
> 
> It would be far better to deal with these bits like we do for
> HCR_EL2, by enumerating the list of bits we don't allow the guest
> to override. This is simplified by the fact that HCRX_EL2 only
> affects EL1, and not EL2.
> 
> Re-jig the HCRX_EL2 handling with a macro that list the bits excluded
> from the merge (TMEA, PTTWI, EnIDCP128).
> 
> Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/hyp/include/hyp/switch.h | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> index 4bf624a49591d..8e5f492f39086 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> @@ -325,6 +325,24 @@ static inline void __deactivate_traps_mpam(void)
>  		write_sysreg_s(MPAMHCR_HOST_FLAGS, SYS_MPAMHCR_EL2);
>  }
>  
> +/*
> + * Just like for HCR_EL2, we can't let the guest mess with some of the
> + * basics we rely on in HCRX_EL2. However, the major difference is that
> + * HCRX_EL2 only affects EL1, and never EL2 (sudden outburst of sanity, I
> + * guess). So it is always the guest inflicting it on its own guestx.

Unsure if "guestx" is a typo or a funny way of saying guest's HCRX_EL2!

> + *
> + * Things we don't want to let the guest control are:
> + *
> + * - TMEA: That's for us to decide how an SEA is routed, not the guest.
> + *
> + * - PTTWI: Similarly, it is for us to decide whether Reduced Coherency for
> + *   the PTW is a thing. It really isn't.
> + *
> + * - EnIDCP128: We don't allow IMPDEF sysregs -- full stop.
> + */
> +#define NV_HCRX_GUEST_EXCLUDE	(HCRX_EL2_TMEA	    | HCRX_EL2_PTTWI | \
> +				 HCRX_EL2_EnIDCP128)
> +
>  static inline void __activate_traps_common(struct kvm_vcpu *vcpu)
>  {
>  	struct kvm_cpu_context *hctxt = host_data_ptr(host_ctxt);
> @@ -350,8 +368,8 @@ static inline void __activate_traps_common(struct kvm_vcpu *vcpu)
>  		u64 hcrx = vcpu->arch.hcrx_el2;
>  		if (is_nested_ctxt(vcpu)) {
>  			u64 val = __vcpu_sys_reg(vcpu, HCRX_EL2);
> -			hcrx |= val & __HCRX_EL2_MASK;
> -			hcrx &= ~(~val & __HCRX_EL2_nMASK);
> +			hcrx |= (val & ~NV_HCRX_GUEST_EXCLUDE);
> +			hcrx &= ~(~val & ~NV_HCRX_GUEST_EXCLUDE);
>  		}
>  
>  		ctxt_sys_reg(hctxt, HCRX_EL2) = read_sysreg_s(SYS_HCRX_EL2);

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

