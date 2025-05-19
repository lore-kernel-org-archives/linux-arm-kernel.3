Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FDBC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 15:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjqV+cH4sOitO4AXGtSVteqaTppV2dw8kTUi/aGt1lc=; b=L5ITlx6Seo0VS95YdND9Ehbwlp
	YC05lTGdmzSuEBHY7EOU739n/JPvNknSA2y03lzqg6c+k/KA4Lisuob1Bi5ctdmf5W5B5pJtqtDXt
	f63zu3Z+PR2LP0BiypTFyMVfN2IkmspGZY3Q8ytXf7BW9z6/70bMfYDzY5UXxMRAgWySNwEc8tigm
	wnNoCUk0bosqhAstzHqCy17yUs2o6KCNY6LM7FIIJkffDD9w/3pFeX4ea/62cZmuoKeG3IFi29DDg
	tNc05dT47OQDtiGpqrXoTAmX7HATXLhi2PQo3CQkV3EKCtEAej5WF//4LEeD8bUFelitSmIQmkgbN
	vbWkJXlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2k2-00000009fiq-2QnI;
	Mon, 19 May 2025 15:49:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1o6-00000009Uv0-1dzh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 14:49:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8303BA4DE97;
	Mon, 19 May 2025 14:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACBACC4CEEF;
	Mon, 19 May 2025 14:49:31 +0000 (UTC)
Date: Mon, 19 May 2025 15:49:29 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	john.ogness@linutronix.de, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 17/22] arm64: mm: Add page fault trace points
Message-ID: <aCtE-RvyN6XJQjTo@arm.com>
References: <cover.1747046848.git.namcao@linutronix.de>
 <f5fccde2326a896e5c568ef06a4dbd9aa7465f6a.1747046848.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5fccde2326a896e5c568ef06a4dbd9aa7465f6a.1747046848.git.namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_074934_496980_4757D6A5 
X-CRM114-Status: GOOD (  15.67  )
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

On Mon, May 12, 2025 at 12:51:00PM +0200, Nam Cao wrote:
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index ec0a337891dd..55094030e377 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -44,6 +44,9 @@
>  #include <asm/tlbflush.h>
>  #include <asm/traps.h>
>  
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/exceptions.h>
> +
>  struct fault_info {
>  	int	(*fn)(unsigned long far, unsigned long esr,
>  		      struct pt_regs *regs);
> @@ -559,6 +562,11 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
>  	if (kprobe_page_fault(regs, esr))
>  		return 0;
>  
> +	if (user_mode(regs))
> +		trace_page_fault_user(addr, regs, esr);
> +	else
> +		trace_page_fault_kernel(addr, regs, esr);

What are the semantics for these tracepoints? When are they supposed to
be called? In the RV context context I guess you only care about the
benign, recoverable faults that would affect timing. These tracepoints
were generalised from the x86 code but I don't know enough about it to
tell when they would be invoked.

For arm64, we also have the do_translation_fault() path for example that
may or may not need to log such trace events.

-- 
Catalin

