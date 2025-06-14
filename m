Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF04C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 19:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CO7GBylWWl+fwo+IkF7T+4QyCFqae8eZKA5W8pecqIU=; b=UxFvoYSG2zW37GvY9b/Aiqmdfw
	AU5Jb2D9fl9VJR5sQlA7k5dW/FiqbK9lOY/Ji8UquWgQgN0m7CvEfQG1X2kG/3DgRnfQZuNoxv2pi
	kkJob5iGueAusk3Xjg1LJVgHxDqlEtf+02Bj5GoVz9vgBCvrDts7te6H2VrG9q5qoIwL1VKw4ElvZ
	YNV7FJuEWaMXdNLpicgArb9X/+u6eY9sEbxaJH6fnjE7RSobM4X1w+k743b3qrxtlZKDnL/NUw/v2
	yn7uPRqB72XQ2wCuPgrwVYpIe8kGFT+OYvkZyG0JEGR2axU26wLssQ35cnpDhbrYLYA13RQD/6JHq
	bHTbN/zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQWRQ-00000001jxD-37PH;
	Sat, 14 Jun 2025 19:21:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQWPE-00000001jkF-090j
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 19:19:09 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EBgEru026625
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Jun 2025 19:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CO7GBylWWl+fwo+IkF7T+4QyCFqae8eZKA5W8pecqIU=; b=K2LbgRw6FWdqBxoS
	EU8VuP6MiSmFQocI6knnZ74nWWFa/gCoLzB0tIJmGSqXlP5Sod6IM59gMXg0TN9R
	3TQG95I5QNlb6lljfLQXw8ha+7//Az2nRsZCoiR0YhXqVf4PLE9Dn0WGZ9bJ7jUV
	ktgCGSQYfAZWBOtpPaTF1oROrX9E7uifXbFo9GkEevObfXvxR3/1RCwvM3DX1qFY
	ul5IhLGdh26cC+PaoD+bUCc5kPjYWTK0SDmclhUlxYwkmIeTbHgFnt5rM2OhqWT7
	eAMpyU9j28JLnNp+HhZ6FeoZ1ZutYMHwNAoTMeNuByaJRnWXiqWvyqhukobqqZ4z
	KXsrHg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791fsrwsd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Jun 2025 19:19:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0a9d20c2eso101077185a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Jun 2025 12:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749928746; x=1750533546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CO7GBylWWl+fwo+IkF7T+4QyCFqae8eZKA5W8pecqIU=;
        b=omOWWujOZ31hHsHln/Nx9qi9dUTgDOo3n0vSXZIan493V6Ym0PxkAn0ZeEFnPeWm5t
         sXurxy7sw0x11y0qg8c56er2GXxkXtsB1iEARA/gJ0FRzTrdvVej+GXsEAgpKcfcxPeC
         0z2ys3uMMmgr55XpiaOjROyQSjYr/0K0HJOxYtaI+wmD38SBgvq+sG/6P+91repbjqC7
         XWAlUbI8f049BtAiZkiKUGZu7th8Ki+vSMrxekTkkRtUkMKuglGVNP6TcvAJ8L2e0sfR
         NFE2O2MXGm+r75mVQNIR701n7EPsdMp2G72U5oC9I/qoGKqINJ0EwEfz5ivzIeuPAldp
         JSZA==
X-Forwarded-Encrypted: i=1; AJvYcCWA6InsBlSky+8x8UbIT7ScDGOIlfoa9OiuR3MptkEV3Z/LQeFerS/tF3rZR7WL6KQz7bSY5NjtPJbeIyavCtLe@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1kBGprYZ6y9WvhI7l2rTMKMM/VU2yIPyDNXsdY8zbw89kZYuh
	z/XazG5s7Tjp/iJOKm0szMC/+cAduG7hUwAryin39QaF7zAt9VZ8QflYO9g8h2AGua9Eztx9Rww
	v1yquRE5cF4mpCj4543PdhNUpmETM3OuhC4cyUtBVdWUu33l2Bqk0wcYi5qdcXvlnqk/GySI6dA
	XY8Q==
X-Gm-Gg: ASbGncsRYI/nTxFk4KwSiwov1Fe17+p1KxLqwgsPvm+bEcLPHeOhrLWbl5F6tle25Cb
	PHpfosQjeAXEEBAvJn3nduzL+D43KPz9WY+umVIuxud05tpISFpUCgvNUfp2PKG8wRc/v4ejR5E
	Nsniwbrzx3UnroBb1mzEZLGz9MFpnHDUTOJKJ5QHgUz+s1SfKXEXGSffH7/kRsJ7JcTvXqJpzvl
	gWSfe5GbABnXyc836RLM0VODrt3iA9rFLBFT2gq+ZlF+Eqz77g6jNdxk604eSGbievvhhazTcdo
	/IqR2/lqAvxpPKpCiqq/pWqmhqQMnTMa2Vbt4DJu84nXyh4UxX4k1xh4sZbjTOsc6peHL2ZhrOj
	M3h0=
X-Received: by 2002:ac8:5a07:0:b0:494:b722:141a with SMTP id d75a77b69052e-4a73c610d1fmr21771491cf.13.1749928745799;
        Sat, 14 Jun 2025 12:19:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtvCIElzY5rB8ZQ1ay4v583nOREgAN3HqTp4Uk9iaSzJMhURaskdck+1YjGvG2ZGck1/8UTg==
X-Received: by 2002:ac8:5a07:0:b0:494:b722:141a with SMTP id d75a77b69052e-4a73c610d1fmr21771181cf.13.1749928745313;
        Sat, 14 Jun 2025 12:19:05 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec897acfasm345456766b.161.2025.06.14.12.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 12:19:04 -0700 (PDT)
Message-ID: <75fea0f5-88ca-4099-ba48-997e46bf4de5@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 21:19:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/10] clk: qcom: gpucc-qcs615: Add QCS615 graphics
 clock controller driver
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
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
 <20250612-qcs615-mm-v9-clock-controllers-v9-7-b34dc78d6e1b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250612-qcs615-mm-v9-clock-controllers-v9-7-b34dc78d6e1b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE2MSBTYWx0ZWRfXzn2+E+Ub7RD3
 51YSMutMuIHpIryaxDrCQMKxIca4mPILPtoCudSzBfFtkRKIfuYMAxUWvgB5HnR1eWG28JCISix
 9yHS+D4QN0CsQJuI8df8JbMDcjBTMOcOE+kCWaM2NMrpef7VyNRNNND87GmVl1MfeROfLCA8Hcg
 jFvIs0hZ214DuxnScPemhf8gaaZAzD+df/UwHAfDjCUheVqgHcOH4PdAKcfx+FAW7MvXvRlFoQr
 0XX/3fYFbP9WKlKvLz23qpCoJNMioTMqsQg1gVmDOxrnXxuzDtsBFQv3T8pqR58GP5i5X9kLfHU
 WU9w9O7Ln5/J1ve7uRu7gEFKBn161w8yBof3zpwxUdAP7p4LXKVuf5568E8FQmxY7gmhYSwIvQA
 2H1EUttXkh1oFwgkCx4Ez8LqD0Yd2asDPaFCSrdrLZACGGKPkDba/94ncVJMFoRTDOWHQJA1
X-Proofpoint-ORIG-GUID: 9bF-ZVcZpxR1L42ADrOx-chhPVMg38cZ
X-Authority-Analysis: v=2.4 cv=OLIn3TaB c=1 sm=1 tr=0 ts=684dcb2a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=3ze65spd1aMdTggYaI4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9bF-ZVcZpxR1L42ADrOx-chhPVMg38cZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_121908_195464_26A88178 
X-CRM114-Status: GOOD (  19.78  )
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
> Add support for the graphics clock controller for graphics clients to
> be able to request for the clocks on QCS615 platform.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

[...]

> +struct clk_hw *gpu_cc_sm6150_hws[] = {

"wink"

[...]

> +static void configure_crc(struct regmap *regmap)
> +{
> +	/* Recommended WAKEUP/SLEEP settings for the gpu_cc_cx_gmu_clk */
> +	regmap_update_bits(regmap, gpu_cc_cx_gmu_clk.clkr.enable_reg, 0xff0, 0xff0);
> +
> +	/*
> +	 * After POR, Clock Ramp Controller(CRC) will be in bypass mode.
> +	 * Software needs to do the following operation to enable the CRC
> +	 * for GFX3D clock and divide the input clock by div by 2.
> +	 */
> +	regmap_update_bits(regmap, 0x1028, 0x00015011, 0x00015011);
> +	regmap_update_bits(regmap, 0x1024, 0x00800000, 0x00800000);

I'm going to assume this is not the same ramp controller as:

drivers/soc/qcom/ramp_controller.c

..or maybe it is one, but we need to set things up on the CC
side

> +}
> +
> +static int gpu_cc_qcs615_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +
> +	regmap = qcom_cc_map(pdev, &gpu_cc_qcs615_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	clk_alpha_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
> +	clk_alpha_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
> +
> +	/* Keep some clocks always enabled */
> +	qcom_branch_set_clk_en(regmap, 0x1078); /* GPU_CC_AHB_CLK */
> +
> +	configure_crc(regmap);

Likewise, please rebase on Jagadeesh's series, which is now in
linux-next. With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

