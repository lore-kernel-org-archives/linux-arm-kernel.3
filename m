Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF49C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 02:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30Rn7QhM1tQPQQ9WH4FbwPWMKd3IRZbkkYDlreV1How=; b=Ns18u1tdJvl6gl71oKs/KskhgK
	7oHvjbmjj8tJt3xd8CtZDTMeT22lkYII5fV7V6vaaOMtDbNHUOWuquGiZR4mE20LggvHyqZ8iNFgO
	AhuGzWbV27y799L4P1I2HfWhgDoDEz+Fe5Wq4f350b0219SD5lw7A1j1QtyKvy0NlEbyejO3Q87Eu
	W9uVLV01T15hpVuOkuWM0cf4cDLgaoIhncOEgd9paFpUa3sChBDLV4KkLT4zP9oCFGlPGxpMipNuX
	jCqs7t5iABM12il+444+CC15ItdJBb/aPiEvnDsaGgJwtW0WwuFODi/GYKNtGsYlhMQlg0ZrKhCFs
	oLMVy7sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thfpe-00000002FZN-4ByC;
	Tue, 11 Feb 2025 02:17:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thfnc-00000002FEP-3BxR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 02:14:57 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AK39Sp018199;
	Tue, 11 Feb 2025 02:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	30Rn7QhM1tQPQQ9WH4FbwPWMKd3IRZbkkYDlreV1How=; b=koieKIXH8FSo2+SK
	NApGXij7v7cQcPIEKzXVOaJeLodaqU78xWk6sdolNJG0dsFNKYOxQ5aJrlGaGAaZ
	4Vo2UFKFoe7Y/3Ohn4w0LMRhru9n2xBvtSbCcjZv0plZJ6A7odmInKLeJVtR6m0Z
	De8UOPtWTHIBkK7GwfxYVr6ZnfarIvYAt/wN4xIjFOAdEcv3OaRjt96ZDVJcVkOy
	exH3bRhDGRDF36S3ge5dRgFpFgNU+0o2HoXyoPEcteQmlivIQiLU5GsxXJPInc44
	XnJ3+tm7r/1+jSb+VmzCc6qzj3EqE5hW4NmVUdG7hzxDwwQHgbfvynarrKL15zv1
	123ssg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dxp8re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 02:14:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51B2EeIS013108
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 02:14:40 GMT
Received: from [10.253.11.86] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Feb
 2025 18:14:33 -0800
Message-ID: <878b8237-7f37-4f98-8e3b-451eb5ab3283@quicinc.com>
Date: Tue, 11 Feb 2025 10:14:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] net: stmmac: dwmac-qcom-ethqos: Mask PHY mode if
 configured with rgmii-id
To: Andrew Lunn <andrew@lunn.ch>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric
 Dumazet" <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul
	<vkoul@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Richard
 Cochran" <richardcochran@gmail.com>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
 <30450f09-83d4-4ff0-96b2-9f251f0c0896@kernel.org>
 <48ce7924-bbb7-4a0f-9f56-681c8b2a21bd@quicinc.com>
 <2bd19e9e-775d-41b0-99d4-accb9ae8262d@kernel.org>
 <71da0edf-9b2a-464e-8979-8e09f7828120@oss.qualcomm.com>
 <46423f11-9642-4239-af5d-3eb3b548b98c@quicinc.com>
 <60fecdb9-d039-4f76-a368-084664477160@oss.qualcomm.com>
 <f0e45ece-3242-4d8b-a2d1-fa1478f05005@lunn.ch>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <f0e45ece-3242-4d8b-a2d1-fa1478f05005@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UjCwjgVR3lbjOfI-GM1hxBDzilseh77R
X-Proofpoint-ORIG-GUID: UjCwjgVR3lbjOfI-GM1hxBDzilseh77R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_01,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=723 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_181456_925898_0990A28B 
X-CRM114-Status: GOOD (  13.65  )
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



On 2025-02-11 05:28, Andrew Lunn wrote:
>>> But what about the out-of-tree boards that Andrew mentioned? We need to ensure we don't break them, right?
>>
>> No. What's not on the list, doesn't exist
> 
> How i worded it was:
> 
>> We care less about out of tree boards, but we also don't needlessly
>> break them.
> 
> I guess if Qualcomm wants to break all its customers boards, that is
> up to Qualcomm. But we can also make it easier for Qualcomm customers
> to get off the vendor crap kernel and to mainline if we at least give
> them an easier migration path.

I understand the importance of not breaking customers' boards and will 
work on finding a better solution than the current one.
However, if no better solutions are found, we will consider dropping the 
compatibility.

> 
>       Andrew

-- 
Best Regards,
Yijie


