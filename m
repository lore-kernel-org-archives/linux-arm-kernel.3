Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10392C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 11:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bqNfxhiVgtp6+b+dgaD2EKdBvt2O27n714u9pvQagvI=; b=tpQZO/4IHtwWvEKb+kuaT2OP8f
	Q9pyby7MAt35gKw5VhMXg0+rNIVPm8hYcEWj6ENrpWq2afj3F+wzyrebFVOmWUpGMpZuZY2n0mDa5
	xph/m5Xa/P/JyeSwQ1xHYBV2ifwJ9aK4ahFpTbM+MHqK8CscwPy2bDZ3+Wrg/TkTch+zTNi1QEdwy
	9gBwMEq64nDsBkYjs3Zd3B7DDZ5Um89oWbTTjApSEpOGcBwzfmBoNi8EQd4b97bPhGht6hgCoHSG5
	qxWtW68Fbh2iQKiL4146WQ6wbzI0jCr38+0Hy69mgPHrmvBMBjT+6EpkEr5Qpwc2b+N/WLi3VRcWS
	I4r+T2GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOCr-00000008SFk-2bPD;
	Wed, 25 Jun 2025 11:22:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNQ5-00000008JnS-49BA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:31:59 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P5Uaie014612;
	Wed, 25 Jun 2025 10:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bqNfxhiVgtp6+b+dgaD2EKdBvt2O27n714u9pvQagvI=; b=XzToSTZ0KsbbIJtH
	RpNbVkpTzIIIb1YzfKdUbgPnLWnMBaLCaaVtDyUl+GnP2rx29vzWXTyGHLnS2h5Q
	vexLBZGPXICymQWLnnPPLU7GRHi7vFIcn6dmXSDsQ7U8SQKMlKHQbjrWz6YJhMsv
	RT9wcWroniGIrkgomUmbc/T6fRrH81Fc/OKVQHifYL4ITNrx05vKEEXKkmO27uxb
	H4ZoAucXMoo8k03wj8RcbIoH29Q9tNP+NQYXaJHwzZFgjQONRkLyF+ACrlbyg1HQ
	T+and0y93ENwubsYz3+mv2T3Ome4lsF9KsdGQBIl0lTi7cjiF85F07+3J705Bl+c
	tp08Lw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpys08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:31:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55PAVo2x005987
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:31:50 GMT
Received: from [10.217.217.109] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Jun
 2025 03:31:44 -0700
Message-ID: <d2821ffe-32c4-4153-84fd-df4bc7d2b3e5@quicinc.com>
Date: Wed, 25 Jun 2025 16:01:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/10] clk: qcom: camcc-qcs615: Add QCS615 camera clock
 controller driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>
References: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
 <20250612-qcs615-mm-v9-clock-controllers-v9-3-b34dc78d6e1b@quicinc.com>
 <b89c5809-38c3-4b62-b26f-073869674b95@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <b89c5809-38c3-4b62-b26f-073869674b95@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685bd017 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=G33nDIIeno827tu5fgsA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA3OCBTYWx0ZWRfX+tZcl40zosdR
 ECvQ8R20nwv+WOy7ENtVN5lr/KaamnN6XC8t5gYQMBGk3Pzk8HZ6JBY0lBhvvfND3Xcg+DlnwB8
 n+FrAqhNQ+iB7PLOzk6/fkhe46A3rnO0LcOABsa0noQD3XUt9VGJukQrh9YqYUpCVYK2DAI8WyS
 rsPknSaUifiRcv32P/8sbuNogv85GG9d+ZRt1rMAysLysjmcwEpWuloGIFpA5hvfWltKHIiMoC6
 9MnSXK+8Fg9GSugoikOme82jOhZEdUEnSOH2CvWPkxcR/xjp04WJ6RkkV8IYhvmxDcmF/T/BsJf
 4qUE31Qc5BjGCrEe8a3n9LaHf/xdNgMbs/F1TCfTy7RsuggRJ44xtJxz2qpK5CJbRwU25YPLqfm
 suvMPeRqedn/t0NUdzQEnJhFN/KToufJb0nszJzXeLLqvLwClLb1RR24l0X0hhsOk+W2RBVU
X-Proofpoint-ORIG-GUID: aVU9lOVhjQEr9x5G9R3MQaOsCUQ8-jFN
X-Proofpoint-GUID: aVU9lOVhjQEr9x5G9R3MQaOsCUQ8-jFN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_033158_150752_E76B7A0E 
X-CRM114-Status: GOOD (  13.26  )
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



On 6/15/2025 12:37 AM, Konrad Dybcio wrote:
> On 6/12/25 11:55 AM, Taniya Das wrote:
>> Add support for the camera clock controller for camera clients to
>> be able to request for camcc clocks on QCS615 platform.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
> 
> [...]
> 
>> +static int cam_cc_qcs615_probe(struct platform_device *pdev)
>> +{
>> +	struct regmap *regmap;
>> +
>> +	regmap = qcom_cc_map(pdev, &cam_cc_qcs615_desc);
>> +	if (IS_ERR(regmap))
>> +		return PTR_ERR(regmap);
>> +
>> +	clk_alpha_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
>> +	clk_alpha_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
>> +	clk_alpha_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
>> +	clk_alpha_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
> 
> Please convert to use Jagadeesh's recent helpers
> 

Yes, will update in the next patch.

> with that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 


