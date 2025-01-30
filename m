Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35D7C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 10:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHU7Mfj+jdlBvEEUG3Mk560s4FlcL4gxyi/SpShMVNE=; b=EVS4dbw1ZYTM5kdqsQvEM0fnz0
	MT/VOo/08J+DhRTmlJFEUCg6+7a9GskopOaTBl/wMe1j3pMEQoQ8ZU/SahwMBpl81bU9mp1rFklOv
	9/QLMbIAyjl6tDDgQWL0O+OEC2Z5Jq47sH6Mv18bLhYrf12ACNNjqpagMRjqCIJX2C4847Ax4Hmg4
	q1wMcgHLPs6Lb9Y07JrekRo6PIF2bsUGa/DKQ3ceN4dhVMKvyPAq4zQNbOXRiWL5HBGv7YQTztO0S
	EkpA3E3PbOicF7FFjJALW6sAHNyv0JLVUaqV2ilE0BsZyJdLyEs02t3EW1ZCGkJTQ8P2jOlpKP7ug
	KvMkIsxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRx0-00000008eLY-0gb7;
	Thu, 30 Jan 2025 10:39:10 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRuw-00000008diY-1cKs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 10:37:03 +0000
Received: from [10.156.205.88] (unknown [167.220.238.88])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6431B2109CD7;
	Thu, 30 Jan 2025 02:36:58 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6431B2109CD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1738233421;
	bh=mHU7Mfj+jdlBvEEUG3Mk560s4FlcL4gxyi/SpShMVNE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EF7mc93R7ozr4HWtaTUzkbz0uslmOMqrlEanm/rjn3O836YTZTP1Hlo9HoABT4Ka0
	 WrruTcK51vLoChcNhmJfPPFN5+n4+uuGn2iqDhEIejPmFjl7dKjqLJWunpI9prVWCw
	 8h7zd/F7OYeBQyF5LWUqi2B9q0W5fPxX2Datin+w=
Message-ID: <f2cbccc0-1bab-48a3-b837-ce875df21efe@linux.microsoft.com>
Date: Thu, 30 Jan 2025 16:06:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] unwind: arm64: add reliable stacktrace support for
 arm64
To: Weinan Liu <wnliu@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Indu Bhagat <indu.bhagat@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev,
 Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>,
 linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org,
 live-patching@vger.kernel.org, joe.lawrence@redhat.com,
 linux-arm-kernel@lists.infradead.org
References: <20250127213310.2496133-1-wnliu@google.com>
 <20250127213310.2496133-7-wnliu@google.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20250127213310.2496133-7-wnliu@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_023702_485108_302AECE6 
X-CRM114-Status: GOOD (  23.63  )
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


On 28-01-2025 03:03, Weinan Liu wrote:
> To support livepatch, we need to add arch_stack_walk_reliable to
> support reliable stacktrace according to
> https://docs.kernel.org/livepatch/reliable-stacktrace.html#requirements
>
> report stacktrace is not reliable if we are not able to unwind the stack
> by sframe unwinder and fallback to FP based unwinder
>
> Signed-off-by: Weinan Liu <wnliu@google.com>
> ---
>   arch/arm64/include/asm/stacktrace/common.h |  2 +
>   arch/arm64/kernel/stacktrace.c             | 47 +++++++++++++++++++++-
>   2 files changed, 47 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/include/asm/stacktrace/common.h b/arch/arm64/include/asm/stacktrace/common.h
> index 19edae8a5b1a..26449cd402db 100644
> --- a/arch/arm64/include/asm/stacktrace/common.h
> +++ b/arch/arm64/include/asm/stacktrace/common.h
> @@ -26,6 +26,7 @@ struct stack_info {
>    * @stacks:      An array of stacks which can be unwound.
>    * @nr_stacks:   The number of stacks in @stacks.
>    * @cfa:         The sp value at the call site of the current function.
> + * @unreliable:  Stacktrace is unreliable.
>    */
>   struct unwind_state {
>   	unsigned long fp;
> @@ -36,6 +37,7 @@ struct unwind_state {
>   	int nr_stacks;
>   #ifdef CONFIG_SFRAME_UNWINDER
>   	unsigned long cfa;
> +	bool unreliable;
>   #endif
>   };
>   
> diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
> index c035adb8fe8a..eab16dc05bb5 100644
> --- a/arch/arm64/kernel/stacktrace.c
> +++ b/arch/arm64/kernel/stacktrace.c
> @@ -310,11 +310,16 @@ kunwind_next(struct kunwind_state *state)
>   	case KUNWIND_SOURCE_TASK:
>   	case KUNWIND_SOURCE_REGS_PC:
>   #ifdef CONFIG_SFRAME_UNWINDER
> -	err = unwind_next_frame_sframe(&state->common);
> +	if (!state->common.unreliable)
> +		err = unwind_next_frame_sframe(&state->common);
>   
>   	/* Fallback to FP based unwinder */
> -	if (err)
> +	if (err || state->common.unreliable) {
>   		err = kunwind_next_frame_record(state);
> +		/* Mark its stacktrace result as unreliable if it is unwindable via FP */
> +		if (!err)
> +			state->common.unreliable = true;
> +	}
>   #else
>   	err = kunwind_next_frame_record(state);
>   #endif
> @@ -446,6 +451,44 @@ noinline noinstr void arch_stack_walk(stack_trace_consume_fn consume_entry,
>   	kunwind_stack_walk(arch_kunwind_consume_entry, &data, task, regs);
>   }
>   
> +#ifdef CONFIG_SFRAME_UNWINDER
> +struct kunwind_reliable_consume_entry_data {
> +	stack_trace_consume_fn consume_entry;
> +	void *cookie;
> +	bool unreliable;
> +};
> +
> +static __always_inline bool
> +arch_kunwind_reliable_consume_entry(const struct kunwind_state *state, void *cookie)
> +{
> +	struct kunwind_reliable_consume_entry_data *data = cookie;
> +
> +	if (state->common.unreliable) {
> +		data->unreliable = true;
> +		return false;
> +	}
> +	return data->consume_entry(data->cookie, state->common.pc);
> +}
> +
> +noinline notrace int arch_stack_walk_reliable(
> +				stack_trace_consume_fn consume_entry,
> +				void *cookie, struct task_struct *task)
> +{
> +	struct kunwind_reliable_consume_entry_data data = {
> +		.consume_entry = consume_entry,
> +		.cookie = cookie,
> +		.unreliable = false,
> +	};
> +
> +	kunwind_stack_walk(arch_kunwind_reliable_consume_entry, &data, task, NULL);
> +
> +	if (data.unreliable)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +#endif
> +
>   struct bpf_unwind_consume_entry_data {
>   	bool (*consume_entry)(void *cookie, u64 ip, u64 sp, u64 fp);
>   	void *cookie;

Why not fold the previous patch and this into one?

But the code looks good to me.

Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>.

