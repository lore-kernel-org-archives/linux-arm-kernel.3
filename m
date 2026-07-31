Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4496DC55162
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 02:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6dMstA3s1q3jz7gMCf0YyeW1NWmEDHVWbTYZcaJQdY=; b=NvLKEt5rf2JDomVnNUtkqioboO
	PJmGmy9/LdxDhmYKnhqyGRpnxfiapSuXMGLS9xIutDWJHzWePfXPhVtJYn8mTGY6SJ8j6s1Ex4Bwv
	oexk4FSF4VuCFsHfTqk3RlrXGgimg1pjQ2Bh4MWoPLqy1QgP7U04kt3NkVLF7zMJ0JusZwNamr43f
	c3PNjNPHwsXTPCHbT/4HrjcNQxJMOYeYCZMpIbUQyELjOS3aOR6znpfox30Wni2ON0owZw/enCZKE
	eMSfOYmc78Lvd05Empr1gAmhM/eZE/aFnPeB+rIi7mzjM6k/U6IyYHO/dq0hZy8pZuRgr2/r/Mg3J
	cNA5waBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpcsw-0000000BcYg-2cRs;
	Fri, 31 Jul 2026 02:22:06 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpcst-0000000BcYK-1JOt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 02:22:05 +0000
Message-ID: <93b6496e-8f52-4983-95e1-01db68609bc0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785464519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s6dMstA3s1q3jz7gMCf0YyeW1NWmEDHVWbTYZcaJQdY=;
	b=l1ZbtrjKAzRkvs24cBTwpKonWTyd14o0F7EvbfY9RMtZNkyM6mNCdhteXhYFZn5SoA5r+N
	FHyWJR7YEFRe3GkWTgUCgWID775ogz3/PPAm7Uv9qslKbxqVY2lO/PBxHajRosk6aQVe+m
	lSgONwJ/8oDN3jEppAMDdVl1XfKJ3Lc=
Date: Fri, 31 Jul 2026 10:21:37 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] arm64: ftrace: enable single ftrace_ops for direct
 calls
To: Ihor Solodrai <ihor.solodrai@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>,
 "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260727142844.21212-1-leon.hwang@linux.dev>
 <20260727142844.21212-2-leon.hwang@linux.dev>
 <77edc25d-a521-4f65-84ed-dbb016593902@linux.dev>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <77edc25d-a521-4f65-84ed-dbb016593902@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_192203_992386_8D93BC02 
X-CRM114-Status: GOOD (  29.26  )
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

On 31/7/26 07:03, Ihor Solodrai wrote:
> On 7/27/26 7:28 AM, Leon Hwang wrote:
>> The BPF tracing multi link updates several direct-call sites through one
>> ftrace_ops. Its implementation is therefore gated by
>> HAVE_SINGLE_FTRACE_DIRECT_OPS in addition to
>> DYNAMIC_FTRACE_WITH_DIRECT_CALLS.
>>
>> Select HAVE_SINGLE_FTRACE_DIRECT_OPS whenever arm64 enables dynamic ftrace
>> direct calls. This enables BPF tracing multi links on arm64. Also
>> generalize the unreachable-trampoline comment because the single-ops path
>> does not use ops->direct_call.
> 
> Hi Leon,
> 
> I don't think this change can land as is yet. The series doesn't even
> apply cleanly to bpf-next, but that's minor.
> 
> More importantly, it depends on Jose's series [1], which is not in the
> mainline yet. And there Mark has raised performance concerns [2] and
> the discussion still seems to be open.
> 
> [1] https://lore.kernel.org/all/20260609-arm64-ftrace-direct-calls-v1-0-4a46f266697f@linux.dev/
> [2] https://lore.kernel.org/all/amjnf5gz0xP5PTSB@J2N7QTR9R3/
> 
>>
>> Assisted-by: Codex:gpt-5.6-sol
>> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
>> ---
>>  arch/arm64/Kconfig         | 2 ++
>>  arch/arm64/kernel/ftrace.c | 3 +--
>>  2 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 0de419ed780f..c98dca76859b 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -188,6 +188,8 @@ config ARM64
>>  		    CLANG_SUPPORTS_DYNAMIC_FTRACE_WITH_ARGS)
>>  	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS \
>>  		if DYNAMIC_FTRACE_WITH_ARGS
>> +	select HAVE_SINGLE_FTRACE_DIRECT_OPS \
>> +		if DYNAMIC_FTRACE_WITH_DIRECT_CALLS\
> 
> The select is only conditional on DYNAMIC_FTRACE_WITH_DIRECT_CALLS, so
> it can be set along with HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS. And AFAIU
> this would make the fast path effectively dead: every BPF direct call
> routed through ftrace_caller now goes through the slow path.
> 
> As Mark noted in the other thread, on arm64 trampolines come from
> EXECMEM_BPF, so they always land out of BL range (chance of landing in
> range is 256M/terabytes).
> 
> I vibe-slop-coded a benchmark and ran it on a Neoverse V2 machine, and
> toggling your config change seems to be causing a 1.3x regression in
> the tracing overhead:
> 
>   do-nothing fentry (r0=0; exit) on __arm64_sys_getpid, 20 M calls, min-of-N, several boots. Results:
> 
>               untraced (base)   traced        overhead
>   Kernel A    ~128 ns/call      ~145.5 ns     ~17.6 ns   (fast path: br x17)
>   Kernel B    ~127 ns/call      ~150.4 ns     ~23.4 ns   (slow path: save regs + call_direct_funcs + hash)


Thanks for your testing.

> 
> This confirms Jiri's suspicion.

True.

> 
> However my understanding is the regression should mostly disappear in
> case some version of in-range trampoline allocation on arm64 lands.
> 
> So, I think the landing sequence should be something like follows:
>   * in-range BPF-trampoline allocation that Jose proposed [3]
>   * then HAVE_SINGLE_FTRACE_DIRECT_OPS selection
> 
> After all of that reaches mainline, then a selftest patch can go
> through the bpf-next.

Sounds reasonable.

This series is based on Jose's series and is intended for the arm64
tree, rather than bpf-next. Like Jose's series, this series aims to
enable BPF tracing_multi link on arm64. And yes, with in-range
BPF-trampoline allocation, the regression should mostly disappear.

I'll follow the sequence and repost the patches afterward.

Thanks,
Leon

> 
> [3] https://lore.kernel.org/all/amn7cBQ-cqs2XlKV@linux.dev/
> 
>>  	select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS \
>>  		if (DYNAMIC_FTRACE_WITH_ARGS && !CFI && \
>>  		    (CC_IS_CLANG || !CC_OPTIMIZE_FOR_SIZE))
>> diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
>> index e1a3c0b3a051..56ba72a87dfa 100644
>> --- a/arch/arm64/kernel/ftrace.c
>> +++ b/arch/arm64/kernel/ftrace.c
>> @@ -301,8 +301,7 @@ static bool ftrace_find_callable_addr(struct dyn_ftrace *rec,
>>  
>>  	/*
>>  	 * If a custom trampoline is unreachable, rely on the ftrace_caller
>> -	 * trampoline which knows how to indirectly reach that trampoline
>> -	 * through ops->direct_call.
>> +	 * trampoline which knows how to indirectly reach that trampoline.
>>  	 */
>>  	if (*addr != FTRACE_ADDR && !reachable_by_bl(*addr, pc))
>>  		*addr = FTRACE_ADDR;
> 


