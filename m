Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FAAC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 01:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIgm1QtUCU2wyvXa8zdT8WVlkmrM9+pCBwzR8JWrCFk=; b=M08W9S20cM74Q1HcL0EpMeLSG3
	zMLoUWt1grk9coL86mHZI8B5bxtoJoD52aLSunLGMOg49lF9tHxQqukBCYzHoUi/ML4KsuVHPsD2j
	/yqQgoC2cOfvpJROa1+k/P+WZMfkarJkE4wDpE+t1i4o4whzGZp9EmZBbCuly1YTXWddOyNVbn4wt
	qafI+bco39xOOMJZeMI3Cdg4rYp4P9hRyuqGEHyMZBvh/VbUl2XZQQlvCk8lIy7ArNxVYbBpKmnmy
	iV0/QGbfrdxoBZsAvF1wVlb14On/Y0JGya3Pk/Zg0d+qSCA6wZUaihPeRcNqaPdP0li6aecacfgF7
	oREjptLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUEWt-00000007E06-0oFM;
	Wed, 25 Jun 2025 01:02:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUEUY-00000007Dqs-1qZh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 01:00:00 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ODw3iT021706;
	Wed, 25 Jun 2025 00:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fIgm1QtUCU2wyvXa8zdT8WVlkmrM9+pCBwzR8JWrCFk=; b=dT4n9tkxtIrW8EeJ
	CInA2yfCEx1eYt6dALiyrRP4Jqhx4hOxPzBKTqe52A4wyIx+RmT9Lv6IQVZ87kdo
	ER6R3IKnYDubDF8PyCNejDBHP67v/E3UK8tEUtww7nP70OhJZCtMCdySwnl5C4NZ
	YaP1ElaRIGLLLg3dR7TaqFyR9vz8voZ0tUcw7lB5WbjHiwc8mMJVLEt6EhRxUMBv
	2D23iVP+hhf72x+JrDxYbxahzkpwurdn70iH1ROgTwSSLTwhQvnwDGi29I1tbg9R
	WboTjbfSsGD5W8o+19jusPliW2ZCDuOosW4hb278ZqiqaGHtlhj6DaWKq/dmAN80
	7cZltA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpx9wc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 00:59:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55P0xnI3024939
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 00:59:49 GMT
Received: from [10.133.33.49] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 24 Jun
 2025 17:59:46 -0700
Message-ID: <338a9ee1-10aa-4bd2-9b0a-5006ed571bb9@quicinc.com>
Date: Wed, 25 Jun 2025 08:59:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Enable CTCU device for QCS8300
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark
	<james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685b4a07 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ETpKHP0l2JGKE01atXsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAwNiBTYWx0ZWRfX3pX0M/DIpz3O
 BrslRjXHs3RbuJ2M6+q3Aqr72gNqVz5SEE51pGGEqW+FwZuchAUvJjzRmHQM4xy+Kv+rdCGCfYh
 jLwXHirFa0WRCPySaKq8LaLIfAR24S+7wGvX2gFTTd1Q14vN8CSx/H1CsaNbfMTte39fdiZqlVE
 UWPWxGaHXtQrc1B9fAKjauRDZLtZgXCndey4n0k46+GR/zCRztviHX5yp5sriK5+k+cM+wP9U8V
 QGmXhYdOJXQcNx7CeYDKCqMlGJwY1ka3q1xkORU9qLzqBQtjnXDHy61Prab8eJKPPTkyTG00TjJ
 t4YKO2skiPL96se5OgYfkIU8DrKXAyzmzkcHCjFwj/Gb/ZdGsZn/7uBMVWKmFzkf4yRogx/VTiD
 EsBCQul4GpHCiHBOZmmMWzX5OjGMMf7iRm85uhvqiPjBdCYHx1xWoi2NhfZkQA3F8xNXjNPA
X-Proofpoint-ORIG-GUID: pmLDGFZaYvRs2Hu_YyCu8FnXxentW5R5
X-Proofpoint-GUID: pmLDGFZaYvRs2Hu_YyCu8FnXxentW5R5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_175958_629330_6D9C8144 
X-CRM114-Status: GOOD (  14.53  )
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



On 6/24/2025 5:59 PM, Jie Gan wrote:
> Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in binding to utilize
> the compitable of the SA8775p platform becuase the CTCU for QCS8300 shares same
> configurations as SA8775p platform.

Hi dear maintainers,

I just realized it would be more efficient to introduce a common 
compatible string for SoCs that include two TMC ETR devices.

Most of these SoCs share the same CTCU data configuration, such as the 
offsets for the ATID and IRQ registers, because they integrate the same 
version of the CTCU hardware.

So I propose introducing a common compatible string, 
"coresight-ctcu-v2", to simplify the device tree configuration for these 
platforms.

Here is the new dt-binding format:

properties:
   compatible:
     oneOf:
       - items:
           - enum:
               - qcom,sa8775p-ctcu
               - qcom,qcs8300-ctcu
           - const: qcom,coresight-ctcu-v2
       - enum:
           - qcom,coresight-ctcu-v2

Thanks,
Jie

> 
> Changes in V2:
> 1. Add Krzysztof's R-B tag for dt-binding patch.
> 2. Add Konrad's Acked-by tag for dt patch.
> 3. Rebased on tag next-20250623.
> 4. Missed email addresses for coresight's maintainers in V1, loop them.
> Link to V1 - https://lore.kernel.org/all/20250327024943.3502313-1-jie.gan@oss.qualcomm.com/
> 
> Jie Gan (2):
>    dt-bindings: arm: add CTCU device for QCS8300
>    arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
> 
>   .../bindings/arm/qcom,coresight-ctcu.yaml     |   9 +-
>   arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 153 ++++++++++++++++++
>   2 files changed, 160 insertions(+), 2 deletions(-)
> 


