Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DB1CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++0HR791FkLxlUHcefszxk8YdT4/39Fh4fcB7XpqyVw=; b=YfnxH52McrAuf9FIQ57IFqjrLl
	KmYvXEA3nNFnuVkxguMob/MZp7cDge5MvF/21HhqjDvczgvkQCUmZS7Z6ZVGiFFQv7nMNbaRWnEpg
	fWafLrWVTVhbZ3i9cYufJBZLpICRoXrjMpGA79acPglHuMQWyncakTFUGjFHYcFsmy4A9dL1nEfre
	/QkaK16P6uRAyJ3aRKJa9WVCEqsZ4bp5lHF82A3Ic2B9hj6Q4Fq5RTgk+JiFX53rz4EQJEXpRJ/Np
	UeN9poezlVdpOV8PNGNq6tfhHc03KCngxrsQJ9wRW0WWmvvPgt/MxoRqCs4v9vXL0EfwGSxf/0kwm
	49CBrnqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYnw-00000002D2G-0iIN;
	Tue, 02 Sep 2025 21:44:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utUJ7-000000014BY-2caQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 16:56:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EFE326BE;
	Tue,  2 Sep 2025 09:56:23 -0700 (PDT)
Received: from [10.1.36.209] (unknown [10.1.36.209])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 893283F694;
	Tue,  2 Sep 2025 09:56:30 -0700 (PDT)
Message-ID: <06ca976e-03ff-4376-a29d-24993282dda0@arm.com>
Date: Tue, 2 Sep 2025 17:56:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 0/2] Don't broadcast TLBI if mm was only active on
 local CPU
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 James Morse <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250829153510.2401161-1-ryan.roberts@arm.com>
 <aLcfvIfFb6xD-NXp@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aLcfvIfFb6xD-NXp@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_095633_746404_61343B3D 
X-CRM114-Status: GOOD (  20.11  )
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

On 02/09/2025 17:47, Catalin Marinas wrote:
> On Fri, Aug 29, 2025 at 04:35:06PM +0100, Ryan Roberts wrote:
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
> 
> I suspect it's highly dependent on hardware and how it handles the DVM
> messages. There were some old proposals from Fujitsu:
> 
> https://lore.kernel.org/linux-arm-kernel/20190617143255.10462-1-indou.takao@jp.fujitsu.com/
> 
> Christoph Lameter (Ampere) also followed with some refactoring in this
> area to allow a boot-configurable way to do TLBI via IS ops or IPI:
> 
> https://lore.kernel.org/linux-arm-kernel/20231207035703.158053467@gentwo.org/
> 
> (for some reason, the patches did not make it to the list, I have them
> in my inbox if you are interested)
> 
> I don't remember any real-world workload, more like hand-crafted
> mprotect() loops.
> 
> Anyway, I think the approach in your series doesn't have downsides, it's
> fairly clean and addresses some low-hanging fruits. For multi-threaded
> workloads where a flush_tlb_mm() is cheaper than a series of per-page
> TLBIs, I think we can wait for that hardware to be phased out. The TLBI
> range operations should significantly reduce the DVM messages between
> CPUs.

I'll gather some more numbers and try to make a case for merging it then. I
don't really want to add complexity if there is no clear value.

Thanks for the review.

Thanks,
Ryan




