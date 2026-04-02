Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EDFD730B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 08:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BV7K1/0Zkpogt2mGKr6CARDe+OrkUhExaNsYM3POsvM=; b=eL0FY99ucuUtKqkXji0wivKFNp
	1kydKypqMKdJvzQHZ4YPMkxRxRggzJfneNsvHBMkM2ezdICSJ96NJiaZHxw9BSXQy4SHnHjSoXdij
	fg+G8DQjle9oGkqh00ai/Jytr5bZ3BexSJ2cn8UuChoXohwnYbwzJc8FbtD7wQhrAmieaVhFEwhW+
	bojLH2zun23M/xGib2bWnljyAWQcOXyyJycQeextdQloKSIBUdavqxs9Yz2Ff++2Tu8xgmSlX4kTG
	LOcdPsowSfpWva6s9cumB1hdvX1HmkBV6cpF6rSIDZR7zXvQsx2PHpijn59Eq8lzsJwxgKQW5aReB
	H06mJsHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ZjC-00000001hMt-2GQy;
	Fri, 03 Apr 2026 08:18:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ZjA-00000001hMY-02lD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 08:18:05 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6332agHI1562154
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Apr 2026 08:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BV7K1/0Zkpogt2mGKr6CARDe+OrkUhExaNsYM3POsvM=; b=P5FrFHlMLQOvsXrn
	2s5p0COIyKk//1d2qliScPXGzKNF43W+eu+Pxk1LzOijWW3S7X+WXWjs11t8siQR
	daD+V9gqYopKuFvcTa00ssMq8tFXA3ixQYA3YnrH4lmnCDoyHKuKnArhNHlnqaAL
	bjSYKQrRs6QHRc6KP6RJzc1B5KoxCWOJ4GZ5J3JQCJpcCXpJVCE1jUXgAvb+kzz8
	RKOyZiN54ht/FEqsb/y8U1KQfxp77zNJJGL8zSupVBkmaop3B17u3ZSxoOvu9OLr
	RMm/uMbbaD+eOeham8bnfu5T1TKPKR+61PnyyzJXfaQS1dARZ+RIq7NwdayhWvLW
	UIpfWQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9um72pk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 08:18:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76cb2dce57so931826a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 01:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775204282; x=1775809082; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BV7K1/0Zkpogt2mGKr6CARDe+OrkUhExaNsYM3POsvM=;
        b=d6UFPUYFBAxz5uUUuodz5FSDBaGAFz/40wPlo6OYK5fsMtkk74xhM5UlsP1Zt8oXBN
         T8Kx0pW+t2PL8aO06kdOlo9vnfOJYy6JtWfph8fzRsZ5F/bHsol+9GWV1TaJOeFtwg0b
         ubVuTWC2XGBk1KLOOEETQpKkFphBkU4v6rihhcVdI8F0EsnU9Sw8nc1SOE6kQW5MOPtT
         hA3h2SqHYqHBJdgUYE9MH5KmkKYpkXZTnemQN5hwAoXlgUl0916+nXyA2FWqT0XpYm9A
         6w6oClkK7EjbJMtPCW+ZHTB/3UqxqQ58XPgBr3hLWEJF7RGt3XfKb1beBbcxxikW8Cjk
         43hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775204282; x=1775809082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BV7K1/0Zkpogt2mGKr6CARDe+OrkUhExaNsYM3POsvM=;
        b=Pq13vvg1hiJ02IcSYFqxlKhpNVoOjvszTcRIWTZt8iEhUH9hhRtw3rWq8GMcbyjV03
         IYkU04V5yR1AtoMNU12cAVOM4OKUd0GECySxb3bre94u9sfn6NmBPkrg9ps8cpNU8y1M
         /XFxWwC/8ZKho2cTteafMjpnB3uUO8Y8AYvPujIm5eCgkUukJFStZG59tpxRhTmMISL5
         hax90EfPRQbrY8p4EdS6lVhw2c5CbgSie7Q9p2CsN2BXLKAeb7I+AwWrWbBawhqsJdA8
         4F5f67HeuCiM3WBHeRa/1MhNjBNxnCcLWJDLWJcuhUQktZHoxgy6WIpqKoB2C9hwQLcX
         dPmw==
X-Forwarded-Encrypted: i=1; AJvYcCX9jcIQMUb0FHLShMBW5TFiuVOd2yZGQJt9aKBxHpCVZZpw1dYBxjN8cUa3OgD8bmYrsXufe1R1sAaelqfh/1NC@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgd86wqZp1RzFa3UUEIT6LivEoskvDNBlsDPkvG3RUFzmscJzY
	z/YjwlynRvFpn0xgMFAwRfg7WfxyKxKpujfSHxGPP3BUyUuThiF+wtL0WcJzN64wgiopdnyG82T
	zKLdg6USOSefehS3OHepwZqdEJ33wf+1bQIJPt5uZtupBe8Yqc4vYV7WrLSPeBxZ5cTCQjyE6r5
	icXw==
X-Gm-Gg: AeBDievW+bppVNL9pgr3ir/qKw6+UIE3wcUMyl+j6qBgxBm+jILe0HPQHAyD2Vu+Eqi
	m48epuoKN/ci4AcexPktEo6xgJWOUKZHXkFfjLcn6TFRdXG+MpWCcCz/WaWL8J+enCMpsZEdEk7
	2Q6a+15aa5zCaiC3mZIVWMotOLti4BSAAydQuCMo+QlKlo6xn25K7Cf8Mj7LEcx01mONeNgBOor
	mtzPxp0XcVHfGZy88eARWElWV2TwxRmoaQgqMt/JiuHQxLDfZfU3vabACFYRd5QxK6eMwQpvFmi
	2RKgPNJAgOHu748K71cihqG3/M6Tf3rrn0XbK/ghL+L7+KWzjqlXrQC8+J9Pgwi4pKLUFkOoB4v
	9p6+SxmzltTbeqCc9P1J1RR/GzPeCgLP2q9oVtKAoRaGiELOG+IkucSmVOVWNSDf43FwhVbnqA/
	IRmFP2G4iejGMLCbkjnQ==
X-Received: by 2002:a05:6a00:3902:b0:82c:9fe1:aa4d with SMTP id d2e1a72fcca58-82d0da6d649mr2273772b3a.13.1775204282434;
        Fri, 03 Apr 2026 01:18:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:3902:b0:82c:9fe1:aa4d with SMTP id d2e1a72fcca58-82d0da6d649mr2273747b3a.13.1775204281873;
        Fri, 03 Apr 2026 01:18:01 -0700 (PDT)
Received: from [10.133.33.157] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9a24039sm5313994b3a.0.2026.04.03.01.17.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 01:18:01 -0700 (PDT)
Message-ID: <02fcb6a0-570c-48c8-814a-85e414659f4d@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 10:03:06 +0800
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
 <2ff7aed6-72c0-492e-96d7-f8c30f331a01@oss.qualcomm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <2ff7aed6-72c0-492e-96d7-f8c30f331a01@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U/WfzOru c=1 sm=1 tr=0 ts=69cf77bb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=MSq3_QDDgX4y9XyO_xYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: iYHe4251_QO3qRRfLiDLmnXJwS6JF0Ff
X-Proofpoint-ORIG-GUID: iYHe4251_QO3qRRfLiDLmnXJwS6JF0Ff
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA3MiBTYWx0ZWRfX5Vkam62PmOrT
 svFwTp1fFJMPpnpa5LGNNO8MYCtKrK4YKJKKHWIt6yHRXIlqk5kp/UJUUoEPXW/xIgTotYKFIMo
 4J9dCkLMyK6XQUh2IbynZk+pD+UXkxA2zb5XGwmxLhLvuEMc7OeDGMkbPeDTLCrratyt8wlIAb4
 5mboX55GOPO9rovIJOqsj5qouA9U21FctQMhhQbrRwFqSs802F2AI0wv7WivGhR/q4M9hajxuKE
 HVhMdVrHjgzhnUigpTpiItKN2JDz33qO8nnYJ9bfrrzUILRKfe7uMohadj/Ug3s31TjqwCR27X4
 EWvIqc33Rfb0VePcfN/JzUG5OQtam8hTWlpYxCiPJF7YTYcJbnrXhWxvpKQSr/+uRQ+h0AwIBDV
 nizoIDaD9JuPxX42AhPjBtjJnw7MQJpVUvbYm8EIYZUmjgxKdhgD8CaRSFeQZd3FA3Jjt9wJ3vh
 vBgBvWBGEjG0q+GX9mA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_011804_058366_CC04E2CC 
X-CRM114-Status: GOOD (  26.82  )
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


On 3/27/2026 10:35 AM, Jie Gan wrote:
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
>
> missed ":" in all patches.
Thanks Jie, it will be updated in next version.
> Thanks,
> Jie
>
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

