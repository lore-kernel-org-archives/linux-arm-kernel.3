Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2AACD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 18:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3POHqsQDxTwqW4qayTc+L30XYDNUCr7AcHGHbDcIS8=; b=A9BNfHMDor+8e3twFFUDKd4iLD
	VpIpAgGFvckmDfqh8vSwzzzuqQxyVP50BVZmW8fwZvq0Z4fZeS0m2FoCPwB/Vm800ljrsK9NbKGbk
	6AhF2wqPJuQ60/aPi+iTUTNSfZieGKMDr5gjGfypR/JX6Es+SJzDsXRLQmiSISB3cyNSi2cCEcHJC
	c4jAt9aEOfQGED7Q6td0XM2+J191PYn3F77ASv+kPyl9lMYz/VHNiUkmJAG+tkizq8XY3/98qLBYW
	Uw+I86poj6TgBYEw14qtywCOvWhZ7WzEQCZYCLVMFiEQ5esn2sF1vp6+IQLzDZBDEynucz9rt9E+r
	Mx4o+aSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlQF-00000005P5H-2erL;
	Wed, 20 May 2026 18:13:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlQC-00000005P4h-1Uci
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 18:13:33 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KBZRMD3084906
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 18:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3POHqsQDxTwqW4qayTc+L30XYDNUCr7AcHGHbDcIS8=; b=dKhqo80dgDn70xdW
	rOaLg+L3cxWEkCulCKsvvTWiEI6VcfV/vvG6YoZBHdgCtsfaSGeoCD9QukzHaxf6
	Xmdbv/s8ZXUF7y46sAXcREZ7+HrLEV4PWaMAPYFbTqmStLQKtSf18Hpd6angxnnB
	QFfDepGLT0gRCmuSJLZzvgEKfC77Lggs/XZDhavL5rl37OqdfVLVSRvKCd61MNpw
	2LzvGujWpjxo1RKR6t7JHu/NtBhDeqnxluTj7Qspj1WmqB7uJe0mipE7pySZvjY/
	m2BtqSxTqebHH7+c12fA/n6jwmcdMJahZpB+nHmwsbcttRQZEDGpKKPNyDikJZ1G
	bux+YA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f1nu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 18:13:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-837729dfb2cso952052b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 11:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779300810; x=1779905610; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3POHqsQDxTwqW4qayTc+L30XYDNUCr7AcHGHbDcIS8=;
        b=gXvOTVuClpuWEtoSHa+E7F39VI0wUNB0OE/x2eRd4dwBiNFDRgg1o2siHFiLa4WBEF
         Lfo1I1QNNEqMYTWRWfepniLIKsq4EYHFVfOo+qEB5P53vLDGGk5gyAtJBBnQCHfzXMyu
         0FZnRHUwz+VhN/jQrABMbUbycoroqPhaJn+MyZN5x+uQiekvJa0YVrZo4JAiolbYsFqj
         Pyceyj792keZ/hXkdOlAzoQdt3zNMYmrxtaq7mOnXvRCE7phbkcja1rQwGRFOBRH68U8
         VN5OH49AkID8rgM4/BfxKw/59mXDudiIOkYDAXuD1NgkzoJur+ihTMc8IhkhSZ9QgbiA
         XvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779300810; x=1779905610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3POHqsQDxTwqW4qayTc+L30XYDNUCr7AcHGHbDcIS8=;
        b=nQPYwTAL9P0Gv5+eVBT/tQ9vZ3Betomfbbb6W/izQj4x8e1JG9vYKkG167cbc0FOYb
         slgnKBY4ZKL6WhCSzN58byjUqXD13yMGmRSJhL562o5quOLSQVZMOd5B3blPiTwCqfLZ
         lGGl8R3yMQkvuU1msofNxuKKu23cdUe2te+lyLRU0WdL1DA9Qqk4akAMzy+IGmRDy0hy
         Vhp9UaePc0+cGVNoHBn5owQ43TOJQ04Jqh8iGtBGZknBstO60a7G4WTGmSjcaLXfESzO
         XM7REotu3pPe+wE8aNo1j/vZzbM/MWgxRpAuPP5/ehOtII/yQ3VgRhFxNpUTRJUEoAIe
         WIzw==
X-Forwarded-Encrypted: i=1; AFNElJ+mWOqQiqNDIsvoNFG+uLCt6r8Gip7HH9n7JWpv+5X5PmtAoY4kuA+v83hmgTmWAV2GaNYWlNL5c+K+7AnTJV0U@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+0OCMex64IoZfP/Tdh3TV4WcIe99Ut9WyyjxeUqUloFgGIY8+
	ZM2IkjEffw7Ot9hDMLYt1dI6l1SMcUpvW1u0uB7kaW2YvcGYImZCWQYkz0h6NCoVeBAKN+tchV7
	NElfSxVDUZgNdT3OCEwK7mPf+gFYfWGJEwmZs3WwAZzOGPRZktuyN+NNxqq6J56GLS2fvVOSume
	8+CQ==
X-Gm-Gg: Acq92OHSOh0T6xbmWuw4/JOz1sEfSkP853mSAtMIrTzo3jIVFGwPUXvI3amLUkpWDR4
	oU46su2bteJA8JZXxgfkvW97RLd0HXfngvS7tMFyyC6Ci8YPvJvSG6hLikkv3fDnUvAs5bth9Dn
	XGyucGQySv8ndYi0/NHIjedatNbre9Q96gpao6a6wAqlo6JrJryVTdv6MJZRdMfLCMoQQStaXL2
	QM6Ye6hAgagtJBHikMB+WfCoIjeYdBnLewEfVnyk0JeMjmTZunN5e7kmM2wWGaz4ylYw/eYvILl
	jSZfAUCLQRwPWOpyBxvs/YTqZM7J1D9mlFhEzf4AgAysXj/NoAZNwrRsCkItFCoPrPk1KuTCarX
	DkBXHIRt3J5hGrC0h0emk5GSFOD+0JWzB+yLOP03kGZAbi8Gj
X-Received: by 2002:a05:6a00:4c94:b0:834:e09b:de73 with SMTP id d2e1a72fcca58-83f33dda422mr13248443b3a.7.1779300809993;
        Wed, 20 May 2026 11:13:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c94:b0:834:e09b:de73 with SMTP id d2e1a72fcca58-83f33dda422mr13248414b3a.7.1779300809371;
        Wed, 20 May 2026 11:13:29 -0700 (PDT)
Received: from [192.168.0.7] ([49.204.26.38])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f24cd0422sm26506189b3a.18.2026.05.20.11.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 11:13:28 -0700 (PDT)
Message-ID: <48e298d0-f4cb-4afb-8ba1-a6b39f3285cb@oss.qualcomm.com>
Date: Wed, 20 May 2026 23:43:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] dt-bindings: arm: ras: Introduce bindings for ARM
 AEST
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
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <20260513175823.GA1471517-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0df9cb cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=6DK/O5GeEcI+fsUIEy35yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=3A8QVl99vi6_thLXI7oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: Qz7-UHUsFs461IiC39tqR2S3D7pHFbH_
X-Proofpoint-ORIG-GUID: Qz7-UHUsFs461IiC39tqR2S3D7pHFbH_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE3OCBTYWx0ZWRfXwUwjcdGXf/kV
 k/uL7lPINcTTmvh5IzrL50tZGBwMHOS9RFALU744w3e0UVHqYhkogmSzhWexIpHN833Z2VmQVCF
 zlWLPucyj4HmdZHa05ZcKlY68niPqiQ3IlJ4kHVIDbVNrci8WHOBbuwFHLz1Ow/Ur97gZgDkXiC
 QqSZ5QLN69P0bBUApHcf3OMZfSCq2SmJV9U+yfUWp7/cKo64X8xe8igDdUHQfoSGN7cd9mcZiep
 uWT66K6BcqeQQUtqvHObChsTUBZsyGBtvADbzpZ4ItRHc7zIaeun3ZrKsfLXPFYPAc55iov/rz7
 VE4ySN8PN4bOH+ZppMp+Ao/qxopWNtGdzEHeO0IVPLMeUmCE6BKdzm6mmPa7nMjrK0LksuHytLa
 GdwPFKBWn8SZaPqm6nKCw7eoMc7K2hPzU0PulxNyq7789MNog/OcTx9rKvuE9K9lqw0useEZ46L
 iWhHZU8621x5SkfMsNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_111332_525455_39B7CA69 
X-CRM114-Status: GOOD (  27.93  )
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

Thanks for helping reviewing the code!

On 5/13/2026 11:28 PM, Rob Herring wrote:
> On Tue, May 05, 2026 at 05:53:49PM +0530, Umang Chheda wrote:
>> The Arm Error Source Table (AEST) specification describes how firmware
>> exposes RAS error source topology to the operating system. On ACPI
>> systems this information is provided via the AEST ACPI table.
>>
>> Introduce Device Tree bindings that provide an equivalent description
>> of AEST error sources for DT-based platforms.
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/arm/arm,aest.yaml          | 406 +++++++++++++++++++++
>>  include/dt-bindings/arm/aest.h                     |  43 +++
>>  2 files changed, 449 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm,aest.yaml b/Documentation/devicetree/bindings/arm/arm,aest.yaml
>> new file mode 100644
>> index 000000000000..7809a0d38270
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/arm,aest.yaml
>> @@ -0,0 +1,406 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/arm,aest.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Arm Error Source Table (AEST)
>> +
>> +maintainers:
>> +  - Umang Chheda <umang.chheda@oss.qualcomm.com>
>> +
>> +description:
>> +  The Arm Error Source Table (AEST) describes RAS error sources and their
>> +  register interfaces. Each error source exposes one or more error records
>> +  through either system registers or a memory-mapped register window, and
>> +  may signal errors via interrupts. The top-level node acts as a container
>> +  for one or more child nodes, each describing a single AEST error source.
>> +  Refer to the Arm AEST specification (DEN0085 / DDI 0587B) for details.
>> +  Flag bit constants for use in DT source files are defined in
>> +  <dt-bindings/arm/aest.h>.
>> +
>> +properties:
>> +  compatible:
>> +    const: arm,aest
>> +
>> +  "#address-cells":
>> +    const: 2
>> +
>> +  "#size-cells":
>> +    const: 2
>> +
>> +  ranges: true
>> +
>> +required:
>> +  - compatible
>> +
>> +additionalProperties: false
>> +
>> +patternProperties:
>> +  "^aest-[a-z0-9-]+(@[0-9a-f]+)?$":
>> +    type: object
>> +    description:
>> +      An AEST error source node describing one error source defined by
>> +      the Arm AEST specification.
>> +
>> +    properties:
>> +      compatible:
>> +        description:
>> +          Identifies the type of AEST error source. Each value corresponds to
>> +          a distinct error source class defined by the Arm AEST specification.
>> +          arm,aest-proxy represents a proxy error source that forwards errors
>> +          from another error source.
>> +        enum:
>> +          - arm,aest-processor
>> +          - arm,aest-memory
>> +          - arm,aest-smmu
>> +          - arm,aest-gic
>> +          - arm,aest-pcie
>> +          - arm,aest-vendor
>> +          - arm,aest-proxy
> 
> This is a fundamental difference how DT and ACPI get structured. ACPI 
> defines new table for some feature and puts everything in that table. 
> For DT, these all belong in the node for the corresponding h/w. For 
> example, if the GIC supports AEST, then that belongs in the GIC node.

Thanks for the feedback. To clarify your suggestion — should the AEST
RAS properties be added directly as properties of the hardware node
(e.g. arm,ras-num-records inside the cpu@0 node itself), or as a child
node under the hardware node (e.g. a ras-error-source {} child under cpu@0)?


> 
>> +
>> +      reg:
>> +        description:
>> +          Register ranges for the error source. Absence of reg implies
>> +          system-register access (interface type 0). A single range implies
>> +          memory-mapped access (interface type 1). Two ranges imply
>> +          single-record memory-mapped access (interface type 2).
>> +        minItems: 1
>> +        maxItems: 4
>> +
>> +      reg-names:
>> +        description:
>> +          Names for the register ranges. The base error-record window is
>> +          unnamed (or first entry). Optional named ranges provide access to
>> +          the fault-injection, error-group, and interrupt-config register
>> +          windows defined by the AEST specification.
>> +        minItems: 1
>> +        maxItems: 4
>> +        items:
>> +          enum:
>> +            - fault-inject
>> +            - err-group
>> +            - irq-config
>> +
>> +      interrupts:
>> +        description: Interrupts associated with the error source.
>> +        minItems: 1
>> +        maxItems: 2
>> +
>> +      interrupt-names:
>> +        description: Names of the interrupts associated with the error source.
>> +        minItems: 1
>> +        maxItems: 2
>> +        items:
>> +          enum:
>> +            - fhi
>> +            - eri
>> +
>> +      arm,fhi-flags:
>> +        description:
>> +          Bitmask of flags for the fault-handling interrupt (FHI), as defined
>> +          in the AEST node interrupt structure flags field. Constants are
>> +          defined in <dt-bindings/arm/aest.h> - AEST_IRQ_MODE_LEVEL (0),
>> +          AEST_IRQ_MODE_EDGE (1).
> 
> DT already has a way to define interrupt flags. Why invent something 
> new?

Ack, this flag is not needed for DT based systems, will remove this.

> 
> Rob

Thanks,
Umang



