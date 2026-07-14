Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD86DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfEmAG9O9ZgdPSSc0AdiM77dLrvPKoRZOcZtCO40ddI=; b=xqxIvOMz+WC3+lZGgtZgUUcUdm
	FNpT3mzz5CKPU8b6SBqWrEK7TqxqOmY/wKgf3DqPCwD9u21WDy7mut63QDCCAVxupgtjRPks82U+t
	fGlymqehsCaYbTPwXWVnEIuU9O0GsWMuxyFG/R4V/C9r8W44kkA85kGAktVuI+7SCPDCF1vG+7Kv6
	LEHpjTYS+Nm0pODCuj8yP4PakTxAcvadw/sgKUWNrULeapEU6JAGiD1TVgynp7/G6HPpGVUT+fd3N
	B1+ZrLKH1TF9Z2XwWO8BsQ3DRQ8uPtlzQHJtJ50g4fp/cnuCIJPtK/pLfeYePFJvNDZaHKjlgKTR8
	1Wtb9Jlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdPK-0000000CDLg-3pUI;
	Tue, 14 Jul 2026 13:42:46 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdPG-0000000CDIl-0T2q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:42:45 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=SfEmAG9O9ZgdPSSc0AdiM77dLrvPKoRZOcZtCO40ddI=;
	b=RhIxN7/Jrh3HIl8VJVooBcJwD1DzKiabw9mMAQ2Bf0CMzn86t9MGMvEZi8E/M9QziRqRGkuyD
	pLMSGZ/MlxJAl6LeWyHhjBeXa/3IK34lQgGY9tHan7cCINtBZskU8B1cjj1nX0khzLftg80zFWt
	WxqNy+5UWrq+mS8zIp4SMRY=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4h00cG6g9Xz1prL6;
	Tue, 14 Jul 2026 21:33:02 +0800 (CST)
Received: from whupemo500002.china.huawei.com (unknown [7.152.185.250])
	by mail.maildlp.com (Postfix) with ESMTPS id C174B4056D;
	Tue, 14 Jul 2026 21:42:22 +0800 (CST)
Received: from [10.67.120.139] (10.67.120.139) by
 whupemo500002.china.huawei.com (7.152.185.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 14 Jul 2026 21:42:20 +0800
Message-ID: <9b726340-f1db-475c-a3d2-07c5ab449893@huawei.com>
Date: Tue, 14 Jul 2026 21:42:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drivers/perf: hisi: Support uncore ITS PMU
To: Robin Murphy <robin.murphy@arm.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>
CC: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<fanghao11@huawei.com>, <linuxarm@huawei.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, <wangzhou1@hisilicon.com>, Yushan Wang
	<wangyushan12@huawei.com>
References: <20260713125647.2958626-1-wangyushan12@huawei.com>
 <20260713125647.2958626-2-wangyushan12@huawei.com>
 <alYrMQWRL515pYbZ@monoceros> <46634fee-a691-45fb-9dec-ffc9611b6c84@arm.com>
Content-Language: en-US
From: Yushan Wang <wangyushan12@huawei.com>
In-Reply-To: <46634fee-a691-45fb-9dec-ffc9611b6c84@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo500002.china.huawei.com (7.152.185.250)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_064242_486046_6DE3CD7F 
X-CRM114-Status: GOOD (  29.16  )
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

On 7/14/2026 8:56 PM, Robin Murphy wrote:
> On 14/07/2026 1:32 pm, Uwe Kleine-König wrote:
>> Hello,
>>
>> On Mon, Jul 13, 2026 at 08:56:46PM +0800, Yushan Wang wrote:
>>> Support uncore ITS PMU, which provides the capability of counting
>>> the number of interrupts routed to ITS by interrupt catagories, and the
>>> latency. It also supports collecting statistics of micro-ops of ITS.
>>>
>>> The driver adapts to HiSilicon uncore PMU framework. It does not support
>>> overflow interruption, which is the same as NoC PMU, so a few dummy
>>> functions or handling interrupts are left empty.
>>>
>>> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
>>> ---
>>>   Documentation/admin-guide/perf/hisi-pmu.rst  |  13 +
>>>   drivers/perf/hisilicon/Makefile              |   2 +-
>>>   drivers/perf/hisilicon/hisi_uncore_its_pmu.c | 393 +++++++++++++++++++
>>>   3 files changed, 407 insertions(+), 1 deletion(-)
>>>   create mode 100644 drivers/perf/hisilicon/hisi_uncore_its_pmu.c
>>>
>>> diff --git a/Documentation/admin-guide/perf/hisi-pmu.rst b/Documentation/admin-guide/perf/hisi-pmu.rst
>>> index d56b2d690709..278bd7e0ae60 100644
>>> --- a/Documentation/admin-guide/perf/hisi-pmu.rst
>>> +++ b/Documentation/admin-guide/perf/hisi-pmu.rst
>>> @@ -128,6 +128,19 @@ channel with this option. The current supported channels are as follows:
>>>   7. tt_en: NoC PMU supports counting only transactions that have tracetag set
>>>   if this option is set. See the 2nd list for more information about tracetag.
>>>   +8. int_id: ITS PMU supports filtering by interrupt id, which is defined by
>>> +hardware. Interrupt id takes up to 32 bits, and can be divided into 2 parts:
>>> +
>>> +- Upper 16 bits: DeviceID if counting LPI, PEID if counting SGI/PPI.
>>> +- Lower 16 bits: EventID if counting LPI, IntID if counting SGI/PPI.
>>> +
>>> +int_id is a global configuration for each PMU instance. If multiple different
>>> +int_id's are specified, the last came in will be effective. And if there are
>>> +already filtered events running, new filtered events came in will be refused.
>>> +
>>> +9. int_en: A one-bit flag to tell if int_id is used to filter the statistics. It
>>> +allows filtering 0 DeviceID and EventID.
>>> +
>>>   For HiSilicon uncore PMU v3 whose identifier is 0x40, some uncore PMUs are
>>>   further divided into parts for finer granularity of tracing, each part has its
>>>   own dedicated PMU, and all such PMUs together cover the monitoring job of events
>>> diff --git a/drivers/perf/hisilicon/Makefile b/drivers/perf/hisilicon/Makefile
>>> index 186be3d02238..5f28cfdb8a72 100644
>>> --- a/drivers/perf/hisilicon/Makefile
>>> +++ b/drivers/perf/hisilicon/Makefile
>>> @@ -2,7 +2,7 @@
>>>   obj-$(CONFIG_HISI_PMU) += hisi_uncore_pmu.o hisi_uncore_l3c_pmu.o \
>>>                 hisi_uncore_hha_pmu.o hisi_uncore_ddrc_pmu.o hisi_uncore_sllc_pmu.o \
>>>                 hisi_uncore_pa_pmu.o hisi_uncore_cpa_pmu.o hisi_uncore_uc_pmu.o \
>>> -              hisi_uncore_noc_pmu.o hisi_uncore_mn_pmu.o
>>> +              hisi_uncore_noc_pmu.o hisi_uncore_mn_pmu.o hisi_uncore_its_pmu.o
>>>     obj-$(CONFIG_HISI_PCIE_PMU) += hisi_pcie_pmu.o
>>>   obj-$(CONFIG_HNS3_PMU) += hns3_pmu.o
>>> diff --git a/drivers/perf/hisilicon/hisi_uncore_its_pmu.c b/drivers/perf/hisilicon/hisi_uncore_its_pmu.c
>>> new file mode 100644
>>> index 000000000000..430e2b06cf4d
>>> --- /dev/null
>>> +++ b/drivers/perf/hisilicon/hisi_uncore_its_pmu.c
>>> @@ -0,0 +1,393 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Driver for HiSilicon Uncore ITS PMU device
>>> + *
>>> + * Copyright (c) 2026 HiSilicon Technologies Co., Ltd.
>>> + * Author: Yushan Wang <wangyushan12@huawei.com>
>>> + */
>>> +#include <linux/bitops.h>
>>> +#include <linux/cpuhotplug.h>
>>> +#include <linux/device.h>
>>> +#include <linux/io.h>
>>> +#include <linux/mod_devicetable.h>
>>
>> Please rely on linux/platform_device.h to provice acpi_device_id and
>> drop the include for <linux/mod_devicetable.h>.
>>
>>> +static int __init hisi_its_pmu_module_init(void)
>>> +{
>>> +    int ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
>>> +                      "perf/hisi/its:online",
>>> +                      hisi_uncore_pmu_online_cpu,
>>> +                      hisi_uncore_pmu_offline_cpu);
>>
>> <disclaimer>I don't know anything about the functions involved
>> here</disclaimer>
>>
>> This looks fishy. The module might be loaded on any machine, is it right
>> to call hisilicon specific functions then?
>
> This only registers the state with the hotplug mechanism - the callbacks themselves won't ever be invoked until the driver binds to something and calls cpuhp_state_add_instance() from probe.

Thanks for the explanation.

>
> It is true that the dynamic hotplug states are somewhat limited, so at worst it might consume one unnecessarily if the driver is built-in, but this is the status quo for system PMU drivers, and TBH there are enough *other* issues with this whole perf hotplug mess anyway that I wouldn't see this one as a major concern. (FWIW I have started another side-project to make it all go away, which is beginning to look promising...)
>
> That said, in this particular case, HISI_PMU could seemingly do better than registering *multiple* states with the same exact callbacks - registering a single state from the common hisi_uncore_pmu.c framework, then just having all the subdrivers add their instances to that, would be something of an improvement for now.

It's true that in current implementations, the hotplug callbacks are exactly the
same. hisi_uncore_pmu.c mainly serves to provide public functions for other
actual PMU drivers, I can move this dynamic-state planting code into that module
and export the state to other drivers.

There are also some historic static states for HiSilicon PMUs that could migrate
to dynamic ones for better consistency. I will try to do that refactor in the
next version.

Thanks for the suggestions!
Yushan

>
> Thanks,
> Robin.
>
>>
>>> +    if (ret < 0) {
>>> +        pr_err("hisi_its_pmu: Fail to setup cpuhp callbacks, ret = %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +    hisi_its_pmu_cpuhp_state = ret;
>>> +
>>> +    ret = platform_driver_register(&hisi_its_pmu_driver);
>>> +    if (ret)
>>> +        cpuhp_remove_multi_state(hisi_its_pmu_cpuhp_state);
>>> +
>>> +    return ret;
>>> +}
>>> +module_init(hisi_its_pmu_module_init);
>>
>> Best regards
>> Uwe
>
>


