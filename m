Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72A9C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 07:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7tWosMGbLHMAvjm1d81SVDVfNv1EC5GVkU6SRnrc1tI=; b=KQ6ThTqPwTkM0Q2c8H9E5Tdg9X
	OEBFrN5M6+nlea+heCxA9hUCbVyTrCfwiOF2ZtTfGJ2N3mRBzSXlzYGpDuo0AN9xYnUSqtPxZjFAm
	GAP1wjqpyEWS+fRdLkad2uGeLNl+eOySQFRz1aBF75nuG8R9SXLs3AGqSrA5LQg4mxunGPRPV/Oaa
	+ZqQJL+SLacKaiXWuqJdZbJyCTf3Lu19TcK91h/K2FPUYIlkIVeGVH1h2iM9zCT/qCJhSokKZqV3f
	F4jj+6JDwv4i7bTwEKQjWWhbXytE81AQHGK0dFyLxfki0X6XJaOMnl/Kd3HCJbWSAQ9WG/b5+2gXF
	OWtHl7aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnuqf-0000000A0B5-1J9U;
	Fri, 28 Feb 2025 07:31:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnup6-00000009zmj-1s5q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 07:30:17 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51S7RsNK018544;
	Fri, 28 Feb 2025 07:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7tWosMGbLHMAvjm1d81SVDVfNv1EC5GVkU6SRnrc1tI=; b=ARi/4bYJCvaKG/1m
	ek3hfTEv//Uc2BVRWFlB23KNayFc69zkc3HqtGfkOwpwWCWK45/URGJX8tXyq9Rp
	MlVeYKwp36GgfbVlLuYEih5dwmK48A7GxC+4WWgVVj2eu6RXXlXBsgCEFyNaevkr
	FTv+2lch0ExVjjxImllk9VZPbgXekG1WgOm8ut1wTc5lcWBI7K4JW43QKkt4D4Ov
	wfKcdRucZX+IRPFwrUu3wboOxU3psD98f9hvZou03BZk7EHmDJhqlKwYC1rnhXzz
	LNlhf8QPxksxiDu9ZvybEVnLYeeaSfPYv/jQE4+WDXung24ybG/C+lGATSgoDi/Q
	6frD6Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prn8d4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 07:30:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51S7U368001805
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 07:30:03 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Feb
 2025 23:29:56 -0800
Message-ID: <71cab81f-90ad-4965-b3fc-26d72afeabc5@quicinc.com>
Date: Fri, 28 Feb 2025 15:29:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: Add Coresight device Trace NOC
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
References: <20250221-trace-noc-driver-v1-0-0a23fc643217@quicinc.com>
 <20250221-trace-noc-driver-v1-1-0a23fc643217@quicinc.com>
 <edfd6c6a-65d2-42f1-8225-0808359dd375@kernel.org>
 <593e1777-a033-4922-93c4-c056e6b9bf4c@quicinc.com>
 <19e9db80-e493-4494-a57f-18118c1ffad1@kernel.org>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <19e9db80-e493-4494-a57f-18118c1ffad1@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2VpJnGQo5Zf6BfiFzGLgbNUeNbyruWmN
X-Proofpoint-GUID: 2VpJnGQo5Zf6BfiFzGLgbNUeNbyruWmN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_01,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=752
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_233016_619226_62B80469 
X-CRM114-Status: GOOD (  12.82  )
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



On 2/26/2025 7:07 PM, Krzysztof Kozlowski wrote:
> On 26/02/2025 11:52, Yuanfang Zhang wrote:
>>
>>
>> On 2/22/2025 6:47 PM, Krzysztof Kozlowski wrote:
>>> On 21/02/2025 08:40, Yuanfang Zhang wrote:
>>>> Adds new coresight-tnoc.yaml file describing the bindings required
>>>> to define Trace NOC in the device trees.
>>>>
>>>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>>>
>>>
>>> So you just sent the same v1, ignoring previous review. That's not how
>>> it works.
>>>
>> sorry for this incorrect process. because i just update --to-cc list and no other
>> change, i forced the version to V1, hoped it would work like resend,
>> but the result was not as expected.
> 
> 
> But you got feedback, so why resending without implementing it? That's
> the problem, not you labeled/not-labeled it as resend.
> 
got it, will implement it in next patch.
> Best regards,
> Krzysztof


