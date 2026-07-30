Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3883FC54FCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 03:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eMkah/7xCdD4zUghDYh4eVNm7WoXmd5uInZAQK3gLPA=; b=1Ia68M8LMtL4GTh7hhnnoM2WCx
	ecHMbm2mebhBtvMGoTxymsUukjieiKJi518Y1FuX1xq9Of20g761eWQ0mq+/mk95vKoGDZWKkvuFh
	+yrwlpxudeGZdEmd0uEd0kCS2gHGFWz62j9q0nSJzbhUBsX6G6yojKg7fv+WDn7v6ePrR+yBukscK
	BJdLoY7XSoScZPY2pByDG/BeRdagVAG7Ikmaf9DcUeZgEt/D8RxZxeqhF+DFE3Zc4A48I8s+of+10
	0fEoeCn5N/qzfo+mT2AweVvCf1Zx/JUSuuPpuxGM0o2whuVoJZKS0/430SPrkIiPihlkdVCrS0hly
	xF5nC4lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpH5t-00000009O3e-3nPR;
	Thu, 30 Jul 2026 03:06:01 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpH5q-00000009O3F-3ed9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 03:06:00 +0000
Message-ID: <d745ca80-6516-4c61-8107-88c6a2d9cea4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785380753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eMkah/7xCdD4zUghDYh4eVNm7WoXmd5uInZAQK3gLPA=;
	b=DP14HDqt8/CWCynEUMpJuo5di6yH7F1t3gzWP9h5l5ZP5yRB8fSAQsJyc3igiPwr4sXStT
	UMKuJWYdNe15ZE0uL72LHZDVS3nEW3+3HoK/kKgm5hIAhhndT5GUTYq2PWvO8ztr1CMzab
	LXWPuRRQbVlQNMnJeIRsKmX2Y92EnMw=
Date: Thu, 30 Jul 2026 11:05:42 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] arm64: ftrace: enable single ftrace_ops for direct
 calls
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260727142844.21212-1-leon.hwang@linux.dev>
 <20260727142844.21212-2-leon.hwang@linux.dev> <amnqXeC6D4mjcAe_@krava>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <amnqXeC6D4mjcAe_@krava>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_200559_125934_48A76BBA 
X-CRM114-Status: GOOD (  14.79  )
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

On 29/7/26 19:56, Jiri Olsa wrote:
> On Mon, Jul 27, 2026 at 10:28:43PM +0800, Leon Hwang wrote:
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
> hi,
> iirc arm needs ops->direct_call for trampolines to work properly,
> that's the reason we enabled single ftrace_ops on x86 only:
> 
>   424f6a361096 bpf,x86: Use single ftrace_ops for direct calls
> 
> I don't understand the arm usage of op->direct_call, but it looks like
> (codex thinks) that the fast path won't always work without op->direct_call
> being set


In theory, op->direct_call is the fallback for the case:
HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS=y, out-of-range target, and non-BPF
direct ops. This is what Codex thinks about.

However, after searching the call sites of
register_ftrace_direct()/__modify_ftrace_direct() in kernel, which would
set ops->direct_call, the actual callers are in bpf/trampoline.c, which
have been gated with HAVE_SINGLE_FTRACE_DIRECT_OPS. That said, for
normal usage of HAVE_SINGLE_FTRACE_DIRECT_OPS=y, op->direct_call is unused.

If someone uses register_ftrace_direct() or
modify_ftrace_direct/_nolock() outside BPF in the future,
op->direct_call will be used.

So, I'd like to drop the comment change in the next revision.

Thanks,
Leon

> 
> from arch/arm64/kernel/entry-ftrace.S:
> 
> 	#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> 		/*
> 		 * If the op has a direct call, handle it immediately without
> 		 * saving/restoring registers.
> 		 */
> 		ldr     x17, [x11, #FTRACE_OPS_DIRECT_CALL]             // op->direct_call
> 		cbnz    x17, ftrace_caller_direct
> 	#endif
> 	#endif
> 
> jirka


