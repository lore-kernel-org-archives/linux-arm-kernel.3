Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE55ED730B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 08:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9QNzfSdzILrWECJHe9a3GABkzGiAZJ8sMLoAMIu4d80=; b=Io5sNgKSfE492HHOKcpqfIIcFr
	jaXQ27L4SUvCedqvBAh1LdYvWzO6qbO1ASU3IpdNB1aNDngWGBxe3gcgYIMD2EQsXlgpMTXL3xyld
	Ir1zvz5txqkbWWFmaJHeVkOZcOc1vTdmlbwpdTeMaEfZ7wWPPWlCGirU2jKWMR8oZHbsKd/HcdDsT
	UVPdzUo/orsLu3g1QOkzfMGIFbzL6AY6lp5FinIRddVC9nsBKxe9oGVl7oh5dzhTV9QbIHZ6kPK0a
	Z/K5FQPzmIUmSPFiUIDFjuRuz3yI5sUJn1AM9qFEhWfO24swP60+m6bWNRQB5aloZ1S0WZOTbiy5F
	q84TPH3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ZjM-00000001hP9-1WP4;
	Fri, 03 Apr 2026 08:18:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ZjJ-00000001hOE-0D8I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 08:18:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63373so33449905
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Apr 2026 08:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9QNzfSdzILrWECJHe9a3GABkzGiAZJ8sMLoAMIu4d80=; b=K1XoZOEub4XArpi6
	pCrba6juViBq0SgqN3LlX1rYYJktiOi9U0wq/Z8bSFyWZ9rujk4MFEFAKnuxp3X1
	YTozswlhOuRapxkajIC4BAyT8uyfBdnrSnh6KDaa8qyeE6IcKh85Ojh2esSnVV/f
	ilocT1gvYKNr9dhqycGy8UiFy07EvEmvt0RRg/whJhIUdhKpo1TU3KlvWKH+sxP9
	N/WbYjppFbTEintCP9Cs9i1ZVe1PbWxrm4w+42co7crrm+T97BmBybKbU6e11IEx
	Xfy5FfK2twplcNkopqpHBkHBzCwmlduTK5Jtrg/1GmfFH5hm8BdLLzhd+g93LvqB
	fG1lAg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da8u586wu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 08:18:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c9364612fso2557107b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 01:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775204290; x=1775809090; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9QNzfSdzILrWECJHe9a3GABkzGiAZJ8sMLoAMIu4d80=;
        b=Wb5Q/Cz8uP8acUAk1G8C8THe30ENxtjA5L2bH1G8YnnAIg5jbNSf6XxFTvKT1j2HsK
         zQT/WQ+niWQ2gCZS795yl4rR4y90eVvPxsE+JbNf5KEG8IZYQM4l/OGD7LzygcAKlrjy
         J1zKGthFFEwCQQVlljqXgMMSYiPrsEI8gkeixPr6Zsdx+93GK5gA+lEVhdkVAPsiMkpG
         88MbX9y4BjcPK2xSvaj6KkxF4O/GdNiX9ZPvZ9Jg1vy4mNSSz6BRcyOK8NN7ZaskmKJJ
         4jZpTdmZT/dFDNL/rbm1BD1ZZRvGjX5ylnxSOHXj/fkn2x7DWkFrcZ4ekEgqTRwvelEb
         a0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775204290; x=1775809090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9QNzfSdzILrWECJHe9a3GABkzGiAZJ8sMLoAMIu4d80=;
        b=VqTNX4vM5F3NVr+ARYq0tzVNAXOS5JTKkcsHMMA9OBBLUBz8FgPwgOl/CPVPhTYDZ8
         MMvNZkUaBqQYYQZzaM4YOjP3C0K5ihg/aylKwrWMTW+g4T5sBeC7z43796bc0qCwCMkw
         s1H9tN7cgTEfgGWAZ+SKj+/omDfIB3aGT4xYHcyX0S23EX31K/G7tziqzfHqcDDS4s77
         Xo/8jLDLxd7xDwMyIC5CwrtO1u+QvVNEMmp2ZihSLmGc7ChAw4vQ7Y5grmMetOop2oUx
         Eq6oQ9rN5jarseN9g/rQ5UbSj9SnAIV6hK/J/BlsLnQcVTIA7mU4Qmbva9XcdwZTjtmR
         HPtA==
X-Forwarded-Encrypted: i=1; AJvYcCXcS+no0EnapKRSrbvCsYbAXJvhESfjX4oSDEQmpx3eKLgKFllDVsn18aBiVxYYr/gqAs1Qst7IcyHZAIr+Pi1i@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0XbThHiXzNO/qE7UYWkbGjps07xljhy8rk26nvJRYf9RLd199
	f0SVX3wRnLPOH1Ei45/+KxsJUaKhXeiqtDpbN1awICNYJ60ZNfTS/EZ84KviIzaU9Vg5Ao1AcPA
	R0TcMBZ1FUE6bM8NHJKVq06uguZAKH7b+kuGQ4cnhNkpGjnyAVP6FfFoesEmvj00Xz85o18Iqyq
	vmFw==
X-Gm-Gg: AeBDiet2lK9AmIQWFSIqaAb1raGIsUGXTBOmZeLX6gieFmdVYehqesBnXeA1SIueg5K
	PG+9N8aP056Qe+omkQHgEUjRUf6XxqqUmwSXbT5hbB3RVGhLcE2UGnxAbIRXnvT0r+omzOh45Hs
	FeM/lXr4j+WBVoBEm5ImItbJv8BxFySB55P2wIVT43CsBSSDquyOMYLZFfxE0adOOdficmg7Ypg
	wDslcgmdjjGZK7dUfitr8uGlWoEznzydDyWOmV3q3rUD6d8CTf+wsTgBParhIsGFlL9SSQMUoAy
	C67qR/UTNKo8YGh/zLZiTMndKrFVrcalao70J0+0fkIfZkGzgo7sx5Qezi/+m9Wj+zQbbxstHG0
	TIdfc7tYwkRlBVdt8/KM9JSPh/vLL0AN807KJAyo3gHtUjP3oD4NEYl+JyE9FaQgh6pNH74pVNl
	qZhFbs61w9LfrIoFeBBA==
X-Received: by 2002:a05:6a00:3027:b0:824:93e4:2ddf with SMTP id d2e1a72fcca58-82d0da3f8afmr2144235b3a.13.1775204290344;
        Fri, 03 Apr 2026 01:18:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:3027:b0:824:93e4:2ddf with SMTP id d2e1a72fcca58-82d0da3f8afmr2144205b3a.13.1775204289818;
        Fri, 03 Apr 2026 01:18:09 -0700 (PDT)
Received: from [10.133.33.157] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9a24039sm5313994b3a.0.2026.04.03.01.18.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 01:18:09 -0700 (PDT)
Message-ID: <10de33b0-b613-405e-832e-852202dc776e@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 10:04:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/7] qcom-tgu: Add TGU driver
To: Jie Gan <jie.gan@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
 <20260317032639.2393221-3-songwei.chai@oss.qualcomm.com>
 <a0a9fa9d-5438-48e0-b3de-def97d4214bf@oss.qualcomm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <a0a9fa9d-5438-48e0-b3de-def97d4214bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA3MiBTYWx0ZWRfXyd4irbfAM9gM
 zTIHEVZklwpxkgq/YTZwGCq6a3h06+WaOKsNh5KlhDlvZUO+jSl1B25PDMCLr7k3yHGFfq23VCf
 yyvcvIv5bbDW3o12QH/YiEYYxPjGFZRzcG45EtETY7On73VvhINjh5fBc2OczijF/KSyDrEKi9Y
 zCZXAkB5Ppg8Gztj2Tcp8RYhCEwWDv9EuYFhU+k3dygQyw3jBQruMJjyZGMHxMdQYBChW7ias6G
 xrAW1B1oSaL1DG5DwYbWCCpJHvwdLqH+faXV43fkJPnRzQA9BIzKOs/M+AC8DXczCSKnZJb9bqm
 H+ltSobbuvmWbFmj9DXaxZHg2sMyUKue3HT7X6h+P/8t/4ZmFOjNzhrYG7WojsGcZSS3Qz2oeSP
 itYD8Vwjiq4+fU2WU+E1a+Zs3nNfdhz/OCIwQDuvITHX1k6zr0EHvm9hLXkbNSa6/tTjpfUL8/t
 Goo1hiifUlgqEz3WAaA==
X-Authority-Analysis: v=2.4 cv=W5g1lBWk c=1 sm=1 tr=0 ts=69cf77c3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pxWJ9DaTX99kDjaxMB4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: exnV6NjSCPMipqGqXCzLnBg63KCk469_
X-Proofpoint-GUID: exnV6NjSCPMipqGqXCzLnBg63KCk469_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_011813_215489_5B5C2DA4 
X-CRM114-Status: GOOD (  29.64  )
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


On 3/27/2026 10:16 AM, Jie Gan wrote:
>
>
> On 3/17/2026 11:26 AM, Songwei Chai wrote:
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
>>   drivers/hwtracing/qcom/tgu.c                  | 183 ++++++++++++++++++
>>   drivers/hwtracing/qcom/tgu.h                  |  51 +++++
>>   7 files changed, 267 insertions(+)
>>   create mode 100644 
>> Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>   create mode 100644 drivers/hwtracing/qcom/Kconfig
>>   create mode 100644 drivers/hwtracing/qcom/Makefile
>>   create mode 100644 drivers/hwtracing/qcom/tgu.c
>>   create mode 100644 drivers/hwtracing/qcom/tgu.h
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu 
>> b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> new file mode 100644
>> index 000000000000..ead237bb7d89
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> @@ -0,0 +1,9 @@
>> +What:        /sys/bus/amba/devices/<tgu-name>/enable_tgu
>> +Date:        March 2026
>> +KernelVersion    7.1
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai 
>> <songwei.chai@oss.qualcomm.com>
>> +Description:
>> +        (RW) Set/Get the enable/disable status of TGU
>> +        Accepts only one of the 2 values -  0 or 1.
>> +        0 : disable TGU.
>> +        1 : enable TGU.
>> diff --git a/drivers/Makefile b/drivers/Makefile
>> index 53fbd2e0acdd..82b712a12a26 100644
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
>>     source "drivers/hwtracing/ptt/Kconfig"
>>   +source "drivers/hwtracing/qcom/Kconfig"
>> +
>>   endmenu
>> diff --git a/drivers/hwtracing/qcom/Kconfig 
>> b/drivers/hwtracing/qcom/Kconfig
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
>> +      used to monitor a data stream to detect protocol violations 
>> and to
>> +      provide a trigger point for centering data around a specific 
>> event
>> +      within the trace data buffer.
>> +
>> +endmenu
>> diff --git a/drivers/hwtracing/qcom/Makefile 
>> b/drivers/hwtracing/qcom/Makefile
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
>> index 000000000000..58c19f12f3d7
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/tgu.c
>> @@ -0,0 +1,183 @@
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
>> +    if (drvdata->enabled)
>> +        return -EBUSY;
>> +
>> +    tgu_write_all_hw_regs(drvdata);
>> +    drvdata->enabled = true;
>> +
>> +    return 0;
>> +}
>> +
>> +static void tgu_do_disable(struct tgu_drvdata *drvdata)
>> +{
>> +    TGU_UNLOCK(drvdata->base);
>> +    writel(0, drvdata->base + TGU_CONTROL);
>> +    TGU_LOCK(drvdata->base);
>> +
>> +    drvdata->enabled = false;
>> +}
>> +
>> +static void tgu_disable(struct device *dev)
>> +{
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +
>> +    guard(spinlock)(&drvdata->lock);
>> +    if (!drvdata->enabled)
>> +        return;
>> +
>> +    tgu_do_disable(drvdata);
>> +}
>> +
>> +static ssize_t enable_tgu_show(struct device *dev,
>> +                   struct device_attribute *attr, char *buf)
>> +{
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +    bool enabled;
>> +
>> +    guard(spinlock)(&drvdata->lock);
>> +    enabled = drvdata->enabled;
>> +
>> +    return sysfs_emit(buf, "%d\n", !!enabled);
>> +}
>> +
>> +/* enable_tgu_store - Configure Trace and Gating Unit (TGU) 
>> triggers. */
>> +static ssize_t enable_tgu_store(struct device *dev,
>> +                struct device_attribute *attr,
>> +                const char *buf,
>> +                size_t size)
>> +{
>> +    unsigned long val;
>> +    int ret;
>> +
>> +    ret = kstrtoul(buf, 0, &val);
>> +    if (ret || val > 1)
>> +        return -EINVAL;
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
>
> Sorry I didnt observe this issue with my previous check.
>
> echo 0 to the disabled device will result in the pm_runtime reference 
> number goes to negative. We dont need pm_runtime_put(dev) when we try 
> to disable a diabled device.
>
> Thanks,
> Jie
Thanks for your careful catch here, Jie.
"pm_runtime_put(dev);" will be removed here in next version.
>
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
>> +static int tgu_probe(struct amba_device *adev, const struct amba_id 
>> *id)
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
>> +    drvdata->enabled = false;
>> +
>> +    pm_runtime_put(&adev->dev);
>> +
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
>> index 000000000000..dd7533b9d735
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
>> +#define TGU_CONTROL        0x0000
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
>> + * @lock: Spinlock for handling concurrent access to private data
>> + * @enabled: Flag indicating whether the TGU device is enabled
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
>> +    bool enabled;
>> +};
>> +
>> +#endif
>

