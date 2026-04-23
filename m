Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06F3FAD40E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 05:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IhURoVXiZaxRcRmEqt/r/UNayo0hJtxeJgTvntOeYDE=; b=bVGrqFHMZNz/oy0pqXd7FDb7uF
	rMHTEKYOO8pwkAfqFqRH/LC9s8al27RLcUW0RILAzPG2VHR68KgUoGeI4Ci8G/U0yoL8mZ6Kl68NU
	OLli8RfXspSo2M2P6EbHP+zmSHOb0WHJE1w4r4EqNhCXKZp1ZvZT7LIWnj0IhL/ISMd2R5WYmF/1m
	rZQGDCncdFKSKtUjpBOkIYLisr8IpWUUJie+gUCblBnxgUvG//8HsPOixkFKmMIBsdVgIDS2HmEEZ
	pBgOh3ZX3rUCaf4h3kGQxZn2VB/H7kY/1XE88F91ASJydgVPayIky2S7JbretLUFBA4MjctWEizQ5
	B0bkJOcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFmct-0000000B4ZU-3eaI;
	Thu, 23 Apr 2026 05:29:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFmcq-0000000B4Z5-236q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 05:29:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 839002681;
	Wed, 22 Apr 2026 22:29:10 -0700 (PDT)
Received: from [10.163.145.28] (unknown [10.163.145.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5A4A3F23F;
	Wed, 22 Apr 2026 22:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776922156; bh=a/Gferl6Ip7Lk6/VUR4Vt+kpHvJL7Ab6LWtLtcSt4GQ=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=ZH8gZLMc9xdlaBUerf0HwYAw1gGXv8e/ZiLMCaas1EpZInMLUB0uNEJwGCJFFWqES
	 yjLEbrh+efuIs0rGVT48eJZ8HEUhCTwxEm2b1XJDehUaMtshn9k9EQOWuuDW1UdyWh
	 mmNjS4XE33RvVMnFUTE1h8+6OVoItYDyW4H4qPWk=
Message-ID: <ae6f2b57-4644-424e-aab7-84042dca23e6@arm.com>
Date: Thu, 23 Apr 2026 10:59:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH] arm64: traps: Add a macro to simplify the condition codes
 check
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, mark.rutland@arm.com, kees@kernel.org, maz@kernel.org,
 ada.coupriediaz@arm.com, smostafa@google.com, leitao@debian.org,
 mrigendra.chaubey@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260320082846.1235016-1-ruanjinjie@huawei.com>
Content-Language: en-US
In-Reply-To: <20260320082846.1235016-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_222920_739897_D4E5D04A 
X-CRM114-Status: GOOD (  14.46  )
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



On 20/03/26 1:58 PM, Jinjie Ruan wrote:
> Add DEFINE_COND_CHECK macro to define the simple __check_* functions
> to simplify the condition codes check.
> 
> No functional changes.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/traps.c | 59 ++++++++++-----------------------------
>  1 file changed, 15 insertions(+), 44 deletions(-)
> 
> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> index 914282016069..6216fe9e8e42 100644
> --- a/arch/arm64/kernel/traps.c
> +++ b/arch/arm64/kernel/traps.c
> @@ -49,45 +49,21 @@
>  #include <asm/system_misc.h>
>  #include <asm/sysreg.h>
>  
> -static bool __kprobes __check_eq(unsigned long pstate)
> -{
> -	return (pstate & PSR_Z_BIT) != 0;
> -}
> -
> -static bool __kprobes __check_ne(unsigned long pstate)
> -{
> -	return (pstate & PSR_Z_BIT) == 0;
> -}
> -
> -static bool __kprobes __check_cs(unsigned long pstate)
> -{
> -	return (pstate & PSR_C_BIT) != 0;
> -}
> -
> -static bool __kprobes __check_cc(unsigned long pstate)
> -{
> -	return (pstate & PSR_C_BIT) == 0;
> -}
> -
> -static bool __kprobes __check_mi(unsigned long pstate)
> -{
> -	return (pstate & PSR_N_BIT) != 0;
> -}
> -
> -static bool __kprobes __check_pl(unsigned long pstate)
> -{
> -	return (pstate & PSR_N_BIT) == 0;
> -}
> -
> -static bool __kprobes __check_vs(unsigned long pstate)
> -{
> -	return (pstate & PSR_V_BIT) != 0;
> -}
> -
> -static bool __kprobes __check_vc(unsigned long pstate)
> -{
> -	return (pstate & PSR_V_BIT) == 0;
> -}
> +#define DEFINE_COND_CHECK(name, flag, expected)			\
> +static bool __kprobes __check_##name(unsigned long pstate)	\
> +{								\
> +	return ((pstate & (flag)) != 0) == (expected);		\
> +}
> +
> +DEFINE_COND_CHECK(eq, PSR_Z_BIT, true)
> +DEFINE_COND_CHECK(ne, PSR_Z_BIT, false)
> +DEFINE_COND_CHECK(cs, PSR_C_BIT, true)
> +DEFINE_COND_CHECK(cc, PSR_C_BIT, false)
> +DEFINE_COND_CHECK(mi, PSR_N_BIT, true)
> +DEFINE_COND_CHECK(pl, PSR_N_BIT, false)
> +DEFINE_COND_CHECK(vs, PSR_V_BIT, true)
> +DEFINE_COND_CHECK(vc, PSR_V_BIT, false)
> +DEFINE_COND_CHECK(al, 0, false)		/* Always true */

	(((pstate & 0 == 0) != 0) == false) ---> return true 

Although this looks OK but wondering if __check_al() should
be left unchanged for simplicity. OR could all its call sites
be changed assuming an unconditional 'true' return thus later
__check_al() can be dropped.

>  
>  static bool __kprobes __check_hi(unsigned long pstate)
>  {
> @@ -131,11 +107,6 @@ static bool __kprobes __check_le(unsigned long pstate)
>  	return (temp & PSR_N_BIT) != 0;
>  }
>  
> -static bool __kprobes __check_al(unsigned long pstate)
> -{
> -	return true;
> -}
> -
>  /*
>   * Note that the ARMv8 ARM calls condition code 0b1111 "nv", but states that
>   * it behaves identically to 0b1110 ("al").


