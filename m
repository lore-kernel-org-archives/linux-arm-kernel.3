Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34530D15DB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 17:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyRTIlA83lB7dKUhohqLPkWo1MVq5eVKHTK3JfG4Qh8=; b=I15hmL88Hwc+WX/GLqwd2y5UBM
	/e1UYKAuZoxAyn+d67ZLjYXp3zk1r9xXm0WEulP0uL59d/PSpkAqpOAYjrtNoyVfKX+IEbB1rWlZs
	lXVnJR1coveJYnw6BdAZatEh65Aozae+U5qmXGIk4eTnIL4l/YPcEmYMjZVkREaN6leKLrIab93uN
	s39ddDtzUAOC8lTNPxKRemsQppIvyYw+85ToXEXOtI/d2JWbv8yfFbBps3VR6pL80ySRyN6XHu2DC
	czYpiA/I/fwgypgchukUyu3ToKV5rpll7cDkgThP92jdQpDLNsW6yWIhwgSuReuGZPO7W7ymrmYrV
	x1AhcuCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQqkh-00000006rvD-42in;
	Wed, 03 Dec 2025 17:34:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQqke-00000006ru5-1nWR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 17:34:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D3EC339;
	Wed,  3 Dec 2025 09:34:41 -0800 (PST)
Received: from [10.1.197.58] (eglon.cambridge.arm.com [10.1.197.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45E733F59E;
	Wed,  3 Dec 2025 09:34:40 -0800 (PST)
Message-ID: <642767c9-f926-490a-83a1-160978c37553@arm.com>
Date: Wed, 3 Dec 2025 17:34:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/34] arm_mpam: Add basic mpam driver
To: Punit Agrawal <punit.agrawal@oss.qualcomm.com>,
 Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, gshan@redhat.com,
 guohanjun@huawei.com, jeremy.linton@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com, lenb@kernel.org,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, lpieralisi@kernel.org, peternewman@google.com,
 quic_jiles@quicinc.com, rafael@kernel.org, robh@kernel.org,
 rohit.mathew@arm.com, scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 sudeep.holla@arm.com, tan.shaopeng@fujitsu.com, will@kernel.org,
 xhao@linux.alibaba.com, reinette.chatre@intel.com
References: <20251119122305.302149-1-ben.horgan@arm.com>
 <877bvfa23i.fsf@stealth> <a04aa337-a3eb-42a0-855b-500ba549e2d8@arm.com>
 <87sedrlsjk.fsf@stealth>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <87sedrlsjk.fsf@stealth>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_093452_622333_AD733972 
X-CRM114-Status: GOOD (  21.16  )
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

Hi Punit,

On 03/12/2025 11:21, Punit Agrawal wrote:
> Ben Horgan <ben.horgan@arm.com> writes:
>> On 11/24/25 15:21, Punit Agrawal wrote:
>>> Although a little late to the party,

There was a party?!


>>> I've managed to throw together
>>> enough firmware to describe the MPAM hardware and take this set (more
>>> specifically mpam/snapshot/v6.18-rc4-v5 branch from James' repository)
>>> for a spin. Using the branch, the kernel is able to probe the hardware
>>> and discover the advertised features. Yay! We are in business.
>>
>> Thanks for giving it a go. :)
>>
>>>
>>> Having said that, there are a few quirks of the platform that run into
>>> issues with later patches in the branch.

So something in the resctrl support code is causing this.
Any idea which patch causes this to happen?

There are a load of pr_debug() in the picking logic, if you enable DYNDEBUG and add:
| dyndbg="file mpam_resctrl.c +pl"

to the commandline, you should get some snotty messages about what non-Xeon-like property
your platform has.



>>> The platform has MSCs attached
>>> to shared L2 caches which are being skipped during later stages of
>>> initialisation. IIUC, the L2 MSCs' limitations stems from the
>>> assumptions in the resctrl interface.
>>
>> What in particualar is being skipped?

> The registration of the discovered MSCs with resctrl and subsequent
> exposing it to the user.

resctrl's 'L2' support is limited to the CPOR bitmap.
If you have controls, there is no resctrl 'event' that can exposed them.
(the problem being they all have 'L3' in the name!)


>>> I was wondering if there are any patches available to relax these
>>> limitations?

Knowing which property it is will help - but some of these things are checked
to match resctrl's ABI. They can't necessarily be relaxed without breaking
user-space.

Others are sanity checks, e.g. all CPUs are represented. This is to avoid tasks
that run on cpu-9 escaping the resctrl controls. Platforms that did this may as
well not bother with resctrl at all.


>>> I can give them a try. Or do these need to be put together
>>> from the ground up? Any pointers greatly appreciated.
>>
>> There are some extra things added in the extras branch [1] e.g. cache
>> maximum usage controls (cmax). However, lots of possible things are
>> still missing e.g. any monitors on L2. If it doesn't fit with the
>> topology expected by resctrl then it is unlikely to have been considered
>> yet.
> 
> Thanks for the pointer. I'll give the snapshot+extras branch[1] a try.
> 
> The platform does have both controls and monitors attached to L2. If
> this isn't being looked at, I can try and put something together. Thanks
> for confirming that the limitation is likely due to resctrl.

My view on 'extra' counters is to try and expose them via perf, as this would also
allow platform specific counters. I worry that if we start adding 'easy' ones like
l2_mbm_total to resctrl, someone will want left_hand_side_of_soc_mbm_total.


Thanks,

James

