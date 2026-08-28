Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBA8C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 16:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EloB0katp8AvIPCuQbU503lG6mYrXa7AvQm9QMftF/Q=; b=2ZC67Ja6Awu5Les2Hqap2nnil+
	Cg96jbkndN+7SBZtpRHiFYx5ukx+GahU4Bc9NasrhWP3V0CJfSxi+NbhmLKoJVr0uvqfmdnbOVEaK
	RyfYgPz4AYfF/XTQ2xSqzWwDEl2DXBI+XGu2/Ev3UazTLiqQ3TTh1xvLFBJZmDp0WNip2MN9KsMXT
	WuRBd9U5GRUEe1UrJ4/wXK+/cRheLzXfezKT8m+oZjjLx5NRTK8+KibCcmqSclK0St46/WXj5W7+d
	6xz6KwQqD5jkXibzhgU21RNgpRWHR/nykF6zACtByAeAaTLu2ewKRMLBrrbK08xzzo/M3XpfXCNMH
	1JLtY3SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzz98-00000006AvB-48Uq;
	Fri, 28 Aug 2026 16:09:38 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzz96-00000006Auo-2U9d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 16:09:38 +0000
Received: from omf07.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id D97DFC03F8;
	Fri, 28 Aug 2026 16:09:29 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id 988AA2002E;
	Fri, 28 Aug 2026 16:09:20 +0000 (UTC)
Date: Fri, 28 Aug 2026 12:10:10 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: David Stevens <stevensd@google.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Andrew Morton
 <akpm@linux-foundation.org>, Dave Chinner <david@fromorbit.com>, Qi Zheng
 <qi.zheng@linux.dev>, Roman Gushchin <roman.gushchin@linux.dev>, Muchun
 Song <muchun.song@linux.dev>, Juri Lelli <juri.lelli@redhat.com>, Vincent
 Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman
 <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek
 Nayak <kprateek.nayak@amd.com>, Uladzislau Rezki <urezki@gmail.com>, David
 Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R .
 Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike
 Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal
 Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, Sebastian Andrzej
 Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>,
 suleiman@google.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-rt-devel@lists.linux.dev, jstultz@google.com
Subject: Re: [RFC 00/10] Reclaimable kernel stacks
Message-ID: <20260828121010.47fa7713@gandalf.local.home>
In-Reply-To: <20260828144500.GW776954@noisy.programming.kicks-ass.net>
References: <20260827232948.2520558-1-stevensd@google.com>
	<20260828124758.GP687043@noisy.programming.kicks-ass.net>
	<20260828103328.633bbfbc@gandalf.local.home>
	<20260828143540.GV776954@noisy.programming.kicks-ass.net>
	<20260828144500.GW776954@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 48z84x6eyt4hnsuag3zedkjkfm3baagp
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 988AA2002E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX198HxFyXYgEZJwnf72i30sWt/lWTSWMtx0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=EloB0katp8AvIPCuQbU503lG6mYrXa7AvQm9QMftF/Q=; b=SUQWHdUrQzbFKVWGZ5xuskpOuRiSRULlG6ryJnBZGwRdZ5u67PBT5epIe0H7xg5SXNEX5TvwjgYAiKgBFn8ZVFZTo/UhBe7uCVkXSTXgl3qel4FHrisSpTHR0cXMEvTruijIo6t+0UY6KTNW3HgB/IH3lcx96mDtLDIYxSkl2wU=
X-HE-Tag: 1787933360-956987
X-HE-Meta: U2FsdGVkX1/U5Q0ostoyRiukFyNqFJhukFmTfCLv7rXt7diB6hyl/rZhUovQsUbfRuY/ruuw+CzkC8ZVCbdE5m17xKy+P2Hv3jyfNk0S4gBULlux/YQTMMl9V3ucR2xXxNGvpPJmpCP7P0aDUB8ibU6MmqlECvOPKid5V1OOzQt6NM3cjLlOo9ZuIQpgB8dSi6tyspx69xpNnpLwgNIG3TDSRJvGO7iERa9ou6pry9qFlRoyhFt1aUgs2Vz/JVAzyifFmbQZTDKS6nRAwD3NlsUyrhMO5du3Oou8k5oL+5IF7ADACZKUrPjYxLA7y874Dbta0aVQfHT5D1YLKlytYenuQaXYN9bClOSio+1VJY0xX4vNPnTY50qYg771Vo4/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_090936_855517_DFF0BF80 
X-CRM114-Status: GOOD (  10.59  )
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

On Fri, 28 Aug 2026 16:45:00 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> I realized I actually have a Java thing, the kids have Minecraft, so I
> booted that up and I found all of 108 threads. Which is still kinda
> insane, but nowhere near the 1000s per app as claimed.

Have you looked at how many threads Chome uses?

 $ ps -eLf|grep chrome | wc -l
 930

Of course I probably have 900 tabs open :-p

-- Steve

