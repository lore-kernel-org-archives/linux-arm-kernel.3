Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E34FD10DB4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 07:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AtBfEWzOEZ0GXp3tYACHTfd1Jd9QU+nU8WarsCWTWHI=; b=if2lqcKYku377FBNjg1kYhxeXz
	K0yOyIVcwQejlx0HCJQoEiNVGvEFbj7RcRTWrCRG1QcJPo9W6RbVFdq6TJS3OfZb3sc5M94mU4kN8
	8BAy+8EI2VE685iKzDUwstnt4WMU7KdcP+ZLh4osKMlmGpk5WV1N8cYma43L4E7zB+DcqQEVslrxR
	051OlvV2JcyqqV34+VovGIgA2XNoPp+l91FhBOIH4vZDv4jWgcztqlVFvi4dH834BaHN6MgNDtgkJ
	fF752GddlFOQSnDTw5geHOFyCs3BhGhAHMeN+mmdImJMOZ2lYlRDio3aZK1Mbd8Sd1UqwSLqLORhM
	x8ValWYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI13N-00000005K2e-2z0W;
	Mon, 02 Dec 2024 07:41:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI0vW-00000005Ihp-34wZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 07:33:03 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B1NPFdf028149;
	Mon, 2 Dec 2024 07:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AtBfEWzOEZ0GXp3tYACHTfd1Jd9QU+nU8WarsCWTWHI=; b=U/Z0Epw5W4O8s6AT
	InC4mhLTpHq6sU/XMBRTVCjt+8He7iAiQK9+goGddLVDc3ovQDavk1smGGAIs38P
	sibRoBiI+o1jcjaVBu/Ec50X/ilJQbfa4ClvenYZpkrFwNVuA+LXDIQ376Xs3gfl
	sceYrsV3DLESv+uBnkS/xqu1yVYolY4ZL/S5U0bqL83w33qmR6CCRjdEiydHxBy6
	lYM684KE/xqdBt/nOIFrKNZpkvjVx+gXJrTBcDxIpcJfXmcaEtGYJb+/ROoNCdUG
	g+onWGp/HQIJVh7j41dgzEQL9YknmUg7eMc8GToKPaq1xdS0xuwxpKcBy/e1LnAh
	NJfarA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437r2mv0he-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 07:32:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B27WQkH020954
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 07:32:26 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 1 Dec 2024
 23:32:21 -0800
Message-ID: <105428de-81a0-4da3-94ce-7b9310a29e17@quicinc.com>
Date: Mon, 2 Dec 2024 13:02:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] dt-bindings: clock: Add Qualcomm QCS615 Camera
 clock controller
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Abhishek Sahu
	<absahu@codeaurora.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <20241108-qcs615-mm-clockcontroller-v3-3-7d3b2d235fdf@quicinc.com>
 <be4blr2wvnc7b4iubexxnzqevjpgnfhdt7azcuwdtqgp6xbdvh@c3txmpuo5lot>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <be4blr2wvnc7b4iubexxnzqevjpgnfhdt7azcuwdtqgp6xbdvh@c3txmpuo5lot>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: s4NsHCyElcmxJNyG-Rgv3H_3_pbnXkj3
X-Proofpoint-GUID: s4NsHCyElcmxJNyG-Rgv3H_3_pbnXkj3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_233302_893899_92F8C736 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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



On 11/8/2024 10:52 PM, Dmitry Baryshkov wrote:
>> +  clocks:
>> +    items:
>> +      - description: Board XO source
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  '#reset-cells':
>> +    const: 1
>> +
>> +  '#power-domain-cells':
>> +    const: 1
> Please use qcom,gcc.yaml instead of copying the same set of properties
> over and over.

Sure, will take care in the next patch.

-- 
Thanks & Regards,
Taniya Das.

