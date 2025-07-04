Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61668C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 02:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4c2MhmG9LJubabheJJ4s6DnDEcYP/0f7ZQNfLP0aXkQ=; b=C12QWkjdbckNwENy5xULFW5a8+
	beUIcZKywq3oBDosgXWN5J9E9JZVUDf7OKIiPj2+vA7KLJokMmRcTnBbB4DMc6+gk+ikDy60I2e/j
	MFVDIFePG0IoZo4JtuKgwXA5keQvmr1bUvv3Mz80Dg8yItRIrNly+11cDHbBEq801ozZaLPZ+yYJb
	RQJ86i8INDu5POMlw1ksnyHMoIvOOs2VAiE62zKVbdJsQgc8Wy5siSpxIbId16J86YPWuuxI+95+B
	Jcf186YDw7k6qFFIW3yktop8CX7SJgbpTmc5bvbc7qy/dGz0pIWV9aPsfDYtb2twKeQ0+wUA1ZHnm
	lnGYicwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWTE-0000000D6LW-1EMn;
	Fri, 04 Jul 2025 02:48:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWMl-0000000D5cx-4B7Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 02:41:33 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563JPKf5029511;
	Fri, 4 Jul 2025 02:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4c2MhmG9LJubabheJJ4s6DnDEcYP/0f7ZQNfLP0aXkQ=; b=E44G995InBDYpB9J
	YS6KMDHwNDDpsYUhj6882fA8loOTJOSfEffTbgXb2xMR/7/sH2Hcs75e4t/qnY8V
	Wm3XipDB+pVyqhsD/2mPvoDym2q65fqKLEKklkx+4M6IdV1orbC9hdAJJY6AjdTp
	REEoM9IeQPDshdXmVStAu3FGgtYXKdbFSvJU+qedU2UwOp4pBMkOvuiCDqvTkzlv
	ATEErTSVpHThAaIBvhcbI56ysq7/UOGk8TI8WASpZFrDzWPbbr5VlLrlY7S3B762
	VAir/i1i2FIJ0QbTvzSu+MlLgB19B4MCoTR0aLtXw0qosEGqfkoe4cObgtB8K8Dd
	ZNL2EQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47nh9s3mm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 02:41:23 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5642fMOD023425
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 02:41:22 GMT
Received: from [10.133.33.146] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 3 Jul
 2025 19:41:18 -0700
Message-ID: <7f2cb415-3f56-4e3b-a6a6-093d5d2a5161@quicinc.com>
Date: Fri, 4 Jul 2025 10:41:16 +0800
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
 <338a9ee1-10aa-4bd2-9b0a-5006ed571bb9@quicinc.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <338a9ee1-10aa-4bd2-9b0a-5006ed571bb9@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=frrcZE4f c=1 sm=1 tr=0 ts=68673f53 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gW6MYXlkPblPBwbZtHMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDAyMCBTYWx0ZWRfX43QC1Rg2OVfQ
 pgXAWSksEeAOdatAc1sqIIJANUhXpz+WuI8AVfjO5Eff0XHzi+mTfs/Bug+5NL7jx3LBWSPR5eo
 QPHb8nqcEReLYr4RjkPOBu09hynA+hhIJSCwax891ln8gJCYCVehykxeiPFT6/ikp12vDUd08Wv
 0+gQSUY2C80u7sWetlq9iXzV1rv/0qE3l5TFUGOqscxByEzNv2x/8tz1ALe3Z63ugBXnG0Ym0B5
 29TOKn498Migml9myfp4abXXaOakSH6V3+QZOw9/c06+k6jCh5oz0qgWqcaqiqzrQHgOS1TKDCO
 x0DJOW9F7slaZA89ki6wLDXKaY892ytDUVZ+nJAvK8kiqDZvr6EYNcKSEyadmejUx2AwFrnQ6Jy
 Y8l99pPuvJhg7+IuY8qbAXq7A6xCetlH0xMY6/KZX/Ap2uN1CI8Dcx4meEiQmWlfmFopEAvK
X-Proofpoint-GUID: E33tVrL2Pm-yhNsUEc6BC8z2FTjUBsgK
X-Proofpoint-ORIG-GUID: E33tVrL2Pm-yhNsUEc6BC8z2FTjUBsgK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_01,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_194132_051008_CC41F719 
X-CRM114-Status: GOOD (  18.98  )
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



On 6/25/2025 8:59 AM, Jie Gan wrote:
> 
> 
> On 6/24/2025 5:59 PM, Jie Gan wrote:
>> Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in 
>> binding to utilize
>> the compitable of the SA8775p platform becuase the CTCU for QCS8300 
>> shares same
>> configurations as SA8775p platform.
> 
> Hi dear maintainers,
> 
> I just realized it would be more efficient to introduce a common 
> compatible string for SoCs that include two TMC ETR devices.
> 
> Most of these SoCs share the same CTCU data configuration, such as the 
> offsets for the ATID and IRQ registers, because they integrate the same 
> version of the CTCU hardware.
> 
> So I propose introducing a common compatible string, "coresight-ctcu- 
> v2", to simplify the device tree configuration for these platforms.
> 
> Here is the new dt-binding format:
> 
> properties:
>    compatible:
>      oneOf:
>        - items:
>            - enum:
>                - qcom,sa8775p-ctcu
>                - qcom,qcs8300-ctcu
>            - const: qcom,coresight-ctcu-v2
>        - enum:
>            - qcom,coresight-ctcu-v2
> 
> Thanks,
> Jie

Gentle ping.

Thanks,
Jie

> 
>>
>> Changes in V2:
>> 1. Add Krzysztof's R-B tag for dt-binding patch.
>> 2. Add Konrad's Acked-by tag for dt patch.
>> 3. Rebased on tag next-20250623.
>> 4. Missed email addresses for coresight's maintainers in V1, loop them.
>> Link to V1 - https://lore.kernel.org/all/20250327024943.3502313-1- 
>> jie.gan@oss.qualcomm.com/
>>
>> Jie Gan (2):
>>    dt-bindings: arm: add CTCU device for QCS8300
>>    arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
>>
>>   .../bindings/arm/qcom,coresight-ctcu.yaml     |   9 +-
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 153 ++++++++++++++++++
>>   2 files changed, 160 insertions(+), 2 deletions(-)
>>
> 
> 


