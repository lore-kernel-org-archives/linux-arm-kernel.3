Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B97E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 13:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbMf1JHhwnDsnpJ0uj+pBXWsgymt5Snq7rvaj8PaZ0c=; b=r5MCcCa571e0oOXMHa7/JOrwry
	O+xo4NoOB/Yc/PPgr+fBDkue16TPuquQSqNVkq/x31hUPY3u0U0+sS6v4p/OxUQ0u3Jnh4reB+OYj
	RxoMF3e5zoEbPhpBteCoc5BE7lr1NPT1jwTB3VFlwY76g5oxQvxaQ7PNNaJ/44MyGasQVVVWeCWQV
	EYhDOk8p9gf+GvMBb4qWefvfiyYfen0zCy3YwliXUvBWFNxsTd37sPVX7k+Wumkqu1fBo0EKkMxXa
	VsrR3oAR0RnwqvJ51Zpdv7HpNe03Kt92CmVkxMRd3IvCSLlMqd2QI97zH5ZnwN2wxQnGob1WkVzm8
	uBuz9aAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL03D-0000000BXxx-0zfG;
	Tue, 10 Dec 2024 13:13:19 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzui-0000000BWbK-1p1u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 13:04:34 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Y6zPr0r72z1V61d;
	Tue, 10 Dec 2024 21:01:20 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 8869B1802D0;
	Tue, 10 Dec 2024 21:04:24 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 10 Dec 2024 21:04:23 +0800
CC: <jonathan.cameron@huawei.com>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <yangyicong@hisilicon.com>,
	<hejunhao3@huawei.com>, <wangyushan12@huawei.com>, <prime.zeng@hisilicon.com>
Subject: Re: [PATCH v4 00/10] Refactor the common parts to the HiSilicon
 Uncore PMU core and cleanups
To: Will Deacon <will@kernel.org>, Yicong Yang <yangyicong@huawei.com>
References: <20241203125049.39458-1-yangyicong@huawei.com>
 <20241210120556.GA15398@willie-the-truck>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <beb248e7-9872-914a-c705-e65317955c3f@huawei.com>
Date: Tue, 10 Dec 2024 21:04:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20241210120556.GA15398@willie-the-truck>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_050432_798215_404B695C 
X-CRM114-Status: GOOD (  16.25  )
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

On 2024/12/10 20:05, Will Deacon wrote:
> On Tue, Dec 03, 2024 at 08:50:39PM +0800, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> This series mainly contains the refactor of the HiSilicon Uncore PMU by
>> extracting the common parts from each drivers into the core:
>> - the retrieving of the PMU topology ID
>> - the common sysfs attributes like cpumask and identifier
>>
>> In order to achieve this, we need to do below preparation:
>> - refactor the detection of associated CPUs for PMUs locates on a SICL
>> - maintain the topology information in a dedicated data structure
>> - provides a generic implementation of cpumask/identifier attributes
>>
>> Besides also include below changes/cleanups in this patchset
>> - add one new sysfs attributes for better describing the topology information
>>   of the associated CPUs of the PMU.
>> - define a symbol namespace for HiSilicon Uncore PMUs to avoid pollute the
>>   common ones
>> - two minor nonfunctional cleanups of DDRC PMU
>>
>> Change since v3:
>> - Split the associated_cpus refactor patches according to the functions, hope
>>   will be easier to review
>> - Drop the use of cpu_online_mask out of cpuhp
>> Link: https://lore.kernel.org/linux-arm-kernel/20241026072424.29887-1-yangyicong@huawei.com/
> 
> This doesn't build on top of -rc2 (see log below). I suspect this is because
> of the recent MODULE_IMPORT_NS() changes to use string literals [1].
> 
> Please can you send a v5?

sure, will rebase on -rc2 and address this.

Thanks.

> 
> Will
> 
> [1] cdd30ebb1b9f ("module: Convert symbol namespace to string literal")
> 
> --->8
> 
> In file included from ./include/linux/module.h:22,
>                  from ./include/linux/device/driver.h:21,
>                  from ./include/linux/device.h:32,
>                  from ./include/linux/acpi.h:14,
>                  from drivers/perf/hisilicon/hisi_uncore_hha_pmu.c:11:
> drivers/perf/hisilicon/hisi_uncore_hha_pmu.c:559:18: error: expected ‘,’ or ‘;’ before ‘HISI_PMU’
>   559 | MODULE_IMPORT_NS(HISI_PMU);
>       |                  ^~~~~~~~
> ./include/linux/moduleparam.h:26:47: note: in definition of macro ‘__MODULE_INFO’
>    26 |   = __MODULE_INFO_PREFIX __stringify(tag) "=" info
>       |                                               ^~~~
> ./include/linux/module.h:299:30: note: in expansion of macro ‘MODULE_INFO’
>   299 | #define MODULE_IMPORT_NS(ns) MODULE_INFO(import_ns, ns)
>       |                              ^~~~~~~~~~~
> drivers/perf/hisilicon/hisi_uncore_hha_pmu.c:559:1: note: in expansion of macro ‘MODULE_IMPORT_NS’
>   559 | MODULE_IMPORT_NS(HISI_PMU);
>       | ^~~~~~~~~~~~~~~~
> make[5]: *** [scripts/Makefile.build:194: drivers/perf/hisilicon/hisi_uncore_hha_pmu.o] Error 1
> make[5]: *** Waiting for unfinished jobs....
> In file included from ./include/linux/module.h:22,
>                  from ./include/linux/device/driver.h:21,
>                  from ./include/linux/device.h:32,
>                  from ./include/linux/acpi.h:14,
>                  from drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c:11:
> drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c:595:18: error: expected ‘,’ or ‘;’ before ‘HISI_PMU’
>   595 | MODULE_IMPORT_NS(HISI_PMU);
>       |                  ^~~~~~~~
> ./include/linux/moduleparam.h:26:47: note: in definition of macro ‘__MODULE_INFO’
>    26 |   = __MODULE_INFO_PREFIX __stringify(tag) "=" info
>       |                                               ^~~~
> ./include/linux/module.h:299:30: note: in expansion of macro ‘MODULE_INFO’
>   299 | #define MODULE_IMPORT_NS(ns) MODULE_INFO(import_ns, ns)
>       |                              ^~~~~~~~~~~
> drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c:595:1: note: in expansion of macro ‘MODULE_IMPORT_NS’
>   595 | MODULE_IMPORT_NS(HISI_PMU);
>       | ^~~~~~~~~~~~~~~~
> make[5]: *** [scripts/Makefile.build:194: drivers/perf/hisilicon/hisi_uncore_l3c_pmu.o] Error 1
> /tmp/ccKFrDMm.s: Assembler messages:
> /tmp/ccKFrDMm.s:7: Error: junk at end of line, first unrecognized character is `H'
> /tmp/ccKFrDMm.s:8: Error: junk at end of line, first unrecognized character is `H'
> /tmp/ccKFrDMm.s:9: Error: junk at end of line, first unrecognized character is `H'
> /tmp/ccKFrDMm.s:10: Error: junk at end of line, first unrecognized character is `H'
> /tmp/ccKFrDMm.s:11: Error: junk at end of line, first unrecognized character is `H'
> /tmp/ccKFrDMm.s:12: Error: junk at end of line, first unrecognized character is `H'
> /tmp/ccKFrDMm.s:13: Error: junk at end of line, first unrecognized character is `H'
> /tmp/ccKFrDMm.s:14: Error: junk at end of line, first unrecognized character is `H'
> /tmp/ccKFrDMm.s:15: Error: junk at end of line, first unrecognized character is `H'
> /tmp/ccKFrDMm.s:16: Error: junk at end of line, first unrecognized character is `H'
> /tmp/ccKFrDMm.s:17: Error: junk at end of line, first unrecognized character is `H'
> /tmp/ccKFrDMm.s:18: Error: junk at end of line, first unrecognized character is `H'
> /tmp/ccKFrDMm.s:19: Error: junk at end of line, first unrecognized character is `H'
> /tmp/ccKFrDMm.s:20: Error: junk at end of line, first unrecognized character is `H'
> /tmp/ccKFrDMm.s:21: Error: junk at end of line, first unrecognized character is `H'
> /tmp/ccKFrDMm.s:22: Error: junk at end of line, first unrecognized character is `H'
> /tmp/ccKFrDMm.s:23: Error: junk at end of line, first unrecognized character is `H'
> /tmp/ccKFrDMm.s:24: Error: junk at end of line, first unrecognized character is `H'
> /tmp/ccKFrDMm.s:25: Error: junk at end of line, first unrecognized character is `H'
> /tmp/ccKFrDMm.s:26: Error: junk at end of line, first unrecognized character is `H'
> /tmp/ccKFrDMm.s:27: Error: junk at end of line, first unrecognized character is `H'
> make[5]: *** [scripts/Makefile.build:194: drivers/perf/hisilicon/hisi_uncore_pmu.o] Error 1
> In file included from ./include/linux/module.h:22,
>                  from ./include/linux/device/driver.h:21,
>                  from ./include/linux/device.h:32,
>                  from ./include/linux/acpi.h:14,
>                  from drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c:11:
> drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c:556:18: error: expected ‘,’ or ‘;’ before ‘HISI_PMU’
>   556 | MODULE_IMPORT_NS(HISI_PMU);
>       |                  ^~~~~~~~
> ./include/linux/moduleparam.h:26:47: note: in definition of macro ‘__MODULE_INFO’
>    26 |   = __MODULE_INFO_PREFIX __stringify(tag) "=" info
>       |                                               ^~~~
> ./include/linux/module.h:299:30: note: in expansion of macro ‘MODULE_INFO’
>   299 | #define MODULE_IMPORT_NS(ns) MODULE_INFO(import_ns, ns)
>       |                              ^~~~~~~~~~~
> drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c:556:1: note: in expansion of macro ‘MODULE_IMPORT_NS’
>   556 | MODULE_IMPORT_NS(HISI_PMU);
>       | ^~~~~~~~~~~~~~~~
> make[5]: *** [scripts/Makefile.build:194: drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.o] Error 1
> make[4]: *** [scripts/Makefile.build:440: drivers/perf/hisilicon] Error 2
> make[4]: *** Waiting for unfinished jobs....
> make[3]: *** [scripts/Makefile.build:440: drivers/perf] Error 2
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [scripts/Makefile.build:440: drivers] Error 2
> .
> 

