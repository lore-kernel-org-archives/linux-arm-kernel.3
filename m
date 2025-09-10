Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B7DCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 12:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5Cy6SxVatTNly0HkFi2aLEEW8GnfWE82TX8BIu0aYA=; b=lxLXmFnCgmLTYzATMhG53e1CBT
	Ol6nxxaWQl5u33TwNJUyHM6nJIuaY+eQPXZ8Co8iDox1ujAIVY08hnsXbbCJ8WS8XnltXuM5KTXtR
	9Ya+QvbAR8IXru+xa7Eak3x4NzqEd1xPCIjbo5lkvrojRV6hVppx4CfoNuCtEvBU1nSiKt1VBtb9k
	2SHKh43VRPDxTHVSTGT2AOpKOOJOVzYRP8KKBlslb1hBP45nHOqWWm2uPmv+irvGGWUyaJhLE84TQ
	ZVxR1hB5g4638W+QoGxYnF7qdDSTl/tWIabiWdsv//8mCB3+YGikmjQQwyyoeP35iTELae6STd501
	Iqn55mUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwK9R-0000000EBH1-3Z2u;
	Wed, 10 Sep 2025 12:42:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwK9P-0000000EBFB-0LLN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 12:42:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F3E116F8;
	Wed, 10 Sep 2025 05:42:02 -0700 (PDT)
Received: from [10.57.90.208] (unknown [10.57.90.208])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A547E3F694;
	Wed, 10 Sep 2025 05:42:09 -0700 (PDT)
Message-ID: <f660749e-d515-4208-9610-ffc4155b4a0d@arm.com>
Date: Wed, 10 Sep 2025 13:42:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 0/2] Don't broadcast TLBI if mm was only active on
 local CPU
Content-Language: en-GB
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250829153510.2401161-1-ryan.roberts@arm.com>
 <87segumv6w.fsf@DESKTOP-5N7EMDA>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <87segumv6w.fsf@DESKTOP-5N7EMDA>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_054215_243355_63D88A35 
X-CRM114-Status: GOOD (  21.70  )
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

On 10/09/2025 11:57, Huang, Ying wrote:
> Ryan Roberts <ryan.roberts@arm.com> writes:
> 
>> Hi All,
>>
>> This is an RFC for my implementation of an idea from James Morse to avoid
>> broadcasting TBLIs to remote CPUs if it can be proven that no remote CPU could
>> have ever observed the pgtable entry for the TLB entry that is being
>> invalidated. It turns out that x86 does something similar in principle.
>>
>> The primary feedback I'm looking for is; is this actually correct and safe?
>> James and I both believe it to be, but it would be useful to get further
>> validation.
>>
>> Beyond that, the next question is; does it actually improve performance?
>> stress-ng's --tlb-shootdown stressor suggests yes; as concurrency increases, we
>> do a much better job of sustaining the overall number of "tlb shootdowns per
>> second" after the change:
>>
>> +------------+--------------------------+--------------------------+--------------------------+
>> |            |     Baseline (v6.15)     |        tlbi local        |        Improvement       |
>> +------------+-------------+------------+-------------+------------+-------------+------------+
>> | nr_threads |     ops/sec |    ops/sec |     ops/sec |    ops/sec |     ops/sec |    ops/sec |
>> |            | (real time) | (cpu time) | (real time) | (cpu time) | (real time) | (cpu time) |
>> +------------+-------------+------------+-------------+------------+-------------+------------+
>> |          1 |        9109 |       2573 |        8903 |       3653 |         -2% |        42% |
>> |          4 |        8115 |       1299 |        9892 |       1059 |         22% |       -18% |
>> |          8 |        5119 |        477 |       11854 |       1265 |        132% |       165% |
>> |         16 |        4796 |        286 |       14176 |        821 |        196% |       187% |
>> |         32 |        1593 |         38 |       15328 |        474 |        862% |      1147% |
>> |         64 |        1486 |         19 |        8096 |        131 |        445% |       589% |
>> |        128 |        1315 |         16 |        8257 |        145 |        528% |       806% |
>> +------------+-------------+------------+-------------+------------+-------------+------------+
>>
>> But looking at real-world benchmarks, I haven't yet found anything where it
>> makes a huge difference; When compiling the kernel, it reduces kernel time by
>> ~2.2%, but overall wall time remains the same. I'd be interested in any
>> suggestions for workloads where this might prove valuable.
>>
>> All mm selftests have been run and no regressions are observed. Applies on
>> v6.17-rc3.
> 
> I have used redis (a single threaded in-memory database) to test the
> patchset on an ARM server.  32 redis-server processes are run on the
> NUMA node 1 to enlarge the overhead of TLBI broadcast.  32
> memtier-benchmark processes are run on the NUMA node 0 accordingly.
> Snapshot is triggered constantly in redis-server, which fork(), saves
> memory database to disk, exit(), so that COW in the redis-server will
> trigger a large amount of TLBI.  Basically, this tests the performance
> of redis-server during snapshot.  The test time is about 300s.  Test
> results show that the benchmark score can improve ~4.5% with the
> patchset.
> 
> Feel free to add my
> 
> Tested-by: Huang Ying <ying.huang@linux.alibaba.com>
> 
> in the future versions.

Thanks for this - very useful!

> 
> ---
> Best Regards,
> Huang, Ying


