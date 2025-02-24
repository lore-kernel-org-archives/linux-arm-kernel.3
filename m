Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B20C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 04:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WiiDLS58P+ClZLkDID7ZPyVh9jbaXufL3Zxk0yrRH3U=; b=v0Iymn3pvCl/M6fI+eYpy4v2Dr
	qH3HfAObDORL+37OUZzGkndZLgHTt0jNow/sv0ss5rzIy00ih5OEOMmTeI3WLsRHuQyjKjuWDyXsV
	meDF/XeJxeuSaZRiZW0CNxuxg2N4dAXp5JDLRUSbcvOyV5HSDfd4BwU+FhwMlnGQHLqQM7s2LKwNj
	GCE29iEXiOHnzKT8J7g2yCYyYSVM68284mFmMqSPXHZj2ubsDLmB81MdTiEJgIhiLd5QJtM5dllj+
	UDjs4BaKvrnlstPjox1YHpDwRjyqG7On6hNh7IWM+mlnUDWgD+qAY3VF85s8PP1PmqYf13Ds+JBiU
	r4y8a9BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmQHl-0000000CJS1-0zdH;
	Mon, 24 Feb 2025 04:41:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmQFn-0000000CJCs-2tnC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 04:39:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EB7E152B;
	Sun, 23 Feb 2025 20:39:53 -0800 (PST)
Received: from [10.163.39.8] (unknown [10.163.39.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 430EA3F5A1;
	Sun, 23 Feb 2025 20:39:33 -0800 (PST)
Message-ID: <701e3700-d57b-4be7-97b7-add86636cece@arm.com>
Date: Mon, 24 Feb 2025 10:09:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [boot-wrapper] aarch64: Enable access into FEAT_FGT2 registers
 from EL2 and below
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Aishwarya TCV <Aishwarya.TCV@arm.com>
References: <20240730054643.157295-1-anshuman.khandual@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20240730054643.157295-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_203939_779367_AFA899FC 
X-CRM114-Status: GOOD (  16.34  )
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

On 7/30/24 11:16, Anshuman Khandual wrote:
> FEAT_FGT2 adds system registers HDFGRTR2_EL2, HDFGWTR2_EL2, HFGITR2_EL2,
> HFGRTR2_EL2 and HFGWTR2_EL2. But access into these system registers from
> EL2 and below exception levels, will trap into EL3 unless SCR_EL3.FGTEN2
> is set.
> 
> Enable access to FEAT_FGT2 registers when they are implemented. Given that
> these new FEAT_FGT2 trap registers have fields that reset to UNKNOWN values
> when resets are taken to EL3, this initialises all registers as cleared.
> 
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Hello Mark,

Below patch still applies cleanly on the latest boot wrapper mainline
with the commit ac6742520ded ("aarch64: Start Xen on Armv8-R at EL2").

Please do consider merging this patch as SCR_EL3.FGTEN2 field being set
(updated as arm64 kernel booting requirement) is required for FEAT_FGT2
based early configuration at EL2 which is now enabled via the following
series.

https://lore.kernel.org/all/20250203050828.1049370-1-anshuman.khandual@arm.com/

Without this patch kernel will not boot and will get stuck i.e trapped
into EL3.

- Anshuman

> ---
> This picks up from an earlier discussion regarding [PATCH 2/2].
> 
> https://lore.kernel.org/all/20240404073726.947215-1-anshuman.khandual@arm.com/
> 
>  arch/aarch64/include/asm/cpu.h | 7 +++++++
>  arch/aarch64/init.c            | 9 +++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
> index a5744e1..878d03d 100644
> --- a/arch/aarch64/include/asm/cpu.h
> +++ b/arch/aarch64/include/asm/cpu.h
> @@ -23,6 +23,12 @@
>  #define SCTLR2_EL1		s3_0_c1_c0_3
>  #define SCTLR2_EL2		s3_4_c1_c0_3
>  
> +#define HDFGRTR2_EL2		s3_4_c3_c1_0
> +#define HDFGWTR2_EL2		s3_4_c3_c1_1
> +#define HFGRTR2_EL2		s3_4_c3_c1_2
> +#define HFGWTR2_EL2		s3_4_c3_c1_3
> +#define HFGITR2_EL2		s3_4_c3_c1_7
> +
>  /*
>   * RES1 bit definitions definitions as of ARM DDI 0487G.b
>   *
> @@ -63,6 +69,7 @@
>  #define SCR_EL3_SCTLR2En		BIT(44)
>  #define SCR_EL3_PIEN			BIT(45)
>  #define SCR_EL3_D128En			BIT(47)
> +#define SCR_EL3_FGTEN2			BIT(59)
>  
>  #define HCR_EL2_RES1			BIT(1)
>  
> diff --git a/arch/aarch64/init.c b/arch/aarch64/init.c
> index c9fc7f1..b4d64a0 100644
> --- a/arch/aarch64/init.c
> +++ b/arch/aarch64/init.c
> @@ -68,6 +68,15 @@ void cpu_init_el3(void)
>  	if (mrs_field(ID_AA64MMFR0_EL1, FGT))
>  		scr |= SCR_EL3_FGTEN;
>  
> +	if (mrs_field(ID_AA64MMFR0_EL1, FGT) >= 2) {
> +		scr |= SCR_EL3_FGTEN2;
> +		msr(HDFGRTR2_EL2, 0);
> +		msr(HDFGWTR2_EL2, 0);
> +		msr(HFGITR2_EL2, 0);
> +		msr(HFGRTR2_EL2, 0);
> +		msr(HFGWTR2_EL2, 0);
> +	}
> +
>  	if (mrs_field(ID_AA64MMFR0_EL1, ECV) >= 2)
>  		scr |= SCR_EL3_ECVEN;
>  

