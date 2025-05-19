Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D002DC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 13:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zX2HuKhDwN/4IWGs7cDEhcJDkcpkpgPsdgaTCRsfZG0=; b=UQG3jXjBktjmM3/eSaKVUtycnk
	M/W4a8fCpB1ubpPsf5KElK7B5JpjjR5KduXlxC8CuHi01duTw5b8UvuOctNkSsLfKlBmYhmy+jWZ1
	jeeILVpnmhiGsZ8G8OFoFsxHX1VBtqRVPyoBnomW1ip3zvA1/1cvvzTRmM6qzVaXLuplVYCuopvUo
	4QEuY/equvlRqVJeK/OMhqshu8qspb9wjzaE9DN54vLpR/N9Zop3q6ZEj4x7hv+aPJG4d8yOMCyzt
	+4Vu/btJn/Ds8qMbOp/o8Wk+WUbfm+pIgB5aqE0E3SS5mn/ephel4wLwloeEttYcMr8FkU0asC69P
	PK0p5pzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0m4-00000009JZL-2ECH;
	Mon, 19 May 2025 13:43:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0k3-00000009JRh-19Tb
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 May 2025 13:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zX2HuKhDwN/4IWGs7cDEhcJDkcpkpgPsdgaTCRsfZG0=; b=AjpXYTrmtvZvghC4Y2ookrdmPa
	h1jXFW3KdzGAHhCua7Kd9AhaLJ9BaTEnwegWClCATGNUV5O2yIy/TWAh5fwk928WUmQtbpxnM71jB
	/ZPAB/Dd2V24ou9WOfZNgXKo9CotP+DdKtdMvDpSeADdHhk9AYYMY5xjMd4AtdFj/DYoguBWWFlnC
	GTcyGIqdO9m/kwiEpayPMcJ3VLyK+EjUTmsujvqJ03D35YjTxXJnRBYbcYSLY5SV/lZYY/NQWnskP
	ibYfpxqzRIomoN5hWihp4u0lJDFjdxAakaAyLEiuXERZnZqVX2CsmsTQqGnDknO9AonKHf7+j4BqE
	YJT3IXFw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uH0jz-00000000dgh-18fl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 13:41:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 486291655;
	Mon, 19 May 2025 06:40:59 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 939DF3F6A8;
	Mon, 19 May 2025 06:41:09 -0700 (PDT)
Date: Mon, 19 May 2025 14:41:06 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Song Liu <song@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org,
	indu.bhagat@oracle.com, puranjay@kernel.org, wnliu@google.com,
	irogers@google.com, joe.lawrence@redhat.com, jpoimboe@kernel.org,
	peterz@infradead.org, roman.gushchin@linux.dev, rostedt@goodmis.org,
	will@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3 1/2] arm64: Implement arch_stack_walk_reliable
Message-ID: <aCs08i3u9C9MWy4M@J2N7QTR9R3>
References: <20250320171559.3423224-1-song@kernel.org>
 <20250320171559.3423224-2-song@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320171559.3423224-2-song@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_144115_832103_E3F1225F 
X-CRM114-Status: GOOD (  25.66  )
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

On Thu, Mar 20, 2025 at 10:15:58AM -0700, Song Liu wrote:
> With proper exception boundary detection, it is possible to implment
> arch_stack_walk_reliable without sframe.
> 
> Note that, arch_stack_walk_reliable does not guarantee getting reliable
> stack in all scenarios. Instead, it can reliably detect when the stack
> trace is not reliable, which is enough to provide reliable livepatching.
> 
> Signed-off-by: Song Liu <song@kernel.org>
> ---
>  arch/arm64/Kconfig             |  2 +-
>  arch/arm64/kernel/stacktrace.c | 66 +++++++++++++++++++++++++---------
>  2 files changed, 51 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 701d980ea921..31d5e1ee6089 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -276,6 +276,7 @@ config ARM64
>  	select HAVE_SOFTIRQ_ON_OWN_STACK
>  	select USER_STACKTRACE_SUPPORT
>  	select VDSO_GETRANDOM
> +	select HAVE_RELIABLE_STACKTRACE
>  	help
>  	  ARM 64-bit (AArch64) Linux support.
>  
> @@ -2500,4 +2501,3 @@ endmenu # "CPU Power Management"
>  source "drivers/acpi/Kconfig"
>  
>  source "arch/arm64/kvm/Kconfig"
> -
> diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
> index 1d9d51d7627f..7e07911d8694 100644
> --- a/arch/arm64/kernel/stacktrace.c
> +++ b/arch/arm64/kernel/stacktrace.c
> @@ -56,6 +56,7 @@ struct kunwind_state {
>  	enum kunwind_source source;
>  	union unwind_flags flags;
>  	struct pt_regs *regs;
> +	bool end_on_unreliable;
>  };
>  
>  static __always_inline void
> @@ -230,8 +231,26 @@ kunwind_next_frame_record(struct kunwind_state *state)
>  	new_fp = READ_ONCE(record->fp);
>  	new_pc = READ_ONCE(record->lr);
>  
> -	if (!new_fp && !new_pc)
> -		return kunwind_next_frame_record_meta(state);
> +	if (!new_fp && !new_pc) {
> +		int ret;
> +
> +		ret = kunwind_next_frame_record_meta(state);
> +		if (ret < 0) {
> +			/*
> +			 * This covers two different conditions:
> +			 *  1. ret == -ENOENT, unwinding is done.
> +			 *  2. ret == -EINVAL, unwinding hit error.
> +			 */
> +			return ret;
> +		}
> +		/*
> +		 * Searching across exception boundaries. The stack is now
> +		 * unreliable.
> +		 */
> +		if (state->end_on_unreliable)
> +			return -EINVAL;
> +		return 0;
> +	}

My original expectation for this this was that we'd propogate the
errors, and then all the reliability logic would live un a consume_entry
wrapper like we have for BPF, e.g.

| static __always_inline bool
| arch_reliable_kunwind_consume_entry(const struct kunwind_state *state, void *cookie)
| {
|         struct kunwind_consume_entry_data *data = cookie;
| 
|         /*  
|          * When unwinding across an exception boundary, the PC will be
|          * reliable, but we do not know whether the FP is live, and so we
|          * cannot perform the *next* unwind reliably.
|          *
|          * Give up as soon as we hit an exception boundary.
|          */
|         if (state->source == KUNWIND_SOURCE_REGS_PC)
|                 return false;
| 
|         return data->consume_entry(data->cookie, state->common.pc);
| }
| 
| noinline noinstr int arch_stack_walk_reliable(stack_trace_consume_fn consume_entry,
|                                               void *cookie,
|                                               struct task_struct *task)
| {
|         int ret;
|         struct kunwind_consume_entry_data data = { 
|                 .consume_entry = consume_entry,
|                 .cookie = cookie,
|         };  
| 
|         ret = kunwind_stack_walk(arch_reliable_kunwind_consume_entry, &data,
|                                  task, NULL);
|         return ret == -ENOENT ? 0 : ret;
| }

... and then in future we can add anything spdecific to reliable
stacktrace there.

That aside, this generally looks good to me. The only thing that I note
is that we're lacking a check on the return value of
kretprobe_find_ret_addr(), and we should return -EINVAL when that is
NULL, but that should never happen in normal operation.

I've pushed a arm64/stacktrace-updates branch [1] with fixups for those
as two separate commits atop this one. If that looks good to you I
suggest we post that as a series and ask Will and Catalin to take that
as-is.

I'll look at the actual patching bits now.

Mark.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/ arm64/stacktrace-updates

