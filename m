Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5759EF327B3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 07:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hOY1e7wMTursbV64EvQ+kCQUkrKXK8UxGHtipMTBOc=; b=eCAlnQH7r3+CMUUOQLV4NxYuCE
	ClvmctxTbhdP8QVxNzKPVyu2Bd5xDwebg8fnivhjygnuNP7IWLgbwEyOVzsO59Ww94yqNhd3lF+3c
	WpDKHV/fRi8+OY13bZWYRvUWke3cLyA+OoL0iIm0ogDyt05ZCXpJgF6Has2AQ/WoRclRnKdhedWT5
	lAM+nhjrdMUfExFhxVm5fImTlVf03ZNg7R9+h9GvgLeaq9DlUBfhHSZKcqIQhXfzaSKG6d/n9whS2
	C0pw8r10HttsPuhJyW71iZIIyCe4YEjRtclacmffqkzQX+nrc2TmCA4DcZGrMut0DcPRXVv1wAGJb
	CxKZo04A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5KI-000000089Oy-3wyZ;
	Tue, 21 Apr 2026 07:15:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5KG-000000089Nx-0Dnn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 07:15:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D75825E0;
	Tue, 21 Apr 2026 00:15:09 -0700 (PDT)
Received: from arm.com (unknown [10.57.89.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AC763F641;
	Tue, 21 Apr 2026 00:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776755714; bh=1NNOk+eJmvh1fUcjXPKrED58fI60eQJmGrCvZy20t20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NWOrOna/dqHHHBSoqj2cEZEw0sLpi1/1pm0lCfVz8K6R2FiWuRNyoI7Z20V4DhUuF
	 ympOETtLPJZy5MwKNn7U8N/X6X/httaAaprbWCkpbjb5xPt9BX7gdKminZXWiXFKeY
	 CkVLJXELaKau+8XS2XwBwOafpy1r0idm19UWq/Gs=
Date: Tue, 21 Apr 2026 08:15:07 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: "Okanovic, Haris" <harisokn@amazon.com>,
	"joao.m.martins@oracle.com" <joao.m.martins@oracle.com>,
	"xueshuai@linux.alibaba.com" <xueshuai@linux.alibaba.com>,
	"david.laight.linux@gmail.com" <david.laight.linux@gmail.com>,
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
	"memxor@gmail.com" <memxor@gmail.com>,
	"ashok.bhat@arm.com" <ashok.bhat@arm.com>,
	"zhenglifeng1@huawei.com" <zhenglifeng1@huawei.com>,
	"konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
	"cl@gentwo.org" <cl@gentwo.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"ast@kernel.org" <ast@kernel.org>,
	"rdunlap@infradead.org" <rdunlap@infradead.org>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"will@kernel.org" <will@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v11 12/14] cpuidle/poll_state: Wait for need-resched via
 tif_need_resched_relaxed_wait()
Message-ID: <aecj-8In0A-G9OGN@arm.com>
References: <20260408122538.3610871-1-ankur.a.arora@oracle.com>
 <20260408122538.3610871-13-ankur.a.arora@oracle.com>
 <a374b23f8b03f850a874d46bc78411fb99483ca2.camel@amazon.com>
 <87mryxh67j.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mryxh67j.fsf@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_001516_824745_BEA729B5 
X-CRM114-Status: GOOD (  20.30  )
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

On Mon, Apr 20, 2026 at 10:50:08AM -0700, Ankur Arora wrote:
> Okanovic, Haris <harisokn@amazon.com> writes:
> > On Wed, 2026-04-08 at 17:55 +0530, Ankur Arora wrote:
> >> The inner loop in poll_idle() polls over the thread_info flags,
> >> waiting to see if the thread has TIF_NEED_RESCHED set. The loop
> >> exits once the condition is met, or if the poll time limit has
> >> been exceeded.
> >>
> >> To minimize the number of instructions executed in each iteration,
> >> the time check is rate-limited. In addition, each loop iteration
> >> executes cpu_relax() which on certain platforms provides a hint to
> >> the pipeline that the loop busy-waits, allowing the processor to
> >> reduce power consumption.
> >>
> >> Switch over to tif_need_resched_relaxed_wait() instead, since that
> >> provides exactly that.
> >>
> >> However, since we want to minimize power consumption in idle, building
> >> of cpuidle/poll_state.c continues to depend on CONFIG_ARCH_HAS_CPU_RELAX
> >> as that serves as an indicator that the platform supports an optimized
> >> version of tif_need_resched_relaxed_wait() (via
> >> smp_cond_load_acquire_timeout()).
> >>
> >> Cc: Rafael J. Wysocki <rafael@kernel.org>
> >> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> >> Cc: linux-pm@vger.kernel.org
> >> Suggested-by: Rafael J. Wysocki <rafael@kernel.org>
> >> Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
> >> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
[...]
> > Tested atop latest mainline d60bc1401 with the rest of your haltpoll
> > changes from separate thread: ~10% improvement in `perf sched bench
> > pipe` micro and ~4-6% throughput improvements in mysql, postgresql,
> > cassandra, and memcached in under-loaded configurations. Tested on
> > AWS Graviton3 and Graviton4, ARM Neoverse V1 and V2 cores
> > respectively.
> >
> > I hope this series can merge soon. It's been stuck in review for more
> > than 2 years.
> >
> > Tested-by: Haris Okanovic <harisokn@amazon.com>
> 
> Thanks Haris. Yeah, I don't think there are any open issues left on
> this.

I agree, though an ack from the atomic infrastructure people on the
generic bits would be nice.

-- 
Catalin

