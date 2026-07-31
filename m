Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934F2C55162
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 02:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=go9e1FTWLKxTTOfTi113qwmgUMtPejwq61+ADMUh6Dc=; b=snf4L/zIC7yfcCp/kK5UE4DKsW
	uqJ58Cx2NITLsxpwaTdlU++RIfanTWsLhB4Q5KXUzl8iLoc+y7f2qwMvIJ/TTYYOAoGqv/DGbMDJy
	4y56yJdXD/mvCeBWlWBMfXJB3kdKNdYWLaJaM8EuwX1ANzrZQ1ySuXmgFEQBNBFP8SEZj6Vfd+A2Q
	P+E3KwMDF6fppDjbC2vSrQbbu0meOAi5LkQZ4uMXqHwcFhbZbXLqTpvz3wzYY8dlQx2oBqcfYo3+s
	x/D/au8AchxHek9zK0oPLzfa7zdQkzjpG9x1uvxCjrX4wC2Xdcbx5+NAjcPOm7Sz2eT17gvzGEb0w
	IvSFAUVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpd1o-0000000Bd7A-3aWs;
	Fri, 31 Jul 2026 02:31:16 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpd1l-0000000Bd6n-33ii
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 02:31:15 +0000
Message-ID: <3f8e64b4-e60a-4eba-afb6-5af668ac1f85@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785465071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=go9e1FTWLKxTTOfTi113qwmgUMtPejwq61+ADMUh6Dc=;
	b=YpGoNeNNwTqx9ibJwMxEeOMg0AK9brZQjsfrgeSAz/B/G1V0kjp7YOAKgCHRHgVPRYkT5w
	tVsin+P46wlmcpajdK6uJO1VSehLEpOLnGg+ktVcOKNXSVWF46rE68ku1et81odaYsHCeJ
	o0D7L0eOMgHQ8go3cYwoCLXYxleh/lU=
Date: Fri, 31 Jul 2026 10:30:37 +0800
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
 <d745ca80-6516-4c61-8107-88c6a2d9cea4@linux.dev> <amsuU7eXuoziObdh@krava>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <amsuU7eXuoziObdh@krava>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_193114_019965_0FF549E1 
X-CRM114-Status: GOOD (  14.43  )
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

On 30/7/26 18:58, Jiri Olsa wrote:
> On Thu, Jul 30, 2026 at 11:05:42AM +0800, Leon Hwang wrote:
>> On 29/7/26 19:56, Jiri Olsa wrote:
>>> On Mon, Jul 27, 2026 at 10:28:43PM +0800, Leon Hwang wrote:
>>>> The BPF tracing multi link updates several direct-call sites through one
>>>> ftrace_ops. Its implementation is therefore gated by
>>>> HAVE_SINGLE_FTRACE_DIRECT_OPS in addition to
>>>> DYNAMIC_FTRACE_WITH_DIRECT_CALLS.
>>>>
>>>> Select HAVE_SINGLE_FTRACE_DIRECT_OPS whenever arm64 enables dynamic ftrace
>>>> direct calls. This enables BPF tracing multi links on arm64. Also
>>>> generalize the unreachable-trampoline comment because the single-ops path
>>>> does not use ops->direct_call.
>>>
>>> hi,
>>> iirc arm needs ops->direct_call for trampolines to work properly,
>>> that's the reason we enabled single ftrace_ops on x86 only:
>>>
>>>   424f6a361096 bpf,x86: Use single ftrace_ops for direct calls
>>>
>>> I don't understand the arm usage of op->direct_call, but it looks like
>>> (codex thinks) that the fast path won't always work without op->direct_call
>>> being set
>>
>>
>> In theory, op->direct_call is the fallback for the case:
>> HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS=y, out-of-range target, and non-BPF
>> direct ops. This is what Codex thinks about.
>>
>> However, after searching the call sites of
>> register_ftrace_direct()/__modify_ftrace_direct() in kernel, which would
>> set ops->direct_call, the actual callers are in bpf/trampoline.c, which
>> have been gated with HAVE_SINGLE_FTRACE_DIRECT_OPS. That said, for
>> normal usage of HAVE_SINGLE_FTRACE_DIRECT_OPS=y, op->direct_call is unused.
>>
>> If someone uses register_ftrace_direct() or
>> modify_ftrace_direct/_nolock() outside BPF in the future,
>> op->direct_call will be used.
> 
> so any 2nd user on the same function triggers the slow path,
> and that's fine, the single_ops handles slow path correctly
> 
> but IIUC the out-of-range target will now always go through slow path,
> which in current code it doesn't, right?
> 

Right.

Pls see the sibling thread with Ihor. With in-range BPF trampoline
allocation, the slow-path regression should mostly disappear.

Let's continue the discussion in that thread.

Thanks,
Leon


