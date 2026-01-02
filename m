Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1654CEEE25C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 11:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CtNIkQfq4g5bmRXNIzSA2IPSaWMKwTRzAQM0YscGkTo=; b=GYx2SwldqZ0+M9pNuDfK8wgRUs
	ri5usYEN9ShALR4g5GCFrwny6zapD9VG11EqCUhQh15/kRKs9DJWD4JeWyfOClNiEI4PdmgUCBWlX
	2JVMR6PsPRzrw8urUGTrLeBC1NlhFsG2NLN1XVha+OAkZ+8jBYsp/nw1Tv+VNUqIM0iBsgemgWkgv
	RIrqwQA1aDaATkF2yRDMd0ruZxzs8LsOD3Gjd4RJR6n2ct9HTd6VJHcvC0a7clEug5L3qg60b+wVI
	WIWzBNHu6Am8sdPMGc+fYJDkuPP+FrwVnZiV/qYO+wDO6ti2o7oxAntPFBeOE7MUorTJYOVAi4qxs
	oygE63Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbd01-000000086su-2mHd;
	Fri, 02 Jan 2026 11:07:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbczy-000000086sT-2sO6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 11:07:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0074497;
	Fri,  2 Jan 2026 03:07:03 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C22113F63F;
	Fri,  2 Jan 2026 03:07:06 -0800 (PST)
Message-ID: <7ca41a6a-60c1-486f-a0f8-4af256fa1b4a@arm.com>
Date: Fri, 2 Jan 2026 11:07:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/38] arm_mpam: resctrl: Add boilerplate cpuhp and
 domain allocation
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com, Gavin Shan <gshan@redhat.com>,
 rohit.mathew@arm.com, reinette.chatre@intel.com,
 Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <20251205215901.17772-8-james.morse@arm.com>
 <20251218113014.00002691@huawei.com>
 <4495db3f-cfb8-4571-b83a-10a24f7b73a9@arm.com>
 <20251222114804.00005231@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251222114804.00005231@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_030714_774359_3A693175 
X-CRM114-Status: GOOD (  23.06  )
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

Hi Jonathan,

On 12/22/25 11:48, Jonathan Cameron wrote:
> 
>>>> +static struct mpam_resctrl_dom *
>>>> +mpam_resctrl_get_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
>>>> +{
>>>> +	struct mpam_resctrl_dom *dom;
>>>> +	struct rdt_ctrl_domain *ctrl_d;
>>>> +
>>>> +	lockdep_assert_cpus_held();
>>>> +
>>>> +	list_for_each_entry_rcu(ctrl_d, &res->resctrl_res.ctrl_domains,
>>>> +				hdr.list) {
>>>> +		dom = container_of(ctrl_d, struct mpam_resctrl_dom,
>>>> +				   resctrl_ctrl_dom);  
>>>
>>> I'm lazy so haven't checked for more code here in later patches, but
>>> if not, why not iterate the list to access the domain directly rather
>>> than jumping through the rdt_ctrl_domain?
>>>
>>> Something along lines of:
>>> 	
>>> 	list_for_each_entry_rcu(dom, &res->resctrl_res.ctrl_domains,
>>> 				resctrl_ctrl_dom.hdr.list) {
>>> 	}
>>>  
>>
>> Unless I've misunderstood I don't think this works because it's not what
>> the fs/resctrl code expects.
> 
> I think I explained this one badly.
> 
> This should be functionally identical to the above so no visible side
> effects outside of this code.  All this change is meant to do is wrap the
> container_of() in the list iterator. When using the _entry_ variants
> it is wrapping container_of() anyway so just going one level further
> up the hierarchy of nested structures.
> 
> struct a {
> 	struct b {
> 		struct list_head l;
> 	}
> }
> 
> It's actually a list of struct a as all elements on this list are
> struct b instances within struct a, but you are treating it as a list
> of struct b and then using a container_of() to get to struct a on
> each one.
> 
> The change is treat it as a list of struct a with the list_head happening
> to be wrapped in struct b.  Results in slightly simpler code and makes
> the point these are always struct a instances.

Thanks for the detailed explanation. This makes sense to me now and I'll
make the change.

> 
> Jonathan
> 
> 
> 
>>
>>
>>>> +
>>>> +		if (cpumask_test_cpu(cpu, &dom->ctrl_comp->affinity))
>>>> +			return dom;
>>>> +	}
>>>> +
>>>> +	return NULL;
>>>> +}
>>>> +
> 
> 

Thanks,

Ben


