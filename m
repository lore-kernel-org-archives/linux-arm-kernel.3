Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A710D116E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 02:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ub5VOZLLt0SH8K9ba3Wp3fNISzqw9t9xdaANGN/tBGs=; b=Rb5DwQptPRNOQ4XRamBHYzsL+0
	QkRqjh1V0v8Ai1oWqloVDyviLHLpSM4HPUnuoEwDMDDN1Y+foxseParDvwhYQZstioMFcx5EV12ZG
	WNpDYCerZpMO6JiKeIRq3fBvUKWHj698ZFjQn6XwseM0WAolIUFEc4C6CZYkbm/2QIwfj6NjGeKia
	mT+p09aZInU7OBiv5nytw9g8MOeHI7P11Opp8SbvIBG6UhPxKJCvwIlG4m6eIMQL8wpfZFx9yXMAd
	qucoqZ8Umm4YoFHxv9YXjP7nYzOMTFcYttPh8fNhpKsF/b25tLot+8hRWv0PoP3DwNkrtHkGR15kk
	t4St1OGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vORWL-0000000FspB-1JbX;
	Thu, 27 Nov 2025 02:14:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vORWI-0000000Fsoq-2lLW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 02:14:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D91543B71;
	Thu, 27 Nov 2025 02:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C99C4CEF7;
	Thu, 27 Nov 2025 02:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764209645;
	bh=IFqYUZzq/jzvNAotoBLmtazNmaL0/3Amx3MFWLru9+I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oDNkD0l5tVbI5YCQPKX2hVO9qKYsdHnZ4iecrTrg9O57eLiKDr+pZEkvZ9CUZnxMc
	 bjr5VdRlmTaE5odqa68YzIGuTPPjkQyBW1ZDDZ9aS6QrbEArFkN7yt5HUqiiG4Q3c2
	 uMe1MoRiMwrLjRPBS9CFJSQ+3VRQLkC+ZjUAnv76GL3n+zjPJpc56S/jSAjuOe+12v
	 CYQYxQo9kFkFz2/NYCUSLprwLk6ktAL7eX0ei5mJ0pZF/HSH95f0cWEg/VcWVewg7C
	 +W/PFqTTJjBfThMo3SaYKkK4xCDD7MxI4KMcEyHmV7Kps6uSRLriogHI9BykXTHt4k
	 7V0YJaRuGADaw==
Date: Thu, 27 Nov 2025 11:14:02 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: oleg@redhat.com, peterz@infradead.org, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: simplify arch_uprobe_xol_was_trapped return
Message-Id: <20251127111402.c228292177bbd2b8e88c8629@kernel.org>
In-Reply-To: <20251126223130.216302-1-osama.abdelkader@gmail.com>
References: <20251126223130.216302-1-osama.abdelkader@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_181406_744172_D9C39650 
X-CRM114-Status: GOOD (  15.08  )
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

On Thu, 27 Nov 2025 00:31:30 +0200
Osama Abdelkader <osama.abdelkader@gmail.com> wrote:

> convert arch_uprobe_xol_was_trapped() from explicit if/return true
> return false pattern to direct boolean expression return in
> arch/arm64/kernel/probes/uprobes.c
> 
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>


Looks good to me.

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thanks!

> ---
>  arch/arm64/kernel/probes/uprobes.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kernel/probes/uprobes.c b/arch/arm64/kernel/probes/uprobes.c
> index 2799bdb2fb82..b38c1dab7eb4 100644
> --- a/arch/arm64/kernel/probes/uprobes.c
> +++ b/arch/arm64/kernel/probes/uprobes.c
> @@ -103,10 +103,7 @@ bool arch_uprobe_xol_was_trapped(struct task_struct *t)
>  	 * insn itself is trapped, then detect the case with the help of
>  	 * invalid fault code which is being set in arch_uprobe_pre_xol
>  	 */
> -	if (t->thread.fault_code != UPROBE_INV_FAULT_CODE)
> -		return true;
> -
> -	return false;
> +	return t->thread.fault_code != UPROBE_INV_FAULT_CODE;
>  }
>  
>  bool arch_uprobe_skip_sstep(struct arch_uprobe *auprobe, struct pt_regs *regs)
> -- 
> 2.43.0
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

