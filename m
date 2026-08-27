Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2440C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04ZKMcnXgGkCw54cQeUZ197WIreRiI4WJLmXW900/HI=; b=DB9u5GBEkJRLarpnEVU+HAxWxp
	Q/pBgKlWqgp+yo5sHvUuNSL7k4e5c13uSXV/7NRY2/wONB63YRn38fJJyoVBR7bdTPjg419pqPCcz
	hLQASSLk60GeyYMoUzwrhcvCP6pis7SJ66YAf/48vvMRPdbHE9MbRWQob29CE3aJDV9vFYJkw8KmT
	Bdthj7FjW0qmvdTxGnpbqQBr1AkEdHTl9g+j44Ep5m+ghol35+YPXiuecaMjIsbPZFcPQ0vce9rfe
	LCkmSP8bKnU1oeuDctom4UbFFZQluKuxF3kWQ9iMHZlQc7qKngx+SXVNn8fKlBLUDUazbjHdUmkz3
	tvebfzuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdFU-00000004Ozd-0JQ0;
	Thu, 27 Aug 2026 16:46:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdFQ-00000004OzI-0O4g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:46:42 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RGIMfC707841
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	04ZKMcnXgGkCw54cQeUZ197WIreRiI4WJLmXW900/HI=; b=h0glBXuyQUQRYemm
	DfEe5CHlzurV6Ac3tsRZaFGaqEJpGD5PldYYJ0ygayjFBm0ZRPi3PRQ6yk+WTpkY
	3zzVN1vhXEeXFyL53bker2bbEITkgZCrBR2c5gPkHX1hZVdjt6+RBzjsaifoS/jB
	4MyJmG2O/RhiD0zb/6C/9FCkKM8cVB2ZQic+spJXtg6Y4TSoSmu72trDf4yhHwx4
	ySW0ZFkVdyWT8sOI0w6TV76RL5GPavheA7YfIBYPf0sZECVeknbQ28ybpQZ7LWdt
	67VyS9dUjvFMdPZpsDO6sflvWpTs9t0y/pH7fkXuEL4XWYfR9RWBhiQVhve+hAHu
	aphPXw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garn0g3n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:46:38 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e9e741693bso152128a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 09:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787849198; x=1788453998; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=04ZKMcnXgGkCw54cQeUZ197WIreRiI4WJLmXW900/HI=;
        b=BBevP+pVRbFgSbx2LI5iitVk3bE8aoGfU1rM2y10cgD9SpAbYCA/dAPDLSrnQIU52b
         leu3aykgYgARIA7x+gMzXrNCGEyd8j2lA0TdfA2GH1yhGtda3N8e5Mc+0u0I6RF0WPUw
         Zf0ooTNi4/ck48Iy5tQIAFcjzyLew0Fyx6KnBOZWaELXxnaTMO9Sti+Jb11l1UgAm3Gf
         VMdY254zpF/n0QlfjXyZ2dv80x2rCxRVVK5TZBOpzcIHakbGWGFtSDndZXKVZLFS9kIQ
         1Ojlzl8pQ85twCRokBJ9v9JKROpTuKjg5zx3OsH/MjuAMgZL9B3W8gNgKFW6Io0hzOFV
         YQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849198; x=1788453998;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04ZKMcnXgGkCw54cQeUZ197WIreRiI4WJLmXW900/HI=;
        b=GCg+kkA37m6tLrg3AnAvuIuW1O7M18+qG9Sy4ZK0vrCji8lKJcNulPCHFblAIrgBzP
         az2+iVJcdtRVUw835fZ35pquqw5PR3jiTD2ALihxG2lJ39maip8vhrJ04O/z+h52zBxp
         KLfsoOA+J5lyIBre1KryT5wTVw9iLi5ca1hHl3DeHqzaccGDSgOr8K47JrPQ+KMPp5Yf
         ysm+ktMi/sDX51dFAbATR3P5moi//ZlC1u/MhcyAutP8hzX3fJoZN7+hABiBpz6rIXxz
         +GE8/DWYJac+eIAvB1+1l1Z7tRH0nH1f0PQuIA0HvGoVn17LJpZtkKRIx2l5yaCo/Pkh
         kxbQ==
X-Forwarded-Encrypted: i=1; AHgh+RqqB9AT0b6AaA8HPOUH5TweGQaHC4HusII9OQlmBp00RfgcVRPfOvorcmqFZydIZum/igq/7cR9l0NWq7ZZXIlv@lists.infradead.org
X-Gm-Message-State: AFuF++kkemPpWR9N2XVPregvWmNawyENb+DURqOFWRVXZQvs0vPUPFac
	qHo/s6oFj2TVCI24XKVf9Ey9iZKlTJnnwmTr65KA9Y/ahJMBCIppO7TaiE5ObRQgwvRm3Gi3m8M
	A2oARcKRn66U1LWhWHRQB89/LS9zPrGREJKXIkf+Hh6PNUKlfaRrr9YQ3jQRfKHpbwqxYQPZdp8
	JOqw==
X-Gm-Gg: AR+sD13E14odNaSYuXObWPDZ8krD6riRSTWSayv1KZIm6uqU+RUjS58ZAbQjpUvGDda
	siLMS+YCf0HTghqTYABsu6KUaMzJ9DVsYoBPLXATC0V0sFN9a0S0zKnAKtsTwW1q0Pos5TBIs3e
	vmoY1OqbhQ28Xtye0mZUtC1xhinFOKf7cBUZpOGuvgSqWyLKgJ5fBXIu5/8fRiUij/EXrWgG9Zh
	H2vwJiIpgwhnW4qtLEGNWPcvn5iteaag8O71EEME0BlWnkAfkr8bWd337r+W3m9Ddh/60ENFgol
	WKPI5Okhua22Cv/FgcF8qvZNPFl1ZTHeDWRmHUinuJYmHUPx1Qe9MgprG2ZNnuNp9xhe5vinH1W
	/onp7Iq7Oi1uFg87iYz4JJ86ik2tmjN4=
X-Received: by 2002:a05:6830:4494:b0:7f4:d8e0:c392 with SMTP id 46e09a7af769-7f4f21ca005mr792632a34.2.1787849198173;
        Thu, 27 Aug 2026 09:46:38 -0700 (PDT)
X-Received: by 2002:a05:6830:4494:b0:7f4:d8e0:c392 with SMTP id 46e09a7af769-7f4f21ca005mr792519a34.2.1787849197577;
        Thu, 27 Aug 2026 09:46:37 -0700 (PDT)
Received: from [192.168.1.6] ([122.171.23.69])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4c81c3cf2sm4497199a34.9.2026.08.27.09.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 09:46:37 -0700 (PDT)
Message-ID: <789f0ace-585b-40a0-b1ef-2fa0bbbe0ac2@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:16:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/15] pinctrl: qcom: Add Kuno pinctrl driver
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-9-196e2b306368@oss.qualcomm.com>
 <7ywfd3hfzngejfprv5zkn65kci52q5tgiq5h3sccpz35ov5eq4@ow4edd5epaws>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <7ywfd3hfzngejfprv5zkn65kci52q5tgiq5h3sccpz35ov5eq4@ow4edd5epaws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MSBTYWx0ZWRfX5cw5vtmzhuaV
 5j1YEwfTGJqyOxYGGNtiHTsctTfnLwuNlOjQHXQefTzg8NebtzUfr+LSTUsYpEwP4eWPm7a+gG3
 M7c2R349Xf2R0ZEK+PzsBKEqqPIGV6X1nzAXNARnhzNZtLCgf6VCfF1Of5lsh8qBCfdp1/NVjmt
 YSEsCtHgjEWMOZhbWSb/jf85Q1j4EQo1Ua4zey4YWWn2eKZM7GXZXTB6IScO1+luHAn1ZyE4KGs
 xuB1pg0gOAv6IxaFVmPsCYqhu5mpNpJxt+fTuUzo+uuaYIxphHLoxdercXYvIlE7oLQJL75PD6l
 ZO0aKtGKQnDdUBMAy0fzsLHbx0qWoQaBj0BSmQxMEu13O4rAlY022+ym//m0NXWt46drinP/sUn
 6AYxm9GgU9WNU9EZE2LkmJXMuDYo/SMbqfnXtgriXW4Gf2K2/E3Yld0676xB4fyRMvwFNpxjKva
 SH0X7XSl1ePvm+z+FHQ==
X-Proofpoint-GUID: b2HbpxgCUDDKvX2J2Ve0QZoZXB1XoNfs
X-Authority-Analysis: v=2.4 cv=C+3ZDwP+ c=1 sm=1 tr=0 ts=6a9069ef cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=WTDSa4fX56zQulHxy5BIwg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=isv1MMe3HlJYIrOEQaEA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: b2HbpxgCUDDKvX2J2Ve0QZoZXB1XoNfs
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MSBTYWx0ZWRfXwyUd9TJXJDcO
 f3yfJfIq+rJYM6BCUGQDHMMkmwi+hPInd3bx4BxDm3CLA/kY/e6/GaGlggzU83hSAFvCejwVX1G
 Ic5x4VLTztVj+Gi6ZmWwEbudOWcxiBA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_094640_825756_A117A3E6 
X-CRM114-Status: GOOD (  19.26  )
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


On 8/24/2026 1:20 PM, Abel Vesa wrote:
> On 26-08-21 21:39:02, Hardeep Sharma wrote:
>> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
>> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
>> interface through the common pinctrl-msm driver.
>>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/qcom/Kconfig.msm    |  11 +
>>   drivers/pinctrl/qcom/Makefile       |   1 +
>>   drivers/pinctrl/qcom/pinctrl-kuno.c | 801 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 813 insertions(+)
>>
> [...]
>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-kuno.c b/drivers/pinctrl/qcom/pinctrl-kuno.c
>> new file mode 100644
>> index 000000000000..f3f8ec3e09de
>> --- /dev/null
>> +++ b/drivers/pinctrl/qcom/pinctrl-kuno.c
>> @@ -0,0 +1,801 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include "pinctrl-msm.h"
> [...]
>
>> +
>> +static const struct pinfunction kuno_functions[] = {
>> +	MSM_GPIO_PIN_FUNCTION(gpio),
>> +	MSM_PIN_FUNCTION(audio_ref_clk),
>> +	MSM_PIN_FUNCTION(coex_uart),
>> +	MSM_PIN_FUNCTION(ebi2_lcd_a),
>> +	MSM_PIN_FUNCTION(ebi2_lcd_cs),
>> +	MSM_PIN_FUNCTION(ebi2_lcd_reset),
>> +	MSM_PIN_FUNCTION(ebi2_lcd_te),
>> +	MSM_PIN_FUNCTION(emac_mdc),
>> +	MSM_PIN_FUNCTION(emac_mdio),
>> +	MSM_PIN_FUNCTION(emac_pps_in),
>> +	MSM_PIN_FUNCTION(emac_ptp_aux),
>> +	MSM_PIN_FUNCTION(emac_ptp_pps),
>> +	MSM_PIN_FUNCTION(gcc_gp1_clk),
>> +	MSM_PIN_FUNCTION(gcc_gp2_clk),
>> +	MSM_PIN_FUNCTION(gcc_gp3_clk),
>> +	MSM_PIN_FUNCTION(mi2s0_data0),
>> +	MSM_PIN_FUNCTION(mi2s0_data1),
>> +	MSM_PIN_FUNCTION(mi2s0_sck),
>> +	MSM_PIN_FUNCTION(mi2s0_ws),
>> +	MSM_PIN_FUNCTION(mi2s1_data0),
>> +	MSM_PIN_FUNCTION(mi2s1_data1),
>> +	MSM_PIN_FUNCTION(mi2s1_sck),
>> +	MSM_PIN_FUNCTION(mi2s1_ws),
>> +	MSM_PIN_FUNCTION(mi2s_mclk),
>> +	MSM_PIN_FUNCTION(nav_gpio),
>> +	MSM_PIN_FUNCTION(pci_e_rst),
>> +	MSM_PIN_FUNCTION(pcie_clkreq_n),
>> +	MSM_PIN_FUNCTION(pll_bist_sync),
>> +	MSM_PIN_FUNCTION(pll_clk_aux),
>> +	MSM_PIN_FUNCTION(qdss_cti_trig0),
>> +	MSM_PIN_FUNCTION(qdss_cti_trig1),
>> +	MSM_PIN_FUNCTION(qdss_cti_trig1_mire),
>> +	MSM_PIN_FUNCTION(qdss_gpio_traceclk),
>> +	MSM_PIN_FUNCTION(qdss_gpio_tracectl),
>> +	MSM_PIN_FUNCTION(qup0_se0),
>> +	MSM_PIN_FUNCTION(qup0_se1),
>> +	MSM_PIN_FUNCTION(qup0_se2),
>> +	MSM_PIN_FUNCTION(qup0_se3_mira),
>> +	MSM_PIN_FUNCTION(qup0_se3_mirb),
>> +	MSM_PIN_FUNCTION(qup0_se4),
>> +	MSM_PIN_FUNCTION(sdc4_clk),
>> +	MSM_PIN_FUNCTION(sdc4_cmd),
>> +	MSM_PIN_FUNCTION(sdc4_data),
>> +	MSM_PIN_FUNCTION(sdc4_tb_trig),
>> +	MSM_PIN_FUNCTION(sgmii_phy_intr),
>> +	MSM_PIN_FUNCTION(spmi_coex_clk),
>> +	MSM_PIN_FUNCTION(spmi_coex_data),
>> +	MSM_PIN_FUNCTION(spmi_vgi_hwevent),
>> +	MSM_PIN_FUNCTION(uim1_clk),
>> +	MSM_PIN_FUNCTION(uim1_data),
>> +	MSM_PIN_FUNCTION(uim1_present),
>> +	MSM_PIN_FUNCTION(uim1_reset),
>> +	MSM_PIN_FUNCTION(usb2phy_ac_en),
>> +};
>> +
>> +/* Every pin is maintained as a single group, and missing or non-existing pin
>> + * would be maintained as dummy group to synchronize pin group index with
>> + * pin descriptor registered with pinctrl core.
>> + * Clients would not be able to request these dummy pin groups.
>> + */
>> +static const struct msm_pingroup kuno_groups[] = {
>> +	[0] = PINGROUP(0, uim1_data, NA, NA, NA, NA, NA, NA, NA, NA),
> We use underscores instead of NA here.
>
> Please compare to the older SoCs in upstream.

Thanks for review.

Corrected in v4 : 
https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/

Best Wishes
Hardeep Sharma


