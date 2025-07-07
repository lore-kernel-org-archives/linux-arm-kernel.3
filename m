Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F324C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 12:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIzGGYc3nmh6gqf03YNXBOi0rKed8aHgZaZaNVeVpX8=; b=XlL8R2xYR5mAiD
	yOGyryndoUWNhknJOU9diw/XMfH7H51zw0/FySa6jNHdYoS3+nxtMovO3fBUjkOMFEqZtt5RPJih6
	g1tUAks5OX3TCCzUUQoZJTNZxtmlQv4TQVSMeyHHEMG44zpVDRdn3CpbMnckA7xHd1w5l5S5mZjxX
	5HHpZvZLQTv4J4Z53qR2VrjQCmytFGqdezHpg1ebqcfnwKL/S2WPviygpO6U6nAIuck7Z7uQmicAV
	Ks1Rw7b490e5q9GTcIDYw3P/ffhlD31M784HWGF3OO0gL3AbbrKdXTi+WJ1lD2H6hZUzfdlZomkzY
	6JielbaBXiYlY+eNchpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYl8O-00000002RUB-3rEs;
	Mon, 07 Jul 2025 12:39:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYkKz-00000002KUE-0UeJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 11:48:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8314168F;
	Mon,  7 Jul 2025 04:48:31 -0700 (PDT)
Received: from [10.1.31.174] (e137867.arm.com [10.1.31.174])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5418E3F694;
	Mon,  7 Jul 2025 04:48:43 -0700 (PDT)
Message-ID: <548d736e-1578-4dac-9713-8c9d98d84beb@arm.com>
Date: Mon, 7 Jul 2025 12:48:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/13] arm64: debug: split hardware watchpoint
 exception entry
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20250627172038.633423-1-ada.coupriediaz@arm.com>
 <20250627172038.633423-11-ada.coupriediaz@arm.com>
 <aGgQI4c7MFmQ48tI@willie-the-truck> <aGsY6c4syByZQ8cr@arm.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <aGsY6c4syByZQ8cr@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_044845_202821_DE714CC3 
X-CRM114-Status: GOOD (  15.36  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Luis Claudio R . Goncalves" <lgoncalv@redhat.com>, linux-arm-kernel@lists.infradead.org, Anshuman Khandual <anshuman.khandual@arm.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Catalin, Will

On 07/07/2025 01:46, Catalin Marinas wrote:
> On Fri, Jul 04, 2025 at 06:32:19PM +0100, Will Deacon wrote:
>> On Fri, Jun 27, 2025 at 06:20:35PM +0100, Ada Couprie Diaz wrote:
>>> +static void noinstr el1_dbg(struct pt_regs *regs, unsigned long esr)
>>> +{
>>>   	arm64_enter_el1_dbg(regs);
>>>   	if (!cortex_a76_erratum_1463225_debug_handler(regs))
>>>   		do_debug_exception(far, esr, regs);
>> This leads to:
>>
>> Failed to build patch #10: 0d0a8f024a19 arm64: debug: split hardware watchpoint exception entry
>> arch/arm64/kernel/entry-common.c: In function ‘el1_dbg’:
>> arch/arm64/kernel/entry-common.c:572:36: error: ‘far’ undeclared (first use in this function)
>>    572 |                 do_debug_exception(far, esr, regs);
>>        |                                    ^~~
>>
>>
>> Catalin -- do you reckon we should fix this? [...]
> Works for me, no-one pulled this branch and rely on it being stable. If
> Ada sends a fixup, I can fold it into this patch or merge a new series
> altogether if more patches are affected (or you can do it I don't get to
> a reasonable wifi location in the next few days).
>
> Thanks.
>
I'm glad that fixing my mistakes shouldn't be too big of an issue.
Just to be sure I built every patch individually with my test config,
base defconfig and allnoconfig : the last one surfaced another issue
with Patch 11 when building without COMPAT, so I sent a v6 to fix both.

My apologies for the build issues in this series : that's a lesson 
learned for
future ones. I'll be doing a lot more test builds to try to prevent 
repeating
this situation.

Thanks,
Ada

