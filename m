Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE65F36BAB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 04:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gjvfB6ViIeqLmxqdKoY4HIdEoLvd2lEuXpKY9gSrpI=; b=u48Iergd5cTF6pQ1Jtt2O9BYPu
	vObFQIL3ken/DuhoGURwOOZnBg+mdsJQPKIL7djA0UoFlevnTazPX7EZ1XxTGrPGjIE6Sg8+/GB07
	MNLfeyb6Cvh8gd01VJN61dkKBieI1NdhUEq+F4YQ5M837hOdnUj7yhmLhowarUShdeEXkuAT0d3Dc
	tsnvJtYYkwToJ/ewNNXo2f0N2VuqPkjkF+3MEuoh6ui4tfAhkr2Jll2rFNboT/orQWgpD3AFlvt8v
	t86v2fYsSFLg2BwKCn9cDAEERmJZOyaH2LAucD7AzYhYU5uGgi1drhcRfluf0Kq1QEx11/am5aI7c
	uCdx9SRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB3nC-0000000BbMs-1x4a;
	Fri, 10 Apr 2026 04:48:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB3n9-0000000BbLr-2Atp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 04:48:28 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KUFTZ1433178
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 04:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1gjvfB6ViIeqLmxqdKoY4HIdEoLvd2lEuXpKY9gSrpI=; b=e11/9Q5Nd7IN1JXO
	J4waBqq9PNngRjCr53i0vK5IrofDUCHlGpSWHx/U4w0J8nIL3nT0ycYNYPzgEKQB
	oukBTDE92lzw6jiiLm2ccOUjWZbuC/8deadQ3KhjJLnaguLnEMCZsXkCUqM0kOg+
	R3GM+XKrwCZTRW0Drvo596qoSvdGkRjz12JTml5oX0/kiGyWc5e+YB4j4T+2SX6k
	SkuStwmqmYGWbJJ8vJ/kMuhLf8tQ2V8SLAQ+ltiFRx59B80GNozcWrnguDsAVC36
	bDjGIrE7T+RT8gmtHJu/8wtPkGpnKhTF6AfsmczTmzPYLlJBDEPb2b1iRmv/3her
	EHyuNg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckfarcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 04:48:25 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c89d4ce16so1174598b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 21:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775796505; x=1776401305; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1gjvfB6ViIeqLmxqdKoY4HIdEoLvd2lEuXpKY9gSrpI=;
        b=LRdcUlGthtgVFMNEVniXijgQbqidBmqX8u6zKRjVJX2sVNuBXIXGOvg7C5Qilr+4g/
         raEOo9GIGFTVANyyUBslr0WrWb6IgzqelbALb86Yko49dKbgRrDXPQsAHTKdA9lRfI2X
         W0x/KgIolqEo2Clf3Dy6R9IyNBoZKihqHRmcIcX8mxObhN7yFRco6sqAdk5T9RruyD+v
         povm4f1nyxYT1QBM43twDKxa20ItOn5vsvtoWIRiTw3iwm+otlHED4K8SHya5kADiVCe
         481B6WKF1Hq1+QDT8jj6CeubW7xybL2cMyXtKNtqh62nsqCTv3mJF1gfZQDWd75vRHZd
         agvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775796505; x=1776401305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gjvfB6ViIeqLmxqdKoY4HIdEoLvd2lEuXpKY9gSrpI=;
        b=KfFoOKcz2ot1wfzOZW6lWqQlDqrLn5uKbuvp71WsjklqyWktiUJbBLyFysxWcnav/w
         H22HCfD16a0eL7BA1A0be4MMsQNnKVSTayevGYp8JggRcJxQqbnJasTZMYkvOVGktGbz
         WQf422kDEAoGq+Iv4iNFFEmOrxyNAoEr5s3fGnoojOsSQ0AjF9Vn/skJMXMjuyZDdu5R
         pr8AnAXRXXFYGwcBG123K+afGpYNnRNHMDOsZxsK16VZK9kxCUtzVAVxsSvcHso/ofmc
         cOmW6TV8wj8ze7Oq6s1lxYRCHIdKnOiVxFFENxy5+2KFKGVzKsGwDebxmh1Bi/Ja8XnQ
         O7Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXzSfhoAIg7QCwArL3iaV6X7JPMGqhUUUy/Eq/m1KMkjwf65G98y9xVskJR1xwgAZz1sgaj6mp8EHQ8lU8TZQ1w@lists.infradead.org
X-Gm-Message-State: AOJu0YzIzbWWwUpRQQa2aoke2yorNdnqkZpyFfw3Vgtu78AjoZlL9h8Y
	1QTQ9SzgOQHZr1Ho21Zv3zgMEYQl80LZM+/0wNJsiHeIZGwu4Dr5Egwj+jYJsf1rudhyXyEvW0M
	SfzQTbrCIbTnGioRxatN/YWhKy5XNKIthqGCBdH3h1RmW9BFPTqXmuDVBlLdK99h6IDJbYFj+gz
	l4vQ==
X-Gm-Gg: AeBDietq9HceIB9bcIZaXxqZKdcJrs4KFHaoCJ5hcUKWNivSiW6QmIJBwhUHZTBbELb
	Ck24Kd4iYRibQGgPjOXOnWJKFgORvtRYh6dhRs6VAx+ZqNTpgJ+Y4f7hoI8v9CTr3lmHUw1Ql/q
	WkOC+Cd7b2EK23WI6KmfVXHlCNWD8aZHH5LrE1G1WkUdzCqZR8aaFceZ9KpigD7rZ6nxyheoMFK
	UHZSoHtauSbm0WtV2pY0NA4lt3vbSPr40wZZcV8y7TQqZtA5uxW0HPkwojIt9jWZ7I6G75n6ksh
	mFyd2k1urTDDKd7aJclmoD+Qsy2U7DURd26ZUSURtpXEtR5j/ILIuohg/aSRjxb+fcBWc5e7swb
	0QUg/wu5uORuviSUWMoBTCu6ULLkBuTL3anZt2LtuITof+0DxFJqLPCcH/kI816BFYN5ja2ZIWv
	sT/blKs/Yylg==
X-Received: by 2002:a05:6a00:f0a:b0:81f:4884:4fed with SMTP id d2e1a72fcca58-82f0c24e21emr1813458b3a.7.1775796504558;
        Thu, 09 Apr 2026 21:48:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:f0a:b0:81f:4884:4fed with SMTP id d2e1a72fcca58-82f0c24e21emr1813419b3a.7.1775796504014;
        Thu, 09 Apr 2026 21:48:24 -0700 (PDT)
Received: from [10.133.33.62] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4b3dc2sm1278206b3a.34.2026.04.09.21.48.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 21:48:23 -0700 (PDT)
Message-ID: <c7706c41-d855-4ed4-92c4-dca43c8f6d2a@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 12:48:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] clk: qcom: videocc: Add video clock controller
 driver for Eliza
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-4-bc0c6dd77bc5@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-4-bc0c6dd77bc5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/fpBosP c=1 sm=1 tr=0 ts=69d88119 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JKCxmoqLevzGYRfko-YA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA0MSBTYWx0ZWRfX3LcTNCC6JUcx
 rUhfWgpm478VTN0ubBOrJfbtrp0Lo26odQek9wXDTYGWGbU+5puEyStxJ1++WXB2qOn8ofua9gz
 Ar0amWe3sU+sUqcUqH754wWH6HF9wjElHh772qoSYMqXmMK57dHIfFm+6vVjLO4pN5yVuuc6KO7
 +t3mBaQ57jgwvxbZexeLFej6tgqm6HK1f1Yd+P3Ca3xVUfPx4xv3Aq95yvHg7GuFoTrcgqDskFv
 +2Ojv4iEw8LSOLxyPNh8BG03tNB2T/i6MrWF3QUMg8Umf4Zr5Mhj96irDT21lbmxPJD9/8Q2MEX
 oS/ip4u94/0gGpXiQpyJJChq1d0TYYzhj1Ja6ot+aOmO27x8ihB3imzezl4f2vjRPXRWvEAOieJ
 GZ4cn2ZqO6srTpMo99+yvase/nZ4V/cyK3/l+gp3mdwADrkX5ppiwzPfmJEIgqzgTJ15yC4SEWp
 vR09iH0U57Be59dMWZg==
X-Proofpoint-ORIG-GUID: NrXyA5DAkr62R-Kvse-Z19rQYn8--gzj
X-Proofpoint-GUID: NrXyA5DAkr62R-Kvse-Z19rQYn8--gzj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_214827_693622_2D9BCCAB 
X-CRM114-Status: GOOD (  26.18  )
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



On 4/10/2026 2:10 AM, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Eliza platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>   drivers/clk/qcom/Kconfig         |   9 +
>   drivers/clk/qcom/Makefile        |   1 +
>   drivers/clk/qcom/videocc-eliza.c | 403 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 413 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 22eb80be60ad3bde897f2c507ac9897951fbb8fe..4b0d40a38a6328fe9c41ebb15ae6821012223920 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -45,6 +45,15 @@ config CLK_ELIZA_TCSRCC
>   	  Support for the TCSR clock controller on Eliza devices.
>   	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.
>   
> +config CLK_ELIZA_VIDEOCC
> +	tristate "Eliza Video Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select CLK_GLYMUR_GCC

Hi,

My bot found a [BUG] here, please ignore it if it's a false positive issue.

CLK_ELIZA_VIDEOCC selects CLK_GLYMUR_GCC instead of CLK_ELIZA_GCC

- select CLK_GLYMUR_GCC pulls in gcc-glymur.c instead of gcc-eliza.c
- On an Eliza system, gcc-glymur.c will never probe (no matching DTS 
node), so GCC_VIDEO_AHB_CLK from the Eliza GCC will never be available 
to videocc
- The videocc driver's clocks = <&gcc GCC_VIDEO_AHB_CLK> will fail to 
resolve at runtime
- The correct fix is select CLK_ELIZA_GCC, consistent with all other 
Eliza clock controllers

Thanks,
Jie

> +	help
> +	  Support for the video clock controller on Eliza devices.
> +	  Say Y if you want to support video devices and functionality such as
> +	  video encode and decode.
> +
>   config CLK_GLYMUR_DISPCC
>   	tristate "Glymur Display Clock Controller"
>   	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index b818fd5af8bfb85a51ee90fdc3baa93af30dc39a..e7e239c5a0d088b2e78354bf421d871a4e4e6d9d 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -23,6 +23,7 @@ obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
>   obj-$(CONFIG_CLK_ELIZA_DISPCC) += dispcc-eliza.o
>   obj-$(CONFIG_CLK_ELIZA_GCC) += gcc-eliza.o
>   obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
> +obj-$(CONFIG_CLK_ELIZA_VIDEOCC) += videocc-eliza.o
>   obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
>   obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
>   obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
> diff --git a/drivers/clk/qcom/videocc-eliza.c b/drivers/clk/qcom/videocc-eliza.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..cb541cfec50c12761251a822e32094e763922cdb
> --- /dev/null
> +++ b/drivers/clk/qcom/videocc-eliza.c
> @@ -0,0 +1,403 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,eliza-videocc.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "clk-regmap-mux.h"
> +#include "common.h"
> +#include "gdsc.h"
> +#include "reset.h"
> +
> +enum {
> +	DT_BI_TCXO,
> +	DT_SLEEP_CLK,
> +	DT_AHB_CLK,
> +};
> +
> +enum {
> +	P_BI_TCXO,
> +	P_SLEEP_CLK,
> +	P_VIDEO_CC_PLL0_OUT_MAIN,
> +};
> +
> +static const struct pll_vco lucid_ole_vco[] = {
> +	{ 249600000, 2300000000, 0 },
> +};
> +
> +/* 576.0 MHz Configuration */
> +static const struct alpha_pll_config video_cc_pll0_config = {
> +	.l = 0x1e,
> +	.alpha = 0x0,
> +	.config_ctl_val = 0x20485699,
> +	.config_ctl_hi_val = 0x00182261,
> +	.config_ctl_hi1_val = 0x82aa299c,
> +	.test_ctl_val = 0x00000000,
> +	.test_ctl_hi_val = 0x00000003,
> +	.test_ctl_hi1_val = 0x00009000,
> +	.test_ctl_hi2_val = 0x00000034,
> +	.user_ctl_val = 0x00000000,
> +	.user_ctl_hi_val = 0x00000005,
> +};
> +
> +static struct clk_alpha_pll video_cc_pll0 = {
> +	.offset = 0x0,
> +	.config = &video_cc_pll0_config,
> +	.vco_table = lucid_ole_vco,
> +	.num_vco = ARRAY_SIZE(lucid_ole_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_pll0",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_lucid_evo_ops,
> +		},
> +	},
> +};
> +
> +static const struct parent_map video_cc_parent_map_0[] = {
> +	{ P_BI_TCXO, 0 },
> +};
> +
> +static const struct clk_parent_data video_cc_parent_data_0[] = {
> +	{ .index = DT_BI_TCXO },
> +};
> +
> +static const struct parent_map video_cc_parent_map_1[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_VIDEO_CC_PLL0_OUT_MAIN, 1 },
> +};
> +
> +static const struct clk_parent_data video_cc_parent_data_1[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &video_cc_pll0.clkr.hw },
> +};
> +
> +static const struct parent_map video_cc_parent_map_2[] = {
> +	{ P_SLEEP_CLK, 0 },
> +};
> +
> +static const struct clk_parent_data video_cc_parent_data_2[] = {
> +	{ .index = DT_SLEEP_CLK },
> +};
> +
> +static const struct freq_tbl ftbl_video_cc_ahb_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 video_cc_ahb_clk_src = {
> +	.cmd_rcgr = 0x8018,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = video_cc_parent_map_0,
> +	.freq_tbl = ftbl_video_cc_ahb_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_ahb_clk_src",
> +		.parent_data = video_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
> +	F(576000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(633000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(720000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(1014000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(1098000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(1113000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(1332000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(1600000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 video_cc_mvs0_clk_src = {
> +	.cmd_rcgr = 0x8000,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = video_cc_parent_map_1,
> +	.freq_tbl = ftbl_video_cc_mvs0_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_mvs0_clk_src",
> +		.parent_data = video_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_video_cc_sleep_clk_src[] = {
> +	F(32000, P_SLEEP_CLK, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 video_cc_sleep_clk_src = {
> +	.cmd_rcgr = 0x8110,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = video_cc_parent_map_2,
> +	.freq_tbl = ftbl_video_cc_sleep_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_sleep_clk_src",
> +		.parent_data = video_cc_parent_data_2,
> +		.num_parents = ARRAY_SIZE(video_cc_parent_data_2),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 video_cc_xo_clk_src = {
> +	.cmd_rcgr = 0x80f4,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = video_cc_parent_map_0,
> +	.freq_tbl = ftbl_video_cc_ahb_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_xo_clk_src",
> +		.parent_data = video_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_regmap_div video_cc_mvs0_div_clk_src = {
> +	.reg = 0x80ac,
> +	.shift = 0,
> +	.width = 4,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_mvs0_div_clk_src",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&video_cc_mvs0_clk_src.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_regmap_div_ro_ops,
> +	},
> +};
> +
> +static struct clk_regmap_div video_cc_mvs0c_div2_div_clk_src = {
> +	.reg = 0x8058,
> +	.shift = 0,
> +	.width = 4,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_mvs0c_div2_div_clk_src",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&video_cc_mvs0_clk_src.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_regmap_div_ro_ops,
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs0_clk = {
> +	.halt_reg = 0x80a0,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.hwcg_reg = 0x80a0,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x80a0,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs0_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_mvs0_div_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs0_shift_clk = {
> +	.halt_reg = 0x8144,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.hwcg_reg = 0x8144,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x8144,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs0_shift_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_xo_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs0c_clk = {
> +	.halt_reg = 0x804c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x804c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs0c_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_mvs0c_div2_div_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs0c_shift_clk = {
> +	.halt_reg = 0x8148,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.hwcg_reg = 0x8148,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x8148,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs0c_shift_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_xo_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct gdsc video_cc_mvs0c_gdsc = {
> +	.gdscr = 0x8034,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0x6,
> +	.pd = {
> +		.name = "video_cc_mvs0c_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +};
> +
> +static struct gdsc video_cc_mvs0_gdsc = {
> +	.gdscr = 0x808c,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0x6,
> +	.pd = {
> +		.name = "video_cc_mvs0_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &video_cc_mvs0c_gdsc.pd,
> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL_TRIGGER,
> +};
> +
> +static struct clk_regmap *video_cc_eliza_clocks[] = {
> +	[VIDEO_CC_AHB_CLK_SRC] = &video_cc_ahb_clk_src.clkr,
> +	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
> +	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
> +	[VIDEO_CC_MVS0_DIV_CLK_SRC] = &video_cc_mvs0_div_clk_src.clkr,
> +	[VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr,
> +	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
> +	[VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC] = &video_cc_mvs0c_div2_div_clk_src.clkr,
> +	[VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr,
> +	[VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
> +	[VIDEO_CC_SLEEP_CLK_SRC] = &video_cc_sleep_clk_src.clkr,
> +	[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
> +};
> +
> +static struct gdsc *video_cc_eliza_gdscs[] = {
> +	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
> +	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
> +};
> +
> +static const struct qcom_reset_map video_cc_eliza_resets[] = {
> +	[VIDEO_CC_INTERFACE_BCR] = { 0x80d8 },
> +	[VIDEO_CC_MVS0_CLK_ARES] = { 0x80a0, 2 },
> +	[VIDEO_CC_MVS0_BCR] = { 0x8088 },
> +	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x804c, 2 },
> +	[VIDEO_CC_MVS0C_BCR] = { 0x8030 },
> +	[VIDEO_CC_XO_CLK_ARES] = { 0x810c, 2 },
> +};
> +
> +static struct clk_alpha_pll *video_cc_eliza_plls[] = {
> +	&video_cc_pll0,
> +};
> +
> +static u32 video_cc_eliza_critical_cbcrs[] = {
> +	0x80dc, /* VIDEO_CC_AHB_CLK */
> +	0x8128, /* VIDEO_CC_SLEEP_CLK */
> +	0x810c, /* VIDEO_CC_XO_CLK */
> +};
> +
> +static const struct regmap_config video_cc_eliza_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = 0x9f50,
> +	.fast_io = true,
> +};
> +
> +static struct qcom_cc_driver_data video_cc_eliza_driver_data = {
> +	.alpha_plls = video_cc_eliza_plls,
> +	.num_alpha_plls = ARRAY_SIZE(video_cc_eliza_plls),
> +	.clk_cbcrs = video_cc_eliza_critical_cbcrs,
> +	.num_clk_cbcrs = ARRAY_SIZE(video_cc_eliza_critical_cbcrs),
> +};
> +
> +static const struct qcom_cc_desc video_cc_eliza_desc = {
> +	.config = &video_cc_eliza_regmap_config,
> +	.clks = video_cc_eliza_clocks,
> +	.num_clks = ARRAY_SIZE(video_cc_eliza_clocks),
> +	.resets = video_cc_eliza_resets,
> +	.num_resets = ARRAY_SIZE(video_cc_eliza_resets),
> +	.gdscs = video_cc_eliza_gdscs,
> +	.num_gdscs = ARRAY_SIZE(video_cc_eliza_gdscs),
> +	.driver_data = &video_cc_eliza_driver_data,
> +};
> +
> +static const struct of_device_id video_cc_eliza_match_table[] = {
> +	{ .compatible = "qcom,eliza-videocc" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, video_cc_eliza_match_table);
> +
> +static int video_cc_eliza_probe(struct platform_device *pdev)
> +{
> +	return qcom_cc_probe(pdev, &video_cc_eliza_desc);
> +}
> +
> +static struct platform_driver video_cc_eliza_driver = {
> +	.probe = video_cc_eliza_probe,
> +	.driver = {
> +		.name = "videocc-eliza",
> +		.of_match_table = video_cc_eliza_match_table,
> +	},
> +};
> +
> +module_platform_driver(video_cc_eliza_driver);
> +
> +MODULE_DESCRIPTION("QTI VIDEOCC Eliza Driver");
> +MODULE_LICENSE("GPL");
> 


