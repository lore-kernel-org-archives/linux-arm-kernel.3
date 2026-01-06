Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10290C79FA9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 07:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lrulz8LwVtMt0zjJZhAKMPpamefq1Mc97j2palpa/a8=; b=QBBCilv5hi/QoKp95aN7gchVSJ
	ag1z4uun49q8OhKu+ilgR2bYgyeju7As75xBbSJcz6TfKVNsJdl6gBPywDUVySccmd93+rlTEQktv
	ks3H3EMOuNnsQDNVly4axKfFMfkIdyJyBeMx6Z7p/GjoDAUBlSVafjxA5WARAw//mBx4xsk7f64LB
	yfp3q5gPLrYgTHmaWQ+IMIE3K4nz0bYroAXiR5d6AagYWNnERha/PqUVhlLuzCOOc5REdGpviNVf3
	3qZfSltMyyaxvBdzpUvfr8zV6vKOPKyaehVsXsl8wx8TdaYdXmPyHTaNGIXbrMhR4Jf50AyDLwmmU
	8oHbMBFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1Mg-0000000CVfV-22Qu;
	Tue, 06 Jan 2026 07:20:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1Me-0000000CVfA-20G0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 07:20:25 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063Q6N12429813
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Jan 2026 07:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lrulz8LwVtMt0zjJZhAKMPpamefq1Mc97j2palpa/a8=; b=T4jhs3gy2qF+1hpV
	yzbGul141ov2Lfxpayd6pKcg8Tw26FvaN6BOJn5won02XpvUDd4Vzv6zh2YUgq2j
	NTJcCjMmLDJAg7y76jQM8wy6Xk8HKm8KGbTxPsNfFo5uGVK/DF5wZdMruJBH2x5O
	qVcLgeyzIVq/MiM31J2cUyOQBOVCxECK1p7bQvS4MKrrc0mVyYrYAjZk59aMBBz7
	eR8UpzCn35PC7XAb4p+xEGZX57G2YhVB0bkBj9h0gGUl7S9R2Zo0L699Et8mhdzf
	E7Fbvwc/6uFr+xOeVtGCAJGc2vN3ODjme8IT5CIG1Zc46rVij4teJUiG/EdAP23/
	8+LC4A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgr738xr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 07:20:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f2b45ecffso10904445ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 23:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767684023; x=1768288823; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lrulz8LwVtMt0zjJZhAKMPpamefq1Mc97j2palpa/a8=;
        b=QRQL5NQbOBDOl6vIakrd0SkJXJblFQKSqdvNGdk5bm7C5oCybW6oo3rxdkTjGmoBpQ
         mGAmLM8CscVjw5HMnxyYXhkp08QU/oCdIc6O6/gxTHz2Y1Bc6mcCsu1kIYB7zDMuX2g8
         IDnCh/a7sXZNOBxogwB8Iqm4GtHm7CfjWyj6id3AC1XxzjsCyYKP0adRa54MEd+i/LGf
         uWcCJvAhLZU81pK2jDG4rFRiMWvNINUExGuNMOxa6BWVrMvkrcAF/J9FUCgg8lbzWjx3
         x2AiZSn7BIwDRoO7wEyBfzYVZHwFQ0LWHG9OkCUTqFpw1Me7UtiZ60lVw7YaYSPEC5Ti
         gjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767684023; x=1768288823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lrulz8LwVtMt0zjJZhAKMPpamefq1Mc97j2palpa/a8=;
        b=KreaIDQhXr5Yn4+HbNa0crWhJ4K5vJgUxhNlC43weI5DlvNbb+CxISrgdwFq/WDpjo
         rvl8bbGO5rHVjAnCjdXmrcYN1ScYxmZmUI06Aeri8JV4KT0ev0P7fZf21ifcZFTIMovg
         BUUiXfV/JF4b/0OPzu6OVq7BpfCtMAFdzKbmS34B+JH8k/Hm3QU+ScrDo8V4Ag0CZ837
         zHl03gdKCKOFXfrwbqsGWzPFAeLrgaS4I+3J01jqUV8geqh0FUHOtV/vd8S9IwvfLCt/
         c0cJXIezwsGYIFZjTDSndwaQkwRDGgJDpP6ybHwqahrcV7tseDBftlsoAJtcbjAYXul2
         k4ng==
X-Forwarded-Encrypted: i=1; AJvYcCWyGWJwPrlWvxftW737uTsFTBEeW+Q7vQV+kQejN9+t7we9pi1wS6A37dEWtai8BKT/02e6K4RA2Zpn3+oGZ7xh@lists.infradead.org
X-Gm-Message-State: AOJu0YxLqBsiEWbRuLaZZG8o26v/ncxdfKfmkZk2Ce0ZlpcXVKjjtvYI
	0v8E72ZOa+pDlwfmftwK1WVg+drkqRq5g03Nnzvm02cNdrpwFGj149NZSQh1J7bodytsNZsUI9T
	CLBawlW3/Vfrs7P940su9enuqYkDahVv1RK1ZkW+u89oZdC2lobXKs4saNDygqsZhGDCDoJackM
	wAClYyXkbNmQ==
X-Gm-Gg: AY/fxX4zRNtd3olZwNnA55jlDQD5sLQqFkrpnYPFM0jPuVNA7Z+fCnagRVeTB5U0gRd
	jEddKK0OvrbHzNWKMZk5Rl6TINU4eX3IyCzy308P/bDdZsNMpBQ17ut5x4qob7Dlpi8y1lFieZQ
	ChpykeSSdGYVOhJd+WyvFNX43bORulDvfBxS33pZlTUx2UEdOeuZzs2sQqTzpMxIj1rwZYYEAb5
	BKeY5rd0dJ7r0a4dHLIAl/d5RMk3pZvRy6HgvHSnqGGaIjDZwdCpMAMyNFcDmNyUZBdMMtycR9t
	vZBSpDShAoNOcxrzx0B2wtJRTCqyZDdwUvmzoKSGqrKFvkCXkDquwlYaLKSPggi6Adz1/km7zJr
	FB/tVqTbDYCR5PG8SmzAJfxXp79YN2qqueAiOHQ2lDmLUDESqcZZQT0Zv89FrACBM8Twxwa56eh
	ZqEtTngA==
X-Received: by 2002:a17:903:1c8:b0:2a0:d636:71e7 with SMTP id d9443c01a7336-2a3e2d5a303mr25527475ad.13.1767684022997;
        Mon, 05 Jan 2026 23:20:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/Ybnth0jFvRpmE9bjxCR9lB2cdPlawE3synhZ/jk6yqj3h+sD5LMECMtLLXddiQapzERarw==
X-Received: by 2002:a17:903:1c8:b0:2a0:d636:71e7 with SMTP id d9443c01a7336-2a3e2d5a303mr25527265ad.13.1767684022453;
        Mon, 05 Jan 2026 23:20:22 -0800 (PST)
Received: from [10.133.33.154] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2e01sm12217905ad.46.2026.01.05.23.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 23:20:22 -0800 (PST)
Message-ID: <581df129-98a4-45bd-a705-7a0e34fcd885@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 15:20:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/7] qcom-tgu: Add signal priority support
To: Jie Gan <jie.gan@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
 <20251219065902.2296896-4-songwei.chai@oss.qualcomm.com>
 <4ea62244-6bf5-46bc-b026-79806fa372af@oss.qualcomm.com>
Content-Language: en-US
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
In-Reply-To: <4ea62244-6bf5-46bc-b026-79806fa372af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QrxTHFyd c=1 sm=1 tr=0 ts=695cb7b7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MiW3vxe8j8cGS_ehoDIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: JTF40OtU_PY8Ebxngidm6bgXkF6w592n
X-Proofpoint-GUID: JTF40OtU_PY8Ebxngidm6bgXkF6w592n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA2MCBTYWx0ZWRfXxXmsBZ2BxLFY
 tbPkUR+yEW9vF0VQog9X36ZKLwNv93beuKrGdN4RT5ORj5GuB00ehrMKaYUftwmLqPdDnF0hM6Y
 8y8b0MWF3j7WywvKRv+u0lXaa4J18pgBTsltADKq4dh3EGLn89otp8LC+rjNkmmZl2TB//CC051
 VjPM+74wSxXLWQRekZWwlz25B+3negAr7QVUz3IAw4jyddhBceTY0zYQjQRtdGoS5RbSE+TdMV8
 SJXaLOMTnR1jPAvxtNB9ZETwjf3SBLJDaClZcJifxyeI0XK/+C+ZtyKCbf3NWetHW85TFq6Gobc
 8UgSsUzyPFROAKRt/Ga5vYa/cQQcSwXvUPUGAtX9DC4Q1WNkjO7YaUfN42sdJO+63f3m4sl5YUK
 Fq8TFneG5LeDqHZiXY+qKX9Uo2LMw/q1IKSSHoRXYoetNk45GXAUyeG97w/4NpWc/oidyu3y6mW
 ntyLqMpiSyZkDxamxzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_232024_749083_58E3D1D5 
X-CRM114-Status: GOOD (  24.72  )
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



On 12/25/2025 11:20 AM, Jie Gan wrote:
> 
> 
> On 12/19/2025 2:58 PM, Songwei Chai wrote:
>> Like circuit of a Logic analyzer, in TGU, the requirement could be
>> configured in each step and the trigger will be created once the
>> requirements are met. Add priority functionality here to sort the
>> signals into different priorities. The signal which is wanted could
>> be configured in each step's priority node, the larger number means
>> the higher priority and the signal with higher priority will be sensed
>> more preferentially.
>>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
>>   drivers/hwtracing/qcom/tgu.c                  | 156 ++++++++++++++++++
>>   drivers/hwtracing/qcom/tgu.h                  | 113 +++++++++++++
>>   3 files changed, 276 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/ 
>> Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> index 24dcdf1d70cc..d04a01368089 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> @@ -7,3 +7,10 @@ Description:
>>           Accepts only one of the 2 values -  0 or 1.
>>           0 : disable TGU.
>>           1 : enable TGU.
>> +
>> +What:        /sys/bus/amba/devices/<tgu-name>/ 
>> step[0:7]_priority[0:3]/reg[0:17]
>> +Date:        December 2025
>> +KernelVersion    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai 
>> <songwei.chai@oss.qualcomm.com>
>> +Description:
>> +        (RW) Set/Get the sensed signal with specific step and 
>> priority for TGU.
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> index dbd1acbd2fa5..447d7e68d132 100644
>> --- a/drivers/hwtracing/qcom/tgu.c
>> +++ b/drivers/hwtracing/qcom/tgu.c
>> @@ -14,14 +14,121 @@
>>   #include "tgu.h"
>> +static int calculate_array_location(struct tgu_drvdata *drvdata,
>> +                   int step_index, int operation_index,
>> +                   int reg_index)
>> +{
>> +    return operation_index * (drvdata->max_step) * (drvdata->max_reg) +
>> +        step_index * (drvdata->max_reg) + reg_index;
>> +}
>> +
>> +static ssize_t tgu_dataset_show(struct device *dev,
>> +                struct device_attribute *attr, char *buf)
>> +{
>> +    int index;
> 
> Prefer reverse Christmas tree order
Will update.>
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +    struct tgu_attribute *tgu_attr =
>> +            container_of(attr, struct tgu_attribute, attr);
>> +
>> +    index = calculate_array_location(drvdata, tgu_attr->step_index,
>> +                     tgu_attr->operation_index,
>> +                     tgu_attr->reg_num);
>> +
>> +    return sysfs_emit(buf, "0x%x\n",
>> +              drvdata->value_table->priority[index]);
>> +}
>> +
>> +static ssize_t tgu_dataset_store(struct device *dev,
>> +                 struct device_attribute *attr,
>> +                 const char *buf, size_t size)
>> +{
>> +    int index;
>> +    unsigned long val;
> 
> Prefer reverse Christmas tree order
Ditto.>
>> +
>> +    struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev);
>> +    struct tgu_attribute *tgu_attr =
>> +        container_of(attr, struct tgu_attribute, attr);
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&tgu_drvdata->lock);
>> +    index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
>> +                     tgu_attr->operation_index,
>> +                     tgu_attr->reg_num);
>> +
>> +    tgu_drvdata->value_table->priority[index] = val;
>> +    return size;
>> +}
>> +
>> +static umode_t tgu_node_visible(struct kobject *kobject,
>> +                struct attribute *attr,
>> +                int n)
>> +{
>> +    struct device *dev = kobj_to_dev(kobject);
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +    int ret = SYSFS_GROUP_INVISIBLE;
>> +
>> +    struct device_attribute *dev_attr =
>> +        container_of(attr, struct device_attribute, attr);
>> +    struct tgu_attribute *tgu_attr =
>> +        container_of(dev_attr, struct tgu_attribute, attr);
>> +
>> +    if (tgu_attr->step_index < drvdata->max_step) {
>> +        ret = (tgu_attr->reg_num < drvdata->max_reg) ?
>> +            attr->mode : 0;
>> +    }
>> +    return ret;
> 
> if ((tgu_attr->step_index < drvdata->max_step) &&
>      (tgu_attr->reg_num < drvdata->max_reg)
>      return attr->mode;
> 
> return 0;
These two approaches are similar, but the original one might better 
align with the directory organization logic in sysfs. At the same time, 
centralizing the return operations in one place could be better.>
>> +}
>> +
>>   static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>>   {
>> +    int i, j, k, index;
>> +
>>       TGU_UNLOCK(drvdata->base);
>> +    for (i = 0; i < drvdata->max_step; i++) {
>> +        for (j = 0; j < MAX_PRIORITY; j++) {
>> +            for (k = 0; k < drvdata->max_reg; k++) {
>> +                index = calculate_array_location(
>> +                            drvdata, i, j, k);
>> +
>> +                writel(drvdata->value_table->priority[index],
>> +                    drvdata->base +
>> +                    PRIORITY_REG_STEP(i, j, k));
>> +            }
>> +        }
>> +    }
>>       /* Enable TGU to program the triggers */
>>       writel(1, drvdata->base + TGU_CONTROL);
>>       TGU_LOCK(drvdata->base);
>>   }
>> +static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
>> +{
>> +    int num_sense_input;
>> +    int num_reg;
>> +    u32 devid;
>> +
>> +    devid = readl(drvdata->base + TGU_DEVID);
>> +
>> +    num_sense_input = TGU_DEVID_SENSE_INPUT(devid);
>> +    if (((num_sense_input * NUMBER_BITS_EACH_SIGNAL) % 
>> LENGTH_REGISTER) == 0)
>> +        num_reg = (num_sense_input * NUMBER_BITS_EACH_SIGNAL) / 
>> LENGTH_REGISTER;
>> +    else
>> +        num_reg = ((num_sense_input * NUMBER_BITS_EACH_SIGNAL) / 
>> LENGTH_REGISTER) + 1;
>> +    drvdata->max_reg = num_reg;
>> +
>> +}
>> +
>> +static void tgu_set_steps(struct tgu_drvdata *drvdata)
>> +{
>> +    u32 devid;
>> +
>> +    devid = readl(drvdata->base + TGU_DEVID);
>> +
>> +    drvdata->max_step = TGU_DEVID_STEPS(devid);
>> +}
>> +
>>   static int tgu_enable(struct device *dev)
>>   {
>>       struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> @@ -106,6 +213,38 @@ static const struct attribute_group 
>> tgu_common_grp = {
>>   static const struct attribute_group *tgu_attr_groups[] = {
>>       &tgu_common_grp,
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(0, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(0, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(0, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(1, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(1, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(1, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(1, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(2, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(2, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(2, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(2, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(3, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(3, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(3, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(3, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(4, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(4, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(4, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(4, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(5, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(5, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(5, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(5, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(6, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(6, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(6, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(6, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(7, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
>>       NULL,
>>   };
>> @@ -128,12 +267,29 @@ static int tgu_probe(struct amba_device *adev, 
>> const struct amba_id *id)
>>       spin_lock_init(&drvdata->lock);
>> +    tgu_set_reg_number(drvdata);
>> +    tgu_set_steps(drvdata);
>> +
>>       ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>>       if (ret) {
>>           dev_err(dev, "failed to create sysfs groups: %d\n", ret);
>>           return ret;
>>       }
>> +    drvdata->value_table =
>> +        devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
>> +    if (!drvdata->value_table)
>> +        return -ENOMEM;
>> +
>> +    drvdata->value_table->priority = devm_kzalloc(
>> +        dev,
>> +        MAX_PRIORITY * drvdata->max_reg * drvdata->max_step *
>> +            sizeof(*(drvdata->value_table->priority)),
>> +        GFP_KERNEL);
> 
> can we declare a pri_size for better reading?
> 
> size_t pri_size;
> unsigned int *priority
> 
> pri_size = MAX_PRIORITY * drvdata->max_reg * drvdata->max_step *
>          sizeof(*(drvdata->value_table->priority));
> 
> priority = devm_kzalloc(dev, pri_size, GFP_KERNEL)
> if (!priority)
>      return -ENOMEM;
> 
> drvdata->value_table->priority = priority;
Will try.>
>> +
>> +    if (!drvdata->value_table->priority)
>> +        return -ENOMEM;
>> +
>>       drvdata->enable = false;
>>       pm_runtime_put(&adev->dev);
>> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
>> index abc732f91dfc..2cf95c239ee7 100644
>> --- a/drivers/hwtracing/qcom/tgu.h
>> +++ b/drivers/hwtracing/qcom/tgu.h
>> @@ -10,6 +10,113 @@
>>   #define TGU_CONTROL 0x0000
>>   #define TGU_LAR        0xfb0
>>   #define TGU_UNLOCK_OFFSET    0xc5acce55
>> +#define TGU_DEVID    0xfc8
>> +
>> +#define BMVAL(val, lsb, msb)    ((val & GENMASK(msb, lsb)) >> lsb)
>> +#define TGU_DEVID_SENSE_INPUT(devid_val) ((int) BMVAL(devid_val, 10, 
>> 17))
>> +#define TGU_DEVID_STEPS(devid_val) ((int)BMVAL(devid_val, 3, 6))
>> +#define NUMBER_BITS_EACH_SIGNAL 4
>> +#define LENGTH_REGISTER 32
>> +
>> +/*
>> + *  TGU configuration space                              Step 
>> configuration
>> + *  offset table                                         space layout
>> + * x-------------------------x$                          
>> x-------------x$
>> + * |                         |$                          | 
>>              |$
>> + * |                         |                           |   
>> reserve   |$
>> + * |                         |                           | 
>>              |$
>> + * |coresight management     |                           
>> |-------------|base+n*0x1D8+0x1F4$
>> + * |     registe             |                     |---> | 
>> prioroty[3]  |$
>> + * |                         |                     |     
>> |-------------|base+n*0x1D8+0x194$
>> + * |                         |                     |     | 
>> prioroty[2]  |$
>> + * |-------------------------|                     |     
>> |-------------|base+n*0x1D8+0x134$
>> + * |                         |                     |     | 
>> prioroty[1]  |$
>> + * |         step[7]         |                     |     
>> |-------------|base+n*0x1D8+0xD4$
>> + * |-------------------------|->base+0x40+7*0x1D8  |     | 
>> prioroty[0]  |$
>> + * |                         |                     |     
>> |-------------|base+n*0x1D8+0x74$
>> + * |         ...             |                     |     |  
>> condition  |$
>> + * |                         |                     |     |   
>> select    |$
>> + * |-------------------------|->base+0x40+1*0x1D8  |     
>> |-------------|base+n*0x1D8+0x60$
>> + * |                         |                     |     |  
>> condition  |$
>> + * |         step[0]         |-------------------->      |   
>> decode    |$
>> + * |-------------------------|-> base+0x40               
>> |-------------|base+n*0x1D8+0x50$
>> + * |                         |                           | 
>>              |$
>> + * | Control and status space|                           |Timer/ 
>> Counter|$
>> + * |        space            |                           | 
>>              |$
>> + * x-------------------------x->base                     
>> x-------------x base+n*0x1D8+0x40$
>> + *
>> + */
>> +#define STEP_OFFSET 0x1D8
>> +#define PRIORITY_START_OFFSET 0x0074
>> +#define PRIORITY_OFFSET 0x60
>> +#define REG_OFFSET 0x4
>> +
>> +/* Calculate compare step addresses */
>> +#define PRIORITY_REG_STEP(step, priority, reg)\
>> +    (PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
>> +     REG_OFFSET * reg + STEP_OFFSET * step)
>> +
>> +#define tgu_dataset_rw(name, step_index, type, 
>> reg_num)                  \
>> +    (&((struct tgu_attribute[]){ {                                   \
>> +        __ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
>> +        step_index,                                              \
>> +        type,                                                    \
>> +        reg_num,                                                 \
>> +    } })[0].attr.attr)
>> +
>> +#define STEP_PRIORITY(step_index, reg_num, 
>> priority)                     \
>> +    tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
>> +            reg_num)
>> +
>> +#define STEP_PRIORITY_LIST(step_index, priority)  \
>> +    {STEP_PRIORITY(step_index, 0, priority),  \
>> +     STEP_PRIORITY(step_index, 1, priority),  \
>> +     STEP_PRIORITY(step_index, 2, priority),  \
>> +     STEP_PRIORITY(step_index, 3, priority),  \
>> +     STEP_PRIORITY(step_index, 4, priority),  \
>> +     STEP_PRIORITY(step_index, 5, priority),  \
>> +     STEP_PRIORITY(step_index, 6, priority),  \
>> +     STEP_PRIORITY(step_index, 7, priority),  \
>> +     STEP_PRIORITY(step_index, 8, priority),  \
>> +     STEP_PRIORITY(step_index, 9, priority),  \
>> +     STEP_PRIORITY(step_index, 10, priority), \
>> +     STEP_PRIORITY(step_index, 11, priority), \
>> +     STEP_PRIORITY(step_index, 12, priority), \
>> +     STEP_PRIORITY(step_index, 13, priority), \
>> +     STEP_PRIORITY(step_index, 14, priority), \
>> +     STEP_PRIORITY(step_index, 15, priority), \
>> +     STEP_PRIORITY(step_index, 16, priority), \
>> +     STEP_PRIORITY(step_index, 17, priority), \
>> +     NULL                   \
>> +    }
>> +
>> +#define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
>> +    (&(const struct attribute_group){\
>> +        .attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, 
>> priority),\
>> +        .is_visible = tgu_node_visible,\
>> +        .name = "step" #step "_priority" #priority \
>> +    })
>> +
>> +enum operation_index {
>> +    TGU_PRIORITY0,
>> +    TGU_PRIORITY1,
>> +    TGU_PRIORITY2,
>> +    TGU_PRIORITY3,
>> +};
>> +
>> +/* Maximum priority that TGU supports */
>> +#define MAX_PRIORITY 4
>> +
>> +struct tgu_attribute {
>> +    struct device_attribute attr;
>> +    u32 step_index;
>> +    enum operation_index operation_index;
>> +    u32 reg_num;
>> +};
>> +
>> +struct value_table {
>> +    unsigned int *priority;
> 
> priority here is an array? can we declare it as unsigned int array to 
> limit the allocated memory?
> 
> With the declared array, we can avoid one more memory allocation.
> 
> priority[index] that is used in code looks like a trick.
Yes, it should be an array, The reason it's defined as a pointer is that 
its size is determined at runtime.>
>> +};
> 
> only has one member, better integrate with tgu_drvdata with proper nameing.
  Maybe this approach provides better scalability and enhances 
structural clarity?

> 
> Thanks,
> Jie
> 
>>   static inline void TGU_LOCK(void __iomem *addr)
>>   {
>> @@ -35,6 +142,9 @@ static inline void TGU_UNLOCK(void __iomem *addr)
>>    * @dev: Pointer to the associated device structure
>>    * @lock: Spinlock for handling concurrent access
>>    * @enable: Flag indicating whether the TGU device is enabled
>> + * @value_table: Store given value based on relevant parameters.
>> + * @max_reg: Maximum number of registers
>> + * @max_step: Maximum step size
>>    *
>>    * This structure defines the data associated with a TGU device,
>>    * including its base address, device pointers, clock, spinlock for
>> @@ -46,6 +156,9 @@ struct tgu_drvdata {
>>       struct device *dev;
>>       spinlock_t lock;
>>       bool enable;
>> +    struct value_table *value_table;
>> +    int max_reg;
>> +    int max_step;
>>   };
>>   #endif
> 


