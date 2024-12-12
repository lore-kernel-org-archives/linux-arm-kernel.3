Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216D8E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZJ2HdatxlZ4xVf47i0ZPAbi74LzeVefsJXaq3wgFRc=; b=b6ezo/j+Q69TkWM0AMi/Tcf3j8
	WNLI2exu0MMGr/uh99LZ3oEQmzFUH8ZtdMClbU/8fAVLyiP4l5FPKncgiw0sqKHTYoc15N+OVhVfR
	HqxuExFDPhAiN7rpvD1kgLXjyZcy7EwymDatpBsAQrEYjowsCjlJgL9XwQ3OG3wiAXBRypRXoumHq
	XYnS4V1YDlP0e38SASWHn4oYsvEnIJDEc20dda0GEz+NRY8WMRn/qFeo1SfzsFZT9HcAyrdfW2Epv
	ZILcukOlV1JYSgaxpDkPMB/5UraHDVxKGEiB3v+HK2NHmpTdLWr+TZQt1I4QF6eqRnyvrqJyGudIO
	xM2mqu/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLon1-00000001cs8-0EdD;
	Thu, 12 Dec 2024 19:23:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnxf-00000001QfM-1sGG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:30:56 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCFYfIH014934
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 18:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vZJ2HdatxlZ4xVf47i0ZPAbi74LzeVefsJXaq3wgFRc=; b=YUBY+IGec3ZLOvQ1
	G/SZkp/2D3R6MR/lDdlYxFypRBUZS52XJ6f+9fUTkYMPUiNTDGTXZVmPXXSj3YAc
	26M531FE2jJhkt5rizqmdPjW4MxL4ps/pseCVBfC9PZ/DpuN7kiAsn/FfgvLBStQ
	VGg9o8jnZEv0u2iEU/th9mBMH1sWniV5TFOLraIRtLn5aMYadzIB9V2jnYHUq/T7
	vo3mZHbRo8FNX5okey5ZtO54agIocUSy1ZskorpFdIyXBMpexeKnXHXakqUpgYt4
	1o4t6E3Src3plWSxGfJFdsDE1QcE/5m8BiPfh/UcjkpKQTnifeiVf4vuFQp2a9J/
	FqNuXA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f7dpn62m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 18:30:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-467922cf961so2592731cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:30:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028253; x=1734633053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZJ2HdatxlZ4xVf47i0ZPAbi74LzeVefsJXaq3wgFRc=;
        b=jw4hHEJ4JDYgZ+JRYx3eWdpEYFAycIDH/DP36Nx+zlAbm0PcrV06GUsySVq+EH/4TH
         6CNIXJsWFz3BMzof0xUbiyC/Fi25rgTzl6b/0cO7OmrjyNTfaIw/gz81zB251v+UmY03
         1N40+lEQ28ztPV+wj+7KThyDQvBmf0DWO5/918ovHjBsGpXvmzD/4HzGdDWUuIPFBCla
         7m1EbRE+zVqnNnNfUbNvHF62QlolJSvVlQeK0JPhXWVil7+Xf78VAJCGIXQpFF58+W4R
         uuKlGn5BnH3EaKy7Z7Q+TlshKOCZxrcot8VdzXnPYmhAQgQKT5NFZAauEzfW8B9MHIjN
         sA7w==
X-Forwarded-Encrypted: i=1; AJvYcCWtfDTird3JOtsnVnV2SOMS/MU2eoqfsbASu31AGzLEfvaM7pQWWhEQkLsy+KJcpERU28U+QYLeVgPR/wYet+Bz@lists.infradead.org
X-Gm-Message-State: AOJu0YyRvOwybZxqGTi+HpolDr4lpSmTu+qb9Y2ZE3pom+AHDH4AgqQi
	kzt3NaD+QDiuy3rlzVIlcI1vS3aHB9srDnHxeTk7wVcyxVWcaMOp5TVnJas0t+7asXxtm8tryO6
	TqoWOMSy4KfsvO8Hg3YKj5de++XTjNCFv+DVc/Cin3Nm73l+NbO2OKcnb9nR38M5WV7YEJp7eqQ
	==
X-Gm-Gg: ASbGncsCNvR4uVAKQgvlY8YWEgG7P521hqcS5DK0qcx28O6BBJAZQNKkp2s4puslgKo
	2Zkx1rT1mGj7XJZg7n7srveW/ZYAGs2Fw1UpKvExAOXyhasFeYg7uT5b5ojtpqN8ssJb8R5CkCR
	DwE0P78EnPkGsiB0Fyb+DhUi9dxtrWlFvWdL8J73PNAZz+2wfYUwq0ZqUQOu/eEflTP2o/lGaFC
	e0PWW8209k7ppMD4YLvBtVokxlbiCPgTBKp3FSKuhTnzYsUX54GnCdYxyOhMaQoc71sWPHA1asb
	FPHsgiptyJns/1oNB+186ll3sMP1i1qAG5WplQ==
X-Received: by 2002:a05:622a:a:b0:464:9faf:664b with SMTP id d75a77b69052e-467a14cfd41mr6750161cf.2.1734028253396;
        Thu, 12 Dec 2024 10:30:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBmWYzkqDM9wVygpP6+khZ5CMjiaMqbQrDeOxY/wvNHDdoJFd31XJ/C25DP1Iw/uEBcEYMXA==
X-Received: by 2002:a05:622a:a:b0:464:9faf:664b with SMTP id d75a77b69052e-467a14cfd41mr6749831cf.2.1734028253012;
        Thu, 12 Dec 2024 10:30:53 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa69c3512f4sm480672266b.2.2024.12.12.10.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 10:30:52 -0800 (PST)
Message-ID: <7f0f2ad6-7895-46f8-8f80-0375dde2e763@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 19:30:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] clk: qcom: Add CMN PLL clock controller driver for
 IPQ SoC
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
References: <20241107-qcom_ipq_cmnpll-v6-0-a5cfe09de485@quicinc.com>
 <20241107-qcom_ipq_cmnpll-v6-2-a5cfe09de485@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241107-qcom_ipq_cmnpll-v6-2-a5cfe09de485@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7fEsWg02rO4Oxmedi7yqGVy1Dffvi_vo
X-Proofpoint-ORIG-GUID: 7fEsWg02rO4Oxmedi7yqGVy1Dffvi_vo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_103055_613778_39C68618 
X-CRM114-Status: GOOD (  22.03  )
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

On 7.11.2024 10:50 AM, Luo Jie wrote:
> The CMN PLL clock controller supplies clocks to the hardware
> blocks that together make up the Ethernet function on Qualcomm
> IPQ SoCs and to GCC. The driver is initially supported for
> IPQ9574 SoC.
> 
> The CMN PLL clock controller expects a reference input clock
> from the on-board Wi-Fi block acting as clock source. The input
> reference clock needs to be configured to one of the supported
> clock rates.
> 
> The controller supplies a number of fixed-rate output clocks.
> For the IPQ9574, there is one output clock of 353 MHZ to PPE
> (Packet Process Engine) hardware block, three 50 MHZ output
> clocks and an additional 25 MHZ output clock supplied to the
> connected Ethernet devices. The PLL also supplies a 24 MHZ
> clock as XO and a 32 KHZ sleep clock to GCC, and one 31.25
> MHZ clock to PCS.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

[...]

> +	/* Enable PLL locked detect. */
> +	ret = regmap_update_bits(cmn_pll->regmap, CMN_PLL_CTRL,
> +				 CMN_PLL_CTRL_LOCK_DETECT_EN,
> +				 CMN_PLL_CTRL_LOCK_DETECT_EN);
> +	if (ret)

you can streamline these with regmap_set/clear_bits

> +		return ret;
> +
> +	/*
> +	 * Reset the CMN PLL block to ensure the updated configurations
> +	 * take effect.
> +	 */
> +	ret = regmap_update_bits(cmn_pll->regmap, CMN_PLL_POWER_ON_AND_RESET,
> +				 CMN_ANA_EN_SW_RSTN, 0);
> +	if (ret)
> +		return ret;
> +
> +	usleep_range(1000, 1200);
> +	ret = regmap_update_bits(cmn_pll->regmap, CMN_PLL_POWER_ON_AND_RESET,
> +				 CMN_ANA_EN_SW_RSTN, CMN_ANA_EN_SW_RSTN);
> +	if (ret)
> +		return ret;
> +
> +	/* Stability check of CMN PLL output clocks. */
> +	return regmap_read_poll_timeout(cmn_pll->regmap, CMN_PLL_LOCKED, val,
> +					(val & CMN_PLL_CLKS_LOCKED),
> +					100, 100 * USEC_PER_MSEC);
> +}

[...]

> +static int ipq_cmn_pll_clk_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_pm_clk_create(dev);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * To access the CMN PLL registers, the GCC AHB & SYSY clocks

SYS?

Konrad

