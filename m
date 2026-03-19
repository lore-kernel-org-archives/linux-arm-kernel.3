Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6951090240
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 15:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EeKUMPn7QNAqL1tgRh5heIMLbFhJWf4CAMeI/z+xFLs=; b=kK0azt6HX2RRPvehDbWBbPlkPY
	hENFC4QBer1+f+DA1GjJQ2S/FQR84vy0JSgEOCIuiMdEbR7eMFU7BEZ9xXSjrQUP2RZQ0Cr4SSsqy
	1YsVTgz6RQ0jjp/psnEhUIEeK4qm8ocT1PSR0JsQXpAkrja2YLBpw1QaTdAdBsYiSkpSLBhbGQjeP
	eKZpnI+EXVVemAkaDWOtAhp1NKoJKjbG97B5zVhafrvvDwuek0QMnyUlqv0XkrKQ8eEW2JUYNRB1X
	xIufrrwIXaBUI6EK7Av9avlKqIgr8WviGVxdsMlu7DNuMBE+TNBIBUjz9Y0SsDlbC5zT3O3v5wQ1g
	CkDZAcXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FOh-0000000AvFi-2Gju;
	Thu, 19 Mar 2026 15:34:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FOf-0000000AvFM-0tfD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 15:34:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CCEC1A25;
	Thu, 19 Mar 2026 08:34:45 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 204EA3F778;
	Thu, 19 Mar 2026 08:34:50 -0700 (PDT)
Date: Thu, 19 Mar 2026 15:34:47 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Fuad Tabba <tabba@google.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 01/11] arm64: Skip update of an idreg field affected
 by an override
Message-ID: <abwXl35xQ2ze1XwJ@arm.com>
References: <20260302115653.1517326-1-maz@kernel.org>
 <20260302115653.1517326-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302115653.1517326-2-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_083453_297329_42CEB070 
X-CRM114-Status: GOOD (  24.28  )
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

On Mon, Mar 02, 2026 at 11:56:42AM +0000, Marc Zyngier wrote:
> When computing the new value od an idreg that contains a field
> affected by an override, do not update that particular field.
> 
> The value computed at init-time must be kept as-is, as that's
> what the user has asked for, for better or worse.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kernel/cpufeature.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index c31f8e17732a3..28fc77443ccd3 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -1224,6 +1224,13 @@ static void update_cpu_ftr_reg(struct arm64_ftr_reg *reg, u64 new)
>  		s64 ftr_cur = arm64_ftr_value(ftrp, reg->sys_val);
>  		s64 ftr_new = arm64_ftr_value(ftrp, new);
>  
> +		/*
> +		 * Don't alter the initial value that has been forced
> +		 * by an override.
> +		 */
> +		if ((reg->override->mask & arm64_ftr_mask(ftrp)) == arm64_ftr_mask(ftrp))
> +			continue;

I got lost in the in the cpufeature framework, so I may be missing
something.

Let's say the primary CPU has a feature field with value 2 and we want
to override it to value 1. For e.g. a LOWER_SAFE feature, boot_cpu_data
will stored the overridden value of 1.

A secondary CPU comes online with the same feature missing, so value 0.
With the above change, we no longer update the system-wide feature
value, leave it as 1. Later on, for a system feature we may turn it on
even though the secondary CPU does not support it.

In summary, this makes the overridden field sticky for secondary CPUs
even if they don't support it.

Unrelated to your patch, I think we can similarly fail to reject
secondary CPUs in check_early_cpu_features() -> verify_local_cpu_caps()
because of __read_sysreg_by_encoding() which uses the override value
unconditionally. From this perspective, we are now consistent with your
patch above.

In all cases we taint the kernel for FTR_STRICT features but that may go
unnoticed or if we had FTR_NONSTRICT (does it even matter in this
case?).

Maybe that's the intended use and blame the user for passing the wrong
override. We are still slightly inconsistent depending on what the boot
CPU supports where we still decide whether accept or reject an override.
We don't do this for secondaries.

Anyway, I'm not opposing to this patch if that's what's intended. I'm
sure I'll forget everything about this framework in a couple of weeks.

-- 
Catalin

