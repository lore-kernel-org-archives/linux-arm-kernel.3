Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5F2C282D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 16:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFyw6zs1wiokhsxk0eiZ5by191gbkb1G0Meaen/UrR8=; b=CvgTQk38K2d9+p/sXCKZY3FSZJ
	DwYaGaQF1iKPnkvqaV521p3mi0Rk4y2/OA2THNqlq1YuAsbdVHABsOD5OZnn6mYzpi+lmJb6OZ7ug
	lI83Hfq1Ea4p5mrkBAv3Gwtb/zKzwkedSUoBQBiJmptxRY3YljcFbhM4hUQ5W0ynTVhJOKWS/MyoE
	sJu88TLXGNEmsS0XJngt6g8H1GWT+pcH3wX8WBb9JU1hkuPUFdwfdTAw5rq2ItspJVAvHR09jaw+i
	YUKknRCoZEahJYnWdpAnlMrk1eUTQHKLQ9uf2pA4Y/Ze0HbDA9dy6A31ZMhrbPgf22no6x6SVOZrW
	dWDqZ8UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVNt-00000005U1i-0Zj7;
	Tue, 04 Mar 2025 16:44:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTs6-0000000588t-0L7o
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 15:07:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wFyw6zs1wiokhsxk0eiZ5by191gbkb1G0Meaen/UrR8=; b=OzVFVfOw8kmtRFyJ27OSz/paGj
	QgaI1ldWz7Bj2ZnC4Kd9hwfn2GUHIJC9FEt2w47Eq9WWHi03k1O32Guy35kCCKbA27nplrhbEAS7K
	coUuAfs4Iv/vaYc3iEZbCyyyKbwqHz9lUO4lG+SUjL1BO3hLG3Zk0NrashuRBiRdSRuFanc3n5ylC
	1sCNRlf6DS2jIITvfsPP0xhp+fEJa9XK9ifJs68GfoewbwGQ+turo4xnAd4ankwwWm7lSTkeUEXXe
	ARwo5GaFObS4LYKTtBXlGuJ9CD0J5g7wtqSVV2lTkaAjNw+4D/Tu8DdSvOai/ZJ6SdY6qXa+Uz7Wq
	x4dFr5dQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTs2-000000003Tl-2w9p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:07:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCA88FEC;
	Tue,  4 Mar 2025 07:07:56 -0800 (PST)
Received: from [192.168.1.12] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1B983F66E;
	Tue,  4 Mar 2025 07:07:37 -0800 (PST)
Message-ID: <153df413-9989-42fe-b574-598ff0fa9716@arm.com>
Date: Tue, 4 Mar 2025 16:07:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/4] arm64: topology: Support SMT control on ACPI
 based system
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Yicong Yang <yangyicong@huawei.com>, yangyicong@hisilicon.com,
 catalin.marinas@arm.com, will@kernel.org, tglx@linutronix.de,
 peterz@infradead.org, mpe@ellerman.id.au,
 linux-arm-kernel@lists.infradead.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, dietmar.eggemann@arm.com,
 linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 morten.rasmussen@arm.com, msuchanek@suse.de, gregkh@linuxfoundation.org,
 rafael@kernel.org, jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
 linuxarm@huawei.com, xuwei5@huawei.com, guohanjun@huawei.com,
 sshegde@linux.ibm.com
References: <20250218141018.18082-1-yangyicong@huawei.com>
 <20250218141018.18082-4-yangyicong@huawei.com> <Z8HAkZiHYRjj97M7@bogus>
 <336e9c4e-cd9c-4449-ba7b-60ee8774115d@arm.com>
 <20250228190641.q23vd53aaw42tcdi@bogus>
 <a52972c7-aadd-4a77-a292-057fa5f8372d@arm.com> <Z8WPiOweOjFZqTwN@bogus>
 <32e572d6-dedd-d8a3-13be-6de02303a64d@huawei.com>
 <2fdea4f6-db98-4dc7-947f-e19ee54d2c3c@arm.com> <Z8bPtsO7dEV0lq2M@bogus>
Content-Language: en-US
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <Z8bPtsO7dEV0lq2M@bogus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_150747_181991_F59D20A7 
X-CRM114-Status: GOOD (  22.71  )
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



On 3/4/25 11:02, Sudeep Holla wrote:
> On Tue, Mar 04, 2025 at 09:25:02AM +0100, Pierre Gondois wrote:
>>
>>
>> On 3/3/25 15:40, Yicong Yang wrote:
>>> On 2025/3/3 19:16, Sudeep Holla wrote:
>>>> On Mon, Mar 03, 2025 at 10:56:12AM +0100, Pierre Gondois wrote:
>>>>> On 2/28/25 20:06, Sudeep Holla wrote:
>>>>>>>>
>>>>>>>> Ditto as previous patch, can get rid if it is default 1.
>>>>>>>>
>>>>>>>
>>>>>>> On non-SMT platforms, not calling cpu_smt_set_num_threads() leaves
>>>>>>> cpu_smt_num_threads uninitialized to UINT_MAX:
>>>>>>>
>>>>>>> smt/active:0
>>>>>>> smt/control:-1
>>>>>>>
>>>>>>> If cpu_smt_set_num_threads() is called:
>>>>>>> active:0
>>>>>>> control:notsupported
>>>>>>>
>>>>>>> So it might be slightly better to still initialize max_smt_thread_num.
>>>>>>>
>>>>>>
>>>>>> Sure, what I meant is to have max_smt_thread_num set to 1 by default is
>>>>>> that is what needed anyways and the above code does that now.
>>>>>>
>>>>>> Why not start with initialised to 1 instead ?
>>>>>> Of course some current logic needs to change around testing it for zero.
>>>>>>
>>>>>
>>>>> I think there would still be a way to check against the default value.
>>>>> If we have:
>>>>> unsigned int max_smt_thread_num = 1;
>>>>>
>>>>> then on a platform with 2 threads, the detection condition would trigger:
>>>>> xa_for_each(&hetero_cpu, hetero_id, entry) {
>>>>>       if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)     <---- (entry->thread_num=2) and (max_smt_thread_num=1)
>>>>>           pr_warn_once("Heterogeneous SMT topology is partly
>>>>>                         supported by SMT control\n");
>>>>>
>>>>> so we would need an additional variable:
>>>>> bool is_initialized = false;
>>>>
>>>> Sure, we could do that or skip the check if max_smt_thread_num == 1 ?
>>>>
>>>> I mean
>>>> 	if (entry->thread_num != max_smt_thread_num && max_smt_thread_num != 1)
>>>>
>>
>> I think it will be problematic if we parse:
>> - first a CPU with 1 thread
>> - then a CPU with 2 threads
>>
>> in that case we should detect the 'Heterogeneous SMT topology',
>> but we cannot because we don't know whether max_smt_thread_num=1
>> because 1 is the default value or we found a CPU with one thread.
> 
> Right, but as per Dietmar's and my previous response, it may be a valid
> case. See latest response from Dietmar which is explicitly requesting
> support for this. It may need some special handling if we decide to support
> that.

Ah ok, right indeed.
For heterogeneous SMT platforms, the 'smt/control' file is able to accept
on/off/forceoff strings. But providing the max #count of threads as an integer would
be wrong if the CPU doesn't have this #count of threads.

Initially the idea was to just warn that support might be needed for heterogeneous
SMT platforms, and let whoever would have such platform solve this case, but just
disabling the integer interface in this case would solve the issue generically.

