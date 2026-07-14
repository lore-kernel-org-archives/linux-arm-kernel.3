Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE4DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5aHXXtOaHH1EFrhUbNVIsNgKYaZCv/xKddPMW8fIik=; b=bqjFnLCwuHBJIlZVyaPwPNgcEK
	ttJlMsu0c7fKALL3c+Wd7HgDeBTUBg3svpQLkantKUGA97lfLCgkSyjGO1o+QYXUZ2VGP3h9B/fl4
	Q9Rbr+JoPR5GSIBnD9NSSFfIRxsR4QFkcnizIFfh1tQ6UxFqS79ED9KRgQJVb+JN2KC953X8zvKUb
	jYedRAHy9WgRORBxYdo9UG5KcStnhnFmI9PUaZ8gcUqnaTvcCWJ3QYfV4LhmsUsn48YxmWc98bFYO
	MziVh6AQbdHe1dLl2ekkFI/DivhMg+kXvA0gqUQItB9XnHtvf8M/PgQYWiIlZ55COU4If7nu90dEA
	97I5FoGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdYC-0000000CF3G-2q9Y;
	Tue, 14 Jul 2026 13:51:56 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdY8-0000000CF2L-3Tb2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:51:55 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=i5aHXXtOaHH1EFrhUbNVIsNgKYaZCv/xKddPMW8fIik=;
	b=yciM8rw+/Fcjaq3rPMYxxB1mLpps2D8MX0vBfBzUucdax/Ct8nMagKh+o7+lMh3YiSkZZOy6g
	tAoaO8KB8WiKpyAqfWAiJD6Ff5t/PdY2CnQ9+GhTeimsUjVyTvjFm3TxH47H360qlSzPtd4vogL
	hlpZYbYSeuu4JWqbdFb4RS8=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4h00q66SgvzmV7C;
	Tue, 14 Jul 2026 21:42:26 +0800 (CST)
Received: from whupemo500002.china.huawei.com (unknown [7.152.185.250])
	by mail.maildlp.com (Postfix) with ESMTPS id E52504057A;
	Tue, 14 Jul 2026 21:51:44 +0800 (CST)
Received: from [10.67.120.139] (10.67.120.139) by
 whupemo500002.china.huawei.com (7.152.185.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 14 Jul 2026 21:51:43 +0800
Message-ID: <be2839d6-76cd-4a01-9c17-5c69ce9d01c7@huawei.com>
Date: Tue, 14 Jul 2026 21:51:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drivers/perf: hisi: Support uncore ITS PMU
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	<robin.murphy@arm.com>
CC: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<fanghao11@huawei.com>, <linuxarm@huawei.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, <wangzhou1@hisilicon.com>, Yushan Wang
	<wangyushan12@huawei.com>
References: <20260713125647.2958626-1-wangyushan12@huawei.com>
 <20260713125647.2958626-2-wangyushan12@huawei.com>
 <alYrMQWRL515pYbZ@monoceros>
Content-Language: en-US
From: Yushan Wang <wangyushan12@huawei.com>
In-Reply-To: <alYrMQWRL515pYbZ@monoceros>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo500002.china.huawei.com (7.152.185.250)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_065153_577050_1021A808 
X-CRM114-Status: GOOD (  26.99  )
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


On 7/14/2026 8:32 PM, Uwe Kleine-König wrote:
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
>>  Documentation/admin-guide/perf/hisi-pmu.rst  |  13 +
>>  drivers/perf/hisilicon/Makefile              |   2 +-
>>  drivers/perf/hisilicon/hisi_uncore_its_pmu.c | 393 +++++++++++++++++++
>>  3 files changed, 407 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/perf/hisilicon/hisi_uncore_its_pmu.c
>>
>> diff --git a/Documentation/admin-guide/perf/hisi-pmu.rst b/Documentation/admin-guide/perf/hisi-pmu.rst
>> index d56b2d690709..278bd7e0ae60 100644
>> --- a/Documentation/admin-guide/perf/hisi-pmu.rst
>> +++ b/Documentation/admin-guide/perf/hisi-pmu.rst
>> @@ -128,6 +128,19 @@ channel with this option. The current supported channels are as follows:
>>  7. tt_en: NoC PMU supports counting only transactions that have tracetag set
>>  if this option is set. See the 2nd list for more information about tracetag.
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
>>  For HiSilicon uncore PMU v3 whose identifier is 0x40, some uncore PMUs are
>>  further divided into parts for finer granularity of tracing, each part has its
>>  own dedicated PMU, and all such PMUs together cover the monitoring job of events
>> diff --git a/drivers/perf/hisilicon/Makefile b/drivers/perf/hisilicon/Makefile
>> index 186be3d02238..5f28cfdb8a72 100644
>> --- a/drivers/perf/hisilicon/Makefile
>> +++ b/drivers/perf/hisilicon/Makefile
>> @@ -2,7 +2,7 @@
>>  obj-$(CONFIG_HISI_PMU) += hisi_uncore_pmu.o hisi_uncore_l3c_pmu.o \
>>                        hisi_uncore_hha_pmu.o hisi_uncore_ddrc_pmu.o hisi_uncore_sllc_pmu.o \
>>                        hisi_uncore_pa_pmu.o hisi_uncore_cpa_pmu.o hisi_uncore_uc_pmu.o \
>> -                      hisi_uncore_noc_pmu.o hisi_uncore_mn_pmu.o
>> +                      hisi_uncore_noc_pmu.o hisi_uncore_mn_pmu.o hisi_uncore_its_pmu.o
>>
>>  obj-$(CONFIG_HISI_PCIE_PMU) += hisi_pcie_pmu.o
>>  obj-$(CONFIG_HNS3_PMU) += hns3_pmu.o
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
> Please rely on linux/platform_device.h to provice acpi_device_id and
> drop the include for <linux/mod_devicetable.h>.

This is a redundant header file, thanks for pointing out.

linux/platform_device.h is already imported below, I will drop this header
file in the next version.

>
>
>> +static int __init hisi_its_pmu_module_init(void)
>> +{
>> +    int ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
>> +                                      "perf/hisi/its:online",
>> +                                      hisi_uncore_pmu_online_cpu,
>> +                                      hisi_uncore_pmu_offline_cpu);
> <disclaimer>I don't know anything about the functions involved
> here</disclaimer>
>
> This looks fishy. The module might be loaded on any machine, is it right
> to call hisilicon specific functions then?

As discussion with Robin, this is correct but not necessary.

I will propose a refactor in the next version to eliminate redundant
cpuhp_setup_state_multi for HISI PMUs.

But to fully achieve a better form of cpuhp callback registration, we can be
counting on Robin's work! :)

Thanks,
Yushan

>
>> +    if (ret < 0) {
>> +            pr_err("hisi_its_pmu: Fail to setup cpuhp callbacks, ret = %d\n", ret);
>> +            return ret;
>> +    }
>> +    hisi_its_pmu_cpuhp_state = ret;
>> +
>> +    ret = platform_driver_register(&hisi_its_pmu_driver);
>> +    if (ret)
>> +            cpuhp_remove_multi_state(hisi_its_pmu_cpuhp_state);
>> +
>> +    return ret;
>> +}
>> +module_init(hisi_its_pmu_module_init);
> Best regards
> Uwe



