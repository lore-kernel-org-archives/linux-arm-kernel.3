Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EB4C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 18:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eoG6O0K3f8gZX/KII4B/go1MHyLMfczPeBlrtLSsYrM=; b=sFmkhdYqWTmidCNhDaUDozkJMC
	aF1EjwnWO0lpEHT7XB1zXEQdiGcqbpx+ka2CXFTJiiTwqQw83cVzJzkecQMezExfg4UQQpsL0FCTO
	a751y48sFzoNA8Md1zx7aHPNygnkg4WPmN+mSoD7nGh3s6CoFUG4h33Psitd1XGaCzSsKxtpo0d6R
	TcqaLF/0XxMMr1TPNL4mY0duU0pBz4o7M5RPNixYwCJaCY8q7xrJH9WCV+CdwpAu6bFc7Ab7S7xiR
	xADpYWsJ1lp4riDUXUW9Kw/O0su6sDQoeJsBa2oKvDSfeRqn1OWVl8iUdHm3ihbt94ML1RJH3Nkhb
	aJgm8UdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQVzv-00000001hl9-3NE9;
	Sat, 14 Jun 2025 18:52:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQVxk-00000001hgY-2puB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 18:50:45 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EHMpwm020713
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Jun 2025 18:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eoG6O0K3f8gZX/KII4B/go1MHyLMfczPeBlrtLSsYrM=; b=UDKuxPYnC4bK/zSP
	qjZzLRQmMiLyjHi7cOmLs3MXUjrYKquJxPrs1f9I6+I0hl5/PETBkSTnYf2iI0jF
	EMtozgAt/iqpMHItsXUFVjrtRt7p65SVdI/tfdQrlS/AOxyBXGxsH7GlJW+u1Sia
	asYaodCQQCUX0TH5XsfLRozMdD6Qr9eYHOl5jUR1THq8/bD7irP7aNO8z9S7Nx3b
	RnzVqlGiMZuMqiCXKcwEFQjE2EcTeY/F2NZFiDncMBDTxmOwGP1ACK7hGlgMNfUd
	5dyWxRO4pE5FmLc+FB7UgReIg4t6pVw/v5os8IVPgqXnskbS3zqB4tAI+JdCFXbk
	tYAX6w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hcrw3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Jun 2025 18:50:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a517ff0ebdso7450701cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Jun 2025 11:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749927043; x=1750531843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eoG6O0K3f8gZX/KII4B/go1MHyLMfczPeBlrtLSsYrM=;
        b=tFYIkHwpT9KlBS4/o/qczmzxC6/NvCFYapdtAlnxZuJRI5hJt3cU0FAWjdruF4HBFW
         iaY+Ws2iqA5jF7GMcIIAWP2QkY9qfQZXT8cZoN0ml64NDxjZ9NGlmNNGwJnx+H6uDDNK
         TDVI8FeyEgE9i0FG4qxcu6RcnXiuCswTs91RxC8D034qvM0m2g97OWJfDdlo/RTsJstD
         nI38p19G04Gph/HG/q51loIJ6OFrPx6LDLn23xb+zsuXipanZBH5xIOA7fvCCup3qoxX
         SnvSY6mo6ZcRDQ0EVvOf5thj1hccyEbXGgB7jjyuRtAKliKob9h0J0cSl/MoU0HsOQye
         kIyA==
X-Forwarded-Encrypted: i=1; AJvYcCWIjOaaVeGIgwPyJ/Eh/N7GO1uwYW4oaAq9+M4z6/einp/CPBL/Qx5CIrVs6e6AUX4egcPI8A5bJPwWZJXS+Odu@lists.infradead.org
X-Gm-Message-State: AOJu0YwkBTDXnIhgZd92KJSkPWibd/8X4baVPVD2oGFDoU/3VwGehhI3
	b7XSRROmNeuU3E101efIjisrtdCf4ESmwSsnW7XmRQozICR5K9bqWWePGhqC9FjkffzUC/7yZud
	efwU7+5G/T5BLMq4QC3zFbG55ZIreaJrSAgi7UR8wyqmyEgcxfGb7bh9Zv4eniViWeqHfPOVHTC
	mcyw==
X-Gm-Gg: ASbGncuKWofQoSv4rmwW42cylx8ZQSf4rT7+dqc8V79FU9r5LIQ+A6A1Ktc9rj45mPI
	GZkUjZ6h2NexAIMPKtlRHD972214zh5WZGDh6a9QtUNQy5H5PB9ViT/eCSqi+76QrtZLqR6iJEv
	T8GdFxmmc7CrXPyqxlmMVh6y/8b60y1MV71MEEYDxjB0bSb/wjBRzZMisQ/iVJFYeVYPx7C02gX
	D5bJZfwMlq39OIWBY7tLaIrivirTh3BH0ZNj+T7j7iYpvS8re/e9H4QlrcPFfieUWJfai5ux0K+
	rICEUngFtqQHyQTDWKwqUy5yKLs02JUIWq8zZ9yIER2pyfyON8+EG9Syjc+7/hY8Vls3iA8dnkO
	nBB8=
X-Received: by 2002:a05:622a:60e:b0:494:b869:ac06 with SMTP id d75a77b69052e-4a73c4f0986mr22004551cf.6.1749927042636;
        Sat, 14 Jun 2025 11:50:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx8dYFput+x1zrfRR/vwybI6ORi4SG7FUVUMwmj0jEta6iK89coF3n7ZV/SrKjJMpi0fdbrQ==
X-Received: by 2002:a05:622a:60e:b0:494:b869:ac06 with SMTP id d75a77b69052e-4a73c4f0986mr22004301cf.6.1749927042208;
        Sat, 14 Jun 2025 11:50:42 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adfade680d4sm186158466b.10.2025.06.14.11.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 11:50:41 -0700 (PDT)
Message-ID: <f0483597-45b9-49f8-b316-a9cde7b98d81@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 20:50:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/10] clk: qcom: clk-alpha-pll: Add support for
 dynamic update for slewing PLLs
To: Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
 <20250612-qcs615-mm-v9-clock-controllers-v9-1-b34dc78d6e1b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250612-qcs615-mm-v9-clock-controllers-v9-1-b34dc78d6e1b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE1OCBTYWx0ZWRfXx/JZh7HgpXjF
 xH7GBbBNCH+gTio03uZinSZurWDRGQGUbSURie8b+vLTO7x8kErN0M0uyfJc7D6k49pdVX2mHH6
 nQTMMazQelqQR2vRqUia5L6RF7z2VITtzQD24/dnVbcKTWT1HUsIVoDqfmO/5BSVuIf0w/OjkHr
 oVyIl5hbOduFAFs8ERsijfgqr4knVYuke8WHwaQJQkUb4efRJCC05dCg+tf9VTfCVH67vhib8Aj
 SXqIooB3Kx7ia2Pn3tXAY1znTaS9SOPxiXBPHc8yx8dDue0fvjOTU8m+SxFXaXQfpyfrXbvUxQ4
 GKZgm+8or5F/eWzceaF323Nfcj2XspACqmEK8Q+6K/a9TFxxXpGADR/sXGOu91cSLVhkq1N57mQ
 fphcQ8JBO3FL1aZe17gGterKddilBhjZlH8BAvm8IN+HrT/Kg2CwanQAL4EZ87SPpVNtQ3yw
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=684dc484 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=b3DFIE2h8Nkn-kLj-EYA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qIcwdGH8BVJGg25tox7fXFULS6n1YbaG
X-Proofpoint-GUID: qIcwdGH8BVJGg25tox7fXFULS6n1YbaG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_115044_720453_EE862F31 
X-CRM114-Status: GOOD (  27.68  )
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

On 6/12/25 11:55 AM, Taniya Das wrote:
> The alpha PLLs which slew to a new frequency at runtime would require
> the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
> which can support the slewing of the PLL to a new frequency.
> 
> Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 170 +++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |   1 +
>  2 files changed, 171 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index cec0afea8e446010f0d4140d4ef63121706dde47..5e4a755b849970281e7742ef83219b7eeaa406c3 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -2960,3 +2960,173 @@ const struct clk_ops clk_alpha_pll_regera_ops = {
>  	.set_rate = clk_zonda_pll_set_rate,
>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_regera_ops);
> +
> +static int clk_alpha_pll_slew_update(struct clk_alpha_pll *pll)
> +{
> +	int ret;
> +	u32 val;
> +
> +	regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_UPDATE, PLL_UPDATE);

There's an ever sweeter sugar-syntax for this case - regmap_set_bits()

> +	regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
> +
> +	ret = wait_for_pll_update(pll);
> +	if (ret)
> +		return ret;
> +	/*
> +	 * Hardware programming mandates a wait of at least 570ns before polling the LOCK
> +	 * detect bit. Have a delay of 1us just to be safe.
> +	 */
> +	mb();

Since you read the value of PLL_MODE back, the barrier is unnecessary

[...]

> +
> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));
> +
> +	/* Ensure that the write above goes before slewing the PLL */
> +	mb();

Here however, the write may not arrive at the clock controller before you
proceed to slew_update()

> +
> +	if (clk_hw_is_enabled(hw))
> +		return clk_alpha_pll_slew_update(pll);
> +
> +	return 0;
> +}
> +
> +/*
> + * Slewing plls should be bought up at frequency which is in the middle of the
> + * desired VCO range. So after bringing up the pll at calibration freq, set it
> + * back to desired frequency(that was set by previous clk_set_rate).
> + */
> +static int clk_alpha_pll_calibrate(struct clk_hw *hw)
> +{
> +	unsigned long calibration_freq, freq_hz;
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +	struct clk_hw *parent;
> +	const struct pll_vco *vco;
> +	u32 l;
> +	int rc;
> +	u64 a;

A reverse-Christmas-tree sorting would be nice 

Konrad

