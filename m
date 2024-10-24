Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CD8CE8E83
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 14:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFY49dlG3q2cLVtR+978NALeRAh6QmZNVeAZJUCIlN0=; b=mQm8rG5q542f7BOsdII5diY8+e
	YWZx70MOY5RIFNDTqY2Jl23aN3akACREzxWxjmmYfTJHERk53Hn3Izdo/9vr7vbtPSmQcsCnzZVTq
	TIL3V3MiiMN+42Cab6FP5mbnVcqJoSTBPVMZXd99N3VHqmNcORlfx/fCmVxPICx5yS6DJREb1fqo0
	Y0eG4h9WaRBRSvNsTunFnzrKDc5OLVsWJInoCXStEHR5hzaHowz1g/a8/ZHRdePIvJh1vV0bj/Xs3
	2VVjfxzLy9R7/cgqWcPbVkvnnDfvVjEsR3vwaKBUy6tpvpUxXqQIxvjxzc4WTXDONsCoLNUp7bmAH
	w2KDo8tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zEz-00000000pCt-1nHZ;
	Thu, 24 Oct 2024 14:55:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zAa-00000000oJl-0dCV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 14:50:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 132E75C55E0;
	Thu, 24 Oct 2024 14:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65B7C4CEE4;
	Thu, 24 Oct 2024 14:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729781435;
	bh=NhIaoSw0gR3pQPGhb7rPIYZ2pg/iO0lhWZm8bnn3FWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aC4tZT3pMuqOqASPonwFqsYVxJpW8KZvs3KQksU+Y9v69Ao87TBHOSy7BiR7WjZiA
	 SBN+LTx7gEF/lC0voKuHDU4qsOITjRZ5HMkU+/TD2LMcxh4aYlWOpQZ+PWhd2HVfzy
	 sR3fqkg74wpduIl2RGxVjJQfVxz2VNinqfXgQe9XOZfKi7jTlfO9f6eBMz9b61AZDd
	 RHb7CJcTjSWIKIRJs0XGHXvaQmOt7neG64A5HdYtSQdGw7DU3t7H6/OhADvDqT4EHq
	 PfsWHHpnitXHy8EXGw9BWFNokQF+qM4bcflSQGK7jmIg/Q3NSz7E2Lpu/SyxmmppP7
	 vn/fgmULE/lqQ==
Date: Thu, 24 Oct 2024 15:50:30 +0100
From: Will Deacon <will@kernel.org>
To: Liao Chang <liaochang1@huawei.com>
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, oliver.upton@linux.dev,
	kristina.martsenko@arm.com, ptosi@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: Return early when break handler is found on
 linked-list
Message-ID: <20241024145028.GA31224@willie-the-truck>
References: <20241024034120.3814224-1-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024034120.3814224-1-liaochang1@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_075036_287080_ACF38BA8 
X-CRM114-Status: GOOD (  18.60  )
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

On Thu, Oct 24, 2024 at 03:41:20AM +0000, Liao Chang wrote:
> The search for breakpoint handlers iterate through the entire
> linked list. Given that all registered hook has a valid fn field, and no
> registered hooks share the same mask and imm. This commit optimize the
> efficiency slightly by returning early as a matching handler is found.
> 
> v2->v1:
> Remove all WARN_ON(!hook->fn) in v1 as Will suggested.

nit: Changelogs like ^^^ should go after the '---' line, otherwise they
end up in the git history.

> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>  arch/arm64/kernel/debug-monitors.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> index c60a4a90c6a5..58f047de3e1c 100644
> --- a/arch/arm64/kernel/debug-monitors.c
> +++ b/arch/arm64/kernel/debug-monitors.c
> @@ -303,7 +303,6 @@ static int call_break_hook(struct pt_regs *regs, unsigned long esr)
>  {
>  	struct break_hook *hook;
>  	struct list_head *list;
> -	int (*fn)(struct pt_regs *regs, unsigned long esr) = NULL;
>  
>  	list = user_mode(regs) ? &user_break_hook : &kernel_break_hook;
>  
> @@ -313,10 +312,10 @@ static int call_break_hook(struct pt_regs *regs, unsigned long esr)
>  	 */
>  	list_for_each_entry_rcu(hook, list, node) {
>  		if ((esr_brk_comment(esr) & ~hook->mask) == hook->imm)
> -			fn = hook->fn;
> +			return hook->fn(regs, esr);
>  	}
>  
> -	return fn ? fn(regs, esr) : DBG_HOOK_ERROR;
> +	return DBG_HOOK_ERROR;
>  }
>  NOKPROBE_SYMBOL(call_break_hook);

Acked-by: Will Deacon <will@kernel.org>

I assume Catalin will pick this one up (but he'll need to tweak the
commit message as per my comment above).

Will

