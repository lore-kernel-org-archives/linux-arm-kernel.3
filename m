Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109E4C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 16:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=97146bnRb7DxtMXOPgE74bkmGZFjflM8kH4CqT8MYJM=; b=Eo9KUJpMt77Mty
	nU2ZxNDUkF4T9u9cAHu/FdjSn2NLhICB086LX9YMyX2+Uq8h9GuL0LIUD0+Dk5NvL/Gr7TK1zfM05
	Wo2cBeIRkYU4RkGd6QrzJLzJfbhEaN2CnLUUOmCDwy2cndsAEWKmNjkCBjzyNxd3K+24kGspYe9zc
	4aH4d4GKGmB16wxILHwBZ1fhxXrSHsrgQ2lcZh4P3dxddUtMoutr3fFpcOA8k0PrlYt3pf1gR3hyF
	JZbi6gHr3M8YepMEmS87Un9N7v0mLoX455CBXUJGFZzGUM4H/7Zga+5kE0phkabBNtuoZz7JBKq+t
	hWkQrIzznyewdfuXppew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLVB-0000000CkL2-2E4q;
	Tue, 06 May 2025 16:50:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCI4Y-0000000C2ht-19QJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 13:10:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C48A1007;
	Tue,  6 May 2025 06:10:45 -0700 (PDT)
Received: from [10.1.39.190] (e137867.arm.com [10.1.39.190])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74C083F5A1;
	Tue,  6 May 2025 06:10:53 -0700 (PDT)
Message-ID: <0be8e3be-a029-4eea-a79c-310b8e0a05c3@arm.com>
Date: Tue, 6 May 2025 14:10:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/debug: Drop redundant DBG_MDSCR_* macros
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 inux-arm-kernel@lists.infradead.org
References: <20250417105253.3188976-1-anshuman.khandual@arm.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250417105253.3188976-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_061058_364043_A46C94FD 
X-CRM114-Status: GOOD (  14.71  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Anshuman,

On 17/04/2025 11:52, Anshuman Khandual wrote:
> MDSCR_EL1 has already been defined in tools sysreg format and hence can be
> used in all debug monitor related call paths. Subsequently all DBG_MDSCR_*
> macros become redundant and hence can be dropped off completely. While here
> convert all variables handling MDSCR_EL1 register as u64 which reflects its
> true width as well.
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---

I think the changes make sense, even more so given that `kvm/debug.c` 
already uses the sysreg format definition for MDSCR_EL1.

It looks good to me, but I think there is a missing conversion to 64 
bits below.
Would it make sense to convert the two instances of MDSCR_EL1 used in 
`tools/testing/selftests/kvm/arm64/debug-exceptions.c`, in 
`enable_monitor_debug_exceptions()` and `install_ss()` , to 64 bits as 
well ? (They don't rely on `DBG_MDSCR_*`, the test defines its own macros)

> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index b260ddc4d3e9..6dbfc1008007 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -354,7 +354,7 @@ static void cortex_a76_erratum_1463225_svc_handler(void)
>   
>   	__this_cpu_write(__in_cortex_a76_erratum_1463225_wa, 1);
>   	reg = read_sysreg(mdscr_el1);
> -	val = reg | DBG_MDSCR_SS | DBG_MDSCR_KDE;
> +	val = reg | MDSCR_EL1_SS | MDSCR_EL1_KDE;
>   	write_sysreg(val, mdscr_el1);
>   	asm volatile("msr daifclr, #8");
>   	isb();

Given the change of width to 64 bits elsewhere, shouldn't we change val 
and reg to u64 here as well ?

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 73cf6a5f41d8..d61a5ddf53d6 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -344,7 +344,7 @@ static DEFINE_PER_CPU(int, __in_cortex_a76_erratum_1463225_wa);
  
  static void cortex_a76_erratum_1463225_svc_handler(void)
  {
-	u32 reg, val;
+	u64 reg, val;
  
  	if (!unlikely(test_thread_flag(TIF_SINGLESTEP)))
  		return;

Thanks,
Ada


