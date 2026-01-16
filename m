Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33F6D4A60E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 08:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M09NfFq7Qcp5En4G04EchSnWL0qU/hS/cGMF+zc9G4A=; b=neRFto9n68aiI/f2NCIQMORFRW
	oI1MkAZNph4NR+NhBrZBG/hkj+8Z8FZcaLmzKe6mN99ggXxvv0s6zm6tSXVQqrt9PLIMOWygSPNTp
	Qzpze5kPd3hA0wrJCaAgyr3GjcqsaoN/tZy7wN4qzlXbdpLRJteFg9Dray+6srVEAgtGxD3XbdUmt
	sopQjRRo5APndWw4DTGdxw4UfswGG7lm+bmSirK53fzOqCKD6FlsN/ysJAKBClX+4P0zR8EfNO1tU
	fxnuk/yABKJZW3TwF8ZYfdKeqOKdHFhG0GVnLmSsJ1JF4ruV8jz2n5kBcpTrijHuprw7Hs1WY9ext
	8f+joiiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfHs-0000000Dlco-03IO;
	Fri, 16 Jan 2026 08:34:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfHp-0000000DlcL-0UMT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 08:34:30 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G85JMd2615385
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 08:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M09NfFq7Qcp5En4G04EchSnWL0qU/hS/cGMF+zc9G4A=; b=hXabDyZ2TBeZlXXl
	jtP4nYTQsqMYMs0HOxPMXQKxc5YWG3YEVmVG0XPQea7fMtB48UK1BccRr6uiK936
	WhJEBKipMvfECaxR9Tdd/macY8/LIVjUpElvrjSm5ujg2shuoK62Wa0X+YHnxXuR
	NcNxAU7DBYhlCysvPpB3/q5/o7EvSzgrSWzWknJcmr60KeSQ6kPKPBpUKTz1tv3Q
	DhaTBsnI40+XXZfd0FwPcWMCYOJJjAcyET/5nWzrikGtF+QmwOoCCa4Fbm9M9C26
	lifaKVDY5VbPHvQqxxGkgaXMkrXtoDt7Fs9wrkaVT8fjNCn7AzeY8TrUYOiO5C/t
	WzMOYw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq977sf64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 08:34:27 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88888397482so48919096d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 00:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768552467; x=1769157267; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M09NfFq7Qcp5En4G04EchSnWL0qU/hS/cGMF+zc9G4A=;
        b=gjdPLZdeUsC5e4cbvQ+e1dedtXG9bhzz/SJw1EMurytPXaf9OtFfL8GKFDA4sntVmf
         3XO6GHXYQLS/G+hIQUp0w6KsKDiPYV7BDzsx8iDrI+1Cxs5tEQRFW19dmjFELNACI4/m
         86tGYo1kF8NpbdPKPQ6CINdejb6wPiujcSq2YpZQ1k1nbLuSgqfF4ItedLM5fwGOYfPS
         2vVwOD2i929KxF/6QK6z+VgipC6rrAxbXdNenkkX2ztltKa1cB9ShwHimP6W9wy0xOGI
         JQDOPXSExV6aOCGYCcO7ZBcBwsDIO08UgRUgvOI6aOAtvNiqDxpde1QgS/5swanmXGe2
         l9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768552467; x=1769157267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M09NfFq7Qcp5En4G04EchSnWL0qU/hS/cGMF+zc9G4A=;
        b=l2sr1Xm1U65aMCrvY5K1bv4t93ovf6/3Yrim9X7rO2rCD1GN3fK6qJL2+lW54tLusd
         CmKi1PGMgaRMttW8tptSkICnLYwRYjDAwLukyUA7PiHRzXJUjMpPe+KTuLL+irOJkLDk
         r9OIYevmKirx48UeIWEccxsnSBchCHJlDe1ZBkwvlefOlKZIT2Lq2kzBcrEHZsJyDfEZ
         LvBP7+yZxHNcghGQel1S/c8yIR5P3r/biXmNHj5GVluYFLluEwlWNg0rGlJszKbV0fKs
         b7qff9M+vyAw0akkpoFvEyXwga1Zd1XNfUd2OGF1KWYrybfqw3/XZfHrtHolIGhimwmq
         A1EA==
X-Forwarded-Encrypted: i=1; AJvYcCXHuVCMzMlBHkfbnQ6VymDs6zPNIWnDREbUSJJi+ubMWJnYp98vl3zc0WgDqBmfwNklVaY1Yh+NNkaaqQNRBFQI@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7pr5VtP8wK3725vmuLJrmloGOy0HXKBsYpPeRHyimf9S9Tsr3
	jx+x80P/wb/5WFbEpif3Xy4PEmrT8HUc8WdsYodyFscFqtaOGEkSS/pLZZ1cWddObXXeGG580b8
	avkDRWyivgTEoiDzxYd9lxd1ShgMeRNGXDn+V0y6LnP0UGFlnoQI7DeIYs9tNCxhJxFmvCPYNDC
	CjLg==
X-Gm-Gg: AY/fxX5Z3iW/7MDOJn/YQFCjm3jaaDKSZLCVkzjor28qEpoiu3WYp4Vtp9KwZ/XAPGo
	z1bjHspuLSlBrUQjSkyP9habP8kIJUWKuIrOwcdqldwG0prvERWgZgPaJqcGe5t+Fl6JL45ul2w
	4Aofj7boFP7xTd2ZbWlhlcsGGcxhApHy8y64kqCZQuY2NoPHPcyQC5P6xRo/8F+NCaM7GR1ZYmD
	qHybwjFeV3nD8fBPL/RKg1DwIbsOdjID7od7IdE/k97Q+FV+Bd99LYdAvClyuzm+H3zm8d6YQcd
	WtvJgdNO58BPxQ0dL089ERCiWkyfwvU323dTPZK0U2WF2edbAbryv9F63LY8YV6G0Xbl+KejElP
	1DOsiFfb9S/EdODJ4y9Vj8N0FDtJ+Iq1trs7K342ywddJWLZX7e/ca2VDCbThJLUNbcFGGl+uzg
	==
X-Received: by 2002:a05:6214:130e:b0:786:8f81:42f with SMTP id 6a1803df08f44-8942dd88ec0mr34295016d6.39.1768552467173;
        Fri, 16 Jan 2026 00:34:27 -0800 (PST)
X-Received: by 2002:a05:6214:130e:b0:786:8f81:42f with SMTP id 6a1803df08f44-8942dd88ec0mr34294616d6.39.1768552466704;
        Fri, 16 Jan 2026 00:34:26 -0800 (PST)
Received: from [10.111.171.115] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6040casm19565916d6.21.2026.01.16.00.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 00:34:25 -0800 (PST)
Message-ID: <025cefd3-888b-4744-bde3-2d5c007db66f@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 16:34:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
 <20260115-sm6150_evk-v3-2-81526dd15543@oss.qualcomm.com>
 <20260116-malachite-spaniel-of-refinement-af22ae@quoll>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260116-malachite-spaniel-of-refinement-af22ae@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fiPWTY4c22vGD1tc74CuxZvurwvsGQ2l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA2MSBTYWx0ZWRfXyrf/Qrb9nZy5
 IR8FZCk2Wt+0GbcBwbrycyq9mU62+b7rvLqmi5BH2X5xw050FUeAsxnvFJn89UqqKeMXjgzPyMQ
 6dk2LPxoy5A404xhT9kIs9Urqqzq27BTXE4HLrNFHmnCg+Ea9PXMsbt/tek6Rr4ugS3nLwmK8Dk
 UBuDyN4lCl838T3miNC02LtdQb+is9WIofVDLGFlUcpDTj4hHEhrc49U+5D7Dj3rOI/fZMou9MA
 c27Me1RogOTB1ai4A6j+nM+FcPJrtws9Nm1QpfQvjOgaP7+Rww6gPSLeTKbowJXedU6EQjDBNnX
 sqlQKYG0VUpMWMfGlDOvp+hTOTDAVxCJgiI3yJO8VV3hCs3fSFjBeD3+2fvzDMdrkiUKZPpLsEZ
 IWeEyioS5SQyj6GAbV2cliOedR5GYF9MUVrcn9d6SSxltaBD1U0HachU4C2PSIdSoxP0qYCvJot
 U7x/XcsPnTEbPqws77g==
X-Proofpoint-GUID: fiPWTY4c22vGD1tc74CuxZvurwvsGQ2l
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=6969f813 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=-6nChnoGJk84s89d4NQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_003429_275323_6EF25B19 
X-CRM114-Status: GOOD (  21.41  )
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



On 1/16/2026 4:28 PM, Krzysztof Kozlowski wrote:
> On Thu, Jan 15, 2026 at 06:12:38PM +0800, Wenmeng Liu wrote:
>> Add the sm6150 CCI device string compatible.
>>
>> SM6150 include three clock:
>> bus: Bus clock responsible for data transfer.
>> iface: Interface clock responsible for register read and write.
>> cci: Clock for CCI core operations.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..3472670fdc908ef8f3b3afc68ff437c0435b69a7 100644
>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> @@ -33,6 +33,7 @@ properties:
>>                 - qcom,sc8280xp-cci
>>                 - qcom,sdm670-cci
>>                 - qcom,sdm845-cci
>> +              - qcom,sm6150-cci
>>                 - qcom,sm6350-cci
>>                 - qcom,sm8250-cci
>>                 - qcom,sm8450-cci
>> @@ -263,6 +264,23 @@ allOf:
>>               - const: cpas_ahb
>>               - const: cci
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sm6150-cci
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 3
>> +          maxItems: 3
>> +        clock-names:
>> +          items:
>> +            - const: bus
>> +            - const: iface
>> +            - const: cci
> 
> So basically the same as camnoc_axi+cpas_ahb+cci, so just put it into
> existing enum with qcom,sm8550-cci.
> 
> I asked for this at v1.
> https://lore.kernel.org/all/43efa6fd-53c3-4680-8aca-7b37089ca295@kernel.org/
> 
> 
> Best regards,
> Krzysztof
> 
I raised this question in the previous version.
And got reply as:


---
me:

+                       clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
+                                <&camcc CAM_CC_CPAS_AHB_CLK>,
+                                <&camcc CAM_CC_CCI_CLK>;
+                       clock-names = "camnoc_axi",
+                                     "cpas_ahb",
+                                     "cci";


         clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
         clock-names = "camnoc_axi";

If this is acceptable, I will update it this way in the next version.
---
Loic:

No, the idea is to name the clock from the device’s perspective.
For example, from the CCI perspective, you typically have:
- A core clock, clocking the logic, which could be named 'core' (but
'cci' here is ok)
- Clocks related to the bus interfaces (such as AHB or AXI), which
could be named 'iface...' or 'bus...'.

This approach clearly identifies the role of each clock and keeps
naming consistent, without depending on where the clock originates or
its source name.

 From that standpoint, some of the existing bus clock names defined in
qcom,i2c-cci.yaml are not ideal. You can find better naming in bindings
like qcom,i2c-qup.yaml or qcom,i2c-geni-qcom.yaml.
---


         clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
         clock-names = "camnoc_axi";

so is this acceptable?


Thanks,
Wenmeng




