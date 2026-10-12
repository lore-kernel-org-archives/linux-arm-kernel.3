Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3376ECA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 07:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mkIBpRp2fdiYGw3F/8jBInFQ0xmXuoQThNxyii/ePQ=; b=KwjV4tQNk/6gaNgFD76mqXuoDf
	JvUKvcxo71XSeQ8sNNW62KfJwzC3CB5eiEKG/XkOmxwYSNfMHX58qAIPtwp3Osm6NJfPfanyCFtqq
	Zk0p+Ot30iAXST4lzc+E6+tDvxM/YoLmsSAwHN9Nrem7bQClloOT37fNWG5g4ijGjdpo+2kpBeyv8
	Ym155qiOl0+OHOwnhPOuWQbUWbthalna4gsFYpgGAd9qn8spDgzFvXFkU3YbStZm91V7jaEDT6urP
	q5BmkPriQ2ti42W9zBBr/RiS+ZRp6bam5PrxRp0DW/BV2Uz8XQ1Dr9BRJBMlPz52mxmxgX9Otx7cA
	o3nAVjIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGA6V-00000009nnY-3ir2;
	Mon, 12 Oct 2026 07:05:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGA6S-00000009nn6-1GqA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 07:05:46 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55xWq4068788
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 07:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0mkIBpRp2fdiYGw3F/8jBInFQ0xmXuoQThNxyii/ePQ=; b=YxohMTpQhpHlKFpU
	aA5P7OFC0FlX5oprdPeYRrtOXfX8yOQJD+wRdAqF9jQho0D/1MUh/j/ovMdwA2cN
	nst1pLTAiQzVKD+MrX9C2HBa81SFxHaN6tj1BkQYEpUaKHewK0bvxXCADKpXfbII
	cFF+ff6a80SCnP/W8Y4RRQae5A6E9s9rjoBA2LtWt3er4L0TCSxy0nVYr/y2Aq0O
	t/zbfl45vIzarVRSL9cC62dQhmaLNiHWmLbE7ggwdoxXFg5Gl+sVKkvq/vHoX+BC
	7mL0NrmNO+A25Jzoazfc2wzz82X7ZlpbV4CZeC7IwDxyX77PpE4AU1AyW0eCy5ZP
	0KjpIg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjn90b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 07:05:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-887e45c7063so1203391b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 00:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791788742; x=1792393542; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0mkIBpRp2fdiYGw3F/8jBInFQ0xmXuoQThNxyii/ePQ=;
        b=jfzcdDshBLrn5DIZgjeaOm9UeFKC8qrLRqIUGakEoSCQUdgOZus8rLnvyS5vPQRBLN
         RQPsoRnjXbXFtIR4IN5gv5lw/lvIGJEyeh3aWlnn5CZ7IpLYuedmrxj1mu8yZ9T67EtX
         G/52MmEhPJozeiqpd/3JYemIcAemDuUVCcT+coggIq0ydCz4YJuvyL3gan5jmPlB9Q6X
         laSNllnE0tSxB5P1/oBsAXz+qUybl43ygDYCHyNLvsSvxOI3Ik/B7mUChTrXKORjeYUe
         jWqkqvgTGrkU0aqo2E+bItZUwl89TO2aU2j9g1A3fEIqaUSDUpnjNs8jho9swuvydYCh
         oU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791788742; x=1792393542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0mkIBpRp2fdiYGw3F/8jBInFQ0xmXuoQThNxyii/ePQ=;
        b=R23TI8kiYUAlrO9kNtRvNv3VCpdWYK3zvR9ZM7f3gaM3hY9aDtQ/Lo2QGvHsZLO82G
         V2kiRIAz/B+2rT6qTBwJRi78zZ/x5GNMIhnKtSiJYn7i6i1l11b4MGww1PDaVNdTcVOt
         Gb9oM80G+hLXeZeaUMSP9X/srN53obLLM7kT5qT/XQgFS8EjEf1W1FprqVFtDT43hPHc
         3wNd0d81ln7D9OZUpBBhvdB73+iJ6AZydV8IHWdJR7ICxg8ybeFXJ9EvhQFP2NJliksH
         vCqcUIxzg08nfaskZIf8GadzNMwlQopz4EGHvTBANFrIAKJcvm/LSVuF125/UtQtBS6Z
         Uoiw==
X-Forwarded-Encrypted: i=1; AKwUvByEzB9Q164Yrsd8Obroy/QcEOB6XHzAtfuzsjdddKo9dJE4ESVNwHXQ0xX5LEOFV7vanx2QbeL9jnrkfv4xCpum@lists.infradead.org
X-Gm-Message-State: AFq9FYIIQMEj2/U+8b9hyuuO/9GfLWEnj5e6q8uP3ovmN28ecUvN1tce
	1bJR/PFmCb/z7tHQ6TB4unlaJ8OYfWZ28ho/RAE/ztvFf7u9eIokGJ/az+GUJ6pUWuZRG4rzrGU
	2SgS+WPoiv6x2ifUO7VdJHS49ArSwcNviDvK5z3CAdvdEp01yNTZ4cdiM3pOrROjEAx3Ctx7Oh3
	unHw==
X-Gm-Gg: AYBFou3RT0t5rPYzBZGqHJi74Tq2bzf//FkZ4ox2izhZq5bZFc+lRGeqwjkjFV9ilrf
	RXZRW6lNypgz1kQtz0hd+Sh88JzrqhQzoI22w1j3JcW6orpau+tugkFuYwfAp+iYn+GM76sPp4r
	f43bc4VQmYNvy9+VwNsCNlsrKQToUGfrxItnuDyuurtZF+3l2vj51aZLpNLjWSEykt+3vjy7y9M
	U1sCbpYvW0/sbWQX+fAym3bfmRMkAvmN4j5rDVrUSFr+da4KeaTuBJxUuoVJ59+B452+pd/4aDM
	blhA4Kn2IPTg7VDCcQdNgHDPhWNim+7vqhb17OnvKKRMptNeE5En8Y3sVd739GAQumKAIkXoLLp
	4SrcWe8GGn7R9fiyrtA==
X-Received: by 2002:a05:6a00:4fce:b0:892:d40c:4f7b with SMTP id d2e1a72fcca58-897c653fe53mr7054546b3a.10.1791788741974;
        Mon, 12 Oct 2026 00:05:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fce:b0:892:d40c:4f7b with SMTP id d2e1a72fcca58-897c653fe53mr7054500b3a.10.1791788741395;
        Mon, 12 Oct 2026 00:05:41 -0700 (PDT)
Received: from [10.64.69.36] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896b68ef6c6sm3737672b3a.4.2026.10.12.00.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:05:41 -0700 (PDT)
Message-ID: <2eddfb6d-c622-4d72-827e-aed685e72b9c@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 15:05:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] dt-bindings: arm: Add MPAM MSC binding
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
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20261008212736.GB1318789-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOCBTYWx0ZWRfX6A4ypjleqU0Z
 HRE0/B8VFdb5VLLVVrOGGkQFhcxLt8nf4CiP0OpRlPNrQvQm5fx9XhTF3BCbwaWBgFYvRl1r28D
 HHV65KtUuHNIezOwzWfoAxgPLw9pofUa9tMUHSNS0iK0MfMg0YmtEZYHEpcAvY/V3cIVp8NHwi4
 u5dMBf9f27lYFBM6It92O0gZ5EVuV1mY/O68WBf6TsR4ZyWO5gSjb28ELzfKF4nqUP+IERa6lCv
 Ax27l0bY9C/HYCtmwgZdC0LTZ2W3dn5c2asabtw11JE+6Gqa7Xe8Wc3W6FKNc2HOnKJoeY+BLLC
 bLuJLUUrq0/awb4eS5xteL7MHgAsoIweQAcpi4mA/5nyM+BcaEJ05aKoz20P9cCiEtjv/54ddi9
 FAqkD/5ltknrCBbm11UvDwIQnfQRcbJISC2/JPK5bDbZss+fS6id0H2JnVyEwxdyYTN92kloVB8
 X815YsLwrAgowSxkfiA==
X-Proofpoint-ORIG-GUID: Bv7o2nzenLw24z-T5rHsYe3YZ6b2vNEJ
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6acc86c6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KYmfK08lGGyfDj9egygA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: Bv7o2nzenLw24z-T5rHsYe3YZ6b2vNEJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOCBTYWx0ZWRfXwmW4S0jIhw3l
 8l3fCxFUKbvJh1l87auIMRdFx1sgN/KwIMWOzybDSdXnYDJ/aeEl6yrxaov4S7txHIl5ymcQStQ
 g7J7TVDVzoLBxUBX6G00KRXsbPlwVac=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_000544_355950_6A9954E4 
X-CRM114-Status: GOOD (  38.61  )
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



On 10/9/2026 5:27 AM, Rob Herring wrote:
> On Thu, Oct 08, 2026 at 02:41:12PM +0800, Yin Li wrote:
>> From: Rob Herring <robh@kernel.org>
>>
>> The binding is designed around the assumption that an MSC will be a
>> sub-block of something else such as a memory controller, cache controller,
>> or IOMMU. However, it's certainly possible a design does not have that
>> association or has a mixture of both, so the binding illustrates how we can
>> support that with RIS child nodes.
>>
>> A key part of MPAM is we need to know about all of the MSCs in the system
>> before it can be enabled. This drives the need for the genericish
>> 'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
>> until a h/w specific driver potentially enables the h/w.
>>
>> Cc: James Morse <james.morse@arm.com>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> [ Yin Li and Huang Yiwei: use oneOf for the compatible to allow both
>>    standalone arm,mpam-msc and the two-item combination; fix schema field
>>    order, type constraints and yamllint spacing; fix example reg addresses,
>>    add arm,mpam-device phandle and remove TODO comment ]
>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 202 +++++++++++++++++++++
>>   1 file changed, 202 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>> new file mode 100644
>> index 000000000000..3c7b13a23ff2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>> @@ -0,0 +1,202 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
>> +
>> +maintainers:
>> +  - Rob Herring <robh@kernel.org>
>> +
>> +description: |
>> +  The Arm MPAM specification can be found here:
>> +
>> +  https://developer.arm.com/documentation/ddi0598/latest
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: arm,mpam-msc                   # Further details are discoverable
>> +      - items:
>> +          - const: arm,mpam-memory-controller-msc
> 
> Why do we need this?
> 

Hi Rob,

Thanks for the review.

The 'arm,mpam-memory-controller-msc' compatible is needed because,
unlike cache MSCs, memory controller MSCs cannot rely on the parent node
to identify the resource type.

Cache controllers universally carry a 'cache' compatible, so the driver
can recognise any cache parent and derive the cache ID from standard
properties. No equivalent convention exists for memory controllers, and
the component ID comes from the MSC's own 'numa-node-id' rather than the
parent, so there is no parent attribute to rely on.

'arm,mpam-memory-controller-msc' provides the explicit declaration that
this MSC controls memory. It is used in "arm_mpam: Add support for
memory controller MSC on DT platforms".

On 'oneOf': the original 'items' form requires both strings to be
present, which is not appropriate for cache MSCs. Andre also noted this 
in RFC v2, so we changed it to 'oneOf'.

>> +          - const: arm,mpam-msc
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: A memory region containing registers as defined in the MPAM
>> +      specification.
>> +
>> +  interrupts:
>> +    minItems: 1
>> +    items:
>> +      - description: error (optional)
>> +      - description: overflow (optional, only for monitoring)
>> +
>> +  interrupt-names:
>> +    oneOf:
>> +      - items:
>> +          - enum: [error, overflow]
>> +      - items:
>> +          - const: error
>> +          - const: overflow
> 
> This can be expressed as:
> 
>        minItems: 1
>        items:
>          - enum: [error, overflow]
>          - const: overflow
> 

Agreed, will update.

>> +
>> +  arm,not-ready-us:
>> +    description: The maximum time in microseconds for monitoring data to be
>> +      accurate after a settings change. For more information, see the
>> +      Not-Ready (NRDY) bit description in the MPAM specification.
>> +
>> +  numa-node-id:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: NUMA node identifier for the memory resource this MSC controls.
>> +
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +patternProperties:
>> +  '^ris@[0-9a-f]+$':
> 
> Based on the 'reg' constraints, drop the '+'.

Agreed, will update.

> 
>> +    type: object
>> +    additionalProperties: false
>> +    description:
>> +      RIS nodes for each resource instance in an MSC. These nodes are required
>> +      for each resource instance implementing known MPAM controls
>> +
>> +    properties:
>> +      compatible:
>> +        enum:
>> +          - arm,mpam-cache
>> +          # Memory bandwidth
>> +          - arm,mpam-memory
>> +
>> +      reg:
>> +        minimum: 0
>> +        maximum: 0xf
>> +
>> +      cpus:
>> +        $ref: /schemas/types.yaml#/definitions/phandle-array
> 
> Drop. 'cpus' has a type already.
> 

Agreed, will update.

>> +        description:
>> +          Phandle(s) to the CPU node(s) this RIS belongs to. By default, the
>> +          parent device's affinity is used.
>> +
>> +      arm,mpam-device:
>> +        $ref: /schemas/types.yaml#/definitions/phandle
>> +        description:
>> +          By default, the MPAM enabled device associated with a RIS is the MSC's
>> +          parent node. It is possible for each RIS to be associated with
>> +          different devices in which case 'arm,mpam-device' should be used.
> 
> We should drop this until there's a use for it.
> 

On 'arm,mpam-device': we believe this property is structurally
necessary. The MPAM specification (IHI0099B) states:
     "Resource instance selection (RIS) allows an MPAM MSC to support
     multiple resources, including multiple resources using the same
     resource type or partitioning control. When RIS is implemented, an
     MPAM MSC must implement independent resource controls and two or
     more resources of the same type."

Once an MSC implements RIS, it must support ≥ 2 resources of the same
type (a spec requirement). An MSC node has only one parent, so the
association between each RIS and its corresponding device cannot be
expressed through a shared parent alone. A per-RIS explicit association
mechanism is therefore needed, and 'arm,mpam-device' is designed for
exactly this purpose.

The property is used in the immediately following patch "arm_mpam: Add
device tree support for MSC probing". If you have a different view on
this design, we are happy to discuss further.


>> +
>> +    required:
>> +      - compatible
>> +      - reg
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +dependencies:
>> +  interrupts: [interrupt-names]
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    L3: cache-controller@30000000 {
>> +        compatible = "foo,a-l3-cache", "cache";
>> +        cache-level = <3>;
>> +        cache-unified;
>> +
>> +        ranges = <0x0 0x30000000 0x800000>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +
>> +        msc@10000 {
>> +            compatible = "arm,mpam-msc";
>> +            reg = <0x10000 0x2000>;
>> +            interrupts = <1>, <2>;
>> +            interrupt-names = "error", "overflow";
>> +            arm,not-ready-us = <1>;
>> +            /* CPU affinity implied by parent cache node  */
>> +        };
>> +    };
>> +
>> +    mem: memory-controller@20000 {
>> +        compatible = "foo,a-memory-controller";
>> +        reg = <0x20000 0x1000>;
>> +
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges;
>> +
>> +        msc@21000 {
>> +            compatible = "arm,mpam-memory-controller-msc", "arm,mpam-msc";
>> +            reg = <0x21000 0x1000>;
>> +            interrupts = <3>;
>> +            interrupt-names = "error";
>> +            arm,not-ready-us = <1>;
>> +            numa-node-id = <1>;
>> +        };
>> +    };
>> +
>> +    iommu@40000 {
>> +        reg = <0x40000 0x1000>;
>> +
>> +        ranges;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +
>> +        msc@41000 {
>> +            compatible = "arm,mpam-msc";
>> +            reg = <0x41000 0x1000>;
>> +            interrupts = <5>, <6>;
>> +            interrupt-names = "error", "overflow";
>> +            arm,not-ready-us = <1>;
>> +
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            ris@2 {
>> +                compatible = "arm,mpam-cache";
>> +                reg = <2>;
>> +                arm,mpam-device = <&L3>;
>> +            };
>> +        };
>> +    };
>> +
>> +    msc@80000 {
>> +        compatible = "foo,a-standalone-msc";
>> +        reg = <0x80000 0x1000>;
>> +
>> +        clocks = <&clks 123>;
>> +
>> +        ranges;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +
>> +        msc@10000 {
>> +            compatible = "arm,mpam-msc";
>> +            reg = <0x10000 0x2000>;
>> +            interrupts = <7>;
>> +            interrupt-names = "overflow";
>> +            arm,not-ready-us = <1>;
>> +
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            ris@0 {
>> +                compatible = "arm,mpam-cache";
>> +                reg = <0>;
>> +                arm,mpam-device = <&L2_0>;
>> +            };
>> +
>> +            ris@1 {
>> +                compatible = "arm,mpam-memory";
>> +                reg = <1>;
>> +                arm,mpam-device = <&mem>;
>> +            };
>> +        };
>> +    };
>> +
>> +...
>>
>> -- 
>> 2.34.1
>>

-- 
Thx and BRs,
Yin


