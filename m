Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D68E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 02:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=od/XFx58U98oR4tAvKQJ+3p2owZykZqJH532d7fHnEw=; b=wv3d2JNBJyq0FErXl24Wmt0GKC
	smWd6om91Tqs2Web82LW1c5KwWhn6m8h19JS8UhveSQ9HJbeQzzEQVN/3wUsWh6HJ+WrywHaN1N3O
	XUulxrgj0e6dJrZgJRTIZjRU2tGd0RfCLluSk3jV8T38E8qKBV6nxZAe4f6afQUMtFbqWO4ceuhvH
	V8F/XPFHDCb8gtljnfsqAmsm9SHK1J6f52QPJw/TVApuOxXwaDxELiDGr9el0m/Kg99CLcRt3WX0B
	5Da2yEAOI1aw2RMl23g73GlsFiKpUwkIW4nj5Sbix9wSQ/KTtWNZniPcrLY89VKGUT7NYzqSx0x9O
	rkyTBT+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQdmD-0000000EzLb-1VVn;
	Thu, 26 Dec 2024 02:39:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQddV-0000000EyGl-2XlX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 02:30:06 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ139tf008317;
	Thu, 26 Dec 2024 02:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	od/XFx58U98oR4tAvKQJ+3p2owZykZqJH532d7fHnEw=; b=HXSbTKb03N2O1w6q
	Z+2g02aS/hdpMUiuB0D1D88cC+FTgZgL+TB9qYM2i2KRVKiSEqcIacxdO9pPlM4k
	KvQa2BO6x3BgkPsF1BGZfd39jh0VqJuOUQ5hBQpb21Cs5nt5XQTwtEEA4d5zSh1U
	NXQ7TaexlRreyF7CMqcuXB936lOAZ9CdHBKto/56P5d4gwj+VT9NWyif9InyxcH1
	9E6XiDdbL9vuMRE3/HadzlR63hNY7EUTK59A2TvDlopm+05cupLlrK8uwZpyQFKz
	ZmX08PiXkfRRXO7wJ8alYYqOoMMdn2x9xYOZWDAUDRuVbfRR4sITkwmTad2+NMF7
	9Bvt2w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rhfksye2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 02:29:56 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQ2TtDQ016070
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 02:29:55 GMT
Received: from [10.253.74.39] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Dec
 2024 18:29:49 -0800
Message-ID: <278de6e8-de8f-458a-a4b9-92b3eb81fa77@quicinc.com>
Date: Thu, 26 Dec 2024 10:29:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] net: stmmac: qcom-ethqos: Enable RX programmable swap
 on qcs615
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
 <20241225-support_10m100m-v1-2-4b52ef48b488@quicinc.com>
 <4b4ef1c1-a20b-4b65-ad37-b9aabe074ae1@kernel.org>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <4b4ef1c1-a20b-4b65-ad37-b9aabe074ae1@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AOBlQU9L5TuDKSokIOpvw-RMG2nQrM7M
X-Proofpoint-ORIG-GUID: AOBlQU9L5TuDKSokIOpvw-RMG2nQrM7M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=955 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_183005_679692_578C2D7B 
X-CRM114-Status: GOOD (  14.94  )
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



On 2024-12-25 19:37, Krzysztof Kozlowski wrote:
> On 25/12/2024 11:04, Yijie Yang wrote:
> 
>>   static int qcom_ethqos_probe(struct platform_device *pdev)
>>   {
>> -	struct device_node *np = pdev->dev.of_node;
>> +	struct device_node *np = pdev->dev.of_node, *root;
>>   	const struct ethqos_emac_driver_data *data;
>>   	struct plat_stmmacenet_data *plat_dat;
>>   	struct stmmac_resources stmmac_res;
>> @@ -810,6 +805,15 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>>   	ret = of_get_phy_mode(np, &ethqos->phy_mode);
>>   	if (ret)
>>   		return dev_err_probe(dev, ret, "Failed to get phy mode\n");
>> +
>> +	root = of_find_node_by_path("/");
>> +	if (root && of_device_is_compatible(root, "qcom,sa8540p-ride"))
> 
> 
> Nope, your drivers are not supposed to poke root compatibles. Drop and
> fix your driver to behave correctly for all existing devices.
> 

Since this change introduces a new flag in the DTS, we must maintain ABI 
compatibility with the kernel. The new flag is specific to the board, so 
I need to ensure root nodes are matched to allow older boards to 
continue functioning as before. I'm happy to adopt that approach if 
there are any more elegant solutions.

>> +		ethqos->needs_rx_prog_swap = true;
>> +	else
>> +		ethqos->needs_rx_prog_swap =
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


