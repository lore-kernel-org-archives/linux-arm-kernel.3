Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC410CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 15:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7Rlp07E145mjICdfP0fMeKyTSRO79dBuZu7u2IiVMk=; b=QHgrtXiIOQJTcnp2tZmq5fNsVB
	7qGysRgt43Ynu3/eauRetuWlAYH0R6+JCDJ3CleR+afAM7rLa6L7PdvOve6gZICbkQO1peOq5vC52
	Wu/IF/UVeZlfyqYeMkXztPfne78NNvuZdItrhC4BJZX6H/v9tfNm0kMcmtp1hB1WmbYV2ikenhMzg
	mI3Gpq4ZnO220gQb/9xc0xjnO2us5xtKPOFGhaBOBkYjJOehin7M5Lql+BNHy8PcAzkf0cncqxKUU
	ehn3hxR3d3nq2RUh0y7ay16CXBXvkd644TLUsXOzatGYn46v5WnlZZdJj0F4TVdcaD2n2IiLn6Ypn
	w3A1GjOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErAd-00000006K8f-2qla;
	Fri, 31 Oct 2025 15:36:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErAb-00000006K8N-22Vv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 15:36:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EFF2601DC;
	Fri, 31 Oct 2025 15:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E3AEC4CEE7;
	Fri, 31 Oct 2025 15:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761924964;
	bh=f2kdcTzIgflTZpNVJcpB/wXw4Pn7v3oe8LGnD3Ghpv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bgZioyMfejcWWV0MS6C05S2LbsEdxX50diKJLFbw9ByzTss1Ijd602OkOPk5VfJ9K
	 BRKcnvMU8FhGuOYJD6IlhqxkvqA74T7C11v39u1D+WoQbt6yJqS7412XtCYdJe0PHy
	 Ln62jNHD5VjGRqjBBZSBa4jUMaVRdwp5bzP89/ZWKaQCzVlnK86qZsU+w4X0SXlEbI
	 lRkg7pYEBULQLbHiEuqIewp4ucaxmKc3j/liAl9yD7UK/IyLDT6JMbpqc1UA7U21O9
	 xfmguuXRFsOBFWFtnYsZeHmVkddUjMRhYiHjr9QoNL/wS5AGPYJo2404lc9S1uCEeI
	 AAsxziPBgXXWA==
Date: Fri, 31 Oct 2025 16:36:01 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	Paolo Abeni <pabeni@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Simon Horman <horms@kernel.org>, Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>, cgroups@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 05/33] sched/isolation: Save boot defined domain flags
Message-ID: <aQTXYSyPS65nhkvl@localhost.localdomain>
References: <20251013203146.10162-1-frederic@kernel.org>
 <20251013203146.10162-6-frederic@kernel.org>
 <xhsmhecqtoc4b.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xhsmhecqtoc4b.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
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

Le Thu, Oct 23, 2025 at 05:45:40PM +0200, Valentin Schneider a écrit :
> On 13/10/25 22:31, Frederic Weisbecker wrote:
> > HK_TYPE_DOMAIN will soon integrate not only boot defined isolcpus= CPUs
> > but also cpuset isolated partitions.
> >
> > Housekeeping still needs a way to record what was initially passed
> > to isolcpus= in order to keep these CPUs isolated after a cpuset
> > isolated partition is modified or destroyed while containing some of
> > them.
> >
> > Create a new HK_TYPE_DOMAIN_BOOT to keep track of those.
> >
> > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > Reviewed-by: Phil Auld <pauld@redhat.com>
> > ---
> >  include/linux/sched/isolation.h | 1 +
> >  kernel/sched/isolation.c        | 5 +++--
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
> > index d8501f4709b5..da22b038942a 100644
> > --- a/include/linux/sched/isolation.h
> > +++ b/include/linux/sched/isolation.h
> > @@ -7,6 +7,7 @@
> >  #include <linux/tick.h>
> >
> >  enum hk_type {
> > +	HK_TYPE_DOMAIN_BOOT,
> >       HK_TYPE_DOMAIN,
> >       HK_TYPE_MANAGED_IRQ,
> >       HK_TYPE_KERNEL_NOISE,
> > diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
> > index a4cf17b1fab0..8690fb705089 100644
> > --- a/kernel/sched/isolation.c
> > +++ b/kernel/sched/isolation.c
> > @@ -11,6 +11,7 @@
> >  #include "sched.h"
> >
> >  enum hk_flags {
> > +	HK_FLAG_DOMAIN_BOOT	= BIT(HK_TYPE_DOMAIN_BOOT),
> >       HK_FLAG_DOMAIN		= BIT(HK_TYPE_DOMAIN),
> >       HK_FLAG_MANAGED_IRQ	= BIT(HK_TYPE_MANAGED_IRQ),
> >       HK_FLAG_KERNEL_NOISE	= BIT(HK_TYPE_KERNEL_NOISE),
> > @@ -216,7 +217,7 @@ static int __init housekeeping_isolcpus_setup(char *str)
> >
> >               if (!strncmp(str, "domain,", 7)) {
> >                       str += 7;
> > -			flags |= HK_FLAG_DOMAIN;
> > +			flags |= HK_FLAG_DOMAIN | HK_FLAG_DOMAIN_BOOT;
> >                       continue;
> >               }
> >
> > @@ -246,7 +247,7 @@ static int __init housekeeping_isolcpus_setup(char *str)
> >
> >       /* Default behaviour for isolcpus without flags */
> >       if (!flags)
> > -		flags |= HK_FLAG_DOMAIN;
> > +		flags |= HK_FLAG_DOMAIN | HK_FLAG_DOMAIN_BOOT;
> 
> I got stupidly confused by the cpumask_andnot() used later on since these
> are housekeeping cpumasks and not isolated ones; AFAICT HK_FLAG_DOMAIN_BOOT
> is meant to be a superset of HK_FLAG_DOMAIN - or, put in a way my brain
> comprehends, NOT(HK_FLAG_DOMAIN) (i.e. runtime isolated cpumask) is a
> superset of NOT(HK_FLAG_DOMAIN_BOOT) (i.e. boottime isolated cpumask),
> thus the final shape of cpu_is_isolated() makes sense:
> 
>   static inline bool cpu_is_isolated(int cpu)
>   {
>           return !housekeeping_test_cpu(cpu, HK_TYPE_DOMAIN);
>   }

Right, I get confused myself as well. I've been thinking several times about
inverting those housekeeping masks to work instead with isolated masks. But I'm
not sure that would make the APIs easier to use.

> Could we document that to make it a bit more explicit? Maybe something like
> 
>   enum hk_type {
>         /* Set at boot-time via the isolcpus= cmdline argument */
>         HK_TYPE_DOMAIN_BOOT,
>         /*
>          * Updated at runtime via isolated cpusets; strict subset of
>          * HK_TYPE_DOMAIN_BOOT as it accounts for boot-time isolated CPUs.
>          */
>         HK_TYPE_DOMAIN,
>         ...
>   }

I thought I did already but obviously not. Let me fix that...

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

