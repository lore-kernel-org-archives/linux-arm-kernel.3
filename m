Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E52C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 06:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBDFrsbeu14tmNEHgR9Qu4YwB5hCVrBW3fi5kmCG9fw=; b=vO/YxQcEFQxhwh7BG6HYwUFmR+
	3TtPdTV4lNPwEAee+BKm5ZZxFwuIOy3QAnJVFh+LTR42lZ/25GJGbS2ZvKBkwPbCdwNMDwOqeX+kE
	QT86bYz68HDSF6Uzgx5Q0YE6uzIQh4xLlJTc34EcIaREvaqw8XYIHh3BUY4LOepecZvxaq9170wir
	Xuwujt3DNsVLYCs004dwWs8uoFnjF69qvk39a/nCzOHNE4rqAWkixrYnFwh1KcKqx64gDKSkqqm+b
	KR3JLbvOXMqcuZPJSau8scEHjgsNPy3QhqxAKrJHUq9Ql1dd8a/2dR3jaPBKGj+FedW0jFMaQ/cZW
	30a7z4EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQ9A-0000000AxEK-0BUl;
	Wed, 22 Jul 2026 06:09:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQ97-0000000AxDz-1rBF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 06:09:34 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53voO3663214
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 06:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBDFrsbeu14tmNEHgR9Qu4YwB5hCVrBW3fi5kmCG9fw=; b=JmaPVjunahDpMya6
	LY7k4i/ADHQaAOeX20f5edq1wXbeVNSjbsXTHxdy2t4ogX21gZydeXuAF7c0jNul
	0FnI+7bHpwQh5wl6XGzzQ0kl4KEZMO3kqVxNgXVtbvsGJjZ99SEgEt1fg2M8sWHa
	xwPx/lMn3nOWhnqoYRBxwXkWBjMsi77AdfPd3pke57/8xqkR5m/2WViAexsCIwk1
	kJnIHIlWj9ftlL9rah+YN+o487fS6dNPEMr9UaYr2lrJ9XMrPQGsNBSceNvNKroz
	pIYDA9LqKcNSh4lGRKue2HDjMP/G5ktNozuOJ4doEBnTfRcgkDcwZrcF5FfZ7/Dp
	LK1wkQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e2f96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 06:09:32 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84842381150so21323237b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 23:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784700572; x=1785305372; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBDFrsbeu14tmNEHgR9Qu4YwB5hCVrBW3fi5kmCG9fw=;
        b=UjanUUUQjzUQZQcaf9XPbxNxsJFbuZWx3eHlPvZ9y7YBhcoZkDzlfaNRlNSYTc9Zy1
         iD4g4pA3Gq62atGHuxAmsnu/8ERW8euUR4V6VCstLMhCIOq0FWcJhWuMHJwDjumQLEum
         7toWzbLLoaSPinyvp2DlLZzZRvGX/FR3ipxb4FHvXSaV2xNUfZStPEa4dUjc6m4+0pHU
         iamJFd0rzJl9I3scOr2iKEj5d/DAtzyrci7ccjRyZJvL5VHtkFRujGCpSQp6P+k6cclF
         2T0pC6INeP4t8l/Lp3Onnl+AboQTGozqWubG4IRTANe+4eos/Vx0o6LPquAerdwtqJlx
         ZO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784700572; x=1785305372;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBDFrsbeu14tmNEHgR9Qu4YwB5hCVrBW3fi5kmCG9fw=;
        b=K+7qD2ICkX/SOB5lSzITDehZQGazAHUWla5Iu+ampSnB/Jk2e45CDZfVZuQzpLv3hV
         qgsN0oe65Yzrs3yd1Km5apZ6id0LDwWo7xGcV7q5SVN8hcS9CpL6tenYlZSGFZeRHNPh
         VUogwjt/BL+tmnPDJRGS6QdzV5ya+tlQtG5NJje0NLjoJKVse/brU1Pbit7ZK0/SgRAZ
         zr+jkCeeTZkW7c6tginngDpQGyMquAvVVQNvpAeLLUY83QuhBKidXUbbionLjyybZPQ9
         ukjvpDZaXJ/OynufSgWniNTMlKwquW+Q2HmEWQel6jdCXUs9u6OLmfg0agox7mZNGt9i
         sb2A==
X-Forwarded-Encrypted: i=1; AHgh+RpYB7hbmxVqgGga9CEI2NCS+72NkXVRDslHHdjiTY5Q4zTB5zqaozbse4eJfGb7aFZqv9TppQd3qnx6MGxCpTyK@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1LmabpRDFX8nmDB3X9Exqn53FAKnc1kFIWgO/TgFQRa2iWh9S
	+bkfd75rydRKa8tWhHfwJxV7IA2MsYcWACUainqmwiMwIjADq+vPIEIay/Wq3OAdKVLN2jjSB1s
	kT5pkSnX2edcWXPolYPbem+7+C+cYdFY/FyryHQhnOQjKuo0ABO6nkRcSgglLESG87P5ULKbfee
	xEtw==
X-Gm-Gg: AR+sD11q/nHqOvHitrdK8QgUEaIiGgWiRtIJcYvA+7MBc9q8wrBjWrRGM4T9ESGr4SM
	zqnEgO8VKBm465EluwLNDzjTjCQ5t+S5ZSV+oxrvh2JuNA9k9TA1jK8Kz6fPQPVpblScb1hhy2k
	p7oLDhngiQK2PyqaKWQo0w5g2xVc1U0qC+sIyMIz3Dtxf20DKswQFxBXgtLpYkpZG5hPEI1xsHK
	0K6/X6NN/7StCKykPTXyictQ3OoF8CKg4gn0eA5x9UD3tj14qpdQczA/PScmRyfXJUNfilGcDCZ
	Bkm8L+vuzex5WO3CV6YFvk3Bsm57+akZDF8gEXvhjO+vixdbzLI1KpvwKCH27iEb3r+NJwbpp4s
	IGQyZHFDQzZIHczD08HT4b0dX0Lsu78DmbQ==
X-Received: by 2002:a05:6a00:2302:b0:848:2f6e:e52b with SMTP id d2e1a72fcca58-84c2951315emr21779756b3a.63.1784700571940;
        Tue, 21 Jul 2026 23:09:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:2302:b0:848:2f6e:e52b with SMTP id d2e1a72fcca58-84c2951315emr21779726b3a.63.1784700571442;
        Tue, 21 Jul 2026 23:09:31 -0700 (PDT)
Received: from [10.218.44.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0ee1e6sm565937a12.12.2026.07.21.23.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 23:09:30 -0700 (PDT)
Message-ID: <25280ee4-b847-4206-93f9-9ed7b23f2275@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 11:39:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 01/13] power: reset: reboot-mode: Remove devres based
 allocations
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-1-e7453c548c21@oss.qualcomm.com>
 <ac030bd2-6b14-4b55-b277-422514da5f32@quicinc.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <ac030bd2-6b14-4b55-b277-422514da5f32@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IZSaMlJMEEA9dRANdEXC4VPwiy4hQQJI
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a605e9c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=LC1Hwnd0PhZBVGXlRGcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: IZSaMlJMEEA9dRANdEXC4VPwiy4hQQJI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1NCBTYWx0ZWRfXx1d702qEZgkj
 m6zZ2ixIHzg1RXKABGP/oNr3X7G88LKioYPQ1MZhNdvzDrV5a3NKG54cirbsP8I5eE0vC7PkrD7
 iKq/4fJDtNBzR5eJs4Tlj+hY4B9n6+0x1QK7bHvjn2jXfm/rYkAoylu8uCJYOPnJfjpzDKd/IaF
 jgxHOZjkJ2ilSCxsrTMyoGxcJCC8YKJ4IjIGWc0R8J2mpdnzw8ov2ZuXNF4rJvO1kIVXyq9GpTy
 sIahU2cxS6SQQvSdC+yilY4kvRgoQ3Xeu6Ot+0QMvZ8FwfbwFemDGk0l9cfKOThA3ZXsa0gTHx7
 BbolFp6HqyY3fxDz6WcOiGNU2iQSGbX/RzUe/Ozezo5nvKJvpqR89IBdGM+ySbbhIR9W5b4cLky
 nlUdbn5GspCB3IRNk+z6ZjVMfe4khZgbWEcXO0sK5MGrhWFLgFj1C6A+a9x+TaJu/J9Qui2vZKQ
 N0Zg6oRhgIxc5Q47otg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1NCBTYWx0ZWRfX9RUMWa80rtYQ
 2oxkBEfMRlAdcqGW/Dl3GsDBHk48eZAPfAiZoMNx42DqEoV+ggRYsb5ImFcAeO8OFBmpvBl8LJs
 8y0TzRPB1csVwiZX5f/FQ9chtyaa3c8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_230933_493822_BCD237D0 
X-CRM114-Status: GOOD (  24.67  )
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



On 21-07-2026 23:30, Pavan Kondeti wrote:
> On Tue, Jul 14, 2026 at 10:46:29PM +0530, Shivendra Pratap wrote:
>> Devres APIs are intended for use in drivers, where the managed lifetime
>> of resources is tied directly to the driver attach/detach cycle. In
>> shared subsystem code, there is no guarantee that the subsystem
>> functions will only be called after a driver has been attached, nor that
> 
> You mentioned driver may not be attached.
> 
> reboot_mode_register()->reboot_mode_create_device() is using
> `reboot->dev->driver->name` directly for creating the reboot class
> device?

Will review and re-word it? In current design, reboot-mode needs a 
device based registration and dev->driver->name is used as sysfs name.

> 
>> they will not be referenced after the managed resources have been
>> released during driver detach.
>>
>> To ensure correct lifetime handling, avoid using devres-based
>> allocations in the reboot-mode and explicitly handle allocation and
>> cleanup of resources.
>>
>> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/power/reset/reboot-mode.c | 32 ++++++++++++++++++++------------
>>   1 file changed, 20 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
>> index d20e44db0532..7a74f72a8313 100644
>> --- a/drivers/power/reset/reboot-mode.c
>> +++ b/drivers/power/reset/reboot-mode.c
>> @@ -3,6 +3,8 @@
>>    * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
>>    */
>>   
>> +#define pr_fmt(fmt)	"reboot-mode: " fmt
>> +
>>   #include <linux/device.h>
>>   #include <linux/err.h>
>>   #include <linux/init.h>
>> @@ -10,6 +12,7 @@
>>   #include <linux/list.h>
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>> +#include <linux/property.h>
>>   #include <linux/reboot.h>
>>   #include <linux/reboot-mode.h>
>>   #include <linux/slab.h>
>> @@ -168,10 +171,11 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
>>    */
>>   int reboot_mode_register(struct reboot_mode_driver *reboot)
>>   {
>> -	struct mode_info *info;
>> +	struct mode_info *info = NULL;
>>   	struct property *prop;
>>   	struct device_node *np = reboot->dev->of_node;
>>   	size_t len = strlen(PREFIX);
>> +	u32 magic;
>>   	int ret;
>>   
>>   	INIT_LIST_HEAD(&reboot->head);
>> @@ -180,19 +184,18 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>>   		if (strncmp(prop->name, PREFIX, len))
>>   			continue;
>>   
>> -		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
>> +		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
>> +			pr_debug("reboot mode %s without magic number\n", prop->name);
> 
> Any reason for converting dev_xxx to pr_xxx here and below?

this seems a slip from old design, where driver dependency was removed 
and reboot-mode added fwnode based registration. Will update this.

> 
>> +			continue;
>> +		}
>> +
>> +		info = kzalloc(sizeof(*info), GFP_KERNEL);
> 
> The recent commits to this driver adopted kzalloc_obj().

will change it to kzalloc_obj().

thanks,
Shivendra

