Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4548CD70E05
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 02:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8/PNTldqPRcndVcg7eQG0Pz6bx/tQTBm1s6UZTlxx0=; b=37iW0zyFHz1JV7sbLlvripA3Ce
	MsgRW0AK5gAwiKOImM7ZONVP/mi6ztGQtV/Tvwevmr17QzkYi2mUCp7y0ncG8OZTRAOIauN//BB/a
	NTAQw2eb+HY5II+tkBdLYUF8MUZIfbfW0P6wvQn+eiXAYBPKbiuRPAYKXnfc5EtmWLVYobI4X4lmc
	QPQhg9NNedp3D5Cs2erQPrYCzF3V4mmDVvbYK0bdndq5nUF2L6yT0MeE2PHTiJFclry+B/NJbbCkZ
	d2bevbbJChFkep/aV0nyZ/mSffite7VmaE7f7va1Z1/0SwtGLosRkO+iXL4HUvZvd7IwpHeCHnnFg
	KCGYn0Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGqbG-0000000GjVH-1rp9;
	Fri, 29 Nov 2024 02:19:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGqaH-0000000GjKX-2PAC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 02:18:18 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASMkUE6013915;
	Fri, 29 Nov 2024 02:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j8/PNTldqPRcndVcg7eQG0Pz6bx/tQTBm1s6UZTlxx0=; b=nQy4Ag8e8c8c1drW
	a9/Av1lLUtw2yTkagoIwv3CZEMzNnGQ4nSfjGCM6/U3InllqVXU+zQn0dmtWOCf0
	dIs5JpOE6kDFraq26772wcOJJDO1MrvDWM0gwLOErUcHTdzYCH7ugeHdMDnwo/Kv
	YpTbDCAc3lUj7z9fQWMiTV9EEBNQh2p/Urg/nH/DyUp2CHeeap9LQnXZfzeZg6mN
	3LYC1/7joqqGR1lQ4Fr9ZdiA5O92DhlBO3Fldbi9gBHUmpyqo0cVulGsitEJbfti
	Mk1arTU3humMw/o9ShqmXewR3S8eE7i69FyynqH9ZWhUw9tAum3FsOY6G0ZTSPlK
	eh+7HA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xvv5bf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 02:18:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AT2IBBm029648
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 02:18:11 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 28 Nov
 2024 18:18:07 -0800
Message-ID: <e8490f32-75e1-4c14-a8e1-8024ac96e6dc@quicinc.com>
Date: Fri, 29 Nov 2024 10:18:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: add base QCS8300 RIDE board
To: Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew@lunn.ch>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <quic_tengfan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241128-qcs8300_initial_dtsi-v3-0-26aa8a164914@quicinc.com>
 <20241128-qcs8300_initial_dtsi-v3-4-26aa8a164914@quicinc.com>
 <fe332b12-d62e-442d-906b-7f3a72165b85@lunn.ch>
 <e330ef8b-8cf9-4c7e-bea9-c9c240aa38f2@kernel.org>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <e330ef8b-8cf9-4c7e-bea9-c9c240aa38f2@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: te8u0cfBIHWfRn1uUIhPuHmjV-ej8KcG
X-Proofpoint-ORIG-GUID: te8u0cfBIHWfRn1uUIhPuHmjV-ej8KcG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1011 impostorscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_181817_621856_74DFF452 
X-CRM114-Status: GOOD (  17.35  )
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



On 11/29/2024 1:40 AM, Krzysztof Kozlowski wrote:
> On 28/11/2024 17:49, Andrew Lunn wrote:
>> On Thu, Nov 28, 2024 at 04:44:46PM +0800, Jingyi Wang wrote:
>>> Add initial support for Qualcomm QCS8300 RIDE board which enables DSPs,
>>> UFS and booting to shell with uart console.
>>>
>>> Written with help from Tingguo Cheng (added rpmhpd nodes) and Xin Liu
>>> (added ufs, adsp and gpdsp nodes).
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
>>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/Makefile         |   2 +-
>>>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 267 ++++++++++++++++++++++++++++++
>>>  2 files changed, 268 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>> index 9bb8b191aeb5..d9545743606a 100644
>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>> @@ -114,7 +114,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
>>> -dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>>> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
>>
>> It would be good to add a comment to the commit message about why you
>> are removing qcs8550-aim300-aiot.dtb from the Makefile.
> 
> Especially that it was not in v2 (which I reviewed) and nothing in the
> changelog explains this removal.
> 
sorry it was a typo, will fix that
> Best regards,
> Krzysztof


