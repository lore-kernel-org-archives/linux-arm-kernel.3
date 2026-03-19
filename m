Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971561088E60
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 17:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjdeGDPKRgGEXJFJV/ZEXwIGyRtycu+1UOfRiAPX1uo=; b=NL8CMA3CLfuNqGcHxvFONm5PV5
	CH0y8JvXnuXlDQqJsUoc0ooO+WycxnngHtMYjGVce+psU97jZjNPyIHxq/FGCukc1Nm1agjLf/853
	sRt22ZzuKnACwdkHvQiJ5uBr6qhsNKCe3F2Kz1RalP3+TUFjReDSpNZW8vIhyx3u1HhUXtBK/epAv
	I21BABs6qcN2nZjpD3UAIbepOVr6gfjhWpdQmoYfqwd+Ra8HhpW6Mq/Ru8aIyGb+dlDna13YekBUU
	c7HwDL8oJyEV9OreXOdySsiR8AKczTQX1Mu2ayOr3CXctCj/e90GH3wb+jTrBWDSkdCgYkaK7s4Tr
	qwlDQvag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3HKN-0000000BDUI-3Nqj;
	Thu, 19 Mar 2026 17:38:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3HKK-0000000BDTu-2k4L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 17:38:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89A0D2247;
	Thu, 19 Mar 2026 10:38:25 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DCF03F778;
	Thu, 19 Mar 2026 10:38:29 -0700 (PDT)
Date: Thu, 19 Mar 2026 17:38:27 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Fuad Tabba <tabba@google.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 03/11] arm64: Add logic to fully remove features from
 sanitised id registers
Message-ID: <abw0k4V_RROnqkUQ@arm.com>
References: <20260302115653.1517326-1-maz@kernel.org>
 <20260302115653.1517326-4-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302115653.1517326-4-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_103832_833623_AD0D67EC 
X-CRM114-Status: GOOD (  25.76  )
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

On Mon, Mar 02, 2026 at 11:56:44AM +0000, Marc Zyngier wrote:
> We currently make support for some features such as Pointer Auth,
> SVE or S1POE a compile time decision.
> 
> However, while we hide that feature from userspace when such support
> is disabled, we still leave the value provided by the HW visible to
> the rest of the kernel, including KVM.
> 
> This has the potential to result in ugly state leakage, as half of
> the kernel knows about the feature, and the other doesn't.
> 
> Short of completely banning such compilation options and restore
> universal knowledge, introduce the possibility to fully remove such
> knowledge from the sanitised id registers.

I wouldn't oppose to it really. If there are features affecting the
kernel compilation (e.g. kasan/mte), we need configs but for most
features I don't think we should bother, especially if they don't
take significantly more code/data memory when not present. It makes it
easier for us to reason about.

Of course, I'd keep the command-line overriding, it helps with
debugging.

> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 102c5bac4d502..965dd2acf0640 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -192,7 +192,7 @@ void dump_cpu_features(void)
>  #define __ARM64_FTR_BITS(SIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL) \
>  	{						\
>  		.sign = SIGNED,				\
> -		.visible = VISIBLE,			\
> +		.visibility = VISIBLE,			\
>  		.strict = STRICT,			\
>  		.type = TYPE,				\
>  		.shift = SHIFT,				\
> @@ -1063,16 +1063,33 @@ static void init_cpu_ftr_reg(u32 sys_reg, u64 new)
>  				ftrp->shift);
>  		}
>  
> -		val = arm64_ftr_set_value(ftrp, val, ftr_new);
> -
>  		valid_mask |= ftr_mask;
>  		if (!ftrp->strict)
>  			strict_mask &= ~ftr_mask;
> -		if (ftrp->visible)
> +
> +		switch (ftrp->visibility) {
> +		case FTR_VISIBLE:
> +			val = arm64_ftr_set_value(ftrp, val, ftr_new);
>  			user_mask |= ftr_mask;
> -		else
> +			break;
> +		case FTR_ALL_HIDDEN:
> +			/*
> +			 * ALL_HIDDEN and HIGHER_SAFE are incompatible.
> +			 * Only hide from userspace, and log the oddity.
> +			 */
> +			if (WARN_ON(ftrp->type == FTR_HIGHER_SAFE))
> +				val = arm64_ftr_set_value(ftrp, val, ftr_new);
> +			else
> +				val = arm64_ftr_set_safe_value(ftrp, val);
>  			reg->user_val = arm64_ftr_set_safe_value(ftrp,
>  								 reg->user_val);

IIUC, if a feature is now disabled in .config and marked as
FTR_ALL_HIDDEN, we end up with a 0 field in the sanitised sysreg (or
whatever the safe value is). We now have a discrepancy between VHE and
nVHE in finalise_el2_state. The check_override_idreg macro uses the
sanitised sysregs for nVHE and the actual hw ones with VHE. Maybe not an
issue in the cases you are targeting but it's something that may bite us
in the future.

One ugly workaround is to add #ifdefs or .ifs to el2_setup.h. A slightly
better one (I think) would be to force the above visibility into the
override masks/values rather than adding FTR_ALL_HIDDEN. Let the
override checks end up with a safe value.

And, of course, my preferred way would be to drop this config-based
visibility altogether ;).

-- 
Catalin

