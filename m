Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC518D5CC8A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 10:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHG105nKKu9zhe+4omRvO+guYK8TNS9YBYr3J/Yd0Ss=; b=FuF5yaavdoLiA+ZWUxszNRDZ3M
	OJxY7eZvZvUlJcvKNmYqqLzd/ez3kOtpQUDprPZuk85UTf4mHbq2qmGEtX9TJywlTtgyXisPQMR54
	vS2nS+qw9omOgbQW9gdwvLMr4pcvXdTc2Q7pGnrzL2WGFnJ5MTXPCnweiWiKKwdrUl/okszEvcNI6
	c0L689h90/+4ya7cXSphBQfIE9vI4h4okFktLKIt/rxbFQwhXiSWEhCils7Tv8lvo/AG6uveA2NFI
	bO1d9Zp7iNeDn1cD3GoFWJUrTT8Ds3yFEGqRGCzD0ru0OkIpy7hh8PrxRomhzbgDrpXHjfe35sFzi
	Eletp1Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t662k-0000000HZRN-01w7;
	Wed, 30 Oct 2024 10:35:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t65pB-0000000HX5o-06Zh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 10:21:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DD0A113E;
	Wed, 30 Oct 2024 03:21:40 -0700 (PDT)
Received: from [192.168.178.6] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF2DA3F73B;
	Wed, 30 Oct 2024 03:21:07 -0700 (PDT)
Message-ID: <570e25e1-03c2-4ae1-8e4c-447a453a9d34@arm.com>
Date: Wed, 30 Oct 2024 11:21:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] [tip: sched/core] sched: Disable PLACE_LAG and
 RUN_TO_PARITY and move them to sysctl
To: Cristian Prundeanu <cpru@amazon.com>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>
Cc: linux-tip-commits@vger.kernel.org, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 Bjoern Doebel <doebel@amazon.com>,
 Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>,
 Geoff Blake <blakgeof@amazon.com>, Ali Saidi <alisaidi@amazon.com>,
 Csaba Csoma <csabac@amazon.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 K Prateek Nayak <kprateek.nayak@amd.com>
References: <ZxuujhhrJcoYOdMJ@BLRRASHENOY1.amd.com>
 <20241029045749.37257-1-cpru@amazon.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <20241029045749.37257-1-cpru@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_032113_186984_988859A3 
X-CRM114-Status: GOOD (  22.85  )
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

Hi Christian,

On 29/10/2024 05:57, Cristian Prundeanu wrote:
> Hi Gautham,
> 
> On 2024-10-25, 09:44, "Gautham R. Shenoy" <gautham.shenoy@amd.com <mailto:gautham.shenoy@amd.com>> wrote:
> 
>> On Thu, Oct 24, 2024 at 07:12:49PM +1100, Benjamin Herrenschmidt wrote:
>>> On Sat, 2024-10-19 at 02:30 +0000, Prundeanu, Cristian wrote:
>>>>
>>>> The hammerdb test is a bit more complex than sysbench. It uses two
>>>> independent physical machines to perform a TPC-C derived test [1], aiming
>>>> to simulate a real-world database workload. The machines are allocated as
>>>> an AWS EC2 instance pair on the same cluster placement group [2], to avoid
>>>> measuring network bottlenecks instead of server performance. The SUT
>>>> instance runs mysql configured to use 2 worker threads per vCPU (32
>>>> total); the load generator instance runs hammerdb configured with 64
>>>> virtual users and 24 warehouses [3]. Each test consists of multiple
>>>> 20-minute rounds, run consecutively on multiple independent instance
>>>> pairs.
>>>
>>> Would it be possible to produce something that Prateek and Gautham
>>> (Hi Gautham btw !) can easily consume to reproduce ?
>>>
>>> Maybe a container image or a pair of container images hammering each
>>> other ? (the simpler the better).
>>
>> Yes, that would be useful. Please share your recipe. We will try and
>> reproduce it at our end. In our testing from a few months ago (some of
>> which was presented at OSPM 2024), most of the database related
>> regressions that we observed with EEVDF went away after running these
>> the server threads under SCHED_BATCH.
> 
> I am working on a repro package that is self contained and as simple to 
> share as possible.
> 
> My testing with SCHED_BATCH is meanwhile concluded. It did reduce the 
> regression to less than half - but only with WAKEUP_PREEMPTION enabled. 
> When using NO_WAKEUP_PREEMPTION, there was no performance change compared 
> to SCHED_OTHER.

Which tasks did you set SCHED_BATCH here? I'm assuming the mysql
'connection' tasks on the SUT (1 task for each virtual user I guess).

I did this and see that the regression goes away. I'm using a similar
test setup (hammerdb - mysql on AWS EC2 instances).

I'm not sure yet how reliable my results are. The big unknown is the
host system when I use AWS EC2 instances for hammerdb (Load Gen) and
mysql (server). In case I gather test results over multiple days, the
host system might have changed?

I also tried the (not-mainlined) RESPECT_SLICE (NO_RUN_TO_PARITY)
features which shows similar results compared to SCHED_BATCH for those
threads.

IIRC, RESPECT_SLICE was also helping Gautham to get the performance back
for his 'sysbench + mysql' workload:

OSPM 24 link to his presentation:

https://youtu.be/jrEN4pJiRWU?t=1115

> (At the risk of stating the obvious, using SCHED_BATCH only to get back to 
> the default CFS performance is still only a workaround, just as disabling 
> PLACE_LAG+RUN_TO_PARITY is; these give us more room to investigate the 
> root cause in EEVDF, but shouldn't be seen as viable alternate solutions.)
> 
> Do you have more detail on the database regressions you saw a few months 
> ago? What was the magnitude, and which workloads did it manifest on?
> 
> -Cristian
> 


