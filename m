Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F94DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 09:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgiMqwFhBBhGNouKkPtmu/7n2nkwt82+aC9gtEFKpUQ=; b=NXy2jpH1++KPV64BKVrDPjG+98
	nwdu1BnOxKAn0PRh/DCoZR1y87b82xGnbMjqec634C75kfOiV8Ps1bkOXUZ0lTgi24t2fWaBWpext
	4jrWHfnhQJJVnyTUdgQMNRR92///Qol0jt9RWlnIjejyc1ettmz6v8JOA7gp0xTXFCaRxrguXJszH
	Hr+Ss/Ugjjn7g7p/30F2XI1w7NQbg8WkSkScoK+g9yUpRDUzBjx5qxtHp9D3/Z9k6tGsQv03kwZnC
	aiRlz2kfbb8YmtvYy0RxzDe8Py0+7jJ9kt6PxhxOtVRu5EuVlAQlZLC9H/HFibyDIA0tHfRp3U3SX
	rEfhI3CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDb7-00000003zpM-33Jm;
	Thu, 02 Jul 2026 09:20:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDb5-00000003zow-0org
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 09:20:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 389D7356E;
	Thu,  2 Jul 2026 02:20:31 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34B863F85F;
	Thu,  2 Jul 2026 02:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782984035; bh=K8o4r7jN/G13U1mJxGZS0WkLnb+P1aoxVzr1FSwdGrQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NRIHHipPvnpGj2rIwqnjJX7UoUPvX/XwCPBBl428S02/eBhXDM4ApPC5b6JZweDbg
	 viXO7I+Jh5q3F+P18JD+NexxEyBiwPpum+4WcGpWRtrpqGfv6sGzlsJFG4tDGf/pLw
	 JPgqgb5P+nj1w6vkrfcug9iy2ilkzA0X4O7itamY=
Message-ID: <0ebb1365-9883-4974-9e8f-05c2eaa01fb1@arm.com>
Date: Thu, 2 Jul 2026 10:20:24 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v4 5/5] arm64: mpam: Add memory bandwidth usage (MBWU)
 documentation
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 jic23@kernel.org, kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, rohit.mathew@arm.com, scott@os.amperecomputing.com,
 sdonthineni@nvidia.com, tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com,
 zengheng4@huawei.com, x86@kernel.org
References: <20260520212458.1797221-1-ben.horgan@arm.com>
 <20260520212458.1797221-6-ben.horgan@arm.com>
 <4b0552cc-85cc-40b6-ab65-6b7620149f74@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <4b0552cc-85cc-40b6-ab65-6b7620149f74@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_022039_316797_8D7E0501 
X-CRM114-Status: GOOD (  23.99  )
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

Hi Reinette,

On 7/1/26 23:38, Reinette Chatre wrote:
> Hi Ben,
> 
> On 5/20/26 2:24 PM, Ben Horgan wrote:
>> Memory bandwidth monitoring make uses of MBWU monitors and is now exposed
>> to the user via resctrl. Add some documentation so the user knows what to
>> expect.
>>
>> Co-developed-by: James Morse <james.morse@arm.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>>  Documentation/arch/arm64/mpam.rst | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
>> index 570f51a8d4eb..208ff17068c4 100644
>> --- a/Documentation/arch/arm64/mpam.rst
>> +++ b/Documentation/arch/arm64/mpam.rst
>> @@ -65,6 +65,23 @@ The supported features are:
>>    there is at least one CSU monitor on each MSC that makes up the L3 group.
>>    Exposing CSU counters from other caches or devices is not supported.
>>  
>> +* Memory Bandwidth Usage (MBWU) on or after the L3 cache.  resctrl uses the
>> +  L3 cache-id to identify where the memory bandwidth is measured. For this
>> +  reason the platform must have an L3 cache with cache-id's supplied by
>> +  firmware. (It doesn't need to support MPAM.)
>> +
>> +  Memory bandwidth monitoring makes use of MBWU monitors in each MSC that
>> +  makes up the L3 group. If the memory bandwidth monitoring is on the memory
>> +  rather than the L3 then there must be a single global L3 as otherwise it
>> +  is unknown which L3 the traffic came from.
>> +
>> +  To expose 'mbm_total_bytes', the topology of the group of MSC chosen must
>> +  match the topology of the L3 cache so that the cache-id's can be
>> +  repainted. For example: Platforms with Memory bandwidth monitors on
>> +  CPU-less NUMA nodes cannot expose 'mbm_total_bytes' as these nodes do not
>> +  have a corresponding L3 cache. 'mbm_local_bytes' is not exposed as MPAM
>> +  cannot distinguish local traffic from global traffic.
> 
> Hopefully we can get to a point where memory bandwidth monitoring data from
> CPU-less NUMA nodes can be exposed via resctrl. When considering such possible

Thank you for your interest here. I hope so too.

> future I think it may make this work easier to build on if the documentation
> focuses on what the current implementation supports and leave room for
> future enhancements by not constraining user space expectation with an absolute
> like "CPU-less NUMA nodes cannot expose 'mbm_total_bytes'".

The intention was to describe the current limitations but I do see how
this can come across as fundamental problems rather than just that we
need to do some more work to establish how this can be done and
implement it.

How about if I add this paragraph at the end?

All these restrictions based on L3 cache are due to resctrl, currently,
only supporting monitoring at the scope of the L3 scope. It is expected
that going forward more MBWU monitors can be exposed to the user after
support for more monitoring scopes is added to resctrl.

Thanks,

Ben>
> Reinette


