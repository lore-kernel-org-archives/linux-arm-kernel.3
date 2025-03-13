Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE1CC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 08:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=weOhNTocqMWkV4mh4HfuZvoaWYclgVYAQAFMBUCSfGw=; b=YHF+uxc20oN/AfJHxM+J+NeJXu
	OIj6xl7cYjhBFprJE4jPhqY+0/Lrc3Cs6ptUsx62KSexrbVMBQfY48lNC4Zo60H0X6L5NLx1pXj+j
	oZqNrawXBF5PQwSH2R9/P9+y8w/AjZIMwO3ysEPOS1hI3c4yXwlkGSuQPACjV4xcawT3Cd/L3V52V
	6GO9vPtxqegqx3TtJaE3eC6pqxSo/v+bJO3nVLTjvdthMdqXV7bt8r2LG6NG5e7b999kagKMM2hrW
	X6JGCu98Z5fi0H19mI3Rr68pS+B5rLVG4MaOJxoQl2Z6l0fFnbhfeWgvdHa+AMtgUyV8RycQYnp+Q
	LJiQhBLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tseF6-0000000Ab5y-1Ttf;
	Thu, 13 Mar 2025 08:48:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tseC3-0000000Aakd-2529
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 08:45:32 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CLTIoO023249;
	Thu, 13 Mar 2025 08:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	weOhNTocqMWkV4mh4HfuZvoaWYclgVYAQAFMBUCSfGw=; b=Gomj9xJPCHYtMKiJ
	kvRw7zKf3tLe9ypJTI9T/QdNyDKCkKrNNgKPbVuX3RwQMbBl2h9cDzbUewg9VkRC
	SG8Gw3Buoc1BFOLOPSpznCVCl7G/chmDz9ggwbkMtc6fxqeMWQswkvRwwflWFt/s
	1mR9mvt3fJ5uIBq+utxlZuzjyTsMVXXPgrTv5/qzOf+5uY40NFORn+jlVT79dbP4
	PRPOpZZrNhIOe0lDUDT6H4dYUfb+pFRk4+4YnlIQSv9d5vmJsM4SUQu3DWNBy6O+
	2UT4E5srxbSnbHdfFG3giApthSu+n9gd9u1kq3fAJeW4YkAD7ZOUfkaKQH55PCd4
	2nvCrA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2mn5ws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 08:45:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52D8jIpD024973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 08:45:18 GMT
Received: from [10.217.216.178] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Mar
 2025 01:45:13 -0700
Message-ID: <4f3161da-a11b-464f-bf78-45c830b2ea82@quicinc.com>
Date: Thu, 13 Mar 2025 14:15:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/10] dt-bindings: clock: Add Qualcomm QCS615 Display
 clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250313-qcs615-v5-mm-cc-v6-0-ebf4b9a5e916@quicinc.com>
 <20250313-qcs615-v5-mm-cc-v6-4-ebf4b9a5e916@quicinc.com>
 <20250313-mottled-quoll-of-vastness-3f3c6b@krzk-bin>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <20250313-mottled-quoll-of-vastness-3f3c6b@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cgUiPEMaa_Ew-ApOw3iL_h4kRXSyDY0B
X-Authority-Analysis: v=2.4 cv=aKnwqa9m c=1 sm=1 tr=0 ts=67d29b1f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=nJrBSJ152xCAXF4FcqMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: cgUiPEMaa_Ew-ApOw3iL_h4kRXSyDY0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_04,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_014531_561331_6068ED37 
X-CRM114-Status: UNSURE (   9.71  )
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



On 3/13/2025 1:55 PM, Krzysztof Kozlowski wrote:
> On Thu, Mar 13, 2025 at 12:29:41PM +0530, Taniya Das wrote:
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - '#clock-cells'
>> +  - '#reset-cells'
>> +  - '#power-domain-cells'
> 
> Also no qcom,gcc.yaml. Why?
> 

Sure, will fix the bindings across and resend the patches.

> Best regards,
> Krzysztof
> 


