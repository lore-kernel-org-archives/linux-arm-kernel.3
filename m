Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AE1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HM0r3fuqzVLI6YJJ/KEWLQrTitGTwnm0MpHq5+JXQBE=; b=GdwWkgaNYPCYRr1Rw0CJx9ZtRZ
	En2I0QvUyVpOKVpa9qErCV4+NWTM5lIyxNhp0Gmfv7iuOb6je2DDyxQgUstqppxrXqfAsgHvjJ6db
	GC+D+8vS+6w10de9NsmIetwVg8UpztSdqrB7MkrDFTvmh1qlDxMeP3VrKjStFB2MowZJJ9pVAvmWw
	VTXRBdTF4A1crXTTp48EgREQOXXolmNKLq+WB/xLGBRH1DFgAol0YPYdH7YyHGHOzOYSAkqjRZ0hr
	4umigJbd7YX2oyR4Z1JNlQvcQIXnq/SLZIR4tsbR1Gh9HyJuHu1BRcmcI94ENKCJo/Cwm0JOnDF6L
	tSYCY7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcgQ-0000000C0qC-0Gdl;
	Tue, 14 Jul 2026 12:56:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcgN-0000000C0nl-0h5r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:56:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A58421477;
	Tue, 14 Jul 2026 05:56:12 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 463053F7B4;
	Tue, 14 Jul 2026 05:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784033776; bh=CH/eOkGpnJwU62762Yq2HLkAz3zHZHqmpRDlk5XttSg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ADUpfqS+XVofA7D7x1dl+xm+ISRvFZKormjEvZ2tdRf8++wsCCt/HoAOBohJx1JIZ
	 msfQaFoJaBH2Y7+Ss4wy92ktZDj1VIzblBorMDzm+8BQYXU0XPSyiRnG6Gqc0B75I2
	 +PAVc4Wp+ghby0WMF4f2R4fOcRfzlMsyy9mEEewI=
Message-ID: <46634fee-a691-45fb-9dec-ffc9611b6c84@arm.com>
Date: Tue, 14 Jul 2026 13:56:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drivers/perf: hisi: Support uncore ITS PMU
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Yushan Wang <wangyushan12@huawei.com>
Cc: will@kernel.org, mark.rutland@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fanghao11@huawei.com, linuxarm@huawei.com, liuyonglong@huawei.com,
 prime.zeng@hisilicon.com, wangzhou1@hisilicon.com
References: <20260713125647.2958626-1-wangyushan12@huawei.com>
 <20260713125647.2958626-2-wangyushan12@huawei.com>
 <alYrMQWRL515pYbZ@monoceros>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <alYrMQWRL515pYbZ@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_055619_327348_483E63D5 
X-CRM114-Status: GOOD (  30.57  )
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

On 14/07/2026 1:32 pm, Uwe Kleine-König wrote:
> Hello,
> 
> On Mon, Jul 13, 2026 at 08:56:46PM +0800, Yushan Wang wrote:
>> Support uncore ITS PMU, which provides the capability of counting
>> the number of interrupts routed to ITS by interrupt catagories, and the
>> latency. It also supports collecting statistics of micro-ops of ITS.
>>
>> The driver adapts to HiSilicon uncore PMU framework. It does not support
>> overflow interruption, which is the same as NoC PMU, so a few dummy
>> functions or handling interrupts are left empty.
>>
>> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
>> ---
>>   Documentation/admin-guide/perf/hisi-pmu.rst  |  13 +
>>   drivers/perf/hisilicon/Makefile              |   2 +-
>>   drivers/perf/hisilicon/hisi_uncore_its_pmu.c | 393 +++++++++++++++++++
>>   3 files changed, 407 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/perf/hisilicon/hisi_uncore_its_pmu.c
>>
>> diff --git a/Documentation/admin-guide/perf/hisi-pmu.rst b/Documentation/admin-guide/perf/hisi-pmu.rst
>> index d56b2d690709..278bd7e0ae60 100644
>> --- a/Documentation/admin-guide/perf/hisi-pmu.rst
>> +++ b/Documentation/admin-guide/perf/hisi-pmu.rst
>> @@ -128,6 +128,19 @@ channel with this option. The current supported channels are as follows:
>>   7. tt_en: NoC PMU supports counting only transactions that have tracetag set
>>   if this option is set. See the 2nd list for more information about tracetag.
>>   
>> +8. int_id: ITS PMU supports filtering by interrupt id, which is defined by
>> +hardware. Interrupt id takes up to 32 bits, and can be divided into 2 parts:
>> +
>> +- Upper 16 bits: DeviceID if counting LPI, PEID if counting SGI/PPI.
>> +- Lower 16 bits: EventID if counting LPI, IntID if counting SGI/PPI.
>> +
>> +int_id is a global configuration for each PMU instance. If multiple different
>> +int_id's are specified, the last came in will be effective. And if there are
>> +already filtered events running, new filtered events came in will be refused.
>> +
>> +9. int_en: A one-bit flag to tell if int_id is used to filter the statistics. It
>> +allows filtering 0 DeviceID and EventID.
>> +
>>   For HiSilicon uncore PMU v3 whose identifier is 0x40, some uncore PMUs are
>>   further divided into parts for finer granularity of tracing, each part has its
>>   own dedicated PMU, and all such PMUs together cover the monitoring job of events
>> diff --git a/drivers/perf/hisilicon/Makefile b/drivers/perf/hisilicon/Makefile
>> index 186be3d02238..5f28cfdb8a72 100644
>> --- a/drivers/perf/hisilicon/Makefile
>> +++ b/drivers/perf/hisilicon/Makefile
>> @@ -2,7 +2,7 @@
>>   obj-$(CONFIG_HISI_PMU) += hisi_uncore_pmu.o hisi_uncore_l3c_pmu.o \
>>   			  hisi_uncore_hha_pmu.o hisi_uncore_ddrc_pmu.o hisi_uncore_sllc_pmu.o \
>>   			  hisi_uncore_pa_pmu.o hisi_uncore_cpa_pmu.o hisi_uncore_uc_pmu.o \
>> -			  hisi_uncore_noc_pmu.o hisi_uncore_mn_pmu.o
>> +			  hisi_uncore_noc_pmu.o hisi_uncore_mn_pmu.o hisi_uncore_its_pmu.o
>>   
>>   obj-$(CONFIG_HISI_PCIE_PMU) += hisi_pcie_pmu.o
>>   obj-$(CONFIG_HNS3_PMU) += hns3_pmu.o
>> diff --git a/drivers/perf/hisilicon/hisi_uncore_its_pmu.c b/drivers/perf/hisilicon/hisi_uncore_its_pmu.c
>> new file mode 100644
>> index 000000000000..430e2b06cf4d
>> --- /dev/null
>> +++ b/drivers/perf/hisilicon/hisi_uncore_its_pmu.c
>> @@ -0,0 +1,393 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Driver for HiSilicon Uncore ITS PMU device
>> + *
>> + * Copyright (c) 2026 HiSilicon Technologies Co., Ltd.
>> + * Author: Yushan Wang <wangyushan12@huawei.com>
>> + */
>> +#include <linux/bitops.h>
>> +#include <linux/cpuhotplug.h>
>> +#include <linux/device.h>
>> +#include <linux/io.h>
>> +#include <linux/mod_devicetable.h>
> 
> Please rely on linux/platform_device.h to provice acpi_device_id and
> drop the include for <linux/mod_devicetable.h>.
> 
>> +static int __init hisi_its_pmu_module_init(void)
>> +{
>> +	int ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
>> +					  "perf/hisi/its:online",
>> +					  hisi_uncore_pmu_online_cpu,
>> +					  hisi_uncore_pmu_offline_cpu);
> 
> <disclaimer>I don't know anything about the functions involved
> here</disclaimer>
> 
> This looks fishy. The module might be loaded on any machine, is it right
> to call hisilicon specific functions then?

This only registers the state with the hotplug mechanism - the callbacks 
themselves won't ever be invoked until the driver binds to something and 
calls cpuhp_state_add_instance() from probe.

It is true that the dynamic hotplug states are somewhat limited, so at 
worst it might consume one unnecessarily if the driver is built-in, but 
this is the status quo for system PMU drivers, and TBH there are enough 
*other* issues with this whole perf hotplug mess anyway that I wouldn't 
see this one as a major concern. (FWIW I have started another 
side-project to make it all go away, which is beginning to look 
promising...)

That said, in this particular case, HISI_PMU could seemingly do better 
than registering *multiple* states with the same exact callbacks - 
registering a single state from the common hisi_uncore_pmu.c framework, 
then just having all the subdrivers add their instances to that, would 
be something of an improvement for now.

Thanks,
Robin.

> 
>> +	if (ret < 0) {
>> +		pr_err("hisi_its_pmu: Fail to setup cpuhp callbacks, ret = %d\n", ret);
>> +		return ret;
>> +	}
>> +	hisi_its_pmu_cpuhp_state = ret;
>> +
>> +	ret = platform_driver_register(&hisi_its_pmu_driver);
>> +	if (ret)
>> +		cpuhp_remove_multi_state(hisi_its_pmu_cpuhp_state);
>> +
>> +	return ret;
>> +}
>> +module_init(hisi_its_pmu_module_init);
> 
> Best regards
> Uwe


