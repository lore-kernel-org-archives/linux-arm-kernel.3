Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36864D1CDC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 02:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8JCNAofATPbQbJ9Vw2PrDOLAxp/8y2/xMnFDKo3YwA=; b=GuSYYeox2kgNB4PFyknkQHEl1z
	cByl9AdjycR7MHeKKUPKxIDqKTnbtvFqqkSxf4R5CZp7wDlQTMcgx3BbtxHpxRUBoFpDFrvYoSV/R
	DEj3u+YHf2TnAJw8GxhRHiTIVM2tOQ857XMYAIjKQ+ElwCJ53Em7DbIbihb+Gg9Q7sUoEz4SpKpqR
	suxn6FEiHSQTa+RlWWBpDChL9WmqI/RHPyN7rtP0oX8ZBakaPQVfqW38KA/SHmV1683oOisJMXWEs
	INBn0f27Yn1XbLiYswCUq/qqGUU5t2OHVTq1C53q7aL6SY+7xCk1Eignytp4zFIAtB+6LIL+pGGvi
	zazjAmxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQzTs-00000007Nxk-4B7a;
	Thu, 04 Dec 2025 02:54:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQzTq-00000007NxN-3YOz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 02:54:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3GO3af2658567
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Dec 2025 02:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q8JCNAofATPbQbJ9Vw2PrDOLAxp/8y2/xMnFDKo3YwA=; b=KtezQRzArFv7yXH9
	XIsgCS7QCkjhX+vSLQXshdcz9P8PEL1uvFsGVn78VWJzgI/a3EyRamQdzAVBhxA1
	Id8VKebQqGOYpSSgJWqItuDE0QX2dbcmvH8EaTm/FU5/9VsnAnwH3WjOZHyD+rop
	pv2S7+pVEFtZyqmVbHCB8WSe4LJKdOPPZphI4jt2HdktyXqWoAp3g9S227i2Je6V
	jHrls339qp7D2NDQoF2UR9fqrT546x9hr/EFuLO5+c5pKWlpZr+J8PeeiiMCN8jY
	jJI7LTz/bVPfyQDC+gQElvaMUD4BnMriybyenYYtDahxBAmQ7pxf84C0O8DN35di
	cHclgA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atrpphpw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 02:54:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3437f0760daso818961a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 18:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764816845; x=1765421645; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q8JCNAofATPbQbJ9Vw2PrDOLAxp/8y2/xMnFDKo3YwA=;
        b=TSWQGz9PSifpA9rilKepwPQRbTOO1OBXnDQJqrb0fI5cum7K2DdI3jqQP2IVc/XP6b
         VpI+39BzwgCK9PlQBc3uo1DPaI7BustGq495RCcSu0HkLQ6P9YgB5FlaQ4QB/kQRpzTz
         7UdBOyLREN8lI4ILVnhVcJDxDlE8/pan5S0tXy48UKIriAmPRDsHwQiphZa3leJ4BWsE
         T2Ecwlin+Rvh8jk4y3xfzEwxX1D8kO/eyypNq09+E4oTkXX+5g7StqO1BieeLqv5RkF+
         rV4BgqIl91QxAe37hhjVIf+EV0X8W6QHyZi/TNqDQFGCUKAZ8g+VlnNAT6D0YcT8iqk7
         NjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764816845; x=1765421645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q8JCNAofATPbQbJ9Vw2PrDOLAxp/8y2/xMnFDKo3YwA=;
        b=w76O3gAHfiRBRayRkTCXYiePfBvm6tl0sq1O2aq4i8z40ppAyDbRbGjFT7iZ5uqiv8
         QyKlebbXCLj7sEbYaUdb4Gm2aeeug4ajkWc07PKjntVX9YWXRVzB++YoVvjQ3oGbsL1a
         BdhhCFFsppM6Copm7KtXtyzpM5ibsSNjDz2Ya3gVM66uPWpKqoVmI13nTLT0geWFyMCF
         kzwYd/T9vMlW49Wc1eRjwvT4oRmMm9EWdOwNxzm2LDDhnXKof1BYaCP9jTqybW2WU5R+
         PCBget4x2SF/16BvxYgw6lAkRBkf6tOEntaDRm79DwK1aspHYhfRWGIjTV3gchcJ5XwH
         6DQw==
X-Forwarded-Encrypted: i=1; AJvYcCVoVDyJ47WXoTWIvi5hhiuI0ar+uzu54Ry1i0pOUztXFrcty7zb0n677dOToammoSxJcxL7NRvLxYwac0R5wnHe@lists.infradead.org
X-Gm-Message-State: AOJu0YyKG0Y46m5yKujapPELr8hApjKdXtmUgnQGWURU0PSFKbHLRUui
	UPxUJv8ErrxnBPpg6FRAvmFPBHZHm0tJp5iDdqNnEIsjdtREN5bhD3aUQDJgkOGvQfsWd2O0sK6
	jv3BYhdHFLMLn8Gov/B4uUw/f4Fnc4tJbHIHeSieTM23AX9MFZuBPQHcOWQUB9LNUbuYQ/g153A
	UOSA==
X-Gm-Gg: ASbGncu5dHTEz1SzTeFoNGFr6f1a6SUGTOsaKX94ZgGK4nJW1Zfkec/VchtyTg14snM
	g7k5WUv5fLjHQGTs+HFMxCS9ewgXUi4diiFmCmdRw5WNBAQz7nU4Pf/pEz1fhGh69qJ45xn3QiE
	t+jjs4CaBn4SiznZ6RwA8hIwJmahwqDWV3wbdHPBlX05lyiAk6JappAHDKnu5zG+cESbyjJD8GD
	sYk/FBSO4wp4E+ei6vKGwIoPl80ESL2NsLR5S/1bN3xzP9PIXasI5HiWoSB/fC0D0NkGxUVrP2i
	DKXtfLrCpdENQgNjoUUkyRC0FCGr1Q4P8xqnUH1ACHVZmXKE841FnrdKeHf7sMmkfKFST5wpZkj
	j3Z3GXoLbW+Z2dLlEnGAsvfsnOypIFognfQM19BdAjEzdNyi9Vzb7/6+gZQOlVCj+jcfPB4hMn7
	c=
X-Received: by 2002:a17:90b:580f:b0:340:ca7d:936a with SMTP id 98e67ed59e1d1-349127ca211mr4859679a91.18.1764816845392;
        Wed, 03 Dec 2025 18:54:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENjq7ZgBrcQpEkrNDiTTzJi8Ifz/jSay8KddNCoTe0e3Bj8PjxrzVNWwx2tBY7wryDD6xl4A==
X-Received: by 2002:a17:90b:580f:b0:340:ca7d:936a with SMTP id 98e67ed59e1d1-349127ca211mr4859656a91.18.1764816844919;
        Wed, 03 Dec 2025 18:54:04 -0800 (PST)
Received: from [10.133.33.165] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34912d36fc0sm1546875a91.12.2025.12.03.18.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 18:54:04 -0800 (PST)
Message-ID: <5a0e4abf-9e7f-4ef9-af02-dd6e34f5cfa8@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 10:53:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
 <20250908-enable-byte-cntr-for-tmc-v6-6-1db9e621441a@oss.qualcomm.com>
 <66d4488f-941a-4716-b81f-e0f9e1165931@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <66d4488f-941a-4716-b81f-e0f9e1165931@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: o0y1UrIWZ9ldbqbvv1gbYxmGSbRAlDzf
X-Proofpoint-GUID: o0y1UrIWZ9ldbqbvv1gbYxmGSbRAlDzf
X-Authority-Analysis: v=2.4 cv=L+YQguT8 c=1 sm=1 tr=0 ts=6930f7ce cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=SkUS4XPTP4F0jhogtscA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAyMSBTYWx0ZWRfX5R+YyykgwDHy
 oLYVSzFt+QCxXsV1xAZDBBVAJuV21QQGkJhobmjg2KAzq4lSecBrA2/fvAXXXup4GEINSv2uiUK
 Nh0PdCXrkf2Ho6heXkKyGg83VLUFjPtQJcew5Ox4nCOpGL/ZoyXldlOW86MjDVj9MapmXNjSnTu
 UBasmJfNdQbQ1nT4hHycyiKQOy8VW0owQwntkE2T2Qn/SfGbkpEbLUuNEV0ajcU/q6k6Pc3Ab9D
 RFABZSlK6hqr2gmeiN11/F+CsN7OP3COCHhIfR50pm2UIX/Bp7x2vxUpxezWZLk9hDmeZZZ09LF
 wPIbyY4FBw/Ou22HfXzecw/06gH0kIC9Hv537pONcHcAHN6khztVGsin8zkd6wZ1ndvVPrZ7Qhl
 aujcwevBnNoAa3ObmoNWXKLTRKIaJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_185406_889548_FC9E5872 
X-CRM114-Status: GOOD (  21.00  )
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



On 12/4/2025 2:14 AM, Suzuki K Poulose wrote:
> On 08/09/2025 03:01, Jie Gan wrote:
>> Add an interrupt property to CTCU device. The interrupt will be triggered
>> when the data size in the ETR buffer exceeds the threshold of the
>> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
>> of CTCU device will enable the interrupt.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++++++ 
>> ++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight- 
>> ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight- 
>> ctcu.yaml
>> index 843b52eaf872..ea05ad8f3dd3 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> @@ -39,6 +39,16 @@ properties:
>>       items:
>>         - const: apb
>> +  interrupts:
>> +    items:
>> +      - description: Byte cntr interrupt for etr0
>> +      - description: Byte cntr interrupt for etr1
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: etr0
>> +      - const: etr1
> 

Hi Suzuki,

> Why are they named "etr0" "etr1" ? That would be confusing, isn't it, 
> especially with the Linux driver naming things randomly for the TMC-ETRs.
> 

Yes, it will cause misunderstandings since the "etr0" here may not the 
right device we are expecting.

> 
> What we want is the "port" number corresponding to the "TMC-ETR" being
> monitored ?
> 
> Have you explored other options, "port-0", "port-1" ?
> 

I think it's much better. Will update in next version.

Thanks,
Jie

> Suzuki
> 
>> +
>>     in-ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>> @@ -56,6 +66,8 @@ additionalProperties: false
>>   examples:
>>     - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>>       ctcu@1001000 {
>>           compatible = "qcom,sa8775p-ctcu";
>>           reg = <0x1001000 0x1000>;
>> @@ -63,6 +75,11 @@ examples:
>>           clocks = <&aoss_qmp>;
>>           clock-names = "apb";
>> +        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
>> +        interrupt-names = "etr0",
>> +                          "etr1";
>> +
>>           in-ports {
>>               #address-cells = <1>;
>>               #size-cells = <0>;
>>
> 
> 


