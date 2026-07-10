Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF4EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 07:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUa7DZbhsQboJ+Chnv3Mgr8RN3AmK99dbjpYnbpPvDc=; b=kF3hPy6aoePSO/LDtJZbivBzez
	X4DNr3TcAClp68cuG74rRhuBjHxAfQEM9AZkCDLWBcDjtYV5SuqspB8qn+QFeY/IW0VEAM/J0rk/L
	dHEBEJbPdzjlnyFJZA1jOwu42hGP+jf2HqqaYs+RofVbGQagb8HUnrNZ9Eew4tVIJdbMOBPhJHc0o
	Y7MeVGdn9upWRSwGkNkncS7GkHm2tpXXh6MiKCZsaiazhJ3K0sQdkgSYofsEUDEe+iQ8hhtTsrA++
	fB/q9U2JzhAUXB9OYRhKTFJ7YrSk/igTcLvYhXYIMzImle5eNUTuCWgENbq2sVnjsjE/LoKaRL9WV
	r84iyCTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi5P4-00000004KO4-28Kd;
	Fri, 10 Jul 2026 07:12:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi5P2-00000004KNe-10Px
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 07:12:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A40FE1D15;
	Fri, 10 Jul 2026 00:11:58 -0700 (PDT)
Received: from [10.174.42.251] (unknown [10.174.42.251])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 394E83F85F;
	Fri, 10 Jul 2026 00:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783667522; bh=LIhHFkUiltZtj08irokwyO3MShHeKRDKuNGX5OJmL4g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pIMEfLzC+3sFc/r5reUIIwXBd9bpXZCv4CGqwuO+u6xgo0AuHtSkN8bcFESPlD977
	 Z7QF7VwHUjUKIW6RfVi/dPjqxbVGR2pHTs8nvyNRRL1uGtahfal2QeCfBmT+xCdOsS
	 aVQ95217l2kxlNre2HNMjexBHQLJTKXrnLv39BmA=
Message-ID: <11d99a7c-50f9-4a4d-a75b-ef11cf3371af@arm.com>
Date: Fri, 10 Jul 2026 12:41:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: cpufeature: Detect BBML3 based on MMFR2 ID
To: Linu Cherian <linu.cherian@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260708144331.679816-1-linu.cherian@arm.com>
 <20260708144331.679816-7-linu.cherian@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260708144331.679816-7-linu.cherian@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_001204_331880_62DDE3AF 
X-CRM114-Status: GOOD (  18.78  )
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

Please do mention full register field here

arm64: cpufeature: Detect BBML3 based on ID_AA64MMFR2_EL1.BBM

On 08/07/26 8:13 PM, Linu Cherian wrote:
> Add MMFR2 ID based BBML3 feature detection, so

Ditto ^^^^^^^^^^^^

> that compliant cpus doesn't need to be added to the
> midr list.

Could be reworded as :

Add ID_AA64MMFR2_EL1.BBM based BBML3 feature detection in
cpu_supports_bbml3() so that cpus with the feature would
not have to be added into MIDR based supports_bbml3_list.

> 
> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> ---
>  arch/arm64/kernel/cpufeature.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index e9ecaa036479..3f4a36f152d0 100644
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
> @@ -2153,15 +2159,10 @@ bool cpu_supports_bbml3(void)
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

With the minor changes to the commit message above.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

