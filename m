Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440D8C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 10:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTzXRhSzRtnjRJ4J4oJH2ZZtAAGHA+EWF3AV+MLmAcI=; b=q0zEzEesn2YYSYl+uUDAvZNTYJ
	PDmO5w/HA8On/8otgU6n0Vjv0F4f1pBBOax79R7Jk9kQxr5jabEMPKW8+OgbNA22I21CQHt+z2UtC
	VgLMbJErV3BLV+FfKE/jX84TCcMUV4r6RWLMhQyDwqUBhaqFN8aKsKMYAPdwcfVLYelCBId+4xSn0
	dCRef6zwBZqltME5gF3B/XwOTg4js6kQAkb7NqFIDBRxs1rysqafWpijq5UbKXPJtsFd5EK+iDImO
	DuJPNqELvapdSDopRA7b4eUGEhqkuKcvGdCQvQwpTKXGus+RFREbmstiR3O5W+COGY2Be4NyN+6EN
	QiaS4bng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24bn-0000000H58n-3Fvd;
	Thu, 03 Sep 2026 10:23:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24bk-0000000H57Q-3F89
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 10:23:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHKBf055418
	for <linux-arm-kernel@lists.infradead.org>; Thu, 3 Sep 2026 10:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OTzXRhSzRtnjRJ4J4oJH2ZZtAAGHA+EWF3AV+MLmAcI=; b=c3Z8L62KoHJrgPYP
	zXIrSHaSVau5D+wB2EZIqPDnNsoSj4Q59pm0A0bu3JnogaGg7QgJ39cIW4FI9+p0
	JaiywSkL/KpVde6wwafCkYEePWC2i4zz8Ll6uumPVQXe+am+8x5V2yy65Fgf8xfi
	SZw17v0RNhkWfds/HLLUyrUmXCgaWEGi+ORcjsqE6gh0JutYpFZyLOLNaaRXjNd6
	YP071Duv1AJWsrnMid0sSBdE7ztIK1vwim3yEkcxJBfhBA8Dqy2VrJyTY3N2gIuV
	rj1AmKadvbD4RAM2AK8HXxfQANEBL5kd+zvgLLvjS19BhPDde/BWkW55VCV/coVt
	FuTBFw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdveds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 10:23:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d8fd7c8c67so3819575ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 03:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788431026; x=1789035826; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OTzXRhSzRtnjRJ4J4oJH2ZZtAAGHA+EWF3AV+MLmAcI=;
        b=WzJgILObXa2ojNMQxFYd05iLBN1hll3iwhQxBDQrfek1ITgsTcA2MOmJknmO7IEXSi
         DOd/gujaJ+tGbo8ZEkXB75mGG/uJa87Gt1KF1eW00e50FA6zpBDwd7ThfE1G93y67gxO
         u1uNT5RDNMHV67m75QTeajEOJhpJZW8Vqy2kZGuEqQhO/r+2B5X04Od2WGnrvPOThzGr
         75RqUdpj+EUc3v7MR3Xf7CDg4x6Xpkys4Nxw3yXaRPmoZDkI8pdCUqxNnvz+qgkF/ObS
         QSfcLBmgPBA5iZgDsU7236J5AvRWj/ong2VaU1LZLE3hyztz8yzCWitH7YKlJKWZBkQZ
         fUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788431026; x=1789035826;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTzXRhSzRtnjRJ4J4oJH2ZZtAAGHA+EWF3AV+MLmAcI=;
        b=Cne+w7Ws2D68g5xhDQ0FRsbWqmBDg7HsyQXSlRVdWdYhFjQ7XUpHoUf+4+XFWW9DPE
         hL/1j4FnoZaTo3dC/gGIRmOg8bjPqCgPQ6YjygZV3sFH2YJQsmLQdGT3Bl/Dx9Zocopc
         tSAveDRpfgii7UsF6R9eiULLOAopURVpysZbpWeE7kZjzwhO1cn3BLg6wWvhUY2ZnA/L
         O/x+DZ+Z0X3PrnI0uE5cMfVMaC4HCQ4eRwBbP6VRPLiTiyyfydrWvRcNG4mnY6wiqIyB
         S5dyR/WKdx659TwHRrYu+QxfD4OcaFkvMtOMYI1znaFkbpIh9ZpL0eT9/FSumgEHZiAX
         T1uw==
X-Forwarded-Encrypted: i=1; AKwUvBz6uEw3JU2rurGmtH8khHPQ8dSaQauIDfOAIbQ01UxWnA3h0S/nrRLej/gsxB7SZArmtDDHghGlyfhQEEqFWR3D@lists.infradead.org
X-Gm-Message-State: AFuF++lKYyyqYlMvP1gFp4t62i5j2a1lya6S6wP3hxHgAObzNoGimcqp
	G9pWU0AteWtySMA/5TjufsLU3i/aKjirVQ5gD8o3Dbmjk4bANz2IpU5DMm9XcBEg7jxCuq0sCOL
	j3LyiRlo3FTsrHltLOyTastX19vg9IIGW0mz5bv3qOjWhy9LQbQqmjYO4cvQp5TNbERZLpcUCRY
	7niy8Zr2BTbw==
X-Gm-Gg: AYBFou1+IAYUnO7ptKci28RSPMQ5KXJ6ioMM+97SkPvHeg79qbbj8InFVrPhm8Mb0ha
	8eweZdnqVu+bqBAbEAVVI5U9e8IUYegh23ozF7YtRt0fGgh9CupwI6DQ0Imk1xd8B61dtI6dbyR
	m6x3h2wmcc7jo+bo7xFfKDFy6BcUEilG1LVVUfDrLfyA3G0F6szeO+t7T4AS777jZia5rZzLe7u
	22PLmNuhPcmS8W4qku73mu+hsmWcEg7kM4XMjoCCC7GFxpa9oCHL+PA1SiSojyCA8U6ZlxXW3n/
	KvKgZu9DBwR9s4FO0syDe9gLOZiYjL7L5QRq5GIO1LfTSQmwE0v4nMm5mTcGlCXeW6XDxJedN/P
	DVTncWRTWLRPddWoV5ZVhiHC64f8DAA==
X-Received: by 2002:a17:90b:4b8b:b0:38e:76f8:fcbb with SMTP id 98e67ed59e1d1-39aee1c6d08mr10332164a91.4.1788431025586;
        Thu, 03 Sep 2026 03:23:45 -0700 (PDT)
X-Received: by 2002:a17:90b:4b8b:b0:38e:76f8:fcbb with SMTP id 98e67ed59e1d1-39aee1c6d08mr10332093a91.4.1788431024756;
        Thu, 03 Sep 2026 03:23:44 -0700 (PDT)
Received: from [10.219.30.245] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325592ebb3sm5588824eec.14.2026.09.03.03.23.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 03:23:44 -0700 (PDT)
Message-ID: <d03f0298-967c-4fe0-86c4-a27641701697@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 15:53:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: ras: Introduce bindings for ARM
 RAS error sources
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
 <20260728-fervent-optimal-auk-7850ae@quoll>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <20260728-fervent-optimal-auk-7850ae@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a994ab2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=P-IC7800AAAA:8 a=gEfo2CItAAAA:8 a=UXIAUNObAAAA:8 a=EUspDBNiAAAA:8
 a=8vMulZHAkAiH2yylmEoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=d3PnA9EDa4IxuAV0gXij:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=a1s67YnXd6TbAZZNj1wK:22
X-Proofpoint-GUID: THuvG8ViWJXtLnFQFNA8O1htjZA2e3HJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4OSBTYWx0ZWRfX7yp9K05dHtuU
 suF9s8bgl7JnrxUrk6D3JqImmqzEH80L/gHocZ4MZ5/ziWrDXhQmUSdEVRY3Z6PbBLNJi8oHkce
 7c4O9Sp1o41+oAAA6mXnVMgVPVKUZbN4lt//6BxmpAEO91hcFpR7RkcbC90qB9H+kWjsvEBNv2L
 EH7VGpPUTTPBp9hY9u00WUvPklSM0L2fBGF7+g0Vk5xrL1XSKdn5tlCk9/wsSaH2s71Z3qZv3DQ
 8XxbefkYrMx/lUiYV69k0NFyx1Hi3EKvN5bB46vJaL0wmLnqiSSjCIutA3MlqsJuMsjIUqtc0u1
 ljoYIKMBDT74gbq1nm7JeUmtemjjHBlgWLG0zXZohbk9giXIx2nCxO3jYrQIv5sSNGVq5MJ+dqt
 1Bk4s9WhFdxGPHhU++cuYd4QzvPArFDiz+7AoZPModWivOb/c8ZIF9+qNUaBrGnsFIT09Wf8Cs0
 avBma3z+3q+lyZ5KsKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4OSBTYWx0ZWRfXxcF0M8eQCTlb
 wqzDl6LqIHPo4gw10xnqsccWs2fnOcIQk5GCG+NAjZ8LdgLd6i2qsRP2JZhQwp6pTchMvxt1fE+
 2NDv8KJw42utJXPeH3JIyTJf+9HIshg=
X-Proofpoint-ORIG-GUID: THuvG8ViWJXtLnFQFNA8O1htjZA2e3HJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_032349_393509_899A4BF7 
X-CRM114-Status: GOOD (  27.43  )
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

Hi Krzysztof,


On 7/28/2026 2:23 PM, Krzysztof Kozlowski wrote:
> On Mon, Jul 20, 2026 at 01:49:51PM +0530, Umang Chheda wrote:
>> ARMv8 and later processors implement the RAS (Reliability,
>> Availability and Serviceability) extensions, exposing hardware
>> error records through a standardised register interface.
>>
>> Add Device Tree bindings to describe RAS error sources.
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> 
> A nit, subject: drop second/last, redundant "bindings for". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

Ack, will fix the subject text in v3.

> 
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
> 
> Filename should resemble compatible, so "arm,ras.yaml"

Ack, will change the filename as suggested in v3.

> 
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
>> +
>> +  arm,group-format:
>> +    description:
>> +      Page granularity of the memory-mapped error record group register
>> +      window.  Determines the ioremap size and the number of error group
>> +      status registers (ERRGSR) available.  Required when reg is present.
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
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: arm,ras-processor
>> +    then:
>> +      required:
>> +        - cache
>> +      properties:
>> +        cache: {}
>> +    else:
>> +      properties:
>> +        cache: false
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: arm,ras-smmu
>> +    then:
>> +      required:
>> +        - iommus
>> +      properties:
>> +        iommus: {}
> 
> 
> What is with this syntax. There is no such style, drop.

Ack

> 
> 
>> +    else:
>> +      properties:
>> +        iommus: false
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: arm,ras-gic
>> +    then:
>> +      required:
>> +        - arm,gic-ref
>> +      properties:
>> +        arm,gic-ref: {}
> 
> Drop. This is not an object, but phandle.

Ack

> 
>> +    else:
>> +      properties:
>> +        arm,gic-ref: false
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/arm/arm-ras.h>
>> +
>> +    / {
>> +        compatible = "qcom,sa8775p-ride", "qcom,sa8775p";
>> +        model = "Qualcomm Technologies, Inc. SA8775P RAS example";
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +        interrupt-parent = <&intc>;
> 
> Drop, irrelevant.

Ack

> 
>> +
>> +        intc: interrupt-controller@17100000 {
>> +            compatible = "arm,gic-v3";
>> +            reg = <0x0 0x17100000 0x0 0x10000>,
>> +                  <0x0 0x17180000 0x0 0x100000>;
>> +            interrupt-controller;
>> +            #interrupt-cells = <3>;
>> +            #address-cells = <2>;
>> +            #size-cells = <2>;
>> +        };
>> +
>> +        cpus {
>> +            #address-cells = <2>;
>> +            #size-cells = <0>;
>> +
>> +            cpu0: cpu@0 {
>> +                device_type = "cpu";
>> +                compatible = "arm,armv8";
>> +                reg = <0x0 0x0>;
>> +                next-level-cache = <&l2_0>;
>> +
>> +                l2_0: l2-cache {
>> +                    compatible = "cache";
>> +                    cache-level = <2>;
>> +                    cache-unified;
>> +                    next-level-cache = <&l3_0>;
>> +
>> +                    l3_0: l3-cache {
>> +                        compatible = "cache";
>> +                        cache-level = <3>;
>> +                        cache-unified;
>> +                    };
>> +                };
>> +            };
>> +        };
> 
> Drop all the nodes above, irrelevant.

Ack

> 
>> +
>> +        /*
>> +         * Per-PE L1/L2 cache RAS error source.  System-register access,
>> +         * per-CPU PPI.  Record 0 is implemented (arm,record-impl bit 0
>> +         * set).  arm,status-reporting equals arm,record-impl because
>> +         * system-register nodes have no ERRGSR; record 0 must be polled.
>> +         */
>> +        ras-l1l2-0 {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> If you cannot find a name matching your device, please check in kernel
> sources for similar cases or you can grow the spec (via pull request to
> DT spec repo).
> 
> Choose some generic name, but l1l2 does not sound like one.

Ack, will add some generic node name as suggested.


> 
>> +            compatible = "arm,ras-processor";
>> +            arm,num-records = <1>;
>> +            arm,record-impl = /bits/ 64 <0x1>;
>> +            arm,status-reporting = /bits/ 64 <0x1>;
>> +            cache = <&l2_0>;
>> +            interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_HIGH>;
>> +            interrupt-names = "fhi";
> 
> I had impression we agreed all this is part of actual CPU/GIC/cache node
> or its subnode.
> 
> Keeping it separate does not feel right, if cache is the source of error reporting.

Thanks for the discussion Krzysztof !

As discussed, I'll retain the same node representation in v3. The
rationale is that the interrupt lines and address space associated with
the error nodes are independent of the parent monitored IP.
Additionally, the ARM PMU provides a similar precedent: like RAS, it is
represented as a separate entity in the Device Tree despite being
associated with a monitored component.

> 
>> +        };
>> +
>> +        ras-l3-cluster0 {
>> +            compatible = "arm,ras-processor";
>> +            arm,num-records = <2>;
>> +            arm,record-impl = /bits/ 64 <0x2>;
>> +            arm,status-reporting = /bits/ 64 <0x2>;
>> +            cache = <&l3_0>;
>> +            interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
>> +            interrupt-names = "fhi";
>> +        };
>> +    };
>> +
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/arm/arm-ras.h>
>> +
>> +    / {
>> +        compatible = "qcom,sa8775p-ride", "qcom,sa8775p";
>> +        model = "Qualcomm Technologies, Inc. SA8775P RAS example";
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +        interrupt-parent = <&gic>;
>> +
>> +        /*
>> +         * GICv3 interrupt controller with RAS support.
>> +         */
>> +        gic: interrupt-controller@17b00000 {
>> +            compatible = "arm,gic-v3";
>> +            reg = <0x0 0x17b00000 0x0 0x10000>,
>> +                  <0x0 0x17b60000 0x0 0x100000>;
>> +            interrupt-controller;
>> +            #interrupt-cells = <3>;
>> +        };
>> +
>> +        ras-gic-dist@17a00000 {
>> +            compatible = "arm,ras-gic";
>> +            reg = <0x0 0x17a00000 0x0 0x10000>;
>> +            reg-names = "err-group";
>> +            arm,group-format = <ARM_RAS_GROUP_4K>;
>> +            arm,num-records = <1>;
>> +            arm,record-impl = /bits/ 64 <0x1>;
>> +            arm,status-reporting = /bits/ 64 <0x0>;
>> +            arm,gic-ref = <&gic>;
>> +            interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
>> +            interrupt-names = "fhi";
>> +        };
>> +    };
>> diff --git a/include/dt-bindings/arm/arm-ras.h b/include/dt-bindings/arm/arm-ras.h
>> new file mode 100644
>> index 000000000000..c2f4e1f8243e
>> --- /dev/null
>> +++ b/include/dt-bindings/arm/arm-ras.h
> 
> Filename must match binding or compatible.
> 
>> @@ -0,0 +1,11 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +
>> +#ifndef _DT_BINDINGS_ARM_RAS_H
>> +#define _DT_BINDINGS_ARM_RAS_H
> 
> Best regards,
> Krzysztof
> 

Thanks,
Umang



