Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0668FC021BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 11:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RI3j6QNwCd3E9WU+AhkXeYiWCb5d3Rx1nK60VGbwaBM=; b=Lc5Yw+Peb1/POWPxmeZ+mztlgj
	Il+NEzCKBONpHOhFhVHWXfVDyKp7S72nw7Z4dKcRqevmyyhFheSSUCKJPaRYcQx7u1h23GVZNBkRz
	biz91khZmsx5AYdJzTIYNFpg7SDak0CfxssbSUDMOkH/6nuqxctZgVMB47niFmF7s7Vopp8/b3TU8
	aenj3FejSJ4lwm8Ha/6HtQ6KXLfaW23o11dt+esgc5AQE9w4zVMFOL4VB1prq151/mXsO1am0M+pf
	rmMmudMtNuj+WZfY756IMpHjNDAWdlwmY/M/RgtA2/PSLpCv1lcorvXNWOYhsRLoCmjp2+UgDndCS
	Mk5as7Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnFIK-00000003Qrk-0a3h;
	Wed, 26 Feb 2025 11:09:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEtx-00000003LOu-3rGg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 10:44:31 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q9xGdq023826;
	Wed, 26 Feb 2025 10:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RI3j6QNwCd3E9WU+AhkXeYiWCb5d3Rx1nK60VGbwaBM=; b=bIHTaAVGTL5S3YAH
	jlA0utMUcg6yFORPmn1aHaZv1AyuVV8UgMlCRhaFAjeGnY+BTYCN5fdqb8fI7Z/u
	2uPmO4+8knNVjYqU7PmEk+hlZ4lIQol+35kJYjM4CFzWH4HOMjcjR70tQ48r6X+a
	1VDTtewbGaCmwrS5ekpb4/V5ZH+E7OsJvs2A/ByAYfwV740I6m09Ha+OGEIapg0Y
	TSSlfiwJIbe9/ah7F8Rbp6NC3Q2mHjdR37TYUqCwPao2jqOsENehebJAfXBc7LYJ
	aazGkMywkZJJAZVCuG03Lz8ISnj+QZvzrfBZkz64vyvfnhyYSeJZphwSAgJCnUsz
	8a5fJg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prmhnw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 10:44:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51QAiJxp011305
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 10:44:19 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Feb
 2025 02:44:11 -0800
Message-ID: <13cabef8-8e68-412e-a6eb-42d22604f941@quicinc.com>
Date: Wed, 26 Feb 2025 18:44:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] coresight: add coresight Trace NOC driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark
	<james.clark@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20250221-trace-noc-driver-v1-0-0a23fc643217@quicinc.com>
 <20250221-trace-noc-driver-v1-2-0a23fc643217@quicinc.com>
 <38996ae8-321b-4239-8fe9-b769fdff296c@kernel.org>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <38996ae8-321b-4239-8fe9-b769fdff296c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ix_23qutW023h22aYfSDWugCTYUvCKNE
X-Proofpoint-ORIG-GUID: ix_23qutW023h22aYfSDWugCTYUvCKNE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 adultscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502260086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_024430_082209_14CD6117 
X-CRM114-Status: GOOD (  29.33  )
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



On 2/22/2025 6:54 PM, Krzysztof Kozlowski wrote:
> On 21/02/2025 08:40, Yuanfang Zhang wrote:
>> Add driver to support Coresight device Trace NOC(Network On Chip).
>> Trace NOC is an integration hierarchy which is a replacement of
>> Dragonlink configuration. It brings together debug components like
>> TPDA, funnel and interconnect Trace Noc.
>>
>> It sits in the different subsystem of SOC and aggregates the trace
>> and transports to QDSS trace bus.
>>
>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>> ---
>>  drivers/hwtracing/coresight/Kconfig          |  10 ++
>>  drivers/hwtracing/coresight/Makefile         |   1 +
>>  drivers/hwtracing/coresight/coresight-tnoc.c | 191 +++++++++++++++++++++++++++
>>  drivers/hwtracing/coresight/coresight-tnoc.h |  53 ++++++++
>>  4 files changed, 255 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
>> index 06f0a7594169c5f03ca5f893b7debd294587de78..712b2469e37610e6fc5f15cedb2535bf570f99aa 100644
>> --- a/drivers/hwtracing/coresight/Kconfig
>> +++ b/drivers/hwtracing/coresight/Kconfig
>> @@ -247,4 +247,14 @@ config CORESIGHT_DUMMY
>>  
>>  	  To compile this driver as a module, choose M here: the module will be
>>  	  called coresight-dummy.
>> +
>> +config CORESIGHT_TNOC
>> +	tristate "Coresight Trace Noc driver"
>> +	help
>> +	  This driver provides support for Trace NoC component.
>> +	  Trace NoC is a interconnect that is used to collect trace from
>> +	  various subsystems and transport it QDSS trace sink.It sits in
>> +	  the different tiles of SOC and aggregates the trace local to the
>> +	  tile and transports it another tile or to QDSS trace sink eventually.
>> +
>>  endif
>> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
>> index 4ba478211b318ea5305f9f98dda40a041759f09f..ab1cff8f027495fabe3872d52f8c0877e39f0ea8 100644
>> --- a/drivers/hwtracing/coresight/Makefile
>> +++ b/drivers/hwtracing/coresight/Makefile
>> @@ -51,3 +51,4 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
>>  		   coresight-cti-sysfs.o
>>  obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>>  obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
>> +obj-$(CONFIG_CORESIGHT_TNOC) += coresight-tnoc.o
> 
> Why do you keep adding entries to the end instead to some logically
> ordered place?
> 
> Dummy driver, before tpda (obviously tpda should go after tpdm) and now
> this... This is just unnecessarily making simultaneous edits difficult.
> 
sure, add it after funnel/replicator before etm, since it work as a link.

>> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..11b9a7fd1efdc9fff7c1e9666bda14acb41786cb
>> --- /dev/null
>> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
>> @@ -0,0 +1,191 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/device.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/amba/bus.h>
>> +#include <linux/io.h>
>> +#include <linux/coresight.h>
>> +#include <linux/of.h>
>> +
>> +#include "coresight-priv.h"
>> +#include "coresight-tnoc.h"
>> +#include "coresight-trace-id.h"
>> +
> 
> 
>> +
>> +	drvdata->base = devm_ioremap_resource(dev, &adev->res);
>> +	if (!drvdata->base)
>> +		return -ENOMEM;
>> +
>> +	spin_lock_init(&drvdata->spinlock);
>> +
>> +	ret = trace_noc_init_default_data(drvdata);
>> +	if (ret)
>> +		return ret;
>> +
>> +	desc.ops = &trace_noc_cs_ops;
>> +	desc.type = CORESIGHT_DEV_TYPE_LINK;
>> +	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
>> +	desc.pdata = adev->dev.platform_data;
>> +	desc.dev = &adev->dev;
>> +	desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
>> +	drvdata->csdev = coresight_register(&desc);
>> +	if (IS_ERR(drvdata->csdev))
>> +		return PTR_ERR(drvdata->csdev);
>> +
>> +	pm_runtime_put(&adev->dev);
>> +
>> +	dev_dbg(drvdata->dev, "Trace Noc initialized\n");
> 
> 
> Drop. There is really no need to tell that function finished.
> 
> Please run standard kernel tools for static analysis, like coccinelle,
> smatch and sparse, and fix reported warnings. Also please check for
> warnings when building with W=1. Most of these commands (checks or W=1
> build) can build specific targets, like some directory, to narrow the
> scope to only your code. The code here looks like it needs a fix. Feel
> free to get in touch if the warning is not clear.
> 
Done.
> 
> Best regards,
> Krzysztof
> 


