Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73592CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 21:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v3DeRW/yErlSp7NN8DBCOmWMja1x3rwLC7hnoycRgEo=; b=mD+L6PuG51ZY3nyRh3uzKjoh9s
	SkFI+iu4OOrmSMbvgmtiKuO4E4Df9ntibs8GddqaDTtXltqsWnEIaLuA7ZRzvO/dFL8C1x4yXIDEl
	/bkhPbWsuVjyBr24/6MKAawWzNljg8bI+T/6NYhxlT6OUyhEJ8kciCl3757UMLXFq6Xsj7XN8PxS/
	XXt0gDT4PtPMhAzOuXTMpk1lxMV+Se0bmAt7gNeuf22XVmyIjjPXdY4zQBGMSjJZpz468w+2219WD
	J4pcO4akrIpepQTR5SaLUDNZRqOjuKogap9ylrYSB6XDBFKm25OQTSxbUfGd4ggWlN+0ZYyn1B2Hp
	vzOdip0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDr4U-0000000Gg7G-0JqV;
	Tue, 28 Oct 2025 21:17:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDr4R-0000000Gg6q-396q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 21:17:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B872F4020B;
	Tue, 28 Oct 2025 21:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E193C4CEE7;
	Tue, 28 Oct 2025 21:17:30 +0000 (UTC)
Date: Tue, 28 Oct 2025 21:17:28 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	bpf@vger.kernel.org, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Haris Okanovic <harisokn@amazon.com>,
	"Christoph Lameter (Ampere)" <cl@gentwo.org>,
	Alexei Starovoitov <ast@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com,
	Joao Martins <joao.m.martins@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [RESEND PATCH v7 2/7] arm64: barrier: Support
 smp_cond_load_relaxed_timeout()
Message-ID: <aQEy6ObvE0s2Gfbg@arm.com>
References: <20251028053136.692462-1-ankur.a.arora@oracle.com>
 <20251028053136.692462-3-ankur.a.arora@oracle.com>
 <3642cfd1-7da6-4a75-80b7-00c21ab6955f@app.fastmail.com>
 <87qzumq51p.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87qzumq51p.fsf@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_141735_849452_2226C0AC 
X-CRM114-Status: GOOD (  32.65  )
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

On Tue, Oct 28, 2025 at 11:01:22AM -0700, Ankur Arora wrote:
> Arnd Bergmann <arnd@arndb.de> writes:
> > On Tue, Oct 28, 2025, at 06:31, Ankur Arora wrote:
> >> Support waiting in smp_cond_load_relaxed_timeout() via
> >> __cmpwait_relaxed(). Limit this to when the event-stream is enabled,
> >> to ensure that we wake from WFE periodically and don't block forever
> >> if there are no stores to the cacheline.
> >>
> >> In the unlikely event that the event-stream is unavailable, fallback
> >> to spin-waiting.
> >>
> >> Also set SMP_TIMEOUT_POLL_COUNT to 1 so we do the time-check for each
> >> iteration in smp_cond_load_relaxed_timeout().
> >
> > After I looked at the entire series again, this one feels like
> > a missed opportunity. Especially on low-power systems but possibly
> > on any ARMv9.2+ implementation including Cortex-A320, it would
> > be nice to be able to both turn off the event stream and also
> > make this function take fewer wakeups:
> >
> >> +/* Re-declared here to avoid include dependency. */
> >> +extern bool arch_timer_evtstrm_available(void);
> >> +
> >> +#define cpu_poll_relax(ptr, val)					\
> >> +do {									\
> >> +	if (arch_timer_evtstrm_available())				\
> >> +		__cmpwait_relaxed(ptr, val);				\
> >> +	else								\
> >> +		cpu_relax();						\
> >> +} while (0)
> >> +
> >
> > Since the caller knows exactly how long it wants to wait for,
> > we should be able to fit a 'wfet' based primitive in here and
> > pass the timeout as another argument.
> 
> Per se, I don't disagree with this when it comes to WFET.
> 
> Handling a timeout, however, is messier when we use other mechanisms.
> 
> Some problems that came up in my earlier discussions with Catalin:
> 
>   - when using WFE, we also need some notion of slack
>     - and if a caller specifies only a small or no slack, then we need
>       to combine WFE+cpu_relax()
> 
>   - for platforms that only use a polling primitive, we want to check
>     the clock only intermittently for power reasons.
>     Now, this could be done with an architecture specific spin-count.
>     However, if the caller specifies a small slack, then we might need
>     to we check the clock more often as we get closer to the deadline etc.
> 
> A smaller problem was that different users want different clocks and so
> folding the timeout in a 'timeout_cond_expr' lets us do away with the
> interface having to handle any of that.
> 
> I had earlier versions [v2] [v3] which had rather elaborate policies for
> handling timeout, slack etc. But, given that the current users of the
> interface don't actually care about precision, all of that seemed
> a little overengineered.

Indeed, we've been through all these options and without a concrete user
that needs a more precise timeout, we decided it's not worth it. It can,
however, be improved later if such users appear.

> [v2] https://lore.kernel.org/lkml/20250502085223.1316925-1-ankur.a.arora@oracle.com/#r
> [v3] https://lore.kernel.org/lkml/20250627044805.945491-1-ankur.a.arora@oracle.com/

-- 
Catalin

