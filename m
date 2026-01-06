Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D9EC79FA9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 07:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYdW3BUX9r+B5i/qFPMyHS7fMQ9moDI8ZVhqNQ0SgLE=; b=dJatLhoAtoNKTs/G2s243NDTcM
	nju6lUG0UEATXeIdnrI/WZqn/Mr8uZIm+IAELb8Z0AY0O5LWRzVGUfOKYdR3GaUTXpY/vPiVG8qGQ
	ks/yV9qAKmsVQZB7IPcTnoavoYV4chy1+/u00TgvTJDU+hyTbPTqXFF18bYoKSkx/VXJCyHoyWCVq
	Ay2ntlA03Xyg7QjA6uJ53pcUi7sXE8DEvJttKjQdGeCEE5nJfcEhw2lyGHwtnEY0IKPz43R9X424n
	IRgbrGL6nNjQBOsqNMmtkd5vHQKP+3CfYOFsF3VSoC0zMYE00wPIf/h08cmFnz9w9xmHy6vDaW+o3
	2YDuBnXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1Or-0000000CVpO-2JTW;
	Tue, 06 Jan 2026 07:22:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1Op-0000000CVp3-0Mav
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 07:22:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QVGo3443172
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Jan 2026 07:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nYdW3BUX9r+B5i/qFPMyHS7fMQ9moDI8ZVhqNQ0SgLE=; b=h21zQnPG6XUjfuZd
	wiiBJlH7C444BJXszHf8wwBZdpf/u07fopTIjrv7uwJz5bSjN9H4WEQFlwhFQOMa
	yA1ZyTdqlUU2Vl6V+YedptWVFGq1aI3iSC2ObA0QJ7Hjp1HxjSZlPzJbmKbubN99
	AU+HqNUSVOdJ68sfHqM5mMI1sizwCH9370e8TUcMaCU35MZkjty1pN5iMS80YY39
	6RmDmOfuu5y009YVi9BoLbuKGJde2IXy9RCGNmi1Vmv36RjAmGNWStOdF557lqRW
	wGTqGE4QQT7ZGaSFxgYYpBDoO2WoDPRjY7cQvFtsjnG9WlRP66jzuQr9eTRTLccH
	HzcGJg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgmnh9gfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 07:22:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f177f4d02so18403575ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 23:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767684157; x=1768288957; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nYdW3BUX9r+B5i/qFPMyHS7fMQ9moDI8ZVhqNQ0SgLE=;
        b=GI8UZKL6wVSkx03qr7drqMRo2wbdIBwOAatpYErg88lwIbustgLykDIFBmO8pI6pgC
         ZkQt17m+EOGnSeLe0ZGbQRZ4RT6w3+ONOdfyvTj49bX1mUUPdyjhP2fQOCTgWcNSz7AC
         i69P4IRtP/hHpZzPwFrKn/KEE1CSOLOnHcF8mOyTFdKKj2aI8H0+daan56OeBh31Wg2T
         rYKndQBWrgIM3aILtJm3V+xKMCul2u4Hfm1XzzWy8uRMD0brNw5A/VL+kADP4k+ud4SX
         Ia/zkFcdM3gIHshuGfnjdu744EgDhm4BxkrqpBC2eIzu9hdi4X+lIj8qjFvkts7utVtR
         Xy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767684157; x=1768288957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYdW3BUX9r+B5i/qFPMyHS7fMQ9moDI8ZVhqNQ0SgLE=;
        b=XZCitpdXm8tu0JVcPOrlkupd1U8o0DHpDb0LqSf40cr+wyLhm8HhHCQFyPcQuoCJPU
         PSOHvFglFgrsIZKtzPQwGFKnw/4jbBv75JBP0BKwvtFA0Gov95xRPuCaQXDHCVMrjVN0
         dRL8+JJDAwmc3HYDD3BpcvdjGJvwpX+lJcCYVYfAZbncRI6Itc7ALVfNHwW7w2FHUS0Y
         bfqWQK+sqnGXWb7ZDLJNzx/ysosVdi1oYbxXPKnd/AsQiVOdtqYvfSFj0TCM9Hoy3Bev
         Pjj/oJIpo/3cPPHTTsW76yJt5xlj4zLMeeqgbKWFjo4SFHiaLk6eU0MS25xaVVwrwpMq
         o8fg==
X-Forwarded-Encrypted: i=1; AJvYcCU5eKkwoRbiLHmOZJclZCC/ouPNxndzNQ5CFUeuS+ZDpUSDyTUhBPJv6co0bciiJYiEcj1sLLcmYHTs9BEhUfe8@lists.infradead.org
X-Gm-Message-State: AOJu0YzCSBLkEVmxGIrErUghCyFpJdUHbeRPWlp4uZWYSOyiwaqeqPaB
	bZ9mZqtsw4S0i2/cP1YX/W89iD5c6OSIS8lo+DRa1suCM2GBuqrxhjI949bjpacpCr9segKqH2S
	945qhOC4+rDyC4Fu6yohGT9zcmlRiJeZKdE0hK9DbNb7/YUm/lHxupbpV0HyglPtghBZX8wXSJH
	uhSw==
X-Gm-Gg: AY/fxX4mNJlnID+R3pRjCyU/1+iTcqZgYuWKXSv8NOUV/iKPNmSzFSmL3CDitJzrOLw
	Z230VPtwodIVFBX/bhQqRSnI7Yv/lLbJALb7xBdqlel6vFRTAZyj9qobmAT/iMHc3QodEOCaWQH
	WOC001kmhphenwtu5WIvuF6g5+K7IfzmYwiEuNGHjpJM4sNzBATndM0ZOai5qrTB2zQGH59b4eW
	UDQnh+6uZV55EYeH/Qf0RXgYDk8sFts57wuNEmWNxx/bNlJYk+wYNLzbPRwvl5nnXTrnGpZeY5v
	648W7l7Bj9iqPr8SF9oS2m6/tPJJf1PGISJ+Oj8IfKOGj37qgXEP7WQFpa0p8v5pvhVqm9SHrDU
	Tw+xqJVGdTH93wS3MyGw2KrUqEOBoPfBs8RNfrPQTZJmjOQxRQLHlmfthNeSPqO+PbAuOM9JP2b
	psMYFafw==
X-Received: by 2002:a17:902:ef52:b0:297:df4e:fdd5 with SMTP id d9443c01a7336-2a3e2cbbd99mr25369435ad.23.1767684156841;
        Mon, 05 Jan 2026 23:22:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4fCgkBJ5GwaDnr/7t7gVcZN56BH0JhczYJMXPSvB/LnWS4Ez/W7dUAS7GgJqcWhHEpxGMYQ==
X-Received: by 2002:a17:902:ef52:b0:297:df4e:fdd5 with SMTP id d9443c01a7336-2a3e2cbbd99mr25369205ad.23.1767684156306;
        Mon, 05 Jan 2026 23:22:36 -0800 (PST)
Received: from [10.133.33.154] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5adf1cfsm1159738b3a.57.2026.01.05.23.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 23:22:35 -0800 (PST)
Message-ID: <ea0183ba-8515-44ad-ab04-fdee22be01c7@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 15:22:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/7] qcom-tgu: Add reset node to initialize
To: Jie Gan <jie.gan@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
 <20251219065902.2296896-8-songwei.chai@oss.qualcomm.com>
 <aa3ee735-8ef1-4f44-9528-e93ebec2a215@oss.qualcomm.com>
Content-Language: en-US
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
In-Reply-To: <aa3ee735-8ef1-4f44-9528-e93ebec2a215@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jVuSBmlb-2cxp9quyHzAWQ-2bCIGdk65
X-Proofpoint-ORIG-GUID: jVuSBmlb-2cxp9quyHzAWQ-2bCIGdk65
X-Authority-Analysis: v=2.4 cv=Vscuwu2n c=1 sm=1 tr=0 ts=695cb83e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=E2cSrPEqdgoo7pV8VbMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA2MCBTYWx0ZWRfX9lU2rqRqP04h
 1PYdiucOHK2VyEaSZ0kSDAX7ipOMzyDKYQqmAY4c8kLG/WzTaQ7iXYwvyE8j/DLP81uyIxboQn1
 /V9vcj0uPmq5ipedEzuPZJ/nKrvFx5guESw/ru1GweZGP9OKJnM24YDP/96euLhm98FyEsDhRam
 d7U6SOVKe6UsVWtOUGhRwuJVIZb3ZMq5APRC12NcsbzykD+XVSQaDvtpR4uih58EuAb8QRWUilX
 luSCNAnqVBIctHxMIT7uWPCHXAGaC1pj+MhRwA1flkWv94JkL2U7zJ7XIDcKtemFt2m7Kx3xPjb
 cocA6dWkb45RUa54OxJgii85IhPA4+0CWsQeX0TjgbGFObDiviQNkNsDBGqIwH1gpmVC6h4ijLI
 v5yKHZOsvkrvkOiKi2S5JpzFV6GlDhpcJVDiCBarlhyks53G8PyJrQfhll8+HA/MGVaeB5P2C2U
 Y/bOjT/8mxkoGhB1EzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_232239_249707_2EDE9BE3 
X-CRM114-Status: GOOD (  21.49  )
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



On 12/25/2025 1:56 PM, Jie Gan wrote:
> 
> 
> On 12/19/2025 2:59 PM, Songwei Chai wrote:
>> Add reset node to initialize the value of
>> priority/condition_decode/condition_select/timer/counter nodes.
>>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
>>   drivers/hwtracing/qcom/tgu.c                  | 74 +++++++++++++++++++
>>   2 files changed, 81 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/ 
>> Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> index 010eade0a1c5..0733b3e07b45 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> @@ -42,3 +42,10 @@ KernelVersion    6.19
>>   Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai 
>> <songwei.chai@oss.qualcomm.com>
>>   Description:
>>           (RW) Set/Get the counter value with specific step for TGU.
>> +
>> +What:        /sys/bus/amba/devices/<tgu-name>/reset_tgu
>> +Date:        December 2025
>> +KernelVersion    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai 
>> <songwei.chai@oss.qualcomm.com>
>> +Description:
>> +        (Write) Write 1 to reset the dataset for TGU.
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> index d4210869556e..5a8c6af9b719 100644
>> --- a/drivers/hwtracing/qcom/tgu.c
>> +++ b/drivers/hwtracing/qcom/tgu.c
>> @@ -425,8 +425,82 @@ static ssize_t enable_tgu_store(struct device *dev,
>>   }
>>   static DEVICE_ATTR_RW(enable_tgu);
>> +/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
>> +static ssize_t reset_tgu_store(struct device *dev,
>> +                   struct device_attribute *attr, const char *buf,
>> +                   size_t size)
>> +{
>> +    unsigned long value;
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +    int i, j, ret;
>> +
>> +    if (kstrtoul(buf, 0, &value) || value == 0)
>> +        return -EINVAL;
>> +
>> +    if (!drvdata->enable) {
>> +        ret = pm_runtime_get_sync(drvdata->dev);
>> +        if (ret < 0) {
>> +            pm_runtime_put(drvdata->dev);
>> +            return ret;
>> +        }
>> +    }
>> +
>> +    guard(spinlock)(&drvdata->lock);
>> +    TGU_UNLOCK(drvdata->base);
>> +
>> +    writel(0, drvdata->base + TGU_CONTROL);
> 
> Better move TGU_LOCK(drvdata->base) here
Yeah.>
> Thanks,
> Jie
> 
>> +
>> +    if (drvdata->value_table->priority)
>> +        memset(drvdata->value_table->priority, 0,
>> +                MAX_PRIORITY * drvdata->max_step *
>> +                drvdata->max_reg * sizeof(unsigned int));
>> +
>> +    if (drvdata->value_table->condition_decode)
>> +        memset(drvdata->value_table->condition_decode, 0,
>> +                drvdata->max_condition_decode * drvdata->max_step *
>> +                sizeof(unsigned int));
>> +
>> +        /* Initialize all condition registers to NOT(value=0x1000000) */
>> +    for (i = 0; i < drvdata->max_step; i++) {
>> +        for (j = 0; j < drvdata->max_condition_decode; j++) {
>> +            drvdata->value_table
>> +            ->condition_decode[calculate_array_location(
>> +            drvdata, i, TGU_CONDITION_DECODE, j)] =
>> +            0x1000000;
>> +        }
>> +    }
>> +
>> +    if (drvdata->value_table->condition_select)
>> +        memset(drvdata->value_table->condition_select, 0,
>> +                drvdata->max_condition_select * drvdata->max_step *
>> +                sizeof(unsigned int));
>> +
>> +    if (drvdata->value_table->timer)
>> +        memset(drvdata->value_table->timer, 0,
>> +                (drvdata->max_step) *
>> +                (drvdata->max_timer) *
>> +                sizeof(unsigned int));
>> +
>> +    if (drvdata->value_table->counter)
>> +        memset(drvdata->value_table->counter, 0,
>> +                (drvdata->max_step) *
>> +                (drvdata->max_counter) *
>> +                sizeof(unsigned int));
>> +
>> +    dev_dbg(dev, "Coresight-TGU reset complete\n");
>> +
>> +    TGU_LOCK(drvdata->base);
>> +
>> +    drvdata->enable = false;
>> +    pm_runtime_put(drvdata->dev);
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_WO(reset_tgu);
>> +
>>   static struct attribute *tgu_common_attrs[] = {
>>       &dev_attr_enable_tgu.attr,
>> +    &dev_attr_reset_tgu.attr,
>>       NULL,
>>   };
> 


