Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFE1CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 02:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgrzDoTDnVe3oWSsgool6kQWXp51mPFIDTsafUb9L8o=; b=aXASQX1iSU+2CWyKDpSC3J0IPE
	HscQLegFs3+s7OZNl4/GFxtin6IwIxFCUoYNo0N54aKBUU0UgDSSiR/9reCcUL+Jx/Cdjqz1exqIo
	Surof3e7aLajr+uTsPbtCLzsizdKMC4nLcF+OWn7NSc13oJJI9aHwFl5R4giKn5duXXIyKeiwUVNW
	QEIqEWLdJvi23BfPqOlOP2voO/2ubvpzMkotEnRtr3pj6QcjVTCxf3HbyAPqO5XnbS8d4jwFzxEcw
	iW8FdYin+4OnH+BYHJmm7vx2jX/vA8EodZJAmjPFx/au7fGAxZgcOnXoaQ6tCCX8ToX3qurorRkSI
	kJh+dcyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOoGi-0000000HSsp-2uJ8;
	Fri, 28 Nov 2025 02:31:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOoGf-0000000HSsS-3stP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 02:31:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A8391575;
	Thu, 27 Nov 2025 18:31:20 -0800 (PST)
Received: from [10.164.18.52] (unknown [10.164.18.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C13E13F73B;
	Thu, 27 Nov 2025 18:31:25 -0800 (PST)
Message-ID: <9900ca30-4d57-4a38-b319-b76d57038e52@arm.com>
Date: Fri, 28 Nov 2025 08:01:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Remove unreachable break after die
To: Mark Rutland <mark.rutland@arm.com>,
 Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: smostafa@google.com, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20251126222620.215245-1-osama.abdelkader@gmail.com>
 <aSgX-br67x5Y-kBZ@J2N7QTR9R3>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aSgX-br67x5Y-kBZ@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_183130_036573_0D263EEA 
X-CRM114-Status: GOOD (  15.20  )
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



On 27/11/25 2:50 PM, Mark Rutland wrote:
> On Thu, Nov 27, 2025 at 12:26:20AM +0200, Osama Abdelkader wrote:
>> die() never returns, the break is unreachable in arch/arm64/kernel/traps.c
> 
> Is the break causing some problem, e.g. a compiler warning?
> 
> If not, then I don't see a reason to remove the break.
> 
> There are many other instances of "die(...); break" throughout the
> kernel, and this doesn't seem to be speecial.

Agree with Mark. From switch case semantics perspective a break is expected
here regardless what happens to control flow.

> 
> Mark.
> 
>> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
>> ---
>>  arch/arm64/kernel/traps.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
>> index 681939ef5d16..81dd2d7759eb 100644
>> --- a/arch/arm64/kernel/traps.c
>> +++ b/arch/arm64/kernel/traps.c
>> @@ -1003,7 +1003,6 @@ int bug_brk_handler(struct pt_regs *regs, unsigned long esr)
>>  	switch (report_bug(regs->pc, regs)) {
>>  	case BUG_TRAP_TYPE_BUG:
>>  		die("Oops - BUG", regs, esr);
>> -		break;
>>  
>>  	case BUG_TRAP_TYPE_WARN:
>>  		break;
>> -- 
>> 2.43.0
>>
> 


