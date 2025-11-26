Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42ECCD1036D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 00:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+ATSEVV4P+08/zo6XOpCds2blOX1FJN+IVhYsTLJEk=; b=I4eVEXbEYlCdpMilo8MHIUXH+C
	X0I4pV75qjaGHhaThyEVWePt2fC3HNORsxcFSix1z4uMlChlXIt440lBpeoLf3I/TyZZM9JqfGHFe
	72HvY0H4zJq72NZIDG9TXQukj6vNrkMPOBH/vbdn/LAwWJHkfW6XBJGfO6u/wNyPUSa+qT0YfvvRK
	gGsrSvm7vy9BZ28GX6qaMY1+/v2K+mvTC9Vz7wm/UENFHi2H5Jh/gW/JSEq4wagx20Cvp0fBM1wTO
	2beVtKJGFzxLFKOBXM/5s6O3YtcAMeTjDv1+vzMZrfQ+LVRD3WYOXR0dqJrY5Ed7gDUp45S1CsQd0
	hzUAteEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO36P-0000000E6f7-03KL;
	Wed, 26 Nov 2025 00:09:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO36M-0000000E6ek-1Y6Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 00:09:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APHAjcP3890412
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 00:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b+ATSEVV4P+08/zo6XOpCds2
	blOX1FJN+IVhYsTLJEk=; b=j/soigBmdQMNHS/DAD9D56Z/RhLjJb9B1La9FSXI
	NPNkArZrh1eIs8C+I4QWTIDTeV02bSqDZ58BQDDRBdUyRqTa8oWGGdlI8dukJM0w
	CyqVTv2dmxBV2hWgb/UFyBgwliuDQyHGZnOvVld5+PXz/Yc51zsOagn0fxV2qLbV
	ibEbOFrs8ngTnmkXb48J85KpOv1Gy+2TaNuPIuPDV0jg2oX6VTmBs/8Dx2yzf9wX
	3VL769+luAc64S9x6BmEWnJKSNdRp3YSELnyv8M16gYVFqU0w3i1eiHd7WngZAWq
	AFhj2wbIaB/XG3LOKP1gHQOmvuBFKFwvQm2JmQ4sqD6lUQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angme8x3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 00:09:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b259f0da04so1589250885a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 16:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764115780; x=1764720580; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b+ATSEVV4P+08/zo6XOpCds2blOX1FJN+IVhYsTLJEk=;
        b=L49uSpTqMnd7sVQpWoC61efVWH7Ds9IIVcpFW0Qlyn7Y1w6wvzA33XsM619YpAcRKi
         6ew0RlntjJ4o3l0pcAjzSgaBX/sIPkVHxyZcPof4Jka8krw/YptKQZ9fglTFeE55wrT6
         fqgjZttDBZVE1g/8q32PmrpQhSCTEVQexueOkIQhywa3nGqbM8DMMRs55pXzwb2wx+PH
         RcePhMOkAP7kwOfv7GbnP1Q2IcyBsUaXvEo4rB/vjPQ9GGZmXw9IQK2meCffbqv/Kqlj
         CIW1hyABWHEjauA+m8ITjYe6SfjSJfz73wTIdSWpZz94G2aUtz/BFGfCx+SWHY9vSDBe
         yOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764115780; x=1764720580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+ATSEVV4P+08/zo6XOpCds2blOX1FJN+IVhYsTLJEk=;
        b=NzT9xC1Yo3xwKg4tnkvL/lljLe78QjsIuTYMMi14PW6AuH49FY4PXJ6llBqtr2MZNN
         0JVJsmUXTWCo5RalM18ysYQBtOdOAgN7Q+t28G1yQNrWgam3gfdmewHlTQnmbH3f8YiB
         QQxKWqMi1DhMO1bhV6RJx3PEjmBqSDyXroVobvZatsOihWsTdLuBGWpC84HGGRlTgnlS
         1xFmEcB/YUTiLgEEpzjG5N4KBF8ZolwT5c6eXE9857iB9rN4jNfV9FZsACjictvLkcET
         1Kh7MU8MG11OSnKY83t7/ajbmNVJkKPT3K3mco1+FIPRt55+Ej3qf3HNYzGNqbMADiPy
         Cpgw==
X-Forwarded-Encrypted: i=1; AJvYcCVzgcPIrYlb7gjJUHf0qy/MqrC2ytZGqNEUpgEwETZQYZVa0RgMtcJmRrWgxV0Zdkv9vaal/v7brBRzuGEyjwfS@lists.infradead.org
X-Gm-Message-State: AOJu0Ywit1awQSqEGfrOE4Z6ORJs0ZKkbewpAe+3b/KrXe9WkHdHbA9W
	2TEeJPjoen3oOWPF2ba77HMM5Ybye5fkC2RlJOtRlrYUPGVMIbcXfvcbIhQo2QwQDI96dJyAb+c
	PfXlGZg9AVs5C3GN0uHJBB/8ahrWQwImjf1M26nW7SCPjY5Jc9NwC0VQEBz2t1lnJuthKG2pVYJ
	iewA==
X-Gm-Gg: ASbGncu4uY84cNskmOcl56av2yR0h0WxFaZMHXKaFwEDEUAXd+mWnd4isDjIDn1rJO5
	w2oKVf9KlxSoVPfhWS6CPBvsdNPqeNpCQ5Ds9IzoZYeDoMwldjn9rEnDWy0Fq57JfsgbWCvY1H9
	ZBSO/mGBfwDRN76/vdGBv/WFH6bcbEE8dpgLzVv1bMyihP+drcuIiOcVI7Nh0yE2QXhgX8I+6Le
	Xft3NHub6xS6pB44AETjC7HkUIo2WDxadZfkw0fK7A+zbc5y1AePh9uuyCXnRnqDwOCbFa1/e1Y
	BhobhANi+ymxshqlCvbLRiEHwOS9sCsoc8dfS6Rov05p1Mx2ms/p0Y+HLMVd18CZ7sF4GDeeHlP
	NdFo8k2If/oXEci3LV7cd0nmVJdSvpqFpqKZit4YnNId0JuawAl/taWaK+WQwioADKFj/9zOAD5
	H+DPEHR38wodDQwA7Qlc+gQlY=
X-Received: by 2002:a05:620a:f07:b0:8b2:eb79:d380 with SMTP id af79cd13be357-8b33d1b24ffmr2365547885a.5.1764115780543;
        Tue, 25 Nov 2025 16:09:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqMwCIj9jauJnl/IsvBUByU2zMoHt50S9NDQDNYt4LnWXnAr38CbQEpcue1dMnJM0/WkNb2g==
X-Received: by 2002:a05:620a:f07:b0:8b2:eb79:d380 with SMTP id af79cd13be357-8b33d1b24ffmr2365542385a.5.1764115779961;
        Tue, 25 Nov 2025 16:09:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db8d967sm5474329e87.43.2025.11.25.16.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 16:09:39 -0800 (PST)
Date: Wed, 26 Nov 2025 02:09:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 08/11] clk: qcom: dispcc: Add support for display
 clock controller Kaanapali
Message-ID: <w3ezxipjucswfswfg2z7b7uyu55bssqatdnbxa6jflii4j7nym@lxsnidrewepu>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-8-fb44e78f300b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-8-fb44e78f300b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=69264545 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Z2JA_5PlO6FJ_Fz2AdgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDIwMSBTYWx0ZWRfXwE3gwCgKhW1M
 63lDrKv1/FUznB67lMt+wxj1KMcCDXuuoPKoHmqu94Gjp9llM/pRyzNFg1udVfsC3NXoVt9Af2D
 celLZpOTsB1h4HUwlysp6juzPg50lY5iPafJmr+w27Z29FM/cAFuKrkbykdkvy1q+J1nVh3si6y
 GBegDmrMR2PmH8odgNWkvUO3NS0Cwy7QQNPG4gE0klTXAL3KgZLwjoCa39fHR1Tyc5XugJ6zjKd
 Ka82GlJDacMW2/CVJU0VdEcQJpE7u0phWIApvpYzRMN23BkE2GDwb7kRE1UsKmRt9mYvyshDY4P
 r603Pvfrs+AeEQx1pI5JH6Pbes6S9DxdpTCFZIA2AjtMPZVPw2FzGaBlmdHosKpUee0+BeQhGgN
 IiFAGr39rwwCTx52xAUUXHTvajbNEQ==
X-Proofpoint-GUID: Qjsvp6MeXUBFQhqEyrIl9skvL4VImxiO
X-Proofpoint-ORIG-GUID: Qjsvp6MeXUBFQhqEyrIl9skvL4VImxiO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_160942_526971_4127E96A 
X-CRM114-Status: GOOD (  27.98  )
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

On Tue, Nov 25, 2025 at 11:15:17PM +0530, Taniya Das wrote:
> Support the clock controller driver for Kaanapali to enable display SW to
> be able to control the clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig            |   10 +
>  drivers/clk/qcom/Makefile           |    1 +
>  drivers/clk/qcom/dispcc-kaanapali.c | 1956 +++++++++++++++++++++++++++++++++++
>  3 files changed, 1967 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index a284ba040b78ba2f7b7c7ead14023c0ec637f841..e293d1a816c2eece0291e9ee707698e97ed75cd8 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -46,6 +46,16 @@ config CLK_GLYMUR_TCSRCC
>  	  Support for the TCSR clock controller on GLYMUR devices.
>  	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
>  
> +config CLK_KAANAPALI_DISPCC
> +	tristate "Kaanapali Display Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select CLK_KAANAPALI_GCC
> +	help
> +	  Support for the display clock controller on Qualcomm Technologies, Inc
> +	  Kaanapali devices.
> +	  Say Y if you want to support display devices and functionality such as
> +	  splash screen.
> +
>  config CLK_X1E80100_CAMCC
>  	tristate "X1E80100 Camera Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 0ac8a9055a43230d848c6a0c1ac118c03c3e18d2..98ec8aeb5d5049855bb65f7371a10fb2418a468f 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
>  obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
>  obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
>  obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
> +obj-$(CONFIG_CLK_KAANAPALI_DISPCC) += dispcc-kaanapali.o
>  obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
>  obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
>  obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
> diff --git a/drivers/clk/qcom/dispcc-kaanapali.c b/drivers/clk/qcom/dispcc-kaanapali.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..baae2ec1f72aac04b265fb62433c75e9bd425d4d
> --- /dev/null
> +++ b/drivers/clk/qcom/dispcc-kaanapali.c
> @@ -0,0 +1,1956 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,kaanapali-dispcc.h>
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
> +#define DISP_CC_MISC_CMD	0xF000
> +
> +enum {
> +	DT_BI_TCXO,
> +	DT_BI_TCXO_AO,
> +	DT_AHB_CLK,
> +	DT_SLEEP_CLK,
> +	DT_DP0_PHY_PLL_LINK_CLK,
> +	DT_DP0_PHY_PLL_VCO_DIV_CLK,
> +	DT_DP1_PHY_PLL_LINK_CLK,
> +	DT_DP1_PHY_PLL_VCO_DIV_CLK,
> +	DT_DP2_PHY_PLL_LINK_CLK,
> +	DT_DP2_PHY_PLL_VCO_DIV_CLK,
> +	DT_DP3_PHY_PLL_LINK_CLK,
> +	DT_DP3_PHY_PLL_VCO_DIV_CLK,
> +	DT_DSI0_PHY_PLL_OUT_BYTECLK,
> +	DT_DSI0_PHY_PLL_OUT_DSICLK,
> +	DT_DSI1_PHY_PLL_OUT_BYTECLK,
> +	DT_DSI1_PHY_PLL_OUT_DSICLK,
> +};
> +
> +enum {
> +	P_BI_TCXO,
> +	P_DISP_CC_PLL0_OUT_MAIN,
> +	P_DISP_CC_PLL1_OUT_EVEN,
> +	P_DISP_CC_PLL1_OUT_MAIN,
> +	P_DISP_CC_PLL2_OUT_MAIN,
> +	P_DP0_PHY_PLL_LINK_CLK,
> +	P_DP0_PHY_PLL_VCO_DIV_CLK,
> +	P_DP1_PHY_PLL_LINK_CLK,
> +	P_DP1_PHY_PLL_VCO_DIV_CLK,
> +	P_DP2_PHY_PLL_LINK_CLK,
> +	P_DP2_PHY_PLL_VCO_DIV_CLK,
> +	P_DP3_PHY_PLL_LINK_CLK,
> +	P_DP3_PHY_PLL_VCO_DIV_CLK,
> +	P_DSI0_PHY_PLL_OUT_BYTECLK,
> +	P_DSI0_PHY_PLL_OUT_DSICLK,
> +	P_DSI1_PHY_PLL_OUT_BYTECLK,
> +	P_DSI1_PHY_PLL_OUT_DSICLK,
> +};
> +
> +static const struct pll_vco pongo_eko_t_vco[] = {
> +	{ 38400000, 153600000, 0 },
> +};
> +
> +static const struct pll_vco taycan_eko_t_vco[] = {
> +	{ 249600000, 2500000000, 0 },
> +};
> +
> +/* 257.142858 MHz Configuration */

This is a bit strange frequency for the boot config.

> +static const struct alpha_pll_config disp_cc_pll0_config = {
> +	.l = 0xd,
> +	.cal_l = 0x48,
> +	.alpha = 0x6492,
> +	.config_ctl_val = 0x25c400e7,
> +	.config_ctl_hi_val = 0x0a8062e0,
> +	.config_ctl_hi1_val = 0xf51dea20,
> +	.user_ctl_val = 0x00000008,
> +	.user_ctl_hi_val = 0x00000002,
> +};
> +

-- 
With best wishes
Dmitry

