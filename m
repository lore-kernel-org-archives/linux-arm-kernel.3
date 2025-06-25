Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CACDC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 14:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TY0aRHBLdl0DmpqVjjZykDuD69OMabfh0VxTT1y+MDk=; b=ytpWpCh1TG8hQRiOETi2uP6dxc
	X9DVp7EDNCkAcecW0dEFgy+e6zrZHv2x18RxuYOidHL+NqOrQ4atyF51s4ZyJoaAFYrNDHRI8xvU5
	SJZAaf5SMSa+jQ364yHJztg+8K96/gRmNEjx0gpE6t7YXXypBzI0ShNHDjy5oLhTpd5Hg9Gr2FnjS
	8nYGHyK85Poeeu6Jsi9Y6BqoJjh6XHOX3WDgagxwYr1W7cVZiOPl44K+VbtUNfFBIkJICedOWAYcn
	vcHLmuVKhpRY6GdPRiqoYfI/hVjCbV9L9HKp76ZCIWbG3o0CfwaOIi7y9FjRFUShFog3Y5YwkxvDC
	V7zJ+9jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQn1-00000008uPa-1rRa;
	Wed, 25 Jun 2025 14:07:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNVJ-00000008KiD-1a6k
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 10:37:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TY0aRHBLdl0DmpqVjjZykDuD69OMabfh0VxTT1y+MDk=; b=eyz/bxeMGvsuWRJit595x7xorX
	Tt+uznkHM99dEuswRgTdoOv78hW0N6dGqsWNGuzI6OoCyr7dVUKZRHn8PLA4QJClHi6k7Y1c799Kh
	BugTRHo7UpyvECjCmeMQFYhIlZ7/fddzLioNBofGZKPyur76rgxzQSV8SRL2V2/ukPUDk6BCFVBQv
	frctPb5Rl65EVIZBxVYyUSu4jQDuFp8P2T4lyhlKpopxatwlaHfYTKEqosIQKzxyYyYaTreMY6nK/
	9yn9TZEWZATzUnmisnWUJCkQFGcwabHGkPiM0G8foYURwCCR5pTKTsPh8dSm5bk00oswZXvR0TvHP
	BL7M5Yjw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNVG-00000005n0K-2ysl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:37:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P40qYg021010;
	Wed, 25 Jun 2025 10:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TY0aRHBLdl0DmpqVjjZykDuD69OMabfh0VxTT1y+MDk=; b=hakSl2lkAgNh0Yv+
	EUij9HmpGjgnPcoYDkndFJao/bNoWTm57cWKWzot1FX819LJx+UYLxNm0pKvMzPO
	Zrj1nFQ+rL4YhzSH7TVowzLl50Fcz7zfHO6gobQ1TZD9N3rItGQWPwdZ+9HyyPhx
	uYXVqZBFg6np1kbwMgT5Mr7OmUNhHKtb221M+ajxQDecvu23RSw9Qdj8D3KM5gPo
	imiUPThdGe9NeBYtmi3pAC1NrYdwdifEsWDrsPIwvRz2mAEn8tQLAFHdSvY/7Nvc
	bJs0DyIcbOaUuukY95hk4N+POdEjdozKowQw+FQtiPBBvzIv46dt2hnq4d9bgZkY
	86ZP1Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwwu2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:37:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55PAb7rD018872
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:37:07 GMT
Received: from [10.217.217.109] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Jun
 2025 03:37:01 -0700
Message-ID: <8fd3b2fb-51d1-44dd-98d9-d7e01693fba9@quicinc.com>
Date: Wed, 25 Jun 2025 16:06:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/10] clk: qcom: dispcc-qcs615: Add QCS615 display
 clock controller driver
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
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
 <20250612-qcs615-mm-v9-clock-controllers-v9-5-b34dc78d6e1b@quicinc.com>
 <09c40216-c0a2-4698-83b6-b838c28eed84@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <09c40216-c0a2-4698-83b6-b838c28eed84@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: P2LSXj0nm9Daqaaa040_c9vmHzNIfNoN
X-Proofpoint-ORIG-GUID: P2LSXj0nm9Daqaaa040_c9vmHzNIfNoN
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685bd154 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=6_WM4ebCss1HmxTYlEUA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA3OSBTYWx0ZWRfXyqtzY9id0Qfg
 zxkSE1Jgl3+nCOOVo1G0VM84lELyx2JiPMUJhjCyRz/buy8dvqoUPFr3Hm8XMIksX3zI3gyj1qw
 y6n7BZ4WgMXs8keR4RObrrkcu7Q9uKnLCojCPVOazcZFlLwpFMT1fiCTHXD0bgA+hjPMSX/i56E
 eKGKXX8gI4RmBZWV5ErubwvmFvIRmhHZJP+IdWO6nH+VSVq4xf6tLQ0VTjVkCdTCFzs904RHsSj
 ipSC2DdMRWBIuDCBKZAo5QOf47a7DJjTAU6ve+iTI/wFsidMPRCIsq27vygmX/D7I8GI8tJEXyy
 WewvMqYX+pU8e6+QuC3jMaDPqlQPIYraqUGObKs4mTgOuLG3IDbDK9meTiyr0ufE3+rfeEUQa34
 /sdcoblK7GVIgiyyEg/j0Gv6o+/iDBMqcCjDitbutLm3TOPTN7Sw32LbGQ79H8Kk3r90vsBb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_113719_004739_0CB70DFD 
X-CRM114-Status: GOOD (  13.51  )
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



On 6/15/2025 12:39 AM, Konrad Dybcio wrote:
> On 6/12/25 11:55 AM, Taniya Das wrote:
>> Add support for the display clock controller for display clients to
>> be able to request for the clocks on QCS615 platform.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
> 
>> +static int disp_cc_qcs615_probe(struct platform_device *pdev)
>> +{
>> +	struct regmap *regmap;
>> +
>> +	regmap = qcom_cc_map(pdev, &disp_cc_qcs615_desc);
>> +	if (IS_ERR(regmap))
>> +		return PTR_ERR(regmap);
>> +
>> +	clk_alpha_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
>> +
>> +	/* Keep some clocks always enabled */
>> +	qcom_branch_set_clk_en(regmap, 0x6054); /* DISP_CC_XO_CLK */
>> +
>> +	return qcom_cc_really_probe(&pdev->dev, &disp_cc_qcs615_desc, regmap);
> 
> Similarly:
> 

I will update in the next patch series.

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


