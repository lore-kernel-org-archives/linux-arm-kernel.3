Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3F6C02190
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 09:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ygSSs5wsJyXqcv3ReS1ED3Taq0KIu32kgznuzVAlVU=; b=eE7frRgKHGE8kc4DjQ+FKP4YoI
	CJYzYzy1isOH3WhEsKCYO8bLP1ZcSMH8UTT4Tf7zYUVVEVGi4mvxQTuXoIUf3drU/cpWas/fLGQ32
	krxmOEQfxLdzDUXuCPoUekWCgwb7Nd/t+85W6IlWU7LTPfZ6qIOWfN9NO00OfWjZgcCQ3IL1YJyxG
	AGKyR/S1hCQ2dvpsM05nNh+V1JL4h51A4LAGR3DLVL0ow3tMlfCT0z0sRCBHILyYALhwmd1iE/yOy
	oibujQzbCAIQmyRn15Avyuw238m902oTQVkOKhvUSpXtuI6JXP5xfl9PUTt+WhYquvfCDT1UcSd0A
	AH0nP4DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRHV-00000008YOh-37YF;
	Thu, 30 Jan 2025 09:56:17 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRGB-00000008YDb-3tZX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 09:54:57 +0000
Received: from [10.156.205.88] (unknown [167.220.238.88])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9961C2109CD7;
	Thu, 30 Jan 2025 01:54:51 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9961C2109CD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1738230895;
	bh=3ygSSs5wsJyXqcv3ReS1ED3Taq0KIu32kgznuzVAlVU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RzCPKNde4/ytrIS/aZsrF8rshVuFVVjpYjpXou7r+ccV4v2ZGV5qu02RWRcl6LHUX
	 Vys807dJ2N9QvfcJHLHickulVOy4XaZGH66PClvto52qqlkr+J8SpVqyC8DBm9APqK
	 L3BY6vECgtxk+KCt0lBn0TpAudrIRVtQYAP7Xr7A=
Message-ID: <755ae1e9-5f58-4260-8460-94a757894cf8@linux.microsoft.com>
Date: Thu, 30 Jan 2025 15:24:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: Define TIF_PATCH_PENDING for livepatch
To: Weinan Liu <wnliu@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Indu Bhagat <indu.bhagat@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev,
 Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>,
 linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org,
 live-patching@vger.kernel.org, joe.lawrence@redhat.com,
 linux-arm-kernel@lists.infradead.org,
 "Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>
References: <20250127213310.2496133-1-wnliu@google.com>
 <20250127213310.2496133-8-wnliu@google.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20250127213310.2496133-8-wnliu@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_015456_015498_61BE88E6 
X-CRM114-Status: GOOD (  16.27  )
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
> From: "Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>
>
> 	- Define TIF_PATCH_PENDING in arch/arm64/include/asm/thread_info.h
> 	  for livepatch.
>
> 	- Check TIF_PATCH_PENDING in do_notify_resume() to patch the
> 	  current task for livepatch.
>
> Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
> Signed-off-by: Madhavan T. Venkataraman <madvenka@linux.microsoft.com>
> Signed-off-by: Weinan Liu <wnliu@google.com>
> ---
>   arch/arm64/include/asm/thread_info.h | 4 +++-
>   arch/arm64/kernel/entry-common.c     | 4 ++++
>   2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
> index 1114c1c3300a..3810c2f3914e 100644
> --- a/arch/arm64/include/asm/thread_info.h
> +++ b/arch/arm64/include/asm/thread_info.h
> @@ -64,6 +64,7 @@ void arch_setup_new_exec(void);
>   #define TIF_UPROBE		4	/* uprobe breakpoint or singlestep */
>   #define TIF_MTE_ASYNC_FAULT	5	/* MTE Asynchronous Tag Check Fault */
>   #define TIF_NOTIFY_SIGNAL	6	/* signal notifications exist */
> +#define TIF_PATCH_PENDING	7	/* pending live patching update */
>   #define TIF_SYSCALL_TRACE	8	/* syscall trace active */
>   #define TIF_SYSCALL_AUDIT	9	/* syscall auditing */
>   #define TIF_SYSCALL_TRACEPOINT	10	/* syscall tracepoint for ftrace */
> @@ -99,11 +100,12 @@ void arch_setup_new_exec(void);
>   #define _TIF_MTE_ASYNC_FAULT	(1 << TIF_MTE_ASYNC_FAULT)
>   #define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
>   #define _TIF_TSC_SIGSEGV	(1 << TIF_TSC_SIGSEGV)
> +#define _TIF_PATCH_PENDING	(1 << TIF_PATCH_PENDING)
>   
>   #define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_SIGPENDING | \
>   				 _TIF_NOTIFY_RESUME | _TIF_FOREIGN_FPSTATE | \
>   				 _TIF_UPROBE | _TIF_MTE_ASYNC_FAULT | \
> -				 _TIF_NOTIFY_SIGNAL)
> +				 _TIF_NOTIFY_SIGNAL | _TIF_PATCH_PENDING)
>   
>   #define _TIF_SYSCALL_WORK	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
>   				 _TIF_SYSCALL_TRACEPOINT | _TIF_SECCOMP | \
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index b260ddc4d3e9..b537af333b42 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -8,6 +8,7 @@
>   #include <linux/context_tracking.h>
>   #include <linux/kasan.h>
>   #include <linux/linkage.h>
> +#include <linux/livepatch.h>
>   #include <linux/lockdep.h>
>   #include <linux/ptrace.h>
>   #include <linux/resume_user_mode.h>
> @@ -144,6 +145,9 @@ static void do_notify_resume(struct pt_regs *regs, unsigned long thread_flags)
>   				       (void __user *)NULL, current);
>   		}
>   
> +		if (thread_flags & _TIF_PATCH_PENDING)
> +			klp_update_patch_state(current);
> +
>   		if (thread_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
>   			do_signal(regs);
>   

Looks good to me.
Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>.


