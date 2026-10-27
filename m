Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41572606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 10:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xEdyfPnI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=J/OytH94
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=z0ECnIZcfjaHWvnEWv9CS9AUxde5/Sd5zctaZmB4Mes=; b=xEdyfPnI1NCZBBiM7MEeHMsnJy
	AqKHDx66juclxtMsAGmBHtZ6FKgW2vIpuNcl6SmtcbGfC411/4rCgFFNXTdW5r3PUxPtkGHQYI5/b
	xiBxbo4AcpvI2k/+vwT9UpY1HlHwAuKaGzN6fK4ZrxJ15Nrn99htQmOoKT0pYKieUFen/hWIy4tgL
	Go0tV0TVSiBQ2QqxmzMr/t/H2oIUGTUPikIRS9TQI8HjWCshz7xC8kcDGt4TwQz6KuoVKg0/D6uzz
	/CdvFsK74cUl8TYHUUi6EWBl+zqPAvmi149B/45ulX09Uihu4KhK9cJNtDCyU9YaH3G3wjMx5cvGD
	lee/2VLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeF0-00000004HNn-3MNo;
	Tue, 27 Oct 2026 10:17:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeEy-00000004HN6-3Xum;
	Tue, 27 Oct 2026 10:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=z0ECnIZcfjaHWvnEWv9CS9AUxde5/Sd5zctaZmB4Mes=; b=J/OytH94niERjjNnCyanm0sACp
	9oX+BES4yTwe9x2jTflF5mZJPoPoMgWl7AyswlY+/XigL1zHv7gzrmgxbJoxhzi59XbOn7Y73QLow
	Y4sIGVdAJUT5JxFbPHfXn+lQbax9Arcc6UZGhPH0VU1XhL3zRyxtEfmaS0pAQ8qiJpq7J2b/ODrV5
	akhmUwaPYmpHCamFXp9CHTcqKNHP3CsXi/p3gjhKglmmoVY2LEFbkdElG7ZU87lQCf7h45VJfDBcB
	pWlqfSt0JfTW3llPsaCZkQFda+FNuN3lJhb4IpbDQc08bZnSxUo5M2rAqIwfKfeICScQYhn9Ndg7M
	0UlDbFlw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeEq-0000000EiPL-3Sv6;
	Tue, 27 Oct 2026 10:17:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 75DE43014C0; Tue, 27 Oct 2026 11:17:03 +0100 (CET)
Date: Tue, 27 Oct 2026 11:17:03 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Chris Down <chris@chrisdown.name>
Cc: Ingo Molnar <mingo@redhat.com>, Kees Cook <kees@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH 2/3] sched/core: Add sched_stack_end_check= boot parameter
Message-ID: <20261027101703.GB2668564@noisy.programming.kicks-ass.net>
References: <cover.1793082868.git.chris@chrisdown.name>
 <3d2bb6a8508b9d801878bb82c88165a1b1ff5f40.1793082868.git.chris@chrisdown.name>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d2bb6a8508b9d801878bb82c88165a1b1ff5f40.1793082868.git.chris@chrisdown.name>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 02:36:21PM +0800, Chris Down wrote:
> CONFIG_SCHED_STACK_END_CHECK makes schedule_debug() check the magic at
> the end of the outgoing task's stack and panic if it has been
> overwritten.
> 
> Right now this can only be configured by setting the Kconfig option at
> build time. At Meta we have it on for some hosts and off for others,
> since it is helpful but adds cost on context switching. That means today
> we have to build separate kernels for each, which is less than ideal.
> 
> So let's make this configurable at boot time. In benchmarking sched pipe
> and sched messaging performance is unaffected.
> 
> Signed-off-by: Chris Down <chris@chrisdown.name>
> ---
>  .../admin-guide/kernel-parameters.txt         |  8 +++++
>  kernel/sched/core.c                           | 33 +++++++++++++++----
>  2 files changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index fbee7b544903..95911d33c0fe 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6811,6 +6811,14 @@ Kernel parameters
>  			core priority to both SMT siblings, so this option
>  			does not favor either sibling.
>  
> +	sched_stack_end_check= [KNL]
> +			Format: <bool>
> +			Check the magic value at the end of the outgoing
> +			task's stack (and its shadow call stack, if any) on
> +			every call to schedule(), and panic if it has been
> +			overwritten.
> +			Default set by CONFIG_SCHED_STACK_END_CHECK.
> +
>  	sched_verbose	[KNL,EARLY] Enables verbose scheduler debug messages.
>  
>  	schedstats=	[KNL,X86] Enable or disable scheduled statistics.
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index fc269fd10192..c1fb86b813bb 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -6143,18 +6143,39 @@ static noinline void __schedule_bug(struct task_struct *prev)
>  	add_taint(TAINT_WARN, LOCKDEP_STILL_OK);
>  }
>  
> +static DEFINE_STATIC_KEY_MAYBE_RO(CONFIG_SCHED_STACK_END_CHECK, sched_stack_end_check);
> +
> +static int __init setup_sched_stack_end_check(char *str)
> +{
> +	bool enable;
> +
> +	if (kstrtobool(str, &enable)) {
> +		pr_warn("Unable to parse sched_stack_end_check=\n");
> +		return 0;
> +	}
> +
> +	if (enable)
> +		static_branch_enable(&sched_stack_end_check);
> +	else
> +		static_branch_disable(&sched_stack_end_check);
> +
> +	return 1;
> +}
> +__setup("sched_stack_end_check=", setup_sched_stack_end_check);
> +
>  /*
>   * Various schedule()-time debugging checks and statistics:
>   */
>  static inline void schedule_debug(struct task_struct *prev, bool preempt)
>  {
> -#ifdef CONFIG_SCHED_STACK_END_CHECK
> -	if (task_stack_end_corrupted(prev))
> -		panic("corrupted stack end detected inside scheduler\n");
> +	if (static_branch_maybe(CONFIG_SCHED_STACK_END_CHECK,
> +				&sched_stack_end_check)) {
> +		if (task_stack_end_corrupted(prev))
> +			panic("corrupted stack end detected inside scheduler\n");
>  
> -	if (scs_is_enabled() && task_scs_end_corrupted(prev))
> -		panic("corrupted shadow stack detected inside scheduler\n");
> -#endif
> +		if (scs_is_enabled() && task_scs_end_corrupted(prev))
> +			panic("corrupted shadow stack detected inside scheduler\n");
> +	}

I just noticed that there's a number of task_stack_end_corrupted()
checks that:

 - do not also do task_scs_end_corrupted(); should
   task_scs_end_corrupted() be put inside task_stack_end_corrupted() to
   make sure they're always done in tandem and the shadow stack check
   isn't lost?

 - should these other sites also respect this switch? It seems weird to
   only have this one site affected.

