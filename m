Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9648C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 19:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0RDwr71FlsrAMrAAlqln64IM9QGsxwXWA77DtZDfZwQ=; b=iIr8E1y530rnbN5yckVlvRlljY
	a4lEClPymMyDPKOYvg6zGlWUXZRrAz+MGpQZY4Vm0GHfY3i0jq3tOBkCHelu+CRkZcsqcGvxPLqW0
	ucY8smTwq3vjmm+XaZXfGeEHYdGAvsn+pq9JfWO8d1zSOMvzSjkWK+71zdCRw7fH5gWAOsxGXqBvA
	3EZgThnqqS/h7Nxam8U/s8tYyOdDiXda+II5Fqgk1yNX1AJX4OlY2+XeboiXxaCoOJUbSp3wN69mw
	c+WPZP6xp/Do9vYjHq68oDRQNyl9M6H7HMq3xjpOjAs3pZ4dPp4gIekRAL2yrJdqMYKESlt1Cjf+I
	zz9jaRKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x024h-00000006LVU-3vd9;
	Fri, 28 Aug 2026 19:17:15 +0000
Received: from smtprelay0015.hostedemail.com ([216.40.44.15] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x024e-00000006LUv-2dSS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 19:17:13 +0000
Received: from omf05.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id C52951A053F;
	Fri, 28 Aug 2026 19:17:06 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf05.hostedemail.com (Postfix) with ESMTPA id C3E9F20011;
	Fri, 28 Aug 2026 19:16:57 +0000 (UTC)
Date: Fri, 28 Aug 2026 15:17:47 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, David Stevens
 <stevensd@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H . Peter Anvin"
 <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, Dave Chinner
 <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, Roman Gushchin
 <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall
 <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
 <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Uladzislau
 Rezki <urezki@gmail.com>, David Hildenbrand <david@kernel.org>, Lorenzo
 Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook
 <kees@kernel.org>, Clark Williams <clrkwllms@kernel.org>,
 suleiman@google.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-rt-devel@lists.linux.dev
Subject: Re: [RFC 06/10] Reclaim memory from blocked kernel stacks
Message-ID: <20260828151747.20035d50@gandalf.local.home>
In-Reply-To: <20260828151313.5c4a5e4b@gandalf.local.home>
References: <20260827232948.2520558-1-stevensd@google.com>
	<20260827232948.2520558-7-stevensd@google.com>
	<20260828133620._x2XfJR_@linutronix.de>
	<20260828135947.GU776954@noisy.programming.kicks-ass.net>
	<20260828151018.HnR9xV1N@linutronix.de>
	<20260828150836.2d5b378c@gandalf.local.home>
	<20260828151313.5c4a5e4b@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C3E9F20011
X-Stat-Signature: j65tfsnn7wb96ijjjfomjeapo6aro4m7
X-Rspamd-Server: rspamout03
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/FRCRqi3s+JC4roW7NUQua3g10tn9P4XM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=0RDwr71FlsrAMrAAlqln64IM9QGsxwXWA77DtZDfZwQ=; b=gAZTVjGDveN8fhsH4aJV2blL0f0S/QpEEvr3BQpYaHupiEQdLMD69nFOfdLEk1spL0/g6lXtTnfNyIqHZGTSM2GCgE4DvzYvzij8bAWlZRrSpkm67+yI+NJTg387b0JmME/jtx2tEqWIUYUrCD2W7DFVoX4NatssuHtJiesq2nE=
X-HE-Tag: 1787944617-357454
X-HE-Meta: U2FsdGVkX1+ViF3OvOgaM5ssQLR7tn0uySWJaFHYtcXWZ21cz7nnxMRW6iHpDWrp6Htrs0cIkgW4SbBQGFpZUf1ROkYnZEWGOtcWKXjDukDAh5xQHzSUkPxJbyaumnTpSqP3YXkkCipkNohafMlloaOqbdI5ACVjC77j7iGbrpU8lCltcFJhtONUqXBCJpw9eTajIr0/aLHn6NisdoeErwIxVK/oB2Np5iYGqcWQEGRVIxOt9i1N8E1VkhWj8uFuSoYqfpNN0eEmhPs7aE8vmz2WPbGl+v4Ry92BAG7LkkOQAqWIZjLFKEu432FqDcWspoc2zzLFnstcV5vVdG65ka7IObsOxeMhd+5KlkygWN4xwraefOr4pQuVKgzS9Rrd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_121712_741296_0F889E0D 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

On Fri, 28 Aug 2026 15:13:13 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> If one worries about stack size, they may want to turn off
> CONFIG_RANDOMIZE_KSTACK_OFFSET as I see some big numbers for do_syscall_64()

And the scheduler has some heavy stack usage here!

  # trace-cmd stack
(stack tracer running)
        Depth    Size   Location    (31 entries)
        -----    ----   --------
  0)     8120      48   __msecs_to_jiffies+0x9/0x30
  1)     8072     104   update_group_capacity+0x94/0x960
  2)     7968     528   update_sd_lb_stats.constprop.0+0x426/0x39b0
  3)     7440     424   sched_balance_find_src_group+0x8f/0x1150
  4)     7016     552   sched_balance_rq+0x934/0x4130
  5)     6464     408   pick_task_fair+0xa71/0x1fe0
  6)     6056     496   __schedule+0x628/0x76f0
  7)     5560      32   schedule+0xde/0x2c0
  8)     5528      32   io_schedule+0x8c/0x100
  9)     5496     256   rq_qos_wait+0x12b/0x230
 10)     5240     136   wbt_wait+0x150/0x260
 11)     5104      40   __rq_qos_throttle+0x51/0xa0
 12)     5064     304   blk_mq_submit_bio+0xc40/0x28e0
 13)     4760     240   submit_bio_noacct_nocheck+0x410/0xb30
 14)     4520      40   ext4_io_submit+0xca/0x1a0
 15)     4480     144   ext4_bio_write_folio+0x5e2/0x1470
 16)     4336      96   mpage_process_page_bufs+0x392/0x700
 17)     4240     616   mpage_prepare_extent_to_map+0xaae/0x1120
 18)     3624     480   ext4_do_writepages+0x971/0x37f0
 19)     3144     312   ext4_writepages+0x2d2/0x610
 20)     2832     152   do_writepages+0x21e/0x560
 21)     2680     184   __writeback_single_inode+0x119/0x1240
 22)     2496     752   writeback_sb_inodes+0x67d/0x17b0
 23)     1744     168   __writeback_inodes_wb+0xf2/0x270
 24)     1576     304   wb_writeback+0x63e/0x890
 25)     1272     320   wb_workfn+0x844/0xca0
 26)      952     360   process_one_work+0x8b4/0x15d0
 27)      592     176   worker_thread+0x5d3/0xfb0
 28)      416      64   kthread+0x33c/0x420
 29)      352     160   ret_from_fork+0x65c/0x9e0
 30)      192     192   ret_from_fork_asm+0x1a/0x30

Note, I'm running this on my server. That is, this is a production machine.

-- Steve

