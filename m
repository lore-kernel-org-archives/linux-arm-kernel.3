Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790F5D29FB8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 08:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcjnpJDcS9pr/1jLW7TlSymlCjKqx1U7IbD8OpRJMN4=; b=vMvBLYFFh5ePMkau++LmelWZ9y
	MWJGhfE+xBBBvrS1OpPFEXNz9IIUFqYcmetWQ/KAPSGQQxgphp2oZJkJSdD3FR+PBZnRIHJ2iXzrE
	2VIqfzGZRr24IqzeGZeTFX+A1L86awAz2dpX357fYuUyOxBlXj5AP/4BEhX7uguuhwniCs87Bio4L
	tDYonba2nIDHayQNU5vOy8Tvb0ZkmCINQ429hf2cKhSXg1a37vG3K6MXg2ekQM9+O3uc/OE4VQ4JC
	m9PNzBPnvIb1riQesdUUa2WJR89IqLJdQt6415P8qnRRsR29PFSllAWy7Bw5QS3jqdUYpyrchYkOU
	MODgaLfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bd0-00000002Kp3-2dtG;
	Wed, 06 Nov 2024 08:43:02 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bTq-00000002ItO-0B0A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 08:33:36 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Xjz2D3WZXz10V72;
	Wed,  6 Nov 2024 16:31:32 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 172571800A5;
	Wed,  6 Nov 2024 16:33:19 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 6 Nov 2024 16:33:18 +0800
CC: <yangyicong@hisilicon.com>, <jonathan.cameron@huawei.com>,
	<mark.rutland@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<hejunhao3@huawei.com>, <linuxarm@huawei.com>, <wangyushan12@huawei.com>,
	<prime.zeng@hisilicon.com>
Subject: Re: [PATCH v3 2/8] drivers/perf: hisi: Improve the detection of
 associated CPUs
To: Will Deacon <will@kernel.org>
References: <20241026072424.29887-1-yangyicong@huawei.com>
 <20241026072424.29887-3-yangyicong@huawei.com>
 <20241029132826.GB4416@willie-the-truck>
 <5895fd31-04f8-f1ea-0639-12dd1f19069c@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <9a64ed90-6c9f-a32a-85cf-9d0c41e2fd81@huawei.com>
Date: Wed, 6 Nov 2024 16:33:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <5895fd31-04f8-f1ea-0639-12dd1f19069c@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_003334_491185_32F9F455 
X-CRM114-Status: GOOD (  36.11  )
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

Hi Will,

Further comment on this patch?

On 2024/10/30 22:04, Yicong Yang wrote:
> On 2024/10/29 21:28, Will Deacon wrote:
>> On Sat, Oct 26, 2024 at 03:24:18PM +0800, Yicong Yang wrote:
>>> From: Yicong Yang <yangyicong@hisilicon.com>
>>>
>>> Currently the associated CPUs are detected in the cpuhp online
>>> callback. If the CPU's sccl_id or the ccl_id matches the PMU's,
>>> they're associated. There's an exception that some PMUs locate
>>> on the SICL and will match no CPUs. The events of these PMUs
>>> can be opened on any online CPUs. To handle this we just check
>>> whether the PMU's sccl_id is -1, if so we know it locates on
>>> SICL and make any CPU associated to it.
>>>
>>> This can be tweaked so in this patch just do the below changes:
>>> - If the PMU doesn't match any CPU then associated it to online CPUs
>>> - Choose the target CPU according to the NUMA affinity for opening
>>>   events
>>>
>>> The function is implemented by hisi_pmu_init_associated_cpus() and
>>> invoked in hisi_pmu_init().
>>>
>>> Also the associated_cpus are maintained with all the online CPUs. This
>>> is redundant since we'll always schedule the events on the online CPUs.
>>> Get rid of this and make associated_cpus contain offline CPUs as well.
>>
>> I don't really understand the rationale for this change. Why is the new
>> behaviour better than the old one?
>>
> 
> Thanks for taking a look.
> 
> As mentioned in the commit, we have 2 types of PMU here:
> 1) PMUs locate on SCCL (Super CPU Cluster *), associated with certain CCL(CPU cluster *)(e.g. L3C PMU)
>    or not (e.g. DDRC PMU)
> 2) PMUs locate on the SICL (Super IO Cluster *), which has no association with certain CPU
>    topology (e.g. CPA PMU)
> 
> Currently we find associated CPUs in the cpuhp callbacks by comparing the CPU's
> MPIDR with the PMU's SCCL ID and CCL ID. This will be fine for type 1) PMUs but
> not for type 2) PMUs since no CPU will match a SICL ID. We do a trick here,
> make type 2) PMUs's SCCL to -1 and match all the CPUs. So in fact type 2) PMUs
> are already associated with online CPUs but in an implicit way. With this patch
> the behaviour will be more clear.
> 
> Another thing is about NUMA locality. Usually for type 2) PMUs they maybe on
> different NUMA node which is not considered in current approach, all SICL PMUs
> are stacked on CPU0. With the patch the NUMA node information will be considered
> if provided by the firmware.
> 
> [*] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/admin-guide/perf/hisi-pmu.rst?h=v6.12-rc1
> 

Another thing is that if the associated CPUs are all offline, previous approach
will show -1 by cpumask while with this patch user will always see a usable CPU
(this is ok since the uncore events are is not associated with certain CPU context
and can be open on any online CPU):

// In the previous approach
[root@localhost devices]# cat hisi_sccl3_l3c1/cpumask
8
// offline all the CPUs sharing sccl3_l3c1
[root@localhost devices]# cat hisi_sccl3_l3c1/cpumask
-1

This should make no difference for the function since perf tool will find an online
CPU for opening the event even if it gets -1 from the cpumask. But -1 maybe a bit
confusing.

Thanks.

>>>
>>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>>> ---
>>>  drivers/perf/hisilicon/hisi_uncore_pmu.c | 56 +++++++++++++++++++-----
>>>  drivers/perf/hisilicon/hisi_uncore_pmu.h |  5 +++
>>>  2 files changed, 49 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
>>> index 416f72a813fc..c3549e16e0c3 100644
>>> --- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
>>> +++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
>>> @@ -399,6 +399,27 @@ void hisi_uncore_pmu_disable(struct pmu *pmu)
>>>  }
>>>  EXPORT_SYMBOL_NS_GPL(hisi_uncore_pmu_disable, HISI_PMU);
>>>  
>>> +static void hisi_pmu_init_associated_cpus(struct hisi_pmu *hisi_pmu)
>>> +{
>>> +	/*
>>> +	 * If the associated_cpus has already been initialized, for example
>>> +	 * determined by comparing the sccl_id and ccl_id with the CPU's
>>> +	 * mpidr_el1, then do nothing here. Otherwise the PMU has no affinity
>>> +	 * and could be opened on any online CPU.
>>> +	 */
>>> +	if (!cpumask_empty(&hisi_pmu->associated_cpus))
>>> +		return;
>>> +
>>> +	cpumask_copy(&hisi_pmu->associated_cpus, cpu_online_mask);
>>
>> Is it always safe to access 'cpu_online_mask' here?
>>
> 
> It should be safe. This function will be called in hisi_pmu_init() in the module
> init stage so the cpu_online_mask() should be populated, at least the current
> running CPU is contained. The hisi_pmu->associated_cpus will be used along
> with the online CPU checking in cpuhp callbacks so we're unlikely to use an
> offline CPU mistakenly. Checked cpumask_local_spread() and it also use the
> cpu_online_mask directly without synchronization against cpuhp process, so
> it also should be ok here. Please correct my if any cases I missed.
> 
> Thanks,
> Yicong
> 
> 
> 
> .
> 

