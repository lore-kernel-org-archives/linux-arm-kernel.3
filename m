Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECED2C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 04:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3l9h9kzXCzNPyB9TNy0M/8bdxnPvgixBin9kyh7slkM=; b=OTR89eO7uZjKrIa6T8QJwiQydY
	VxgA+f3jZmSkwD+5ZF2XkZMDU18zf+6pKmEuUVnoigzTOTuhWMFP5RJ0cyxOuHnmXaPt76clXinm4
	pYOP0lyB92/ktqYiZsg1bABxawyt/x5rzR2IggGxP0vqAPrEoDdyKasnJ21nKysdimfYl9LMOI5/a
	v99MZZFQOyyUPjpwACypHlU7gbo4OHFEz8IaVz9j+yC8sZmy/dbb33hxMbkZeOvKxbZp+r3Ot8rwD
	ydep595nqHlEzlf2jK1/ms2uy077TrqP/qgWz9kQSprZe7fasgoaXfuykfRweeyqQNMcML1MiM8nv
	0BDrDzmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9zNA-0000000Bh8D-2LRh;
	Wed, 30 Apr 2025 04:48:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9zLJ-0000000Bh1A-08Jj
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Apr 2025 04:46:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3l9h9kzXCzNPyB9TNy0M/8bdxnPvgixBin9kyh7slkM=; b=pO9B731AwQcn6F258GQLSj0Ude
	N2xCly16X0zg1OgrwmrUGgi84NorT+oH/Q+Y+OQfbY+E2T6H81INugMnGhKZia6V3aJUEI71vbVUY
	v4boazQp9HI5UGph0WhXEBtWQzT3qVaCeEca8kBX/W/6A0pKEVEtbjjE78YdTJ/zBJZmRH+CPaMj6
	Oe1dtd2bAw3s2ZS3jN/pVTsTT78e6HzNrSIlRbq+9EyBkyZET95THk8oUNUOO+PHwpnNTtTfFBL5R
	AnyVpuTyE8x8VQ53Pf78FgfWp87yfqqHXMmTXuBnGoWIZKC9tOnvAMWN7J1FLHjk6wZXo1Y2DhV2L
	fgYfyKtw==;
Received: from wiki.tkos.co.il ([84.110.109.230] helo=mail.tkos.co.il)
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9zLE-0000000DgiN-2M0W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 04:46:43 +0000
Received: from localhost (unknown [10.0.8.2])
	by mail.tkos.co.il (Postfix) with ESMTP id 1B2EB440FAF;
	Wed, 30 Apr 2025 07:46:32 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1745988392;
	bh=mMI88qDymEONKxtVSTHe+g1HfuP4klqbcXp3kKc/M8M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oInRrprgyKP9+ZoiF8lBKUMFeCZQgwef2HFpZX01V97/z2uZfi9YC8xRWrACgXEro
	 Zdf3Ilwf95TcWhui2z07yIa0MSlXf1b5oNEiCqrSI0zBs1+2Faq0cE/9OoonR7x1JR
	 npqlrNQYs2EipR0xiW7KyS5s8k+bXfvEOMgCK/cfx7LXXaAt7QUd2GBKUIEv2lSqYH
	 oRddNsGvOW+An/IZX4AtOgMqDYDlizLGVuVzmCPwxN5OtzSJ+3lfdHAWiIcsUEOdj2
	 zXRwME+vURia0myqgHDH7bkPcZauPt2q+lATuoq+Zk6q/jGIPZBpk31DiYn2SpU4P+
	 6zQXViGQwPNCg==
From: Baruch Siach <baruch@tkos.co.il>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64/traps: show fault address in exception trace
In-Reply-To: <20250429153352.GA26610@willie-the-truck> (Will Deacon's message
	of "Tue, 29 Apr 2025 16:33:53 +0100")
References: <2a16075bce75fa68450edb16f5712e265d7cc45a.1745910924.git.baruch@tkos.co.il>
	<20250429153352.GA26610@willie-the-truck>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 30 Apr 2025 07:46:32 +0300
Message-ID: <874iy62r4n.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_054641_188535_27C513F9 
X-CRM114-Status: GOOD (  15.82  )
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

Hi Will,

On Tue, Apr 29 2025, Will Deacon wrote:
> On Tue, Apr 29, 2025 at 10:15:24AM +0300, Baruch Siach wrote:
>> The FAR (fault address) register provides useful information when
>> debugging an unhandled exception.
>> 
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>>  arch/arm64/kernel/traps.c | 11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
>> 
>> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
>> index 4e26bd356a48..14eb598e33a7 100644
>> --- a/arch/arm64/kernel/traps.c
>> +++ b/arch/arm64/kernel/traps.c
>> @@ -239,7 +239,7 @@ void die(const char *str, struct pt_regs *regs, long err)
>>  		make_task_dead(SIGSEGV);
>>  }
>>  
>> -static void arm64_show_signal(int signo, const char *str)
>> +static void arm64_show_signal(int signo, const char *str, unsigned long far)
>>  {
>>  	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
>>  				      DEFAULT_RATELIMIT_BURST);
>> @@ -256,6 +256,7 @@ static void arm64_show_signal(int signo, const char *str)
>>  	pr_info("%s[%d]: unhandled exception: ", tsk->comm, task_pid_nr(tsk));
>>  	if (esr)
>>  		pr_cont("%s, ESR 0x%016lx, ", esr_get_class_string(esr), esr);
>> +	pr_cont("FAR 0x%016lx, ", far);
>
> Are you sure the FAR is always valid here? For example, if we're delivering
> a SIGILL due to an undefined instruction.

A user interested in hardware exception information should be in a
position to know whether this information is valid. But I guess that FAR
can't be valid when ESR isn't valid either.

> Also, once you have the PC and the registers (both of which we print),
> it's not too hard to dig the instruction out of the binary and figure out
> the faulting address that way.

I find FAR helpful to confirm the analysis of the instruction being
executed and its operands. The cost for adding this bit of information
isn't huge, I think.

Thanks for your review,
baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

