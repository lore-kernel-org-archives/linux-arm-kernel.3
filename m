Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54208D39409
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 10:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0uG7ywldOjaUzeof/WNjOjTtdACVD5rMx6FLWvsBrfA=; b=e2nFwNm1zfMMKmw6CTqrPltmAN
	hEqn2q0aF3ZS1blu2M7jOdaUQr+nml7gJaqe3itBHVNE4s2/H3FDLkEAfWH+H+cbvBLYfJw8ZILW1
	8y+kAgkMSfDtHIR1JZEoq6knRnC4vo04g9Y2/9clVm+VmFAHhun0f8VK4v2jy+dtyDTUnR4mSikaX
	A7WcoWygSzQLgXZB05RborcArea5QR2bbk2/f5ZrtzAPq2dKBhMZPtoV3n43h4sqVoxCNpQbP2JIX
	a1SxjOv/IPopv74+iBbeYCrZF72mDprzHWvirqSlMpjXPZMmzwo8+aMJBBbTzzzGSODMMYQUGUlvM
	V2QO4pYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8F7v-0000000HOWX-0Qhe;
	Thu, 02 Apr 2026 10:18:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8F7o-0000000HOVn-43qt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 10:18:12 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6328dAdH1249508
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 10:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0uG7ywldOjaUzeof/WNjOjTtdACVD5rMx6FLWvsBrfA=; b=Dw3tIUJPBonguF/a
	pcBCLU6rKaGB3GO8S6EhXEtOzfrit5UUdEXKxZvWxEy7gHcv7p00MZlBhEXH82DW
	29jLg8VWJv+qOoNhFIdWfd3XpNkcb0jixI0pE8VuFLIfHwNCWt4NtRKxzzx04Djv
	ulksf7aYDpkH0jME2bRibQeXqQ/c3VTtpN0SkoA1FGS0pJvB7+pa3KwB67zQjelJ
	MynkTCxMQYaurjeSDKNr5t7mZjx+fM+Vmfj0UvL6NcBL+2kDX8nZ67oA2IC8TCM9
	cD44iUrTe+C8haMH5cXhNhB7Y5Wx5Al3Zqn8+Y/MqeW9Qx7rG/QrrCAEv0LNmWNb
	3FjJfQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9n4t0cps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 10:18:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35da37203d2so1435854a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 03:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775125087; x=1775729887; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0uG7ywldOjaUzeof/WNjOjTtdACVD5rMx6FLWvsBrfA=;
        b=X0ELi524vLtcPPVgAvbhMBRpyIr+BX/FGFcU9ZQN1RO9JYzYxjWatklDEvmcWeOUq8
         sg+QM/yeFALWB6EpV3psy8Mew4yCvA0u2uotFZR15tXjunhXH+tOPs9/rT8VI1X3/Qiv
         zctfAYIoa18m09ec0MAxAtTnnDnTezGEqhKo2MW/0dzi57Dx2ieQ2gWEoVezylGADq0J
         fEQLs1bk9b5p40IAn4FltHgFwqFcNCgR/JMGC2obARpLN66NjU0M4R4vZ5JesOxWEe9/
         JZD5m3bGbAW/ITIKQaKLUu0TLh13rOKFP4lYtojl3rbTyw0OV4Dwt8O0Uo6PvaD774PI
         WjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775125087; x=1775729887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0uG7ywldOjaUzeof/WNjOjTtdACVD5rMx6FLWvsBrfA=;
        b=qkrvjdXDdhCFwBD0NWYws47BLlR4fhwelGPKkQlH/qnHxkBY9x7tMumMrPsRrhAslU
         /D85mexWtmo1RxF0L9O2yw1c4ZOBbtmyIfowOpJMPpW5xGHu8ivQqpHKoToRSeGAtfZa
         wITsugM027U0wJQIob9DFCrPVjBWQN3VBGUQMFQt/p+tzJ67x73LSQullKtDCOMbMsZS
         kxaKHnCFoWnUE6kQp/wEMZIB+gDOfJHiDBrq54rx+2RzPiiaV1uHLOb4EjeqCGSzRPUu
         /uLlWZXkeKR723vjbXPFT4XZhsQDWHvW4Kem3opMqip4Wp2P9aFqb3p7JONEODAjgRE9
         VwHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqxumSs7JnqQta6Mp81CR1sXXLrCSsxmSacLtZUhhDT2wP/bStd3/i84x/Ti8d5UBr7/MaCUBs0GSPu14/Iir+@lists.infradead.org
X-Gm-Message-State: AOJu0YzuJBYNcHTHSJxkBSjZ52T1dMBV5vnmrWrORUkwR3QoGFuxd8o4
	B4+r0cDG4IpdyIwA4aWBCUMhl6JmzfhpOI2xDWxVioA9f1gPAbGnyeyRtRQT3/Nh9F2uaQBMvNo
	rMrr6eSho10K4ZJ7CK34xDgU0imU+yuDxF/+Foysjp9FMtJiY8EReUh0qif0mreFJE9vlyJz4LW
	UMbQ==
X-Gm-Gg: AeBDieuRwpGUXX/XmJx2aA6xc4Faew5knzAiHSGWwh8w72HBwQv9iEESk+cA9Ox4Cmc
	t1pxM9BQ5u8x9Qk8TZe8/I4M0mLFjyR9eM4TW07Cj8WYbLIWtStoiNEod8khmy2a2zN0uwExT1L
	QMcggo+KumpH5sOJY88blESTKC5HX0d5e3+K7MzZDKwtKVcznN3oNG5lot4TepC2AduYPuNS/gM
	MNVLB/ONXyCUJjnkMLu6pF/7tIioCPSTHhXBwWH85GUlrqma1l5VEja8MpGSRmAyRQ50YpdJFwH
	6mLrEYPpVB5ZVoFs5hN/I5a/Q6HA9U6KB3kemCtOMz6jvwJQ+tg+W28y6sezk36zi/bGGQT+qiN
	yVIuNC7n/xLonYBSDKHlfA2lX5wvPMWjWrybmxNpdaK/17OLdj8abzcyYeN3nhrd5YzkYHFzrKl
	zzxXN5GjOOQJ4=
X-Received: by 2002:a17:90b:2ec4:b0:34c:904a:d92 with SMTP id 98e67ed59e1d1-35dc6fdd803mr6465774a91.26.1775125086496;
        Thu, 02 Apr 2026 03:18:06 -0700 (PDT)
X-Received: by 2002:a17:90b:2ec4:b0:34c:904a:d92 with SMTP id 98e67ed59e1d1-35dc6fdd803mr6465739a91.26.1775125085899;
        Thu, 02 Apr 2026 03:18:05 -0700 (PDT)
Received: from [10.133.33.180] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe62f5dbsm7631844a91.8.2026.04.02.03.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 03:18:05 -0700 (PDT)
Message-ID: <e96601e1-c433-498b-9d8f-5c56540a07cb@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 18:18:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/7] qcom-tgu: Add TGU driver
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
 <20260402092838.341295-3-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260402092838.341295-3-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ryh2kpd92jcJ1GlkApGsWo6479ZG5-5M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA5MiBTYWx0ZWRfX+iTanYzGSKjf
 5J/bZ2QW00XuUCG7NGoDd/niZe72fk4obbHF90z+ozmmvALWmcX2EgClTW/QBv9QB5hQZcZNS0s
 8b5py0mPbJuoHuQ0S/tnlsQb29fWjBaGjXSxhG7+JZoF47Hi78UHneokxdk3r73hCKkXha89ycV
 yKjDDHuLIyXZNiKrFDV3E4YFGlTWQGgEWm0pbgvrYCTak3iWNeqyStaT6jBtQSjXFyIEhZN1RJN
 OcbwfpqfK8J6t372fib5akILOrff4FQN6BA64NO4bztrgCkq9hyUMNh2sVwAlw8sld7eDyUTHvt
 MaugJvW6tQk3rseradJXLbSGIuD+Zp3Vt4NbrhyRUL3BEoC3JyQRagi0zV90SYTweQrEUyQkk5C
 AVWffU2pA6gLvfaUVgUQf/vQCBTvAfX+FHqYoIUnEOxR4u6GsU26af/mOX9Tfjn4+qRCM1bVO7x
 0qeLSRiXHnUAkma7gFQ==
X-Proofpoint-GUID: ryh2kpd92jcJ1GlkApGsWo6479ZG5-5M
X-Authority-Analysis: v=2.4 cv=Ap/jHe9P c=1 sm=1 tr=0 ts=69ce425f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RlaAdA2wXV2HMp-xn2gA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_031809_028109_EA92084B 
X-CRM114-Status: GOOD (  33.68  )
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



On 4/2/2026 5:28 PM, Songwei Chai wrote:
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
>   drivers/hwtracing/qcom/tgu.c                  | 193 ++++++++++++++++++
>   drivers/hwtracing/qcom/tgu.h                  |  51 +++++
>   7 files changed, 277 insertions(+)
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

depends on ARCH_QCOM || COMPILE_TEST
depends on ARM_AMBA

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

pm_runtime_enable is called in amba_probe, and amba_probe calls 
pm_runtime_put_noidle only when tgu_probe succeeds. We need call the 
pm_runtime_put in error path to reset the runtime refcount.


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

nit: wrong indent here (you can check in vim)

Thanks,
Jie

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


