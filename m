Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA56E784BD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 02:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1wb5xT+3SX74fD7XcHG6ZfgZRlhTQTgEASipYKevpc=; b=LsZECJvH2UCvI5oUTKx+LutKdY
	Dre1bToWntS4Ol6ya30KmkVljm0Lyg+vLEszqqA4/EJ+7U681FrD7XWm6jJm2iHIsWOdRMqiUGRrB
	TRJaAz5AQKsSqG8f8mD2pq91D5HbXSfJkynT27IY5ZcqhZWmxGJoEelRqYiKtZNSveXSc4kPM39US
	iurKsxuyRLczuBgQpA9jWdFO2yfGidLVMOMNUMbiLYMst9ASu+qqG46dkU8lQgicdfdo8NnCLB0B3
	KiVJ1zmU7i+pJZ1GftraDYISnzz7HvKOMBv9ALSce0SDXKjdCsN1HnpMHIqSmSSQssxQ+zmIVZ+jf
	ivLLNk/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYbKv-000000000f5-0Tcm;
	Thu, 25 Dec 2025 02:44:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYbKr-000000000ed-0ek6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 02:44:19 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BP2EB3o228083
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 02:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q1wb5xT+3SX74fD7XcHG6ZfgZRlhTQTgEASipYKevpc=; b=GSo9+3ziG69nWN3J
	PGYWDiUG4XC3VhmlIhFw7qQsaCaSSnq+GogB3MRRVFhpoDx8y+KXsrmq0ayG/MdU
	AfypdBGk2LQecm6wRbzrRJSoTbQncRDZWfKklKsa1nMs3nDiDJg2myMItgSlqPu6
	jYPgk2WmtFWrlzIOtJqnArYyCDmxO5DnWBf43q3p17e5N5oZTXhZlE/sj7/j+LyV
	ctH3ZZ2HfuU2tiDjVaZuw9TVLDiNZYqIlwEU4LB/sOSbBWSndi6K6dMdAqpQ48wZ
	eSZgwg7SvEvrcftjGwO1yoC2CV8JShzKjiSvxA5iGS7nGr8IP3SKsaC/4cIiyJwN
	RPvjyA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8vaa81dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 02:44:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0dabc192eso142298035ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 18:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766630655; x=1767235455; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q1wb5xT+3SX74fD7XcHG6ZfgZRlhTQTgEASipYKevpc=;
        b=Pbcz0vJO3ZikQRZI8AV85sxuPn+G47Py2cbI2q1SmZ7KroFvYFKtcTW/WXUOUQuace
         9d5nfcpDifbXWws3mrNIzTGixyB9tcAAxbO9RDPAsMEJWj63eJ+14SLp50IAhrIo4WJt
         wORJ+dT62JxbHkMrFztnjTP65nTuu66jTck2FbpXp5XiWby6hAF7hXAsu1iw6IyToW+g
         xwtVL7PzcGn6/Wha6MANTeXUmrM35ADeaFQCPHJehlk8nktXsS/8UXZIVgzSCblfcye4
         ibasNt3CsI/8n0XKaFokJbqFqDHtGnUN6jXrLP74smUbSpw021o99zRT/wDYCPuhFpoU
         g9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766630655; x=1767235455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1wb5xT+3SX74fD7XcHG6ZfgZRlhTQTgEASipYKevpc=;
        b=Y5pmrCyIyaXLu2//bCwcGbaRKkcwZsDz/WlNTkpaOjVSn1NZw8HUU/0MNn04ZspDnE
         FwnHkeGLEsSRFMTxMakeMy4tRIcdNyVXC8iMkVVv6UdSszC8JZHqvitQhNXjdzre7JUl
         O4cIoJmb8vSSk6cDE7OPFojDUOyJejU5biVnPeysqRf6UnFrFeLS4FvIgJOgCLFsCw9L
         e/KNWENzNVfA5IgBVyg8SiYr3sIacg5yUkTad2ghiiKpexdJPdRbx/7Zfdh4VsftsMbI
         YFvRQmUlpRaRk4JWVsPPJCPN2/GuKeDu+kymxBuHAsD0uQyiX5fW34EnSfZnb6BK6xHH
         6icA==
X-Forwarded-Encrypted: i=1; AJvYcCWn98Zxsl0bS0HuZ1Szylv7V74ALoUjldPyHcAcLwMhqXdVYlQU8qquZUaacXas93j2frYhFt0Mg7bdX5clS3BJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxLRgX4IzkpvuTeHB0/LbiQuzl3RcLSpZHWlj8sxE3qcZZn0uIb
	M/zfZqhpz2xtnVQD7KWVtotmRR76v6daad6y+Ur3hGYxLsgMWKubzUG4e++iRyjyBCs1Rte0NMo
	Xc4uFsAANxyupnbIxP5G9Ux/eMvcsoJATLP/izDvnDylwjUPMluZmhdHeFtDWKEt1BVLTt4jwuj
	hJ5Q==
X-Gm-Gg: AY/fxX5Y3mANeNpV7UDUT+azp5FnZ9VoJ7R/HhCdmY2tNyMBvupe6OLtEFqR2Adi+3Z
	3Rl+2hli1LuK0LEodcEZIJLi7KXKFU4r0OufTz70twekVHvuHEmdUNR+0dC4645AzSS8zyXlqQV
	O7MQN3624PFjZenOdAtVQ9QKxOw6lFYiFqyz9tui7eIhKW8Er2ZxUrluogRhwYCSyey5qaa8c9f
	NGt5297/7x7Wr7IpPG+Gsh3h3Wv0JobOu8sxU/ETuvsek061Fi9wU+oie6uVppHVVljoc5DliNC
	pePgfLn2Y66IdAsX3/GDfn4pH6ziexmkS9CBuLxfKwHoQ/6eg32/UydcRF5eiEzXGH+9tttztym
	h8lvunNQfq0ndLAMeA7kQHkteSAaamYafmfPTQIttPiYWLAZcxpg08LrebhOnVAZhp9Y+vhlxJc
	M=
X-Received: by 2002:a17:903:3b86:b0:2a1:1f28:d7ee with SMTP id d9443c01a7336-2a2f293e0d0mr191947075ad.57.1766630654633;
        Wed, 24 Dec 2025 18:44:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3Kz2Egs+ye+uWCT6V6dCDuaQ2pGQyY+N+0McTP3jCXraZVMNAL2nLC2nrTjuFo6zvZiagfw==
X-Received: by 2002:a17:903:3b86:b0:2a1:1f28:d7ee with SMTP id d9443c01a7336-2a2f293e0d0mr191946755ad.57.1766630654094;
        Wed, 24 Dec 2025 18:44:14 -0800 (PST)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c74490sm166275095ad.5.2025.12.24.18.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 18:44:13 -0800 (PST)
Message-ID: <458b3404-ca67-43fe-8610-f33c875b2de1@oss.qualcomm.com>
Date: Thu, 25 Dec 2025 10:44:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/7] qcom-tgu: Add TGU driver
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
 <20251219065902.2296896-3-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251219065902.2296896-3-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8cIN8UVlxUV_9MLYOM5OQ1zW0RuaciJC
X-Proofpoint-ORIG-GUID: 8cIN8UVlxUV_9MLYOM5OQ1zW0RuaciJC
X-Authority-Analysis: v=2.4 cv=WMByn3sR c=1 sm=1 tr=0 ts=694ca4ff cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RlaAdA2wXV2HMp-xn2gA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI1MDAyMyBTYWx0ZWRfXxL7ZpPsXiU/E
 XHECEOOjEWA8Gb8i+uePsWBUR+OrYC2+zZ1pVRVg3v1kOpW2x00xrflUkKOJGIX5KMU3j0ENPwg
 OfUDPqRuUhZF19psQO0a/9Fv/GNqSgLEflR7YTxkvat6p7PLwcHm6cSPOBVfVDxIc6v1US4PmZE
 f/hh50Uudmwtv8KiuL5w4qIsoeL5A6xcSfMeel98/AhNjIo1sXOgXFgEeYth1B8AFnH44PHhYIG
 FaUFyjaAjZPoULcIXxBLBPAPMxcxctod+nTSQ2vUclFeuxufAzlFZy/RfL6tRJdExtHJs7DDjrM
 XvXigiX94y3qFZEMlx6vuNvkN/1DxLV9wBNcYFH4hKVIcR9fvuvXFc8jn/2HgyYB7RnOsXyH9mC
 qQ7kfGMiSencdeSGQnXCYfJBGMo1cZgQRSGdm+8kGNuujDE4pU91a28uAwi/Z5c3gietJe/4ynO
 V7yeU3Qtdusli4Pr2WA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512250023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_184417_330325_D06ACCCC 
X-CRM114-Status: GOOD (  36.01  )
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



On 12/19/2025 2:58 PM, Songwei Chai wrote:
> Add driver to support device TGU (Trigger Generation Unit).
> TGU is a Data Engine which can be utilized to sense a plurality of
> signals and create a trigger into the CTI or generate interrupts to
> processors. Add probe/enable/disable functions for tgu.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   9 +
>   drivers/Makefile                              |   1 +
>   drivers/hwtracing/Kconfig                     |   2 +
>   drivers/hwtracing/qcom/Kconfig                |  18 ++
>   drivers/hwtracing/qcom/Makefile               |   3 +
>   drivers/hwtracing/qcom/tgu.c                  | 178 ++++++++++++++++++
>   drivers/hwtracing/qcom/tgu.h                  |  51 +++++
>   7 files changed, 262 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>   create mode 100644 drivers/hwtracing/qcom/Kconfig
>   create mode 100644 drivers/hwtracing/qcom/Makefile
>   create mode 100644 drivers/hwtracing/qcom/tgu.c
>   create mode 100644 drivers/hwtracing/qcom/tgu.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> new file mode 100644
> index 000000000000..24dcdf1d70cc
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -0,0 +1,9 @@
> +What:		/sys/bus/amba/devices/<tgu-name>/enable_tgu
> +Date:		December 2025
> +KernelVersion	6.19
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the enable/disable status of TGU
> +		Accepts only one of the 2 values -  0 or 1.
> +		0 : disable TGU.
> +		1 : enable TGU.
> diff --git a/drivers/Makefile b/drivers/Makefile
> index ccc05f1eae3e..9608a3debb1f 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -177,6 +177,7 @@ obj-$(CONFIG_RAS)		+= ras/
>   obj-$(CONFIG_USB4)		+= thunderbolt/
>   obj-$(CONFIG_CORESIGHT)		+= hwtracing/coresight/
>   obj-y				+= hwtracing/intel_th/
> +obj-y				+= hwtracing/qcom/
>   obj-$(CONFIG_STM)		+= hwtracing/stm/
>   obj-$(CONFIG_HISI_PTT)		+= hwtracing/ptt/
>   obj-y				+= android/
> diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
> index 911ee977103c..8a640218eed8 100644
> --- a/drivers/hwtracing/Kconfig
> +++ b/drivers/hwtracing/Kconfig
> @@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
>   
>   source "drivers/hwtracing/ptt/Kconfig"
>   
> +source "drivers/hwtracing/qcom/Kconfig"
> +
>   endmenu
> diff --git a/drivers/hwtracing/qcom/Kconfig b/drivers/hwtracing/qcom/Kconfig
> new file mode 100644
> index 000000000000..d6f6d4b0f28e
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/Kconfig
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# QCOM specific hwtracing drivers
> +#
> +menu "Qualcomm specific hwtracing drivers"
> +
> +config QCOM_TGU
> +	tristate "QCOM Trigger Generation Unit driver"

TGU is working as the helper device of the TPDM, can we say:

select CORESIGHT_TPDM


> +	help
> +	  This driver provides support for Trigger Generation Unit that is
> +	  used to detect patterns or sequences on a given set of signals.
> +	  TGU is used to monitor a particular bus within a given region to
> +	  detect illegal transaction sequences or slave responses. It is also
> +	  used to monitor a data stream to detect protocol violations and to
> +	  provide a trigger point for centering data around a specific event
> +	  within the trace data buffer.
> +
> +endmenu
> diff --git a/drivers/hwtracing/qcom/Makefile b/drivers/hwtracing/qcom/Makefile
> new file mode 100644
> index 000000000000..5a0a868c1ea0
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_QCOM_TGU) += tgu.o
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> new file mode 100644
> index 000000000000..dbd1acbd2fa5
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -0,0 +1,178 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.

Please update the copyright.
Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

same for other new created files.

> + */
> +
> +#include <linux/amba/bus.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "tgu.h"
> +
> +static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
> +{
> +	TGU_UNLOCK(drvdata->base);
> +	/* Enable TGU to program the triggers */
> +	writel(1, drvdata->base + TGU_CONTROL);
> +	TGU_LOCK(drvdata->base);
> +}
> +
> +static int tgu_enable(struct device *dev)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +
> +	guard(spinlock)(&drvdata->lock);
> +	if (drvdata->enable)
> +		return -EBUSY;
> +
> +	tgu_write_all_hw_regs(drvdata);
> +	drvdata->enable = true;
> +
> +	return 0;
> +}
> +
> +static int tgu_disable(struct device *dev)

void is better as the return value always 0?

> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +
> +	guard(spinlock)(&drvdata->lock);
> +	if (drvdata->enable) {
> +		TGU_UNLOCK(drvdata->base);
> +		writel(0, drvdata->base + TGU_CONTROL);
> +		TGU_LOCK(drvdata->base);
> +
> +		drvdata->enable = false;
> +	}
> +	return 0;
> +}
> +
> +static ssize_t enable_tgu_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	bool enabled;
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +
> +	guard(spinlock)(&drvdata->lock);
> +	enabled = drvdata->enable;
> +
> +	return sysfs_emit(buf, "%d\n", enabled);

Remove enabled with below:

return sysfs_emit(buf, "%d\n", (int)drvdata->enable);

It may suffer a warning during compile without cast?

> +}
> +
> +/* enable_tgu_store - Configure Trace and Gating Unit (TGU) triggers. */
> +static ssize_t enable_tgu_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf,
> +				size_t size)
> +{
> +	int ret = 0;
> +	unsigned long val;

Prefer inverse christmas tree order

> +
> +	ret = kstrtoul(buf, 0, &val);
> +	if (ret)
> +		return ret;

if (kstrtoul(buf, 0, &val)
	return -EINVAL;

> +
> +	if (val) {
> +		ret = pm_runtime_resume_and_get(dev);
> +		if (ret)
> +			return ret;
> +		ret = tgu_enable(dev);
> +		if (ret)
> +			pm_runtime_put(dev);

		if (ret) {
			pm_runtime_put(dev);
			return ret;
		}


> +	} else {
> +		ret = tgu_disable(dev);

the return value here is 0, we can just ignore it, see previous comment.

> +		pm_runtime_put(dev);
> +	}
> +
> +	if (ret)
> +		return ret;

Remove if here.

> +	return size;
> +}
> +static DEVICE_ATTR_RW(enable_tgu);
> +
> +static struct attribute *tgu_common_attrs[] = {
> +	&dev_attr_enable_tgu.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group tgu_common_grp = {
> +	.attrs = tgu_common_attrs,
> +	NULL,
> +};
> +
> +static const struct attribute_group *tgu_attr_groups[] = {
> +	&tgu_common_grp,
> +	NULL,
> +};
> +
> +static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
> +{
> +	struct device *dev = &adev->dev;
> +	struct tgu_drvdata *drvdata;
> +	int ret;
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	drvdata->dev = &adev->dev;
> +	dev_set_drvdata(dev, drvdata);
> +
> +	drvdata->base = devm_ioremap_resource(dev, &adev->res);
> +	if (IS_ERR(drvdata->base))
> +		return PTR_ERR(drvdata->base);
> +
> +	spin_lock_init(&drvdata->lock);
> +
> +	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
> +	if (ret) {
> +		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
> +		return ret;
> +	}
> +
> +	drvdata->enable = false;

default false, no need.

> +
> +	pm_runtime_put(&adev->dev);
> +	return 0;
> +}
> +
> +static void tgu_remove(struct amba_device *adev)
> +{
> +	struct device *dev = &adev->dev;
> +
> +	sysfs_remove_groups(&dev->kobj, tgu_attr_groups);
> +
> +	tgu_disable(dev);
> +	dev_set_drvdata(dev, NULL);

no need. remove will release the allocated memory.

> +}
> +
> +static const struct amba_id tgu_ids[] = {
> +	{
> +		.id = 0x000f0e00,
> +		.mask = 0x000fffff,
> +	},
> +	{ 0, 0, NULL },
> +};
> +
> +MODULE_DEVICE_TABLE(amba, tgu_ids);
> +
> +static struct amba_driver tgu_driver = {
> +	.drv = {
> +		.name = "qcom-tgu",
> +		.suppress_bind_attrs = true,
> +	},
> +	.probe = tgu_probe,
> +	.remove = tgu_remove,
> +	.id_table = tgu_ids,
> +};
> +
> +module_amba_driver(tgu_driver);
> +
> +MODULE_AUTHOR("Songwei Chai <songwei.chai@oss.qualcomm.com>");
> +MODULE_AUTHOR("Jinlong Mao <jinlong.mao@oss.qualcomm.com>");
> +MODULE_DESCRIPTION("Qualcomm Trigger Generation Unit driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
> new file mode 100644
> index 000000000000..abc732f91dfc
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/tgu.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.

Please update the copyright.
Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

> + */
> +
> +#ifndef _QCOM_TGU_H
> +#define _QCOM_TGU_H
> +
> +/* Register addresses */
> +#define TGU_CONTROL 0x0000

#define TGU_CONTROL 0

Thanks,
Jie

> +#define TGU_LAR		0xfb0
> +#define TGU_UNLOCK_OFFSET	0xc5acce55
> +
> +static inline void TGU_LOCK(void __iomem *addr)
> +{
> +	do {
> +		/* Wait for things to settle */
> +		mb();
> +		writel_relaxed(0x0, addr + TGU_LAR);
> +	} while (0);
> +}
> +
> +static inline void TGU_UNLOCK(void __iomem *addr)
> +{
> +	do {
> +		writel_relaxed(TGU_UNLOCK_OFFSET, addr + TGU_LAR);
> +		/* Make sure everyone has seen this */
> +		mb();
> +	} while (0);
> +}
> +
> +/**
> + * struct tgu_drvdata - Data structure for a TGU (Trigger Generator Unit)
> + * @base: Memory-mapped base address of the TGU device
> + * @dev: Pointer to the associated device structure
> + * @lock: Spinlock for handling concurrent access
> + * @enable: Flag indicating whether the TGU device is enabled
> + *
> + * This structure defines the data associated with a TGU device,
> + * including its base address, device pointers, clock, spinlock for
> + * synchronization, trigger data pointers, maximum limits for various
> + * trigger-related parameters, and enable status.
> + */
> +struct tgu_drvdata {
> +	void __iomem *base;
> +	struct device *dev;
> +	spinlock_t lock;
> +	bool enable;
> +};
> +
> +#endif


