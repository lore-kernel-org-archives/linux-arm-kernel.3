Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968E8C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 20:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HcA+kp3HypSPdvU2NDchUlEnmvRzp6s5z33xRBR58yg=; b=i6OMVTutplYxYPG3tWopm8HiF6
	BqRRYI3E2wdXMWGXeohK3VJZ4D4Ik/OfxX2mZOaifoX1IjUj15grWZd+hW9Pmv5YKbOx8LKyYG2XL
	s4uSR//fDNFdbe2JBUqMXaMAQD2lX4P1/9EoNZ+h9Dg9R5gqyOuUY5KuE6fTwizIMbN1ofhqQ6OHr
	6W9woBiXT4Uxhte/WdnV/yRPmP1/LDY/67ypT7jUhyi80vcHYfkQpvT56H4+3Bo4bjj0eqC+2aIzr
	GgCxwjFOQ5qbpMewtGowvtUccGIM8yK/84sqG8FIqRrxSqLHLWniklJ5YseMWqlvcb+hLmRmAeJ5s
	RhtfZf0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucVRZ-0000000B6t5-2ZZQ;
	Thu, 17 Jul 2025 20:43:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucVP7-0000000B6Yn-19ET
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 20:40:34 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCNKe1015616
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 20:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HcA+kp3HypSPdvU2NDchUlEnmvRzp6s5z33xRBR58yg=; b=BLkmmo7kc3scYKxZ
	mjfnbXvyG0g7oXjZUoiUEQ44uLA6XV5nH9+mSFD+fAkInK+06RhrU+wF5uqUFPXY
	UCbek+1GQTOFiEvsYUvD655hpeVtv0OYahZP7QFc29/Q7s9AU0n+bdqxit4zCoDo
	SrDSKDeMU2P+x7tTNOxEOTHR6+GhzvPofq9jZzr19qUHAU/zoTBBgXdzXKf1F9Yb
	XFsAVz00EoI2V/4chGHDZsOaC7e/5ZOcZPyuK49/YV+lGWU9v6wawmujcXbSQuKY
	UDjd9RHMkXuQ8FBJOTN9tI5+yasOyvyrr21eXBC+xby4vgIT/6k3RqwygmyWwxyr
	aO7PFQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyv3xs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 20:40:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab5e4f4600so2839701cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 13:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752784831; x=1753389631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HcA+kp3HypSPdvU2NDchUlEnmvRzp6s5z33xRBR58yg=;
        b=EuwCaqWYu1UooXF591uARzSbAUWM+jGqFref3ODuDy+rHLT1INRhXmMsfCAvaX2zSV
         mzG3ZhUVpK64jFOj9rSb48kUkWmt7wbyZu85yp5iVLV5SUPj83wT+4D+nfZryTits1E/
         vAauE64Ms7pG0tAx8eAYZpn+aXgE12HaGxF27ETProMb0KlvJwqyBqjYfw4rILCItymK
         ALrIe5bUR6PR6wTEsZ5ZqpC6eaK+A/AxTE2hi1Tr0MaNDiuv5GruPemnPaBZ06LqDw2A
         SqtErUY6LjX4vTuZkRrpsCCDSVShKfjxwhFfxNqFKpqiCA544wj4oY5HuXszGaIu7xon
         l+Zw==
X-Forwarded-Encrypted: i=1; AJvYcCV8uKIOa8kDBkKSr8RNbEP7kJQ7xnzwkAarXN9iGdepBf7bkoEZ3mp4vmZ1zcUI0tFST86LaWvl6w30LOb8hXf9@lists.infradead.org
X-Gm-Message-State: AOJu0YzoUSG9sTLmLsPGptwRP/ebS+d/kxRNA6J9Hf9obq9h4L+1TCyY
	vYL36BSxrVmYQ8kKPiOGEvrqd0o6j4x8AG3ETR9nqsOL31d6Zk6B4XqZL9FOiOnzgKa/m5Zx3zD
	LrzWs4g4Hi9FwECNlbB0PVskyUN+kdbQ38ALi+qxqbBF4+HzvTRuK336pCl9QcJaoekF3Osarhv
	mhtA==
X-Gm-Gg: ASbGncuJ8kNA+235rmg4RZ5H+RhBdYvswt2FQDSjT0ZQ8aEmzwK6cJVXLg4V6bKGnan
	/VSrtjeD9ONudpo7V+cGBfSAL+axwyMqxT+tx1fb62V2c7w2ylb4kPcovUpo3W1ZKpIpf8sH4V+
	AD+vLBUza7/NBSgYgE44KPkhsoM27BvONrbBDmUO+GGXf8KIaCe97Irgr/ghkRZcn5Qw49euwfF
	HwnoPdce3ipFrRDLVQNNoziZdLOqTYoyApO1+w1VNUmzh9ShwhwqupD1Zoco+qVCAOb402oXnWp
	+xBwBoLGe4iUjZgRXVsMLpdPPE8NPPBzw4Au1LdblyAaGBylqQGYHQ0gkRcuGTrcanjtg9Z7HNO
	uIbXew9+I14R3H4tpqaRh
X-Received: by 2002:a05:622a:1211:b0:4ab:5d26:db88 with SMTP id d75a77b69052e-4ab909ca3c2mr62007821cf.3.1752784830681;
        Thu, 17 Jul 2025 13:40:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGacEtOK6P1w0TqLkAVvy3zfLW2JrPG0JSKgt/e9kAEeqsdXApuxd5RMOc2e1Ib7SbZf4Jkog==
X-Received: by 2002:a05:622a:1211:b0:4ab:5d26:db88 with SMTP id d75a77b69052e-4ab909ca3c2mr62007551cf.3.1752784829965;
        Thu, 17 Jul 2025 13:40:29 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8264fd2sm1430651366b.108.2025.07.17.13.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 13:40:29 -0700 (PDT)
Message-ID: <ad726c8c-0eb0-4498-a430-f906ea61c80f@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 22:40:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] clk: qcom: ipq5424: Enable NSS NoC clocks to use
 icc-clk
To: Luo Jie <quic_luoj@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Anusha Rao <quic_anusha@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_pavir@quicinc.com, quic_suruchia@quicinc.com
References: <20250710-qcom_ipq5424_nsscc-v3-0-f149dc461212@quicinc.com>
 <20250710-qcom_ipq5424_nsscc-v3-2-f149dc461212@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-qcom_ipq5424_nsscc-v3-2-f149dc461212@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yLcBaZbwOojeI24hRsf2ha-EmfQFwvy4
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=68795fc0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=53G8P9gWY_1ATa02Ga8A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE4MiBTYWx0ZWRfX3tM/n2i/f2zn
 fGYgiH9pCaArS0ZzuyF09sHI0o1dARmWl7Ztd6K7I6bW32f+wa3mbzmjCMNdZqTsJIahZrD/N01
 y84tDg2e37BQ2xfoay2iBCmgSWKCpcjXaIXaEWODd4Xm3cT7XBdLHHGoYiBq8o50KSHtRSAdHp8
 hrF5OTCMATi+c2BG4FgAQHI0hzZo+ZZ5GJKaJ43sIDJ5PZS6inFA2PnDLfNw8anNqCQ/LnLJuHY
 /SNoddGXl4I6Vav4NJnnJfklEGAM5Yutki0d4kmPLeA7/cTyn91d99FnIp5+GFrd+A1Nu3n7BJL
 K3yomguN5vOYPFAjSHOBhj8RF71NQhCS5U+oxs/jz8LGtYn5sw7Wylvv+9zvqidi2oEWzsqs62r
 Ky0Gtmyb6QlUfL+b/g4LUM5GqNPTmpQOPUvtVyr3N45kma5uBLWcpkIQmx6EouYjCYCkY/s2
X-Proofpoint-GUID: yLcBaZbwOojeI24hRsf2ha-EmfQFwvy4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_134033_320881_DB854B38 
X-CRM114-Status: GOOD (  23.60  )
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

On 7/10/25 2:28 PM, Luo Jie wrote:
> Add NSS NoC clocks using the icc-clk framework to create interconnect
> paths. The network subsystem (NSS) can be connected to these NoCs.

Are there any other similar clocks that we should expect to pop up
in the future? We should most definitely have a single commit that
takes care of everything that'll be used going forward.

grep "\[.*NOC.*CLK\]" drivers/clk/qcom/gcc-ipq5424.c | wc -l

returns a number of them that aren't described as icc clocks, most
notably the GCC_CNOC_USB_CLK is consumed as a regular clock.

> 
> Also update to use the expected icc_first_node_id for registering the
> icc clocks.

This is a separate fix

> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-ipq5424.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
> index 3d42f3d85c7a..3a01cb277cac 100644
> --- a/drivers/clk/qcom/gcc-ipq5424.c
> +++ b/drivers/clk/qcom/gcc-ipq5424.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
>   * Copyright (c) 2018,2020 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.

Please follow the latest recommendations for the copyright notices

Konrad

>   */
>  
>  #include <linux/clk-provider.h>
> @@ -3250,6 +3250,9 @@ static const struct qcom_icc_hws_data icc_ipq5424_hws[] = {
>  	{ MASTER_ANOC_PCIE3, SLAVE_ANOC_PCIE3, GCC_ANOC_PCIE3_2LANE_M_CLK },
>  	{ MASTER_CNOC_PCIE3, SLAVE_CNOC_PCIE3, GCC_CNOC_PCIE3_2LANE_S_CLK },
>  	{ MASTER_CNOC_USB, SLAVE_CNOC_USB, GCC_CNOC_USB_CLK },
> +	{ MASTER_NSSNOC_NSSCC, SLAVE_NSSNOC_NSSCC, GCC_NSSNOC_NSSCC_CLK },
> +	{ MASTER_NSSNOC_SNOC_0, SLAVE_NSSNOC_SNOC_0, GCC_NSSNOC_SNOC_CLK },
> +	{ MASTER_NSSNOC_SNOC_1, SLAVE_NSSNOC_SNOC_1, GCC_NSSNOC_SNOC_1_CLK },
>  };
>  
>  static const struct of_device_id gcc_ipq5424_match_table[] = {
> @@ -3284,6 +3287,7 @@ static const struct qcom_cc_desc gcc_ipq5424_desc = {
>  	.num_clk_hws = ARRAY_SIZE(gcc_ipq5424_hws),
>  	.icc_hws = icc_ipq5424_hws,
>  	.num_icc_hws = ARRAY_SIZE(icc_ipq5424_hws),
> +	.icc_first_node_id = IPQ_APPS_ID,
>  };
>  
>  static int gcc_ipq5424_probe(struct platform_device *pdev)
> 

