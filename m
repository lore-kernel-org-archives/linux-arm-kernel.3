Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A74E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 01:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZCworpZc1r9xzngnHefQQcjLWVhZMJcDMelwMm0iKg=; b=4pL7kh1djS+19VbbBNDu1h7MZh
	h8X/EG48OcDaWbs6BAlRJa5p5x2mZV+DE1yu5m/OIF3b6CwJrs5LesweFtC15x3zfC0pkQttPJZ8s
	YVwk2WrNznLBnSJ+b9/gYVIAoWfji71vbb6nQhT6PS1hhVHkx1EiPm8Xyf6YNXfx/Mi6RAoxyuCxN
	i0YiJ+miRP1qDVNe9okVnFW0N/oUGuFg3h1lGJNQwY1xSCH/J+OIyyxojFmO22fi44T1ljQmUnZIe
	PVu7+g3pcdlr4t+YEtzTkF0EAerF9hNQx1JplfpypzkaEcsvNrBGpHNNDHRFyydceMfvRWKgfbjBv
	ILPa5Rkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQccy-0000000Ereu-2lx2;
	Thu, 26 Dec 2024 01:25:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQcbl-0000000Eqxx-1jdy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 01:24:14 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ032d5010616;
	Thu, 26 Dec 2024 01:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aZCworpZc1r9xzngnHefQQcjLWVhZMJcDMelwMm0iKg=; b=FW0grUOP/+EuzZXS
	A2oo0rokklCMrUk7MZqFluIbiDZubwNe0PHroRpXyNNp6O8yRk5dmbIRpj/BSpok
	XPnRFq7i7YOcKkMBU0SejjjfpkOGyeoF2wPBCMeCD6Jvz0AXhI8DUgLFOymLEVwj
	sGe4JcOWSiW5R0TbCrE62uuiv39Djk+IdfxC0gNQYKMX2HYqsUjZJv9jqJ7SjULj
	JOHQhXfHtQgTU+NQe5Tq1jxoAQD9/etQDx9sOKTlK08FSVSJA4LOdq3qeZm2Y+P8
	l9igfWhjkTBsP6PfeF67va8flQYikiMblVPXc0NXB4/ScyvFBVDg9SrqNoMWlK/4
	dRJWwQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rv8qr7pw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 01:24:04 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQ1O3e7012056
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 01:24:03 GMT
Received: from [10.253.74.39] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Dec
 2024 17:23:57 -0800
Message-ID: <5bdfcf46-6512-43f2-bf23-cd8e9a6e93f3@quicinc.com>
Date: Thu, 26 Dec 2024 09:23:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcs615-ride: Enable RX programmable
 swap on qcs615-ride
To: Andrew Lunn <andrew@lunn.ch>
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
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
 <20241225-support_10m100m-v1-3-4b52ef48b488@quicinc.com>
 <88bd11c6-e5f6-4c12-a009-5ec07fd1b873@lunn.ch>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <88bd11c6-e5f6-4c12-a009-5ec07fd1b873@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6vu0-ulN7rekBbajdA858XOi0N5wHngj
X-Proofpoint-ORIG-GUID: 6vu0-ulN7rekBbajdA858XOi0N5wHngj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 impostorscore=0 mlxlogscore=866 suspectscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_172413_478493_7244C084 
X-CRM114-Status: GOOD (  19.88  )
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



On 2024-12-26 01:38, Andrew Lunn wrote:
> On Wed, Dec 25, 2024 at 06:04:47PM +0800, Yijie Yang wrote:
>> The timing of sampling at the RX side for qcs615-ride needs adjustment.
>> It varies from board to board.
>>
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index bfb5de4a0d440efece993dbf7a0001e001d5469b..f22a4a0b247a09bd1057b66203a34b666cd119a8 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -206,6 +206,7 @@ &ethernet {
>>   	phy-handle = <&rgmii_phy>;
>>   	phy-mode = "rgmii";
>>   	max-speed = <1000>;
>> +	qcom,rx-prog-swap;
> 
> I notice this board still has messed up rgmii delays, using phy-mode =
> "rgmii", not "rgmii-id". How does com,rx-prog-swap interact with rgmii
> delays? Is the sample point logic before or after the rgmii delay
> logic in the MAC clock pipeline?

This patch set relies on an earlier version that has RGMII issues. The 
latter is still undergoing coding and verification. I will update this 
patch set once the RGMII issues are resolved and uploaded.

> 
> I think i also questioned max-speed = <1000>. Has this
> arch/arm64/boot/dts/qcom/qcs615-ride.dts been merged?

This will also be updated in the next version.

> 
> 	Andrew

-- 
Best Regards,
Yijie


