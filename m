Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539DBCA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 10:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Qez6+RtqXrFwpKgN7ltkzNXGq/q6Mf8vdKXpshu2lQ=; b=JplalSJV6u+JvK4bcxIgIcz5i8
	780vPZ+IMTw7QPNKCGOv49FRki3y9p1EKVl4tESjBS4agMaaCPE3TB/++8OooiBkr3Mww5T3cHHyy
	8Yc1IwyCoc9nngR+qInBNhLO5hJ0S7SVknzMeEGY0TSu7+pFI+gy43QsGqmK+zaEFuzJ2vVvmHM6c
	X73WxxMz35CGQYYlIFZuDaKP6qiTebGTMVCp2xlnkHGxAijnUL2upTHPlw91ZnnPD34Ey7c1defXQ
	e/NV3qWdb0RzxGQVGXCGktvkcB4+AvUrN6faVBn61VHFxyS0MHBZFaOY1jXghEkPU0wp0V76xHvRN
	QAdcm5oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDCf-0000000AEfn-3qdF;
	Mon, 12 Oct 2026 10:24:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDCc-0000000AEfH-3vLf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 10:24:20 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KiSZ1592934
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 10:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Qez6+RtqXrFwpKgN7ltkzNXGq/q6Mf8vdKXpshu2lQ=; b=DYOInHZqGOALow3x
	HxqJOwp6WnEWJhWxrOapXWlhKmYzOlvkjeeucnnazs9iQYf4+Uek6rIKpDDBtkha
	JNtlFwmMHTQaGAksm7hNvB1FFcLndvl/g0EZfGAG1uSJkKZxLk3E0MK8PNvTuLFm
	/GjZ9eeheA5JtclbudwE3H9JsAVNY4Z0kSQ+yW/iXvV55DcpwftEC2i2Syx6BrbP
	4XSgvOq7rWQixMKiSwED7JmzOd0MthBJ1ueqmm6FpFwvMz8mip2Ui1W0vGFbb1pk
	D0U71g0/hU2qLo+VOAltR7BDDJBXfqXDw8gA9iqWC0WsqWJ62R6NAjSm/pXf5mFh
	1usogQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu18kw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 10:24:17 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so2470799a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 03:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791800657; x=1792405457; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Qez6+RtqXrFwpKgN7ltkzNXGq/q6Mf8vdKXpshu2lQ=;
        b=fhNB8lWjmz3d/tglX4W0nGbWsyBUftpbG0lRPvoBwvzA3PKcIBb55CNYlNf90gKj0d
         mY2J+5q5jtSgEYjya6qQwfY6ytcJd170Q9mlIvv5f/UMlLGmH9CCmR3kosp3kZQEMUIu
         70FFDXnZzvw7XL+A1bJNpfm16o2axNopj/E24DQnRQ7xOumcYm1EC1BIaafrm6ZgsIM/
         UuVyI81YP4OZyxr+rLMkPxyrxkBh2Gqp/bz/0Jkgl1oR5N/gw3PSsN1S70IgtQn+4Sfq
         ra/CJjQNlzSmt5WygMET48TI+f76N8giPSOF7nb7K5F9kTcAPdcjrOLSlXpinynvH9ha
         pXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800657; x=1792405457;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Qez6+RtqXrFwpKgN7ltkzNXGq/q6Mf8vdKXpshu2lQ=;
        b=XlyDatEP7PPWtgw335FljpL2d2sgVnAN7fDFxl1o46W3a3YPcZ3AGHV5LkH1Q3ygI1
         Qnhv2JvCrLvyWq14jUaFF0MRd4bPKk0Bt8PCRraqToiQ8HMc739g/+SjG6H2HKMWAHNX
         eDYUSOcatNZDZ1X4bEcaoneo/3FJ1d5vabZntCHlrifZPgbUe1DFagA0/aSwPojR+P+S
         PjUNC6lSIaCwMvXJxeadNVE/EsLTY+fdcJXxnbSAGBWQNtMzOob7aWQPzElQ+lsMzvUW
         itk4kg+FvIt9TuchvcbVi778kE1aWmy9weorE1dd9dgVLI50oGJOOMYVf717TuFBkXCE
         Siqg==
X-Forwarded-Encrypted: i=1; AKwUvBw0s2JFWETeiyvuciTNfkO3rK+87p8mczl1si2n+xLpPCg5IZl1Ee6hWAWMEqktJsxZyzoDMpg/S2nqSJVaB/CN@lists.infradead.org
X-Gm-Message-State: AFq9FYL5ThYKssFzIL4hdqn8GH4m1Co+x+pXpmEvAhPIU6yizGvGd5T7
	+VpsSirDKGnjzpRmf/Hc9yj6vkhLZH0jphWrIbmtn9GL5GQqCEgU8G7cMxkbv/FKDsHTTEY+W57
	cSDaGUBB+K39oztJJc7G2HfHMg7HBcnJ2vCCaF/mAeB56XQXzU1d0xRqBXUGfhWTw20MwUsO9/s
	Dk7A==
X-Gm-Gg: AYBFou3NQGiUhcQJZ+/wLZbJQhV5PtXginFnlSLUR1f8LJ4IxtNUWqHSqIlUW16DFbz
	LqVLzVdKO42GO30Kv4eOjGDjuq3Fo6kAxnMpgvorh7GoOUWFLvmDhz6ZprsDyYPRbTBQWA5gcfQ
	CG4PWklg+nYZJbmn0MT/PhWZwMpB7M71bjidU8YCN+nMVQMRy3lSdjo4DzSqN4xxP0q1/cuJQBY
	N91zLWNz63BSMIcoesNO8mbAqEAOgaRCL9+h6SmgFKD8gEKTcOG+WMlpGFt12tIGDgG7QiOBT/b
	vYTCEH/2FVjT0yqOlnI3yLNYbiEpGYg3lmvxIfpoM6nA8irHUdrXgBS6vm86Nc093CQKUvnIour
	4jofcCCjajTrFpAxtgg==
X-Received: by 2002:a17:90b:5887:b0:3ab:364a:9532 with SMTP id 98e67ed59e1d1-3ab3acc548fmr8404171a91.44.1791800656816;
        Mon, 12 Oct 2026 03:24:16 -0700 (PDT)
X-Received: by 2002:a17:90b:5887:b0:3ab:364a:9532 with SMTP id 98e67ed59e1d1-3ab3acc548fmr8404138a91.44.1791800656287;
        Mon, 12 Oct 2026 03:24:16 -0700 (PDT)
Received: from [10.64.69.36] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ca1e04sm16636916a91.1.2026.10.12.03.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 03:24:15 -0700 (PDT)
Message-ID: <51bc6576-7e52-4685-b7b2-a355c2b7e1ae@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 18:24:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] dt-bindings: arm: Add MPAM MSC binding
From: Yin Li <yin.li@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan
 <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-3-35196c2b43bf@oss.qualcomm.com>
 <20261008212736.GB1318789-robh@kernel.org>
 <2eddfb6d-c622-4d72-827e-aed685e72b9c@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2eddfb6d-c622-4d72-827e-aed685e72b9c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6accb551 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=U2AAjZBgJX8MQhfA68EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MSBTYWx0ZWRfX/0PmaYU8XYEM
 +cFr/JvROUWDsrDnjUAgBftN0vVLT4LPhbCVePn9/JwgvdHRromAUv0maFKRvX/gh0LiHQ3NmG4
 x2h5Qej2rPnenAyE5ztGkX4eUYe1rx2ir/j5+I28jfLuBLRt6sOM55VsMAly6ybOt1BSK72+7gV
 25Cuo75xMggG0fWrCKkzb0MKGvxiq243bgxrHOwwfUNZ41TdiL30sd9peeqnR99w2gcOzP8xR8f
 vE16DwAOmNTb1GRrbONkjzLdOf0b4/YZOa8KvTL2fRBlyoZPhHA0j5us6Nq3tx77JbNqtnKlsV0
 t5Qz0AOXwHtz4w9ixh/JjHzfrO3GZWq0rd4lLXLVtb+N5N9Y0061y4u0W00133j9yPDn2OMCl/E
 9DiVUITPOwoJbCAMYEvHXf07Yi93s6EGwlEqP6UxYa3M7WJFZCICBUpljmi3x1BrUMQssURYYMb
 HN4CERL9FwoTvPuMzCw==
X-Proofpoint-ORIG-GUID: 4m3Pj4NBezhyemp742bUkmM89cnabT3u
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MSBTYWx0ZWRfX8u+HD0B8v2Xd
 72nmWezgf36noxWtn+TE+vHbTeeOIlUFn1EQAkq4CUbFMDEmTtjC0XCfUvUOmPeEztKH4h6mWO4
 /2lAN3YILduQMCEmZkkzpbBUQ/7lRSA=
X-Proofpoint-GUID: 4m3Pj4NBezhyemp742bUkmM89cnabT3u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_032419_100745_6E4D7BAE 
X-CRM114-Status: GOOD (  36.15  )
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



On 10/12/2026 3:05 PM, Yin Li wrote:
> 
> 
> On 10/9/2026 5:27 AM, Rob Herring wrote:
>> On Thu, Oct 08, 2026 at 02:41:12PM +0800, Yin Li wrote:
>>> From: Rob Herring <robh@kernel.org>
>>>
>>> The binding is designed around the assumption that an MSC will be a
>>> sub-block of something else such as a memory controller, cache 
>>> controller,
>>> or IOMMU. However, it's certainly possible a design does not have that
>>> association or has a mixture of both, so the binding illustrates how 
>>> we can
>>> support that with RIS child nodes.
>>>
>>> A key part of MPAM is we need to know about all of the MSCs in the 
>>> system
>>> before it can be enabled. This drives the need for the genericish
>>> 'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
>>> until a h/w specific driver potentially enables the h/w.
>>>
>>> Cc: James Morse <james.morse@arm.com>
>>> Signed-off-by: Rob Herring <robh@kernel.org>
>>> Signed-off-by: James Morse <james.morse@arm.com>
>>> [ Yin Li and Huang Yiwei: use oneOf for the compatible to allow both
>>>    standalone arm,mpam-msc and the two-item combination; fix schema 
>>> field
>>>    order, type constraints and yamllint spacing; fix example reg 
>>> addresses,
>>>    add arm,mpam-device phandle and remove TODO comment ]
>>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>> ---
>>>   .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 202 ++++++++++ 
>>> +++++++++++
>>>   1 file changed, 202 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml 
>>> b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>>> new file mode 100644
>>> index 000000000000..3c7b13a23ff2
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>>> @@ -0,0 +1,202 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
>>> +
>>> +maintainers:
>>> +  - Rob Herring <robh@kernel.org>
>>> +
>>> +description: |
>>> +  The Arm MPAM specification can be found here:
>>> +
>>> +  https://developer.arm.com/documentation/ddi0598/latest
>>> +
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - const: arm,mpam-msc                   # Further details are 
>>> discoverable
>>> +      - items:
>>> +          - const: arm,mpam-memory-controller-msc
>>
>> Why do we need this?
>>
> 
> Hi Rob,
> 
> Thanks for the review.
> 
> The 'arm,mpam-memory-controller-msc' compatible is needed because,
> unlike cache MSCs, memory controller MSCs cannot rely on the parent node
> to identify the resource type.
> 
> Cache controllers universally carry a 'cache' compatible, so the driver
> can recognise any cache parent and derive the cache ID from standard
> properties. No equivalent convention exists for memory controllers, and
> the component ID comes from the MSC's own 'numa-node-id' rather than the
> parent, so there is no parent attribute to rely on.
> 

Hi Rob,

As a follow-up to my previous reply:
Whatever the outcome of the discussion on "arm_mpam: Add support for
memory controller MSC on DT platforms", we will keep the binding and
driver support consistent. If it's dropped, the 
'arm,mpam-memory-controller-msc' compatible, 'numa-node-id' property, 
and the memory controller example will be removed together.

Thanks,
Yin


> 'arm,mpam-memory-controller-msc' provides the explicit declaration that
> this MSC controls memory. It is used in "arm_mpam: Add support for
> memory controller MSC on DT platforms".
> 
> On 'oneOf': the original 'items' form requires both strings to be
> present, which is not appropriate for cache MSCs. Andre also noted this 
> in RFC v2, so we changed it to 'oneOf'.
> 
>>> +          - const: arm,mpam-msc
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +    description: A memory region containing registers as defined in 
>>> the MPAM
>>> +      specification.
>>> +
>>> +  interrupts:
>>> +    minItems: 1
>>> +    items:
>>> +      - description: error (optional)
>>> +      - description: overflow (optional, only for monitoring)
>>> +
>>> +  interrupt-names:
>>> +    oneOf:
>>> +      - items:
>>> +          - enum: [error, overflow]
>>> +      - items:
>>> +          - const: error
>>> +          - const: overflow
>>
>> This can be expressed as:
>>
>>        minItems: 1
>>        items:
>>          - enum: [error, overflow]
>>          - const: overflow
>>
> 
> Agreed, will update.
> 
>>> +
>>> +  arm,not-ready-us:
>>> +    description: The maximum time in microseconds for monitoring 
>>> data to be
>>> +      accurate after a settings change. For more information, see the
>>> +      Not-Ready (NRDY) bit description in the MPAM specification.
>>> +
>>> +  numa-node-id:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: NUMA node identifier for the memory resource this 
>>> MSC controls.
>>> +
>>> +  '#address-cells':
>>> +    const: 1
>>> +
>>> +  '#size-cells':
>>> +    const: 0
>>> +
>>> +patternProperties:
>>> +  '^ris@[0-9a-f]+$':
>>
>> Based on the 'reg' constraints, drop the '+'.
> 
> Agreed, will update.
> 
>>
>>> +    type: object
>>> +    additionalProperties: false
>>> +    description:
>>> +      RIS nodes for each resource instance in an MSC. These nodes 
>>> are required
>>> +      for each resource instance implementing known MPAM controls
>>> +
>>> +    properties:
>>> +      compatible:
>>> +        enum:
>>> +          - arm,mpam-cache
>>> +          # Memory bandwidth
>>> +          - arm,mpam-memory
>>> +
>>> +      reg:
>>> +        minimum: 0
>>> +        maximum: 0xf
>>> +
>>> +      cpus:
>>> +        $ref: /schemas/types.yaml#/definitions/phandle-array
>>
>> Drop. 'cpus' has a type already.
>>
> 
> Agreed, will update.
> 
>>> +        description:
>>> +          Phandle(s) to the CPU node(s) this RIS belongs to. By 
>>> default, the
>>> +          parent device's affinity is used.
>>> +
>>> +      arm,mpam-device:
>>> +        $ref: /schemas/types.yaml#/definitions/phandle
>>> +        description:
>>> +          By default, the MPAM enabled device associated with a RIS 
>>> is the MSC's
>>> +          parent node. It is possible for each RIS to be associated 
>>> with
>>> +          different devices in which case 'arm,mpam-device' should 
>>> be used.
>>
>> We should drop this until there's a use for it.
>>
> 
> On 'arm,mpam-device': we believe this property is structurally
> necessary. The MPAM specification (IHI0099B) states:
>      "Resource instance selection (RIS) allows an MPAM MSC to support
>      multiple resources, including multiple resources using the same
>      resource type or partitioning control. When RIS is implemented, an
>      MPAM MSC must implement independent resource controls and two or
>      more resources of the same type."
> 
> Once an MSC implements RIS, it must support ≥ 2 resources of the same
> type (a spec requirement). An MSC node has only one parent, so the
> association between each RIS and its corresponding device cannot be
> expressed through a shared parent alone. A per-RIS explicit association
> mechanism is therefore needed, and 'arm,mpam-device' is designed for
> exactly this purpose.
> 
> The property is used in the immediately following patch "arm_mpam: Add
> device tree support for MSC probing". If you have a different view on
> this design, we are happy to discuss further.
> 
> 
>>> +
>>> +    required:
>>> +      - compatible
>>> +      - reg
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +dependencies:
>>> +  interrupts: [interrupt-names]
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    L3: cache-controller@30000000 {
>>> +        compatible = "foo,a-l3-cache", "cache";
>>> +        cache-level = <3>;
>>> +        cache-unified;
>>> +
>>> +        ranges = <0x0 0x30000000 0x800000>;
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>> +
>>> +        msc@10000 {
>>> +            compatible = "arm,mpam-msc";
>>> +            reg = <0x10000 0x2000>;
>>> +            interrupts = <1>, <2>;
>>> +            interrupt-names = "error", "overflow";
>>> +            arm,not-ready-us = <1>;
>>> +            /* CPU affinity implied by parent cache node  */
>>> +        };
>>> +    };
>>> +
>>> +    mem: memory-controller@20000 {
>>> +        compatible = "foo,a-memory-controller";
>>> +        reg = <0x20000 0x1000>;
>>> +
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>> +        ranges;
>>> +
>>> +        msc@21000 {
>>> +            compatible = "arm,mpam-memory-controller-msc", 
>>> "arm,mpam-msc";
>>> +            reg = <0x21000 0x1000>;
>>> +            interrupts = <3>;
>>> +            interrupt-names = "error";
>>> +            arm,not-ready-us = <1>;
>>> +            numa-node-id = <1>;
>>> +        };
>>> +    };
>>> +
>>> +    iommu@40000 {
>>> +        reg = <0x40000 0x1000>;
>>> +
>>> +        ranges;
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>> +
>>> +        msc@41000 {
>>> +            compatible = "arm,mpam-msc";
>>> +            reg = <0x41000 0x1000>;
>>> +            interrupts = <5>, <6>;
>>> +            interrupt-names = "error", "overflow";
>>> +            arm,not-ready-us = <1>;
>>> +
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>> +
>>> +            ris@2 {
>>> +                compatible = "arm,mpam-cache";
>>> +                reg = <2>;
>>> +                arm,mpam-device = <&L3>;
>>> +            };
>>> +        };
>>> +    };
>>> +
>>> +    msc@80000 {
>>> +        compatible = "foo,a-standalone-msc";
>>> +        reg = <0x80000 0x1000>;
>>> +
>>> +        clocks = <&clks 123>;
>>> +
>>> +        ranges;
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>> +
>>> +        msc@10000 {
>>> +            compatible = "arm,mpam-msc";
>>> +            reg = <0x10000 0x2000>;
>>> +            interrupts = <7>;
>>> +            interrupt-names = "overflow";
>>> +            arm,not-ready-us = <1>;
>>> +
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>> +
>>> +            ris@0 {
>>> +                compatible = "arm,mpam-cache";
>>> +                reg = <0>;
>>> +                arm,mpam-device = <&L2_0>;
>>> +            };
>>> +
>>> +            ris@1 {
>>> +                compatible = "arm,mpam-memory";
>>> +                reg = <1>;
>>> +                arm,mpam-device = <&mem>;
>>> +            };
>>> +        };
>>> +    };
>>> +
>>> +...
>>>
>>> -- 
>>> 2.34.1
>>>
> 

-- 
Thx and BRs,
Yin


