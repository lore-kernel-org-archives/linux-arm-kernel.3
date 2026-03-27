Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8589410A3D9E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 02:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xAcYe9P0hCn91SlOg/jUJ0U+XytF7tIU5c4FH21w4c=; b=uSvLsnv08lXkTTc54sFlxb+YcC
	v5oWT9z8sELjDFW4rOAgFDmjHxUk85c7xMGp42wxcNLnJ1xoK4eNvVbyDSuKjH24Gp6UZH5lA1FeM
	gDNSBy0P4UGrsfMvrW3ANKQaxHmKzORGZRapGkMw9YksnDNsT8tM4wKPm5AGvS5zGeHsKs0lLwJTh
	Y1P8wTuKJKIbCA/4/s39Cs5uxyFrwm2UAWQ1O7Rrg8/m0N6E6pHbCrK7Ueu9KPaM4PHL7ipWqzoZY
	bGf+9nvZjZogYKn1RgNVe5LNViIp7COYfx7K7EgHw0rEF++8aVq3lTwCmXKNv5nQLmGG5eQ0dLCqx
	AC9ZU9eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5x39-00000006Yh8-477i;
	Fri, 27 Mar 2026 02:35:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5x37-00000006Ygk-27nj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 02:35:51 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R1wj83638653
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 02:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8xAcYe9P0hCn91SlOg/jUJ0U+XytF7tIU5c4FH21w4c=; b=oYZ67frnIDa1TUBd
	nH3ekUPqhXZ21s9wrHzo2xz3/n/fkaDDgD21oIk45DFoSJwjRnPhxdpLG66MW5kZ
	G5aCiHaOvHTgraUrFDMm0p8DVDOx/cgST+1KnjDmi04REqYG20Um3v4ak44laWrE
	ToiTUfX1GbIyXFuJefkXoCwaEM/99HNTlBr3XwdGzceYM9gPOB0+T0jSZV5p3nyr
	Nx7ozwB5WGpcvvUkdMT40TA3XhPpxAWn+4sBFHf2VZR0yOMOABkDt8/vBBacWXqx
	lhjaek/Z+tYCiYQRBtTY2z2IQsMMYp9Gx53atgTt4NCaGTDcu8AZqVf2xScnfM0i
	56zM1A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5883hueh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 02:35:48 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c76681f8074so1125344a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 19:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774578948; x=1775183748; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8xAcYe9P0hCn91SlOg/jUJ0U+XytF7tIU5c4FH21w4c=;
        b=NltdlNGVwL3pwZQ2Ruj2SDvFL8PPzr8K1gWWfNhuRmgrWNHqb940N/D3GIvDzonHj1
         RTEBnMOjkgxwVrgIdxxLjBn951FK08Axr37Ais7nIpbbjDhDaNEQRdaWcRRXFXddqlCq
         Rihy0HJZ3BVC7I3C5uwvo8k99uOD1SG6y0rpTQSilXj5I2P9JnErqsbuPVNGUZI69kSN
         kT69P1R3PdR57CJljsJVYWm1bAc6YD+M2DcghVFQpPFKG1eCsnFrVIPWlDLwrwD7VGhh
         mdKquIUAMIxwFDNmjjAnOyV8Uo0z8ea0C3Ffiwgtw+Bq9XMp22OknuTjJ2woF/v3sqF5
         6l8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774578948; x=1775183748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xAcYe9P0hCn91SlOg/jUJ0U+XytF7tIU5c4FH21w4c=;
        b=ZUtTjZPiV7bfS4LGw/7uBotWAooNn5df7DfAttyjSdOw6+nzbghWt5GB9upQZ07d0d
         y4Wufq/nsOV6FGNqskdq3IhrnlAbuqVYvfH2LO6+5WZ9BSRA7vESw1PGAjCN+N/7wor+
         sp+JU8ZdPSQurVDKNbbkDguTRjEiiZwfvz3LWWLsSbsx5ENlzTfkoix5QLI2dNQ+Y5K9
         vWXuY5Vy2ib5yOqPzwVgVivQ+pqvaqXF+NBLDjesQKBcDGXPDCpGK8DsdTGdeaiiFMyR
         Fmm/B3I98/dm0ZKkh4lvo8XRpDnWGo4deCMTKyAoZ76DSZvJ6TwiGXwQpnvqs+wU0C84
         sH2w==
X-Forwarded-Encrypted: i=1; AJvYcCXnBmZrs7L1uJUAIU0r7MyNkCvCAd5XuDzm4AODg0PT8fF/UrKgCBMz2pEe1WAaihX/j+AMt/btoQtV75KfH+Pp@lists.infradead.org
X-Gm-Message-State: AOJu0YzJeC8I672MeA369FnU4ils0AOYbWgwwZyqNaGsUcJKhPjkKigV
	2VdRMcc/XHHrqYb4bVtf9qR2cd0HSLaouzrubiRnKucr28gR+hdsElVWVz1Qn7CW16PsxrCuWcU
	MVFwDe/hWc62XdxiDF2ieeYqWq1ODsSGxxjV7piFrd3dOxvLBsFhCT0LkA3PimqZD2vxozKLBC7
	KPVg==
X-Gm-Gg: ATEYQzyDH0kx3iy7LFeVpVYP7Yu5H+HLGgb5uZma9jqd8PmhEO/OoKmabYlcdYIOvn4
	XPa5dPpj7gKgjhoHo0li5RihA+vZeZV1WChXXLrS/ruD1Yi/ZuKtN8i7xjEzSiyLW5k9dpgKTRk
	sEaPNcd+i/XpDIfVmQCn9yDHPbQ1HbLmu8cbIBPZuqiGmjUvaxmoiznYN16mX+zv25yuDAJ7fqL
	UaFlC/OzjZziH5qht9cpgM9JUKSBV99dAXnzy4MT2Ldug4G8+KVbk/aCr9TsFLzUYeuiC1xAyKH
	t3ibHU95RxNoEz7s9O9h36sy0+ixnXLtSVwEzpjE4nPry82shdiXOyQCJUprXoMMzX5V9pmE7FI
	7CmoKUw1bjndzc00s5yGGZ+k0Oih+J+Xzge+gfxUp2oQIeXPQl/ILA4n2ItS56l2ZZWRReIgwe5
	D3oksFW+J+qg==
X-Received: by 2002:a05:6a00:3d10:b0:829:a131:8318 with SMTP id d2e1a72fcca58-82c960382d1mr751745b3a.44.1774578948028;
        Thu, 26 Mar 2026 19:35:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d10:b0:829:a131:8318 with SMTP id d2e1a72fcca58-82c960382d1mr751712b3a.44.1774578947374;
        Thu, 26 Mar 2026 19:35:47 -0700 (PDT)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d216a8csm3971093b3a.16.2026.03.26.19.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 19:35:46 -0700 (PDT)
Message-ID: <2ff7aed6-72c0-492e-96d7-f8c30f331a01@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:35:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/7] qcom-tgu: Add TGU driver
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
 <20260317032639.2393221-3-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260317032639.2393221-3-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1qPtRb4kXUpODcyNhoseyTrTY49bwLyO
X-Authority-Analysis: v=2.4 cv=bopBxUai c=1 sm=1 tr=0 ts=69c5ed04 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=d5xPaorGRswOp7j5N5AA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 1qPtRb4kXUpODcyNhoseyTrTY49bwLyO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAxOCBTYWx0ZWRfX6GCscb3XG1KR
 a0lyCoIlhhxX1YstTRArshAHfFGGN10XFZr7BqmzERzqhOit/APbJnir1921+nAXWNwh4yiwrYs
 6O8TRoz3gTm8cSGFNqawxZ+UjkXyGC6J4s2UHhUGeXKSy/Wa84zPaLrD5FLv5FUxiZ27v+vikVC
 aEdaBW1urllGjQU2Ip3GQFYa6VBk13wluBbnAsZ2mbh2G3PyBx+SWJCQPaQg7/zPAA+Z8GZR+8e
 tWqdicpKloMCsSD8y702MrYdmSXo5o3u92MpSnam150+mBdcbJpchV3kPwu1QOnLrwjIliCnv/Y
 9hRvfEa4wK1F9B/JC6cZqFNxZpOf8Lek9Gb2n+mAzkdJ2mIW8fEJbEv02bUWbWXbyI1grsLBEIH
 luURHEXLUrgO/BQtjkv0Fes2pIJLAwoBUnDZH5lvfWgFmyBDoXEQNFN5gV91zGjS11QVpcKJSqL
 ZNBL5RUCff6LTBK8/2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_193549_565115_DA61CCE8 
X-CRM114-Status: GOOD (  32.42  )
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



On 3/17/2026 11:26 AM, Songwei Chai wrote:
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
>   drivers/hwtracing/qcom/tgu.c                  | 183 ++++++++++++++++++
>   drivers/hwtracing/qcom/tgu.h                  |  51 +++++
>   7 files changed, 267 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>   create mode 100644 drivers/hwtracing/qcom/Kconfig
>   create mode 100644 drivers/hwtracing/qcom/Makefile
>   create mode 100644 drivers/hwtracing/qcom/tgu.c
>   create mode 100644 drivers/hwtracing/qcom/tgu.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> new file mode 100644
> index 000000000000..ead237bb7d89
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -0,0 +1,9 @@
> +What:		/sys/bus/amba/devices/<tgu-name>/enable_tgu
> +Date:		March 2026
> +KernelVersion	7.1

missed ":" in all patches.

Thanks,
Jie

> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the enable/disable status of TGU
> +		Accepts only one of the 2 values -  0 or 1.
> +		0 : disable TGU.
> +		1 : enable TGU.
> diff --git a/drivers/Makefile b/drivers/Makefile
> index 53fbd2e0acdd..82b712a12a26 100644
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
> index 000000000000..58c19f12f3d7
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -0,0 +1,183 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
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
> +	if (drvdata->enabled)
> +		return -EBUSY;
> +
> +	tgu_write_all_hw_regs(drvdata);
> +	drvdata->enabled = true;
> +
> +	return 0;
> +}
> +
> +static void tgu_do_disable(struct tgu_drvdata *drvdata)
> +{
> +	TGU_UNLOCK(drvdata->base);
> +	writel(0, drvdata->base + TGU_CONTROL);
> +	TGU_LOCK(drvdata->base);
> +
> +	drvdata->enabled = false;
> +}
> +
> +static void tgu_disable(struct device *dev)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +
> +	guard(spinlock)(&drvdata->lock);
> +	if (!drvdata->enabled)
> +		return;
> +
> +	tgu_do_disable(drvdata);
> +}
> +
> +static ssize_t enable_tgu_show(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	bool enabled;
> +
> +	guard(spinlock)(&drvdata->lock);
> +	enabled = drvdata->enabled;
> +
> +	return sysfs_emit(buf, "%d\n", !!enabled);
> +}
> +
> +/* enable_tgu_store - Configure Trace and Gating Unit (TGU) triggers. */
> +static ssize_t enable_tgu_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf,
> +				size_t size)
> +{
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 0, &val);
> +	if (ret || val > 1)
> +		return -EINVAL;
> +
> +	if (val) {
> +		ret = pm_runtime_resume_and_get(dev);
> +		if (ret)
> +			return ret;
> +		ret = tgu_enable(dev);
> +		if (ret) {
> +			pm_runtime_put(dev);
> +			return ret;
> +		}
> +	} else {
> +		tgu_disable(dev);
> +		pm_runtime_put(dev);
> +	}
> +
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
> +	drvdata->enabled = false;
> +
> +	pm_runtime_put(&adev->dev);
> +
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
> index 000000000000..dd7533b9d735
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/tgu.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _QCOM_TGU_H
> +#define _QCOM_TGU_H
> +
> +/* Register addresses */
> +#define TGU_CONTROL		0x0000
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
> + * @lock: Spinlock for handling concurrent access to private data
> + * @enabled: Flag indicating whether the TGU device is enabled
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
> +	bool enabled;
> +};
> +
> +#endif


