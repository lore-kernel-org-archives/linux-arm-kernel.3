Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA9BC19777
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFLgsDbkBekPrfEZSEkgS2B4pQUnwvrYLl+RPjmZVjs=; b=ZS2m404PIiQYJ8If9rEgxhFiKt
	KUVTEy0Hz5ZRIfLfLR2Km4tFcpR4z2U6sfqo1twSSoPhXQ+tBQexyvVQMIDVeOD2ETcgryu4P6uTs
	VYq1FWZiZAIFYNphyYtoPLUObLfNi0DZMRmsau0ujEvf0TSeq9hdvQd1Xv5rRUvjIaqxFXS4FGIW7
	17i9hMW8udMgJyC5VfkypGmV8qEhJGNQptcnrqO/9ykZwGjFOCe0zCHNrVYQcHVE+OH2aIv5rGNj6
	cq3ngbhL1hTLv1a0ABB+XNnrc5viQHxUMlL2WaKJCRENZNSj5yCJfEYDpjzEliVCRlTcUu6oIut0w
	NfCngIWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHPF-00000003pdo-22ek;
	Wed, 26 Feb 2025 13:24:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnFPc-00000003SJE-1zoM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 11:17:13 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q9eBu1000916;
	Wed, 26 Feb 2025 11:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lFLgsDbkBekPrfEZSEkgS2B4pQUnwvrYLl+RPjmZVjs=; b=KmORgz1jXuYJ1KXk
	TONlK1yPvswIqqsyPlBdIJm1hr5xXQDgKvJ+5qIWyFVgLAG/3Y4WbZKkZH2MDKTV
	soNrfkfLYk1V+0njsDPkRjAghSD/nX2te7l1QTiUxkPMTOrjJ8Kq4SJOR+WkI21g
	ysf4BcKYBOsNMAzoSIGGnGW7QMUC0/LMNC1paYVUUzMrSuu9hiXJnrbKpcFYRBJQ
	XEgJB0RqmjIxkPsPdoPKcWF3JQEaQjCaBGjdKKtSeyrbYXkKB/iOtetnEqxAcG2c
	66LfrF9wJk2CbuP8gU3zs/v3KXdJ/SaWmvzRKY/m9VrJpc94Qjt1Pw9NkOkQb+bg
	/eaM/w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451pu99r64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 11:17:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51QBH4ij006951
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 11:17:04 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Feb
 2025 03:16:58 -0800
Message-ID: <913b8fd3-ffc2-45d9-a8bc-e52a05b85c81@quicinc.com>
Date: Wed, 26 Feb 2025 19:16:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: arm: Add Coresight device Trace NOC
 definition
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark
	<james.clark@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com>
 <20250226-trace-noc-driver-v2-1-8afc6584afc5@quicinc.com>
 <d1c945bd-a738-4f01-8b93-c2a03b190c34@kernel.org>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <d1c945bd-a738-4f01-8b93-c2a03b190c34@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iDBqUvS80_ldkndGANAj87Vmnc2agPGD
X-Proofpoint-ORIG-GUID: iDBqUvS80_ldkndGANAj87Vmnc2agPGD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_031712_521538_16F1AA38 
X-CRM114-Status: GOOD (  10.06  )
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



On 2/26/2025 7:09 PM, Krzysztof Kozlowski wrote:
> On 26/02/2025 12:05, Yuanfang Zhang wrote:
>> +
>> +  compatible:
>> +    items:
>> +      - const: qcom,coresight-tnoc
>> +      - const: arm,primecell
>> +
>> +  reg:
>> +    minItems: 1
>> +    maxItems: 2
>> +    description:
>> +      Physical address space of the device.
> Not much improved - still items are not listed. Which binding did you
> choose as an example as I asked to? (so I can fix it)
> 
qcom,coresight-tpda.yaml

> Best regards,
> Krzysztof


