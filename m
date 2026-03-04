Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CBAEDEC13
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 05:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qt/HtlB2bl3WqSWGBiy3e0LJSkBn9/Il23j6YIhRm+4=; b=Lq3dBlJKm6oszthtHNGubdpgL9
	M/37xfHS3zdP+r01kSbC7CIAj2JEUzfHUCALGjeAyCH6qs9NI06e7vwdBHEaKrAXnE8NUI8X8eRCK
	jfMZWdR8ZOc7+qMHg8yGCnsQJqU6YB9nGTnlFc97GsnfFoSUIX9fUkhVFlsS5Fc0In6uV45/9eo0w
	9CLPTTv2m7LJEaepykj5Ix6UFaDbul7oFYeiL+4s94OwUs3bzxicFBRw6pMM/abaSiyhYnNf0FUmo
	DQ6ZtcpSgoTdRZ4zhNzI6wB7v5pnDripmlSKNwLNBSTaMH5hbEuWFCc6+V2LPSEORLC08SjHsi3xn
	7CMDm1/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxezY-0000000GUfe-2tdq;
	Wed, 04 Mar 2026 05:41:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxezW-0000000GUey-1nnF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 05:41:51 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SsVV3110945
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 05:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qt/HtlB2bl3WqSWGBiy3e0LJSkBn9/Il23j6YIhRm+4=; b=Hnr/iguj6k1fVonc
	PMAh9YyYKduzxadaY/AQVRXix8kVklW20hbfs4s9mODekG0CB1q+tK+nwdzpG4tv
	CALIf/u+fFnncbs27+mzPwYkkLo10pZOh13kktkNVjony2scj/G2CTSNxLxYSs9V
	SciVKIbgmDOOXBeSO11pQXJyK4fjPh00JmzqmZ/sC82DDg/6WA8jp+CysQv7GG0e
	h11vKx2xJWXE9EuRanpgJqdxzmtLu5GErLbIYi7/bsTXCJT3ytr5+SxDUwULFcAi
	0EjgyKuJL9NlwZhkARQXP+HZMQES8LDxBBeR3SGt9l/R1WFlXdebYVCSqVbM4TPL
	be8xTQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp5h29tse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 05:41:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2be27d4e3e5so19597766eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 21:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772602909; x=1773207709; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qt/HtlB2bl3WqSWGBiy3e0LJSkBn9/Il23j6YIhRm+4=;
        b=fX2zJXMFs/NCp7bf1MJSmKODSx6QogyyoDVJEGyZlkQYe3aUy7OWD7zFmBoGcjoDsg
         kJaKbS4PVqrvaIshNoUDaMp4kfFViU1plCyAYUmX4SX1UjqcB8xQjcZgKDuvw0ghtG45
         9OO0sNz9e/whNPtY/l/YbpJSaMIL4S2w0pX6lpCra3p1CAmGAbUe0w1UTbczke9qdqGm
         i9rGLhhc38u5+c5uAWUxxNCSpFs1Xx+c6I0YK2sGxTGfaRWBu93NLAxhIrVVtUmarhCZ
         3WHSeXtjw7eH0VQ5YFmXl64XBbHv+TpoueeLG540wA+ktI1NMvrEqBQ2JO81uW/r3019
         kftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772602909; x=1773207709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qt/HtlB2bl3WqSWGBiy3e0LJSkBn9/Il23j6YIhRm+4=;
        b=nG+tFvrnefMnZ9E0KQAu2LvlWDl4DaBXSbParrUZB9LYzH6Jf+Vl+IWPvT3zrMBlOD
         7i7qfHmm76gOsmxfHXG1afPtq1M9s5ENmwqrZ5Cth7GVbZJlWQS+Dbru0oB9atIu2RbH
         ZrmBMbhQshwVrpiJ6rt0m9KkUCuVJKoyNpKSVmkYLidADPVsBRZ92OLd18AUCHEiT5dQ
         /j03IkRtNQQAELvsSNQdGhCP56W9yNoSA6JysvMSQP05LCCd7dPaG35sltrDXLmpaaBK
         VupTbw/w17Q7OVXNbA+KxzJfEjSg7ax6z8qx3ypMTG0rMN2HwNCnn8WZadCW+xzyBP01
         hzPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBJv8LXfRgI6gVlsYNDc077LeS7BX7/9edbIgHmht/WuUP5uxAxV8cxzGravwq9BDouQqqoDbS/aOO/U+vW8Is@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+i4ffS+QaF90EoBz1r1S9rFZhJ5LH0H6BsgtZM5g5f+pxyN7t
	w8jofhsQSwrhh8DrluWzP6lYUYZKN+RLbmycP/R5Z72CTKRkMcPCn2k64aIlkt4Rmu9mIEfRFMV
	grhzLn7dCAT6gWiq62SnpkPjAw3XGBCiX8ABMzdCxbcF5rJlON5qyMZCqbgDfnlgnqRn6NsMhC+
	AFzQ==
X-Gm-Gg: ATEYQzzG6seFoOEI9Qj6wnEafzzmy6umE9ES2obNFYcSR7cF3v5sLjzlmhWUOJJaYY3
	zZBlEpFCndY2nfG0wOuN3h8lqtYL8WjuaRlwKFqqqX7qiqx/dz0UP9UYSlHpXns1sRAwughvkQn
	7hiEiUhToOuyzaBjkNR9slm40WKVy8WAMfqzfJ+lUbpYwkl3SCrO6+PisoPZMmHwvl9uZWnWdwZ
	Tab/vZt9aKimgJNxPjo87Wnk9T/i0ibkPpwmA9fqJnyoZg4c0W8mmN68OQbQ956OJhLN7otfWEk
	Pzdq1XJ9GRR7qve8J2l6q7be2ZaoqwvjAAKtdSzJ/QfKJhtX2zMbcUcpIxtU938TktHy7AX17kP
	ePXLiW3QSpVeZBeXGOqbOHxpdN+iJKA22HOg52SYlnvpFrkSsqYNU+pc=
X-Received: by 2002:a05:7301:1292:b0:2b8:30b8:58cf with SMTP id 5a478bee46e88-2be30fccf2fmr316307eec.8.1772602908971;
        Tue, 03 Mar 2026 21:41:48 -0800 (PST)
X-Received: by 2002:a05:7301:1292:b0:2b8:30b8:58cf with SMTP id 5a478bee46e88-2be30fccf2fmr316277eec.8.1772602908364;
        Tue, 03 Mar 2026 21:41:48 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be1731b6b6sm6231081eec.5.2026.03.03.21.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 21:41:47 -0800 (PST)
Message-ID: <dc5191d0-831e-4da1-b498-da41a57b30b3@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 21:41:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] clocksource/drivers/timer-mediatek: Convert
 timer-mediatek to a loadable module
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>, daniel.lezcano@linaro.org,
        tglx@kernel.org
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com,
        walter.chang@mediatek.com, jstultz@google.com, amergnat@baylibre.com,
        aisheng.dong@nxp.com, jindong.yue@nxp.com, xuegang.liu@nxp.com
References: <20260304025720.2583655-1-zhipeng.wang_1@nxp.com>
 <20260304025720.2583655-4-zhipeng.wang_1@nxp.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260304025720.2583655-4-zhipeng.wang_1@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69a7c61d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=mpaa-ttXAAAA:8 a=QX4gbG5DAAAA:8 a=IpJZQVW2AAAA:8 a=8AirrxEcAAAA:8
 a=JS8otC1fTDAvhBOTJEIA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=IawgGOuG5U0WyFbmm1f5:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: slBt5HzPqk0dnzB_lQpnu9foHabhFqI7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA0NSBTYWx0ZWRfXwcIYIfoJPGp+
 W2SARwsg0VShmG4rOwD4FU2nDZDWoB36axoS2iJ6FLiHDRvefFxAMShFxG5DfBW0p0eZoUnkViB
 gpdi0NHHjAyivJdkaZFU0d/q8T3eehm1SoqSDRVE2MyyealrKbDR2L7QJbesVsz7Np6QwaK7jxB
 I2QQw8nNfgbrh4b9n9FSAaGWaPgUlAiH53UDlVuODCanBXW8KkGtzUsD6hPLNGMawyYZxxeLqZ3
 QpnOxW42+p/er9L6RdDQ8jSpvL0dtrD1vnCWB2GnL1hba+l8K4+FJt834kzyzwF+QuiYLbDub6M
 RYTA4cZqVS2s9zDr/MP/PYqlPVwLtHOMjLyNM9b28q8EzeauzzlxNupMdowIa86Mt+f0tMWKSI+
 BF2AXz/HIy9otUp9G+2DD9yly1Uqbjv3VJEe+g9dC9T78ZCW/61qW8nmbNFgd0wYZTuGxBd0a/m
 bt2ANjiEvX+xTLR+xcg==
X-Proofpoint-GUID: slBt5HzPqk0dnzB_lQpnu9foHabhFqI7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_214150_476825_146B865D 
X-CRM114-Status: GOOD (  26.77  )
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

On 3/3/2026 6:57 PM, Zhipeng Wang wrote:
> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> 
> Convert the timer-mediatek driver into a loadable module so that
> it can register an always-on timer as the tick_broadcast_device on
> MediaTek SoCs. This helps support GKI modular configurations.

You have expanded GKI in the cover letter but not in the commit text. 

Please add that in the commit text since this patch will be committed
and not the cover letter. 

> 
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> Signed-off-by: Walter Chang <walter.chang@mediatek.com>
> Tested-by: Walter Chang <walter.chang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---
>  drivers/clocksource/Kconfig          |  2 +-
>  drivers/clocksource/timer-mediatek.c | 33 ++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index fd9112706545..2112efb85029 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -488,7 +488,7 @@ config SYS_SUPPORTS_SH_CMT
>  	bool
>  
>  config MTK_TIMER
> -	bool "Mediatek timer driver" if COMPILE_TEST
> +	tristate "MediaTek timer driver"
>  	depends on HAS_IOMEM
>  	select TIMER_OF
>  	select CLKSRC_MMIO
> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> index 7bcb4a3f26fb..4ad4bac6f34b 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c
> @@ -13,6 +13,9 @@
>  #include <linux/clocksource.h>
>  #include <linux/interrupt.h>
>  #include <linux/irqreturn.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
>  #include <linux/sched_clock.h>
>  #include <linux/slab.h>
>  #include "timer-of.h"
> @@ -337,5 +340,35 @@ static int __init mtk_gpt_init(struct device_node *node)
>  
>  	return 0;
>  }
> +
> +#ifndef MODULE
>  TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
>  TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
> +#else
> +static int mtk_timer_probe(struct platform_device *pdev)
> +{
> +	int (*timer_init)(struct device_node *node);
> +	struct device_node *np = pdev->dev.of_node;
> +
> +	timer_init = of_device_get_match_data(&pdev->dev);
> +	return timer_init(np);
> +}
> +
> +static const struct of_device_id mtk_timer_match_table[] = {
> +	{ .compatible = "mediatek,mt6577-timer", .data = mtk_gpt_init },
> +	{ .compatible = "mediatek,mt6765-timer", .data = mtk_syst_init },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver mtk_timer_driver = {
> +	.probe = mtk_timer_probe,
> +	.driver = {
> +		.name = "mediatek-timer",
> +		.of_match_table = mtk_timer_match_table,
> +	},
> +};
> +module_platform_driver(mtk_timer_driver);
> +
> +MODULE_DESCRIPTION("MediaTek Timer driver");
> +MODULE_LICENSE("GPL");
> +#endif


