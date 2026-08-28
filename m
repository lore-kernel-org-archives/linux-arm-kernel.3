Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C519C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 19:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2Suj+uMH8IWqeDAhXO3xIkXuJMMCKizRoC/2RG7bxc=; b=04P61+MZJZwXoeBvFaGw+Lc8bG
	TFe+8WyYgsYa+rkBYOPILcEwgGyA0FTfAHRL1zrkLmwqk98uKiW4T1w4Shf0m1MMKvryZtYmhN+IM
	bxjVnTWF90eshLrNILPR1G1TYVDl2Vu7WbH9aZ04OS3qUixDGhSZ3R3iWN1YhrhUcncILDViYy4i5
	WmLaOUVku6ng82ukISU0athPwY8Byui2l0kK7efJdAQolmSMZSgKnOifOaUTiX53x4u97fdF14syD
	HaTd8wlbFO+tQhRNoCSCQSY6LG2Kv1zleiA7PWx6JK9Eu20digfdmOP9yPT8rT5iV3HWur9W2/qN6
	Z0g5+I0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x020F-00000006L3v-1cZ7;
	Fri, 28 Aug 2026 19:12:39 +0000
Received: from smtprelay0012.hostedemail.com ([216.40.44.12] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x020D-00000006L3R-11QF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 19:12:38 +0000
Received: from omf11.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 65FAAA3FB0;
	Fri, 28 Aug 2026 19:12:32 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id C696B2002D;
	Fri, 28 Aug 2026 19:12:23 +0000 (UTC)
Date: Fri, 28 Aug 2026 15:13:13 -0400
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
Message-ID: <20260828151313.5c4a5e4b@gandalf.local.home>
In-Reply-To: <20260828150836.2d5b378c@gandalf.local.home>
References: <20260827232948.2520558-1-stevensd@google.com>
	<20260827232948.2520558-7-stevensd@google.com>
	<20260828133620._x2XfJR_@linutronix.de>
	<20260828135947.GU776954@noisy.programming.kicks-ass.net>
	<20260828151018.HnR9xV1N@linutronix.de>
	<20260828150836.2d5b378c@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: dyge7ggw7d7rfphafggxzm8r13uy7gtt
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: C696B2002D
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/rkZTDqyZTXYSHIbvg/SbTGvmPF9j7VV8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=Z2Suj+uMH8IWqeDAhXO3xIkXuJMMCKizRoC/2RG7bxc=; b=2m2asOuEv8t74uU1Gan3JSqAENc8RaUvN9P1HNNtBSittc4ZS6dNRkHB+iQDKp48V8rWl/FjHiz1V7HP5iSOBYeJNgTCSbsaiNlM0/IYJtEDh4FkBKz/l4O+K5TZJLjLn7IVm7vslpivsyURkYHuFNXmcFyuKFW9XahtjqdPaQc=
X-HE-Tag: 1787944343-285764
X-HE-Meta: U2FsdGVkX1909Uxp8Ldf7nNU7KRK0gudD1Ufb8P4m28YOCIyzM1fQabUyiFSwXv3FXOCfu1zeVXberLA6qXl8bDofIen2OSqWaSPKGJB+heB2QFlA47FICTq09w+AKae/jaHa/KJl/DpwGQqYsKym/NPNfywRAA6WkPJibG+5t5lB70tNvEFXd36oQJGhGj93sDV1ojcwJDdPDsjLCGuFavg+dp2ChEsumGYD3PhuQlK7Aka9+JKS55fHEFT9iPdrZ4C5ViVsbwk02ttENue2ff4c1QGDoevm3rCVvtMDgTs7guBH6hDeLwSM+POInDEFzLzaI0wEEW7nE4u7yOKySoK2QvbzxX4RLDAuWiU812FEq6L4xn2wxAkWWMSwSki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_121237_372319_5E1634DF 
X-CRM114-Status: UNSURE (   9.95  )
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

On Fri, 28 Aug 2026 15:08:36 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> If you want to see how big your stack is and where its used, you can run
> the stack tracer:
> 
>  # trace-cmd stack --start
> 
> [wait]
> 
>  # trace-cmd stack
> (stack tracer running)
>         Depth    Size   Location    (41 entries)
>         -----    ----   --------
>   0)     5032      48   choose_idle_cpu+0x5/0x100
>   1)     4984     296   select_task_rq_fair+0xa84/0x2b40
>   2)     4688     104   try_to_wake_up+0x168/0x7e0
>   3)     4584      16   task_work_add+0xd7/0xf0
>   4)     4568      16   io_req_normal_work_add+0x75/0xb0
>   5)     4552      40   io_poll_wake+0x10f/0x160
>   6)     4512      64   __wake_up_common+0x72/0xa0
>   7)     4448      40   __wake_up_sync_key+0x43/0x60
>   8)     4408      24   sock_def_readable+0x46/0xe0
>   9)     4384      80   tun_net_xmit+0x240/0x550 [tun]
>  10)     4304      80   dev_hard_start_xmit+0x63/0x1e0
>  11)     4224     256   __dev_queue_xmit+0x880/0x10b0
>  12)     3968      24   br_dev_queue_push_xmit+0x62/0xf0 [bridge]
>  13)     3944      80   br_dev_xmit+0x15e/0x4a0 [bridge]
>  14)     3864      80   dev_hard_start_xmit+0x63/0x1e0
>  15)     3784     256   __dev_queue_xmit+0x880/0x10b0
>  16)     3528      72   ip_finish_output2+0x2ce/0x650
>  17)     3456     104   ip_output+0x63/0x110
>  18)     3352      72   __ip_queue_xmit+0x16f/0x470
>  19)     3280     232   __tcp_transmit_skb+0xcb5/0x1140
>  20)     3048     120   tcp_write_xmit+0x5aa/0x1760
>  21)     2928      24   __tcp_push_pending_frames+0x39/0x110
>  22)     2904     104   tcp_rcv_established+0x37f/0xeb0
>  23)     2800      32   tcp_v4_do_rcv+0x13f/0x300
>  24)     2768     168   tcp_v4_rcv+0xc01/0x1300
>  25)     2600      48   ip_protocol_deliver_rcu+0x35/0x1b0
>  26)     2552      24   ip_local_deliver_finish+0x85/0x100
>  27)     2528      40   __netif_receive_skb_one_core+0x85/0xa0
>  28)     2488      56   netif_receive_skb+0x127/0x180
>  29)     2432     104   br_handle_frame_finish+0x428/0x680 [bridge]
>  30)     2328      40   br_handle_frame+0x132/0x2a0 [bridge]
>  31)     2288     280   __netif_receive_skb_core.constprop.0+0x16e/0xdf0
>  32)     2008      40   __netif_receive_skb_one_core+0x39/0xa0
>  33)     1968      56   netif_receive_skb+0x127/0x180
>  34)     1912     256   tun_get_user+0xbd0/0x1260 [tun]
>  35)     1656      56   tun_chr_write_iter+0x77/0xba [tun]
>  36)     1600      88   do_iter_readv_writev+0x161/0x260
>  37)     1512     256   vfs_writev+0x168/0x3c0
>  38)     1256      80   do_writev+0x7f/0x110

>  39)     1176     984   do_syscall_64+0xaa/0x670

If one worries about stack size, they may want to turn off
CONFIG_RANDOMIZE_KSTACK_OFFSET as I see some big numbers for do_syscall_64()

-- Steve


>  40)      192     192   entry_SYSCALL_64_after_hwframe+0x76/0x7e


