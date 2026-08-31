Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A47C624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 15:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IKf/qv+ZKDMiRuq6ap8IBmRH94f4tOFqUTBggMx1BmU=; b=rEvAkURjEW3wlWmy8M5oFy5Mc8
	Sn61DcXfLYjRh6d0xttKj1P8rsupKD8cl71JJ3A/ZDaTtok5PWyVsvoQUrNT00erAzoOKO1bnlbCt
	m+qGRh1ZxaRJxZLQq2vpDPjPeQ0i8WUA9qd0asGJI/k2PogX4CVP+smibB0n0Dhy/QDgOlnkNOPrm
	QMImHC505Rx6DgdKHHGczzNkmmPCzt1hyx533s0rgB1cucCdojH3nrdiRQUBrA1m1WWJBACZTDXQ3
	7dSMOw6NFChIPa8ElIr7HK8P6ibZz78Re2mLoqJVUBtx55FyffYoyv0l0Mfb84bVJUJAvAkSHCAkV
	IoKOWMUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13gi-00000009p1h-2AdY;
	Mon, 31 Aug 2026 15:12:44 +0000
Received: from smtprelay0012.hostedemail.com ([216.40.44.12] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13gf-00000009p0v-1LGz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 15:12:42 +0000
Received: from omf08.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 72460A3176;
	Mon, 31 Aug 2026 15:12:33 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf08.hostedemail.com (Postfix) with ESMTPA id 17D2620029;
	Mon, 31 Aug 2026 15:12:24 +0000 (UTC)
Date: Mon, 31 Aug 2026 11:13:20 -0400
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
Message-ID: <20260831111320.7b6b3946@gandalf.local.home>
In-Reply-To: <20260831065509.qqEtERDB@linutronix.de>
References: <20260827232948.2520558-1-stevensd@google.com>
	<20260827232948.2520558-7-stevensd@google.com>
	<20260828133620._x2XfJR_@linutronix.de>
	<20260828135947.GU776954@noisy.programming.kicks-ass.net>
	<20260828151018.HnR9xV1N@linutronix.de>
	<20260828150836.2d5b378c@gandalf.local.home>
	<20260828151313.5c4a5e4b@gandalf.local.home>
	<20260828151747.20035d50@gandalf.local.home>
	<20260831065509.qqEtERDB@linutronix.de>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 17D2620029
X-Stat-Signature: 9sd7qcroq64gea6uibr6ape7cx7e1ykm
X-Rspamd-Server: rspamout07
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/3KtEVjKaohpMEOxH4xzYg00zpuzVZqIw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=IKf/qv+ZKDMiRuq6ap8IBmRH94f4tOFqUTBggMx1BmU=; b=cImwxCY5M6/MZq1vXrGpwXyJIW4H4hu5sS1KO7PpnpoXteZNbNQ+GhZzlHqKlL3ZkFB0HN34EWkqTzLeQyS8IcFKie7OGgIlnJDjKa6hVhBcyvMHmYDM/yhwmGkc1A/6BHmeSAl3QTXL0In4xCov5c0vPfeze8DOuvivudM+e4o=
X-HE-Tag: 1788189144-66867
X-HE-Meta: U2FsdGVkX18dzhGCsgKCVwcrIISXc5+c8eAfc+lay5xArphhXwOHYX/nvWZLcCNFYp/sd112suTMB0NzpOGtFdRY72fbzgE39wDPlKiV4JS9YOYXjTah/tBYpd2756XDxPPscNMuqeK262zY2EEZNuLwXIXN/boqjUHRkq/XHc8VDiMguYSMX3Fw9u9/Ec2SavB2O6BTLoVKPnTjGCPjSORO1SLgGh0MREZxm6i8RaGqjgOEjD6WMtZo4umY6LccK88OvdVUTL+WTfjTOF+AZaafG8EqAzLRlgRtocOn6VnjyRlU2JmSCo78sE9rgM2F
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_081241_533390_9C7D0474 
X-CRM114-Status: GOOD (  15.12  )
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

On Mon, 31 Aug 2026 08:55:09 +0200
Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:

> Does this stack tracer distinguish between the kernel-stack and
> IRQ-stack?

It should only look at kernel-stack and not the irq stack. This stack trace
may have triggered when the interrupt put back the kernel stack, as it is
in the irqentry_exit code and about to do a schedule. The code has:

kernel/trace/trace_stack.c:

	/* we do not handle interrupt stacks yet */
	if (!object_is_on_stack(stack))
		return;

Which returns if the object is on the kernel-stack, and here "stack" is the
parameter passed into this function.

> I would expect asm_sysvec_apic_timer_interrupt() on the
> IRQ-stack and not adding weight to the kernel stack.

Right. But I believe this is where it switched back to the kernel-stack.

> Given how close this is to 8192, I don't think two stack pages will
> happen soon.

Agreed :-(

-- Steve

