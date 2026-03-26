Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C310110A88E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vk7+/q89jjUxkzOtY1XsyYKkbzsBHpcrNS4KmvZd+/I=; b=PWWdCoE+ApqZWgi/tvd2nz57Jc
	3q41qtXDIoYvjOfTGAgMcIX2hjGkEnzH60tfVuRtGAl4WypgTkd17u2mmVAfkyYkXOKtJN/Uku+uF
	wixcCa8rsoLP2we0EXMLnFSYYQhIjAaTON/FlJb4YDHWn96iOjcKCXKknz2a6HzPhNAoUG5yj/yKs
	n0Ku+bHa+ZeDNUHhUuXKTUwnih7mV61hsBWrUJSO0vitYkq4Lt/Kqc/cORKysDV5pKrtMMeG1j6Fe
	V0+QkjmlsB7Z8IoQJ/Gh+8iIjp6OQgbbKIfhyl16z6QvQKrw/xcGkvw7gkZvuSBla1M9q7DhPM9pk
	ieTs5KJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5moc-00000005mk6-1pfb;
	Thu, 26 Mar 2026 15:40:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5moZ-00000005mji-2glN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:40:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD94D1E8D;
	Thu, 26 Mar 2026 08:39:57 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EABDB3F641;
	Thu, 26 Mar 2026 08:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774539603; bh=Q0dXKMwvqUVibjNiOVBckvLKDWg553EueB8+WMLxmc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mc4lcYVYUHKT2M7If7nhAWGnZP/hhh3sCwS0HbRbciFw5wsasz3C/I3bFUxD59SRT
	 XrtbThR6As6fI/3wYPm16LoQDN+8TdK6wkg5JDRXsQ3uXh1fduUKdo504SF8KLGg5M
	 NI0FNHJR4eVatqynexCUxM4hF5xdex24OOKPoqCQ=
Date: Thu, 26 Mar 2026 15:39:58 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Ankur Arora <ankur.a.arora@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	bpf@vger.kernel.org, arnd@arndb.de, will@kernel.org,
	peterz@infradead.org, mark.rutland@arm.com, harisokn@amazon.com,
	cl@gentwo.org, ast@kernel.org, rafael@kernel.org,
	daniel.lezcano@linaro.org, memxor@gmail.com,
	zhenglifeng1@huawei.com, xueshuai@linux.alibaba.com,
	rdunlap@infradead.org, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v10 00/12] barrier: Add
 smp_cond_load_{relaxed,acquire}_timeout()
Message-ID: <acVTTmGCZL4QPln2@arm.com>
References: <20260316013651.3225328-1-ankur.a.arora@oracle.com>
 <20260315184925.b6f93386e918ca79614843e3@linux-foundation.org>
 <874imftol4.fsf@oracle.com>
 <20260316233712.7cbfac27@pumpkin>
 <87ms07rlp9.fsf@oracle.com>
 <20260317091705.5a64fc56@pumpkin>
 <acPo7l_pd5rnHpSX@arm.com>
 <20260325154210.79a621df@pumpkin>
 <acQOMZMk0OMfIgFO@arm.com>
 <20260325202357.3e203314@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325202357.3e203314@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_084007_817368_8AFF1374 
X-CRM114-Status: GOOD (  25.84  )
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

On Wed, Mar 25, 2026 at 08:23:57PM +0000, David Laight wrote:
> On Wed, 25 Mar 2026 16:32:49 +0000
> Catalin Marinas <catalin.marinas@arm.com> wrote:
> 
> > On Wed, Mar 25, 2026 at 03:42:10PM +0000, David Laight wrote:
> ...
> > > Looking at the code I think the "sevl; wfe" pair should be higher up.  
> > 
> > Yes, I replied to your other message. We could move it higher indeed,
> > before the condition check, but I can't get my head around the ordering.
> > Can need_resched() check be speculated before the WFE? I need to think
> > some more.
> 
> I don't think speculation can matter.
> Both SEVL and WFE must be serialised against any other instructions
> that can change the event flag (as well as each other) otherwise
> everything is broken.

Welcome to the Arm memory model. We don't have any guarantee that an LDR
will only access memory after SEVL+WFE. They are not serialising.

> Apart from that it doesn't matter, what matters is the instruction
> boundary the interrupt happens at.

True. If an interrupt is taken before the LDR (that would be a
need_resched() check for example), then a prior WFE would not matter.
This won't work if we replace the IPI with a SEV though (suggested
somewhere in this thread).

> Actually both SEVL and WFE may be synchronising instructions and very slow.

Most likely not.

> So you may not want to put them in the fast path where the condition
> is true on entry (or even true after a retry).
> So the code might have to look like:
> 	for (;;) {
> 		VAL = mem;

If we only waited on the location passed to LDXR, things would have been
much simpler. But the osq_lock() also wants to wait on the TIF flags via
need_resched() (and vcpu_is_preempted()).

> 		if (cond(VAL)) return;

So the cond(VAL) here is actually a series of other memory loads
unrelated to 'mem'

> 		SEVL; WFE;
> 		if (cond(VAL)) return;

I think this will work in principle even if 'cond' accesses other memory
locations, though I wouldn't bother with an additional 'cond' call, I'd
expect SEVL+WFE to be mostly NOPs. However, 'cond' must not set a local
event, otherwise the power saving on waiting is gone.

> 		v1 = LDX(mem);
> 		if (v1 == VAL)
> 			WFE;
> 	}

I think it's cleaner to use Ankur's timeout API here for the very rare
case where an IPI hits at the wrong time. We then keep
smp_cond_load_relaxed() intact as it's really not meant to wait on
multiple memory locations to change. Any changes of
smp_cond_load_relaxed() with moving the WFE around are just hacks, not
the intended use of this API.

-- 
Catalin

