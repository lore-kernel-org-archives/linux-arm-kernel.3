Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4553EC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 19:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I6KZVUu0NOdGo4+fh3bcS297v312oyXU0yQQKWOUJo8=; b=UGUldPbuNjh4aad7Lt6zR+t2G1
	E/2dTYlKvbTBlurKm1lH+vX6xe62oxraiGHUkbwnWpsZQ8GNCpfVLUaAYgg7VJLZljYUxCXN34OQZ
	0U3JpVNDbs6Xe2yzczXxIc+JKQVLmEJIicJq0Ab/eePPTSlEZFgLsqDDMwLvEIxKHV9XxDE4vTMAK
	6y5ls26EI1DcVSfn1WeBbR9btvE2cjgNayQLRP7AztgYz69EW5eLOYZFd+B3lyWPykYvGHK+CT6Wo
	CmHEyEDGHsSg6PpBtEIa5YRI14YMH21AFnfW6IrGKl/M8pNnWqbNxmet8OcT4F7lMSbGw1EJyR8t0
	GLcegl1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3U5-00000006ksZ-0teX;
	Mon, 17 Aug 2026 19:59:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3U3-00000006ksD-0oPv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 19:59:00 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HIR10E4167755
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 19:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I6KZVUu0NOdGo4+fh3bcS297v312oyXU0yQQKWOUJo8=; b=Q0GJxCkkdLSpHIAP
	Uv4KfkhkkoUQr+kg/XD/av2u/8ChZ/CgZmzH8if8DEk/XK8FH5giKdPLxMzP2vor
	LwBJNzb6walivvggEj/tXPZoOeJc2yEa1dKyE7Ri4JroeuoJ6yFVvN3Th/dSLqyn
	rbEoCcGTJUEQxFAPak1r28oxHe3h2D/NJUQhZKl0ptu53VtremMPbh3vfgAL+keO
	ocreXMhBmF7KLFCKrGahZTxfFKI6gtvRkrVkuDRx7vh5qQfCHaT7JFeaoA5HVWKZ
	/xk9yuuW1LL7RyJIDoLu6FJYg7OMEuiCn2dEx+shX9+urJ0wiZWVeoZwicMGhQ4V
	ED3EYQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y7ktm8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 19:58:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d371c85362so10450215ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 12:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786996737; x=1787601537; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6KZVUu0NOdGo4+fh3bcS297v312oyXU0yQQKWOUJo8=;
        b=X55NwPO9L9gV08zUfKMJDSjS88UkVTw32zdyzdFE4K2m28JzbMhiiT70e5G0QoLqdn
         f9qyBFn9UM8/P3m7pf6wCWONBY2LsO6R4+VWe3RHtPJ+i03es14jszkWBKOq3TQsy3gD
         Kmts8LjXapDfvPgxfeRrr1LzzWYqxPUZz07pDD+lFzXeipKApxDMwBrKMtXr+JMK8Csp
         wNJBih4js3itIKwWu7PsygcXgWte6uvPLwwFIzKPYl+2S96/P18rL2hpF8M35T4ykuAo
         avDX75uydZ+aH6bqe53PASu9IbwBUtn11BEWeMBaC3Dz54U92dtiIMiDCQ5Vb+wh3w9E
         wkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786996737; x=1787601537;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6KZVUu0NOdGo4+fh3bcS297v312oyXU0yQQKWOUJo8=;
        b=BYPS0GvrX15YURKFgeFuRhd5mujoVrKWVdHh+7V/GgJueWkbBPsBlTTXrMcgSxs+F1
         fwf9jSJE7D66OFuc2v70ZmHkmitcETDY/WTAjEXcJAQdIdk0USGRlPQT7jWp+ErFSsr5
         AG1r5EivZSr5NtTihIDNDP5DN1P1J2ae81Mz3v7stM5BzjOuq6tMvH7YokRraG4snAM9
         PNgibMLpHj85fqFKn75ItZpVplxIxgwkaqB7LLSs7KO4QAyYnRr2BRlKdgMepdYCaeDM
         h84OqC9nqdY1BTuZcXpkNxisRf2GrDrO2TZuRJvC8KseqdWCeS2rrHkJYWa5E7MV8yh/
         q84Q==
X-Forwarded-Encrypted: i=1; AHgh+RoLZt1iVLon31PaaqBFacdhK+wcyhEoOmjQVXq1rocTyn7D+8njxNYZaw/iSXE0M50RIjdYM7HvswpoSwUnbLP+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9Ltxvkhg2dpLYIDuTn+KxR5r/7ifTHsIJNm2Ipj1LsNyZu/4H
	mqsWcIgHBXGAoHNSJNEAVRToLgtCQ5bOsLRwneZMaa8/+HJylwK3QXQ6eiBh33yUFDJEBPmw2UD
	NrMLMnHe8hxS3RfxVJEBa6dY6gbXEK/SmTAD2G5R/uvLD3zqYriq+UbzaKkB+7yeQYAkBq7YRct
	e8EA==
X-Gm-Gg: AR+sD13sbSnFrDbr//0lusMHNI7nQawIwzbJw952ELlFdIRHmsrRHiUi9o88dhyoAC6
	pHpp66rbQ6A9GF7EzM3fLzFzrVaEwVt9+61ZhXvjPs+bBa2VYPQOCYRX4oS0CqaJBVjXp84LbUE
	Zsya94OAuRYi9aWn7x0EyWmRi5LC11NS89mMBUW8l6abg7FDt76kHcnBHlkD8ShqRTJXQehiBYu
	K5QV32iA4FmdncgKB6Dg/g3MdHjmcQLcZtaoRQBn7/uGbmo6RxmJfVQbtqOeEJoHj+ETyTlVgoR
	fyHzqQhx41QyPu0/3jTDF82Ho+ZZ/Iq8WoFJFZ1ofZU0PyAckpQst+S7UdfYtd0W8jvTemFuq6U
	+akLcVAQsJ3mliDzVeJ0UAbdPoeA=
X-Received: by 2002:a17:902:e54c:b0:2c9:ed4a:c3a4 with SMTP id d9443c01a7336-2d3b0503575mr194099385ad.0.1786996737330;
        Mon, 17 Aug 2026 12:58:57 -0700 (PDT)
X-Received: by 2002:a17:902:e54c:b0:2c9:ed4a:c3a4 with SMTP id d9443c01a7336-2d3b0503575mr194098985ad.0.1786996736646;
        Mon, 17 Aug 2026 12:58:56 -0700 (PDT)
Received: from [192.168.0.7] ([49.204.29.31])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326794c0c94sm16896499eec.9.2026.08.17.12.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 12:58:56 -0700 (PDT)
Message-ID: <40a62967-48c6-4327-b6fa-a22f6b86412d@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 01:28:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: ras: Introduce bindings for ARM
 RAS error sources
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        faruque.ansari@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
References: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
 <20260720081954.1858180-2-umang.chheda@oss.qualcomm.com>
 <20260731203515.GA1619665-robh@kernel.org>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <20260731203515.GA1619665-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6xBchWhsqSGmxwwCF_WZ19nUt0vaXayb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDE1MiBTYWx0ZWRfX8pSPM3eox+mv
 3z95fuXSjRG45lg2ajv3uoWPs66XPnyTbU2HOwjEO5DQUi9G/J1uhCHOwQIJ2wb++lFuMun0a7n
 jRcQI7S5Ur54k02BYLRPFsdUlSbrIIc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDE1MiBTYWx0ZWRfXwDpo2kjJVGrd
 poN7UmNaqVDgoB/Z9R5QBtmP2qoUf5NIBCh+ZA4mDTUDLbt2J2uzgGaBaDDk70PrRLTp1rBHCra
 ZoLovRHEgxveMFkAtuYzz28nCEb1d4sj3v32bFDw4xRDX9DBXiB84C3KoDDXsEFoTwk1hpsUV0K
 Lhzux/C6g+H7xAjtltOFZxybzv/d5detTeI9gOxwWQ+AWy2bDm7J/StQbFF4xuPq5isspR96LTR
 cvl3h0q5A5Cku31V8eGFc4JB8mMDouo98HZME1n9cWS9KMDsyFiaS3Xi5ZHifjtTZAsPKV/fCUi
 o3+A2RFqsGawf8ZfH6xQ8CdikHt2M7wE7G6nXRYo4aDTM+IArEww09k901M28MDFW/3qXIV0KJI
 rcdfY0gHUuCxVAm9Y4Ydvkd84c4T+QNkzZsnPbXdWYGCvBhS9kxV14EyZlcnTnH/d0TFw765b+e
 WeZwxBmCfiZl+dHV8kQ==
X-Authority-Analysis: v=2.4 cv=HYEkiCE8 c=1 sm=1 tr=0 ts=6a836802 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=UpYrFT5SPnpm06h6vIyJ/A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=0BPv0DUFnjzqbVs4ZvsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 6xBchWhsqSGmxwwCF_WZ19nUt0vaXayb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_125859_249316_1EC2F04F 
X-CRM114-Status: GOOD (  32.21  )
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

Thanks for reviewing the change!

On 8/1/2026 2:05 AM, Rob Herring wrote:
> On Mon, Jul 20, 2026 at 01:49:51PM +0530, Umang Chheda wrote:
>> ARMv8 and later processors implement the RAS (Reliability,
>> Availability and Serviceability) extensions, exposing hardware
>> error records through a standardised register interface.
>>
>> Add Device Tree bindings to describe RAS error sources.
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  .../bindings/arm/arm,ras-error-source.yaml    | 330 ++++++++++++++++++
>>  include/dt-bindings/arm/arm-ras.h             |  11 +
>>  2 files changed, 341 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/arm,ras-error-source.yaml
>>  create mode 100644 include/dt-bindings/arm/arm-ras.h
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm,ras-error-source.yaml b/Documentation/devicetree/bindings/arm/arm,ras-error-source.yaml
>> new file mode 100644
>> index 000000000000..add7063a1a62
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/arm,ras-error-source.yaml
>> @@ -0,0 +1,330 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/arm,ras-error-source.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: ARM RAS error source
>> +
>> +maintainers:
>> +  - Umang Chheda <umang.chheda@oss.qualcomm.com>
>> +
>> +description: |
>> +  ARMv8 and later processors implement the Reliability, Availability and
>> +  Serviceability (RAS) extensions.  Hardware blocks that support RAS expose
>> +  one or more error records through a standardised register interface.  Each
>> +  error record captures information about a detected hardware error (cache
>> +  ECC fault, TLB parity error, interconnect error, etc.) and can optionally
>> +  signal the OS via an interrupt.
>> +
>> +  Each DT node described by this binding represents one RAS error source —
>> +  a hardware block that exposes a set of error records.  Error records are
>> +  accessed either through system registers (for processor-local resources
>> +  such as L1/L2 caches and TLBs) or through a memory-mapped register window
>> +  (for shared or off-core resources such as L3 caches, SMMUs and GICs).
>> +
>> +properties:
>> +  compatible:
>> +    description:
>> +      Identifies the class of hardware block this error source belongs to.
>> +      arm,ras-processor covers processor error sources (cache, TLB, etc.).
>> +      arm,ras-smmu covers SMMU error sources.
>> +      arm,ras-gic covers GIC error sources.
>> +    enum:
>> +      - arm,ras-processor
>> +      - arm,ras-smmu
>> +      - arm,ras-gic
>> +
>> +  reg:
>> +    description:
>> +      Register windows for this error source.  When absent the error records
>> +      are accessed through system registers (ERRSELR_EL1 + ERX*_EL1).
>> +      When present, the first range is the primary error-record window;
>> +      additional named ranges are identified by reg-names.
>> +    minItems: 1
>> +    maxItems: 4
>> +
>> +  reg-names:
>> +    description:
>> +      Names for the optional additional register windows beyond the primary
>> +      error-record window.  err-group is the error group status register
>> +      window (ERRGSR).  fault-inject is the fault injection register window
>> +      (ERXPFG*).  irq-config is the interrupt routing configuration window.
>> +    minItems: 1
>> +    maxItems: 3
>> +    items:
>> +      enum:
>> +        - err-group
>> +        - fault-inject
>> +        - irq-config
> 
> reg and reg-names must be the same number of entries.

Ack, will fix this in v3.

> 
>> +
>> +  interrupts:
>> +    description:
>> +      Interrupts signalled by this error source.  The first interrupt is the
>> +      Fault Handling Interrupt (FHI), fired when a corrected error counter
>> +      overflows or a deferred error is detected.  The optional second
>> +      interrupt is the Error Recovery Interrupt (ERI), fired when an
>> +      uncorrected recoverable error is detected.
>> +    minItems: 1
>> +    maxItems: 2
> 
> Replace description with:
> 
> minItems: 1
> items:
>   - description:
>       Fault Handling Interrupt (FHI), fired when a corrected error 
>       counter overflows or a deferred error is detected.
>   - description: 
>       Error Recovery Interrupt (ERI), fired when an uncorrected 
>       recoverable error is detected.
> 

Ack, will fix it as suggested.

> 
> Seems backwards to me that corrected errors is required and uncorrected 
> errors is optional. Should be fine to not care about corrected errors, 
> but uncorrected errors can't really be ignored.

FHI is the common interrupt mechanism used by RAS error sources to
notify software of deferred errors (which are kind of un-correctable
errors) and corrected error counter overflows. This interrupt is also
fired on the event of an un-correctable error (UE). On occurrence of UE
error, this interrupt is fired, S/W reads the UE bit set in the ctrl
register and handles UE error accordingly.

ERI provides an additional notification mechanism for "recoverable"
uncorrected errors, but its presence is implementation specific and not
all error sources expose a dedicated ERI signal.

For this reason the binding currently treats FHI as the mandatory
interrupt and ERI as an optional second interrupt. I'll clarify this
rationale in the binding description in the next revision.

> 
>> +
>> +  interrupt-names:
>> +    description:
>> +      Names identifying the interrupts.  "fhi" is the Fault Handling
>> +      Interrupt; "eri" is the optional Error Recovery Interrupt.
>> +    minItems: 1
>> +    maxItems: 2
>> +    items:
>> +      enum:
>> +        - fhi
>> +        - eri
> 
> Define the order.

Ack, will replace with explicit ordered constants.

> 
>> +
>> +  arm,group-format:
>> +    description:
>> +      Page granularity of the memory-mapped error record group register
>> +      window.  Determines the ioremap size and the number of error group
>> +      status registers (ERRGSR) available.  Required when reg is present.
> 
> Don't state constraints which are expressed as schemas.

Ack, Will remove "Required when reg is present." from the description in
v3.

> 
>> +      Use the ARM_RAS_GROUP_* constants from <dt-bindings/arm/arm-ras.h>.
>> +      0 (ARM_RAS_GROUP_4K) is a 4 KiB window with 1 ERRGSR supporting up
>> +      to 64 records.  1 (ARM_RAS_GROUP_16K) is 16 KiB with 4 ERRGSRs and
>> +      up to 256 records.  2 (ARM_RAS_GROUP_64K) is 64 KiB with 14 ERRGSRs
>> +      and up to 896 records.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [0, 1, 2]
>> +
>> +  arm,num-records:
>> +    description:
>> +      Total number of error records in this error source, including both
>> +      implemented and unimplemented slots.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 1
>> +
>> +  arm,record-impl:
>> +    description:
>> +      Bitmap of implemented error records.  Bit N set to 1 means error
>> +      record N is present and active in this error source.  Bit N set to 0
>> +      means record N is not implemented and must be skipped.  The array
>> +      length must equal the number of ERRGSRs implied by arm,group-format
>> +      (1 element for 4K, 4 for 16K, 14 for 64K).  For system-register
>> +      nodes (no reg property) a single u64 element is used.
>> +    $ref: /schemas/types.yaml#/definitions/uint64-array
>> +    minItems: 1
>> +    maxItems: 14
>> +
>> +  arm,status-reporting:
>> +    description:
>> +      Bitmap indicating which implemented error records must be polled
>> +      directly by the OS.  Bit N set to 1 means record N does not report
>> +      through the ERRGSR and must be polled by reading its ERX_STATUS
>> +      register directly in the interrupt handler.  Bit N set to 0 means
>> +      record N reports its status through the ERRGSR and will be discovered
>> +      via the ERRGSR scan path.  For system-register nodes (no reg property)
>> +      there is no ERRGSR, so every implemented record must be polled
>> +      directly; arm,status-reporting must equal arm,record-impl for all
>> +      system-register nodes.  Array length as for arm,record-impl.
>> +    $ref: /schemas/types.yaml#/definitions/uint64-array
>> +    minItems: 1
>> +    maxItems: 14
>> +
>> +  arm,addressing-mode:
>> +    description:
>> +      Bitmap indicating the type of address reported in the error address
>> +      register (ERX_ADDR) for each error record.  Bit N set to 0 means
>> +      record N reports a System Physical Address (SPA) that the OS can use
>> +      directly.  Bit N set to 1 means record N reports a node-specific
>> +      Logical Address (LA) that requires platform-specific translation to
>> +      obtain a SPA.  Array length as for arm,record-impl.
>> +    $ref: /schemas/types.yaml#/definitions/uint64-array
>> +    minItems: 1
>> +    maxItems: 14
>> +
>> +  # Processor error source properties (arm,ras-processor only)
>> +
>> +  cache:
>> +    description:
>> +      Phandle to the cache node (L1, L2, or L3) that this processor error
>> +      source monitors.  The referenced node must have compatible = "cache"
>> +      and a cache-level property identifying the level in the hierarchy.
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +  # SMMU error source properties (arm,ras-smmu only)
>> +
>> +  iommus:
>> +    description:
>> +      Phandle to the SMMU node that this error source monitors.
> 
> If the iommu has #iommu-cells >0, then this property must match the cell 
> size. You can't have your own definition of 'iommus'.

Ack, The driver only calls of_parse_phandle() on it for identification
and never uses the IOMMU framework. Will replace iommus with a dedicated
arm,smmu-ref phandle property, analogous to arm,gic-ref, in v3.

> 
>> +    maxItems: 1
>> +
>> +  # GIC error source properties (arm,ras-gic only)
>> +
>> +  arm,gic-ref:
>> +    description:
>> +      Phandle to the GIC node that this error source monitors.
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +required:
>> +  - compatible
>> +  - arm,num-records
>> +  - arm,record-impl
>> +  - arm,status-reporting
>> +
>> +allOf:
>> +  - if:
>> +      required:
>> +        - reg
>> +    then:
>> +      required:
>> +        - arm,group-format
> 
> Better expressed as:
> 
> dependentRequired:
>   reg: [ 'arm,group-format' ]
> 

Ack, will fix this in v3

> Rob

Best Regards,
Umang


