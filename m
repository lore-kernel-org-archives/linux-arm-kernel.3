Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6AAC35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 06:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLLJeXXAeb93cHTkbet2VBd+/+6brCAnW2S98VPVpmA=; b=Ip7U1UCCxk7z6eY+zZM84eLslu
	Pj4PPTtlxflkH8fSV/na/VL8UAAt6ky54UpQ1/9A19+TdcGZwKvqoyNM08+t+S5ZFSNlg3XuE04Bw
	QKt/T+vzKchLc9cfA6RvJd2B77FB32IcenrPWYL8TiqnSfUkzL5qOeDmw5eTACUyp+gIrb2gkaEZC
	Qzx9sQO8kx53WNk5t2QAuGyA/s0SClhMlMNDsxrY6ieMnqBNDnF3LNTr6rIT7LGXqw6PfsVTFGAEe
	sZPZBjNdMFl4toGy2TVj0ZOm1A/GbPo/pnP+gDHByW6sutM2oO7ndiGdVAVnNbMOEL762fLzzZdRG
	2e11Xo6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tumse-000000087Wc-2mfW;
	Wed, 19 Mar 2025 06:26:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tumqx-000000087Or-1UGB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 06:24:36 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4lhKq020637;
	Wed, 19 Mar 2025 06:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DLLJeXXAeb93cHTkbet2VBd+/+6brCAnW2S98VPVpmA=; b=VVAsEcFlADwNg6ZT
	pokVD3K6Qv+r+mVmzWvS/+oCGkkQyTOA8ad+W2YFulttBMjLHN1r9+TGjG3Xxs25
	Hj27Ko7Xsb3Bz5UnRSNgeG0RL/UMwNNy7MJa/LA76L4yP01DXSyUL7toIwfunwJo
	thsLrFEZgghD/LqpPMVsE0jfNEllI1aDUM3s8kCjPgiSGbRj8kdNgOGMqNeY0lzN
	/CH16eUa2/Q9uB5tSjS5iFXIfLBYvpWTRUwUe2OtlO5HGym+H/I8ty/XSaZM+QjE
	EBmvMKfH+b36SD1sk2prRBQ5hvxxEgnAX52lB6tRBr3Shs7mRL5f0koo9yV/yGl0
	A5FXDw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exx34afj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 06:24:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52J6OO9X013506
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 06:24:24 GMT
Received: from [10.206.106.133] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Mar
 2025 23:24:19 -0700
Message-ID: <a734ed32-00ed-43ca-a42f-5ac88e2a70c1@quicinc.com>
Date: Wed, 19 Mar 2025 11:54:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] media: dt-bindings: Add qcom,qcs8300-camss
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>
CC: <rfoss@kernel.org>, <todor.too@gmail.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250214094747.2483058-1-quic_vikramsa@quicinc.com>
 <20250214094747.2483058-2-quic_vikramsa@quicinc.com>
 <20250223-observant-auspicious-basilisk-d78ba9@krzk-bin>
 <66c35bce-c657-4c12-ad02-58c995ae385a@quicinc.com>
 <f2899540-f9ac-4013-a703-25800429f97d@kernel.org>
 <b1ea0500-595f-48d6-9358-649c25fd4ee9@linaro.org>
Content-Language: en-US
From: Vikram Sharma <quic_vikramsa@quicinc.com>
In-Reply-To: <b1ea0500-595f-48d6-9358-649c25fd4ee9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=b+uy4sGx c=1 sm=1 tr=0 ts=67da6319 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=cXzS56WWJYi8bN41XdMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Gjaa4ABEb6ysyYpnEVV6WtC7v2Ig0r5P
X-Proofpoint-GUID: Gjaa4ABEb6ysyYpnEVV6WtC7v2Ig0r5P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_02,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 bulkscore=0 clxscore=1011 mlxlogscore=999 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_232435_402120_1567DB93 
X-CRM114-Status: GOOD (  15.48  )
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


On 3/19/2025 3:18 AM, Bryan O'Donoghue wrote:
> On 18/03/2025 07:16, Krzysztof Kozlowski wrote:
>> On 18/03/2025 06:52, Vikram Sharma wrote:
>>>
>>> On 2/23/2025 5:03 PM, Krzysztof Kozlowski wrote:
>>>> On Fri, Feb 14, 2025 at 03:17:46PM +0530, Vikram Sharma wrote:
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: qcom,qcs8300-camss
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 21
>>>>> +
>>>>> +  reg-names:
>>>>> +    items:
>>>>> +      - const: csid_wrapper
>>>> Why different order of entries than sm8550?
>>>
>>> Hi Krzysztof,
>>>
>>> Thanks for your review.
>>> I did this change to address a comment from Bryan on another series.
>>> https://lore.kernel.org/linux-arm-msm/e152ff78-caa5-493a-88da-96a6670eb2a2@linaro.org/ 
>>>
>>>
>>> Please suggest if I should keep the order same as sm8550?
>> If you chosen the same order as x1e80100 then it is fine, but that file
>> is not merged so it is your responsibility to track any differences and
>> be sure whatever you send is always in sync with x1e.
>>
>> Best regards,
>> Krzysztof
>
> My mistake, I hadn't realised/remembered what we merged for 8550.
>
> Vikram, please follow latest committed example @ 8550.

Thanks Bryan for conclusion on this. Will keep reference dts as 8550.

>
> ---
> bod
>
Best regards,
Vikram

