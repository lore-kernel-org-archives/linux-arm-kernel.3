Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B467E6689E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 09:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5L9v6OHnfP7k9c007lGzW0HGlDUIr8rUpNU8k/eVRD0=; b=byW+e4av97FGfK0RW+bGeFWbXS
	llrCnTVB5Q68lSJz2hFv1ckA/lXFwhtuA8LpYQssOt4eBIoadnsNtXLCFhK3j7kCUQkqcqJbnPIeq
	m6aLbUtoVXGoatwdJ+axhnsOyBVeDzjyGWqDpEhosjA2UUtnRE+KnU12kuZbV2FKOO3joUsvO/IFH
	1+2nap39HQ+kaaUFC7wHIJ5cbUFfSIO1NecvPMpcM7wAvV71UYdE0+oPaS30OPUUC1FS4vF1PteGN
	KvdDStNdYVMXKRK74q/HS+uiqulLrav8MwW2N4BjVpZIP8W0vJ41dr93o+0yEEvahcoY+eoFoJ85X
	mdtFIuhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWsyX-0000000BS6u-1tW2;
	Sat, 20 Dec 2025 09:10:09 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWsyU-0000000BS5M-0xM9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 09:10:08 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5L9v6OHnfP7k9c007lGzW0HGlDUIr8rUpNU8k/eVRD0=;
	b=dnFirHVsQJG1MYA63EaUda5tdfnpb6DM+gkVVQb9asWwPX/RRRbmKnSFqj1A0pRr4czlGluYL
	OaTaxpkhysq955QRNaU7xyZBdsvIMm1ioJrEUdT/PUWTGs7BAVs0Te62V7BnbNHH1rH7V2pJfrX
	frcQCnXIpZQ1zZp8D29GYss=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4dYJS90lXGzRhRm;
	Sat, 20 Dec 2025 17:06:49 +0800 (CST)
Received: from kwepemf200001.china.huawei.com (unknown [7.202.181.227])
	by mail.maildlp.com (Postfix) with ESMTPS id EA80940565;
	Sat, 20 Dec 2025 17:09:53 +0800 (CST)
Received: from [10.67.121.90] (10.67.121.90) by kwepemf200001.china.huawei.com
 (7.202.181.227) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 20 Dec
 2025 17:09:53 +0800
Message-ID: <62ad0257-aa50-4ab6-bd46-64c3963e4b94@huawei.com>
Date: Sat, 20 Dec 2025 17:09:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] arm64: topology: Handle AMU FIE setup on CPU
 hotplug
To: Beata Michalska <beata.michalska@arm.com>
CC: Will Deacon <will@kernel.org>, <catalin.marinas@arm.com>,
	<rafael@kernel.org>, <viresh.kumar@linaro.org>, <sudeep.holla@arm.com>,
	<gregkh@linuxfoundation.org>, <dakr@kernel.org>, <ionela.voinescu@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<vincent.guittot@linaro.org>, <zhanjie9@hisilicon.com>,
	<lihuisong@huawei.com>, <yubowen8@huawei.com>, <zhangpengjie2@huawei.com>,
	<wangzhi12@huawei.com>, <linhongye@h-partners.com>
References: <20251119081356.2495290-1-zhenglifeng1@huawei.com>
 <aS2z0EURwHbbGZab@arm.com> <9b6882dc-a91a-42d6-bf76-347338930d71@huawei.com>
 <aS8GZOuaS1-j14MD@arm.com> <29253319-ced9-4ab6-a58e-28afdf235cde@huawei.com>
 <aTx2V4am0FNHm03R@google.com>
From: "zhenglifeng (A)" <zhenglifeng1@huawei.com>
In-Reply-To: <aTx2V4am0FNHm03R@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.90]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemf200001.china.huawei.com (7.202.181.227)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_011006_931657_C7D95D8A 
X-CRM114-Status: GOOD (  17.04  )
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

On 2025/12/13 4:08, Will Deacon wrote:
> On Fri, Dec 12, 2025 at 05:27:09PM +0800, zhenglifeng (A) wrote:
>> On 2025/12/2 23:31, Beata Michalska wrote:
>>> On Tue, Dec 02, 2025 at 11:05:25AM +0800, zhenglifeng (A) wrote:
>>>> On 2025/12/1 23:27, Beata Michalska wrote:
>>>>> Hi,
>>>>>
>>>>> Apologies for the delay in reviewing this - currently in progress....
>>>>> Out of curiosity: what's the cpufreq driver used for testing this series ?
>>>>
>>>> I used cppc_cpufreq for testing this. But with some modifications in
>>>> processor_driver.c, or you'll find that the driver will fail to load with
>>>> maxcpus set. The modification below is only a temporary solution. I'm still
>>>> working on that.
>>>>
>>> Right, so overall the implementation looks good - thanks for that.
>>> There are two issues though with the cppc cpufreq driver.
>>>
>>> One: as you have already noticed - it fails to register when
>>> cpumask_present != cpumask_online.
>>>
>>> Second: it will mix the sources of the freq scale if not all CPUs within the
>>> policy have AMUs enabled/valid. This is due to the fact that at the time of
>>> registering the driver and initializing the FIE support policy->cpus ==
>>> policy->related_cpus. Assuming scenario when there are two CPUs within the
>>> policy, one being offline and missing valid AMU counters,
>>> the topology_set_scale_freq_source from cppc cpufreq driver will register
>>> the tick handler for both CPUs, whereas AMU support will (rightly so) register
>>> only for the firs one. When the second CPU comes online, the mismatch will be
>>> detected and the arch callback will get cleared for the first CPU, but the
>>> second one will remain unchanged.
>>>
>>> That said, I do not think any of those issues is a blocker for this series.
>>> But both would need fixing.
>>
>> I believe Beata is OK with this series. So I think we can move ahead with it
>> now.
> 
> Please repost at -rc1. It would be nice to have an Ack from Beata...

Hi Beata,

It would be nice if you could give this patch an Ack.

Thanks.

> 
> Will
> 


