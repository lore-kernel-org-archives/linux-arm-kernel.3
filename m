Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB0EE909DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 16:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZr4yoO4SgYfJQgJVvoR2/M6Z9qi/RI9xdeWmpjpuAE=; b=zDw9xFeSOLX1qw6ZhnyqAv8Unk
	tQklN27ZJYm2427Q1A7LhcGHGSUJBft3eilRwIigkskf5eb+Wd81zzafhshz4Z2gV1m8i3N0CA7OV
	DGcKSa6hpcMnoYoqflHSq7wNow72Z+CmtwK+y6YaITADYsyrzKn0SaZH4iXJcSUEe/30IiiVuAQSJ
	+//DId6mbSwPWPp+Vvg9Mb/ta3QxEYJKxN8I12sJxBotcrkKj5jlxIU9G8e+ij9tsadjIpNWf4E2M
	eRrSQQ/bBaEwCi13d7TokmohejwRb8BPgqsQjCjETMnpfznXiFK464llD+VhST7crpxHcUslSP04y
	KJQ9SFsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsOFw-00000008b3A-0poT;
	Tue, 17 Feb 2026 16:49:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsOFs-00000008b2h-2Gr1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 16:48:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F4101477;
	Tue, 17 Feb 2026 08:48:48 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C339F3F62B;
	Tue, 17 Feb 2026 08:48:52 -0800 (PST)
Date: Tue, 17 Feb 2026 16:48:49 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Dev Jain <dev.jain@arm.com>, Jisheng Zhang <jszhang@kernel.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, maz@kernel.org
Subject: Re: [PATCH] arm64: remove HAVE_CMPXCHG_LOCAL
Message-ID: <aZSb8VbCC471Cw1X@arm.com>
References: <20260215033944.16374-1-jszhang@kernel.org>
 <aZL46z1UZkQlF3Dd@willie-the-truck>
 <89606308-3c03-4dcf-a89d-479258b710e4@arm.com>
 <aZRyzy0SJ8uF3K2J@arm.com>
 <aZSChrCVnoWSe7h0@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZSChrCVnoWSe7h0@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_084857_114355_9E79A260 
X-CRM114-Status: GOOD (  26.89  )
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

On Tue, Feb 17, 2026 at 03:00:22PM +0000, Will Deacon wrote:
> On Tue, Feb 17, 2026 at 01:53:19PM +0000, Catalin Marinas wrote:
> > On Mon, Feb 16, 2026 at 08:59:17PM +0530, Dev Jain wrote:
> > > On 16/02/26 4:30 pm, Will Deacon wrote:
> > > > On Sun, Feb 15, 2026 at 11:39:44AM +0800, Jisheng Zhang wrote:
> > > >> It turns out the generic disable/enable irq this_cpu_cmpxchg
> > > >> implementation is faster than LL/SC or lse implementation. Remove
> > > >> HAVE_CMPXCHG_LOCAL for better performance on arm64.
> > > >>
> > > >> Tested on Quad 1.9GHZ CA55 platform:
> > > >> average mod_node_page_state() cost decreases from 167ns to 103ns
> > > >> the spawn (30 duration) benchmark in unixbench is improved
> > > >> from 147494 lps to 150561 lps, improved by 2.1%
> > > >>
> > > >> Tested on Quad 2.1GHZ CA73 platform:
> > > >> average mod_node_page_state() cost decreases from 113ns to 85ns
> > > >> the spawn (30 duration) benchmark in unixbench is improved
> > > >> from 209844 lps to 212581 lps, improved by 1.3%
[...]
> > > > That is _entirely_ dependent on the system, so this isn't the right
> > > > approach. I also don't think it's something we particularly want to
> > > > micro-optimise to accomodate systems that suck at atomics.
> > > 
> > > As I mention in the other email, the suspect is not the atomics, but
> > > preempt_disable(). On Apple M3, the regression reported in [1] resolves
> > > by removing preempt_disable/enable in _pcp_protect_return. To prove
> > > this another way, I disabled CONFIG_ARM64_HAS_LSE_ATOMICS and the
> > > regression worsened, indicating that at least on Apple M3 the
> > > atomics are faster.
> > 
> > Then why don't we replace the preempt disabling with local_irq_save()
> > in the arm64 code and still use the LSE atomics?
> 
> Even better, work on making preempt_disable() faster as it's used in many
> other places.

Yes, that would be good. It's the preempt_enable_notrace() path that
ends up calling preempt_schedule_notrace() -> __schedule() pretty much
unconditionally. Not sure what would go wrong but some simple change
like this (can be done at a higher in the preempt macros to even avoid
getting here):

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 854984967fe2..d9a5d6438303 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7119,7 +7119,7 @@ asmlinkage __visible void __sched notrace preempt_schedule_notrace(void)
 	if (likely(!preemptible()))
 		return;
 
-	do {
+	while (need_resched()) {
 		/*
 		 * Because the function tracer can trace preempt_count_sub()
 		 * and it also uses preempt_enable/disable_notrace(), if
@@ -7146,7 +7146,7 @@ asmlinkage __visible void __sched notrace preempt_schedule_notrace(void)
 
 		preempt_latency_stop(1);
 		preempt_enable_no_resched_notrace();
-	} while (need_resched());
+	}
 }
 EXPORT_SYMBOL_GPL(preempt_schedule_notrace);
 

Of course, changing the preemption model solves this by making the
macros no-ops but I assume people want to keep preemption on.

-- 
Catalin

