Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1FDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 13:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSn2TI80J+UegCliUYsZ26GExcU41GhAhGl5IETiEZ0=; b=wMYYjUH1A5yqRdS8pkE3r/KuhX
	XnQQbMDJbTGTFeZ2+f82CWX+CVVqkgclzmQmmPVJbJA3pANXvfnZmPbwUuyb8RZxYzEM/OCx9Q5JC
	hhaqfRLw/VOQ3RFVgBJa7K+Urc79IqtjtpeOHlg2uj4eIqPKF6kwx/l/B/SKRJtTk6CcrzVojcX/J
	LYzh9IiW5cI4X+SQa0cleH0Df8ea2r6Lk6G/6hw6f66pWcSpItvARRQufeq/FWenJPnWub/UGMqW5
	JAC/j1+0GBVol+XSz5z/8Swed7bC+O5TF101gUBUGZoiqnyen/QpQu/drnzBK+ymtOjn52FlygKBs
	XrYs/imw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjTS-0000000CcCp-1MCv;
	Mon, 06 Jul 2026 13:35:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjTQ-0000000CcC2-3IZL
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 06 Jul 2026 13:35:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tSn2TI80J+UegCliUYsZ26GExcU41GhAhGl5IETiEZ0=; b=A/c5mEVJOxJy/A/DOAQLHoi5Tw
	bb8jnGsHzcwA1QTJkp+qBad+Bjhptj3csNr2jRmEgcSbFRnxwhzsG4vRXOLnZ2bCvWzIR3ET6ZtQJ
	Zr0S14c1pWPYVN6HPwR6NRutZolSGSZyvrr0hDTRZaVfdVHg/o99Zco4u9HbeYZSQNUuFbwfJ0LrY
	RolW2wrU+xdjH1cuCz3WkhdZ1FLp4AuqmiZQxK8m7BiWZThxD1lJeulMMoi6THcYw1gLW1TYLg2VE
	gzWuQzkL4zoN9w7fxxWudFkKx8FZK09lTfdXR8/CKJUGkOFvQdGumiz4b22Go1khQ8/oM89QiNuWu
	V3T8IG5g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wgjTN-00000006bAK-2CPR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 13:34:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D1CB2BCB;
	Mon,  6 Jul 2026 06:34:50 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2FC43F7B4;
	Mon,  6 Jul 2026 06:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783344894; bh=VyHPLux82Rci3c+vTXx+cTmtDCScjcUWQV8D3CLeEWw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q0+BgtDP9dWJYHe6oO4gick6tJiBot33ghJdx+VvYpT6IygxKwb5+BUIR4qr+fMYF
	 JItlX30Uz2BW9OqeEE7WiXgVKuCsvBniGYayF0ZXCJskMI61bsu14AzQ271JOdpK1J
	 a4HXf54jmzLrZUIoJZHcfaECF0FrjBq3Ffpmb9N0=
Message-ID: <7f360e5d-fe43-4c85-a501-58db5a7dabcb@arm.com>
Date: Mon, 6 Jul 2026 14:34:49 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v4 5/5] arm64: mpam: Add memory bandwidth usage (MBWU)
 documentation
To: Fenghua Yu <fenghuay@nvidia.com>,
 Reinette Chatre <reinette.chatre@intel.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 gshan@redhat.com, james.morse@arm.com, jic23@kernel.org, kobak@nvidia.com,
 lcherian@marvell.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, peternewman@google.com,
 punit.agrawal@oss.qualcomm.com, quic_jiles@quicinc.com,
 rohit.mathew@arm.com, scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, zengheng4@huawei.com,
 x86@kernel.org
References: <20260520212458.1797221-1-ben.horgan@arm.com>
 <20260520212458.1797221-6-ben.horgan@arm.com>
 <4b0552cc-85cc-40b6-ab65-6b7620149f74@intel.com>
 <0ebb1365-9883-4974-9e8f-05c2eaa01fb1@arm.com>
 <b2dae9c4-d0b3-4ec2-884a-569020039b5f@intel.com>
 <5bba66e2-f671-4bdb-a2e5-f2cf9fb1f9f4@arm.com>
 <c7d6acae-cf47-40e9-9937-116303d8dd53@nvidia.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <c7d6acae-cf47-40e9-9937-116303d8dd53@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_143458_211238_F91B57D8 
X-CRM114-Status: GOOD (  22.43  )
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

Hi Fenghua,

On 7/2/26 16:46, Fenghua Yu wrote:
> Hi, Ben,
> 
> On 7/2/26 07:58, Ben Horgan wrote:
>> Hi Reinette,
>>
>> On 7/2/26 15:46, Reinette Chatre wrote:
>>> Hi Ben,
>>>
>>> On 7/2/26 2:20 AM, Ben Horgan wrote:
>>>> On 7/1/26 23:38, Reinette Chatre wrote:
>>>>> On 5/20/26 2:24 PM, Ben Horgan wrote:
>>>
>>> ...
>>>
>>>>>> --- a/Documentation/arch/arm64/mpam.rst
>>>>>> +++ b/Documentation/arch/arm64/mpam.rst
>>>>>> @@ -65,6 +65,23 @@ The supported features are:
>>>>>>     there is at least one CSU monitor on each MSC that makes up
>>>>>> the L3 group.
>>>>>>     Exposing CSU counters from other caches or devices is not
>>>>>> supported.
>>>>>>   +* Memory Bandwidth Usage (MBWU) on or after the L3 cache. 
>>>>>> resctrl uses the
>>>>>> +  L3 cache-id to identify where the memory bandwidth is measured.
>>>>>> For this
>>>>>> +  reason the platform must have an L3 cache with cache-id's
>>>>>> supplied by
>>>>>> +  firmware. (It doesn't need to support MPAM.)
> 
> s/It/The platform/?

ok

> 
>>>>>> +
>>>>>> +  Memory bandwidth monitoring makes use of MBWU monitors in each
>>>>>> MSC that
>>>>>> +  makes up the L3 group. If the memory bandwidth monitoring is on
>>>>>> the memory
>>>>>> +  rather than the L3 then there must be a single global L3 as
>>>>>> otherwise it
> 
> s/a single global L3/a single global L3 cache id/?

"a single global L3" seems better to me. This is just saying that the L3
is or appears to be a single L3 cache. A consequence of which is that it
will have a single cache id.

> 
>>>>>> +  is unknown which L3 the traffic came from.
>>>>>> +
>>>>>> +  To expose 'mbm_total_bytes', the topology of the group of MSC
>>>>>> chosen must
>>>>>> +  match the topology of the L3 cache so that the cache-id's can be
>>>>>> +  repainted. For example: Platforms with Memory bandwidth
>>>>>> monitors on
>>>>>> +  CPU-less NUMA nodes cannot expose 'mbm_total_bytes' as these
>>>>>> nodes do not
>>>>>> +  have a corresponding L3 cache. 'mbm_local_bytes' is not exposed
>>>>>> as MPAM
> 
> Maybe remove the CPU-less example here since you will add CPU-less info
> later?
> 
> The CPU-less patches will update this document accordingly.

I think this can stay until then. It is mentioned after this that the
restrictions are not fundamental.

Thanks,

Ben

> 
>>>>>> +  cannot distinguish local traffic from global traffic.
>>>>>
>>>>> Hopefully we can get to a point where memory bandwidth monitoring
>>>>> data from
>>>>> CPU-less NUMA nodes can be exposed via resctrl. When considering
>>>>> such possible
>>>>
>>>> Thank you for your interest here. I hope so too.
>>>>
>>>>> future I think it may make this work easier to build on if the
>>>>> documentation
>>>>> focuses on what the current implementation supports and leave room for
>>>>> future enhancements by not constraining user space expectation with
>>>>> an absolute
>>>>> like "CPU-less NUMA nodes cannot expose 'mbm_total_bytes'".
>>>>
>>>> The intention was to describe the current limitations but I do see how
>>>> this can come across as fundamental problems rather than just that we
>>>> need to do some more work to establish how this can be done and
>>>> implement it.
>>>>
>>>> How about if I add this paragraph at the end?
>>>>
>>>> All these restrictions based on L3 cache are due to resctrl, currently,
>>>> only supporting monitoring at the scope of the L3 scope. It is expected
>>>
>>> How about "at L3 scope" instead of "at the scope of the L3 scope"?
>>
>> Sure, that reads better.
>>
>> Ben
>>
>>>
>>>> that going forward more MBWU monitors can be exposed to the user after
>>>> support for more monitoring scopes is added to resctrl.
>>> Looks good to me, thank you.
>>>
>>> Reinette
>>
> Thanks.
> 
> -Fenghua


