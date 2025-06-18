Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C64DC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 10:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rtm/KpCmUTfZ0pnZbv3Q+GEf/Z/QhBoddh9QB9ffuHE=; b=2M3eYiiJjexj4C
	mFDS69X2j7y7nODO8mjN6v2ANQljWbxHB6kpiqlaPiU9v0i0K6d46GVWpG4jwHIkt7vvN/uyxY6gj
	hQo/+FzLIfyvchLUXE0PLjnVJgF9Nmi7QZ5KonsRneANZsI3MaEIwdRoqs+IJ4RhsiAd3PU9fQlxZ
	u293lre15C+ywNl1ir8so6PiaJG8pQqV6lCuAfpsR4zKfrNlcsokmemGhBWIlNURIv7onpaYP4J5I
	Hl1auEd1bUBSgg4MLVxljF2ETIOAlL/U40ejY5LJdIvCyMZYrt/B9QTR6ngUaeMHHfc19UdQuJpKB
	Bz3MlTI+h5oZ8a/0p2qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRqSe-00000009rFP-2GXv;
	Wed, 18 Jun 2025 10:56:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpoW-00000009jnk-3u7g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:14:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8671614BF;
	Wed, 18 Jun 2025 03:14:17 -0700 (PDT)
Received: from [10.1.31.181] (e137867.arm.com [10.1.31.181])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E2AE3F66E;
	Wed, 18 Jun 2025 03:14:36 -0700 (PDT)
Message-ID: <d220ee7d-d774-45e8-b18d-713255fec97b@arm.com>
Date: Wed, 18 Jun 2025 11:14:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/13] arm64: debug: split single stepping exception
 entry
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
References: <20250609173413.132168-1-ada.coupriediaz@arm.com>
 <20250609173413.132168-10-ada.coupriediaz@arm.com>
 <413d61bf-807e-406f-97a7-180ed7eef2e0@arm.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <413d61bf-807e-406f-97a7-180ed7eef2e0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_031441_014050_0B523622 
X-CRM114-Status: GOOD (  14.55  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 18/06/2025 07:25, Anshuman Khandual wrote:

> On 09/06/25 11:04 PM, Ada Couprie Diaz wrote:
>> [...]
>>
>> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
>> index 74ffdfeff76f..3f5503d61aee 100644
>> --- a/arch/arm64/kernel/debug-monitors.c
>> +++ b/arch/arm64/kernel/debug-monitors.c
>> @@ -21,6 +21,7 @@
>>   #include <asm/cputype.h>
>>   #include <asm/daifflags.h>
>>   #include <asm/debug-monitors.h>
>> +#include <asm/exception.h>
>>   #include <asm/kgdb.h>
>>   #include <asm/kprobes.h>
>>   #include <asm/system_misc.h>
>> @@ -188,18 +189,10 @@ static void send_user_sigtrap(int si_code)
>>   			      "User debug trap");
>>   }
>>   
>> -static int single_step_handler(unsigned long unused, unsigned long esr,
>> -			       struct pt_regs *regs)
>> +void do_softstep(unsigned long esr, struct pt_regs *regs)
> do_softstep() has been chosen here just to match the corresponding ESR
> macros ESR_ELx_EC_SOFTSTP_[LOW|CUR] - although it does make sense and
> also consistent.
Exactly, that was the thinking !
>>   {
>> -	/*
>> -	 * If we are stepping a pending breakpoint, call the hw_breakpoint
>> -	 * handler first.
>> -	 */
>> -	if (try_step_suspended_breakpoints(regs))
>> -		return 0;
> This check has been moved individual exception handling functions.
Correct, as per explanation in the commit message
>> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
>> index be2add6b4ae3..5fb636efd554 100644
>> --- a/arch/arm64/kernel/entry-common.c
>> +++ b/arch/arm64/kernel/entry-common.c
>> @@ -535,6 +535,24 @@ static void noinstr el1_breakpt(struct pt_regs *regs, unsigned long esr)
>>   	arm64_exit_el1_dbg(regs);
>>   }
>>   
>> +static void noinstr el1_softstp(struct pt_regs *regs, unsigned long esr)
>> +{
>> +	arm64_enter_el1_dbg(regs);
>> +	if (!cortex_a76_erratum_1463225_debug_handler(regs)) {
> Although mentioned in the commit message, this constraint is not
> there in the present code though.
I believe it is : in mainline it is done for all EL1 debug exceptions in 
`el1_dbg()`[0], unless I misunderstood your comment ?

Thanks for the review Anshuman !
Ada

[0]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/kernel/entry-common.c#n507


