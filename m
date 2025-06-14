Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0CBC7114A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 19:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KpeyNaWZvAaZIB4caY9JHuEJ/mF3mbWm+riygqbdpg=; b=3pLYx8u5NXizfbB4fbogVm4Is8
	RawyiGg6rP/A3BVh5enS1MrgMkuwVZ4ZE/wb7PvhrI25QkVjKFKJSgyGKuSWvD/4Z2cqkWiPKy69b
	tv0lpUHaT70bmiIs4qpZSiwpOzXJ8V20RG8+5Gvvykc62DG1Q0ifI2zzL1QnJ+U9HU7DuqbMEEB0N
	f89awzIsG/ZgD6YimGV3SS0uaK9UfUga02D6HdxkkmlOPYPMZE7LgF9eMY6EFBjCJnZ68wyBSMVlC
	CxbdmKRogf4728edNMhHILLKld5u9EPD4W+jANiVsjEiZUvvw41sBfsFhH5lJlRgHD6jHL2gbwqVn
	lgYUZcQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQWIk-00000001j52-248p;
	Sat, 14 Jun 2025 19:12:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQWFY-00000001is4-1FNL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 19:09:09 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EHaeGR009872
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Jun 2025 19:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0KpeyNaWZvAaZIB4caY9JHuEJ/mF3mbWm+riygqbdpg=; b=Me6yFP57Ev5MP6T2
	I91d0P5ocy4Iz9Q//Q9uls5ENPFSRggYssj2XOtVVfgjvir76ii+yQICC+d+dpra
	QYHd1mguDana/9CR9LasQ54lu1TEnFGkSvgLeYqyK4t7ubfiGHv1GoyFRmJVMdGZ
	Mbjo8rNxsZv2UkvHo1G+xOt/4eoq17+T8uT8QquiMwcPg3gFMswSi2t+WbNF1gda
	TajBntzealFLw5xcifQZaWaX+zA32lj+IdzwVAtv3zRoHRjE8zp2NPIKNepOWIq9
	j48at3BxPEV7Zl8CqsZsKbkgS4OHX6hHfksNd+maMVxVX3MwS84yUHRvd/0jamxE
	R7jqBg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h90x3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Jun 2025 19:09:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a582e95d24so5487501cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Jun 2025 12:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749928146; x=1750532946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0KpeyNaWZvAaZIB4caY9JHuEJ/mF3mbWm+riygqbdpg=;
        b=mWAjMBXY8yKBzFH8JdKKZILi1urGfAw2TK75avpggnPXDJTcdh0XEa0joEfhys3Q6O
         5ByPZXD+3KBFDqPo7XnNdlKiSS2T7zecsYZYOexqKnz4ERJyxVOikYcmSRJ3Fx2T0Ytj
         Eak6AeZ1kk42R2ZeYGgTdXfGWmcafTtHvuxF7YRm7mgQikwNNK4XOKqjkD7v3t8P8HoP
         8Mk7MeE+LLxBrt8aErZCa7bNd9FOf2noCDM6mBjU7nw4KkDM8X5nMa08/24xxDoCkApL
         wVIacUyQoz6WqgBsf69507AC6X4sPiIPT8vnUWr1b1PkgIwJcoem8Gb90rgxBkpnOvxI
         y06Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMKmap/reCXlKeWxeIKXar1VEZ+5/HTqrSq3ZpUewz5enfdWi42jNse6FE513i/9/1tx7TFj4tZ0y9NrnInovN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2HWYZ2oeYLhyRE7l6TFjBczrPUTM138BcixNOybDRFgSJndaC
	310e0y9Ovnu8qBqq6yzLE3c/2kifcHmGcHuWNQZ6+ZC0pBHjijoT8cep5Oo/f0nVZir+IT8iO1Q
	yDl/mFQWXK1ulkbU/o9WgAFsGjRtXLN+yyBUBDQ4tnQ1ZTDI4L6Q838etaeCfIi3znSB12vczXb
	7pkQ==
X-Gm-Gg: ASbGncsv400Rw5/8jQy9Km0kKtw6PD4b8va4yZrLElUDql7tHE/MIWag6VgGsm9Or0j
	NHY/R6Oeby6xjUgosVCaSzMpnMmui3Cdwf1w3WUm0kzKFRlSceJyJm6FggvTYvrax1pNVHZvzRo
	yVtJnpLTz/efUUKfZGicGzZiwbhqIUErl5jkQ/tL4yjnr7sn72wLaM8BeaHPbEBI8qzjqiM6KM2
	eQ/4SWh0b+crjGT8YMA2/kXlkKBjZCP56gOGfbb1qLg5b8VS8GbEdvuKQNtw7M/vvfiPG7fbdGz
	0KUpq8rqye31d25aq0WUfR/kRzHFW+UTn2JH11+vf6Lof1KxUMKau7wqw0Jvue3NNXmn/pmUHOp
	8K8Y=
X-Received: by 2002:a05:622a:54f:b0:474:e7de:8595 with SMTP id d75a77b69052e-4a73c619412mr21878731cf.14.1749928146255;
        Sat, 14 Jun 2025 12:09:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvOYiWSYZiYBM1VC9TXTvoNoA6MCXtBB8myxMV9hXqAPT2FHURkrMkoJr7i/FgzC08d+aLrQ==
X-Received: by 2002:a05:622a:54f:b0:474:e7de:8595 with SMTP id d75a77b69052e-4a73c619412mr21878571cf.14.1749928145897;
        Sat, 14 Jun 2025 12:09:05 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8982f4esm352351666b.176.2025.06.14.12.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 12:09:05 -0700 (PDT)
Message-ID: <09c40216-c0a2-4698-83b6-b838c28eed84@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 21:09:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/10] clk: qcom: dispcc-qcs615: Add QCS615 display
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
 <20250612-qcs615-mm-v9-clock-controllers-v9-5-b34dc78d6e1b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250612-qcs615-mm-v9-clock-controllers-v9-5-b34dc78d6e1b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WDhQJEOLJO_fY7zvQxusV8ndwahUNQXq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE2MCBTYWx0ZWRfX0aHaJwvsRkED
 HNW3q57J4ipUHvi3tXtMVZQ5MA6m7pabVRgl9BAJnlzWUc0dkuWcCH5xnFRSP86Tk7Nh5Cm16sT
 7nWfZA7I19vUbPA4eP3AzDDbdk+pX7k96gMe5LGj+wwVznYUVhapzsdW7isg1GJEjrP5hqHwZZI
 exXRyTojuMLiJTTYSVrp9lWAkwIjwPUgseoLMDFYKteOpotnSrNoMpbdp3/C4xnWVoQ9NmtWp1a
 VKyPxpRwmO9+mVDIQ3DWfjFvh0hzlHcWjGtK2IxyECWBwNDqg+OraDKGothvyOxUz3A5myW3PS+
 kgW5OUk+IA+LNs8BalOC6sS+o9lmaR2qq/NZ0PY3brfqS5ZWahJVk8mgt851OQ7jPa7aqA76aQ9
 lVhgt/7Cgduz5fqvj3nlox8Jr0M/rkc0kjb0iHcWlO4LOYP3b3uVN9ctmUXAqmeHHPqUAbGh
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=684dc8d3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=fbCSmPG1eNaTwHpC0zAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WDhQJEOLJO_fY7zvQxusV8ndwahUNQXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506140160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_120908_457613_87DE1008 
X-CRM114-Status: GOOD (  14.30  )
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
> Add support for the display clock controller for display clients to
> be able to request for the clocks on QCS615 platform.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

> +static int disp_cc_qcs615_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +
> +	regmap = qcom_cc_map(pdev, &disp_cc_qcs615_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	clk_alpha_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
> +
> +	/* Keep some clocks always enabled */
> +	qcom_branch_set_clk_en(regmap, 0x6054); /* DISP_CC_XO_CLK */
> +
> +	return qcom_cc_really_probe(&pdev->dev, &disp_cc_qcs615_desc, regmap);

Similarly:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

