Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE47CFA468
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 08:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNVKTVtjst6ZEFVtH1YafY4MP3OGJGY5T4qdhFTV6yg=; b=nhQqLLCr2kCEBu3NXFkgEe+EeE
	Jm6LMCyMGnI6S2D/YckEMU90/qnXORTaIBYZUi/KxI7oBoISvBtnHN1dfi7ey7U//KuwFPMoU0qiM
	yI7cHMzQxSlMPXONftgbBCs0pzuR1whBVaGmL9Zv01RYw5AJJUeUYtp+sCSzIFZv64GEZMjvnfPK/
	cGsTV8s7JToOIrSHnzqipgqMehI+XSaWbtUIlH/l4fKoTH70bbAQDWwcAj2vg9+cOyZodrAJWwAU4
	o9oYtAr4wYYyTN1+O3TEeDEjbQgXci0UaFSMFS1jGutIrTbsdRWC2MINPXHlDo45e7X5mL8BVzS4f
	T5RQJ1pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMTS-0000000842J-37Rj;
	Fri, 21 Nov 2025 08:26:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMTQ-0000000841N-1h4t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 08:26:33 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL5TFtY2831860
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 08:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QNVKTVtjst6ZEFVtH1YafY4MP3OGJGY5T4qdhFTV6yg=; b=KD9bAmfjVeSQMNhz
	aKM2odgIQjyQsIsAj9obGtypuV/E0VdiLaiXvcX1z7A/5plLM0IS0Fso5q1eUGQX
	SQZOq2EwTbFRXO0j6kqWdiMSl5m6GlKslrd3PT8QtmgGzDM1Xm9nj367Bl364bmi
	tvGuMBHuGpJLNNnffaqyXr43TrkKdLu+cFmwxlS/syJ00Tq6xp44ZnDMw10jDsxq
	OnceEVs3voR3Uzs0WxiaxgvgFVYHXFRAyAJAwF9TGq34LuPD43Guz4/pdIAfVNKn
	7FHZwy7x6JXtqYZMCLLoCefWM9jDSPWHykOVnHnRv2Lni9TDSTWBLqsqdbxm/URP
	+ZNGwg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhyq0fmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 08:26:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34566e62f16so2175918a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 00:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763713590; x=1764318390; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QNVKTVtjst6ZEFVtH1YafY4MP3OGJGY5T4qdhFTV6yg=;
        b=eXUW1NQpv9BNYJ/rbOOHnVlbqUqhJpJWHtdQaOpbzP2K5I92/Y+izxklCLEXVqEqAY
         zdsV9TeVdU1gjCeqtfxbbtGc9Ll0FtH2ZMwOYXKGVk5HtC4IPmXCZhnIRTpAMJO7kXxC
         6VLUPD1sxMmiDTx+gF02JuwE1hMo6Ns994t7SaF9q+dqWsENsQq3SJSWQPjBRvzAv1sJ
         6mdqVXDaZf4PZkghtYiS0xVdQpRfqEnHvANQqrX5ERGaFeRgERux6JTGP+8ciZoZL63N
         Lq+L9T3En8BkNib5MkVgIFE7rQGVLiocFqJLtYqlWHYKcRTLw7qh4Z7WjIkCuhGTPdmc
         DChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763713590; x=1764318390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNVKTVtjst6ZEFVtH1YafY4MP3OGJGY5T4qdhFTV6yg=;
        b=eszH2RFbOV9SccW+N8bzFp5YwUxoQQIuzVbCVsXdhz41gMqOkelmF68aYoL+Hr6hVM
         G1ybJXL5mAemnGMZI3mU10fhgh8zBExiHRTKmqz9owVLXM8E5A0q1nUl21ii6oe9jjUr
         sbw77b1+QlZO1hOtFnwdtj/igG/l84/ur76ICyurv36GG4Y8d0XvSUm736sQjuMBKZMp
         8m8K5q3BitzgogPkW9uXzZFFTVgOFUwRaFuh5iffNdooA8p59JIhzwxsH4R3p2Q6k4Av
         pNT9BGbF+pTL5gSKQfYiyIVYBmbni8hjhsJfRnE6PJb5ZdtBxXd/jHuC6Iovg8Z05qL4
         NIyw==
X-Forwarded-Encrypted: i=1; AJvYcCVxz0cIOyeAuB62ltGd0pg0Ya1dzEcwcJIDRstfHBEcUanpS6e8Eq+BxDRvbRlYiUmN9zh307CUDpRf9Qf3Ds0d@lists.infradead.org
X-Gm-Message-State: AOJu0YzRAUD0+sMrql+iqZFg0w3YF6ri7PfY7Y8RJGVCNH/xej0LkU5o
	5i3KpyEQF4868SVNUO/kkd/FQ+UuDS5vu5Qedfi1dlANNxMCXpLXIWwafpx3s2IA9ZZyCkjrsWi
	aoSNM0x5c5mGLqb4cUZ1s3pvv1WysV+Pn34CG1ixZSAVr9yDv3W0vggq3zd3LijRyBV6PB4l6Hg
	C4VQ==
X-Gm-Gg: ASbGnctlS+Uj2Rh7lPF7ORWpp21fslDoEqq058QxZw4vry3EFe3L5/pKT3cp5iiGeee
	+SkEiZUu5wCocRD47aXnJozOvYiPJG9QIqwP8XHmOWLJ6i73D1eHA8n6ei/8WrYqszgL4McytC9
	IeAE9aPZjqpvtXfH+vQXGfuJM9fBPm8RH8Eqo+ZAmbvohdRn4lKY9SLIDp/nZOoaUhwzwHKVOup
	H3EhxOLKXVVUJtCc7qVgBMkpWV/5DBQfLki2Clxy31qVEHUc106X8BoVPyFRvpl3ozCBhzURiAt
	1qq1Z9mPjv/IJwCkfM4xMNdL4jg1SozdL1XfvGuRy8YJyERp/FHO15KLAzAJPtJiBAixyr+njZx
	AveEeW3zdYyhuqdS5BhFS9yykbROoKvMNRWrEyI870Cv3DGTrYZPT4xIiPbGauV7hL7wp4VaPgP
	s=
X-Received: by 2002:a17:90b:37cf:b0:32e:7c34:70cf with SMTP id 98e67ed59e1d1-34733f5d324mr1632119a91.36.1763713590489;
        Fri, 21 Nov 2025 00:26:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuBevw2FKEQYH+fjg0nmPWQ/BlIg2gNnWEfuCXeEFv6Sbqr8G7K9lkWtJ/3LY7h7/iY/0Zkg==
X-Received: by 2002:a17:90b:37cf:b0:32e:7c34:70cf with SMTP id 98e67ed59e1d1-34733f5d324mr1632092a91.36.1763713589931;
        Fri, 21 Nov 2025 00:26:29 -0800 (PST)
Received: from [10.133.33.178] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3472693c35bsm4878413a91.14.2025.11.21.00.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 00:26:29 -0800 (PST)
Message-ID: <024539e5-1fcf-4ad8-8d7d-af87fd02a1b7@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:26:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: add CTCU device for monaco
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
 <20251103-enable-ctcu-for-monaco-v4-1-92ff83201584@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251103-enable-ctcu-for-monaco-v4-1-92ff83201584@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IDnKcTyMij9EJ4ihmZT7JiG_d2K6Cmod
X-Proofpoint-ORIG-GUID: IDnKcTyMij9EJ4ihmZT7JiG_d2K6Cmod
X-Authority-Analysis: v=2.4 cv=N94k1m9B c=1 sm=1 tr=0 ts=69202237 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=51A4gIhVuH9znBGuUk4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA2NCBTYWx0ZWRfX2BqnnY9mPk+f
 MD17UMePsjsx7mUOCpKeslCd9AfnR9WEuSS10O+NFq6RSU55hVSQbOWPY5f0qcJqMvyEWBqm+8l
 IrRHkTsEJaNPsg6zy/7ZgOwbv+1UNvYUv2Jb2Kj01ipiRIDfxhl82IsKZ/ljciheqCw93THQt19
 FN4fM51lBjnuuOR43Azkd0g+OylXZ7pAf909aG8ogwaLMdDkmxUysYFAHkCO7XnsJogm1wXyYzg
 SATc9xiiegJkcChFkB6bGhVzKjGXF6rEFZmpAPC7OBBOdctoxYg4pcGb9A1c0+8hV8ddMCZptI2
 WLju6gpa2QiC181kUe9eBPBcnI/qA8muNYH7as2qyx/cyBm/fVCH7rb2LKXTtX8RZpBNy5QN2nr
 LE72X/dLVReZi12irAy2+3YTvtdDzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_02,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_002632_448663_578D932F 
X-CRM114-Status: GOOD (  16.83  )
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



On 11/3/2025 3:06 PM, Jie Gan wrote:
> The CTCU device for monaco shares the same configurations as SA8775p. Add
> a fallback to enable the CTCU for monaco to utilize the compitable of the
> SA8775p.

Hi Maintainers,

Greeting for the Friday!

Do we have a chance to apply this patch for 6.19?

Thanks for checking!

Jie

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> index c969c16c21ef..460f38ddbd73 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -26,8 +26,13 @@ description: |
>   
>   properties:
>     compatible:
> -    enum:
> -      - qcom,sa8775p-ctcu
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,qcs8300-ctcu
> +          - const: qcom,sa8775p-ctcu
> +      - enum:
> +          - qcom,sa8775p-ctcu
>   
>     reg:
>       maxItems: 1
> 


