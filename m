Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72E8C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 15:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjQ31cfuQKa5k82uaGT/Cyx34wNELqTN6/K1Rh0XD+c=; b=Ko+nSnp8JL4H438zbQX+dKml6n
	b4JkHJhgpxzZEfaXu31lf1nY9S5AiDwMZA9W1x2wS8sPyhm/jnb8S02hB3SrFV+vkt4Sdx2WZy1ag
	NUGWekS3tcWegUzaZqxXId7f58psVfsJzJuKLadq9R90OAJ4mzRKMrZ8TH7SrBZ6jQ/zi5LRazTan
	MpFbSeztZvnK78otqlujihQe/jjU19g3OyVS17rPPUnyKeEaruB8PKZqTGSzK1Wzbj/Nt+5QALhaZ
	RfK8jR+YWBeln4Fm51rw8z3GptaAvSA4Mb6fGRZpA/Z1g9SIdJlFWlcak8dXLiBgZj/ivoqFSo4/7
	WnRelDeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzyyv-00000006A1m-2hJT;
	Fri, 28 Aug 2026 15:59:05 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzyyr-000000069yi-1gDi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 15:59:04 +0000
Date: Fri, 28 Aug 2026 17:58:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787932724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MjQ31cfuQKa5k82uaGT/Cyx34wNELqTN6/K1Rh0XD+c=;
	b=o2SzTzUsSOuV/AWS4fKiiKyn/1LhaPYC6Yfdi9fN77edZ6oncnntoZNhDlY+g5FN0uIwEw
	zDLTrEojOcnJRJhRQAb5HCWHd7BbTk9sIN0zPDHE7URywDDDKInIzLBonFQjkJNHVimBoL
	kWzGMCLwRRmRuqGEMRRmC+06LriM6fJe9MbsK+pBSojb6eX8G3SqLu20XaIhwBNbTl5OoI
	9/FFI5P8JkXnl0wGKMTDSeUYaukHKz3pwoo7a0R18G6ypphqw6MC2H45rnhcZbOQ/ClAs7
	vMj0j3h3AzvP+zmWK/m3B+PnqHU7/qIvx3PIK31jHYeE3+dcsciApSaUFtlioA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787932724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MjQ31cfuQKa5k82uaGT/Cyx34wNELqTN6/K1Rh0XD+c=;
	b=Eit7LjiABhdeRfzT4glURHG1RCeV2ZAjuv33J9ECHEaXD7arcRHH/58kzIbGZWU8KSPYLR
	Vh8qqix9q1P5ueBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: David Stevens <stevensd@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>, suleiman@google.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev
Subject: Re: [RFC 06/10] Reclaim memory from blocked kernel stacks
Message-ID: <20260828155842.kIh5T7iS@linutronix.de>
References: <20260827232948.2520558-1-stevensd@google.com>
 <20260827232948.2520558-7-stevensd@google.com>
 <20260828133620._x2XfJR_@linutronix.de>
 <20260828135947.GU776954@noisy.programming.kicks-ass.net>
 <20260828142552.GN788244@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260828142552.GN788244@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_085901_575495_10AB0E5A 
X-CRM114-Status: UNSURE (   8.40  )
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

On 2026-08-28 16:25:52 [+0200], Peter Zijlstra wrote:
> Taking faults on the task-stack is not going to work. That fault will
> happen while you have locks held and IRQs disabled. Ideally, it'll
> happen when you're knee deep in the allocator.
> 
> That fault will then again call the allocator to allocator your stack
> page, and...

indeed. So I do have a few ideas floating around but I leave it at it.

Sebastian

