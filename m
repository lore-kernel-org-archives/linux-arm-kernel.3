Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765E0CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 17:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ax94yOZGpPbJi/xkHkGG7O7SwfDjw1ym9nOUmMgbPc8=; b=ceiJkEHLYqyJCIjqTg0mfReWHZ
	PQO8tZGsRcOU2VHFKv5KpWnYBmPKzQc7XBpf91HWF7MDoUDhD5q0d+1o4xn9+XwrkD7RkCRvgnEz5
	3e81edeCquaD4RtDbMkcK22FnXT/aoAt/O7+V+sVYBO5S55Skv1/ljZ/cZDmsuP0OnnLrepM80EDQ
	MipshJXdQevZY1HrODn3lMd0DAD5vLpHg2FKLxOqOdzFSr6zwm4JjaKA+av/KCvinlqRmrOJ8PGbt
	y3nyQHOvapbYLr2g9f3UzW0o3jPHgaXFK/8DPl6jCmh8ZO9WB+4je9IcHCNDDM3doPJxWvw7iUFLt
	RZECpnPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Rdk-00000005YL6-41yq;
	Thu, 16 Oct 2025 17:19:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Rdh-00000005YKF-1Xm6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 17:19:46 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GGLfle016142
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 17:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ax94yOZGpPbJi/xkHkGG7O7SwfDjw1ym9nOUmMgbPc8=; b=gohw4ps1ahNQxtjY
	g6HwKuJdWImMQBH6Aa7c0ZA/c+8LQdaiGrfY9ChqFh/Ei+np3e02R7TOn/kqd0a6
	8FOsqmqtGAqrFyXEFn+JBz3bTgFQFceGi2CbXY6/Z490iaVL7L4RRiKyj3NBCSGU
	0OhgQnxhh4OBjFxPAINLgzVuaQ3rtOqTgomhenXRH4SlZSd4A3DKe5WOMisk0AoF
	uLHer1wLpjUwfMahIOTLgk6cUB5gCbfyYeNj1EDyOQ38cYZp8mPX2uGssJWx1K3w
	Xlstm/3v2XABbh1YLdullQ3cL4ptI92ZxF/IZlId/CXQKp6cRg+GY9tOqmheutIK
	gXJiqA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkh4nu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 17:19:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33428befc08so2072068a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 10:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760635183; x=1761239983;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ax94yOZGpPbJi/xkHkGG7O7SwfDjw1ym9nOUmMgbPc8=;
        b=hv959+lp3ldy3DXX4zdi7UcF7g7SGbjonqAVT2lcxvX0czrVObgItAh1QPd3bFgJsL
         aIsqqJcmPUxa8UFnpNPZLXUHukauUOgiKtGDbbwgQ3OhWBHIS1CQaba0+dnqgpCPB47i
         GBd2Q0UmTTN+uKl70odb2YBN9gBNSqxWbJDvjuhXqaYo6ZocKVf3xQbCelEb+jrNJk6L
         nzvMmps8eVQwCKN6VjD3TKJU2tSocchLHDAXnhIQkbGFKndECu6QQ28pZQeqQyX4mRAi
         fUL4reNPUdPkATHc/sYXmsy2ASPFzWHtnOIoc3fZAjMc5nylEXtuEm7CVEZUIlLvOGX6
         WbhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJPi74ASOu5d9/+3VSTE3eL3UJuAiRyQ99DuH97xahOkQlU1w/iEdb+ShaTL3HtyOpfV9R21tGJN1BE91TJmuw@lists.infradead.org
X-Gm-Message-State: AOJu0YxYDqY5zTqBLe6hrpRCESN4Qpwb+oEeyD6dihZcO57VFF1feTvb
	WBjeBdN5JN+p73zExSzjpC00iYoc+gLk8rguUotlkdtuKVHEPZoxkXhh469qQ6IeTRPqp+CBxFW
	b4LwxOgZ4EbutGe8xbHCm7Zovt1+EOAOGlE83D0N2PtpOdaoaLLxWbqHQExlrUg9cmceOC2SUG2
	yenA==
X-Gm-Gg: ASbGncsCTx9UaJ6UqGzAZt6pqMCbvvgURibf0UAP4jU+1I4I1qYQM8c8dxONwzU4ozl
	xqVFlCtxDikXz8OPdkt73tk9El1ZQ2IBRD8llxqZHb2iGuk0rGu2XXTi+1T9xUZ/WEA0hljIyca
	LM7snyTrjIQITkXpJD3k3xmQyRT4y4F58k5gruWcPZimX6F8UJUv5aCoL2xjKogVR8JtlktsF0c
	hyLTAffr0aCGJBW4xxdviYGkc4xbm252mzGMAkHeUxiWZ3X5hy3BiVLB2pQX1sVnqxT98aAkkeD
	9ZpLQCI9O8tTRL5iAKD/R1xWM0c54dwEtc1/9UWlZbXC6rBY10BiYigiKAyBE8jYik5D64+77W1
	McQyX/fI+ggRUqBOuqegvHzCybjL67KuY
X-Received: by 2002:a17:90b:3f8d:b0:33b:be31:8193 with SMTP id 98e67ed59e1d1-33bcf85d59dmr763839a91.6.1760635182605;
        Thu, 16 Oct 2025 10:19:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1rRrAo2QPBaKZifUQLJIoZpvDEaFp+zcbkMAZ+fOe6tW2DlqTpsxyKkKUiFkWY1Ph4rjsWQ==
X-Received: by 2002:a17:90b:3f8d:b0:33b:be31:8193 with SMTP id 98e67ed59e1d1-33bcf85d59dmr763793a91.6.1760635182106;
        Thu, 16 Oct 2025 10:19:42 -0700 (PDT)
Received: from [10.216.0.133] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bb65222b1sm2611494a91.6.2025.10.16.10.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 10:19:41 -0700 (PDT)
Message-ID: <fa42adf0-8f15-ad4c-3788-578b1bee1c72@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 22:49:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v16 02/14] power: reset: reboot-mode: Add device tree
 node-based registration
Content-Language: en-US
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
 <20251015-arm-psci-system_reset2-vendor-reboots-v16-2-b98aedaa23ee@oss.qualcomm.com>
 <CACMJSesvTLe28Jz83b=zfHD2rvmf7-i_2+2DoV=dgooVqFEYbA@mail.gmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CACMJSesvTLe28Jz83b=zfHD2rvmf7-i_2+2DoV=dgooVqFEYbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: J-GO0PcaaYwSIeM7uK_bV_01LS1bR2jn
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68f1292f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8ps4eDoI1eVci98EcxQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: J-GO0PcaaYwSIeM7uK_bV_01LS1bR2jn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX0vyG3Gts9Myo
 Px0/fMpDofJ1ecmNNIJp37eaDBYS7qfnv0Hi5npKjuccFnUxllWtuOB3Fw20pcjcfOtUlQ8nOv4
 lk/94+ucz+1HmLd9nGscOWRWstJvzfSXjZUQ2PQutRAn5B2DV8QXO+/9bEk78fHRJ5/brYqnhoK
 tkKIXL/Vx2goCiq9MBw7eu8NzkxOiCgrnVCDMXdPzT3TMpqjUPoZobaihMbVSancJBa1X6Ftngu
 IW/sTqA6KH36WHQ9UtQ5EyWRu2uwGrDcsHqTfWUES6GrBd5HD3KJShEiM9NvyoeOZOn1Y7mPxX0
 oFfNxtP6o1vWS+6va9M+Yv7YCeFlIx75N+TuD7U6aJ3+Sttr7DJCAGc10XzcoYgE9BDgolqs238
 SD4jADf69QjpN2aneIxsm4B2rD64iQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_101945_527997_A898A854 
X-CRM114-Status: GOOD (  33.41  )
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



On 10/15/2025 8:10 PM, Bartosz Golaszewski wrote:
> On Wed, 15 Oct 2025 at 06:38, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>> The reboot-mode driver does not have a strict requirement for
>> device-based registration. It primarily uses the device's of_node
>> to read mode-<cmd> properties and the device pointer for logging.
>>
>> Remove the dependency on struct device and introduce support for
>> firmware node (fwnode) based registration. This enables drivers
>> that are not associated with a struct device to leverage the
>> reboot-mode framework.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  drivers/power/reset/reboot-mode.c | 45 +++++++++++++++++++++++++++++----------
>>  include/linux/reboot-mode.h       |  3 ++-
>>  2 files changed, 36 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
>> index 8fc3e14638ea757c8dc3808c240ff569cbd74786..c8f71e6f661ae14eb72bdcb1f412cd05faee3dd9 100644
>> --- a/drivers/power/reset/reboot-mode.c
>> +++ b/drivers/power/reset/reboot-mode.c
>> @@ -3,13 +3,17 @@
>>   * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
>>   */
>>
>> +#define pr_fmt(fmt)    "reboot-mode: " fmt
>> +
>>  #include <linux/device.h>
>>  #include <linux/init.h>
>>  #include <linux/kernel.h>
>> +#include <linux/list.h>
>>  #include <linux/module.h>
>>  #include <linux/of.h>
>>  #include <linux/reboot.h>
>>  #include <linux/reboot-mode.h>
>> +#include <linux/slab.h>
>>
>>  #define PREFIX "mode-"
>>
>> @@ -69,17 +73,26 @@ static int reboot_mode_notify(struct notifier_block *this,
>>  /**
>>   * reboot_mode_register - register a reboot mode driver
>>   * @reboot: reboot mode driver
>> + * @fwnode: Firmware node with reboot-mode configuration
>>   *
>>   * Returns: 0 on success or a negative error code on failure.
>>   */
>> -int reboot_mode_register(struct reboot_mode_driver *reboot)
>> +int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle *fwnode)
>>  {
>>         struct mode_info *info;
>> +       struct mode_info *next;
>> +       struct device_node *np;
>>         struct property *prop;
>> -       struct device_node *np = reboot->dev->of_node;
>>         size_t len = strlen(PREFIX);
>>         int ret;
>>
>> +       if (!fwnode)
>> +               return -EINVAL;
>> +
>> +       np = to_of_node(fwnode);
>> +       if (!np)
>> +               return -EINVAL;
>> +
>>         INIT_LIST_HEAD(&reboot->head);
>>
>>         mutex_init(&reboot->rb_lock);
>> @@ -89,28 +102,28 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>>                         if (strncmp(prop->name, PREFIX, len))
>>                                 continue;
>>
>> -                       info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
> 
> This change is good - devres should not be used in subsystem library
> code, only in drivers - but it doesn't seem to belong here, can you
> please separate it out and make it backportable?

sure. Just to confirm we should separate out the devm_kzalloc part of the
change and add a fixes tag.
 
> 
>> +                       info = kzalloc(sizeof(*info), GFP_KERNEL);
>>                         if (!info) {
>>                                 ret = -ENOMEM;
>>                                 goto error;
>>                         }
>>
>>                         if (of_property_read_u32(np, prop->name, &info->magic)) {
>> -                               dev_err(reboot->dev, "reboot mode %s without magic number\n",
>> -                                       info->mode);
>> -                               devm_kfree(reboot->dev, info);
>> +                               pr_err("reboot mode %s without magic number\n", info->mode);
>> +                               kfree(info);
>>                                 continue;
>>                         }
>>
>>                         info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
>>                         if (!info->mode) {
>>                                 ret =  -ENOMEM;
>> +                               kfree(info);
>>                                 goto error;
>>                         } else if (info->mode[0] == '\0') {
>>                                 kfree_const(info->mode);
>> +                               kfree(info);
>>                                 ret = -EINVAL;
>> -                               dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
>> -                                       prop->name);
>> +                               pr_err("invalid mode name(%s): too short!\n", prop->name);
>>                                 goto error;
>>                         }
>>
>> @@ -123,8 +136,11 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>>                 return 0;
>>
>>  error:
>> -               list_for_each_entry(info, &reboot->head, list)
>> +               list_for_each_entry_safe(info, next, &reboot->head, list) {
>> +                       list_del(&info->list);
> 
> Same here, not deleting the entries currently seems like a bug? Do we
> depend on the driver detach to clean up the resources on failure?

sure, so this should also go as fixes? and should we remove the other
dev_err(printk) also as fixes? or that can still got with the change
where we add fwnode based registration?

thanks for review!

-
Shivendra

