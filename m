Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94360CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 10:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ke6hFaye3GUWTYMdDv1mH0rJhnS2IhQe2jTb8z6TWDU=; b=iwNe5DP3e2q8eiklc0uJ0+WobX
	WG6hESj6nDhiHho9PbMXlBXkar5lzUH6bAofK0WIOZBMEI5wlRKe9XD80MiK2MlwBGBBuOpceVr54
	RoqBAv54MX7l4FfrRBsyO6uH1DUos+5Q09dh+MOrqP8KViz7z2y5Ncpx5tQpJpYSbWUC1w0puftaJ
	8mS2eZPRmMCSuXSTzXhgxFzpq1y6IOztUeHElAUtU2unCUuhxpUt5uqfJ4hso0xkFik8gqKdUptrN
	3xRQ4qt7CF/BiAP8ZmYIxPg9CysSgLvzT68f1PBhyWMEiuXkwMjuj094Y70mzLdw1uUsxEzdO9OWh
	FyFMrczQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUiol-0000000EoJO-2M9B;
	Wed, 03 Jun 2026 10:27:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUioj-0000000EoIj-0Fye
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 10:27:22 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RKdG3077837
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Jun 2026 10:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ke6hFaye3GUWTYMdDv1mH0rJhnS2IhQe2jTb8z6TWDU=; b=AS0wMddMbp1fh/so
	LCIczNK/D0EgtaowsN9foXMEEKOaP+ydRDWE+hyr9/xJGowRNASIbON7wol+YolX
	w+ZV0MlQQdZcmb+g0chRUlOTwsdR/uQ3Q5w86GrjOHw7VoHBxAi8NOhioaWAp517
	VN+pq5VzwCIdTVtNvziq4m4HIBxXoF5zO/Ii2Z7/z9Df+hU6L425FABWtyQLG5lM
	THtDxm9XMG6QumSe8rWzPVjfxiCCie7lflQPtTBAE27WA4kAOKlj2sa4qAomd+qB
	CMTmXw1csnyc4Cu+mHgQIg2LkvxSLVpittDnhXAnX+JnVeM6pJ/yC1C1Dpq4tAJI
	ZWFgfQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabbt0x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 10:27:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423ed642b5so769360b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 03:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780482440; x=1781087240; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ke6hFaye3GUWTYMdDv1mH0rJhnS2IhQe2jTb8z6TWDU=;
        b=V+2AXNmlCbq3HsJ1qlJe6gah1+minMEXm8Ni5UpP2ZJjS6Pa2ZZjcIhvSu9e2TJbPm
         sFKPJqE5plL0byZMhYwVO06tqDL0SqvuAfpTx/tl/4REavcnAiEHEkcEXPtzHJVKViJL
         jLZGSe7RTFzur0dG7HUWL2v5zM6/dQO/OGAbSH8j4VOmiXWj9ZOYvzYnESGw6iRWlrek
         Z9YX28Mxsb39mCT42NyA90MkIMbUVhjFK1hgb5r3Rtdn1bp8jwGt2oLNt+QLlQcnxgmJ
         zwwLtIebRbozkWr6MI5+qgq3t53vGbUfnhqZn+LO0yfNG2DGO2XVZhwXIgkArslnGfdP
         7JBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780482440; x=1781087240;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ke6hFaye3GUWTYMdDv1mH0rJhnS2IhQe2jTb8z6TWDU=;
        b=dRuE1K9IGs6gAQHxetNQMI2+xgJRl2KJtNK/mEk+2j3uA5U4h60y5jSixyGCqRzXvW
         GQ9W0ARI2gm/2HoUTSXGfE7r95CgS4o6m8XVnGuOc4PpswYVXWpGY8LcAWNm0ETUT1nJ
         2ifM8UIUrzTWwjDYleqSOEGdos8LvC4jZWKCVtCAbqid5oeLSF+QbKTJHRqzPas22vMq
         fe19H5eGa3LRcPbAOiw/kJ4PDEvKT1Yb/4yYBKIdQ/796mgIoHlFBU2nAYu3aHPNlZwg
         GV3HLZadYuXlnXIco3uK38N/gNLCKBA2C4mh5qmDz+atWiJ6eXLs1B7gO6QF4dbTHA7u
         0MwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8l8iPJ10C2U7ViwzM3ony2vECiJPadAet9J2NoanT1cCDxO5qK64jl0jUVkcS9/vLSU5z9kKXmhT1YNy1ND4rA@lists.infradead.org
X-Gm-Message-State: AOJu0YyAMmFrjFtb9v3xaZlXucKAivgwCK7mrDL7TmdhRmv3qw54xb/K
	uQK3DXNG2gOvxGyDhZODOecnn6W3vicA28/xGBOzOUTgzLH/6NlhsUqRTOb8kkzcprXu/EaZmVl
	Ky00H6J3QdgUxiPYZMzw16N9tFCfbZy+UpbhL4T2mMp3027EIrCFDk8wMeWEHoXWSf4AioKZanQ
	64kw==
X-Gm-Gg: Acq92OGBvXNaX94T/NqGVO/i6CFUF6iBhF3BJz9uNjpJVoRYNqN38ua5WKVhSPbWXoH
	u8ilUoFdAJEiwgebqGLyLg2tY7FyW0/g0SfR4srLZz5SCR8a/y4/dMJJM+hTGF4nAMB5l/p5LqM
	mFjjKfSRFTrI56Jv/8oQ4qSdaNtzfViSIZYeeXKtEOjp3j6Zr6p3AI3CXlG2P8z+gsFP2gNetAb
	Tmw66Zou246uuccINJNpCV+AmcLE3TcORjVqa579bwUGi3qAqvzDwAcy7al7wGOxxttsCllyFqd
	r1K/sfbRMXhcb8e04lQQESvCHgaj4E6xouxwjhQSDc6fRKMCKmZyGY8yWazxFdesc8Gk/SgVdQD
	7E5Z+3CXdKpCdy1PpDGSCJp3FFA2I6xF0dAcPethLet04CQpT9gTjivAL+ZhN
X-Received: by 2002:a05:6a00:3a27:b0:842:2d2c:2b58 with SMTP id d2e1a72fcca58-842838e011amr1625208b3a.5.1780482439586;
        Wed, 03 Jun 2026 03:27:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a27:b0:842:2d2c:2b58 with SMTP id d2e1a72fcca58-842838e011amr1625198b3a.5.1780482439078;
        Wed, 03 Jun 2026 03:27:19 -0700 (PDT)
Received: from [10.92.217.24] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428237430esm2428145b3a.21.2026.06.03.03.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 03:27:18 -0700 (PDT)
Message-ID: <fd5c9415-5275-4c0b-90ee-d81a5d5b660f@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 15:57:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] dt-bindings: arm: ras: Introduce bindings for ARM
 AEST
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
 <20260505-aest-devicetree-support-v1-5-d5d6ffacf0a5@oss.qualcomm.com>
 <20260513175823.GA1471517-robh@kernel.org>
 <48e298d0-f4cb-4afb-8ba1-a6b39f3285cb@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <48e298d0-f4cb-4afb-8ba1-a6b39f3285cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEwMCBTYWx0ZWRfX8itQAQm6c6gI
 f+XmRcJ2QD5bKXFrz3rudJ9EAFGWV6oFl08LaPmg1ucExtVb848sxqzvGLiYHn43W1xJjgx2867
 2C5BjJBsBVcvJvBc037RuYm5iuk2/f5ycbJqpoDdcnTzBx6gOqMf/zGhgAkqRSoZr5Sg/dKbD+f
 zTTSz6S6Cxxln+xhj3vi56bfdlsczz/SmyUalhxhfSb9+Uq3fvmZPAhr90aT+UwTRA7CvG+ihnp
 F6LlkfIHbyvuYY5M41fMlOb7XnSlgEUscOS4w00uJacH0lBAo7JWeWRi+DxnjglV1Ps/kTgqIEo
 61npQ0WmI924C/yYtMwaS8Ha1ZhKj5OIxCeqtwQhB/OsZjWueAlOKO950eI33XIYUEdy6821qLD
 ObMPpYskADj0M3qca1grkDHuGP87MJXyxrcj+qu85xxgsaRHv1U0kTZkcd+8d7Vwwkz5fPSIzpl
 MCeGENvPyI+cVQwDpyw==
X-Authority-Analysis: v=2.4 cv=UqZT8ewB c=1 sm=1 tr=0 ts=6a200188 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=AMbOtgs2x-SaA9YGKiUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 5qNLlT4fetu-kHc9lwpUcS0Da2-F5t3X
X-Proofpoint-GUID: 5qNLlT4fetu-kHc9lwpUcS0Da2-F5t3X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_032721_108287_65C5840E 
X-CRM114-Status: GOOD (  26.34  )
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

Hello Rob,

On 5/20/2026 11:43 PM, Umang Chheda wrote:
> Hello Rob,
> 
> Thanks for helping reviewing the code!
> 
> On 5/13/2026 11:28 PM, Rob Herring wrote:
>> On Tue, May 05, 2026 at 05:53:49PM +0530, Umang Chheda wrote:
>>> The Arm Error Source Table (AEST) specification describes how firmware
>>> exposes RAS error source topology to the operating system. On ACPI
>>> systems this information is provided via the AEST ACPI table.
>>>
>>> Introduce Device Tree bindings that provide an equivalent description
>>> of AEST error sources for DT-based platforms.
>>>
>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>> ---
>>>  .../devicetree/bindings/arm/arm,aest.yaml          | 406 +++++++++++++++++++++
>>>  include/dt-bindings/arm/aest.h                     |  43 +++
>>>  2 files changed, 449 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/arm,aest.yaml b/Documentation/devicetree/bindings/arm/arm,aest.yaml
>>> new file mode 100644
>>> index 000000000000..7809a0d38270
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/arm,aest.yaml
>>> @@ -0,0 +1,406 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/arm/arm,aest.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Arm Error Source Table (AEST)
>>> +
>>> +maintainers:
>>> +  - Umang Chheda <umang.chheda@oss.qualcomm.com>
>>> +
>>> +description:
>>> +  The Arm Error Source Table (AEST) describes RAS error sources and their
>>> +  register interfaces. Each error source exposes one or more error records
>>> +  through either system registers or a memory-mapped register window, and
>>> +  may signal errors via interrupts. The top-level node acts as a container
>>> +  for one or more child nodes, each describing a single AEST error source.
>>> +  Refer to the Arm AEST specification (DEN0085 / DDI 0587B) for details.
>>> +  Flag bit constants for use in DT source files are defined in
>>> +  <dt-bindings/arm/aest.h>.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: arm,aest
>>> +
>>> +  "#address-cells":
>>> +    const: 2
>>> +
>>> +  "#size-cells":
>>> +    const: 2
>>> +
>>> +  ranges: true
>>> +
>>> +required:
>>> +  - compatible
>>> +
>>> +additionalProperties: false
>>> +
>>> +patternProperties:
>>> +  "^aest-[a-z0-9-]+(@[0-9a-f]+)?$":
>>> +    type: object
>>> +    description:
>>> +      An AEST error source node describing one error source defined by
>>> +      the Arm AEST specification.
>>> +
>>> +    properties:
>>> +      compatible:
>>> +        description:
>>> +          Identifies the type of AEST error source. Each value corresponds to
>>> +          a distinct error source class defined by the Arm AEST specification.
>>> +          arm,aest-proxy represents a proxy error source that forwards errors
>>> +          from another error source.
>>> +        enum:
>>> +          - arm,aest-processor
>>> +          - arm,aest-memory
>>> +          - arm,aest-smmu
>>> +          - arm,aest-gic
>>> +          - arm,aest-pcie
>>> +          - arm,aest-vendor
>>> +          - arm,aest-proxy
>>
>> This is a fundamental difference how DT and ACPI get structured. ACPI 
>> defines new table for some feature and puts everything in that table. 
>> For DT, these all belong in the node for the corresponding h/w. For 
>> example, if the GIC supports AEST, then that belongs in the GIC node.
> 
> Thanks for the feedback. To clarify your suggestion — should the AEST
> RAS properties be added directly as properties of the hardware node
> (e.g. arm,ras-num-records inside the cpu@0 node itself), or as a child
> node under the hardware node (e.g. a ras-error-source {} child under cpu@0)?

Can you please help with this query ?

> 
> 
>>
>>> +
>>> +      reg:
>>> +        description:
>>> +          Register ranges for the error source. Absence of reg implies
>>> +          system-register access (interface type 0). A single range implies
>>> +          memory-mapped access (interface type 1). Two ranges imply
>>> +          single-record memory-mapped access (interface type 2).
>>> +        minItems: 1
>>> +        maxItems: 4
>>> +
>>> +      reg-names:
>>> +        description:
>>> +          Names for the register ranges. The base error-record window is
>>> +          unnamed (or first entry). Optional named ranges provide access to
>>> +          the fault-injection, error-group, and interrupt-config register
>>> +          windows defined by the AEST specification.
>>> +        minItems: 1
>>> +        maxItems: 4
>>> +        items:
>>> +          enum:
>>> +            - fault-inject
>>> +            - err-group
>>> +            - irq-config
>>> +
>>> +      interrupts:
>>> +        description: Interrupts associated with the error source.
>>> +        minItems: 1
>>> +        maxItems: 2
>>> +
>>> +      interrupt-names:
>>> +        description: Names of the interrupts associated with the error source.
>>> +        minItems: 1
>>> +        maxItems: 2
>>> +        items:
>>> +          enum:
>>> +            - fhi
>>> +            - eri
>>> +
>>> +      arm,fhi-flags:
>>> +        description:
>>> +          Bitmask of flags for the fault-handling interrupt (FHI), as defined
>>> +          in the AEST node interrupt structure flags field. Constants are
>>> +          defined in <dt-bindings/arm/aest.h> - AEST_IRQ_MODE_LEVEL (0),
>>> +          AEST_IRQ_MODE_EDGE (1).
>>
>> DT already has a way to define interrupt flags. Why invent something 
>> new?
> 
> Ack, this flag is not needed for DT based systems, will remove this.
> 
>>
>> Rob
> 
> Thanks,
> Umang
> 
> 

Thanks,
Umang



