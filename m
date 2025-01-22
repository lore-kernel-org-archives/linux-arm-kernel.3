Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2225CC0218C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 09:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jyPDQeLL7dQCNZCqR0yGuA8VrKPQJzFBh9HiXi/qzY=; b=dJpUiZ7b0qGGDpilq8VYG9Ug/V
	lvp9pjO5m3sgYp8ENRkzbtJEfobi+wx928kPr6PsydJkbX9GTvXCooVR4qlakXxwfUYNuai78b0gW
	m5TXjDw827viXvlPk8GKSu/ro3hrCLi/ekeOSxCsXBnTSaxHPFxQMtroHUkPWSak0nKrBcG/dqw+L
	0M+hsFHBmLrs9RW19Xr0L5LOJoUVIcOVUr9HyhlBkjQPr8uu50AfdJgMr311voAV4dcJ3xCn/Y9RQ
	SqvMlsFagqaPvM1sYkfH1/FoMfJvV+L/SOWgshDYYzqh/iwbHDELwKearaEYf/omCGsBDp76zevsQ
	4md5uWLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taXMn-00000009pzt-2YDz;
	Wed, 22 Jan 2025 09:49:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taXKS-00000009pUU-2phj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 09:47:21 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M1gZwS017163;
	Wed, 22 Jan 2025 09:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5jyPDQeLL7dQCNZCqR0yGuA8VrKPQJzFBh9HiXi/qzY=; b=TxBHNVC2HydGZY8c
	TAw/8gaGuW2FYjZRQiPmK/cIVb85bT2IS3lS+Vd6i6UiE7M5Rmw+AAFwC0Byb1dh
	eHGhBJOfIZ0mKgpemWgwNWzNKyJ/Qye6VPXhMw9ARIGTGOTcWh5hYDorpcVCL7OJ
	WfVwic/xzCjiwCW8mEPzAD8YN5zMqXeC8lXAAJhv0CtROjZ7VTMutI9KOYj+4+ux
	67cTkSH6lzevbsZEu/dbeqTrqN4HFh7xBmf9qsfr7U1+A7tDEUWIb46s8mvn6/Mq
	pBSgdP7DjVwGqXUhNZJVUOTrfX57Bvl1xN1GBewk3pDKg7JK3L6imzHQcADAKbzG
	fpSCQg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44aq8gs1mr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 09:47:10 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50M9l9aL014454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 09:47:09 GMT
Received: from [10.253.35.93] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 Jan
 2025 01:46:53 -0800
Message-ID: <6f0aa596-25e5-4c02-9de9-6ee856cea314@quicinc.com>
Date: Wed, 22 Jan 2025 17:46:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] net: stmmac: dwmac-qcom-ethqos: Mask PHY mode if
 configured with rgmii-id
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
CC: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
 <20250121141734.164ef891@device-291.home>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <20250121141734.164ef891@device-291.home>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NUVrdCCtMKwE2XojRjP3EnrdEHuOEZuK
X-Proofpoint-ORIG-GUID: NUVrdCCtMKwE2XojRjP3EnrdEHuOEZuK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 suspectscore=0 clxscore=1011 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501220071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_014720_724498_254D48A2 
X-CRM114-Status: GOOD (  33.17  )
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



On 2025-01-21 21:17, Maxime Chevallier wrote:
> Hi,
> 
> On Tue, 21 Jan 2025 15:54:54 +0800
> Yijie Yang <quic_yijiyang@quicinc.com> wrote:
> 
>> The Qualcomm board always chooses the MAC to provide the delay instead of
>> the PHY, which is completely opposite to the suggestion of the Linux
>> kernel. The usage of phy-mode in legacy DTS was also incorrect. Change the
>> phy_mode passed from the DTS to the driver from PHY_INTERFACE_MODE_RGMII_ID
>> to PHY_INTERFACE_MODE_RGMII to ensure correct operation and adherence to
>> the definition.
>> To address the ABI compatibility issue between the kernel and DTS caused by
>> this change, handle the compatible string 'qcom,qcs404-evb-4000' in the
>> code, as it is the only legacy board that mistakenly uses the 'rgmii'
>> phy-mode.
>>
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>> ---
>>   .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 18 +++++++++++++-----
>>   1 file changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>> index 2a5b38723635b5ef9233ca4709e99dd5ddf06b77..e228a62723e221d58d8c4f104109e0dcf682d06d 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>> @@ -401,14 +401,11 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
>>   static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
>>   {
>>   	struct device *dev = &ethqos->pdev->dev;
>> -	int phase_shift;
>> +	int phase_shift = 0;
>>   	int loopback;
>>   
>>   	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
>> -	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
>> -	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
>> -		phase_shift = 0;
>> -	else
>> +	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID)
>>   		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
> 
> So this looks like a driver modification to deal with errors in
> devicetree, and these modifications don't seem to be correct.
> 
> You should set RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN (i.e. adding a delay
> n the TX line) when the PHY does not add internal delays on that line
> (so, when the mode is rgmii or rgmii-rxid. The previous logic looks
> correct in that regard.
> 
> Can you elaborate a bit more on the issue you are seeing ? On what
> hardware is this happening ? What's the RGMII setup used (i.e. which
> PHY, which mode, is there any delay lines on the PCB ?)

As discussed following the first patch, the previous method of using 
'rgmii' in DTS while adding delay via the MAC was incorrect. We need to 
correct this misuse in both the DTS and the driver. For new boards, the 
phy-mode should be 'rgmii-id', while legacy boards will remain 'rgmii'. 
Both configurations will still enable 
RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN and allow the MAC to add the delay, 
ensuring the behavior remains consistent before and after the change.

> 
> Thanks,
> 
> Maxime

-- 
Best Regards,
Yijie


