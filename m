Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62F6CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 18:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8OJjD43azdP23k1cTrZE8juHLaYwD4FGvP61SHNAwn4=; b=fCVSLAviu6PIpiQ0ar8vLm1eZ6
	p4egK+/rMgWYoi2Dolkr06mnzT1t3PBxuusZuhcxZMV444n6hxUouGbwvA1SpVy8CLh/wdl0xbP2o
	awuVa/+J7zuWa3WVQXzA9fMCTJX3hgN4Y30Mtr1fYPh+7cT9CcJrHzrDwNH1EQvvGZuZa5Fq2JsaZ
	HjqCpUAE6V+eocwXc11q74awaoyoxRcCxLdfX6TAlgpkIn5EFS8vJtJVJVvvcJNDHBL+wDZrrwd/d
	ZsWbWnj/tjuHZGXaRYUjmDLGd2D/5X2mRcaEnx05k0KFIZ1sgrqU9+sX36cd8jZk69cAwlN23Gil+
	mswWBbtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRau-00000000aCd-2XAy;
	Fri, 07 Nov 2025 18:53:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRar-00000000aBm-0lIF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 18:53:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D89B43B88;
	Fri,  7 Nov 2025 18:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F137EC116C6;
	Fri,  7 Nov 2025 18:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762541632;
	bh=RIXw7Xojbsu8fNwBlN6lueulv3Ht7IrJjqveZA3dqNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SBHo2vDvH4Ug3Szqt6A3FavNSuCOZhtpLXYvwGvZHgJczlRDIv1z54KWDtLFpuNRX
	 34kFzDIOOT1RLXivNfvn1S8lTiiMR5kPRBlTumU7ayO7tFUP9DfUZGvcQgY2A79CRv
	 oGWnH0fLyQdU3s4CPQ6cZv0l7HAyueYMsxdRKxM8+I7x7MxP9+5SiuilTYUd1v5E7z
	 ju4H+mZAvigE19A8s2087AgWOC7xd9wDFq8WGUr3S8BIT7l0HDwWZK3vlPhLp3fREC
	 lDUM7y2h3xb8MZEE09Aejtiy6o1xJ74UV5/oV/ALYK9UBjcuiTYHgIyyG0Sld35lqB
	 uE1lEYc+ANadg==
Date: Fri, 7 Nov 2025 10:53:50 -0800
From: Oliver Upton <oupton@kernel.org>
To: Zhou Wang <wangzhou1@hisilicon.com>
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	yangyccccc@gmail.com, prime.zeng@hisilicon.com, xuwei5@huawei.com
Subject: Re: [PATCH v7 6/7] KVM: arm64: Enable FEAT_{LS64, LS64_V} in the
 supported guest
Message-ID: <aQ5APpLg0Elv4YoH@kernel.org>
References: <20251107072127.448953-1-wangzhou1@hisilicon.com>
 <20251107072127.448953-7-wangzhou1@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107072127.448953-7-wangzhou1@hisilicon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_105353_282921_E331865E 
X-CRM114-Status: GOOD (  14.88  )
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

Hi Zhou,

On Fri, Nov 07, 2025 at 03:21:26PM +0800, Zhou Wang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Using FEAT_{LS64, LS64_V} instructions in a guest is also controlled
> by HCRX_EL2.{EnALS, EnASR}. Enable it if guest has related feature.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>

The ordering of this patch is incorrect as patch #5 has the side-effect
of exposing ID_AA64ISAR1_EL1.LS64 to KVM guests. This one should come
first instead.

Thanks,
Oliver

> ---
>  arch/arm64/include/asm/kvm_emulate.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index bab967d65715..29291e25ecfd 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -695,6 +695,12 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
>  
>  		if (kvm_has_sctlr2(kvm))
>  			vcpu->arch.hcrx_el2 |= HCRX_EL2_SCTLR2En;
> +
> +		if (kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64))
> +			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnALS;
> +
> +		if (kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_V))
> +			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnASR;
>  	}
>  }
>  #endif /* __ARM64_KVM_EMULATE_H__ */
> -- 
> 2.33.0
> 
> 

