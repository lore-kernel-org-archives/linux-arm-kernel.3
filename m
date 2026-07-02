Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F353EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 14:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hK1D7/MiBzXevNGIdepqAuSXul+dgG8Rb7MaHHcEoYY=; b=rV7FbWTKZcSNznZFzubkxRGARE
	sLx9sXVb4FYUhwJnxhqsc+yaAva3GPwgSeg4avY5RnB2q24Wniyup0wbfqR0Gs3/yl1b9ciI+eS/k
	rBp3yJuuiIqf2x9bxkDzZZkdGdxcS/MdoXB15yxOXIdx2/ar/MVqMsqNNAEQu7UQdmnefKabI7aHj
	XBNRIA9WXPXNw6WuEK9+LN+nH3g/HgQerO8hyr9nd/Ib6SMT8HKI5A8oR8iTvUQ4xuEMbVZZouvN3
	eElNPkOSKq1h9O0NKxmWLEsyyaQwEj6SLcFnvCFfk48xNvGaw0uMpsIaEDDIShznxr8NKj1WTPU13
	KfVwYJEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIsb-00000004kGI-40n3;
	Thu, 02 Jul 2026 14:59:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIsY-00000004kFq-38WO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 14:59:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA6F5359D;
	Thu,  2 Jul 2026 07:58:56 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5492E3F673;
	Thu,  2 Jul 2026 07:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783004341; bh=C9NdG4BiTUlB99cDaC6WRZx2mRnZMmvU2AHxpo4Q0m4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U/Q8a9Udjy8AhQ9YzP7+7DE9HsK8Qb0YXa/QvgoYfmvtkjg/MrAK0RdbTjJLTm8F1
	 eTXtO7cF4hF3uiv6AIxFlg+UyxKemBDvY/Ht5ujohDndNy2fX0O07z9KdPRWknZUmk
	 Qlfz1rXOPmjEvsOKw3vI1gIRdtb91qHDYvcTW8/c=
Message-ID: <5bba66e2-f671-4bdb-a2e5-f2cf9fb1f9f4@arm.com>
Date: Thu, 2 Jul 2026 15:58:55 +0100
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
 <0ebb1365-9883-4974-9e8f-05c2eaa01fb1@arm.com>
 <b2dae9c4-d0b3-4ec2-884a-569020039b5f@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <b2dae9c4-d0b3-4ec2-884a-569020039b5f@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_075902_958171_8C6F889A 
X-CRM114-Status: GOOD (  21.26  )
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

On 7/2/26 15:46, Reinette Chatre wrote:
> Hi Ben,
> 
> On 7/2/26 2:20 AM, Ben Horgan wrote:
>> On 7/1/26 23:38, Reinette Chatre wrote:
>>> On 5/20/26 2:24 PM, Ben Horgan wrote:
> 
> ...
> 
>>>> --- a/Documentation/arch/arm64/mpam.rst
>>>> +++ b/Documentation/arch/arm64/mpam.rst
>>>> @@ -65,6 +65,23 @@ The supported features are:
>>>>    there is at least one CSU monitor on each MSC that makes up the L3 group.
>>>>    Exposing CSU counters from other caches or devices is not supported.
>>>>  
>>>> +* Memory Bandwidth Usage (MBWU) on or after the L3 cache.  resctrl uses the
>>>> +  L3 cache-id to identify where the memory bandwidth is measured. For this
>>>> +  reason the platform must have an L3 cache with cache-id's supplied by
>>>> +  firmware. (It doesn't need to support MPAM.)
>>>> +
>>>> +  Memory bandwidth monitoring makes use of MBWU monitors in each MSC that
>>>> +  makes up the L3 group. If the memory bandwidth monitoring is on the memory
>>>> +  rather than the L3 then there must be a single global L3 as otherwise it
>>>> +  is unknown which L3 the traffic came from.
>>>> +
>>>> +  To expose 'mbm_total_bytes', the topology of the group of MSC chosen must
>>>> +  match the topology of the L3 cache so that the cache-id's can be
>>>> +  repainted. For example: Platforms with Memory bandwidth monitors on
>>>> +  CPU-less NUMA nodes cannot expose 'mbm_total_bytes' as these nodes do not
>>>> +  have a corresponding L3 cache. 'mbm_local_bytes' is not exposed as MPAM
>>>> +  cannot distinguish local traffic from global traffic.
>>>
>>> Hopefully we can get to a point where memory bandwidth monitoring data from
>>> CPU-less NUMA nodes can be exposed via resctrl. When considering such possible
>>
>> Thank you for your interest here. I hope so too.
>>
>>> future I think it may make this work easier to build on if the documentation
>>> focuses on what the current implementation supports and leave room for
>>> future enhancements by not constraining user space expectation with an absolute
>>> like "CPU-less NUMA nodes cannot expose 'mbm_total_bytes'".
>>
>> The intention was to describe the current limitations but I do see how
>> this can come across as fundamental problems rather than just that we
>> need to do some more work to establish how this can be done and
>> implement it.
>>
>> How about if I add this paragraph at the end?
>>
>> All these restrictions based on L3 cache are due to resctrl, currently,
>> only supporting monitoring at the scope of the L3 scope. It is expected
> 
> How about "at L3 scope" instead of "at the scope of the L3 scope"?

Sure, that reads better.

Ben

> 
>> that going forward more MBWU monitors can be exposed to the user after
>> support for more monitoring scopes is added to resctrl.
> Looks good to me, thank you.
> 
> Reinette


