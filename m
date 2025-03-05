Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF26C282E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 11:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pxfxYDlE9uxBTGbJBMJTZoCrTBiodMsWCa8ppowizpA=; b=qDKcROjG/sNnzHfhQfoDPJ39Rb
	NBqv7tPAnACabhcWXMOqPxw/kECG2DzS9MVp9cnefru7v5Lfl5aanEmMGkf78eChoALHkgmMXcZqP
	bCCMM8btpmmioXsNqA2ac79hQEjMqIq+r+fRnovrH0B89AItml0HWAm2TC2jQmSRJFXOmTF5qsVz2
	CTpaurmJMLN07ALSh/Fr58AsV6mtHChXrYJQaQfhSa2uxoj1SH+EaP2Sg4PGD0hPipB2sdXlzdxNM
	PhOFa1pLnGfscbSAgDj+Egd9bMHxt+Y6zqw0oS3RrYQjiXiB6HQRce87A0YIySrpi27zhGXUcfKM1
	xEYuBJzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmlq-00000007pWO-3XEV;
	Wed, 05 Mar 2025 11:18:38 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkdQ-00000007RTC-0nuc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 09:01:50 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Z75zz0DvVzCs97;
	Wed,  5 Mar 2025 16:58:07 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id B769814022D;
	Wed,  5 Mar 2025 17:01:36 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 5 Mar 2025 17:01:35 +0800
CC: <yangyicong@hisilicon.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>,
	<sshegde@linux.ibm.com>
Subject: Re: [PATCH v11 3/4] arm64: topology: Support SMT control on ACPI
 based system
To: Pierre Gondois <pierre.gondois@arm.com>, Sudeep Holla
	<sudeep.holla@arm.com>, <dietmar.eggemann@arm.com>
References: <20250218141018.18082-1-yangyicong@huawei.com>
 <20250218141018.18082-4-yangyicong@huawei.com> <Z8HAkZiHYRjj97M7@bogus>
 <336e9c4e-cd9c-4449-ba7b-60ee8774115d@arm.com>
 <20250228190641.q23vd53aaw42tcdi@bogus>
 <a52972c7-aadd-4a77-a292-057fa5f8372d@arm.com> <Z8WPiOweOjFZqTwN@bogus>
 <32e572d6-dedd-d8a3-13be-6de02303a64d@huawei.com>
 <2fdea4f6-db98-4dc7-947f-e19ee54d2c3c@arm.com> <Z8bPtsO7dEV0lq2M@bogus>
 <153df413-9989-42fe-b574-598ff0fa9716@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <86e32fb3-0ff5-f4f0-3d44-222e63b5a69f@huawei.com>
Date: Wed, 5 Mar 2025 17:01:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <153df413-9989-42fe-b574-598ff0fa9716@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_010148_559734_9E61F036 
X-CRM114-Status: GOOD (  23.67  )
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

On 2025/3/4 23:07, Pierre Gondois wrote:
> 
> 
> On 3/4/25 11:02, Sudeep Holla wrote:
>> On Tue, Mar 04, 2025 at 09:25:02AM +0100, Pierre Gondois wrote:
>>>
>>>
>>> On 3/3/25 15:40, Yicong Yang wrote:
>>>> On 2025/3/3 19:16, Sudeep Holla wrote:
>>>>> On Mon, Mar 03, 2025 at 10:56:12AM +0100, Pierre Gondois wrote:
>>>>>> On 2/28/25 20:06, Sudeep Holla wrote:
>>>>>>>>>
>>>>>>>>> Ditto as previous patch, can get rid if it is default 1.
>>>>>>>>>
>>>>>>>>
>>>>>>>> On non-SMT platforms, not calling cpu_smt_set_num_threads() leaves
>>>>>>>> cpu_smt_num_threads uninitialized to UINT_MAX:
>>>>>>>>
>>>>>>>> smt/active:0
>>>>>>>> smt/control:-1
>>>>>>>>
>>>>>>>> If cpu_smt_set_num_threads() is called:
>>>>>>>> active:0
>>>>>>>> control:notsupported
>>>>>>>>
>>>>>>>> So it might be slightly better to still initialize max_smt_thread_num.
>>>>>>>>
>>>>>>>
>>>>>>> Sure, what I meant is to have max_smt_thread_num set to 1 by default is
>>>>>>> that is what needed anyways and the above code does that now.
>>>>>>>
>>>>>>> Why not start with initialised to 1 instead ?
>>>>>>> Of course some current logic needs to change around testing it for zero.
>>>>>>>
>>>>>>
>>>>>> I think there would still be a way to check against the default value.
>>>>>> If we have:
>>>>>> unsigned int max_smt_thread_num = 1;
>>>>>>
>>>>>> then on a platform with 2 threads, the detection condition would trigger:
>>>>>> xa_for_each(&hetero_cpu, hetero_id, entry) {
>>>>>>       if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)     <---- (entry->thread_num=2) and (max_smt_thread_num=1)
>>>>>>           pr_warn_once("Heterogeneous SMT topology is partly
>>>>>>                         supported by SMT control\n");
>>>>>>
>>>>>> so we would need an additional variable:
>>>>>> bool is_initialized = false;
>>>>>
>>>>> Sure, we could do that or skip the check if max_smt_thread_num == 1 ?
>>>>>
>>>>> I mean
>>>>>     if (entry->thread_num != max_smt_thread_num && max_smt_thread_num != 1)
>>>>>
>>>
>>> I think it will be problematic if we parse:
>>> - first a CPU with 1 thread
>>> - then a CPU with 2 threads
>>>
>>> in that case we should detect the 'Heterogeneous SMT topology',
>>> but we cannot because we don't know whether max_smt_thread_num=1
>>> because 1 is the default value or we found a CPU with one thread.
>>
>> Right, but as per Dietmar's and my previous response, it may be a valid
>> case. See latest response from Dietmar which is explicitly requesting
>> support for this. It may need some special handling if we decide to support
>> that.
> 
> Ah ok, right indeed.
> For heterogeneous SMT platforms, the 'smt/control' file is able to accept
> on/off/forceoff strings. But providing the max #count of threads as an integer would
> be wrong if the CPU doesn't have this #count of threads.
> 
> Initially the idea was to just warn that support might be needed for heterogeneous
> SMT platforms, and let whoever would have such platform solve this case, but just
> disabling the integer interface in this case would solve the issue generically.
> 

ok so let's regard the asymmetric platform as a valid case as suggested (also mentioned
by Dietmar on another thread) and remove the check here. Will update and test.

Thanks.


