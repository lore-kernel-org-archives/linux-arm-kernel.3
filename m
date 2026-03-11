Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592E9FD064E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 08:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eMfOY7NzlzKtupFbA7DicH2UWX1JZ0T9VjBL0owqntE=; b=hPt5SRv0m6+W34aQwqUV+rPMTy
	UhcK+9rhNOI/bK4dN2WYFhy1VkAkGPuKGNglRCmleGb7x+dVu5rySzBalKSiujZ2pzdC8Y9jTe2fF
	szvegAbgFAs4I4moy8oSaKijyAkoWRGLxv1Hlu8U8CoNxxUKyZ44LgfW/B6auR2ftPpkpqjDt/cQL
	H35Ew8uGkQudTfxnI8nKdVy2k3Ihqkow5Hm4gBRYVpRtBGqOb1p6XjRd5ZmfB6daTiYvL8guVGqGy
	u6kc/V1EYetrEa/3Le+yBBt34EmmQWn12rJXIkRU1Dx2pm9iCQTSwu89gIqzGWm35yrKFQL62W76L
	N1hCo2xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EWS-0000000B6zu-45Sx;
	Wed, 11 Mar 2026 08:02:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EWQ-0000000B6zT-3XEg
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Mar 2026 08:02:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eMfOY7NzlzKtupFbA7DicH2UWX1JZ0T9VjBL0owqntE=; b=CwdhFPjN6U7UKP4SY9YNlm1W3V
	+SqP/WUQRiLTHdRyGRjZwy9E/QWZnRo/mEMDiRucSBHpTr/D0WXjJxVa79XROVTPcJjaF8Y+GX/f6
	of7CUG4MdX4zJiSAh+IOjENkuyMN04u7KKXajSYCcyL+3vfxzs7h9VueZWIdeRn5GnHLQt4I1pjlu
	+VAjecfk9iVAY8JbOKl2ytxDL+h1N26+ngI9o/kNcpFXVbvV2q5lOD/VTtHMkor4IOlqXk7UGTOko
	Vz1W3jdHVv5QaFFo8ZHMDLXUzhvtKHr29H9AkLYUCkGvWNfbvh41BstVw83j6cfX9OVbpLDQAHWGS
	/zCBFQAQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EWM-0000000GKOl-1gqz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 08:02:25 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B5Nw9j1863207
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 08:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eMfOY7NzlzKtupFbA7DicH2UWX1JZ0T9VjBL0owqntE=; b=KJj3wygDG9osWDty
	7BzpPqKR5udxTbnudsyQtQH2uCRi/68vlZzp/agAPHhEt+boKnsi6h4rZC0cqvBH
	b0W2HJFVHNxvj4XGOHlWVLSdADBynTHB0sa+tf7Rj/60fDWR9NaG66iqKQzx+OJs
	zprfruz4QgUmxc+oTBJlzOThDhql45No3kg+z5Yq5mUY4hnNRuwVGxj/LYNEp44s
	l8nOtoZ/hdbBRK0EUf0ZnqGDLhWv7oDiGCXBty5fsnuUihOdGMfjwItKqKw4+7Fb
	J2HBQ+pkLWTG8mZH4/xcD8JruUHvCYy8az/lniPvlc8Lf+T3nL3M74owGyOhxLLI
	sgRX5w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctmw83e0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 08:02:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae53ec06b0so515758355ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 01:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773216135; x=1773820935; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eMfOY7NzlzKtupFbA7DicH2UWX1JZ0T9VjBL0owqntE=;
        b=J7WCzi5uNpXbdtC88V5CwHbAHPf+O98Fcdf/f+M2q1NyMKn989nBBun1rSCgcgUJ4E
         yb9tRW7YfMclRPcTvNUWYWEs5ocLSrX652zmoNew4/wJbQja8S7e3n6dt/CRXQs6tfeR
         9HGUHucvLkbtaevzKpBnLD8xYswWV3B5BWEF/sv5nCz/U8t7NC3GfgXmPDhPJc0HRh59
         tu0qV1Wxuj0VN5HsevcncYJX3Jibm485Yjqgt3RMPFtl20ITgCnHKZmQIgAO2n7MhcR+
         vHJv/YnY843VUfMGSFLTbauJbqrqbagrEQbY/1ndnCz0caxNmQ3lcYntKVVzuoAZvoo2
         f7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773216135; x=1773820935;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eMfOY7NzlzKtupFbA7DicH2UWX1JZ0T9VjBL0owqntE=;
        b=nO5y6NK0/H/q/9VKDLnL4xYgw9ZScCu0qkMikoiiQh5TReLasTmT6beZZEeJwUm86n
         FmoDQJCCNriaU4wMU9+guN4hSrAZ0w5QsnAt0TD7Acsf16Ae7Rn/JeUQWBDwobXKcEcn
         6P1el2RJKNi4WnN6t/Dn0RYm5YejWsE6ee2AQNFQRRay7IZWNPCB8uri+EgDsg72sZPQ
         9q6kulqsKfU6q/AO6Coa7Ks12gYqVa3XqYalhXuAlaYwJD0ahei7UtCZtPXffV9bVZ4a
         cpd5PudH+DHv+vVWqSdnduGUZTYMS4qwEDPAdyMoN7ANVB5BTELs51yeLS+vdIAR2G+6
         Rlkg==
X-Forwarded-Encrypted: i=1; AJvYcCV0lASeKSYNPJMMpJusOUehYV+MEKE5MkSTBMNFNRWhitOnCR5AYW1kid0xtFrKDWf7F9ZjZmHZ1rHDXAkKDncn@lists.infradead.org
X-Gm-Message-State: AOJu0YyKm+9XXSd32YvQaJq4QjzbLXY9Bwo6Y4uNyuEdrhJ0g7gVFyMA
	hETiBPHbbj3ktDn4WpvjYX8ZeIK3Rk0DFFRooxasxvhhMLJYIrZIapDx8kZLlCOAI5YqL1cqd1t
	7oCMkTVfvrqj/Mf/ebLUZ6EBnZmGfEz6CQsemGI7A1wwhUNaAvRHrSBdLqRpvKmvo5P1OC/dM4E
	LQ5w==
X-Gm-Gg: ATEYQzy7MSzsEULrKdS3W4m6fLagYJ2cm/BFNfZjJqULaCexgBce3hmkzkk49xZbNQ4
	cmk/ZP7RmV0iVm9GLUklvYtoKJEGH7xGfKWVsaM94b5mRiLRov5S3KNtfi9RK+zwmOy1t8a6/mL
	mvoByIz5eUqRYSLUKnNSGgxFl2xuGz6qxW/3ObHC5w6JsT49ehkZpXUCTmqA0F+VASZXQ6XZkpT
	ByOF5KAD9Ep89vCbca9ws1rmln31fnYAaZBZoSYLamCCtxZ+xMHA6IPnVaCcyJJ0TrSsd0KZwni
	G4duD7kvHvoTMBBjECE4TF0evRzT9Pelb5jZINUW9jttMSF3lOzKi25lx57qLw2y6SX2J7qD++S
	RGuAnqYdcS71c5sFihApT2Bg/UmYEVFRVMPekhRCOcCfsQ69UBP0TQDIRIjRI4Z4wkXKokAyQjp
	X5/aRARhgTXvI=
X-Received: by 2002:a17:902:f602:b0:2ae:4cd9:7196 with SMTP id d9443c01a7336-2aeae85b2eemr18372755ad.29.1773216134513;
        Wed, 11 Mar 2026 01:02:14 -0700 (PDT)
X-Received: by 2002:a17:902:f602:b0:2ae:4cd9:7196 with SMTP id d9443c01a7336-2aeae85b2eemr18372195ad.29.1773216133725;
        Wed, 11 Mar 2026 01:02:13 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae361326sm14228665ad.70.2026.03.11.01.02.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 01:02:13 -0700 (PDT)
Message-ID: <63ebce79-d9f3-43f5-8186-5240bc112fa0@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 16:02:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 6/7] coresight: ctcu: enable byte-cntr for TMC ETR
 devices
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
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
Content-Language: en-US
In-Reply-To: <bc05d278-fe28-4503-ac99-fb28904e7343@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RtJZAFZau5kOK4wf5JVi1AIZfIEz2opw
X-Proofpoint-GUID: RtJZAFZau5kOK4wf5JVi1AIZfIEz2opw
X-Authority-Analysis: v=2.4 cv=PJECOPqC c=1 sm=1 tr=0 ts=69b12187 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0bfajxqiIO4Y75MwKN8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA2NiBTYWx0ZWRfX3kDNgVZSmXI4
 /QOjc6l0SRgrqmVPy9E5bCdKPRKQ4T45CthVYrssjwy68opbZEb2jEpmLIBXWI+iBrm/PM9st2/
 YVkljyHKfIzepWwZqbHNKzxnNFu13wc3cr8F+zfzIxn7vHbaGW/IXJCl1S7gnpkcDqiUAkSglqp
 3cI0nJ+vipPXX6j6Q3wh/qVhP4+IZa8rFmm5bc1j1CUQILdb1PMcqjgoyzSU58lRmIL0oUmKOo8
 ZjYmBwMvcjBSsH8VgubPouoyZ4D/YIxeKFWPQrtu1v3aglnoD7CPQf/7oQHuewy3+m4FgnXLU+Y
 WYv/S/pziVan+NLttDS+KIcFidsulLYra7GJdeX79D0RsJayzmQrYK4dhWQRZyB9F4JjPe4i6vS
 9elJ6b9NEb9Ae1afTRbp13XBgwLN/GZs26fm4B4bXxvaUyK5glcjPkXY5r7Y/b1OHCdM1imNrsm
 29uHLZbad9s8vjcIn9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_080222_904228_78CFDAC6 
X-CRM114-Status: GOOD (  36.42  )
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



On 3/10/2026 11:01 AM, Jie Gan wrote:
> 
> 
> On 3/9/2026 8:43 PM, Suzuki K Poulose wrote:
>> On 09/03/2026 09:47, Jie Gan wrote:
>>> The byte-cntr function provided by the CTCU device is used to 
>>> transfer data
>>> from the ETR buffer to the userspace. An interrupt is triggered if 
>>> the data
>>> size exceeds the threshold set in the BYTECNTRVAL register. The 
>>> interrupt
>>> handler counts the number of triggered interruptions and the read 
>>> function
>>> will read the data from the synced ETR buffer.
>>>
>>> Switching the sysfs_buf when current buffer is full or the timeout is
>>> triggered and resets rrp and rwp registers after switched the buffer.
>>> The synced buffer will become available for reading after the switch.
>>>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>>   .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   8 +
>>>   drivers/hwtracing/coresight/Makefile               |   2 +-
>>>   .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 351 ++++++++++ 
>>> + ++++++++++
>>>   drivers/hwtracing/coresight/coresight-ctcu-core.c  | 103 +++++-
>>>   drivers/hwtracing/coresight/coresight-ctcu.h       |  76 ++++-
>>>   drivers/hwtracing/coresight/coresight-tmc-core.c   |   8 +-
>>>   drivers/hwtracing/coresight/coresight-tmc-etr.c    |  18 ++
>>>   drivers/hwtracing/coresight/coresight-tmc.h        |   4 +
>>>   8 files changed, 555 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>>> ctcu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
>>> new file mode 100644
>>> index 000000000000..6ff1708fb944
>>> --- /dev/null
>>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
>>> @@ -0,0 +1,8 @@
>>> +What:           /sys/bus/coresight/devices/<ctcu-name>/ 
>>> irq_threshold[0:1]
>>> +Date:           March 2026
>>> +KernelVersion:  7.1
>>> +Contact:        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>; 
>>> Jinlong Mao <jinlong.mao@oss.qualcomm.com>; Jie Gan 
>>> <jie.gan@oss.qualcomm.com>
>>> +Description:
>>> +        (RW) Configure the byte-cntr IRQ register for the specified 
>>> ETR device
>>> +        based on its port number. An interrupt is generated when the 
>>> data size
>>> +        exceeds the value set in the IRQ register.
>>> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/ 
>>> hwtracing/ coresight/Makefile
>>> index ab16d06783a5..821a1b06b20c 100644
>>> --- a/drivers/hwtracing/coresight/Makefile
>>> +++ b/drivers/hwtracing/coresight/Makefile

[...]

>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>>> +    if (byte_cntr_data->reading) {
>>> +        ret = -EBUSY;
>>> +        goto out_unlock;
>>> +    }
>>> +
>>> +    byte_cntr_data->reading = true;
>>> +    raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>>
>> All of this can be avoided by retaining the etr_sysf_ops in TMC-> and
>> calling into the CTCU after basic checks.
> 
> Understood. we can rely on the tmc->reading check, jump to CTCU ops 
> after proper check.

Hi Suzuki,

I think we need a new flag to control the byte-cntr read work. Here is 
the reason:

For normal tmc ETR read flow:
tmc_read_prepare -> tmc_read -> tmc_read_unprepare -> tmc_etr_disable_hw

We dont allow disable the ETR device while reading (drvdata->reading).

For byte-cntr continously read flow:

byte-cntr-start -> tmc_read_prepare -> tmc_read (continously read data 
until ETR is disabled or is stopped by userspace) -> tmc_etr_disable_hw 
->tmc_read_unprepare.

With drvdata->reading = true. We cant disable the ETR device. so the 
issue happened.

We can jump to the 
tmc_read_prepare_byte_cntr/tmc_read_unprepare_byte_cntr from 
tmc_read_prepare_etr/tmc_read_unprepare_etr, but we must skip to 
set/reset drvdata->reading.

Thanks,
Jie

> 
>>
>>> +    /* Setup an available etr_buf_list for byte-cntr */
>>> +    ret = tmc_create_etr_buf_list(drvdata, 2);
>>> +    if (ret)
>>> +        goto out;
>>> +
>>> +    raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>>> +    atomic_set(&byte_cntr_data->irq_cnt, 0);
>>> +    /* Configure the byte-cntr register to enable IRQ */
>>> +    ctcu_cfg_byte_cntr_reg(drvdata, byte_cntr_data->thresh_val,
>>> +                   byte_cntr_data->irq_ctrl_offset);
>>
>> Is there no way of going back to the ctcu_drvdata from byte_cntr_data ?
>> For a starter, we could easily store the ctcu_drvdata in byte_cntr_data
>> and always write straight to the device, rather than always going to the
>> ETR drvdata in ctcu_cfg_byte_cntr_reg() ?
> 
> Understood, will fix it.
> 
>>
>>> +    enable_irq_wake(byte_cntr_data->irq);
>>> +    byte_cntr_data->total_size = 0;
>>> +
>>> +out_unlock:
>>> +    raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>>> +
>>> +out:
>>> +    return ret;
>>> +}
>>> +
>>> +static int ctcu_read_unprepare_byte_cntr(struct tmc_drvdata *drvdata)
>>
>> Same as above. name
> 
> ditto.
> 
>>
>>> +{
>>> +    struct device *dev = &drvdata->csdev->dev;
>>> +    struct ctcu_byte_cntr *byte_cntr_data;
>>> +    unsigned long flags;
>>> +
>>> +    byte_cntr_data = ctcu_get_byte_cntr_data(drvdata);
>>> +    if (!byte_cntr_data)
>>> +        return -EINVAL;
>>> +
>>> +    raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>>> +    /* Configure the byte-cntr register to disable IRQ */
>>> +    ctcu_cfg_byte_cntr_reg(drvdata, 0, byte_cntr_data- 
>>> >irq_ctrl_offset);
>>
>>
>>> +    disable_irq_wake(byte_cntr_data->irq);
>>> +    byte_cntr_data->reading = false;
>>> +    byte_cntr_data->reading_data = false;
>>> +    drvdata->buf_node = NULL;
>>
>>
>>> +    /* Restore the original sysfs_ops */
>>> +    drvdata->sysfs_ops = &etr_sysfs_ops;
>>
>> Please see if you can avoid it.
> 
> Sure, will check other solution.
> 
>>
>>> +    raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>>> +    dev_dbg(dev, "send data total size:%llu bytes\n", 
>>> byte_cntr_data- >total_size);
>>> +    tmc_clean_etr_buf_list(drvdata);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +const struct tmc_sysfs_ops byte_cntr_sysfs_ops = {
>>> +    .read_prepare    = ctcu_read_prepare_byte_cntr,
>>> +    .read_unprepare    = ctcu_read_unprepare_byte_cntr,
>>> +    .get_trace_data    = ctcu_byte_cntr_get_data,
>>> +};
>>> +
>>> +/* Start the byte-cntr function when the path is enabled. */
>>> +void ctcu_byte_cntr_start(struct coresight_device *csdev, struct 
>>> coresight_path *path)
>>> +{
>>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>> +    struct coresight_device *sink = coresight_get_sink(path);
>>> +    struct tmc_drvdata *tmc_drvdata = dev_get_drvdata(sink- 
>>> >dev.parent);
>>> +    struct ctcu_byte_cntr *byte_cntr_data;
>>> +    int port_num;
>>> +
>>> +    port_num = coresight_get_in_port(sink, csdev);
>>> +    if (port_num < 0)
>>> +        return;
>>> +
>>> +    byte_cntr_data = &drvdata->byte_cntr_data[port_num];
>>
>> instance 2
>>
>>> +    /* Don't start byte-cntr function when threshold is not set. */
>>> +    if (!byte_cntr_data->thresh_val || byte_cntr_data->enable)
>>> +        return;
>>> +
>>> +    guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
>>> +    byte_cntr_data->enable = true;
>>> +    byte_cntr_data->reading_data = false;
>>> +    /* Replace with byte-cntr's sysfs_ops */
>>> +    tmc_drvdata->sysfs_ops = &byte_cntr_sysfs_ops;
>>
>> Why are we hacking this ? This looks *very ugly* and we are doing this 
>> without any locks at the tmc-etr driver !!! ?? Could we not call out
>> from the etr_sysf_ops into the CTCU ops based some checks ?
>> Anyways, please don't change anything in the tmc_drvdata from this
>> driver, especially not the "operations".
>>
> 
> Understood. Will take care of it in next version.
> 
>> Also the locking seems inconsistent. Here we use byte_cntr_data->lock.
>> But in ctcu_read_unprepare_byte_cntr(), we use the TMC-ETR 
>> spinlock :facepalm:
> 
> Sorry for the hack solution here. Will fix it.
> 
> Thanks,
> Jie
> 
>>
>>
>>
>>> +}
>>> +
>>> +/* Stop the byte-cntr function when the path is disabled. */
>>> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct 
>>> coresight_path *path)
>>> +{
>>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>> +    struct coresight_device *sink = coresight_get_sink(path);
>>> +    struct ctcu_byte_cntr *byte_cntr_data;
>>> +    int port_num;
>>> +
>>> +    if (coresight_get_mode(sink) == CS_MODE_SYSFS)
>>> +        return;
>>> + +    port_num = coresight_get_in_port(sink, csdev);
>>> +    if (port_num < 0)
>>> +        return;
>>> +
>>> +    byte_cntr_data = &drvdata->byte_cntr_data[port_num];
>>
>> instance 3
>>
>>
>>
>>
>>> +    guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
>>> +    byte_cntr_data->enable = false;
>>> +}
>>> +
>>> +void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata 
>>> *drvdata, int etr_num)
>>> +{
>>> +    struct ctcu_byte_cntr *byte_cntr_data;
>>> +    struct device_node *nd = dev->of_node;
>>> +    int irq_num, ret, i;
>>> +
>>> +    for (i = 0; i < etr_num; i++) {
>>> +        byte_cntr_data = &drvdata->byte_cntr_data[i];
>>> +        irq_num = of_irq_get(nd, i);
>>> +        if (irq_num < 0) {
>>> +            dev_err(dev, "Failed to get IRQ from DT for port%d\n", i);
>>> +            continue;
>>> +        }
>>> +
>>> +        ret = devm_request_irq(dev, irq_num, byte_cntr_handler,
>>> +                       IRQF_TRIGGER_RISING | IRQF_SHARED,
>>> +                       dev_name(dev), byte_cntr_data);
>>> +        if (ret) {
>>> +            dev_err(dev, "Failed to register IRQ for port%d\n", i);
>>> +            continue;
>>> +        }
>>> +
>>> +        byte_cntr_data->irq = irq_num;
>>> +        init_waitqueue_head(&byte_cntr_data->wq);
>>> +        raw_spin_lock_init(&byte_cntr_data->spin_lock);
>>> +    }
>>> +}
>>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/ 
>>> drivers/hwtracing/coresight/coresight-ctcu-core.c
>>> index e8720026c9e3..60f1db3ab70d 100644
>>> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
>>> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
>>> @@ -15,6 +15,7 @@
>>>   #include <linux/platform_device.h>
>>>   #include <linux/pm_runtime.h>
>>>   #include <linux/slab.h>
>>> +#include <linux/sizes.h>
>>>   #include "coresight-ctcu.h"
>>>   #include "coresight-priv.h"
>>> @@ -43,17 +44,21 @@
>>>   #define CTCU_ATID_REG_BIT(traceid)    (traceid % 32)
>>>   #define CTCU_ATID_REG_SIZE        0x10
>>> +#define CTCU_ETR0_IRQCTRL               0x6c
>>> +#define CTCU_ETR1_IRQCTRL               0x70
>>>   #define CTCU_ETR0_ATID0            0xf8
>>>   #define CTCU_ETR1_ATID0            0x108
>>>   static const struct ctcu_etr_config sa8775p_etr_cfgs[] = {
>>>       {
>>> -        .atid_offset    = CTCU_ETR0_ATID0,
>>> -        .port_num    = 0,
>>> +        .atid_offset        = CTCU_ETR0_ATID0,
>>> +        .irq_ctrl_offset    = CTCU_ETR0_IRQCTRL,
>>> +        .port_num        = 0,
>>>       },
>>>       {
>>> -        .atid_offset    = CTCU_ETR1_ATID0,
>>> -        .port_num    = 1,
>>> +        .atid_offset        = CTCU_ETR1_ATID0,
>>> +        .irq_ctrl_offset    = CTCU_ETR1_IRQCTRL,
>>> +        .port_num        = 1,
>>>       },
>>>   };
>>> @@ -62,6 +67,88 @@ static const struct ctcu_config sa8775p_cfgs = {
>>>       .num_etr_config    = ARRAY_SIZE(sa8775p_etr_cfgs),
>>>   };
>>> +void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, 
>>> u32 offset)
>>> +{
>>> +    CS_UNLOCK(drvdata->base);
>>> +    ctcu_writel(drvdata, val, offset);
>>> +    CS_LOCK(drvdata->base);
>>> +}
>>> +
>>> +static ssize_t irq_threshold_show(struct device *dev,
>>> +                  struct device_attribute *attr,
>>> +                  char *buf)
>>> +{
>>> +    struct ctcu_byte_cntr_irq_attribute *irq_attr =
>>> +        container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
>>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>> +    u8 port = irq_attr->port;
>>> +
>>> +    if (!drvdata->byte_cntr_data[port].irq_ctrl_offset)
>>> +        return -EINVAL;
>>> +
>>> +    return sysfs_emit(buf, "%u\n",
>>> +            (unsigned int)drvdata->byte_cntr_data[port].thresh_val);
>>> +}
>>> +
>>> +static ssize_t irq_threshold_store(struct device *dev,
>>> +                   struct device_attribute *attr,
>>> +                   const char *buf,
>>> +                   size_t size)
>>> +{
>>> +    struct ctcu_byte_cntr_irq_attribute *irq_attr =
>>> +        container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
>>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>> +    u8 port = irq_attr->port;
>>> +    unsigned long val;
>>> +
>>> +    if (kstrtoul(buf, 0, &val))
>>> +        return -EINVAL;
>>> +
>>> +    /* Threshold 0 disables the interruption. */
>>> +    guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
>>> +    /* A small threshold will result in a large number of 
>>> interruptions */
>>> +    if (val && val < SZ_4K)
>>> +        return -EINVAL;
>>> +
>>> +    if (drvdata->byte_cntr_data[port].irq_ctrl_offset)
>>> +        drvdata->byte_cntr_data[port].thresh_val = val;
>>> +
>>> +    return size;
>>> +}
>>> +
>>> +static umode_t irq_threshold_is_visible(struct kobject *kobj,
>>> +                    struct attribute *attr, int n)
>>> +{
>>> +    struct device_attribute *dev_attr =
>>> +        container_of(attr, struct device_attribute, attr);
>>> +    struct ctcu_byte_cntr_irq_attribute *irq_attr =
>>> +        container_of(dev_attr, struct ctcu_byte_cntr_irq_attribute, 
>>> attr);
>>> +    struct device *dev = kobj_to_dev(kobj);
>>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>> +    u8 port = irq_attr->port;
>>> +
>>> +    if (drvdata && drvdata->byte_cntr_data[port].irq_ctrl_offset)
>>> +        return attr->mode;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static struct attribute *ctcu_attrs[] = {
>>> +    ctcu_byte_cntr_irq_rw(0),
>>> +    ctcu_byte_cntr_irq_rw(1),
>>> +    NULL,
>>> +};
>>> +
>>> +static struct attribute_group ctcu_attr_grp = {
>>> +    .attrs = ctcu_attrs,
>>> +    .is_visible = irq_threshold_is_visible,
>>> +};
>>> +
>>> +static const struct attribute_group *ctcu_attr_grps[] = {
>>> +    &ctcu_attr_grp,
>>> +    NULL,
>>> +};
>>> +
>>>   static void ctcu_program_atid_register(struct ctcu_drvdata 
>>> *drvdata, u32 reg_offset,
>>>                          u8 bit, bool enable)
>>>   {
>>> @@ -140,11 +227,15 @@ static int ctcu_set_etr_traceid(struct 
>>> coresight_device *csdev, struct coresight
>>>   static int ctcu_enable(struct coresight_device *csdev, enum cs_mode 
>>> mode,
>>>                  struct coresight_path *path)
>>>   {
>>> +    ctcu_byte_cntr_start(csdev, path);
>>> +
>>>       return ctcu_set_etr_traceid(csdev, path, true);
>>>   }
>>>   static int ctcu_disable(struct coresight_device *csdev, struct 
>>> coresight_path *path)
>>>   {
>>> +    ctcu_byte_cntr_stop(csdev, path);
>>> +
>>>       return ctcu_set_etr_traceid(csdev, path, false);
>>>   }
>>> @@ -195,7 +286,10 @@ static int ctcu_probe(struct platform_device *pdev)
>>>               for (i = 0; i < cfgs->num_etr_config; i++) {
>>>                   etr_cfg = &cfgs->etr_cfgs[i];
>>>                   drvdata->atid_offset[i] = etr_cfg->atid_offset;
>>> +                drvdata->byte_cntr_data[i].irq_ctrl_offset =
>>> +                    etr_cfg->irq_ctrl_offset;
>>>               }
>>> +            ctcu_byte_cntr_init(dev, drvdata, cfgs->num_etr_config);
>>>           }
>>>       }
>>> @@ -209,6 +303,7 @@ static int ctcu_probe(struct platform_device *pdev)
>>>       desc.dev = dev;
>>>       desc.ops = &ctcu_ops;
>>>       desc.access = CSDEV_ACCESS_IOMEM(base);
>>> +    desc.groups = ctcu_attr_grps;
>>>       raw_spin_lock_init(&drvdata->spin_lock);
>>>       drvdata->csdev = coresight_register(&desc);
>>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu.h b/drivers/ 
>>> hwtracing/coresight/coresight-ctcu.h
>>> index e9594c38dd91..c52cf6a33d2e 100644
>>> --- a/drivers/hwtracing/coresight/coresight-ctcu.h
>>> +++ b/drivers/hwtracing/coresight/coresight-ctcu.h
>>> @@ -5,19 +5,26 @@
>>>   #ifndef _CORESIGHT_CTCU_H
>>>   #define _CORESIGHT_CTCU_H
>>> +
>>> +#include <linux/time.h>
>>>   #include "coresight-trace-id.h"
>>>   /* Maximum number of supported ETR devices for a single CTCU. */
>>>   #define ETR_MAX_NUM    2
>>> +#define BYTE_CNTR_TIMEOUT    (3 * HZ)
>>> +
>>>   /**
>>>    * struct ctcu_etr_config
>>>    * @atid_offset:    offset to the ATID0 Register.
>>> - * @port_num:        in-port number of CTCU device that connected to 
>>> ETR.
>>> + * @port_num:        in-port number of the CTCU device that 
>>> connected to ETR.
>>> + * @irq_ctrl_offset:    offset to the BYTECNTRVAL register.
>>> + * @irq_name:           IRQ name in dt node.
>>>    */
>>>   struct ctcu_etr_config {
>>>       const u32 atid_offset;
>>>       const u32 port_num;
>>> +    const u32 irq_ctrl_offset;
>>>   };
>>>   struct ctcu_config {
>>> @@ -25,15 +32,68 @@ struct ctcu_config {
>>>       int num_etr_config;
>>>   };
>>> -struct ctcu_drvdata {
>>> -    void __iomem        *base;
>>> -    struct clk        *apb_clk;
>>> -    struct device        *dev;
>>> -    struct coresight_device    *csdev;
>>> +/**
>>> + * struct ctcu_byte_cntr
>>> + * @enable:        indicates that byte_cntr function is enabled or not.
>>> + * @reading:        indicates that byte-cntr reading is started.
>>> + * @reading_data:    indicates that byte-cntr is reading data from 
>>> the buffer.
>>> + * @thresh_val:        threshold to trigger a interruption.
>>> + * @total_size:        total size of the transferred data.
>>> + * @irq:        allocated number of the IRQ.
>>> + * @irq_cnt:        IRQ count number for triggered interruptions.
>>> + * @wq:            waitqueue for reading data from ETR buffer.
>>> + * @spin_lock:        spinlock of byte_cntr_data.
>>> + * @irq_ctrl_offset:    offset to the BYTECNTVAL Register.
>>> + */
>>> +struct ctcu_byte_cntr {
>>> +    bool            enable;
>>> +    bool                    reading;
>>> +    bool            reading_data;
>>> +    u32            thresh_val;
>>> +    u64            total_size;
>>> +    int            irq;
>>> +    atomic_t        irq_cnt;
>>> +    wait_queue_head_t    wq;
>>>       raw_spinlock_t        spin_lock;
>>> -    u32            atid_offset[ETR_MAX_NUM];
>>> +    u32            irq_ctrl_offset;
>>> +};
>>> +
>>> +struct ctcu_drvdata {
>>> +    void __iomem            *base;
>>> +    struct clk            *apb_clk;
>>> +    struct device            *dev;
>>> +    struct coresight_device        *csdev;
>>> +    struct ctcu_byte_cntr        byte_cntr_data[ETR_MAX_NUM];
>>> +    raw_spinlock_t            spin_lock;
>>> +    u32                atid_offset[ETR_MAX_NUM];
>>>       /* refcnt for each traceid of each sink */
>>> -    u8            traceid_refcnt[ETR_MAX_NUM] 
>>> [CORESIGHT_TRACE_ID_RES_TOP];
>>> +    u8                traceid_refcnt[ETR_MAX_NUM] 
>>> [CORESIGHT_TRACE_ID_RES_TOP];
>>>   };
>>> +/**
>>> + * struct ctcu_irq_thresh_attribute
>>> + * @attr:    The device attribute.
>>> + * @idx:    port number.
>>> + */
>>> +struct ctcu_byte_cntr_irq_attribute {
>>> +    struct device_attribute    attr;
>>> +    u8            port;
>>> +};
>>> +
>>> +#define ctcu_byte_cntr_irq_rw(port)                    \
>>> +    (&((struct ctcu_byte_cntr_irq_attribute[]) {            \
>>> +       {                                \
>>> +        __ATTR(irq_threshold##port, 0644, irq_threshold_show,    \
>>> +        irq_threshold_store),                    \
>>> +        port,                            \
>>> +       }                                \
>>> +    })[0].attr.attr)
>>> +
>>> +void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, 
>>> u32 offset);
>>> +
>>> +/* Byte-cntr functions */
>>> +void ctcu_byte_cntr_start(struct coresight_device *csdev, struct 
>>> coresight_path *path);
>>> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct 
>>> coresight_path *path);
>>> +void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata 
>>> *drvdata, int port_num);
>>> +
>>>   #endif
>>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/ 
>>> drivers/hwtracing/coresight/coresight-tmc-core.c
>>> index 110eedde077f..948ea864f2a1 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
>>> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
>>> @@ -293,7 +293,10 @@ static ssize_t tmc_read(struct file *file, char 
>>> __user *data, size_t len,
>>>           return -EFAULT;
>>>       }
>>> -    *ppos += actual;
>>> +    if (drvdata->buf_node)
>>> +        drvdata->buf_node->pos += actual;
>>> +    else
>>> +        *ppos += actual;
>>>       dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
>>>       return actual;
>>> @@ -748,11 +751,12 @@ static const struct tmc_sysfs_ops etb_sysfs_ops 
>>> = {
>>>       .get_trace_data    = tmc_etb_get_sysfs_trace,
>>>   };
>>> -static const struct tmc_sysfs_ops etr_sysfs_ops = {
>>> +const struct tmc_sysfs_ops etr_sysfs_ops = {
>>>       .read_prepare    = tmc_read_prepare_etr,
>>>       .read_unprepare    = tmc_read_unprepare_etr,
>>>       .get_trace_data    = tmc_etr_get_sysfs_trace,
>>>   };
>>> +EXPORT_SYMBOL_GPL(etr_sysfs_ops);
>>>   static int __tmc_probe(struct device *dev, struct resource *res)
>>>   {
>>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/ 
>>> drivers/hwtracing/coresight/coresight-tmc-etr.c
>>> index f4223215ef8d..8896fb7a9ed3 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>>> @@ -1185,6 +1185,10 @@ ssize_t tmc_etr_get_sysfs_trace(struct 
>>> tmc_drvdata *drvdata,
>>>       ssize_t actual = len;
>>>       struct etr_buf *etr_buf = drvdata->sysfs_buf;
>>> +    /* Reading the buffer from the buf_node if it exists*/
>>> +    if (drvdata->buf_node)
>>> +        etr_buf = drvdata->buf_node->sysfs_buf;
>>> +
>>>       if (pos + actual > etr_buf->len)
>>>           actual = etr_buf->len - pos;
>>>       if (actual <= 0)
>>> @@ -1248,6 +1252,20 @@ static void __tmc_etr_disable_hw(struct 
>>> tmc_drvdata *drvdata)
>>>   }
>>> +/**
>>> + * tmc_etr_enable_disable_hw - enable/disable the ETR hw.
>>> + * @drvdata:    drvdata of the TMC device.
>>> + * @enable:    indicates enable/disable.
>>> + */
>>> +void tmc_etr_enable_disable_hw(struct tmc_drvdata *drvdata, bool 
>>> enable)
>>> +{
>>> +    if (enable)
>>> +        __tmc_etr_enable_hw(drvdata);
>>> +    else
>>> +        __tmc_etr_disable_hw(drvdata);
>>> +}
>>> +EXPORT_SYMBOL_GPL(tmc_etr_enable_disable_hw);
>>> +
>>>   void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>>>   {
>>>       __tmc_etr_disable_hw(drvdata);
>>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/ 
>>> hwtracing/coresight/coresight-tmc.h
>>> index aaa443abe8e9..183c649b982c 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>>> @@ -260,6 +260,7 @@ struct etr_buf_node {
>>>    *         Used by ETR/ETF.
>>>    * @etr_buf_list: List that is used to manage allocated etr_buf.
>>>    * @sysfs_ops:    Read operations for the sysfs mode.
>>> + * @buf_node:    Available buffer_node for byte-cntr reading.
>>>    */
>>>   struct tmc_drvdata {
>>>       struct clk        *atclk;
>>> @@ -292,6 +293,7 @@ struct tmc_drvdata {
>>>       struct tmc_resrv_buf    crash_mdata;
>>>       struct list_head        etr_buf_list;
>>>       const struct tmc_sysfs_ops    *sysfs_ops;
>>> +    struct etr_buf_node    *buf_node;
>>>   };
>>>   /**
>>> @@ -371,6 +373,7 @@ void tmc_etr_disable_hw(struct tmc_drvdata 
>>> *drvdata);
>>>   extern const struct coresight_ops tmc_etr_cs_ops;
>>>   ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
>>>                   loff_t pos, size_t len, char **bufpp);
>>> +extern const struct tmc_sysfs_ops etr_sysfs_ops;
>>>   #define TMC_REG_PAIR(name, lo_off, hi_off)                \
>>> @@ -480,5 +483,6 @@ struct etr_buf *tmc_etr_get_buffer(struct 
>>> coresight_device *csdev,
>>>   extern const struct attribute_group coresight_etr_group;
>>>   void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
>>>   int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int 
>>> num_nodes);
>>> +void tmc_etr_enable_disable_hw(struct tmc_drvdata *drvdata, bool 
>>> enable);
>>>   #endif
>>>
>>
> 
> 


