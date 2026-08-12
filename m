Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387D4C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 11:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/f+iTOOVNTQvrvGy/voP7LCXDz7uDlaqxyBdFvyvK4=; b=AaK80wruSas/r4F/rjonS1qXW6
	G96w/A1N1vhb/IqT+O43InzskAA/BsLCsIuSiiDm8j+aqrQok59obwgxujYj0fcu9Rsyn01+o83sx
	qWfwccgua0vlmj2q+XiGg8iqQH/exENFuJYZvNDg8fV1olo9vH6DRT3DknrpnhBtRULtNfqnH8xLF
	1CHaTFFuIo0o584qjm1MzcV8wly3vpheyevis+yuCsK+VkC87ScA+BaKOa/GdJuND+J5v115Uuuk3
	ctrweThMeqR/OUcy+SFaJLsPorWSlicOeiJgE/cZBFZPZM1qV1gyzD2sTtZP8QWGAC7YowcGGrweM
	VxALCuDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6jO-0000000Fzkv-3JpJ;
	Wed, 12 Aug 2026 11:02:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6jJ-0000000FziW-32NV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 11:02:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 875641596;
	Wed, 12 Aug 2026 04:02:33 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BEBBE3F86F;
	Wed, 12 Aug 2026 04:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786532557; bh=mdrIGZjICmq0LxOwQ6YiH5ZpPrFH3mTO0IlhyWlkIDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZGpV5YRLI7rdNyFSqiLdfEanSElpwuTSW6u+h99x0+n0OsN0F8HVFSj4UAyLA6Pdr
	 sgDWFHZc6Qoqx9qryjKj6NH9tlbT1SuUH+l3IuXwRQHxJvHRiW9/eB53dmlXfVCZFU
	 87t+L3949mhkIpaQVEw0nW09yC8WGZUpPbJTkjFw=
Date: Wed, 12 Aug 2026 13:02:09 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Sean Wang1 <seanwang1@lenovo.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"rafael@kernel.org" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	Xuewen Yan <xuewen.yan@unisoc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sumit Gupta <sumitg@nvidia.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>
Subject: Re: [External] Re: [PATCH v3] arm64: topology: add source check in
 arch_cpu_idle_enter()
Message-ID: <anxSsfvpZHHsVnp_@arm.com>
References: <20260811072830.10028-1-seanwang1@lenovo.com>
 <anrzT-ez3b7uYaCt@arm.com>
 <SI2PR03MB6688D1DC0796AC6F6A373C2E93DC2@SI2PR03MB6688.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SI2PR03MB6688D1DC0796AC6F6A373C2E93DC2@SI2PR03MB6688.apcprd03.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_040241_972749_A9CF7AD5 
X-CRM114-Status: GOOD (  40.27  )
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

On Wed, Aug 12, 2026 at 07:34:52AM +0000, Sean Wang1 wrote:
> On Tus, Aug 11, 2026 at 06:03PM, Beata Michalska wrote:
> 
> > > --- a/arch/arm64/kernel/topology.c
> > > +++ b/arch/arm64/kernel/topology.c
> > > @@ -175,7 +175,8 @@ void arch_cpu_idle_enter(void)
> > >
> > >  	/* Kick in AMU update but only if one has not happened already */
> > >  	if (housekeeping_cpu(cpu, HK_TYPE_TICK) &&
> > > -
> > time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, cpu)))
> > > +
> > time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, cpu))
> > &&
> > > +	    topology_is_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, cpu))
> > >  		amu_scale_freq_tick();
> > I'm not entirely convinced you gained a lot by that.
> > It's one additional check per each enter_idle for case where AMUs are the
> > source vs 2 additional check when it is not.
> > Will try to figure out smth less 'invasive'.
> > 
> 
> First, I think that the rcu_read_lock_sched()/unlock() in
> topology_is_scale_freq_source() is unnecessary. arch_cpu_idle_enter()
> is called from do_idle() after local_irq_disable() at
> kernel/sched/idle.c:340, which satisfies the rcu_sched grace period
> requirement. This means we can call rcu_dereference_sched() directly
> without explicit RCU lock.
In this particular case RCU locking is not required, though you are exposing
an API that might be used in other curcumstances, so the least we could do is
document that.
> 
> I have two options to propose:
> 
> Option A: Keep the helper, but drop the explicit RCU lock
> 
>     bool topology_is_scale_freq_source(enum scale_freq_source source,
>                                        unsigned int cpu)
>     {
>         struct scale_freq_data *sfd;
>         sfd = rcu_dereference_sched(*per_cpu_ptr(&sft_data, cpu));
>         return sfd && sfd->source == source;
>     }
> 
> Option B: Drop the helper entirely, check directly in arch_cpu_idle_enter()
> If a generic exported helper feels too invasive, we can do the
> check locally within arch_cpu_idle_enter() without touching
> drivers/base/arch_topology.c at all:
> 
>     if (housekeeping_cpu(cpu, HK_TYPE_TICK) &&
>         time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, cpu))) {
>         struct scale_freq_data *sfd;
>         sfd = rcu_dereference_sched(*this_cpu_ptr(&sft_data));
>         if (sfd && sfd->source == SCALE_FREQ_SOURCE_ARCH)
>             amu_scale_freq_tick();
>     }
> 
> This keeps the change entirely in arm64 code and avoids adding
> a new exported symbol. Which approach would you prefer?
I do not mind this additional helper. Besides, not my place to either mind it
or not.
What I do mind is doing the check in the arch idle enter path. I would rather
see some notification triggered when the source gets changed so that
the previous sfd code can do some state transition that would avoid us having
to run the check in the first place.
Still pondering on that one.
Preferably I would drop that 'tick' call from there completely, but apparently
this was needed on some platforms to make AMU readings more reliable.

> 
> > Aside: I should have probably asked that earlier, but I am not sure I do fully
> > understand the case we are trying to fix here.
> > The topology_set_scale_freq_source prefers arch source to others. So if the
> > AMUs were chosen to server as the source for the freq scale - I do not see
> > why the sfd would be changed. That would require calling sequence clear-set
> > to get a different source in place. I do understand the issue itself, though how
> > did we end up there in the first place ?
> 
> The issue arises when topology_clear_scale_freq_source() is called
> with SCALE_FREQ_SOURCE_ARCH to explicitly disable AMU-based frequency
> scaling. This API is exported (EXPORT_SYMBOL_GPL), so it is designed
> to be used by modules or subsystems that need to replace the frequency
> invariance mechanism at runtime.
>  
So this is the bit I was missing: external module that does the switch
willingly giving up on arch provided freq scale source.
The rest is clear. Thanks.

---
BR
Beata

> After clearing, the tick path (topology_scale_freq_tick()) correctly
> skips the AMU update because sft_data is set to NULL. However, the
> idle path (arch_cpu_idle_enter()) bypasses this check by calling
> amu_scale_freq_tick() directly, so arch_freq_scale still gets
> modified by AMU counters.
>  
> This creates an inconsistency: the tick path respects
> topology_clear_scale_freq_source() but the idle path does not.
>  
> The goal of this patch is to make the idle path consistent with
> the tick path, ensuring that topology_clear_scale_freq_source()
> fully disables AMU updates across all paths.

