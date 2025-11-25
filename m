Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73BED0EE04
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 16:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x183q8Lv5lYovCm/drajJTNNl61NFGZ5dpKECcejKow=; b=2OuN+GNpbiukRzSaMQeOk9Z6HQ
	DdxlAu2YDpNtKCKmhpQkeuVNQduQLjnxiHiWA22WoLcW4+KmbsBjmeOqqdcaBIabhoJ8kHYyL/FBS
	4C9JCpL7vbldqnfP9ThZIzLMdcH48wQQoxS9IkERQmQviD7RD4CqpTQ9Ntdsgan2oIg0P7YDIrqAp
	657ohDA4eu9BoqJZZG+WNZEcgWT5qOmiJX7zQvnGMsPu1SPIx1iv0nSBMQ0YIASUuxvIsk67RF2rf
	NnCBHlFFmqZQ3zxpPT8TGR8DQVP7tz6kR/ed8cTzbiCcMkgtkpmLoSreO4ur6kCL2ZLTvFuoa0BIH
	r5iCcpvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNva6-0000000DYcG-0dD7;
	Tue, 25 Nov 2025 16:07:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNva2-0000000DYbt-2Nyd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 16:07:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36089168F;
	Tue, 25 Nov 2025 08:07:41 -0800 (PST)
Received: from [10.57.74.181] (unknown [10.57.74.181])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F5C83F6A8;
	Tue, 25 Nov 2025 08:07:47 -0800 (PST)
Message-ID: <39801881-0e48-4daf-a195-4af0603a5bf9@arm.com>
Date: Tue, 25 Nov 2025 16:07:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Convert ICH_HCR_EL2_TDIR cap to
 EARLY_LOCAL_CPU_FEATURE
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Oliver Upton <oupton@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>
References: <20251125160144.1086511-1-maz@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251125160144.1086511-1-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_080750_655102_EF9F779D 
X-CRM114-Status: GOOD (  16.68  )
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

On 25/11/2025 16:01, Marc Zyngier wrote:
> Suzuki notices that making the ICH_HCR_EL2_TDIR capability a system
> one isn't a very good idea, should we end-up with CPUs that have
> asymmetric TDIR support (somehow unlikely, but you never know what
> level of stupidity vendors are up to). For this hypothetical setup,
> making this an "EARLY_LOCAL_CPU_FEATURE" is a much better option.
> 
> This is actually consistent with what we already do with GICv5
> legacy interface, so flip the capability over.
> 
> Reported-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Fixes: 2a28810cbb8b2 ("KVM: arm64: GICv3: Detect and work around the lack of ICV_DIR_EL1 trapping")
> Link: https://lore.kerenl.org/r/5df713d4-8b79-4456-8fd1-707ca89a61b6@arm.com

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

> ---
>   arch/arm64/kernel/cpufeature.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 5de51cb1b8fe2..75fb9a0efcc8e 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2325,14 +2325,14 @@ static bool can_trap_icv_dir_el1(const struct arm64_cpu_capabilities *entry,
>   
>   	BUILD_BUG_ON(ARM64_HAS_ICH_HCR_EL2_TDIR <= ARM64_HAS_GICV3_CPUIF);
>   	BUILD_BUG_ON(ARM64_HAS_ICH_HCR_EL2_TDIR <= ARM64_HAS_GICV5_LEGACY);
> -	if (!cpus_have_cap(ARM64_HAS_GICV3_CPUIF) &&
> +	if (!this_cpu_has_cap(ARM64_HAS_GICV3_CPUIF) &&
>   	    !is_midr_in_range_list(has_vgic_v3))
>   		return false;
>   
>   	if (!is_hyp_mode_available())
>   		return false;
>   
> -	if (cpus_have_cap(ARM64_HAS_GICV5_LEGACY))
> +	if (this_cpu_has_cap(ARM64_HAS_GICV5_LEGACY))
>   		return true;
>   
>   	if (is_kernel_in_hyp_mode())
> @@ -2863,7 +2863,7 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>   		 */
>   		.desc = "ICV_DIR_EL1 trapping",
>   		.capability = ARM64_HAS_ICH_HCR_EL2_TDIR,
> -		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
> +		.type = ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE,
>   		.matches = can_trap_icv_dir_el1,
>   	},
>   #ifdef CONFIG_ARM64_E0PD


