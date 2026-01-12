Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E0DD2505C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 09:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iE5I7iaezzE9aXAUoqN6SHeOzvRvmQyoGbsbC7o536Y=; b=QhZ1J77tAgs/S6jpb/STzHN5g9
	9dzI3WjDk4f5D500pNXseiFUmxR+IMD6VsklBR8caA+iOEp+rToHDFpeScagBA+uKxaSlWGjd7KAL
	z+nUxx6Yf7deFcPN0LxZD173P7s0to3txQZIoTcTmMfItw9uGXX+HDyYkcjTavZ+d+WtoZ2yo04CT
	Y9i907Z8aLvjG1NQrxHkIBHHM6depindeknlRipyVm1kSPJ2y7lajvhoWNaqLF9fnHpxR/rFkT+MF
	JGKnZAklq9EN76SsADq6VJD7KD0/n+HXTCeAXvPmjJpWW4wkBCgPiZbiwURUeOvSeZtk16yHQoZIj
	iTqs5hag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfE5D-000000054HT-3RzL;
	Mon, 12 Jan 2026 09:19:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfE5C-000000054Gy-0BYk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 09:19:31 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C84H553014049
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 09:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iE5I7iaezzE9aXAUoqN6SHeOzvRvmQyoGbsbC7o536Y=; b=Hc9xytzDn0qPbBKq
	x3CHQ3C9cDwUWjCFo3evaCnuZlqTLwrMSxs9kJJbJ2KeKRZYITbu9A5PWY76J/3T
	aw294CPMQM5m8Ww1p/dPNQd32F7j35TCJXKSNzlYzeKQtUOu9Ptc9heK8gg2/Hk3
	u0/JnYL3LMnPnLMh3o5lLeJl/cgXCRLfLxFNs0+pcy38YvNNxPyJ2I25BR7DcbeX
	99PaBnEGPJ8jXz6M9uPE34bLRZmOx7xXhOUNLYOslReoWqhhpuGfdPRbsVqDkTys
	48BXpCT6gMOK5Q9XLjB6g3KQhvT3KVPfpnpMdQ6rljYxsa6UaUGwXR5ZeoRUYbvt
	d5R3OQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkntuksdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 09:19:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c52779e9e65so1728229a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 01:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768209568; x=1768814368; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iE5I7iaezzE9aXAUoqN6SHeOzvRvmQyoGbsbC7o536Y=;
        b=HCif/iefNNp4ieQD6yV+Qh19KL8+pu8fQ6UnYHXqvo0wCnx5DUpfybPZ8AhKsmHN+r
         EiWxuCY5HwFwRFgkhi5ARVT3K8xOyYLMGvOiN/Ys4oKWSXsTy1ZZB05e0jB7BQyI43Yr
         A8x/SiBIiFm+nUFEVTfER6ftr42eYs2MGKwyHA4PPIn14DWB8qAKa6SBVmq0QQuDqKgl
         qNswMWV30J+8pqMHZhw07Dyf4k4ouROus1rdj6xz4JNnpBBwtnbK1hR7/nTJf+6cpyiC
         YyCl/grlKz7JBV4qiRKM8ukgHIeTZDqcVpBSfXTIaf95jKE41cFO0pT7TInBRdOD2GFU
         JD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768209568; x=1768814368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iE5I7iaezzE9aXAUoqN6SHeOzvRvmQyoGbsbC7o536Y=;
        b=DgrD5xhoosOHse0VfzqldVsDw2S0//4Z4NrBbChrn4hz1anuy95EFOm6wLtWyvifhV
         MS02wPRVm23ogSWNSQFDJtgdhRsSAOQI3kzt5pL75O9r6aSluGdq3TpbsxrUOVrSZ/SC
         fIgAIZRHcCr1XBIdCDjqJVm2cv3CzQGX1+OxfvGdYqI0mmhGYJq28S455M0Vl4OdtbCd
         DKLPI5DnxRt70+qIHShGZ9SbJTcLS06LPT9bkTIFbZ6I1Su38CRPvtRdqGnpEOuUj+IO
         E+GvqWPVYEnkQHJDBv4hi/uKjKK9b+kKmHUaDfzNEV/j1Xa+CAhrI6OYBxdew+2Pm9o6
         dAcA==
X-Forwarded-Encrypted: i=1; AJvYcCXdqVcKWwFlhD6Ye1eh9Yolq5qUBLT5Pga8vnKyM562JHxT+vYEWgSyJtKk5XlyxoEkvXMtwU+SrYJQ5zoiGS6l@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5j8oVBEFTfQA0bcHWOarB2k1zCgkQ4Cz9C/apeCwvLBKskMX8
	zzWyuFYDA/FIMErc4Ksi+0GWnU4QwbxMqBKQFt3od3ynmq1BU27THji2RMV9oiqU2ZUpT9u0iNj
	jgf47kSnZ4vpZzAy8dc9G3XrQLjyrGeJYzFAel3iTAKawddV/VpUlm0B2L/fVRqEu+S5aNVQx5G
	IOwxO43+71hw==
X-Gm-Gg: AY/fxX5WnsL+UcI7za5x5u1ySHxRMjuUrFRhSpRMEd863ZCFoqmMajYRyaheRXNtr3o
	YVU+4IorTcEBkPu2UUKBCOUPkAIhJjk43gYPv8vQ1a11p4VyqrZlsPEm0GWd01OVIW10j9n0krP
	Lq7IGv33s3rgWIySw8ngtxvd5C/6nslXuaL3OkvLSY+IWiZ+AHBm4qlCUSvSkFXNEtwqSkJx7Z5
	oSe/v2L3mADCHZ8ZBdfXZp0wN2iQJnxmWg5+xpLlgNGUnpYFXWrMP/hR/aapO+WHL6LQXxVIZ8A
	9p5xtkrs9vONroD6MOWC+A+FapNE/fskm7104ff0R3t1vOa96aNFKW9gWX6NE9rzlWkc0TL0Q7n
	ZkFRM3hzWVkFTx1Al7JEepjsrGG1qwiim/eZYAT/aka5jXNoWaE9+KcvmBJM+sZ1y3TVqr5677I
	sqzexB
X-Received: by 2002:a17:903:2309:b0:2a0:d46d:f990 with SMTP id d9443c01a7336-2a3ee4e81c6mr173925845ad.31.1768209567637;
        Mon, 12 Jan 2026 01:19:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEr63rTSU6mNKwEH2p/9lr8Yw3V9YiW8z4Df6TR0gET2yAmIZpynylnfKMGk+StpeE+EEAUIA==
X-Received: by 2002:a17:903:2309:b0:2a0:d46d:f990 with SMTP id d9443c01a7336-2a3ee4e81c6mr173925535ad.31.1768209566996;
        Mon, 12 Jan 2026 01:19:26 -0800 (PST)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c4795fsm171834885ad.33.2026.01.12.01.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 01:19:26 -0800 (PST)
Message-ID: <114f7305-de33-4360-82d2-4d61e14934ec@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 09:41:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/7] qcom-tgu: Add TGU driver
To: Jie Gan <jie.gan@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-3-songwei.chai@oss.qualcomm.com>
 <069e2fb4-b4cc-474c-867c-2dd410ea80a4@oss.qualcomm.com>
Content-Language: en-US
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
In-Reply-To: <069e2fb4-b4cc-474c-867c-2dd410ea80a4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA3MiBTYWx0ZWRfX9+cgEi/WneM1
 TzhzZ4sN3ScZ2ENHrpgJeVhHJL+jjkHJscoRcXDMoeWRNEkJNid39mqpdxXrbqJfd7Y11Iu06xS
 zgfjHZHCeSD5rvPJ1Wi5n1qjFyHKc8QJHoyXQM5qcgfkPLK0JBNBxy0G6qiPjyz8N6MW98rfaG8
 RD7zRWtJyFkTjiZa2hq0digwCVdz+pLXdM0O1RJPNBDT+u6DGuOUv6bKE+Uat+5bZObpxwjfTl/
 atzJwrQhOqsxapZivMqWa5l26fJx6ZPnSb11sWOoKsUbR301fgtqewFHKee8EpnbbE8AS2RTjAB
 /7YJkfaZafOtHbbIPEEAu7SbHv/4YvZ/QT1lMlSMYQ+bK0KPnHGGL99Zh6zhLtJHQVtA/lwcJvV
 IKYL40lkWLmeB3IDL9ziUFAlmK3EoXjVQyWVphQtWabiEymMqTZU+BvZ9Y/HOmTSSHxkUkbSXHd
 hImj1BQ4kvo+VmacctA==
X-Authority-Analysis: v=2.4 cv=R6AO2NRX c=1 sm=1 tr=0 ts=6964bca0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QtmeBwCpv1JMxDmLrj4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: vyy-k1YgPijGAmorr7MPauD6D9wDl9Vk
X-Proofpoint-GUID: vyy-k1YgPijGAmorr7MPauD6D9wDl9Vk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_011930_101059_9A2B9DE4 
X-CRM114-Status: GOOD (  30.06  )
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



On 1/9/2026 7:28 PM, Jie Gan wrote:
> 
> 
> On 1/9/2026 10:11 AM, Songwei Chai wrote:
>> Add driver to support device TGU (Trigger Generation Unit).
>> TGU is a Data Engine which can be utilized to sense a plurality of
>> signals and create a trigger into the CTI or generate interrupts to
>> processors. Add probe/enable/disable functions for tgu.
>>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   9 +
>>   drivers/Makefile                              |   1 +
>>   drivers/hwtracing/Kconfig                     |   2 +
>>   drivers/hwtracing/qcom/Kconfig                |  18 ++
>>   drivers/hwtracing/qcom/Makefile               |   3 +
>>   drivers/hwtracing/qcom/tgu.c                  | 176 ++++++++++++++++++
>>   drivers/hwtracing/qcom/tgu.h                  |  51 +++++
> 
> drivers/hwtracing/qcom is a new dir, I suppose this patch series will go 
> through QCOM tree? If Yes, I think it's better to update the MAINTAINER 
> file to add QCOM maintainers for maintaining this dir. Otherwise the 
> get_maintainer script can not obtain proper reviewer&maintainer for 
> reviewing.
thanks Jie, will update further.>
> Thanks,
> Jie
> 
>>   7 files changed, 260 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>   create mode 100644 drivers/hwtracing/qcom/Kconfig
>>   create mode 100644 drivers/hwtracing/qcom/Makefile
>>   create mode 100644 drivers/hwtracing/qcom/tgu.c
>>   create mode 100644 drivers/hwtracing/qcom/tgu.h
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/ 
>> Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> new file mode 100644
>> index 000000000000..56ec3f5ab5d6
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> @@ -0,0 +1,9 @@
>> +What:        /sys/bus/amba/devices/<tgu-name>/enable_tgu
>> +Date:        January 2026
>> +KernelVersion    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai 
>> <songwei.chai@oss.qualcomm.com>
>> +Description:
>> +        (RW) Set/Get the enable/disable status of TGU
>> +        Accepts only one of the 2 values -  0 or 1.
>> +        0 : disable TGU.
>> +        1 : enable TGU.
>> diff --git a/drivers/Makefile b/drivers/Makefile
>> index ccc05f1eae3e..9608a3debb1f 100644
>> --- a/drivers/Makefile
>> +++ b/drivers/Makefile
>> @@ -177,6 +177,7 @@ obj-$(CONFIG_RAS)        += ras/
>>   obj-$(CONFIG_USB4)        += thunderbolt/
>>   obj-$(CONFIG_CORESIGHT)        += hwtracing/coresight/
>>   obj-y                += hwtracing/intel_th/
>> +obj-y                += hwtracing/qcom/
>>   obj-$(CONFIG_STM)        += hwtracing/stm/
>>   obj-$(CONFIG_HISI_PTT)        += hwtracing/ptt/
>>   obj-y                += android/
>> diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
>> index 911ee977103c..8a640218eed8 100644
>> --- a/drivers/hwtracing/Kconfig
>> +++ b/drivers/hwtracing/Kconfig
>> @@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
>>   source "drivers/hwtracing/ptt/Kconfig"
>> +source "drivers/hwtracing/qcom/Kconfig"
>> +
>>   endmenu
>> diff --git a/drivers/hwtracing/qcom/Kconfig b/drivers/hwtracing/qcom/ 
>> Kconfig
>> new file mode 100644
>> index 000000000000..d6f6d4b0f28e
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/Kconfig
>> @@ -0,0 +1,18 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# QCOM specific hwtracing drivers
>> +#
>> +menu "Qualcomm specific hwtracing drivers"
>> +
>> +config QCOM_TGU
>> +    tristate "QCOM Trigger Generation Unit driver"
>> +    help
>> +      This driver provides support for Trigger Generation Unit that is
>> +      used to detect patterns or sequences on a given set of signals.
>> +      TGU is used to monitor a particular bus within a given region to
>> +      detect illegal transaction sequences or slave responses. It is 
>> also
>> +      used to monitor a data stream to detect protocol violations and to
>> +      provide a trigger point for centering data around a specific event
>> +      within the trace data buffer.
>> +
>> +endmenu
>> diff --git a/drivers/hwtracing/qcom/Makefile b/drivers/hwtracing/qcom/ 
>> Makefile
>> new file mode 100644
>> index 000000000000..5a0a868c1ea0
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +obj-$(CONFIG_QCOM_TGU) += tgu.o
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> new file mode 100644
>> index 000000000000..c5b2b384e6ae
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/tgu.c
>> @@ -0,0 +1,176 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/amba/bus.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/pm_runtime.h>
>> +
>> +#include "tgu.h"
>> +
>> +static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>> +{
>> +    TGU_UNLOCK(drvdata->base);
>> +    /* Enable TGU to program the triggers */
>> +    writel(1, drvdata->base + TGU_CONTROL);
>> +    TGU_LOCK(drvdata->base);
>> +}
>> +
>> +static int tgu_enable(struct device *dev)
>> +{
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +
>> +    guard(spinlock)(&drvdata->lock);
>> +    if (drvdata->enable)
>> +        return -EBUSY;
>> +
>> +    tgu_write_all_hw_regs(drvdata);
>> +    drvdata->enable = true;
>> +
>> +    return 0;
>> +}
>> +
>> +static void tgu_disable(struct device *dev)
>> +{
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +
>> +    guard(spinlock)(&drvdata->lock);
>> +    if (drvdata->enable) {
>> +        TGU_UNLOCK(drvdata->base);
>> +        writel(0, drvdata->base + TGU_CONTROL);
>> +        TGU_LOCK(drvdata->base);
>> +
>> +        drvdata->enable = false;
>> +    }
>> +}
>> +
>> +static ssize_t enable_tgu_show(struct device *dev,
>> +                struct device_attribute *attr, char *buf)
>> +{
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +    bool enabled;
>> +
>> +    guard(spinlock)(&drvdata->lock);
>> +    enabled = drvdata->enable;
>> +
>> +    return sysfs_emit(buf, "%d\n", enabled ? 1 : 0);
>> +}
>> +
>> +/* enable_tgu_store - Configure Trace and Gating Unit (TGU) triggers. */
>> +static ssize_t enable_tgu_store(struct device *dev,
>> +                struct device_attribute *attr,
>> +                const char *buf,
>> +                size_t size)
>> +{
>> +    unsigned long val;
>> +    int ret = 0;
>> +
>> +    ret = kstrtoul(buf, 0, &val);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (val) {
>> +        ret = pm_runtime_resume_and_get(dev);
>> +        if (ret)
>> +            return ret;
>> +        ret = tgu_enable(dev);
>> +        if (ret) {
>> +            pm_runtime_put(dev);
>> +            return ret;
>> +        }
>> +    } else {
>> +        tgu_disable(dev);
>> +        pm_runtime_put(dev);
>> +    }
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(enable_tgu);
>> +
>> +static struct attribute *tgu_common_attrs[] = {
>> +    &dev_attr_enable_tgu.attr,
>> +    NULL,
>> +};
>> +
>> +static const struct attribute_group tgu_common_grp = {
>> +    .attrs = tgu_common_attrs,
>> +    NULL,
>> +};
>> +
>> +static const struct attribute_group *tgu_attr_groups[] = {
>> +    &tgu_common_grp,
>> +    NULL,
>> +};
>> +
>> +static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>> +{
>> +    struct device *dev = &adev->dev;
>> +    struct tgu_drvdata *drvdata;
>> +    int ret;
>> +
>> +    drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> +    if (!drvdata)
>> +        return -ENOMEM;
>> +
>> +    drvdata->dev = &adev->dev;
>> +    dev_set_drvdata(dev, drvdata);
>> +
>> +    drvdata->base = devm_ioremap_resource(dev, &adev->res);
>> +    if (IS_ERR(drvdata->base))
>> +        return PTR_ERR(drvdata->base);
>> +
>> +    spin_lock_init(&drvdata->lock);
>> +
>> +    ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>> +    if (ret) {
>> +        dev_err(dev, "failed to create sysfs groups: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    drvdata->enable = false;
>> +
>> +    pm_runtime_put(&adev->dev);
>> +    return 0;
>> +}
>> +
>> +static void tgu_remove(struct amba_device *adev)
>> +{
>> +    struct device *dev = &adev->dev;
>> +
>> +    sysfs_remove_groups(&dev->kobj, tgu_attr_groups);
>> +
>> +    tgu_disable(dev);
>> +}
>> +
>> +static const struct amba_id tgu_ids[] = {
>> +    {
>> +        .id = 0x000f0e00,
>> +        .mask = 0x000fffff,
>> +    },
>> +    { 0, 0, NULL },
>> +};
>> +
>> +MODULE_DEVICE_TABLE(amba, tgu_ids);
>> +
>> +static struct amba_driver tgu_driver = {
>> +    .drv = {
>> +        .name = "qcom-tgu",
>> +        .suppress_bind_attrs = true,
>> +    },
>> +    .probe = tgu_probe,
>> +    .remove = tgu_remove,
>> +    .id_table = tgu_ids,
>> +};
>> +
>> +module_amba_driver(tgu_driver);
>> +
>> +MODULE_AUTHOR("Songwei Chai <songwei.chai@oss.qualcomm.com>");
>> +MODULE_AUTHOR("Jinlong Mao <jinlong.mao@oss.qualcomm.com>");
>> +MODULE_DESCRIPTION("Qualcomm Trigger Generation Unit driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
>> new file mode 100644
>> index 000000000000..b11cfb28261d
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/tgu.h
>> @@ -0,0 +1,51 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef _QCOM_TGU_H
>> +#define _QCOM_TGU_H
>> +
>> +/* Register addresses */
>> +#define TGU_CONTROL 0x0000
>> +#define TGU_LAR        0xfb0
>> +#define TGU_UNLOCK_OFFSET    0xc5acce55
>> +
>> +static inline void TGU_LOCK(void __iomem *addr)
>> +{
>> +    do {
>> +        /* Wait for things to settle */
>> +        mb();
>> +        writel_relaxed(0x0, addr + TGU_LAR);
>> +    } while (0);
>> +}
>> +
>> +static inline void TGU_UNLOCK(void __iomem *addr)
>> +{
>> +    do {
>> +        writel_relaxed(TGU_UNLOCK_OFFSET, addr + TGU_LAR);
>> +        /* Make sure everyone has seen this */
>> +        mb();
>> +    } while (0);
>> +}
>> +
>> +/**
>> + * struct tgu_drvdata - Data structure for a TGU (Trigger Generator 
>> Unit)
>> + * @base: Memory-mapped base address of the TGU device
>> + * @dev: Pointer to the associated device structure
>> + * @lock: Spinlock for handling concurrent access
>> + * @enable: Flag indicating whether the TGU device is enabled
>> + *
>> + * This structure defines the data associated with a TGU device,
>> + * including its base address, device pointers, clock, spinlock for
>> + * synchronization, trigger data pointers, maximum limits for various
>> + * trigger-related parameters, and enable status.
>> + */
>> +struct tgu_drvdata {
>> +    void __iomem *base;
>> +    struct device *dev;
>> +    spinlock_t lock;
>> +    bool enable;
>> +};
>> +
>> +#endif
> 



