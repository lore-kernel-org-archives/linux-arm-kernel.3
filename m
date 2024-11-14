Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5537ED41C00
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 04:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BcfKFb85QUyDdn8VrM3S/rbTM9JaBHQIgeIkoC/Kz5o=; b=j/0YEjPb4oln7DiQXQqN82mTYS
	hNhBQfYzSEv5m7ZNfxd8dtcK+rCE1fakfS7pDIuH/6Os2HAOrOdQIVK83U6gTGPXUGd+sAEMfq+3J
	xZRaticNNX7It6AyvJOykctOnqfP4b8+bv/o96F1Pb2GmMcw7ZV/t+pl93bo/AYWSbjEkToLx/5bh
	qR2/3shx+1ka9MA+tUe1j2VwOxOMPSCv9xucaXsQ1n0qTrhtjSH/KIuP+G6ScmneNPBLmfiQHjz8r
	J9FLJenuAXRfFDyKjdzfJZdU3UOj+xH6Yy1h2HRbLG1oU1WgemM2yK68HlBse2qa6zWGdCcEenL3w
	rnSyaeUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBRK4-00000008kvj-0JBL;
	Thu, 14 Nov 2024 04:19:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBRIE-00000008kgg-2yIt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 04:17:20 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADI08lg028186;
	Thu, 14 Nov 2024 04:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BcfKFb85QUyDdn8VrM3S/rbTM9JaBHQIgeIkoC/Kz5o=; b=KknA3UGQNVpqjGR1
	DHyM3kZjE7fmAQnZJbuH4973blgEjxZqXC5EpvOuMojvRBHLj2kDAMaYhsarnbPf
	Ccxc1DmeytKB/m1m1xmPRshYuWJh3XYRBRwpgta7MEXnqn5AnWKC6sY5Hp6sgP22
	5EtUJ29pSj4GAMhD7I5x0In1Dr98/SE7PIHPq4cmQjpkF/gT8eHGJhWSmd9jtGL/
	of31z5VTkX/zaLORCKQr3UdlRYsr2GneR4s/5vddO03mmkHGj/HEbRVpcTPpSAAA
	lQbUQYeqDvCYJvGauW/5kThq/ghnhAVsmUxoKnGPnyf3+ckty3EuzHyZjWb5tUjW
	gDQvog==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w10jsajp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 04:17:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AE4H73n010073
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 04:17:07 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 13 Nov
 2024 20:17:03 -0800
Message-ID: <8607e5a5-cec6-d228-cc4c-aa38ae14318f@quicinc.com>
Date: Thu, 14 Nov 2024 09:47:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V4 1/5] dt-bindings: firmware: Document bindings for QCOM
 SCMI Generic Extension
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <sudeep.holla@arm.com>,
        <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <conor+dt@kernel.org>, <arm-scmi@vger.kernel.org>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-2-quic_sibis@quicinc.com>
 <e77acdfe-43b9-a28b-11e4-2ffb481c4078@quicinc.com>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <e77acdfe-43b9-a28b-11e4-2ffb481c4078@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MafgbSD4ywRxQufJDt9VHEIbvXzx1FI2
X-Proofpoint-GUID: MafgbSD4ywRxQufJDt9VHEIbvXzx1FI2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411140030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_201718_886938_7D1495E8 
X-CRM114-Status: GOOD (  12.65  )
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



On 11/7/24 03:48, Jeffrey Hugo wrote:
> On 10/7/2024 12:10 AM, Sibi Sankar wrote:
>> diff --git a/include/dt-bindings/firmware/qcom,scmi-memlat.h 
>> b/include/dt-bindings/firmware/qcom,scmi-memlat.h
>> new file mode 100644
>> index 000000000000..7ae8d8d5623b
>> --- /dev/null
>> +++ b/include/dt-bindings/firmware/qcom,scmi-memlat.h
>> @@ -0,0 +1,22 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + */
>> +#ifndef __DT_BINDINGS_QCOM_SCMI_VENDOR_H
>> +#define __DT_BINDINGS_QCOM_SCMI_VENDOR
> 
> The #define does not match the #ifndef (missing "_H")

Thanks for catching this. Will fix it in the next re-spin.

-Sibi

> 
>> +
>> +/* Memory IDs */
>> +#define QCOM_MEM_TYPE_DDR    0x0
>> +#define QCOM_MEM_TYPE_LLCC    0x1
>> +#define QCOM_MEM_TYPE_DDR_QOS    0x2
>> +
>> +/*
>> + * QCOM_MEM_TYPE_DDR_QOS supports the following states.
>> + *
>> + * %QCOM_DDR_LEVEL_AUTO:    DDR operates with LPM enabled
>> + * %QCOM_DDR_LEVEL_PERF:    DDR operates with LPM disabled
>> + */
>> +#define QCOM_DDR_LEVEL_AUTO    0x0
>> +#define QCOM_DDR_LEVEL_PERF    0x1
>> +
>> +#endif /* __DT_BINDINGS_QCOM_SCMI_VENDOR_H */
> 

