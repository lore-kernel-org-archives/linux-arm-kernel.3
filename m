Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B68CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 01:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvQPOUskdjWPrB4UtpqZJVcpnC9hm6QOIT/T8aJTbnM=; b=AdKxsAj6S1qaFfvhWjj2EQz64w
	AVYWLabkS0faEpMKPgIOFGIn5etftMsqJYhreCpuSHiFziiytPj34xbip/YsFXWOeG+Tlmp3iGYBZ
	WNg79PSGrFiCnOnU8/36j2KiHZuo5E9TKethrrCIfY3RJLMzKjl5cxj9/hVXo/4dbG/UU1kT8hXDw
	zOQyCUMkBLX1+9JvfkUSDn0vDqou1qh13Tls19CxYHzPQ0w9otCdx3ST99cerRi++rVdz78HNgq3p
	d45uvRKrYLb64iLKUQZTc+XIusrzjzlkDBXvCbc1G4nhwITTafMmFd4IdQM8lZ3Cax1JpzsdoesJO
	nvqV6VSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIGj9-00000004aSq-1djN;
	Mon, 10 Nov 2025 01:29:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIGj7-00000004aSM-3NPL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 01:29:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9IYh44963115
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 01:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mvQPOUskdjWPrB4UtpqZJVcpnC9hm6QOIT/T8aJTbnM=; b=bM0mKyU6Z/3L9xQy
	vBJM0QCch4B1nhqDc5Sm+teT0SV5j0X54eda9BFhrlQFjdVzyoY7E7TEX1CzFo0E
	rKVwFtLjAC7ta6Gi62J2m8unBIw89FWqEbM2MZv+XORblBHW+CeOjlykiKL8kS6n
	xpxdukS0KQXdeXmE7b8a3bm3IM8hS2wg6ipoi3v1XC4UZnmU6UB1mayTww24u6jz
	0P3PDht63XhXWyy2kcczsNbQ581u5Jhfclz85OuN3pU1Ob1Yv+/rgmiAfq6LHL2Y
	8PJF4B+iZuxCfY1eV/dHV0t/dfJ81PgIk1w8g5JgeYdtpab9hFVS4kCs6s+RdJxE
	wR1w3A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9y1h2y4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 01:29:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3407734d98bso3163752a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 17:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762738188; x=1763342988; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mvQPOUskdjWPrB4UtpqZJVcpnC9hm6QOIT/T8aJTbnM=;
        b=QU7MdMz3QumPxBEuJfIUgXSTV+3hNTJNWqSEWB/8nPuM5Yr1cTtgnP/+j+P2fY/Fmq
         xcdtTZ+s6e1FItuu8zIfc0GbnPLyEQh++e8Z4oo8hx3kGGjPNNtoLT0APxlGrx8GK7yp
         EWSG3gC4+F3MHKToYItWvseMYSX6yBChx1GS6F2B5ddg5aQnHBE1WeW9FEUMxlNGi1Hk
         vvJnGTAHYze0xYnUgfV1OHWrwNMys9VQ6xpAFpu7DqnpDOkU9V4oSblCso+3KyYyaglD
         Lo2R2KdxU++T2CX26olsITCZ2sc0ZPIC90eTOq7Wjr4I+KIv2YRcjJjrZeKmCWwSzJVc
         UDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762738188; x=1763342988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvQPOUskdjWPrB4UtpqZJVcpnC9hm6QOIT/T8aJTbnM=;
        b=fB9aodv/ihF1LxySeX3m8+iwwV4aiSQyN+//XJfpIPGgEuY8o4qhDDKfdn+MIFNbs3
         jxewYHjGFwbZSWhNTYyxjw8sbmtgELUsi20MSw54SPPQ7vnVFT2zAcEu8h9Un8s3GE7j
         c4pBKPBkQuy8UXQcEScRdFa7f2H28/7BXYpPGvE6J4a6BBv3b4NlyTFjDJjspUGpk/aY
         HfeR67uBGZUQeMedj+Dyrst/8Xzg/JUI0qG+3U6u+nplDb6pgrmYCyUPBvfwJJB34gqw
         VNSf5pMHwkTqf4D0OA2bcyt8UNt8IICaTdpHAWi1+C3e2XZudFvZ35v0aMEcEMz7mquw
         eIJg==
X-Forwarded-Encrypted: i=1; AJvYcCWVX2q6fXlagL2OzDkKKRmsuInMGGLNV7foYxbVMrrRgWelgDJTLbZboHbr8XK3vnca2rSbJu63hT2Ha1Xhb2Dp@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9a14d76DrfnikNzRxMplnpLMispjwDcELXeoH7GtT3BLiuQX0
	efILcQi5pbo5cGtdbwkOPwEfzUZonrszHsl2WRy3BOVfKtvG1exy1jpGQ8AzhrLyw4cRLolGUN1
	+jhNEB/IW7I/tbc4+dOVQGkZs7+ropFMPddojshMzP4rC3Yr5/SrgcOqijDroQnvpE1X9yfYJPn
	aDkQ==
X-Gm-Gg: ASbGncuuu2e2gBwu1lPafHEJeDaNmufHxAFxV8O07w6XYcTyOBbV+ZkjK6qwJPfg1NP
	W+vFT+y63z0lB0RBt/wT33lSsef5bx17bq1jh5XouI/21B/7e1rIJSp7EfkaHk4HilHgy9U2XPT
	T4rg+ZTcipehX+g+hydT5RkUtTN9A57zR9fft0cwekPRMXQgIhm6ARcCxXfV0z8+c2AJgqyNKoW
	RXY4zWVec5MW2xAldsvFOxjsrrtE8rPvU/Coo0uZwG2EQ+sO1nTdeQyxBw147W7/8GcBYR7351e
	/FjyTR9zPpKBuYKv7RA6Wvl6hARNXWwRdvnnor6MYuNrPfLx7fYxIeROCj8HbRM95RL89/AlZr8
	2O1cEpw1lPeNMC/BAj3VuzpC0aiX3irCpxFlcu08h/iKggdTQdgW997BTH4Nldpl4
X-Received: by 2002:a17:90a:e7ca:b0:33d:a0fd:257b with SMTP id 98e67ed59e1d1-3436cd0bd68mr8856906a91.36.1762738188461;
        Sun, 09 Nov 2025 17:29:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/zpXBoEI0qZfIbWB/NFb7Wa9KJd0FMTt/M01D8g42vf/KLbZfvlDMgxiy/2OU7k021aGKxw==
X-Received: by 2002:a17:90a:e7ca:b0:33d:a0fd:257b with SMTP id 98e67ed59e1d1-3436cd0bd68mr8856887a91.36.1762738187957;
        Sun, 09 Nov 2025 17:29:47 -0800 (PST)
Received: from [10.133.33.229] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3436c3d7dddsm5695497a91.7.2025.11.09.17.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 17:29:47 -0800 (PST)
Message-ID: <b80a5bda-e0fd-4471-9aea-bf3b39ec64e6@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 09:29:40 +0800
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
X-Proofpoint-ORIG-GUID: ptKr0kwr8XOOUsVZJ94lVmc8EyTgzu9p
X-Proofpoint-GUID: ptKr0kwr8XOOUsVZJ94lVmc8EyTgzu9p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDAxMSBTYWx0ZWRfX+QSJ9sL/aEfZ
 rbpjgZZ9OOqRHPKkRFgnJliVbq6+s0azo7lx9pon9no384rZLzZUkj8/76TQt0EGOWBrYKCBOEu
 YPxD8IenocILv7fA0DwCr8NrozaxGL/tCVuB8zZOUzsCIm8TgYN2Dbp/exfPTE0J95NTEWAqYyP
 urwFWhZJgY4FTi+LTBakBOyUpnjYeAHDacGOeHN3LvMFJIeDuWEMhcWO8BwNT0HoiB5yNmf6JI3
 oQ1HfFOWbnykQjj+uUXBiOoWrcO3GJ3Rhm8gdf8uXXMTWq125p6QhaXdyLAfSJxsY1Rqv9triGJ
 wnE5YYTZ5i8Dq2wijVocO/laEtWIFwQ0GS1iTUuzkNsBFkJEB06iApDCQjmTgd6QqWYMCaIQP6B
 011AWzPHzNLAxuoevG5AlskcvpFFAw==
X-Authority-Analysis: v=2.4 cv=Xuj3+FF9 c=1 sm=1 tr=0 ts=6911400d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=51A4gIhVuH9znBGuUk4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_10,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_172949_859873_EDC89987 
X-CRM114-Status: GOOD (  17.26  )
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
> 

Gentle reminder. Not sure do we have a change to apply this patch?

Thanks,
Jie


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


