Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FE7C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 14:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XbHmu1wlkPzmq8ZR9eK2OK/E9gteDV5LtX2iIQMw/Gs=; b=DBkLNtb9CSUO2gbrnKfLKeHPGC
	3KZTNlEdupRkhfp0gIy6ewqExJx463ko7YAWRGRwldX4t5Y64kr0Qfk8B74CPMVzBtoarBMB3gV7Q
	ZBOSduKYv191s0E73ZKnU72aDQk+Wxf/GJQvVupdhDZmTRIFJpjpET59+zCYhMUhgDGDHZldox7vt
	rZy1v3OCG/iPBqbX/ZBwrrjEfHrDUNeleRO0zl6AVTSzmGdHekUfxgO3CaZJDqbDFFVNJbu0cvRq3
	fFyBL8qnVqam1KDc1BuO3nSbH4Nc5GW0VDVMbIRspmrkIYReDPCHjS2ngL4WMx1RnrfE0dnifrc8J
	qkeC84CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucPZg-0000000AMnR-3VDJ;
	Thu, 17 Jul 2025 14:27:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucOl8-0000000AGvR-3QqU;
	Thu, 17 Jul 2025 13:34:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A138E5C6A19;
	Thu, 17 Jul 2025 13:34:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE04EC4CEE3;
	Thu, 17 Jul 2025 13:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752759289;
	bh=N17lcip5xVPoQD+TFin5urXVNUr0BGOOZWXqfYJOvDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zw3fmP3Ej/UUXMQw3cQ2bCnSKH21C5fqKi7M1D0iQWcGY/54wxKO6PHcbwnNSAnTk
	 KPiRDPO/ep7Ccb7fC11Tdx/NxAt/uozjeSTLgx50PtZkGu6edDy+1jVgDZqBlezEEC
	 +vWi//koGAJYIsSD940iTETcUrymC2XqBh/NmZ3rrxv5OOFKHYFAKb1O/pQR1VGZAq
	 pUyA02BNZRoAbpQXeR2xI7Pwx5itPB27MXZl488EhZ3rpfmyFXQMWw0oLtCQNOpY4k
	 27Yo+9gsGk72vxU6s1KTcnJ7VRRH46Dtp65dZBEPdsz884klLtO8V0r+yirXhZLz5v
	 s3JDWj0J9hJ9Q==
Date: Thu, 17 Jul 2025 15:34:46 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
Cc: rcu@vger.kernel.org, bobule.chang@mediatek.com,
	wsd_upstream@mediatek.com,
	Cheng-jui Wang <cheng-jui.wang@mediatek.com>,
	Lorry.Luo@mediatek.com, weiyangyang@vivo.com,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Joel Fernandes (Google)" <joel@joelfernandes.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] rcu: Fix delayed execution of hurry callbacks
Message-ID: <aHj79rtgLm-7tT9E@localhost.localdomain>
References: <20250717055341.246468-1-Tze-nan.Wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250717055341.246468-1-Tze-nan.Wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_063450_944724_02F65418 
X-CRM114-Status: GOOD (  30.55  )
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

Le Thu, Jul 17, 2025 at 01:53:38PM +0800, Tze-nan Wu a écrit :
> We observed a regression in our customer’s environment after enabling
> CONFIG_LAZY_RCU. In the Android Update Engine scenario, where ioctl() is
> used heavily, we found that callbacks queued via call_rcu_hurry (such as
> percpu_ref_switch_to_atomic_rcu) can sometimes be delayed by up to 5
> seconds before execution. This occurs because the new grace period does
> not start immediately after the previous one completes.
> 
> The root cause is that the wake_nocb_gp_defer() function now checks
> "rdp->nocb_defer_wakeup" instead of "rdp_gp->nocb_defer_wakeup". On CPUs
> that are not rcuog, "rdp->nocb_defer_wakeup" may always be
> RCU_NOCB_WAKE_NOT. This can cause "rdp_gp->nocb_defer_wakeup" to be
> downgraded and the "rdp_gp->nocb_timer" to be postponed by up to 10
> seconds, delaying the execution of hurry RCU callbacks.
> 
> The trace log of one scenario we encountered is as follow:
>   // previous GP ends at this point
>   rcu_preempt   [000] d..1.   137.240210: rcu_grace_period: rcu_preempt 8369 end
>   rcu_preempt   [000] .....   137.240212: rcu_grace_period: rcu_preempt 8372 reqwait
>   // call_rcu_hurry enqueues "percpu_ref_switch_to_atomic_rcu", the callback waited on by UpdateEngine
>   update_engine [002] d..1.   137.301593: __call_rcu_common: wyy: unlikely p_ref = 00000000********. lazy = 0
>   // FirstQ on cpu 2 rdp_gp->nocb_timer is set to fire after 1 jiffy (4ms)
>   // and the rdp_gp->nocb_defer_wakeup is set to RCU_NOCB_WAKE
>   update_engine [002] d..2.   137.301595: rcu_nocb_wake: rcu_preempt 2 FirstQ on cpu2 with rdp_gp (cpu0).
>   // FirstBQ event on cpu2 during the 1 jiffy, make the timer postpond 10 seconds later.
>   // also, the rdp_gp->nocb_defer_wakeup is overwrite to RCU_NOCB_WAKE_LAZY
>   update_engine [002] d..1.   137.301601: rcu_nocb_wake: rcu_preempt 2 WakeEmptyIsDeferred
>   ...
>   ...
>   ...
>   // before the 10 seconds timeout, cpu0 received another call_rcu_hurry
>   // reset the timer to jiffies+1 and set the waketype = RCU_NOCB_WAKE.
>   kworker/u32:0 [000] d..2.   142.557564: rcu_nocb_wake: rcu_preempt 0 FirstQ
>   kworker/u32:0 [000] d..1.   142.557576: rcu_nocb_wake: rcu_preempt 0 WakeEmptyIsDeferred
>   kworker/u32:0 [000] d..1.   142.558296: rcu_nocb_wake: rcu_preempt 0 WakeNot
>   kworker/u32:0 [000] d..1.   142.558562: rcu_nocb_wake: rcu_preempt 0 WakeNot
>   // idle(do_nocb_deferred_wakeup) wake rcuog due to waketype == RCU_NOCB_WAKE
>   <idle>        [000] d..1.   142.558786: rcu_nocb_wake: rcu_preempt 0 DoWake
>   <idle>        [000] dN.1.   142.558839: rcu_nocb_wake: rcu_preempt 0 DeferredWake
>   rcuog/0       [000] .....   142.558871: rcu_nocb_wake: rcu_preempt 0 EndSleep
>   rcuog/0       [000] .....   142.558877: rcu_nocb_wake: rcu_preempt 0 Check
>   // finally rcuog request a new GP at this point (5 seconds after the FirstQ event)
>   rcuog/0       [000] d..2.   142.558886: rcu_grace_period: rcu_preempt 8372 newreq
>   rcu_preempt   [001] d..1.   142.559458: rcu_grace_period: rcu_preempt 8373 start
>   ...
>   rcu_preempt   [000] d..1.   142.564258: rcu_grace_period: rcu_preempt 8373 end
>   rcuop/2       [000] D..1.   142.566337: rcu_batch_start: rcu_preempt CBs=219 bl=10
>   // the hurry CB is invoked at this point
>   rcuop/2       [000] b....   142.566352: blk_queue_usage_counter_release: wyy: wakeup. p_ref = 00000000********.
> 
> This patch changes the condition to check "rdp_gp->nocb_defer_wakeup" in
> the lazy path. This prevents an already scheduled "rdp_gp->nocb_timer"
> from being postponed and avoids overwriting "rdp_gp->nocb_defer_wakeup"
> when it is not RCU_NOCB_WAKE_NOT.
> 
> Fixes: 3cb278e73be5 ("rcu: Make call_rcu() lazy to save power")
> Co-developed-by: Cheng-jui Wang <cheng-jui.wang@mediatek.com>
> Signed-off-by: Cheng-jui Wang <cheng-jui.wang@mediatek.com>
> Co-developed-by: Lorry.Luo@mediatek.com
> Signed-off-by: Lorry.Luo@mediatek.com
> Tested-by: weiyangyang@vivo.com
> Signed-off-by: weiyangyang@vivo.com
> Signed-off-by: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
> ---
> The regression is first observed by wyy in the Update Engine scenario
> with  CONFIG_LAZY_RCU enabled. there is an additional delay of 4–5
> seconds during the heavy ioctl API call, waiting for
> percpu_ref_switch_to_atomic_rcu (RCU hurry CB) to complete.
> 
> Initially, we suspected that the percpu_ref_switch_to_atomic_rcu
> function itself was taking too long. However, after enabling some
> custome and the following trace events: rcu_do_batch, rcu_nocb_wake, and
> rcu_grace_period. we found that the root cause was that rcuog was not
> being woken up in time to request a new GP. This led to the delay in
> invoking the hurry RCU callback (percpu_ref_switch_to_atomic_rcu).
> 
> Environment:
>   Android-16, Kernel: 6.12, 8 CPUs (ARM)
> 
> Configuration:
>   CONFIG_TREE_RCU=y
>   CONFIG_PREEMPT_RCU=y
>   CONFIG_LAZY_RCU=y
>   CONFIG_RCU_NOCB_CPU=y
>   CONFIG_RCU_NOCB_CPU_DEFAULT_ALL=y
>   rcu_nocb_gp_stride = -1 (default is 4 for 8 cores)
>   jiffies_lazy_flush = 10 * HZ
> 
> Contributions:
> Tze-Nan Wu:
> Collaborated with Cheng-Jui to discuss which tracepoints needed to be
> added, jointly analyzed the trace logs, identified the root cause, and
> proposed this upstream change.
> 
> Cheng-Jui Wang:
> Provided many valuable suggestions during the debugging process,
> repeatedly found breakthroughs when we were stuck, and helped identify
> the root cause.
> 
> Lorry Luo:
> Assisted in verifying whether rcu-hurry-callback was executed too long
> or deferred, supported with testing, and helped with communication.
> 
> Weiyangyang:
> Main tester who discovered the regression scenario, confirmed that
> enabling CONFIG_LAZY_RCU caused the regression, and verified that this
> patch resolves the issue

Nice team work :-)

> 
> Note:
> With my limited understanding of lazy RCU, I am not fully confident that
> this is a real issue. In my opinion, hurry callbacks should not be
> delayed by other events such as firstBQ trace event.
> If my understanding is incorrect, I would greatly appreciate any
> guidance or clarification from the maintainers.

Your understanding looks quite right!

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

Since the issue is there for 3 years now and was introduced with
the CONFIG_LAZY_RCU new feature, it can probably wait a few weeks
for the next merge window.

-- 
Frederic Weisbecker
SUSE Labs

