Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0780FC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 16:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKWHLTxliGt+Tbh7hwbvU0Fa4GfVYbsFsDmdsrV9fPw=; b=Myw8El0R0Un9nCKfPFFoaYZLno
	RE1sde0rxUcn5A744Fp1pgCmjI9+rdLXSCExC8czqxIbIs2EGgxEXkz7X7hIRVF8vNiWI/75Wb2Mu
	f7hibTDw3fKB6Dw6tU/acLSukLMZLfjU6lAhOKVCozuOmQ3XvEND/UB2U+nIyW98yIjnFmTcngUyR
	MNnycO6oiIOy5FWwSaBFsj/Z4EQ1yPe0fhwzgACt1WEr3h0oDLXYT91HoEUqzeGg3cZsQpS/gvD1/
	39K7OWi+a+rxW7NM2kMYTBCjwVstT/z3VSQn/GR26n96SIhOF1iuuAekbpsq3F6GYN/U93ClCHA+n
	58bilVtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EuC-0000000BstT-2ta9;
	Thu, 17 Sep 2026 16:24:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EuB-0000000Bssp-1NuO
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Sep 2026 16:24:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AKWHLTxliGt+Tbh7hwbvU0Fa4GfVYbsFsDmdsrV9fPw=; b=iZokQmM9eeTmNj/Y8blbt93mJj
	5nwCSYOY/Pz/KAn70rWT6LUTfoGacPYa8LliAl+x79Z923zcIhM1bg1O3rErc5emL1u7AjAB2jhex
	6+nOJYYCPx/L8Pvj24vMocvdw2JEjDuGyf99pNQEreXkYQZLSzRpbHBN6tFL7htkdU9eFPic8NtS1
	4HdgOGD7GsIgSczdUauGDNEhRm/kBmBFERnmlDUO55f79v4jeFRducwm0z5Qvc0agteaA/SQCLgtX
	p9QwFI87Lu/CMI9x3Usecy9SA2PoP8SWn/1+sNT+/yVb8L5xV8OiyN2ro6wysEwqFKGFwhA7aGIia
	uk9Srrzw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Eu9-0000000B18W-2nOB;
	Thu, 17 Sep 2026 16:24:09 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 45739303078; Thu, 17 Sep 2026 18:24:09 +0200 (CEST)
Date: Thu, 17 Sep 2026 18:24:09 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Oleg Keri <okerixx@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 1/2] arm64: topology: fix arch_freq_get_on_cpu()
 overflow above 4.19 GHz
Message-ID: <20260917162409.GQ4121339@noisy.programming.kicks-ass.net>
References: <20260917125112.2283-1-okerixx@gmail.com>
 <20260917125112.2283-2-okerixx@gmail.com>
 <20260917153224.GJ4121339@noisy.programming.kicks-ass.net>
 <b7fbe8bc-56b4-4705-b5d8-4a377eb062ee@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7fbe8bc-56b4-4705-b5d8-4a377eb062ee@arm.com>
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

On Thu, Sep 17, 2026 at 05:55:44PM +0200, Dietmar Eggemann wrote:
> On 17.09.26 17:32, Peter Zijlstra wrote:
> > On Thu, Sep 17, 2026 at 02:51:11PM +0200, Oleg Keri wrote:
> 
> [...]
> >> diff --git a/include/linux/topology.h b/include/linux/topology.h
> >> index 709a2dcf4c73..0a4ee12a98d5 100644
> >> --- a/include/linux/topology.h
> >> +++ b/include/linux/topology.h
> >> @@ -351,4 +351,6 @@ static inline unsigned long topology_get_cpu_scale(int cpu)
> >>  
> >>  void topology_set_cpu_scale(unsigned int cpu, unsigned long capacity);
> >>  
> >> +#define cap_scale(v, s)		((v)*(s) >> SCHED_CAPACITY_SHIFT)
> > 
> > This might not be a very good generic helper, since it relies on either
> > of the variables to be u64 for correctness.
> 
> So moving it to a static inline function instead?
> 
> static inline u64 cap_scale(u64 value, u64 scale)
> {
>        return value * scale >> SCHED_CAPACITY_SHIFT;
> }

Yes, that would be much better defined.

