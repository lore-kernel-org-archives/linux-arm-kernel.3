Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D769CC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 11:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zeB7VmVYEWnVWSjKRGbNq5rZJ+h59JcKdBHewoHcTeE=; b=lvFg40NHIxRSF+
	qDQ3BXzOlW3X3YprewsFdW7OHpAgBMyDmw1P6buLJcuTgKUaPf6netYsmlk5RvelxfeeGeNwsY2dd
	90ckXveIDcCmKZF16dzrzRQabd4IXJe30YjOz/V4cRrXFnEuxmoJC06g9tMOjJs1Npe7m1F96+j3R
	apAg0lR4hCL4V1VgbMNV99M8ncH5h7LjE+QU55o4MpwRowYApkdiJNqePR1aZ7d3+qC+p0X2HagPC
	SGUtL/VWqL0seZD7bJfFCTxrUwN3aFF4sZmL0NKdCj/q8OfgYqgX/bvmO+L23ufMV5LL9bSJXHi0X
	OHr8DoDaUs+aHGberNYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbJI-0000000Fb28-1UP5;
	Thu, 29 May 2025 11:20:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKaoW-0000000FXmn-2Xcw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 10:48:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77B0E1758;
	Thu, 29 May 2025 03:48:27 -0700 (PDT)
Received: from [10.57.48.123] (unknown [10.57.48.123])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D4A43F673;
	Thu, 29 May 2025 03:48:42 -0700 (PDT)
Message-ID: <07795dd2-549b-4b4c-815f-fbabfa94b470@arm.com>
Date: Thu, 29 May 2025 11:48:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] arm64: debug: split single stepping exception
 entry
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <20250512174326.133905-8-ada.coupriediaz@arm.com>
 <20250520162913.GA19155@willie-the-truck>
 <aDcqHaQx6favgsoK@J2N7QTR9R3.cambridge.arm.com>
 <20250529101053.GA29082@willie-the-truck>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250529101053.GA29082@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_034844_691904_A2D5FE38 
X-CRM114-Status: GOOD (  13.41  )
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
Cc: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On 29/05/2025 11:10, Will Deacon wrote:
> On Wed, May 28, 2025 at 04:22:05PM +0100, Mark Rutland wrote:
>> On Tue, May 20, 2025 at 05:29:14PM +0100, Will Deacon wrote:
>>> On Mon, May 12, 2025 at 06:43:22PM +0100, Ada Couprie Diaz wrote:
>>>> +	enter_from_user_mode(regs);
>>>> +	/*
>>>> +	 * After handling a breakpoint, we suspend the breakpoint
>>>> +	 * and use single-step to move to the next instruction.
>>>> +	 * If we have a suspended breakpoint there's nothing more to do:
>>>> +	 * complete the single-step.
>>>> +	 */
>>>> +	if (reinstall_suspended_bps(regs)) {
>>>> +		local_daif_restore(DAIF_PROCCTX);
>>>> +		do_softstep(esr, regs);
>>>> +	}
>>>> +	exit_to_user_mode(regs);
>>> I quite like the look of this now, but perhaps we could rename
>>> reinstall_suspended_bps() and change the return value to make things a
>>> bit more readable? For example, 'if (!stepped_suspended_breakpt(regs))'
>>> or something like that? What do you think?
>> How about:
>>
>> 	if (!try_step_suspended_breakpoints(regs))
>>
>> ... that'd match the naming in do_el0_undef() and do_el1_undef() in
>> traps.c, where we have try_${HANDLE_POTENTIAL_CASE}() for a few cases,
>> e.g.
> That's even better, thanks.
>
> Will

Happy to rename ! I think it will make the whole stepping logic easier 
to understand.

Thanks both,
Ada


