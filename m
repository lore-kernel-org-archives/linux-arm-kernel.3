Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6B8C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 06:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/vDHVLfxg8qgMLW6CiAwQ3F24tx77/8H67nEjBJEs0=; b=mSxilAxSjelrSNbUgengzieA37
	pSLuF85P9qZUbze7ccVW89niaOVUSkwlG60jbKs6zsTXE79JGlapaBUFKo7tuy3+BXLHGnYx9647m
	FjkdzAS5Sn8RfLtN9BXdIpbJT4EhstS4dnXJlwLZya9t7P3eAjcHJckjQJaycl+8Nu8cZeJJMa0Mb
	QVqYRuj9XWzaTy3+Sw5bEwfoBO0VIwNXlZQc1gnGpLBPmv9YQrxs1N+x5feNB5RGC6+hR7fsdwtsn
	SnBQLsOtA5cOtQUZQ3ETdLM9vCAaD0VPuN8r1hfUVM7JhvhuhSH+TubTuTpPrFsH9CA2t3eSah9JA
	nLdp5G+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjtIS-0000000DvJT-35X2;
	Wed, 15 Jul 2026 06:40:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjtIN-0000000DvI6-3jH8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 06:40:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54A76339;
	Tue, 14 Jul 2026 23:40:33 -0700 (PDT)
Received: from [10.164.18.40] (unknown [10.164.18.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 288863F7B4;
	Tue, 14 Jul 2026 23:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784097637; bh=bLAfLzVt7ntqmSXbOeKwwpHZAStHJPdoa/I97we9o4U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AW1sDgytLZzTWH9K2UrxVzozwdDizwhFfha8bmtyWfqsg4w8ZklLbH8smj3Iv4tAQ
	 vuB2FsUcRB9ML2waDsPFXZMBu4ypvQg8MR9K/tQwdn/51oyiiSzYr3WFDTVMYeYxtH
	 hGxTRmkGoyM8GLKSPw6GY3cqIe5KWwaU5Sha44X4=
Message-ID: <3360aad7-2884-4fc2-8fe9-e0ea767c9ee3@arm.com>
Date: Wed, 15 Jul 2026 12:10:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] arm64: cpufeature: Detect BBML3 based on
 ID_AA64MMFR2_EL1.BBM
To: Linu Cherian <linu.cherian@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260715053408.1950475-1-linu.cherian@arm.com>
 <20260715053408.1950475-7-linu.cherian@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260715053408.1950475-7-linu.cherian@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_234040_053517_50A7E805 
X-CRM114-Status: GOOD (  17.59  )
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



On 15/07/26 11:04 AM, Linu Cherian wrote:
> Add ID_AA64MMFR2_EL1.BBM based BBML3 feature detection in
> cpu_supports_bbml3() so that cpus with the feature would
> not have to be added into MIDR based supports_bbml3_list.
> 
> Signed-off-by: Linu Cherian <linu.cherian@arm.com>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  arch/arm64/kernel/cpufeature.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 25a705e02618..b58fdcb35406 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2133,6 +2133,12 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
>  
>  bool cpu_supports_bbml3(void)
>  {
> +	u64 mmfr2;
> +
> +	mmfr2 = __read_sysreg_by_encoding(SYS_ID_AA64MMFR2_EL1);
> +	if (SYS_FIELD_GET(ID_AA64MMFR2_EL1, BBM, mmfr2) >= ID_AA64MMFR2_EL1_BBM_3)
> +		return true;
> +
>  	/* CPUs that support BBML3 but dont advertise through MMFR2 ID */
>  	static const struct midr_range supports_bbml3_list[] = {
>  		MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
> @@ -2154,15 +2160,10 @@ bool cpu_supports_bbml3(void)
>  		{}
>  	};
>  
> -	if (!is_midr_in_range_list(supports_bbml3_list))
> -		return false;
> -
> -	/*
> -	 * We currently ignore the ID_AA64MMFR2_EL1 register, and only care
> -	 * about whether the MIDR check passes.
> -	 */
> +	if (is_midr_in_range_list(supports_bbml3_list))
> +		return true;
>  
> -	return true;
> +	return false;
>  }
>  
>  static bool has_bbml3(const struct arm64_cpu_capabilities *caps, int scope)


