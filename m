Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A775BCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 10:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dPkQpdVa99UyynuCGcWlFBgQL5dWjTgOTDlsFXVLJp4=; b=qjPIQiFUAkcLZpJld1ukMPeLlx
	G759qmSXslmetTRz/ZeDKnlrFIXw7fgSKFZRZrBPEEZHqt4A3YqYCWJHfW7UiT8EebHCu1Nm7/tft
	pn1AoQW7hQWy0U2D1KP+gIsfEdKjJ8Z0osyYmpEvUgVqPP3pRQopyPjO8NE5ZIiZ3KyeKMv19t691
	act66Li3fmVryvwWsj7k86JiqpzJFsA5C0XDLB07aUuUQlQZ7Mzfgt0FIkheHLrcMAA/gLh4Hd347
	0P+OIrKcW7Jr+khPBE8bbAc7ltJjdnKPafuVwN0uIf6Keabg8HI/1Wk7QWMuRAnlPCUvxj8mBMQyC
	UHwXC9GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwIWN-0000000DfCC-148z;
	Wed, 10 Sep 2025 10:57:51 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwIWJ-0000000Df9E-3pgo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 10:57:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1757501863; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=dPkQpdVa99UyynuCGcWlFBgQL5dWjTgOTDlsFXVLJp4=;
	b=f5WxhrpJRINApba6UfGPpKnLckSjEQVTMb2fp/cwaxCdTx752/+2oPbms1cPsyre1WiU7ajZl6sZICAsH0eqvXQeP6/MREIWsnaxmkusP1mY30GoQV5aHBk4c8sRm/EoGaq/NpmdnysI3yrvKr05R7kcnzFwazTmVflFjp0s8vw=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WnhraVx_1757501849 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 10 Sep 2025 18:57:42 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>,  Mark Rutland <mark.rutland@arm.com>,  James Morse
 <james.morse@arm.com>,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 0/2] Don't broadcast TLBI if mm was only active
 on local CPU
In-Reply-To: <20250829153510.2401161-1-ryan.roberts@arm.com> (Ryan Roberts's
	message of "Fri, 29 Aug 2025 16:35:06 +0100")
References: <20250829153510.2401161-1-ryan.roberts@arm.com>
Date: Wed, 10 Sep 2025 18:57:27 +0800
Message-ID: <87segumv6w.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_035748_626723_69FD7BE1 
X-CRM114-Status: GOOD (  20.81  )
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

Ryan Roberts <ryan.roberts@arm.com> writes:

> Hi All,
>
> This is an RFC for my implementation of an idea from James Morse to avoid
> broadcasting TBLIs to remote CPUs if it can be proven that no remote CPU could
> have ever observed the pgtable entry for the TLB entry that is being
> invalidated. It turns out that x86 does something similar in principle.
>
> The primary feedback I'm looking for is; is this actually correct and safe?
> James and I both believe it to be, but it would be useful to get further
> validation.
>
> Beyond that, the next question is; does it actually improve performance?
> stress-ng's --tlb-shootdown stressor suggests yes; as concurrency increases, we
> do a much better job of sustaining the overall number of "tlb shootdowns per
> second" after the change:
>
> +------------+--------------------------+--------------------------+--------------------------+
> |            |     Baseline (v6.15)     |        tlbi local        |        Improvement       |
> +------------+-------------+------------+-------------+------------+-------------+------------+
> | nr_threads |     ops/sec |    ops/sec |     ops/sec |    ops/sec |     ops/sec |    ops/sec |
> |            | (real time) | (cpu time) | (real time) | (cpu time) | (real time) | (cpu time) |
> +------------+-------------+------------+-------------+------------+-------------+------------+
> |          1 |        9109 |       2573 |        8903 |       3653 |         -2% |        42% |
> |          4 |        8115 |       1299 |        9892 |       1059 |         22% |       -18% |
> |          8 |        5119 |        477 |       11854 |       1265 |        132% |       165% |
> |         16 |        4796 |        286 |       14176 |        821 |        196% |       187% |
> |         32 |        1593 |         38 |       15328 |        474 |        862% |      1147% |
> |         64 |        1486 |         19 |        8096 |        131 |        445% |       589% |
> |        128 |        1315 |         16 |        8257 |        145 |        528% |       806% |
> +------------+-------------+------------+-------------+------------+-------------+------------+
>
> But looking at real-world benchmarks, I haven't yet found anything where it
> makes a huge difference; When compiling the kernel, it reduces kernel time by
> ~2.2%, but overall wall time remains the same. I'd be interested in any
> suggestions for workloads where this might prove valuable.
>
> All mm selftests have been run and no regressions are observed. Applies on
> v6.17-rc3.

I have used redis (a single threaded in-memory database) to test the
patchset on an ARM server.  32 redis-server processes are run on the
NUMA node 1 to enlarge the overhead of TLBI broadcast.  32
memtier-benchmark processes are run on the NUMA node 0 accordingly.
Snapshot is triggered constantly in redis-server, which fork(), saves
memory database to disk, exit(), so that COW in the redis-server will
trigger a large amount of TLBI.  Basically, this tests the performance
of redis-server during snapshot.  The test time is about 300s.  Test
results show that the benchmark score can improve ~4.5% with the
patchset.

Feel free to add my

Tested-by: Huang Ying <ying.huang@linux.alibaba.com>

in the future versions.

---
Best Regards,
Huang, Ying

