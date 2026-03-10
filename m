Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69749EB1049
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 10:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHFnNozgwGiUCXfpW8J3nNjFkuPfSlVjQ9FqCdunc0M=; b=JAwwsAd5LTKNbI1jU8G764R0Lo
	YuQdulkhPSc/M5mEs1nwWizYrfWeiOe9bF8ytv8DGJClm5Bjh/1nb1qPOnhIngSBS7y9E1HAPxiGQ
	vcchsQPAfpDDkQW33/KfDk3/637Cjr3ant900cHxJL28mpcd7DqXUvwGKpufcEymAzlIZOd1+G00x
	0KQm5vZoBEvnntrzs9PFlyq+Tr3mh6jinxSbRgV7O5nJZjXsSV54pqTzG5+mMSIoI+bM2Ac7+CXdm
	weEn7FXb6cQeWZYi8mFQSk9UZXl+3+PnWZvqxpX7rBbzTFMTcD/tJOPJHv0pWJEGBcKitW2FwnC7l
	+KW2234w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzunr-00000009FJG-2A3H;
	Tue, 10 Mar 2026 10:59:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzunp-00000009FIv-2uiM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 10:59:06 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A6VL2h2021450
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 10:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kHFnNozgwGiUCXfpW8J3nNjFkuPfSlVjQ9FqCdunc0M=; b=RCnhK+C133Ll3RJA
	VBuLU3o/mAtpvFEdsd5yjwMFLAdQokBsWvyNseWBEfYs1ktfDIvaBXa59fmQtc+w
	IoHluBgYyEUmg0IiF5eCa0WtR2hIMuMz6o+9KW/bE2kyjO7KLTRuLa88lFUNJ4Mp
	criF2kG8rAjOtbcYzVpU9NOuB54ATcmo9rT2PHUuOTB32JiAN8WaciOWKdKoUqTd
	FrhYJHg2QNpFsH3qQUswS+e8KLW7RGZI/0Id8yVu48XGmYXc9yEfuhPtLQwWkjsq
	nEgcO+fFIV1Lj985nZHS9WbVGo1zLxNv5oSK85WqJqGY4i7B2xbNNyg9eK+KdTI2
	cjLxog==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3w90t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 10:59:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7380305a9aso3831446a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 03:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773140343; x=1773745143; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kHFnNozgwGiUCXfpW8J3nNjFkuPfSlVjQ9FqCdunc0M=;
        b=jekj5bKzVNfJAc3afT83f1GNuA9s0g7xMcRJIFqqZP2OyyW4hhyOx/KoYoAHpSTI9k
         citCx5q6Xt6Fm8V8eJ8WGBuXJbOfoMK2lHWoH6OUfjOURfmlmmxKXBtlYmdqsysMq4GG
         6jA7udWlwkM+7CmUcowR/5lFM0ZhRPQT8jA3RFii3Rg60y45etivNeRLj3fXSAUuU0OF
         YMs4UOzphgN8Mzf5xB4rv4ITFwFP21RhpcnoqaTECujfy4ePStrT/eI+mEEFC2X9aCKQ
         1S8RsVS12UILhMDDnIZDtmVSHx6vRD6AzteY8frHIoLz4Co63RhcOlwADHyesoQtY7up
         R91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773140343; x=1773745143;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHFnNozgwGiUCXfpW8J3nNjFkuPfSlVjQ9FqCdunc0M=;
        b=W3XJNM808STpEHHdKFnXj8H7YIyJzIDdUTH+dDhSwVxzVx+y+9AAMLg7iwF8NgA688
         KYaOuwm4TtKfoULOMBGduHId0pWcMXjCOWh7NgC2pzuks8ZFy+I1Fi8Y6dy0BaA2TTVk
         fniXdSI4PFWaMgl9fhtVT1Avr6bCUlJAN137b48z6bHkP0CQA5GK8cRBevJrBjkMnqCU
         TXcfksyHeGZCfQsK7nx2Ht32+oMf0hN1AUrGQenQ7XlmehKYeXNTckZ32vtsH8NG7Ih+
         +8GaVq3Luoy5pl7+7oKZhakwjotKNL97nVSmMcDcRsFYutZsZGpTLo+YemUC3RrTPuaP
         x+Wg==
X-Forwarded-Encrypted: i=1; AJvYcCW2zQ2lpnmulm4JDtHWdZgCSXlA56Iwvu1CP6fSSJ+fnW38cZ+cgDn+2aZlng25Gy0kT4kHk4ifqnXJ/Av2xlY5@lists.infradead.org
X-Gm-Message-State: AOJu0YxtQed6Z4gETUQ0vxLox2cjfWM2TGLbjedKbN4f5CuNCQq2AP0A
	y5NAeTgWNNhOvvi3Zlq1uIllyLSbOSPdYvjZmmiqB3ji0NKAwVP0cFwwab5K55NfeuLGVMywibT
	jHlXLTSRlVFMWaP3y+ekLiX/lXK2/CkBXqlrEsq+DkChb+JiN1T6XFCEEzKaGEc5alGXoqGY6il
	+aSg==
X-Gm-Gg: ATEYQzzxIdaofSd3wMCj2vp1SpL7RbeDU+YhU2CJFowRu0METWtPgWyzIMF9SdwWb8J
	04v6zCFQIWV4jl4DRO408lpeBDWUDqAfGT78G3kx50D9JTDNtoC8Til2cOCnUWokmCp29FH1dl3
	o25OsGNdz649gll4DqFLa992sAtOMO2+bEbmbNWrk/hTFw4XgAVjqVR+FD9eG4Rqxh9zoLKrO9K
	BcV19xmIo212/d+7YhnDPLwLOWnZ7VgW8SKYyIjPMKbaEdg3u0ZQPHnkSuNwoATk9fWH+N3EwfV
	9T1VaMp1acIC2fcQ7vgnn7OqkfIBBQ41yPMuoESm/rK3WLWRdTRCCvEJxYZB/ws5FSnZe4MbtT/
	Hm00lAb3V8oX4A11FbM0iOExKE17Z0VDGjzXvZ5eGPM1g1h+fibFqeTrBemcGQc/PDDYOq7g+/Q
	7qFHP6yE8rIyY=
X-Received: by 2002:a05:6a21:483:b0:398:8b64:3fd with SMTP id adf61e73a8af0-398ab288704mr2725101637.5.1773140342790;
        Tue, 10 Mar 2026 03:59:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:483:b0:398:8b64:3fd with SMTP id adf61e73a8af0-398ab288704mr2725070637.5.1773140342202;
        Tue, 10 Mar 2026 03:59:02 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739dfbf4fesm11934591a12.0.2026.03.10.03.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 03:59:01 -0700 (PDT)
Message-ID: <4b92b344-c5ef-4bc1-83dc-5f340c5daa89@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 18:58:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 6/7] coresight: ctcu: enable byte-cntr for TMC ETR
 devices
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
 <20260309-enable-byte-cntr-for-ctcu-v14-6-c08823e5a8e6@oss.qualcomm.com>
 <f45b9679-857f-4bb2-b683-cd5701ea16de@arm.com>
 <bc05d278-fe28-4503-ac99-fb28904e7343@oss.qualcomm.com>
 <2ac1d8a1-5cda-4e5c-8c6a-ad08d53e3347@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <2ac1d8a1-5cda-4e5c-8c6a-ad08d53e3347@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5NCBTYWx0ZWRfXwp6waN4qU8Ni
 tEy4lyhyJ/ZV9dJ9QHAsHnPbEy12oz9QDdvDs+qXGsxkpuS66bYlvzgf0Ukry2KbXcw6NCIXgMe
 6APQEcG3NV81a8KdLIcKLHT6dRScOj+Sr3tPP4Zfb2vpNGrrpYljAVBAvSA63lIXEDp9DpPy+C1
 naM3bljDxRvJ02CREhCMazMtdfqhaq5UUWenYl+Y4X2tUZbXg/A2Nxu9neD3Y1VSmdY3xMEUG4P
 r5zpMd2TbgJOSV5R/2GDCTgFrK8gcwfYQ4hDI4MRztnY5t4e/V8Y55x24ulckg/Jwvp6zKAHHs+
 hM2ggt5np8JQtov59sXb7P+w6s2RCKrLdFrf6WLhHLROupePWuNL4bRKM9KJN8ciGGTztFUwujr
 SeecUEB95zA8rOcicOenRZ20/kRYYA/DnaG3EMUPMAm+U0DAtFPHKpFcgFb9s9myZjNSKai3pi7
 BLsqCEVueC3j2lcF9qQ==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69aff977 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Tkd2dFuKn2QnQrKl1zwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: ZO_aJPMh7USSRXwYlpKNagPrC_R5D3_M
X-Proofpoint-GUID: ZO_aJPMh7USSRXwYlpKNagPrC_R5D3_M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_035905_743752_549401B7 
X-CRM114-Status: GOOD (  31.08  )
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



On 3/10/2026 5:15 PM, Suzuki K Poulose wrote:
> On 10/03/2026 03:01, Jie Gan wrote:
>>
>>
>> On 3/9/2026 8:43 PM, Suzuki K Poulose wrote:
>>> On 09/03/2026 09:47, Jie Gan wrote:
>>>> The byte-cntr function provided by the CTCU device is used to 
>>>> transfer data
>>>> from the ETR buffer to the userspace. An interrupt is triggered if 
>>>> the data
>>>> size exceeds the threshold set in the BYTECNTRVAL register. The 
>>>> interrupt
>>>> handler counts the number of triggered interruptions and the read 
>>>> function
>>>> will read the data from the synced ETR buffer.
>>>>
>>>> Switching the sysfs_buf when current buffer is full or the timeout is
>>>> triggered and resets rrp and rwp registers after switched the buffer.
>>>> The synced buffer will become available for reading after the switch.
>>>>
>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>> ---
>>>>   .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   8 +
>>>>   drivers/hwtracing/coresight/Makefile               |   2 +-
>>>>   .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 351 +++++++++ 
>>>> + + ++++++++++
>>>>   drivers/hwtracing/coresight/coresight-ctcu-core.c  | 103 +++++-
>>>>   drivers/hwtracing/coresight/coresight-ctcu.h       |  76 ++++-
>>>>   drivers/hwtracing/coresight/coresight-tmc-core.c   |   8 +-
>>>>   drivers/hwtracing/coresight/coresight-tmc-etr.c    |  18 ++
>>>>   drivers/hwtracing/coresight/coresight-tmc.h        |   4 +
>>>>   8 files changed, 555 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>>>> ctcu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
>>>> new file mode 100644
>>>> index 000000000000..6ff1708fb944
>>>> --- /dev/null
>>>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
>>>> @@ -0,0 +1,8 @@
>>>> +What:           /sys/bus/coresight/devices/<ctcu-name>/ 
>>>> irq_threshold[0:1]
>>>> +Date:           March 2026
>>>> +KernelVersion:  7.1
>>>> +Contact:        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>; 
>>>> Jinlong Mao <jinlong.mao@oss.qualcomm.com>; Jie Gan 
>>>> <jie.gan@oss.qualcomm.com>
>>>> +Description:
>>>> +        (RW) Configure the byte-cntr IRQ register for the specified 
>>>> ETR device
>>>> +        based on its port number. An interrupt is generated when 
>>>> the data size
>>>> +        exceeds the value set in the IRQ register.
>>>> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/ 
>>>> hwtracing/ coresight/Makefile
>>>> index ab16d06783a5..821a1b06b20c 100644
>>>> --- a/drivers/hwtracing/coresight/Makefile
>>>> +++ b/drivers/hwtracing/coresight/Makefile
>>>> @@ -55,5 +55,5 @@ coresight-cti-y := coresight-cti-core.o coresight- 
>>>> cti-platform.o \
>>>>   obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>>>>   obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
>>>>   obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
>>>> -coresight-ctcu-y := coresight-ctcu-core.o
>>>> +coresight-ctcu-y := coresight-ctcu-core.o coresight-ctcu-byte-cntr.o
>>>>   obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
>>>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c 
>>>> b/ drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
>>>> new file mode 100644
>>>> index 000000000000..0bf738d6c283
>>>> --- /dev/null
>>>> +++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
>>>> @@ -0,0 +1,351 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>> + */
>>>> +
>>>> +#include <linux/coresight.h>
>>>> +#include <linux/device.h>
>>>> +#include <linux/fs.h>
>>>> +#include <linux/interrupt.h>
>>>> +#include <linux/of_irq.h>
>>>> +#include <linux/uaccess.h>
>>>> +
>>>> +#include "coresight-ctcu.h"
>>>> +#include "coresight-priv.h"
>>>> +#include "coresight-tmc.h"
>>>> +
>>>> +static irqreturn_t byte_cntr_handler(int irq, void *data)
>>>> +{
>>>> +    struct ctcu_byte_cntr *byte_cntr_data = (struct ctcu_byte_cntr 
>>>> *)data;
>>>> +
>>>> +    atomic_inc(&byte_cntr_data->irq_cnt);
>>>> +    wake_up(&byte_cntr_data->wq);
>>>> +
>>>> +    return IRQ_HANDLED;
>>>> +}
>>>> +
>>>> +static void ctcu_reset_sysfs_buf(struct tmc_drvdata *drvdata)
>>>
>>> minor nit: This has nothing to do with the CTCU. For what it is worth,
>>> it must be called, tmc_etr_reset_sysf_buf(). But more on this below,
>>> and even do we need it, further below.
>>>
>>>> +{
>>>> +    u32 sts;
>>>> +
>>>> +    CS_UNLOCK(drvdata->base);
>>>> +    tmc_write_rrp(drvdata, drvdata->sysfs_buf->hwaddr);
>>>> +    tmc_write_rwp(drvdata, drvdata->sysfs_buf->hwaddr);
>>>> +    sts = readl_relaxed(drvdata->base + TMC_STS) & ~TMC_STS_FULL;
>>>> +    writel_relaxed(sts, drvdata->base + TMC_STS);
>>>> +    CS_LOCK(drvdata->base);
>>>
>>> Could we not keep this function in the tmc-etr.c and invoke from here ?
>>>
>>
>> Sure, will move the function tmc-etr.c
>>
>>>> +}
>>>> +
>>>> +static void ctcu_cfg_byte_cntr_reg(struct tmc_drvdata *drvdata, u32 
>>>> val, u32 offset)
>>>> +{
>>>> +    struct ctcu_drvdata *ctcu_drvdata;
>>>> +    struct coresight_device *helper;
>>>> +
>>>> +    helper = tmc_etr_get_ctcu_device(drvdata);
>>>> +    if (!helper)
>>>> +        return;
>>>> +
>>>> +    ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
>>>> +    /* A one value for IRQCTRL register represents 8 bytes */
>>>> +    ctcu_program_register(ctcu_drvdata, val / 8, offset);
>>>> +}
>>>> +
>>>> +static struct ctcu_byte_cntr *ctcu_get_byte_cntr_data(struct 
>>>> tmc_drvdata *drvdata)
>>>> +{
>>>> +    struct ctcu_byte_cntr *byte_cntr_data;
>>>> +    struct ctcu_drvdata *ctcu_drvdata;
>>>> +    struct coresight_device *helper;
>>>> +    int port;
>>>> +
>>>> +    helper = tmc_etr_get_ctcu_device(drvdata);
>>>> +    if (!helper)
>>>> +        return NULL;
>>>> +
>>>
>>>
>>>
>>>> +    port = coresight_get_in_port(drvdata->csdev, helper);
>>>> +    if (port < 0)
>>>> +        return NULL;
>>>> +
>>>
>>> Please validate that the port_num you get is valid for the CTCU ? 
>>> That applies to all uses of this construct.
>>>
>>
>> Will validate it before using.
>>
>>>> +    ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
>>>> +    byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
>>>> +    return byte_cntr_data;
>>>
>>>
>>>
>>> nit:
>>>      return  &ctcu_drvdata->byte_cntr_data[port]; ?
>>>
>>> Also, why not make this into a helper, as we seem to use this other 
>>> places too ?
>>>
>>
>> Didnt get the point here. We may run more than one ETR devices 
>> concurrently. So we should get the proper byte_cntr_data according to 
>> the port number at runtime.
>>
> 
> 
> static struct ctcu_byte_cntr *ctcu_byte_cntr(struct coresight_device 
> *cctcu_dev, struct coresight_device *tmc_etr, ) {
> 
>      port = coresight_get_in_port()..
>      // Verify the port in this helper and everyone uses this.
>      if (//!validate_port//)
>          return NULL
>      return ...
> }

Got the point now. I have missed the instance 2/instance 3 you have 
mentioned in previous message.

Thanks,
Jie

> 
> 
> Suzuki
> 
> 


