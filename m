Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E849C71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 15:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WSLUzLdMtQ1rJRPmapTdA2fV08QDe4Px3iAT5+2SWVI=; b=RlC5RF7PeNX3TK
	iPVBuGNewgXdms+AC9OqeYqTC7tvPuZihjAtKFxQVML75fBOrkEJaoyNxDSlLDqTSfpcFiK1w+DxS
	TwXdQ8MwWJkAqC+agKT/ZbD1gC9NN9xJjtlfTWXVF6gMz7ykfa0vVe60rFEIbvbqf/FXlhpMgX/Nr
	gJQmkwlzm8siIEnIpnogPxrCMUS3Qo84uWuXEhisNwqZ+a/NZa124997Ehdg0FZ199c/lU/KZ4nE8
	Gp+iPJ2+TSgGJSwFpWBDHnVvCe87iKEon5cFcyK2Da/0bjbwAMDClS061x+LJ1On1jMqFtZDo8wOv
	kVRKzOOdV9sEsWpQ9K9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBjm-00000004qaJ-3zUR;
	Mon, 16 Jun 2025 15:27:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9uG-00000004Y2d-1i3e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 13:29:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA479150C;
	Mon, 16 Jun 2025 06:29:23 -0700 (PDT)
Received: from [10.1.26.178] (e137867.arm.com [10.1.26.178])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDBBF3F673;
	Mon, 16 Jun 2025 06:29:43 -0700 (PDT)
Message-ID: <5e7afdfa-1f03-4914-a58e-1dcb05c26199@arm.com>
Date: Mon, 16 Jun 2025 14:29:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/13] arm64: debug: call software break handlers
 statically
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
References: <20250609173413.132168-1-ada.coupriediaz@arm.com>
 <20250609173413.132168-4-ada.coupriediaz@arm.com>
 <15c103f5-fd7a-4960-b984-4055a745aa5a@arm.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <15c103f5-fd7a-4960-b984-4055a745aa5a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_062948_486636_F4CE0829 
X-CRM114-Status: GOOD (  17.83  )
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

On 13/06/2025 07:11, Anshuman Khandual wrote:

> A small nit - s/break handlers/break point handlers/
You are right, checking again I was using too small a character limit 
for the summary line (55), which is not relevant. I will write 
`breakpoint` in full, I wasn't happy about leaving it out !
> On 09/06/25 11:04 PM, Ada Couprie Diaz wrote:
>> [...]
>>
>> Unify the naming of the software breakpoint handlers to XXX_brk_handler(),
>> making it clear they are related and to differentiate from the
>> hardware breakpoints.
> Unless absolutely necessary - could we please move these renames into a
> separate patch in itself instead ? That will reduce the churn and help
> the reviewers see the functional changes more clearly.
Fair enough, I can move the renames to a later patch to avoid renaming 
in all the places
that get removed in this patch.

Would it make sense to combine it with the single step handler renames 
in this case,
or would it be better to have two independent commits ?
>> [...]
>>    
>>   void __init trap_init(void)
>>   {
>> -	register_kernel_break_hook(&bug_break_hook);
>> -#ifdef CONFIG_CFI_CLANG
>> -	register_kernel_break_hook(&cfi_break_hook);
>> -#endif
>> -	register_kernel_break_hook(&fault_break_hook);
>> -#ifdef CONFIG_KASAN_SW_TAGS
>> -	register_kernel_break_hook(&kasan_break_hook);
>> -#endif
>> -#ifdef CONFIG_UBSAN_TRAP
>> -	register_kernel_break_hook(&ubsan_break_hook);
>> -#endif
>>   	debug_traps_init();
>>   }
> debug_traps_init() can be renamed as trap_init() and just drop this
> redundant indirection. All applicable comments can also be changed
> as required there after.
I understand what you mean, but I would be tempted to not change it,
with the following reasons :
  - `debug_traps_init()` gets removed entirely in the last commit,
  - having `trap_init()` in `traps.c` makes more sense than 
`debug-monitors.c` to me
  - `trap_init()` ends up empty at the end of the series, it could make 
sense to simply
    remove it entirely, given there is an empty weak definition in 
`init/main.c` already.

What do you think ?

Thanks,
Ada

