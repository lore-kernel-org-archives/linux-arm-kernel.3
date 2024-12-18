Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBE1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 11:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSAIpP3vHzYCPqelUrOZtnAmCrK9TwEHJ8JYEWRi3Iw=; b=vMjvJ1Xkuymtz5gh4UtEYCsx9A
	T51i0dopaJ8MwAwuQax11s9je1w3UccekSxHwMGwm3B+7mfzmVkKWNf4by1yl2iSfamncRPg2g6xv
	UpE+8aSNgab4tTLrQzQk93QLRcCHyGLdXLSKut4lcJNfFgyd3Arw17IyaP58UenNU/BM3eV04CWST
	6YgPqkXvnNj6DEu6aLVF3Ce08GpTdHLqp0Cyj08oDJqhTegzRtQQUFfT6qLgGzptOm+hf6M45un9M
	+UTu5OXPsTI9Z2g5FMZL20JopNNzA/unWIByJh5z/EdyRjFdUaCmPTROI+2O4DUDATPGAfgs5HsHX
	ADINoLrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNs4Z-0000000GQZg-43wz;
	Wed, 18 Dec 2024 11:18:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNs3O-0000000GQLr-3Y86
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 11:17:24 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI4YAbm004011;
	Wed, 18 Dec 2024 11:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rSAIpP3vHzYCPqelUrOZtnAmCrK9TwEHJ8JYEWRi3Iw=; b=lpJUP4SlFEb1PfN2
	NNqNFMIIrHELFVx1CPeAVS2zE+7cVHQ+C4Ld6Cw9og1I4eb5I7sZ1jHzhxETpy1q
	oOxfKXyyqMpoBk+OnOgruE+eSpSUGZ3SLOP7xdDiIFYSTo05nXaIO+HQVpB4mUtf
	zGKlLmCwXzGAUwYkn7/6Tv6rBBIuA1/r/U9LnxOAiM+pNhDlROcjK8kTYVkQB+Ay
	TWAYvK7q6X8ghqw+tRekN59c/Kk5FN2dAaBr2gphfE8kry1vr+TCK9t/zXda5U5+
	hGLAjyeNm7y6fty/ChNJJmwHn3XYgxogsLahtzvBlCcaCjblhrCnouwGgQDPs7qM
	PjcVKQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kqfsrx6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 11:17:13 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BIBHC7e027681
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 11:17:12 GMT
Received: from [10.253.10.199] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Dec
 2024 03:17:06 -0800
Message-ID: <2456ab36-f48e-4aa3-88e1-aeb7895c9816@quicinc.com>
Date: Wed, 18 Dec 2024 19:17:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: Update IPQ9574 xo_board_clk to
 use fixed factor clock
From: Jie Luo <quic_luoj@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <bartosz.golaszewski@linaro.org>, <srinivas.kandagatla@linaro.org>
References: <20241107-qcom_ipq_cmnpll-v6-0-a5cfe09de485@quicinc.com>
 <20241107-qcom_ipq_cmnpll-v6-5-a5cfe09de485@quicinc.com>
 <0776a26e-56cd-4838-9b52-210ae9a1f281@oss.qualcomm.com>
 <8063460d-18ad-4e54-8232-716bad9d37c3@quicinc.com>
Content-Language: en-US
In-Reply-To: <8063460d-18ad-4e54-8232-716bad9d37c3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ru_USJpoJE25j71X-NtyJ94x5LsqLzxu
X-Proofpoint-ORIG-GUID: ru_USJpoJE25j71X-NtyJ94x5LsqLzxu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=918 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412180091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_031723_006179_3BD03280 
X-CRM114-Status: GOOD (  17.66  )
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



On 12/13/2024 6:30 PM, Jie Luo wrote:
> 
> 
> On 12/13/2024 2:33 AM, Konrad Dybcio wrote:
>> On 7.11.2024 10:50 AM, Luo Jie wrote:
>>> xo_board_clk is fixed to 24 MHZ, which is routed from WiFi output clock
>>> 48 MHZ (also being the reference clock of CMN PLL) divided 2 by analog
>>> block routing channel.
>>>
>>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 7 ++++++-
>>>   arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 3 ++-
>>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/ 
>>> arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>>> index 78f6a2e053d5..9a8692377176 100644
>>> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>>> @@ -174,8 +174,13 @@ &ref_48mhz_clk {
>>>       clock-mult = <1>;
>>>   };
>>> +/*
>>> + * The frequency of xo_board_clk is fixed to 24 MHZ, which is routed
>>> + * from WiFi output clock 48 MHZ divided by 2.
>>> + */
>>>   &xo_board_clk {
>>> -    clock-frequency = <24000000>;
>>> +    clock-div = <2>;
>>> +    clock-mult = <1>;
>>>   };
>>>   &xo_clk {
>>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/ 
>>> dts/qcom/ipq9574.dtsi
>>> index 8246a00a3e3e..25aed33e9358 100644
>>> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>>> @@ -32,7 +32,8 @@ sleep_clk: sleep-clk {
>>>           };
>>>           xo_board_clk: xo-board-clk {
>>> -            compatible = "fixed-clock";
>>> +            compatible = "fixed-factor-clock";
>>> +            clocks = <&ref_48mhz_clk>;
>>
>> This must be squashed with the previous patch, you can't introduce
>> code and replace it immediately afterwards.
>>
>> Konrad

Hi Konrad,

Looking at this comment again, there may have been some
misunderstanding. We are not introducing xo_board_clk in patch 4 of this
series. xo_board_clk is a pre-existing node.

As part of this additional patch 5, we wanted to address Dmitry's
comment earlier in v5 (reference to comment below), by converting the
xo_board_clk as well to a fixed-factor clock. So it is better to keep
this change as a separate patch in my view. Hope this is OK.

https://lore.kernel.org/linux-arm-msm/CAA8EJpoQO7=v8QWeH8MAgX4uU=m4VJqfC3J5PKyySM2TBcHWiw@mail.gmail.com/

> 
> Ok, I will update the patch series with this patch dislodged, and push
> this single patch in next update. Thanks.
> 
> 


