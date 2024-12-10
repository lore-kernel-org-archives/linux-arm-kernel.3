Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576EEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 13:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrGX2P8h5S8FXjwp+GaR/VGtnUcUeOjvFRq4Jbh1vAE=; b=SMBcPAXEKSETJewVW61g0k2bIh
	zsrJ7I9ZGPCjYgyWF8Y7KEN1k1P6XWt8NPU7gbTRSmvkEQOscsQsRUyugqRA7rffKG8ZW5hs5IJeH
	g81eU8ovTnjqPpS2vBGa7THBT52Au7qQQteocSr/g2ZEqDhV7c+3kjMJIw81fB7vHhmsCs/7R2SVn
	VBVWSECr4AiDsAZJESfa6FVKz5Qqc/zLGxmkVsJib2CPTRjZc3EoxJxn3yT9R4VvSuaaMM2zfrcPz
	VMwHM1MYLX7Fx8uyfL0po1RIjYj4EAewOKiofODdbcTEzdcr+Weu5S2JXJ+jeGr0o38bMJao2gsR9
	XSvk3/eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL00A-0000000BXb0-1hvu;
	Tue, 10 Dec 2024 13:10:10 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzso-0000000BW9b-1jUy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 13:02:36 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Y6zP16pB8z21myt;
	Tue, 10 Dec 2024 21:00:37 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id CF5F4140153;
	Tue, 10 Dec 2024 21:02:21 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 10 Dec 2024 21:02:21 +0800
CC: <yangyicong@hisilicon.com>, <jonathan.cameron@huawei.com>,
	<mark.rutland@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<hejunhao3@huawei.com>, <linuxarm@huawei.com>, <wangyushan12@huawei.com>,
	<prime.zeng@hisilicon.com>
Subject: Re: [PATCH v4 08/10] drivers/perf: hisi: Export associated CPUs of
 each PMU through sysfs
To: Will Deacon <will@kernel.org>
References: <20241203125049.39458-1-yangyicong@huawei.com>
 <20241203125049.39458-9-yangyicong@huawei.com>
 <20241209154830.GC12428@willie-the-truck>
 <22a35ead-0f0b-39a8-16bd-333143081ea8@huawei.com>
 <20241210113949.GE14735@willie-the-truck>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <b9f1eeef-e3db-415a-e8a2-0604ca1d6519@huawei.com>
Date: Tue, 10 Dec 2024 21:02:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20241210113949.GE14735@willie-the-truck>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_050234_753564_00D63D04 
X-CRM114-Status: GOOD (  26.40  )
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

On 2024/12/10 19:39, Will Deacon wrote:
> On Tue, Dec 10, 2024 at 06:49:15PM +0800, Yicong Yang wrote:
>> On 2024/12/9 23:48, Will Deacon wrote:
>>> On Tue, Dec 03, 2024 at 08:50:47PM +0800, Yicong Yang wrote:
>>>> From: Yicong Yang <yangyicong@hisilicon.com>
>>>>
>>>> Although the event of the uncore PMU can only be opened on a single
>>>> CPU, some PMU does have the affinity on a range of CPUs. For example
>>>> the L3C PMU is associated to the CPUs sharing the L3T it monitors.
>>>> Users may infer this affinity by the PMU name which may have SCCL ID
>>>> and CCL ID encoded (for L3C etc), but it's not that straightforward.
>>>> So export this information by adding an "associated_cpus" sysfs
>>>> attribute then user can get this directly.
>>>>
>>>> Reviewed-by: Jonathan Cameron <Joanthan.Cameron@huawei.com>
>>>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>>>> ---
>>>>  Documentation/admin-guide/perf/hisi-pmu.rst |  5 ++++-
>>>>  drivers/perf/hisilicon/hisi_uncore_pmu.c    | 10 ++++++++++
>>>>  2 files changed, 14 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/admin-guide/perf/hisi-pmu.rst b/Documentation/admin-guide/perf/hisi-pmu.rst
>>>> index 5cc248d18c63..48992a0b8e94 100644
>>>> --- a/Documentation/admin-guide/perf/hisi-pmu.rst
>>>> +++ b/Documentation/admin-guide/perf/hisi-pmu.rst
>>>> @@ -35,7 +35,10 @@ e.g. hisi_sccl1_hha0/rx_operations is RX_OPERATIONS event of HHA index #0 in
>>>>  SCCL ID #1.
>>>>  
>>>>  The driver also provides a "cpumask" sysfs attribute, which shows the CPU core
>>>> -ID used to count the uncore PMU event.
>>>> +ID used to count the uncore PMU event. An "associated_cpus" sysfs attribute is
>>>> +also provided to show the CPUs associated with this PMU. The "cpumask" indicates
>>>> +the CPUs to open the events, usually as a hint for userspaces tools like perf.
>>>> +It only contains one associated CPU from the "associated_cpus".
>>>
>>> What is userspace expected to do with this information? Can you point me
>>> to patches that add the corresponding support to the 'perf' tool, please?
>>>
>>
>> two attributes here, "cpumask" and "associated_cpus". For "cpumask" it's used in
>> perf [1], this patch does no change to this attribute but only update the
>> description in the doc.
>>
>> I think you're questioning about the "associated_cpus" introduced by this patch,
>> which is not intended to be used by the perf tools but provides a hint for the
>> user to know the CPUs monitored by which uncore PMU, for example which uncore
>> L3C PMU's monitoring the events by the CPU(s) the application's running on, or
>> if the counts is imbalanced among the L3C PMUs user can figure out what's running
>> on the CPUs provided by the "associated_cpus". As described in the commit this
>> can also inferred by the PMU name to map SICL ID and CCL ID to certain CPU cluster,
>> but these ID's aren't readable enough and it'll be more straightforward and
>> friendly to provide an "associated_cpus" information, considering we've already
>> maintain it in the drvier.
> 
> Bah. I just noticed that there's precedent for this in the Arm CSPMU driver,
> so I don't really have a leg to stand on despite my objections to funneling
> firmware information through to userspace without a confirmed user.
> 

it's bit complex to identify the uncore PMU in the system for better usage
of monitoring or performance analyzing since there are many instances like L3C
and DDRC PMU in the system. So this maybe an easier and cheaper way for the
user to map the PMU to the CPUs where interested tasks' running on without
much knowledge/documentation of the platform specific information like ID
mapping which may varies from different products.

Thanks.


