Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABEEF9B5F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 09:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojiNe/sUH8AIzdn2yfm7m/6P4u6aT2i8yfd4xnqSSp4=; b=uImczCfSlhkKcIa+dGBvQ1nq25
	QLmwJfN06RlAu1cLCOafQp7/gfUCtlm++IL9qic58PGjYTHkJuPREYlR5SYy4BMs4hxz1oZJoHHbZ
	eCbFL1XPzCzNIZHgwG1D6UKaQTHkOv+CFQbeeir+WnegDWaB4CmV9X7Kw9APlnCqZ/9TxHEsjatgO
	oc5L9R7F95iWsd3K8DsDClZAdwcEur5filuEZpC7s8XpF1WDu4ntJgz0TupsNDEP+wea2o4CunA4d
	+Y2MX+RwhDGrMlFkxGbeErqGiUazHD+qLxAnuO/QgUfgTuZGJ1u3jJfyXwCysNT6a4FuOH/G2qipS
	nVsWmMCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFTeP-00000009p6S-4ASV;
	Wed, 22 Apr 2026 09:13:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFTeO-00000009p5u-1Gtt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 09:13:41 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M4o2eh2000986
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 09:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ojiNe/sUH8AIzdn2yfm7m/6P4u6aT2i8yfd4xnqSSp4=; b=LDEeVsTvfv+iQxEM
	h7VOAtEmTX0tE+FyiWP+2I2Osj25myx/JBURa4lzBA/73W/Thl/1AqBqaxF1xgzp
	aAYzcaVbA0ZOXxMMFrrsFh017Mibgzh0ENT9eAR2thRi81uRfg7rKlVE3kROSTST
	aYoet+Jf69X+/VYobKEKe7RYFrBLf3AnOvSxfpq2Q6s4WaIevGXlY1iW1dc4ZLwj
	a5Aa+evdVVRXOltSpY9jWwFWJJuDjwHmimp6xLT1L7A2pyiYmnRnTJaUF+GHjmMC
	MMhiDAS1fcRAsDM/W32w2Gcib1kgbK6NK0BcVvCIfTvPZtClEYQJG12MEvuEPEoQ
	VD89nQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfarau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 09:13:36 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95a76c2479bso2836394241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 02:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776849216; x=1777454016; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ojiNe/sUH8AIzdn2yfm7m/6P4u6aT2i8yfd4xnqSSp4=;
        b=EaxpCDDOoqGJXaPcSHjDA2uvIl0kWr/YZENKtMnzAqThyy4Dju6CbfGf5+tuPbcPRD
         Vpmc51mQnckNImN24o7g2SaH9g0J5hKdxEpIeE10HLqwFuy3clha5G4qshyj1q9GSAms
         RlFzaWTsDzgszX7HFpmk5QZ5MMNTzcgEF6C9j2wbIQR3MIkEbGZVl0Hd9yw6L1eh36u+
         r+eU0nvn5X0996hxCGDQlm9k5+rILISGKP2+USahUp2yPIb3QsYBF6xwX5qQQBjIf7kr
         zQ3EDcV46fjkmXB/cOPuj5U+0LjpWU9ZsEffvetVHG2tnYn1CPnyBlAdXah0wNp1I3lF
         iw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776849216; x=1777454016;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojiNe/sUH8AIzdn2yfm7m/6P4u6aT2i8yfd4xnqSSp4=;
        b=HIY6CQYe0p95+kY89ivHo33fhXOSLZ2cLAyrGel2zlPFrrZlD7SPgMunZ52130utAj
         f5TkrD4WykLVa/3eFHqPr7jfvrw0O4RMYwlhyR0ZykQJZF4/O0HJzkU+0HRosOdFptfZ
         vvFO45smz9pwa8+hYHr3nN07LE9Z2RuD7tRUVxaK06A8/Hl6R9NQOX0BeyW3F1YMqsP0
         er4PPyBOtLWZbeRW8hCWU3CZ8diZghBEqIZjJThRDwdRY1+sQjGltBmf8myNwmshMjXG
         jh4oTPuFkezJiNGIMcJt/kY3WB8AqReDl9yN1bjAZf8pGBBNmTTMzcIwdyMiu1kNNZV5
         /zkQ==
X-Gm-Message-State: AOJu0YyIi+P378Hj3+910wwJADE1MyfZroYjgAt9kqc6T4AZE3PSyE+g
	IIH64l8yfyKfa5yJyIbtIET2sw9FRytMQHPPymF77yIsNF/Mf8BSs2ccvj37lCZmtvI8ZxJdbn7
	p+Z1GQPWM0SNn7DwMyBJcEeknu5+0/q5Dg496JXVcAZVjMJx8/uOlM/o397tSndVkWKZmTQpoST
	8Xbw==
X-Gm-Gg: AeBDievKmyaP/FMWh7L7GzmrENxP9g972DYTTO1J9GpkX7Jw1EPmeyYLwHPaa5htwyd
	GpyIDU7ah0ebVLRypoK4QhZuLM/+4uI0OcT3VrB0IyqB6LEyWzspFp5oYX3vHzY/Bx9bmh5nPHX
	DFvrajyE++eCCSDTZ0H9Tpsp+lA0Cdnoczu7Qy/Xi7SpMwXZ0lMi/F3/xVjHe5GN3wC/2DReAD0
	iVHmJyytQaav0vNei5TwNntc5EbbGT4BdmguGLh21oMkmPlkYOA/SIYv/yaTTqvictBlqko5USN
	RzlhF+LTVKJCp/bQMQIQCz0FQmuKd7Y6UAjDPIkh8r05AwUo/R5pPD5anTWWhtgeIdf4vRB+uTG
	VAts7Got8MjCdMFq7bqCk9P4zSv9BMl3ICOc6QwKtKpyMGnf7EZ0N30J5ASI=
X-Received: by 2002:a05:622a:a78a:b0:50e:5e6a:c7da with SMTP id d75a77b69052e-50e5e6ace5emr136272081cf.40.1776848652954;
        Wed, 22 Apr 2026 02:04:12 -0700 (PDT)
X-Received: by 2002:a05:622a:a78a:b0:50e:5e6a:c7da with SMTP id d75a77b69052e-50e5e6ace5emr136271691cf.40.1776848652516;
        Wed, 22 Apr 2026 02:04:12 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7a0b60sm127441835e9.17.2026.04.22.02.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:04:11 -0700 (PDT)
Message-ID: <d1d24380-06e8-4833-b893-631c063d77ff@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 11:04:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm-smmu: qcom:: Fix Hawi compatible
 placement
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Will Deacon
 <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Robin Murphy <Robin.Murphy@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260422083329.885979-1-mukesh.ojha@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260422083329.885979-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tzEj3HxqKfZpM1vbZCnSFKRGcU8I42NX
X-Authority-Analysis: v=2.4 cv=fozsol4f c=1 sm=1 tr=0 ts=69e89141 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=aOUUj6KyvhU4KahQZmAA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4MyBTYWx0ZWRfX8Qo7eO7/xJ53
 QOL0r4/aRLgYFzL/cXNO/oV8AwgosIXG+Cue5fMgdLNN5zpfwX4bgd6/aET1qzmerPhym3PxTEE
 KkGT1tH/pPmVSFCpJhPC2ddaygMnZauLHHhxAi9nYZ5P6Fo9Nc8SAnsIC3W3BFWZ5L7TII0+62U
 +otJBwVV6mG0OQKpvJtz//d9LFHvKdTCS/6ZXCz4fD4Ft1H5hi1KoIgTAEM94vxdsAOqTDvr+et
 98q2S8Hsoz+QWHmVAQkdEPyKCg+XYl1QXH4G4cha6Xo6nBjzpQ0WAW2wefpM76STp7JI/6Ndncv
 uKYR636/ZhHXMAR2xgQN02SeOh96TPNoxs2RwARyRfRUYqRjf+xQxcauv01Ve5o6pCZjaOBiF5o
 KWjBOFxPm1DufFW8RYR+21upn1UeMADiiQ+CxbyGK8GCvTYWUcxO/dd5KhZHASKMVPBQ5qW1Q2e
 6VE1qbisl5CR9STtelg==
X-Proofpoint-GUID: tzEj3HxqKfZpM1vbZCnSFKRGcU8I42NX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_021340_380616_72F92EAA 
X-CRM114-Status: GOOD (  16.86  )
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

On 22/04/2026 10:33, Mukesh Ojha wrote:
> qcom,hawi-smmu-500 was placed in the wrong enum block of GPU. Move it to
> the correct location alongside other Qualcomm SMMU-500 compatibles for
> CPU.

How could it pass dtbs_check?

> 
> Fixes: 5e8323c3d528 ("dt-bindings: arm-smmu: qcom: Add compatible for Hawi SoC")
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 06fb5c8e7547..ba9ad1f5a8ff 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -37,6 +37,7 @@ properties:
>            - enum:
>                - qcom,eliza-smmu-500
>                - qcom,glymur-smmu-500
> +              - qcom,hawi-smmu-500
>                - qcom,kaanapali-smmu-500
>                - qcom,milos-smmu-500
>                - qcom,qcm2290-smmu-500
> @@ -93,7 +94,6 @@ properties:
>          items:
>            - enum:
>                - qcom,glymur-smmu-500
> -              - qcom,hawi-smmu-500

No, why? That's for GPU. Why are you moving GPU compatible to non-GPU place?



Best regards,
Krzysztof

