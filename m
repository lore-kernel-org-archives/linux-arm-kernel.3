Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46335CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=keU8PcnjbVhAK3OnaV9nppl6bhqskPEQ3+Ihd65A/Hs=; b=sWvleMakzkIbphkJ9aOhIHjF1t
	nuZl7ZVwcpSPpYoV6lLi+vwRwhgjjcamYvgI304XGdqbfUuHcZgHKlBkCJqR8hVyJ+QsFbc7uzm1i
	6CVkmjVMCvSME/t0/W4h7UJSW/PLGmCplgLeFTiM1caJi9KHSDoIbqXw39C3ABVOeJbCjqju1uYYE
	dQzBwV7vH7vDbXLoFhnW4WlmiTpsIghyGEMReqecAgnIRApOvUaxRRJSUCynGtWagOf9EAflFohih
	EaHs4b23297UvI73c1HUekKdtssUBw8ld7batD/1+NzIGWiQYTRqvHJN1KwVGEYqBmXrBly2lhcJQ
	4FZtBL6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsGw-00000004vzU-04Uv;
	Tue, 09 Sep 2025 06:56:10 +0000
Received: from smtps.ntu.edu.tw ([140.112.2.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvncO-00000003Zbi-1wSy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 01:58:01 +0000
Received: from wmail1.cc.ntu.edu.tw (wmail1.cc.ntu.edu.tw [140.112.2.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtps.ntu.edu.tw (Postfix) with ESMTPSA id 65F9C33FA3;
	Tue,  9 Sep 2025 09:57:56 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 09 Sep 2025 09:57:56 +0800
From: Bill Tsui <b10902118@ntu.edu.tw>
To: Will Deacon <will@kernel.org>
Cc: oleg@redhat.com, linux@armlinux.org.uk, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: ptrace: fix hw_break_set() by setting addr
 and ctrl together
In-Reply-To: <aL7y00ggniiCTpZS@willie-the-truck>
References: <20250824124317.390795-1-b10902118@ntu.edu.tw>
 <20250827014113.5852-1-b10902118@ntu.edu.tw>
 <20250827014113.5852-2-b10902118@ntu.edu.tw>
 <aL7y00ggniiCTpZS@willie-the-truck>
User-Agent: Roundcube Webmail/1.4
Message-ID: <dcb568c3dd5feb15890fa75e988e33bb@ntu.edu.tw>
X-Sender: b10902118@ntu.edu.tw
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_185800_652656_CA26EBFC 
X-CRM114-Status: GOOD (  26.82  )
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

On 2025-09-08 23:14, Will Deacon wrote:
> On Wed, Aug 27, 2025 at 09:41:11AM +0800, Bill Tsui wrote:
>> PTRACE_SETREGSET fails when setting a hardware breakpoint on a
>> non-4-byte aligned address with a valid length to a 32-bit tracee. The
>> length should be valid as long as the range started from the address
>> is within one aligned 4 bytes.
>> 
>> The cause is that hw_break_set() modifies a breakpoint's addr
>> first and then ctrl. This calls modify_user_hw_breakpoint() twice,
>> although once registering both suffices. The first modification causes
>> errors because new addr and old ctrl can be an invalid combination at
>> hw_breakpoint_arch_parse(). For example, when a user sets a hardware
>> breakpoint with addr=0x2 and ctrl.len=1, hw_breakpoint_arch_parse()
>> will first see addr=0x2 and ctrl.len=4 (the default) and return
>> -EINVAL. On the other hand, if a user sets the same value to
>> a breakpoint whose ctrl.len has previously been set to 1 or 2,
>> it succeeds.
>> 
>> The fix is to set addr and ctrl in one modify_user_hw_breakpoint(),
>> effectively eliminating the discrepancy in validation.
>> 
>> Signed-off-by: Bill Tsui <b10902118@ntu.edu.tw>
>> ---
>>  arch/arm64/kernel/ptrace.c | 34 +++++++++++++++++++++++++++++-----
>>  1 file changed, 29 insertions(+), 5 deletions(-)
> 
> Given that:
> 
>   (a) This is a pretty niche interface (primarily/exclusively (?) used
>       by GDB)
>   (b) It's been like this for a long time
>   (c) Userspace can work around the problem
> 
> I'm not sure I see the benefit of trying to handle this differently
> in the kernel.
> 
> If somebody _does_ have the time and energy for significant surgery
> on this code, then the best thing to do would be to remove the
> indirection through 'perf_events' altogether. I did make a start on
> that once but it's a thankless job and I got preempted by other stuff.
> 
> Will
(Fixed email name with real name. Sorry again.)

Thanks for the reply. I did find this bug when helping test lldb.

The primary problem is that this forbids hardware breakpoints for Thumb 
at
addresses only divisible by 2 (not 4). So half of the instructions 
cannot have
a hardware breakpoint on. This cannot be worked around.

The first patch should be accepted, at least. The arm64 case can be 
completely
fixed by simply merging modifications in one call, making the code 
reasonable
and correct.

I often debug 32bit executables on arm64, for CTF challenges and my 
hobby. I
get extremely confused when some breakpoints just cannot be set. This is 
also
why I worked on lldb and finally traced to the kernel. As a student, I 
am willing
to take the task of moving ptrace out of 'perf_events' as long as 
someone can
review my patches.

Thanks
Bill

