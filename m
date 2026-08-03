Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85071C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdObhLmEiO4/ihNrGJ7V+rN3FSXGswWQoclVhlDfKmQ=; b=Zs/SV/KcNfAnhyQ7o6Nuob/oRe
	LjJefOIwcO99oAQpRk43UvuTjIVN7ErTzCqwXH6NszAmQg+q6iyMPNi2REvKtgpwxM1h//v4I46Yg
	lGoq7P9lKmju6oyomZkqwCxFFnL2MLZELmHAp+yx1a547OCxSSmicebCEQj8IniynDmoTkj0uZ0kq
	Zx/MnGc2whF21jNPAIYdJZLxqKhFhkCYpe40ETjcBAA+MUzJoSurKlW8b0PQDLvV6c1phzPpsTcSS
	giVvKB7ESN2YbKXZ+qtzn7FVQKCrWQ6Aq5LdJyfvRYRrsUry3x4bq3k8K3TdGU1D7CWH6la5WNn8u
	XYd33cig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtXu-0000000HNae-0nUr;
	Mon, 03 Aug 2026 14:21:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtXr-0000000HNa9-2Qy2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:21:36 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673ECE3u1150177
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Aug 2026 14:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PdObhLmEiO4/ihNrGJ7V+rN3FSXGswWQoclVhlDfKmQ=; b=ldsu9lv+B9cFgVQm
	CGZAe5mke5nONmvdusNdpnNtCCICcx+WU7F9n8DBFt4tT0lCDVrUhHsyTCAjVHD5
	GbDiALptzCutqbkSc1si8C89mrD7pdirGp3pmOd3INW3Ra6cSEgYbCVc0UjvRS78
	vBXnRwTG7P37/G1di34v1C3sHQS+VLz+3G8EIb0WMBo49pFaMjbDgc8H9Ji6nD96
	wpNvH/bPVkc86E5K8V21E+YzzxcTfpAo4NXuJL6ODj22eV6388cjHDbdCufCj2gq
	UY9SI4RjoH38k+VqZ5mZWz05nIMiM9ucbrph+10lhljx6QNK9XnJlO26dDn0KWP6
	Fn9ffQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrb9xy2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 14:21:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so2384227a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785766892; x=1786371692; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PdObhLmEiO4/ihNrGJ7V+rN3FSXGswWQoclVhlDfKmQ=;
        b=DNHk5k0vwHcBA3MNaEerXPZ9yeL/9reX0hOOsKVbO/fjEBBBAhPTMitgZc6JT/FCRk
         Aehn8mJHCxC9JFIjGeReZe867ASgZpN+FCUi+N+e1dIGu7ZIKaa5FtZq1dg9QpTpS+HS
         g7AgOdKXAGtwsQsqfou2P0pkBQ5VajZRDN3aeoqu7kyBdIR3uabUSDjISTvA5ltXl+JB
         0OQRdh4Euh1X1W89y7m6vzlbQFkwmGMtngXdGfb4G85U5uH1DH7oRaM/rcefSLai04eD
         purRcjDM9KGh8mnKoZOt64GzG7qKDIxrqcXPO+Evc5Mu9vO5QcZqDo8UkSa08VUnWt5D
         pA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766892; x=1786371692;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdObhLmEiO4/ihNrGJ7V+rN3FSXGswWQoclVhlDfKmQ=;
        b=h/hes9IEMN3dCWFEMajjtWBddFiGcDk3SabDgmcUNiMugay5auzzp3h56eu2lNKJRF
         y9WaunCdbaeI/frbuLmumBIp19OIwxJ1K0wDvdbkiFknT3PViOgio8SCBXkPd7CYnNV1
         NyQftmBZ/JsPWpjBRFIZHuBbwzHrhYPTMDkjMzFsjCQgTeVKoLnQMFXql00LiklA7fys
         hMDcTep0kTJJT3H5YCfuCzpByik1MA7YjYSNy41Fz9KOXI09rKDQ0G+vCB0BolhoszkT
         3//vn3CLlH4PFtQ4xqhJpqNzMqlgWhSEByE+kFQ1vAk+Sj6E/uxK8d3TMbuPvX+4zAOg
         wHiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrc/eRPiPkeecsUCERyNp2ZXjt3/9thZTkEOTsEJPf3UrxRjwj9u5u4CL3xxmdmBwG9M4O4c050spqOCZVXuKI/@lists.infradead.org
X-Gm-Message-State: AOJu0YxAugwcfKpPxZBvlGHchmIocq1PWFwW7GVgll85rQJteLS+EP9s
	KIWgSghY4DDV/VaipgAuAuLuSK98whzfGP+AUfxigV1r4Xkaq92Fe6whn//vZwdz+zaE2xJ5Ved
	yNWvb/Os5A1wSQcEoyLcIWHoba1FaY7iuCY0gE0KjWZwXEHSb3+q3m9p2F7ONK+0AdKjwoS8qbm
	4bmA==
X-Gm-Gg: AR+sD13ms8TY/9M2ZJiCMg/5DQS6jriH7yo9qDKA9tInC6r9xltF4DVjyzVTWO5SVGa
	Grki1f5Bd7QJ8lPLDmYIzUQJo0ouCy4M1RrcVsp24VbcEFVM2NlsZiWz5+eGXSrsrLYY9SVRgEK
	VvvIqQ26GsnCFbria2FkQhtWuEMI5CPULnQ/N6B2QyZkNugZ3fADNmEo+7xfWga8x4EtAhOVtxx
	cGPL0VBf+i5LUszDLH2jLijm8wsQ5faI34IzhwomYFDKe8I/8UGH5YZpDFWlNIFTvXLUixrqr8o
	1cu1yOV4dOAfkmrGBTl7pHQyZSGdNWMfxuJ5MgcI7Ojh8xMUN5zZdqHme/kWWtzVtI2FC1ukhWs
	9l35uUITmIhtaPGPmd2WGlU3EQ+KK9wzBYQ==
X-Received: by 2002:a05:6a21:468a:b0:3c4:1c9f:d91 with SMTP id adf61e73a8af0-3c92aa7d0cdmr11448446637.59.1785766891409;
        Mon, 03 Aug 2026 07:21:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:468a:b0:3c4:1c9f:d91 with SMTP id adf61e73a8af0-3c92aa7d0cdmr11448370637.59.1785766890901;
        Mon, 03 Aug 2026 07:21:30 -0700 (PDT)
Received: from [10.218.44.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04491dsm51441432eec.16.2026.08.03.07.21.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 07:21:30 -0700 (PDT)
Message-ID: <069a7ef3-7c01-4366-8643-11d791bd0d96@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 19:51:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 05/12] dt-bindings: arm: Document reboot mode magic
To: Rob Herring <robh@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-5-889281373870@oss.qualcomm.com>
 <20260803140222.GA3188037-robh@kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260803140222.GA3188037-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEyOSBTYWx0ZWRfXwCbMuQSUT5mK
 BYcHdlUZikH7cmWvGkZD/CY7/+3U0OzmeutVIeUOjkUs8AePKUlG6nTdclK67XJ0mmkP9MDXEI+
 AR5E5wA0nkmKytZPKQJe+4jmLPqDz1Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEyOSBTYWx0ZWRfX0K4A7Pr1kVmN
 MFldenQa5LHifwjd4TAmDBUPS0i21jDxwRYchJIYhZTsOz1iz4Imt2EZyZyevl058PdS4qLfoB7
 aeAx1ZZDhNdtCSTVbXbVS/6oxOA6wSeF3vSTBw0TNBu8t5Y4UNzor+m8x3Nhrays8Ng/rV71uQl
 AnMhxJqCLxOqVtx8cv2vZRB5mgdbvNiof45rV/cL1YwJDgolsC+fO0m20wMR9QYIGc8cJXfxzR7
 g2lmkUFKQD332vHflo0XuRb4bpDkEM3JwTIrJqrQbuZbnwyDbgYMuyeClJDz2byVUQWcn5QhcJb
 O8cBJmMjMf8aiFI5fecGINeHgO4QJ8kz4Oe7SNKiN5NWuyuRgD36wwXGiTAtlIeCm9tR2oOdEBc
 e/AEAb/HzS/bLb6CcV4S+wOa894qBkpQtBGDibG5cCn52x01xSmaYh1ki1gzKBS8y8FMk+Fv07X
 1xEk3YBi0+KcqCzvYQw==
X-Authority-Analysis: v=2.4 cv=RNSD2Yi+ c=1 sm=1 tr=0 ts=6a70a3ee cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=O-cBmbsoh36Jwjk5jm4A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: VSJqUhPFLf6YRfSLYIuEObaBSxgx1WT1
X-Proofpoint-ORIG-GUID: VSJqUhPFLf6YRfSLYIuEObaBSxgx1WT1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_072135_745145_AB72C8FA 
X-CRM114-Status: GOOD (  22.45  )
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



On 8/3/2026 7:32 PM, Rob Herring wrote:
> On Mon, Aug 03, 2026 at 03:13:36PM +0530, Shivendra Pratap wrote:
>> Add bindings to describe vendor-specific reboot modes. Values here
>> correspond to valid parameters to vendor-specific reset types in PSCI
>> SYSTEM_RESET2 call.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/psci.yaml | 58 +++++++++++++++++++++++++
>>   1 file changed, 58 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
>> index 6e2e0c551841..7d6a86690a2e 100644
>> --- a/Documentation/devicetree/bindings/arm/psci.yaml
>> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
>> @@ -98,6 +98,41 @@ properties:
>>         [1] Kernel documentation - ARM idle states bindings
>>           Documentation/devicetree/bindings/cpu/idle-states.yaml
>>   
>> +  reboot-mode:
>> +    type: object
>> +    $ref: /schemas/power/reset/reboot-mode.yaml#
>> +    unevaluatedProperties: false
>> +    properties:
>> +      # "mode-normal" is just SYSTEM_RESET
>> +      mode-normal: false
>> +    patternProperties:
>> +      "^mode-.*$":
>> +        minItems: 1
>> +        maxItems: 3
>> +        items:
>> +          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
>> +            allOf:
> 
> Don't need allOf here.

Ack.

> 
>> +              - $ref: /schemas/types.yaml#/definitions/uint32
>> +              - minimum: 0x80000000
>> +          - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +          - description: arg3 (cookie_lo in 3-cell form)
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +        description: |
>> +          Describes a PSCI SYSTEM_RESET2 vendor-specific reset type. The string
>> +          after "mode-" maps a reboot mode to a vendor-specific reset.
> 
> Blank line if this is a paragraph.

Ack.
> 
>> +          A vendor-specific reset takes two arguments, a 32-bit reset_type and a
>> +          64-bit cookie. The arguments are encoded as up to three 32-bit cells.
>> +          Each mode property is encoded as mode-xxx = <arg1[, arg2[, arg3]]>,
>> +          where:
> 
> blank line

Ack.
> 
>> +          - arg1 is reset_type and must be >= 0x80000000.
>> +          - In 2-cell form, arg2 is lower 32 bits of cookie.
>> +          - In 3-cell form, arg2 is high 32 bits of cookie
>> +            and arg3 is low 32 bits of cookie.
> 
> Indent the list by 2 more spaces.

Ack.
> 
>> +
>> +          All values should be provided as per the PSCI SYSTEM_RESET2
>> +          specification.
>> +
>>   patternProperties:
>>     "^power-domain-":
>>       $ref: /schemas/power/power-domain.yaml#
>> @@ -137,6 +172,15 @@ allOf:
>>         required:
>>           - cpu_off
>>           - cpu_on
>> +  - if:
>> +      not:
>> +        properties:
>> +          compatible:
>> +            contains:
>> +              const: arm,psci-1.0
> 
> SYSTEM_RESET2 was introduced in PSCI 1.1...

thanks. will update.

thanks,
Shivendra

