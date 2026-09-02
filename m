Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72263C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHyZ/G63rvwAjwU4vztYef/xCH4xZmisnZYFznJHchw=; b=aPWAMPbFm/PZ0GPkz41hZ6gEat
	CvJprSRLwVH9y44QJb74MJLrsL2DZyYW4MuaT7E/VPmPKwpgfyRkftPbhVZVcvf8iyZF5v5wLMZxx
	DcWZHAPoSxJSDWq9Qqgr2CiTtgwtLInV2IYUdtJp0N4U0bDPZDb/D6DA3ZLDmCp5u/KsI5POWAtGn
	83vIe2fDUGKjVtGCv/jqBLaiiuiUTVYBu/5u3kvLSNvymAtyGldiXC3xBUASSuVz4Irb0sfU19JCC
	T5X07akc3vOGPYieck8Mm4KByP3QJK/1z8XfBeyMtnpIerUDymohnivlebtXEJr4cH7cu19aW/5tf
	WZYpqi6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kpa-0000000EmdA-0uWg;
	Wed, 02 Sep 2026 13:16:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kpZ-0000000Emcs-00zi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:16:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9000741AC8;
	Wed,  2 Sep 2026 13:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E31C1F000E9;
	Wed,  2 Sep 2026 13:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788355004;
	bh=WHyZ/G63rvwAjwU4vztYef/xCH4xZmisnZYFznJHchw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C9SE43wk6wEfvY7rbwjJlIDhxPYF4V8mY5JBn8DHaeqItWWDBLmp5vfg6hVeFPmJt
	 0rarlD9cqaUHCpo2jYgIre0ly39rkiyJVv04hOyUlEV8OzUqniAlwi5s03flzFPLeK
	 lcojVVMmP5puGAJCTODq+wkeRSozRKVFNTVtVc2tj0gEMWlQaHFixWF8jtbXPZAYij
	 EsMvyzQiykJq5mP7pf+Prr9jhVQsFoafmFQsKMd95VtikdmAY2TBAKa7M4p3XbJRzC
	 dKoGPdG4g1bRVpAngjdCXe4UZJMLIgdG5GL3qiJZZOyOvPJbYqs7HPKMg2n2dgMfYe
	 ePcvcMLfslAew==
Date: Wed, 2 Sep 2026 14:16:37 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Usama Anjum <usama.anjum@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, vladimir.murzin@arm.com, ryan.roberts@arm.com, 
	peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, 
	stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, 
	yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, will@kernel.org, 
	ardb@kernel.org
Subject: Re: [PATCH v2 00/20] arm64: Preemptible this_cpu_*() operations
Message-ID: <apgg8HuPzL9R2urz@gremlin>
References: <20260804170503.3513916-1-mark.rutland@arm.com>
 <9789fd67-205a-412f-90d6-42c401d3babe@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9789fd67-205a-412f-90d6-42c401d3babe@arm.com>
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

On Wed, Sep 02, 2026 at 12:55:12PM +0100, Usama Anjum wrote:
> tl;dr
> Comparing this series with the page-table series [a] gives 8 improvements and 3
> regressions.

And the regressions are very small and importantly the improvements that
presumably form the basis of doing any of this at all (i.e. munmap, vmalloc)
perform _better_ with Mark's series, without requiring egregious core mm
changes + complexity.

>
> Fastpath is a Linux kernel performance benchmarking service. The table
> compares the both patched kernels: positive values are faster, negative
> values are slower, and (I)/(R) indicate statistically significant
> improvements/regressions. Unmarked differences are not significant after
> accounting for confidence and noise thresholds.
>
> +---------------------------------+--------------------+-----------------+-----------------------+
> | Benchmark                       | percpu-pgtable [2] |   gpr-fixup [3] |         gpr-fixup [3] |
> |                                 |    vs baseline [1] | vs baseline [1] | vs percpu-pgtable [2] |
> +=================================+====================+=================+=======================+
> | lmbench/lat-mem-rd              |             -0.26% |       (I) 1.24% |             (I) 1.50% |
> | micromm/fork                    |          (I) 1.10% |       (I) 2.46% |             (I) 1.35% |
> | micromm/munmap                  |         (I) 18.10% |      (I) 19.78% |             (I) 1.43% |
> | micromm/vmalloc                 |         (I) 11.92% |      (I) 14.68% |             (I) 2.47% |
> | mmtests/hackbench               |              0.27% |       (I) 1.09% |                 0.81% |
> | mmtests/kernbench               |          (I) 1.19% |       (I) 1.18% |                -0.01% |
> | mmtests/sysbench-cpu            |              0.01% |           0.06% |                 0.05% |
> | mmtests/sysbench-mutex          |             -0.85% |          -0.14% |                 0.72% |
> | mmtests/sysbench-thread         |         (R) -4.49% |       (I) 3.02% |             (I) 7.86% |
> | perf/futex                      |              0.55% |      (R) -2.80% |            (R) -3.34% |
> | perf/sched                      |          (I) 1.61% |          -0.39% |            (R) -1.97% |
> | perf/syscall                    |          (I) 1.54% |           0.98% |                -0.55% |
> | pts/memtier-benchmark           |          (I) 2.37% |       (I) 2.51% |                 0.14% |
> | pts/nginx                       |              0.42% |           0.96% |                 0.54% |
> | pts/perl-benchmark              |          (I) 1.83% |       (I) 1.63% |                -0.20% |
> | pts/pgbench                     |             -0.09% |           0.55% |                 0.65% |
> | pts/pybench                     |             -0.05% |          -0.07% |                -0.02% |
> | pts/redis                       |             -0.00% |          -0.04% |                -0.04% |
> | pts/sqlite-speedtest            |              0.15% |           0.44% |                 0.28% |
> | repro-collection/mysql-workload |              0.73% |           0.25% |                -0.48% |
> | schbench/thread-contention      |              0.42% |       (I) 1.04% |                 0.61% |
> | sockperf/echo-lat-tcp           |          (I) 2.88% |       (I) 1.69% |            (R) -1.16% |
> | sockperf/echo-lat-udp           |          (I) 3.93% |       (I) 5.11% |             (I) 1.14% |
> | sockperf/packet-tp-tcp          |             -0.41% |       (I) 1.37% |             (I) 1.79% |
> | sockperf/packet-tp-udp          |          (I) 1.45% |       (I) 1.49% |                 0.04% |
> | specjbb/composite               |          (I) 1.39% |       (I) 1.65% |                 0.26% |
> | speedometer/v2.0                |         (R) -1.04% |      (R) -1.04% |                 0.00% |
> | speedometer/v2.1                |             -0.10% |           0.10% |                 0.20% |
> | syscall/getpid                  |             -0.98% |           0.52% |             (I) 1.51% |
> | syscall/getppid                 |             -0.43% |           0.14% |                 0.57% |
> | syscall/invalid                 |          (I) 3.06% |       (I) 3.56% |                 0.48% |
> +---------------------------------+--------------------+-----------------+-----------------------+

Lovely :)

Well that settles the debate then!

--
Cheers, Lorenzo

