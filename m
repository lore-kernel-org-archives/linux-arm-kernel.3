Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7452FCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 18:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xu3chdljYk93N4v9mi52eqGaMBxperNhAYuHdfcwsKI=; b=V4X6m+UxDntscyLbEB0qFfHQom
	loaNR/zzB5azJdKiW97ul1P2A4jRzlfc+Cq3TzVGBsuVPDgyxyb0Mek6qAj0sS7jbMupnSrtVo9e9
	SOSNzfba2CAv6JwwUJQQehLKrHKh8fcF/LjfyV+Xhqljx0OdM4yqm/70QWaUyjqVCZgnM6BUnUGih
	yOj6W9vzqAOq/moqR9FYUTN52p3qwosuqQPZ1q1JFRzIDJZB4/jZ1s0xZ3Jn2kDLAx2C88oOnplDN
	Ix50TF57v/FJTe8U2SVhz57bPuDxTnJ10Q/n/OpGMfoiKXFg/U3sAA4zNluKZllz8jWcwE7aweCZ2
	odA1CQtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE9zn-00000001GxY-2eGi;
	Tue, 06 Oct 2026 18:34:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE9zl-00000001GxG-3gEv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 18:34:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EBA81602D3;
	Tue,  6 Oct 2026 18:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE851F00902;
	Tue,  6 Oct 2026 18:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791311672;
	bh=xu3chdljYk93N4v9mi52eqGaMBxperNhAYuHdfcwsKI=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=NVGehG62SsigyLbp4m2/jaaY12WpGLFt0Dc+Q7tnJfHCbWmK8yVbXpFeyUUDFvQya
	 H8KtuDzsxI+ahBaroOSZQ4uYND6dV+6eTpe2iyoftQQwLgsxHXUSXX0qwe0bWehazl
	 aiUY4oOYQ0q28vsLfELJWUtdFGeMdmN/CBOnErqwtUY+a2EvLFklCReZrNYKx96u24
	 0ZNVRvZEPD4dNkKx3pEstyBZP1SBoyonoYwVmRxMe/zKZr5RbPBFAVx1w4SxxJ80a6
	 QCaNOOGZvCAhZSN+nrsEJbCJk+ye3ueJvQ5/blv7frkxXqhrHa1KsOO/BC7VJLr4Aq
	 6l+8OSE1SD0JQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 59561CE3A08; Tue,  6 Oct 2026 11:34:32 -0700 (PDT)
Date: Tue, 6 Oct 2026 11:34:32 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Josef Bacik <josef@toxicpanda.com>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, Boqun Feng <boqun@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>, rcu@vger.kernel.org,
	bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 01/14] rcu-tasks-trace: Let TASKS_TRACE_RCU_NO_MB
 default on without RCU_EXPERT
Message-ID: <c8b467cc-a916-48c7-b969-9b35dd04724c@paulmck-laptop>
References: <20260929-b4-rcu-tasks-preempt-qs-v6-0-c111ee02caca@toxicpanda.com>
 <20260929-b4-rcu-tasks-preempt-qs-v6-1-c111ee02caca@toxicpanda.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-b4-rcu-tasks-preempt-qs-v6-1-c111ee02caca@toxicpanda.com>
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
Reply-To: paulmck@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Sep 29, 2026 at 05:07:18PM +0000, Josef Bacik wrote:
> TASKS_TRACE_RCU_NO_MB defaults to ARCH_WANTS_NO_INSTR, on the grounds
> (see 1a72f4bb6f3e) that architectures with noinstr entry code only ever
> run tracing where RCU is watching and so can dispense with the read-side
> smp_mb() in rcu_read_lock_trace() and friends.  But the option also
> depends on RCU_EXPERT, and a Kconfig default is not applied to a symbol
> whose dependencies are unmet, so on an ordinary RCU_EXPERT=n build of
> such an architecture the option is simply absent and every Tasks Trace
> reader pays for two full barriers that the architecture does not need.
> 
> Keep the prompt behind RCU_EXPERT, so that overriding the default in
> either direction remains an expert decision, but let the default itself
> apply unconditionally.  On x86-64 and arm64 defconfig this turns the
> barriers off, as intended; architectures without ARCH_WANTS_NO_INSTR
> are unchanged.
> 
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>

Reviewed-by: Paul E. McKenney <paulmck@kernel.org>

> ---
>  kernel/rcu/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/rcu/Kconfig b/kernel/rcu/Kconfig
> index 332df7a7a634..e3cfe1fe5592 100644
> --- a/kernel/rcu/Kconfig
> +++ b/kernel/rcu/Kconfig
> @@ -142,8 +142,8 @@ config TASKS_TRACE_RCU
>  	default n
>  
>  config TASKS_TRACE_RCU_NO_MB
> -	bool "Override RCU Tasks Trace inclusion of read-side memory barriers"
> -	depends on RCU_EXPERT && TASKS_TRACE_RCU
> +	bool "Override RCU Tasks Trace inclusion of read-side memory barriers" if RCU_EXPERT
> +	depends on TASKS_TRACE_RCU
>  	default ARCH_WANTS_NO_INSTR
>  	help
>  	  This option prevents the use of read-side memory barriers in
> 
> -- 
> 2.55.0
> 

