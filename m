Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B30E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 06:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXGwN3B4CatXIc79rUG8DB695XnToJE0LbzpQoCZtRo=; b=ufGcjvNGxIsIjCrWYYpro6kN5D
	XcOge2QIBW9cMH/AQbFw9EublohsRdnKl4px/8QkxpR8z+1pfSQQwT9EEcaB5Hi3f2/v0s+mCthib
	cS7V1/DQGqdHX/1+At5d3jL7YsLlmlJxiJaCxOBhZ5DXRl7/566YHRzUQxJnqG5k/+y+riBNyl1R+
	k1QlUsDkxm6Vn6hK9GOVBbPz8Jw620EDN4cnbpOC/9uwPLsnfXHCEaapCBGgHKRXml+KTbKq8pzKD
	yM/XiO9xnWArCodHHgkUbb98SJ1Wzv/8Kq1UKLHraOeU7DdWyQKOxzJg762ZmyKgMR6YaXL1LLvM/
	F3Q/3DRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPy1s-0000000BKjJ-26av;
	Tue, 24 Dec 2024 06:04:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPy0e-0000000BKdv-3W4G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 06:03:14 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNJsFHF029564;
	Tue, 24 Dec 2024 06:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FXGwN3B4CatXIc79rUG8DB695XnToJE0LbzpQoCZtRo=; b=mHI5ck+X5Bh1CJfr
	i+B8jXvlNF7b5vHmjadu6oBDBTuqJOxmJHnOn6uUgDCujHP3qgDiFYwAXiR440bj
	/Kpj4d9jpcXxMRrVdC4PXstxAo8ouBhRQIneaqEWFyQJtH+TZh5OGF5dOcKH8z93
	yEmlykA9flL5F1O8MCDb0mOj3628oISq7nHUIeq9hTe3vaLkThVetmrqmWg7dG2J
	iJBnLW/uuIwBeqXOaZpFFXgxs9M+0lXR12xgtKCWr9F3sGDGkqw+MQEEHSorn/a8
	aPFwwb1BtSNXjItHjJA/149MhQUKcjyjOV8kTQERePBPDbjM8Y6DiJMQX/Np8HcJ
	71G+dg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qee0hd72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 06:03:03 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BO633s2029146
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 06:03:03 GMT
Received: from [10.253.36.144] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 22:02:57 -0800
Message-ID: <6cb92d11-eb5a-418b-ab9b-7c6be168fd06@quicinc.com>
Date: Tue, 24 Dec 2024 14:02:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add standalone ethernet MAC entries for qcs615
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David
 S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro
	<peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
 <t7q7szqjd475kao2bp6lzfrgbueq3niy5lonkfvbcotz5heepi@tqdiiwalhgtg>
 <c57a18aa-6606-4a3a-b508-8e335fda3e31@quicinc.com>
 <CAA8EJpoSUepFZgXHmozdPwWdtrjYiMa4bDsozuEr=tec1wj_Gw@mail.gmail.com>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <CAA8EJpoSUepFZgXHmozdPwWdtrjYiMa4bDsozuEr=tec1wj_Gw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nv834TXd3nvFwaEYRt9Ap8MwSHnDP0i2
X-Proofpoint-GUID: nv834TXd3nvFwaEYRt9Ap8MwSHnDP0i2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=741 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412240047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_220312_909037_83A015CC 
X-CRM114-Status: GOOD (  13.30  )
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



On 2024-12-24 13:53, Dmitry Baryshkov wrote:
> On Tue, 24 Dec 2024 at 07:47, Yijie Yang <quic_yijiyang@quicinc.com> wrote:
>>
>>
>>
>> On 2024-12-24 12:16, Dmitry Baryshkov wrote:
>>> On Tue, Dec 24, 2024 at 11:07:00AM +0800, Yijie Yang wrote:
>>>> Add separate EMAC entries for qcs615 since its core version is 2.3.1,
>>>> compared to sm8150's 2.1.2.
>>>>
>>>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>>>> ---
>>>> Changes in v2:
>>>> - Update the subject for the first patch.
>>>> - Link to v1: https://lore.kernel.org/r/20241118-schema-v1-0-11b7c1583c0c@quicinc.com
>>>>
>>>> ---
>>>> Yijie Yang (3):
>>>>         dt-bindings: net: qcom,ethqos: Drop fallback compatible for qcom,qcs615-ethqos
>>>>         dt-bindings: net: snps,dwmac: add description for qcs615
>>>>         net: stmmac: dwmac-qcom-ethqos: add support for EMAC on qcs615 platforms
>>>>
>>>>    Documentation/devicetree/bindings/net/qcom,ethqos.yaml  |  5 +----
>>>>    Documentation/devicetree/bindings/net/snps,dwmac.yaml   |  2 ++
>>>>    drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++++
>>>>    3 files changed, 20 insertions(+), 4 deletions(-)
>>>> ---
>>>> base-commit: 3664e6c4f4d07fa51834cd59d94b42b7f803e79b
>>>
>>> Which commit is it? I can't find it in linux-next
>>
>> It's a tag next-20241108, titled 'Add linux-next specific files for
>> 20241108'.
> 
> Nearly two months old? okay...

I will provide an update in the next version.

> 

-- 
Best Regards,
Yijie


