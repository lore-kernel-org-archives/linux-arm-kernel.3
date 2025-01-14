Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E22C02180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 01:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/KdLI8livRlilT3/R2ER/HwxMqZTMsclsBQBvK2SmQ0=; b=hv0uH6/fOCqCXEPQtpxk6xVuUr
	nrr74hQgJnui5l+z7yBH0ZV/YvId9zPbKkKZ19cqs8kK1wfZI4t8GLkQ9Mybxt/nUpPEh8d0EBtII
	QheaQgjdDnSi/DHxT3Q95uboumyz6nFCOCI9mxRfGDJBW2u6WmKfDK1VBp8AMndWOb8vomJbdNTvT
	qRz+v3SrsjQYOJHPotNxpVQPzUzrEZvDjRKJwiDizUfTdysyCfn2WPbEbDNG8h5YsQC57Z8/dCb2H
	IoLdnSlxcPkPxq+wERxrcwRcUiAmEV9G8xm1eIQY10siJR6XAssk0ofzZrLhRJfxrDCIx8ziu6qSj
	/sJZ0n2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXW70-00000007Bas-3JTB;
	Tue, 14 Jan 2025 01:52:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXW5K-00000007BLL-1mYl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 01:51:15 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DGveQ5022467;
	Tue, 14 Jan 2025 01:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/KdLI8livRlilT3/R2ER/HwxMqZTMsclsBQBvK2SmQ0=; b=I4mrTD65xqC8i1PT
	rzqCQQMrs672CL1N3xO9n7tzOvsDTXqdbedznShpOtSiUI4RkTVvXrNHxOzW+amL
	6aDvk5rrbA9v77IR4rbobSGcgTKAkq1kZySntgWJpPMPkBFNegzoljbKSx15g3yj
	udFLMQXCzg4CwWNwR5lj5LIDj4cms31V8qxNzZdH8MfZ2zGjL5og36Th6UccoYuA
	r33Owox3yia+Q4GxlFsgDyGBIvgeSddsSco9iXIhLitwarWjz2KF8A9E8G7cJ7Nw
	JOTJ4GWLlIFtmX8xSo6G2JfyIFNUfqIjfz9unD3vDkc4zBI+gXsp/XW4Z/s3PQ7E
	iea4+Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445293a28j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 01:50:59 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E1owOU001385
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 01:50:58 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 Jan
 2025 17:50:53 -0800
Message-ID: <a96c2e49-217d-4c90-b32a-ad8eb439a4ec@quicinc.com>
Date: Tue, 14 Jan 2025 09:50:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] Coresight: Add Coresight TMC Control Unit driver
To: James Clark <james.clark@linaro.org>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20241226011022.1477160-1-quic_jiegan@quicinc.com>
 <20241226011022.1477160-5-quic_jiegan@quicinc.com>
 <5d8df2d3-41b9-4c21-ba63-c184bad50041@linaro.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <5d8df2d3-41b9-4c21-ba63-c184bad50041@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xk4ojLngdV_PDRmpcdBL4eTSDueLoj9H
X-Proofpoint-ORIG-GUID: xk4ojLngdV_PDRmpcdBL4eTSDueLoj9H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_175114_595013_089CE279 
X-CRM114-Status: GOOD (  30.80  )
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



On 1/13/2025 8:05 PM, James Clark wrote:
> 
> 
> On 26/12/2024 1:10 am, Jie Gan wrote:
>> The Coresight TMC Control Unit hosts miscellaneous configuration 
>> registers
>> which control various features related to TMC ETR sink.
>>
>> Based on the trace ID, which is programmed in the related CTCU ATID
>> register of a specific ETR, trace data with that trace ID gets into
>> the ETR buffer, while other trace data gets dropped.
>>
>> Enabling source device sets one bit of the ATID register based on
>> source device's trace ID.
>> Disabling source device resets the bit according to the source
>> device's trace ID.
>>
>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>> ---
>>   drivers/hwtracing/coresight/Kconfig          |   8 +
>>   drivers/hwtracing/coresight/Makefile         |   1 +
>>   drivers/hwtracing/coresight/coresight-ctcu.c | 273 +++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-ctcu.h |  21 ++
>>   include/linux/coresight.h                    |   3 +-
>>   5 files changed, 305 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.c
>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h
>>
>> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/ 
>> coresight/Kconfig
>> index 06f0a7594169..152eab0b9b2a 100644
>> --- a/drivers/hwtracing/coresight/Kconfig
>> +++ b/drivers/hwtracing/coresight/Kconfig
>> @@ -133,6 +133,14 @@ config CORESIGHT_STM
>>         To compile this driver as a module, choose M here: the
>>         module will be called coresight-stm.
>> +config CORESIGHT_CTCU
>> +    tristate "CoreSight TMC Control Unit driver"
>> +    help
>> +      This driver provides support for CoreSight TMC Control Unit
>> +      that hosts miscellaneous configuration registers. This is
>> +      primarily used for controlling the behaviors of the TMC
>> +      ETR device.
>> +
>>   config CORESIGHT_CPU_DEBUG
>>       tristate "CoreSight CPU Debug driver"
>>       depends on ARM || ARM64
>> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/ 
>> coresight/Makefile
>> index 4ba478211b31..1b7869910a12 100644
>> --- a/drivers/hwtracing/coresight/Makefile
>> +++ b/drivers/hwtracing/coresight/Makefile
>> @@ -51,3 +51,4 @@ coresight-cti-y := coresight-cti-core.o    
>> coresight-cti-platform.o \
>>              coresight-cti-sysfs.o
>>   obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>>   obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
>> +obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu.c b/drivers/ 
>> hwtracing/coresight/coresight-ctcu.c
>> new file mode 100644
>> index 000000000000..7650dbe9a41e
>> --- /dev/null
>> +++ b/drivers/hwtracing/coresight/coresight-ctcu.c
>> @@ -0,0 +1,273 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/coresight.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/kernel.h>
>> +#include <linux/init.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/slab.h>
>> +
>> +#include "coresight-ctcu.h"
>> +#include "coresight-priv.h"
>> +#include "coresight-trace-id.h"
>> +
>> +DEFINE_CORESIGHT_DEVLIST(ctcu_devs, "ctcu");
>> +
>> +#define ctcu_writel(drvdata, val, offset)    __raw_writel((val), 
>> drvdata->base + offset)
>> +#define ctcu_readl(drvdata, offset)        __raw_readl(drvdata->base 
>> + offset)
>> +
>> +/* The TMC Coresight Control Unit uses four ATID registers to control 
>> the data filter function based
>> + * on the trace ID for each TMC ETR sink. The length of each ATID 
>> register is 32 bits. Therefore,
>> + * the ETR has a related field in CTCU that is 128 bits long. Each 
>> trace ID is represented by one
>> + * bit in that filed.
>> + * e.g. ETR0ATID0 layout, set bit 5 for traceid 5
>> + *                                           bit5
>> + * ------------------------------------------------------
>> + * |   |28|   |24|   |20|   |16|   |12|   |8|  1|4|   |0|
>> + * ------------------------------------------------------
>> + *
>> + * e.g. ETR0:
>> + * 127                     0 from ATID_offset for ETR0ATID0
>> + * -------------------------
>> + * |ATID3|ATID2|ATID1|ATID0|
>> + *
>> + */
>> +#define CTCU_ATID_REG_OFFSET(traceid, atid_offset) \
>> +        ((traceid / 32) * 4 + atid_offset)
>> +
>> +#define CTCU_ATID_REG_BIT(traceid)    (traceid % 32)
>> +#define CTCU_ATID_REG_SIZE        0x10
>> +
>> +struct ctcu_atid_config {
>> +    const uint32_t atid_offset;
>> +    const uint32_t port_num;
>> +};
>> +
>> +struct ctcu_config {
>> +    const struct ctcu_atid_config *atid_config;
>> +    int num_atid_config;
>> +};
>> +
>> +static const struct ctcu_atid_config sa8775p_atid_cfgs[] = {
>> +    {0xf8,  0},
>> +    {0x108, 1},
>> +};
>> +
>> +static const struct ctcu_config sa8775p_cfgs = {
>> +    .atid_config        = sa8775p_atid_cfgs,
>> +    .num_atid_config    = ARRAY_SIZE(sa8775p_atid_cfgs),
>> +};
>> +
>> +/*
>> + * __ctcu_set_etr_traceid: Set bit in the ATID register based on 
>> trace ID when enable is true.
>> + * Reset the bit of the ATID register based on trace ID when enable 
>> is false.
>> + *
>> + * @csdev:    coresight_device struct related to the device
>> + * @traceid:    trace ID of the source tracer.
>> + * @enable:    True for set bit and false for reset bit.
>> + *
>> + * Returns 0 indicates success. Non-zero result means failure.
>> + */
>> +static int __ctcu_set_etr_traceid(struct coresight_device *csdev,
>> +                  u8 traceid,
>> +                  int port_num,
>> +                  bool enable)
>> +{
>> +    uint32_t atid_offset, reg_offset, val;
>> +    struct ctcu_drvdata *drvdata;
>> +    int bit;
>> +
>> +    if (!IS_VALID_CS_TRACE_ID(traceid))
>> +        return -EINVAL;
> 
> Minor point, but this was already done in the calling function.
Thanks for comment. Totally agree with you, it's redundant codes here.
I will remove it in next version.

> 
>> +
>> +    drvdata = dev_get_drvdata(csdev->dev.parent);
>> +    if (IS_ERR_OR_NULL(drvdata))
>> +        return -EINVAL;
>> +
>> +    atid_offset = drvdata->atid_offset[port_num];
>> +    if (atid_offset == 0)
>> +        return -EINVAL;
>> +
>> +    guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
>> +    CS_UNLOCK(drvdata->base);
>> +
>> +    bit = CTCU_ATID_REG_BIT(traceid);
>> +    reg_offset = CTCU_ATID_REG_OFFSET(traceid, atid_offset);
> 
> The locks only need to be around the read/write below. bit and 
> reg_offset are all local and shouldn't be affected. Doesn't really make 
> a difference but makes the code a bit more readable.
Yes, agree with you. It makes sense and is easier to read. Will move the 
CS_UNLOCK to the proper position.

> 
>> +    if (reg_offset - atid_offset > CTCU_ATID_REG_SIZE) {
>> +        CS_LOCK(drvdata);
>> +        return -EINVAL;
>> +    }
>> +
>> +    val = ctcu_readl(drvdata, reg_offset);
>> +    if (enable)
>> +        val = val | BIT(bit);
>> +    else
>> +        val = val & ~BIT(bit);
>> +
>> +    ctcu_writel(drvdata, val, reg_offset);
>> +    CS_LOCK(drvdata->base);
>> +
>> +    return 0;
>> +}
>> +
[...]

Thanks,
Jie


