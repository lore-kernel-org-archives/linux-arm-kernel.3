Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36391F588C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 13:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbRTS5uj/u6e/sEAReFEFf7R7jTxQJ6MaZEe5vlQrNc=; b=LvG2QjfL+Xusn9CYsH9uUyt9CZ
	whRYAr9gPc9retpUE6gLXj+URFbu0koWvwoRlSqOJptQ+ye1zTjZX5iJ2DQfqZpXxWzfuAxYLuDsS
	weyOHERb6GoRncM3amjrhU2hXHtKCLdunoWW0syvS7KoIJOj5K9HRrkJEFJr2rbAk8L56cYrgr6GS
	FRMsm7msFvKk6IP5Ru6mKH2M0U4PqXStG4D3FirkG5HCrJrqCWvhbhuJjDqeWHqls7/egvI8OeXBM
	ZPErRimysnI8ykqQ0eIEr9/Tz1nH5zhkTGK5MrbMjlptS0dFGzL1E5BYhO8Z0mvmofn1nEPrCG3ru
	gMXEoGGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEofl-000000071NB-1JMP;
	Mon, 20 Apr 2026 13:28:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEofh-000000071M2-35iI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 13:28:19 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KAvYlC3015375
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 13:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PbRTS5uj/u6e/sEAReFEFf7R7jTxQJ6MaZEe5vlQrNc=; b=Jl7ByKRxvcTUDv4N
	eyiW6+026VlT8QCMhh3QC4I8qKzvO8YVCNXDIYzEc2ru9c+woz+xllKVzjUWjOGQ
	xukgV7vz2OmL5hN41jE3sQxGrHgnh89HG5MOpz6B9aDsF0zDmotn+fEtIFK5M08n
	MMp6Pfu+/x4JYocvSKtMk7N40W1X/K6xsm1P+oYHM9MHa1vq5gm8mU17qh89vath
	1ZnOkw67vXQZGVNcVhyT6vXZQxcZfCw7biRyM5qcgsqajFbhztZvN+4lgEQfHKnR
	esIWyLA1cqclrkwIG8wKnsrXKISNSlJ0K4qmNmZ84988bp/Fx4n8um/KPL+CnmJk
	bQBMjQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnjukrfrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 13:28:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso1860969b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 06:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776691695; x=1777296495; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PbRTS5uj/u6e/sEAReFEFf7R7jTxQJ6MaZEe5vlQrNc=;
        b=fxYQwtrpxPKorL4eVui950NIBmEgtU2wqQfkogC70Zvpiog2N2cYxgEKi/CeO1nXDM
         ZbbUbYr2q7RKmlH7e3Ik+D7dvxozuK5BGsr7uO0Jh/3cLk9ls2FKOdgN+AiTIqAssZZi
         Zlr9Bw9opYzq65K8sswd8kNgMt03qq/VtLEr3gbH9125ZZg/8q/45YIpN5Pe669QzC1j
         4aI53vfkCDh+Xj7JCvabs8UpC038t1EHKQO8btdyN5tPFWjy61e1uf8BIAypxO0hlZvV
         u9XFR/gQYW9JNOGB0ISZZ0fd6YP+yyq3cPJJJejvmQc5UVukxr/xgVR/cG7j7dsljfD0
         nwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776691695; x=1777296495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PbRTS5uj/u6e/sEAReFEFf7R7jTxQJ6MaZEe5vlQrNc=;
        b=osO+MBIxzn781pzDzGSoO6dI+/41y7VL8WKTqx/uzL6o1aim0FQJXOmXPtC37Oe6VH
         7x6wVnH9TUfX/py8GHWz380ZU+jvqJsk13VMXOs0gGq9yktidQicrXUwVOP76n3J3GK7
         8ZtH0W43DHbIlUCzxTXbp2NHHKrh88wIFuEwm0aHEbSpn6fpLYcdI5/9ycH7TpTwUUJy
         8PKHO/hv/ZTe3Q05SiC1tQ0z0zaZ8fGiyyPqZhKoaEwssd+XFicBKY/yIOf1naMXtc8+
         cq/P5gTVv1CkxXIOTpXbsTvdxLatj2Vv1RWFDX9dx15aTeMYR2gr+D+c1Hsl9CMb9UNW
         P/mQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/MVEYScsD2/mmQToKJn8qL183uhkf2Ebb83j5a8rHaQJIGoydiXYkxf24W/d2SwxdnsSx/JCibY3JIgf16lGN@lists.infradead.org
X-Gm-Message-State: AOJu0YxtHcAcPoU+zcLby2bkSuJkG+uRoqFkUqijoKoECYKaseK+GsfH
	w+/fKBmfJLcyQVQmt1iN/I03tcpyCGDWS6KR6usmX5xQtLmpyLHCSs6j3zosBMqUvLqalGHyHyS
	bSKpN/sAWXU+3amdcc5SVKH3jU25IQnB5gAVlJ1WGlwv670HH09/EgCy5UwHH3yMWR2jCBM7LNI
	a6Jg==
X-Gm-Gg: AeBDietKioolXCOsjN7tX/SpgBKlmxqpRWjjs/DqKdH3tnLJRJvmwBZoIUMoIAjy48N
	RUn8cO8rFtP5vZL+n8JGkPn6X+O5rICDkpmwCuJYb3nIi1OAM7yx3VtejIyTWJW3vyIZENWXH+Q
	uXeMF139z06pE4ceRYW57avZwBqUGC99dgUPfBXTpM2CF26wXTiS4DLo9yO9L+gIQubxY2iNL7U
	iVKD7nm2HO+cbJ7L3GLdcEn8zjpfj22bi9cWA05it8M2PBwLEjxim8eIB8bMAFAUU6PEoAr1icR
	cavEdDnjHsoPnAD6Pw6D5Iy1polbavxTuRWVtCHJF1YB9DojVTc67kGh+psYN/LK/Jr+PVGmtm+
	0qU1VVn/sKF3necYOhZyjz4Itr2CRwLGfA3y/zG4iJjZgDpdcA8zrJcywrDUCJgBaOe1CGAz5sF
	0gH7HsOLzEm/k9gr3VKrj3
X-Received: by 2002:a05:6a00:1826:b0:82f:37e3:ae6e with SMTP id d2e1a72fcca58-82f8c961f73mr14022986b3a.31.1776691694730;
        Mon, 20 Apr 2026 06:28:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:1826:b0:82f:37e3:ae6e with SMTP id d2e1a72fcca58-82f8c961f73mr14022943b3a.31.1776691694102;
        Mon, 20 Apr 2026 06:28:14 -0700 (PDT)
Received: from [10.133.33.82] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec0307esm10921548b3a.53.2026.04.20.06.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 06:28:13 -0700 (PDT)
Message-ID: <ccd54c68-af2a-4d98-abda-3ba27b9178f3@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:28:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 2/7] qcom-tgu: Add TGU driver
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
 <20260417073336.2712426-3-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260417073336.2712426-3-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4RNkcPIdxqKZmdHf9TSGZSX_cHZOaE7N
X-Proofpoint-ORIG-GUID: 4RNkcPIdxqKZmdHf9TSGZSX_cHZOaE7N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEzMSBTYWx0ZWRfXwem8OgJTAnYr
 5iYjXWcY3XLKOhtP58rULkuNQBvK/UzD6PlUxP0ND/inXDR6mcTKOtpx4MslDeiLU52v0khjEc3
 2y3sXAcHlTKGu/W15OfmsLBiakVBAFPNieB1tt1JGBZEyCsrW914/RlN9yXKansfjxHIv2y3XeD
 NqYhG2DzA6nOsXCk6lDM866UBrs4x7J3O7Dd10lu9ae0D9W/6aQ5+0KXACUL9qogNJJz0+51JJQ
 tlQ7e8Yk3bm80voGv0X06SgdCVZaNCsS8UlAKd3LUYfV3Oput3REF4eYT1gCqG4Xq33Q1NP4u2h
 zNce94pgWiZdxvgy5Wm4cL/OYV4m/kFxzztAGYHofMRuWjqWAl1LJxlLee0iXmxi5fkEknI31+J
 bTK2eE+EvVE5yoO0fC3tmSZuZjYRgx4j+ZJgbJzT8SrkXBdiCUOLe57H2FjH/vNXJuxjc+npVp5
 I+nmT84efVfLmHKTu4A==
X-Authority-Analysis: v=2.4 cv=WuUb99fv c=1 sm=1 tr=0 ts=69e629ef cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RlaAdA2wXV2HMp-xn2gA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_062817_926106_CC30C96C 
X-CRM114-Status: GOOD (  32.47  )
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



On 4/17/2026 3:33 PM, Songwei Chai wrote:
> Add driver to support device TGU (Trigger Generation Unit).
> TGU is a Data Engine which can be utilized to sense a plurality of
> signals and create a trigger into the CTI or generate interrupts to
> processors. Add probe/enable/disable functions for tgu.
> 

LGTM.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>


> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   9 +
>   drivers/Makefile                              |   1 +
>   drivers/hwtracing/Kconfig                     |   2 +
>   drivers/hwtracing/qcom/Kconfig                |  20 ++
>   drivers/hwtracing/qcom/Makefile               |   3 +
>   drivers/hwtracing/qcom/tgu.c                  | 193 ++++++++++++++++++
>   drivers/hwtracing/qcom/tgu.h                  |  51 +++++
>   7 files changed, 279 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>   create mode 100644 drivers/hwtracing/qcom/Kconfig
>   create mode 100644 drivers/hwtracing/qcom/Makefile
>   create mode 100644 drivers/hwtracing/qcom/tgu.c
>   create mode 100644 drivers/hwtracing/qcom/tgu.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> new file mode 100644
> index 000000000000..f877a00fcaa5
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -0,0 +1,9 @@
> +What:		/sys/bus/amba/devices/<tgu-name>/enable_tgu
> +Date:		April 2026
> +KernelVersion:	7.1
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
> index 000000000000..5c94c75ffa39
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/Kconfig
> @@ -0,0 +1,20 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# QCOM specific hwtracing drivers
> +#
> +menu "Qualcomm specific hwtracing drivers"
> +
> +config QCOM_TGU
> +	tristate "QCOM Trigger Generation Unit driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on ARM_AMBA
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
> index 000000000000..49c8f710b931
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -0,0 +1,193 @@
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
> +	drvdata->enabled = true;
> +
> +	tgu_write_all_hw_regs(drvdata);
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
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 0, &val);
> +	if (ret || val > 1)
> +		return -EINVAL;
> +
> +	if (val) {
> +		scoped_guard(spinlock, &drvdata->lock) {
> +			if (drvdata->enabled)
> +				return -EBUSY;
> +		}
> +
> +		ret = pm_runtime_resume_and_get(dev);
> +		if (ret)
> +			return ret;
> +
> +		ret = tgu_enable(dev);
> +		if (ret) {
> +			pm_runtime_put(dev);
> +			return ret;
> +		}
> +	} else {
> +		scoped_guard(spinlock, &drvdata->lock) {
> +			if (!drvdata->enabled)
> +				return -EINVAL;
> +		}
> +
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


