Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D490CCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 00:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pm9GaObJx0pUzTbnogMJxTLRSXqMju3ZiH9MXVqRNoc=; b=LKADPu4qwk6LxHIxEzHBxfm2a4
	yY1/kI3bTL9CuPol4yBb6LF4XNcxd8xt0nK+bqthAZcuC2znWcazwIDXLnDPnRzbvKNUmwuN0/Lrk
	KRdr2jpMbv7DzDYhwjujFmUKcrOjCYe8H87Cw5kFTBZDCYhos0y03JpCIZReCoY7E+XddqhYnBZ6G
	vbnLkb+Sla96wfx33EmX9C9qCdC9+VClTW5RH367gHNgxp9vQZqOk6D4VYo9l1N2WpKujP5pmk3YX
	FAml6PSuoZNn4qacNs3Yg/F2eat+pBtXcCADtSs0bz1v0VQ/kRtrGKNF/hJKN7Qjj6GKZFds19ME0
	BlVh9Z/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPUlD-000000038ev-2zBy;
	Wed, 20 May 2026 00:26:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPUlA-000000038eU-0zka
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 00:26:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779236761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pm9GaObJx0pUzTbnogMJxTLRSXqMju3ZiH9MXVqRNoc=;
	b=MDKDS7E8FVLVRvjpOk4i3vmKZaErqV7JiPLFBrwAEhhDRBXmPpCv1IblnV2hr3vIFTXHgX
	9USg9wHobWZ0ywMH48eidPNJBDwDIos79OqkHPQyG989E8N4hRi4uaC/69b/OXYZ9XQ1Qj
	ePQVkKgoCwhGxClKtTeMKdGPFzmZdjo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-609-3-li6haoPeCFkJKbXxi6Kg-1; Tue,
 19 May 2026 20:23:47 -0400
X-MC-Unique: 3-li6haoPeCFkJKbXxi6Kg-1
X-Mimecast-MFC-AGG-ID: 3-li6haoPeCFkJKbXxi6Kg_1779236625
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 01E0318005B2;
	Wed, 20 May 2026 00:23:45 +0000 (UTC)
Received: from localhost (unknown [10.22.64.8])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2738B30001A2;
	Wed, 20 May 2026 00:23:42 +0000 (UTC)
Date: Tue, 19 May 2026 21:23:41 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: Waiman Long <longman@redhat.com>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] arm64/entry: Don't disable preemption in
 debug_exception_enter() with RT kernel
Message-ID: <agz_DYGnUsimJ3xL@redhat.com>
References: <20260519222524.886454-1-longman@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20260519222524.886454-1-longman@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: zdYYWlTYIYN-wxqUgg7MrHkN6YX5-fCdzS8jH6rxMAU_1779236625
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_172604_350109_CC880154 
X-CRM114-Status: GOOD (  24.42  )
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

On Tue, May 19, 2026 at 06:25:24PM -0400, Waiman Long wrote:
> Commit d8bb6718c4db ("arm64: Make debug exception handlers visible from
> RCU") introduces debug_exception_enter() and debug_exception_exit()
> where preemption is explicitly disabled. With a PREEMPT_RT debug kernel,
> the following bug report can happen.
> 
>   BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
>   in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 15255, name: gdb_app
>   preempt_count: 1, expected: 0
>   RCU nest depth: 0, expected: 0
>   1 lock held by gdb_app/15255:
>   #0: ffff10007f41b7d8 (&sighand->siglock){..}-{3:3}, at: force_sig_info_to_task+0x34/0x130
>   Preemption disabled at:
>   [<ffff800080081ea8>] debug_exception_enter+0x18/0x70
>     :
>   Call trace:
>   dump_backtrace+0xac/0x130
>   show_stack+0x1c/0x24
>   dump_stack_lvl+0xa0/0xe0
>   dump_stack+0x14/0x2c
>   __might_resched+0x178/0x230
>   rt_spin_lock+0x58/0x120
>   force_sig_info_to_task+0x34/0x130
>   force_sig_fault+0x58/0x80
>   arm64_force_sig_fault+0x44/0x70
>   send_user_sigtrap+0x5c/0xa0
>   brk_handler+0x38/0x5c
>   do_debug_exception+0x78/0x110
>   el0_dbg+0x50/0x1e0
>   el0t_64_sync_handler+0x114/0x150
>   el0t_64_sync+0x17c/0x180
> 
> Fix that by blocking the preempt_disable()/preempt_enable_no_resched()
> calls when CONFIG_PREEMPT_RT is enabled.

Hi Waiman!

Last year Ada Couprie Diaz wrote a patcheseries that enhanced greatly the
ARM64 debug exception code. In the cover letter there is a discussion about
the effect of the patches on RT[0] (look for PREEMPT_RT), explaining that
there are a few remaining known bugs and briefly discussing the best way to
fix then. There is also a discussion[1] about the specific issue you reported.

I took the liberty of adding Ada to the thread.

Best regards,
Luis

[0] https://lore.kernel.org/all/20250707114109.35672-1-ada.coupriediaz@arm.com/
[1] https://lore.kernel.org/linux-arm-kernel/e86c5c3a-6666-46a7-b7ec-e803212a81a1@arm.com/
 
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  arch/arm64/kernel/entry-common.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index c7a23f7c2212..191441b22b7c 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -290,15 +290,17 @@ static __always_inline void fpsimd_syscall_exit(void)
>  }
>  
>  /*
> - * In debug exception context, we explicitly disable preemption despite
> - * having interrupts disabled.
> + * In debug exception context, we explicitly disable preemption except for
> + * PREEMPT_RT kernel as rt_spin_lock() can be called.
> + *
>   * This serves two purposes: it makes it much less likely that we would
>   * accidentally schedule in exception context and it will force a warning
>   * if we somehow manage to schedule by accident.
>   */
>  static void debug_exception_enter(struct pt_regs *regs)
>  {
> -	preempt_disable();
> +	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
> +		preempt_disable();
>  
>  	/* This code is a bit fragile.  Test it. */
>  	RCU_LOCKDEP_WARN(!rcu_is_watching(), "exception_enter didn't work");
> @@ -307,7 +309,8 @@ NOKPROBE_SYMBOL(debug_exception_enter);
>  
>  static void debug_exception_exit(struct pt_regs *regs)
>  {
> -	preempt_enable_no_resched();
> +	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
> +		preempt_enable_no_resched();
>  }
>  NOKPROBE_SYMBOL(debug_exception_exit);
>  
> -- 
> 2.54.0
> 
> 
---end quoted text---


