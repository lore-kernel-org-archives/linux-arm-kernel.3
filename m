Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CA1C1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdjIqGF+ISOqLN7KsR39TGSa+NABYH6lIW0NjEcfAZM=; b=AUMFqWv7BFbIeezdYEyptiCXd8
	7LhCTtghEeC1vgeFqyMSSSTTO3itjQBgbO/5IqTSdeDMZh+MqX3qwL9xCQA8sMOPRkN7IbUwnYKH/
	1fWNBg2wjPHZikz0qVKAA4mPpZpN9+X2I5sj1yqIpqbM6G80viMUpADZ8LE6vVJDlwMq43CCMRi8a
	1yerZLUcACuM/pPYuSA9LzzQoi4YlXq4w5RBQSxBjMahnkypZ5GZ9aj1CTzfD6iWlHeksZG5GFYNd
	L6w6dpP1F/C/hRH576oW1kFRk0HVrgOz3AmyjcAyMsByz1M4gIWZc3arj/XVyrXMrbzmVEUkg7IAw
	gJ2YVbKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjnZ-00000008fTg-3VmW;
	Thu, 27 Feb 2025 19:43:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjYL-00000008SNs-31zd;
	Thu, 27 Feb 2025 19:28:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RJ0vQk012055;
	Thu, 27 Feb 2025 19:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RdjIqGF+ISOqLN7KsR39TGSa+NABYH6lIW0NjEcfAZM=; b=YoZzQPsL3wSi3TlV
	qrUtJwdv02vxq692FjQ4amIOteyIhE0na11FI78TnAj0TCn5r/DIiT+g5Jeb+mM7
	Sqn1a7wd7IsICn0jzOUZk8+dvoIsof6iQLuOQk3xd2iFkxlG1muzkcNVjsdrOKty
	nko9oSJ610LROyQg46LwsDqPbaveWPF7uqF3HE+TaGDQCSj/TMNpNZtHNFTdBKFM
	aYGeUeGzvElth+cYEuyPCK0QA+/noYZwQqiN1D7RTFQEuWOkALiHkhYVXaXRnUfn
	7euaVlD5ue0XMCEBjTRgiULoKqJGvqnCpjEqsgiaxTTcHeyLbeesCLWETsVRp9FH
	yk4CRw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prketqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 19:28:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51RJS5Yk016619
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 19:28:05 GMT
Received: from [10.71.114.206] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Feb
 2025 11:28:04 -0800
Message-ID: <bdf2034d-4c96-4b99-b472-520227ff930d@quicinc.com>
Date: Thu, 27 Feb 2025 11:28:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8750: Add USB support to SM8750
 platforms
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-7-09afe1dc2524@quicinc.com>
 <g47ac6bzxqyqbkuqsvuwm5vdc7x5wjfppv6fj4mftwyjlyuz7t@jzmw2kfa2jnp>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <g47ac6bzxqyqbkuqsvuwm5vdc7x5wjfppv6fj4mftwyjlyuz7t@jzmw2kfa2jnp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6SmfXuZus25YPP3QZn62hCs8W0rJgGSe
X-Proofpoint-ORIG-GUID: 6SmfXuZus25YPP3QZn62hCs8W0rJgGSe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_07,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=797 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_112813_897869_108BCE84 
X-CRM114-Status: GOOD (  14.02  )
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

Hi Dmitry,

On 2/27/2025 10:29 AM, Dmitry Baryshkov wrote:
> On Mon, Jan 13, 2025 at 01:52:13PM -0800, Melody Olvera wrote:
>> From: Wesley Cheng <quic_wcheng@quicinc.com>
>>
>> Enable USB support on SM8750 MTP and QRD variants. SM8750 has a QMP combo
>> PHY for the SSUSB path, and a M31 eUSB2 PHY for the HSUSB path.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts |  24 ++++++
>>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts |  24 ++++++
>>  arch/arm64/boot/dts/qcom/sm8750.dtsi    | 134 ++++++++++++++++++++++++++++++++
>>  3 files changed, 182 insertions(+)
>>
> 
>> +
>> +		usb_dp_qmpphy: phy@88e8000 {
>> +			compatible = "qcom,sm8750-qmp-usb3-dp-phy";
>> +			reg = <0x0 0x088e8000 0x0 0x3000>;
> 
> If I understand anything correctly, this should be 0x4000, not 0x3000.
> You have missed the DP part of it.

ACK, will fix that. Thanks.

Thanks
Wesley Cheng

