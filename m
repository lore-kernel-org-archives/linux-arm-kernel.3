Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B44C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 07:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9HJ8w3GwKU3lFtzua7oGY3/YFZTlUiCBe66lb5hQc+E=; b=pJ5EmCzZC4plfvBujd6wlHfmFn
	YUbHoR/ErjRBZRF4W0dz9mWqnr/mpmXAzhD2YHMQcfvcGXETdnpSsrnCoB5TQ+VoOrS5M1TN67/F8
	iSK+YqeWpjSP3OfyReUuct9rIn7O0hosCIVOScWGXzN3r4bsV8Vv2oGfWn9z/cesWKxkx3Jb01NuG
	H0fgHb4LxfvaQ4x1atbQrfbbMu5VMde4XkOazbMg2gEI3YUUTSt6TP+eaVMpulBWvpqyQFWb7Xy/a
	Nt1jSyRdxuYQr/CiAMy8VhYe8EH9dwyDDyOKhFsWnnK8qFudqL+cKy1fnsQN7sD9ORfapt+VEH7fr
	3ia/sHsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPRy-0000000G9aQ-1tGy;
	Mon, 24 Aug 2026 07:50:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPRu-0000000G9a4-1SfR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 07:50:33 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O7j2qR1184461
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 07:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9HJ8w3GwKU3lFtzua7oGY3/Y
	FZTlUiCBe66lb5hQc+E=; b=Pi4kBKwZv+0DDj1vDL80B10QfAqAFdwXyk+h9BeI
	/ZO0kWes2gQwWAX6Z0h8q16zrNGYoJtujKO7xRQ84cI1z/BLjFBE1rJYZhd4U/6Y
	UnpnT06wBTxkxQFlgGQj97ds3/h7sLUUDwAnzDiotBr7EJ6sFOwlZ9JqsHmH4uxN
	SC1te349bWFJ8GuAxPPG3F7KNo2mnzY9QNPh2BMlT3AoQuAgjjnST6MTOqf7Mb9/
	HQhP/RTPemwqk0VC4ucoj9XeuwUlcmHIXaKtaBa1+ucda5qgLPR6yA2uNwz3drDF
	m8YWQe4NnqkOKwHrAXxqvZRahPNEeYhJAnc8vn/+jj3crw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf00pu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 07:50:29 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-74ab744f2c2so317138137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 00:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787557828; x=1788162628; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9HJ8w3GwKU3lFtzua7oGY3/YFZTlUiCBe66lb5hQc+E=;
        b=ZNSLb1l2y3wDMt9Axn485SfvGuLASZVkguRNaTpus5oSF8lFQVGBGMvsE8xK3x16sW
         HUVKMBcIOg78TBthSItMAwBzCQYu+obru0OpnWD4dO3+LsAraNrK2LuX2nNDptIncmFW
         wzOLObEHLqZ4T15KELFiEb5+iZ1/kn3GXCvRecrUArt/gALLRB7bRCwtqpJUvek7LGO0
         1rtvlS1RCy70gkPb5KcIViwM0Htp+3qGXaAxKclwIyD95nBwuFW4NenI8QDsrYjfww3r
         mhesMrCbcjfhX91bLFmyglB/Uf08/u4p/SrkXzNNu+diPxnm8ljcU6RvTk3Zns/PFi8/
         9y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557828; x=1788162628;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9HJ8w3GwKU3lFtzua7oGY3/YFZTlUiCBe66lb5hQc+E=;
        b=NnOc5i+yk69G1u5xW34b/g1Sqvnt1kTgJW7RyXa/kRPXarCaxoXKkCOgC7TFpfqDy3
         S3myepiFBzuvRfVVIT96Q7gBlVQyUx1ZL0f5rHtgQRJRN1dCvfpoMnczimA5KeuBg8Bq
         y4iEp1yGGqZGpnkW5VUUlOuzJ353zmE6xsj0EuAzk2G1a7WZTqnZPn06zxUEt0ddrb/T
         slw05b8XqbRuYGPIyRiL+kn16WZlK1KgIGaZPQgscljuL0xwA9rrwDsNf5fV9jkLhHEo
         zGVnhalI3RfKsQ1Tsaa5ro/YmOHSjGlgnh+gCtgZ7IMb9x/dDOxUlUl68VL2v1YHmAYW
         thUg==
X-Forwarded-Encrypted: i=1; AHgh+Ro1QV1YdQWGJJTVDxFsTNRGRN5lelA/nuEh1FfjBA9H10pxqGm2OeqUvwgnYwQJHtGG8hiNwvZZ+m7X634/qXp6@lists.infradead.org
X-Gm-Message-State: AFuF++m0/9bpppH6+gLT8Qx16oyRm6OSqIATsBhvZRhUt73p9XMUBAd1
	Sl/jUzVBJO/1GpBeuq2/yrYjHv75mrEYddEI3OKa9ECkAUJJFWh445mdQlTr1jzzAmqfeXUPyg3
	71pl4a6JPmfKL06n3in0rF5UmKkch9exvxHqm1tpRKksXXZC/exWDHgRMFYGSDUQi6j7epSHLCo
	FFBw==
X-Gm-Gg: AR+sD12L5Z2c+t98XrpxbYQNy5K52SrcxjPtiW2q/0ZFSkwVdI560WxXYlto8EFjzCL
	Adg9ZxJzvebtn8puE7t37YpdFjB1jrFwqA4FWvxHt5fp5UVPXQ+6jNkey1K+NvjqdwxsvsIS4gI
	xT2urt66LrIdUlain0657x+fshe8n9EZpZu6FgNclHdMyDyrUxmURjxmQk6iHZrgorb6sGHegKm
	B5Wa4LzLdygXX7bKYm+hStJImSiJP1IOHYily+zwa4btheCW7sMrwhoSgMneYnJNy7em3bf5ZLR
	iuaYlMHRUMe8yfCkZ7j55pLDpv/hhLVwGSW3gI4jUGkp3qZBj7ErQ/gThd4/kPGvaNEJHGKnFOT
	EaMrpVsCC8Hlr39c=
X-Received: by 2002:a05:6102:4422:b0:737:783d:1916 with SMTP id ada2fe7eead31-77a64230d44mr7674495137.11.1787557828538;
        Mon, 24 Aug 2026 00:50:28 -0700 (PDT)
X-Received: by 2002:a05:6102:4422:b0:737:783d:1916 with SMTP id ada2fe7eead31-77a64230d44mr7674463137.11.1787557827958;
        Mon, 24 Aug 2026 00:50:27 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1cdbe9sm7372364a12.24.2026.08.24.00.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:50:26 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:50:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 09/15] pinctrl: qcom: Add Kuno pinctrl driver
Message-ID: <7ywfd3hfzngejfprv5zkn65kci52q5tgiq5h3sccpz35ov5eq4@ow4edd5epaws>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-9-196e2b306368@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-9-196e2b306368@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2NyBTYWx0ZWRfXyPjCyBImf6sZ
 7dW4UJB0W9HicGRJkoYT0/hNYMFLy0ZHTsKFpQMREdDIGrZG2VPnm/7OnwzKEei/iSBpb6VoMA9
 YsBozN01vUyGc2dGfWT+YdPFNGVSDZU=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8bf7c5 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gSngVhONzQuCJb9LWNIA:9 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: qCYTPnSDOYWUxJIbByrIF7r1C-dCvFzM
X-Proofpoint-GUID: qCYTPnSDOYWUxJIbByrIF7r1C-dCvFzM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2NyBTYWx0ZWRfX1r92Kd+h7iro
 miRJcVN/raiO5UUeYm7sNzcJfpWkk9StyUQfu6JJUo7mBz9MnjE/2CWa7vaGSaWLarXChLGFV9+
 HGiPb66j0dvdMI9NbxWhMC0PJSDfLfICufbyQRlyaQU5z9p8aAQgKShRTuJ5xN8vaU/JSabeHai
 RQ90TFgch7NVmWFAOPX+Ftmg5IQ9OIahHUrGQCusYes5lNdZk3/Yg51JTzhdR5H22SFojUq005s
 eFytRF5gCCDEkCOHpBKsGqltVJgElAU+FmkpcTVl12MIeiuRgCGfI1lHMx26hMMNoUUorMz6pwC
 Lh9nKnmwaVBhifVPS2OCga48/ta9GPBrRvJGQOlDGr80JdjPYNZ5IoIVzLogeC75ALTzuvdfVqi
 g/eNpZPZQbYqWnqf6Js3GuR4bGWrvs2a0BYMnPnPgooAMNecTDKSf7fnqq4o5/p6ClFcuIjnMpV
 aAVQIOGnM2xX62xVdfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_005032_385462_178F3035 
X-CRM114-Status: GOOD (  21.69  )
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

On 26-08-21 21:39:02, Hardeep Sharma wrote:
> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
> interface through the common pinctrl-msm driver.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm    |  11 +
>  drivers/pinctrl/qcom/Makefile       |   1 +
>  drivers/pinctrl/qcom/pinctrl-kuno.c | 801 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 813 insertions(+)
> 

[...]

> diff --git a/drivers/pinctrl/qcom/pinctrl-kuno.c b/drivers/pinctrl/qcom/pinctrl-kuno.c
> new file mode 100644
> index 000000000000..f3f8ec3e09de
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-kuno.c
> @@ -0,0 +1,801 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#include "pinctrl-msm.h"

[...]

> +
> +static const struct pinfunction kuno_functions[] = {
> +	MSM_GPIO_PIN_FUNCTION(gpio),
> +	MSM_PIN_FUNCTION(audio_ref_clk),
> +	MSM_PIN_FUNCTION(coex_uart),
> +	MSM_PIN_FUNCTION(ebi2_lcd_a),
> +	MSM_PIN_FUNCTION(ebi2_lcd_cs),
> +	MSM_PIN_FUNCTION(ebi2_lcd_reset),
> +	MSM_PIN_FUNCTION(ebi2_lcd_te),
> +	MSM_PIN_FUNCTION(emac_mdc),
> +	MSM_PIN_FUNCTION(emac_mdio),
> +	MSM_PIN_FUNCTION(emac_pps_in),
> +	MSM_PIN_FUNCTION(emac_ptp_aux),
> +	MSM_PIN_FUNCTION(emac_ptp_pps),
> +	MSM_PIN_FUNCTION(gcc_gp1_clk),
> +	MSM_PIN_FUNCTION(gcc_gp2_clk),
> +	MSM_PIN_FUNCTION(gcc_gp3_clk),
> +	MSM_PIN_FUNCTION(mi2s0_data0),
> +	MSM_PIN_FUNCTION(mi2s0_data1),
> +	MSM_PIN_FUNCTION(mi2s0_sck),
> +	MSM_PIN_FUNCTION(mi2s0_ws),
> +	MSM_PIN_FUNCTION(mi2s1_data0),
> +	MSM_PIN_FUNCTION(mi2s1_data1),
> +	MSM_PIN_FUNCTION(mi2s1_sck),
> +	MSM_PIN_FUNCTION(mi2s1_ws),
> +	MSM_PIN_FUNCTION(mi2s_mclk),
> +	MSM_PIN_FUNCTION(nav_gpio),
> +	MSM_PIN_FUNCTION(pci_e_rst),
> +	MSM_PIN_FUNCTION(pcie_clkreq_n),
> +	MSM_PIN_FUNCTION(pll_bist_sync),
> +	MSM_PIN_FUNCTION(pll_clk_aux),
> +	MSM_PIN_FUNCTION(qdss_cti_trig0),
> +	MSM_PIN_FUNCTION(qdss_cti_trig1),
> +	MSM_PIN_FUNCTION(qdss_cti_trig1_mire),
> +	MSM_PIN_FUNCTION(qdss_gpio_traceclk),
> +	MSM_PIN_FUNCTION(qdss_gpio_tracectl),
> +	MSM_PIN_FUNCTION(qup0_se0),
> +	MSM_PIN_FUNCTION(qup0_se1),
> +	MSM_PIN_FUNCTION(qup0_se2),
> +	MSM_PIN_FUNCTION(qup0_se3_mira),
> +	MSM_PIN_FUNCTION(qup0_se3_mirb),
> +	MSM_PIN_FUNCTION(qup0_se4),
> +	MSM_PIN_FUNCTION(sdc4_clk),
> +	MSM_PIN_FUNCTION(sdc4_cmd),
> +	MSM_PIN_FUNCTION(sdc4_data),
> +	MSM_PIN_FUNCTION(sdc4_tb_trig),
> +	MSM_PIN_FUNCTION(sgmii_phy_intr),
> +	MSM_PIN_FUNCTION(spmi_coex_clk),
> +	MSM_PIN_FUNCTION(spmi_coex_data),
> +	MSM_PIN_FUNCTION(spmi_vgi_hwevent),
> +	MSM_PIN_FUNCTION(uim1_clk),
> +	MSM_PIN_FUNCTION(uim1_data),
> +	MSM_PIN_FUNCTION(uim1_present),
> +	MSM_PIN_FUNCTION(uim1_reset),
> +	MSM_PIN_FUNCTION(usb2phy_ac_en),
> +};
> +
> +/* Every pin is maintained as a single group, and missing or non-existing pin
> + * would be maintained as dummy group to synchronize pin group index with
> + * pin descriptor registered with pinctrl core.
> + * Clients would not be able to request these dummy pin groups.
> + */
> +static const struct msm_pingroup kuno_groups[] = {
> +	[0] = PINGROUP(0, uim1_data, NA, NA, NA, NA, NA, NA, NA, NA),

We use underscores instead of NA here.

Please compare to the older SoCs in upstream.

