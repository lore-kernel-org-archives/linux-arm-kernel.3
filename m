Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7C9C531CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 13:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AAJ92+dVKkhStldqu20Psdf6IGjmApe60MPX/QGCFWI=; b=MFnw+m32AgluoJ/VwbLJYVPmL6
	apxcahanZU/3g2UzIbskZB9Yxh0ZHdpKOvTsqzy1Sjal4w3SA3J5jBhMQVgHD0+LkwgLdqfdWBjjK
	+zUpyRBVma1KjIw3RR3QFL4brI4UFiykfB37RstRi3q1akNtnv/SuWmMvbHnE9oeFWtGoYqCxduYF
	rD5BL8dn/Lm1JzKg69YBZ8FrG6bECAa8KbCCOv7gwAn+sF96Q7xGqzE8aiwZjYEji1eqewM59j4Z/
	nGFNdi7Fhfh+blE2N/6v3nnIC8MCc6NflONBCN14oob2xu23kmaZ4GDxk2TIBMX5HArObIIKzG7pO
	hAhW/WdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtYL-0000000EOE4-1Yf9;
	Thu, 23 Jul 2026 13:33:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtYI-0000000EODS-3bUs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 13:33:32 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCw4RS3605752
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 13:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AAJ92+dVKkhStldqu20Psdf6IGjmApe60MPX/QGCFWI=; b=d5itg1F0Kk0mU1DI
	fimuZV/3TiUVVzE8yLSvIflcj1ApAf2/HjRwb7DE9KCmAND+kTWLsTmaE1tMl4Q2
	NZbjavDKoY3MQaNgufXBodHRUpggkEEVDXCTtYAoGY1+4MC+hSGfkiuFEf/438I5
	+J471LtDsPK/R+svfiWFa13EYwD3nFw+/P1iyCuIpBFgSptn9UBlyGeOFZFbMrK3
	BXikjjCnAB0eQDgE7eB8b6iAw/6DCAIlpavYu0qrj3AqwwvWk5xBdPnxIWlHXYDj
	qeFuxIKnk2wFpmY3bocGO7H0uFlVwSiQYr+voyuhZnPeJHTmLDXYSM14Z5hfn04i
	k6Jong==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuq9cq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 13:33:30 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7ebeeb51976so515542a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 06:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784813609; x=1785418409; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AAJ92+dVKkhStldqu20Psdf6IGjmApe60MPX/QGCFWI=;
        b=PflUcJk34hSG/gHaJhhBkgozNBEtpdu+O/+SLeIv3IHEaor8BHJ7wzUWpITWYucZXo
         iRBEu/yjBUjxS5KmtFWWnBTSxSVfkUaXVw2bNF0nOiMgrR6tjlgQJS/GpU5c7d0m1You
         OfZ//qs73A+vFBniJVb5GbUEn1osNgdKxkyEpw05nT3WlzbTGWCDxkD7fCvT59a81WhS
         ehX+YzBOqk9Ij0yuVhzUQmC2TNvaT8YcwtWRXwRuOQ4gP7L206Ogc6tK+qWkP9A/6E2z
         EpU02qkMQzBO8WtOQ4OwSMMmUS+Oh6PQYUNi10HX0y84mLWyH5cs7dxiDk6AkFcy+rqp
         H96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784813609; x=1785418409;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AAJ92+dVKkhStldqu20Psdf6IGjmApe60MPX/QGCFWI=;
        b=lK9x+K+2sNqFvooqKJI8KhT7+upM7RndeHj9wTSBPdTQn+bXUng09agGx1Kfc2j0el
         q19230Dyj1jZJtGQFD3MORtefAe5TYCGHOcJmLkzZijznmaRbsgDGGOpVyUE80vFItxv
         xODPy8t4iMlk2C8lrVO8qlwOVewG5j4TpiBfhQa3j5YwQNI7qaSDqMM8b/AaRFLFwB4e
         lBcbYs5VgOm7utIV4ueLuAKNWLpCrbNsjws8J6r9Kca6LuGBNxcuS6OPS1eE1WhCWvAD
         RIyUsWDiaBCLaf4emC2FarttDYV0NiJ6vo6jqOnDB/IauQVUBhY/VZm320ROOaLIhPl/
         Tc7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrj63jpLJ1mTdnH2L7lnmgMSrfQh59y4isO+l1Harqz07ONJc1ZDguGaOC1tgl/Gg8a7nUw43a34XMfYaDnBXWo@lists.infradead.org
X-Gm-Message-State: AOJu0YzXoduKErjfPQfqqa/d12NEWEu/l/kdcDe1qrw0OaKrnNHUDnui
	ikURv9BkrEM9w7xWEMULaYzx8x+KwSWruQOyojT8ZUEfxvI+8zS0r4ukU1x9CPQYAyPAB4lysB/
	eB59GpuhoTXjuGYe3v4+LFc6s8MzEtAgutmU0duK1v0fsITHWE093ecFr5N3kQf+oi+qGC1o6yf
	bRBg==
X-Gm-Gg: AR+sD12rvwNo/CvH0Z84Ky3j+t0FNR2gOV8DZbOtFLk64Rko144N9y4rX0yj1/DCWbP
	Shi/p2zwVkuWEXqiTzhKmvv6aVvQZKoZO19ofSnRhznH7SXz+q/9qKutWuG+OtC8t2fRcZNLNoY
	h460FWhZZoublb3PC9/S+ePV3UYsVRu5rZzFx3pQAweiDNrXH8ZHoEnsVRPu7CfN+bffpc4ACFV
	lmAbkUQr0iNI0os5pmhDSMXghGP4o7raslg63OfovVog1wIcYch7Dkvxgv3HgKJNYoka3CqquLY
	57JzjJvR+94S0QrtAvOi5NUAiQjWNbnACGURqgps86tuNm899nInaftD2r4p5mN8/gxA3r/tchx
	7XGhBeew9gfKSrqbrUOwHo+U9eYBJRPBScrA=
X-Received: by 2002:a9d:7d8c:0:b0:7e9:dd46:b9f8 with SMTP id 46e09a7af769-7ee471926ebmr889169a34.15.1784813606309;
        Thu, 23 Jul 2026 06:33:26 -0700 (PDT)
X-Received: by 2002:a9d:7d8c:0:b0:7e9:dd46:b9f8 with SMTP id 46e09a7af769-7ee471926ebmr889159a34.15.1784813605732;
        Thu, 23 Jul 2026 06:33:25 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ee2a0b3803sm3569083a34.21.2026.07.23.06.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:33:25 -0700 (PDT)
Message-ID: <0ee2667f-db43-4e5a-9b4d-2c2404d4ae5b@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:03:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 06/13] dt-bindings: arm: Document reboot mode magic
To: Rob Herring <robh@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-6-e7453c548c21@oss.qualcomm.com>
 <20260722171108.GA1097879-robh@kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260722171108.GA1097879-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEzMyBTYWx0ZWRfXwX+IR32MgZe1
 MbMKbktbYwNx80u5NtU074V2R30jkONNBDTFm2N/uoyJZCU6d44v/dG5gUq+hLOwPIx9puHYzqR
 X1SJxMW7cUQDAlTaQ9Dvj/fI/f2W8Tc=
X-Proofpoint-ORIG-GUID: D_9B4sHpB5rp8V1l-E5SefLQmPzSYLOp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEzMyBTYWx0ZWRfX9cR3ab7/NnE2
 kji6moPeZX3bscmiaZi2rEpejvlhHRGRKnF+RYslc9MUsE9C8aE2n/agaRA44mgQpvKfwrpdPYD
 adjeVMSJd+h5cDAgA8fZXD13c0S35vjE0Bvbgj886UgL3MWnI/Mvi259h6R3Oq4wxgG4eJAoDU8
 Mrpag8nM73g/PMXPARgp5JQAPqHsrhKHpMjN0mNfSj9hyhtvJoByhzg+Y+hrtYGX8p5M+5BBa4S
 bqwk1hevNK0k9RLrAdp+V7lj8588LXGB4QA8anN9HUF7rJMWcPSPfQ3Ftpg3/cHmwPDuzFrKlKB
 XhIsqp7fQ3SNbvL0qRcM/hjiaeEaGAEke8OJHiS0tC87E9mmVhOS34vAgaDfcwUfNEV+xxd5sFb
 0WiZUDZhnaaCneHIFUpTv0QJvtdffRCpEYEz4Oz7PYMcV+UXZGOtyBsu1GeVPMktyxoCi6NbQ4x
 fGRiSqqmdkLq3IMur8A==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a62182a cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=PV7ZYYKFBiq-RxTmBQMA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: D_9B4sHpB5rp8V1l-E5SefLQmPzSYLOp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_063330_912402_41366524 
X-CRM114-Status: GOOD (  19.47  )
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



On 22-07-2026 22:41, Rob Herring wrote:
> On Tue, Jul 14, 2026 at 10:46:34PM +0530, Shivendra Pratap wrote:
>> Add bindings to describe vendor-specific reboot modes. Values here
>> correspond to valid parameters to vendor-specific reset types in PSCI
>> SYSTEM_RESET2 call.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/psci.yaml | 54 +++++++++++++++++++++++++
>>   1 file changed, 54 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
>> index 6e2e0c551841..11b90e8affb3 100644
>> --- a/Documentation/devicetree/bindings/arm/psci.yaml
>> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
>> @@ -98,6 +98,37 @@ properties:
>>         [1] Kernel documentation - ARM idle states bindings
>>           Documentation/devicetree/bindings/cpu/idle-states.yaml
>>   
>> +  reboot-mode:
>> +    type: object
>> +    $ref: /schemas/power/reset/reboot-mode.yaml#
>> +    additionalProperties: false
>> +    properties:
>> +      # "mode-normal" is just SYSTEM_RESET
>> +      mode-normal: false
>> +    patternProperties:
>> +      "^mode-.*$":
> 
> Since your example violates naming rules:
> 
> "^mode-[a-z0-9]+$"
> 
>> +        minItems: 1
>> +        maxItems: 3
>> +        items:
>> +          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
>> +            minimum: 0x80000000
>> +          - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
>> +          - description: arg3 (cookie_lo in 3-cell form)
>> +        description: |
>> +          Describes a PSCI SYSTEM_RESET2 vendor-specific reset type. The string
>> +          after "mode-" maps a reboot mode to a vendor-specific reset.
>> +          A vendor-specific reset takes two arguments, a 32-bit reset_type and a
>> +          64-bit cookie. The arguments are encoded as up to three 32-bit cells.
>> +          Each mode property is encoded as mode-xxx = <arg1[, arg2[, arg3]]>,
>> +          where:
>> +          - arg1 is reset_type and must be >= 0x80000000.
>> +          - In 2-cell form, arg2 is lower 32 bits of cookie.
>> +          - In 3-cell form, arg2 is high 32 bits of cookie
>> +            and arg3 is low 32 bits of cookie.
>> +
>> +          All values should be provided as per the PSCI SYSTEM_RESET2
>> +          specification.
>> +
>>   patternProperties:
>>     "^power-domain-":
>>       $ref: /schemas/power/power-domain.yaml#
>> @@ -137,6 +168,15 @@ allOf:
>>         required:
>>           - cpu_off
>>           - cpu_on
>> +  - if:
>> +      not:
>> +        properties:
>> +          compatible:
>> +            contains:
>> +              const: arm,psci-1.0
>> +    then:
>> +      properties:
>> +        reboot-mode: false
>>   
>>   additionalProperties: false
>>   
>> @@ -260,4 +300,18 @@ examples:
>>           domain-idle-states = <&cluster_ret>, <&cluster_pwrdn>;
>>         };
>>       };
>> +
>> +  - |+
>> +
>> +    // Case 5: SYSTEM_RESET2 vendor resets
>> +    psci {
>> +      compatible = "arm,psci-1.0";
>> +      method = "smc";
>> +
>> +      reboot-mode {
>> +        mode-edl = <0x80000000 0x00000001>;
>> +        mode-bootloader = <0x80010001 0x00000002>;
>> +        mode-needscookie_64 = <0x80000000 0x00000001 0x00000002>;
> 
> Don't use '_' in property names. This is a W=2 warning.

sure thanks. Will fix this.

thanks,
Shivendra

