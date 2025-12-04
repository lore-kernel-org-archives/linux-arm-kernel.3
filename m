Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D19CD1CDC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 02:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l18eOETE5eFpQF+4fs95+BgbC2dSm8raFUZecoGWy08=; b=SC9YTsdgr0M9M5O8Ia/7inCwqX
	v8Pr2FYqDbBENSwyZoasz+5uSLkDQ6v9GHfF/wVrWAabxZKsgXWzBrZTmq13mkt+FoGrFzgA+Twbe
	xDnIgP6C2Y3a9kjRSI6IBl0KgDofUQQz/8lkD8yqsduwOsTInv+Er3u3YVVWUa8uPu5eVSsMuuZEo
	Qxm8kCDyMmXRSntwne0rUfKMR+TD0o1Bley/1UbXnJINmHeuKgHf6IUrwYbnwguo8hpj3JrqpQbSM
	/5sVedf4k7QL7ol1DhXno1yW7YFFkH3pCF4BouAWaPpEshE/6dW163LeEA5GTC1aJax4nS00LpJS1
	gEvwgtSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQzPV-00000007Ngd-2z8d;
	Thu, 04 Dec 2025 02:49:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQzPT-00000007NgH-26tP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 02:49:36 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3GOQ572659479
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Dec 2025 02:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l18eOETE5eFpQF+4fs95+BgbC2dSm8raFUZecoGWy08=; b=GCLCOJLAfUFmTqLk
	twO1E891y4ojs3GuOZtt8POGpD8LhBeXABIKoBCodQsRz9/OxmvqW5WuM8seycz0
	sX8vihxReWKDtYIolLcIbSP7+5lpYtcUZGN2TFMgEtfRwXAEI/TNWCpR0i0EX/z9
	XWDe1eEn+SVA5PHRAQNLJt7qzVqHa2VyuBQgKnn+hNwDBIy4d+qI0Hpb9llro3ZO
	ek+eQOLJKlNWALvMJPR1l7qODSzhD+lPy46/HCuWGLNR6IFc/wZtxhX8LNqaYL8g
	WoPaiKMo5AebBbjBKXeKBUnLq32q0YnJPyrL65RmDH02bmhs5ZaXH9KHf10tz720
	mv44mQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atrpphph2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 02:49:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297dfae179bso9715875ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 18:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764816574; x=1765421374; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l18eOETE5eFpQF+4fs95+BgbC2dSm8raFUZecoGWy08=;
        b=d2ggsNwaPyI0US3EjbJwNLHz9r+xylicdrJQq49Axjzw95l5v+gSy+n+qNrQjkeFt/
         QtmzYa4dPiYMUon7nS5md2c3yCDgiDot/5TIyA2l+lwXYjonCASbZRvg/FKsqK3hRuRs
         ueQPjEgDywgyfYiVIausjuybLPEJiaN1+7zZqUMf4HNUavqyIouTMvWE2ZeRFrqVFJVH
         LQwE8biZU4x0FwPbB032c+BoUylI3iL9MJJAEkUu37PjpBIrmtYkNjAof929l3XCOZXo
         8YgVB5M4dcYQzOPdlEiazkXqWMGaLW69/ZUT0JxpOxtylcKB2Jw00JSZociPdFoCG00H
         iWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764816574; x=1765421374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l18eOETE5eFpQF+4fs95+BgbC2dSm8raFUZecoGWy08=;
        b=ERTeoQ1z4dezdHFXhdYgFasFxT9ngqEtpfvMWHKt3UfNAtlruKgZi+r6+UdRxDxvLt
         raDkJ3iIhMwZSk8rMSGw9fWn7u19zgVml5k0xlOWXfcheWlTXgnTUiXOJuUIh/Y/QjcI
         gynDILgv5OKNcTeM3Y4W8e6yHq17sXKiOIG1Lv+ZfaeslWr9y1iW5RLLFWkBTD7SXrBN
         CQ+8XHtGTBdAXEuYMCFId2usTH+5kSRRQ5NRtHAOWfJezc8AH5Gz754u554wnl5mQ5F2
         js14TvHhC8K7oGUayqP92MvfLovqPQ6HiiUfNSBkVYELOqcJ/N5g5uraqBbXx0NetTM3
         Qy1A==
X-Forwarded-Encrypted: i=1; AJvYcCX1Pm6ahf9L0Wjp48vfCYIMhYcC4JbtYzabW7uBBqEmwH/brv1ysN22zqFlDa54BfCsvRUV1aWS3jEJT3ETbzmu@lists.infradead.org
X-Gm-Message-State: AOJu0YwiHPVVVxj3PyTbGxhf5bcE2klzdhLlLlF76NcaP9XUpLLg0N4a
	ZpP4zP7sNHRaY2tpBvXzYOntb1Ij/WLHtZPrOZ/bSaM3GkhinsFoHGYVqZ7VBw+rUXeZ75JLArq
	FKBiHS7YY6SmvA90w4wkr7nigsG+kIJJGkAR6vcNXBVMvlTROa5c4asfymiJ++B+UUw35Xgq7Ax
	vV3Q==
X-Gm-Gg: ASbGncuDUzI7z9bdp6ktIVa4F12LpyzMnVa9kqpzQl7ofRM0qQGXvgD1eLsqm4BMeVG
	OVjd2/NFmtSWIjRwRGTtk0z8VbVxmatAH+y/UhmqyQkR+XXnzwoNFZMl6JlqsT2pZM6Qcecc5K5
	Pq9vG85LpITLbu7uhkpxXBXctAo1i9lKoJpJrfDyytj354DHfgryCo8M6gcs3ezYk073NYc1xBP
	V6CQ7adq72Yrkmwy1QJcd8EgC+NmrU4nDwzuZ5tUazzKbKlapJFJJ8ymNrYJ5DEB0d71M+bgIUb
	1dm3b1I4n4enyjr+rr9QwRcjtqMqcjCWP12FAFq58oAfJjbf7nq5fUegzJLkkbVo9P6B3nVWgfx
	nzEYcsWqfVRWxP4pLBe+tEegor0/idBTFun+j3WMrz76Kfe+anqht8L6QHO80hsOIwlJHIGo2om
	o=
X-Received: by 2002:a17:903:1590:b0:297:f527:a38f with SMTP id d9443c01a7336-29d683634fcmr54201615ad.18.1764816574202;
        Wed, 03 Dec 2025 18:49:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOXhEDM4lGPiChS+i/tHVgNqoj4qvaobNrbo6Alylr+7d/T0hWbeTiG9c4DjXOLOjZGdHH/w==
X-Received: by 2002:a17:903:1590:b0:297:f527:a38f with SMTP id d9443c01a7336-29d683634fcmr54201235ad.18.1764816573728;
        Wed, 03 Dec 2025 18:49:33 -0800 (PST)
Received: from [10.133.33.165] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cfcfasm2815175ad.41.2025.12.03.18.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 18:49:33 -0800 (PST)
Message-ID: <dd87fd82-9ea7-4205-88b2-1af2eaadac06@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 10:49:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
To: Mike Leach <mike.leach@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
 <20250908-enable-byte-cntr-for-tmc-v6-6-1db9e621441a@oss.qualcomm.com>
 <CAJ9a7VitqEix7dumLq2ND=6+PU_eCkm8=YkHB0n7iHdJ8iKeVA@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <CAJ9a7VitqEix7dumLq2ND=6+PU_eCkm8=YkHB0n7iHdJ8iKeVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: c8xjGj487BcJszOeNeNIW2lJo4BgyDpK
X-Proofpoint-GUID: c8xjGj487BcJszOeNeNIW2lJo4BgyDpK
X-Authority-Analysis: v=2.4 cv=L+YQguT8 c=1 sm=1 tr=0 ts=6930f6be cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=bsiB8u-D1x4h01OLYjIA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAyMCBTYWx0ZWRfX9eEEe8YOe9dT
 Kas7ckhodCSx5hlzgX6xqskhxhCtwlp0w4xwLpHfQZ1XnZoT7T0da2+nQUAIffNgGpSVpu5+x1W
 SXNdzFIwR1g5ScZirtkanYOGnL9fXAV13VZkrYuCKsMYFiR6z6YM0Erc7iA0dVgYGLveJAEokj9
 ImYZCeNJVsX0wKhjwAMoYYt901LrnxJ7vAjiXN+LKcLLM5OVIVcwXzdogjYM7AO8xed60RjJof0
 69f4v7mGNVqh8Fu9kzULCkm1ibYORmwdZLdiALppPGwc0OwarV4TZBFEWYaARd77qUvhD+waLqZ
 iOeWXFgn/K5WCsjcpskQYoP0oAu20tjfH8uIhv6faoUqTD7YaLw7O29wgo7lMLngfzt1SffTA6r
 8SHGpyPC0ZiwrPMqJNCUFa7wOjNWAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_184935_569468_4ADDA6FE 
X-CRM114-Status: GOOD (  17.35  )
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



On 12/3/2025 10:30 PM, Mike Leach wrote:
> On Mon, 8 Sept 2025 at 03:02, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>> Add an interrupt property to CTCU device. The interrupt will be triggered
>> when the data size in the ETR buffer exceeds the threshold of the
>> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
>> of CTCU device will enable the interrupt.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> index 843b52eaf872..ea05ad8f3dd3 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> @@ -39,6 +39,16 @@ properties:
>>       items:
>>         - const: apb
>>
>> +  interrupts:
>> +    items:
>> +      - description: Byte cntr interrupt for etr0
>> +      - description: Byte cntr interrupt for etr1
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: etr0
>> +      - const: etr1
>> +
>>     in-ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>>
>> @@ -56,6 +66,8 @@ additionalProperties: false
>>
>>   examples:
>>     - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>>       ctcu@1001000 {
>>           compatible = "qcom,sa8775p-ctcu";
>>           reg = <0x1001000 0x1000>;
>> @@ -63,6 +75,11 @@ examples:
>>           clocks = <&aoss_qmp>;
>>           clock-names = "apb";
>>
>> +        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
>> +        interrupt-names = "etr0",
>> +                          "etr1";
>> +
>>           in-ports {
>>               #address-cells = <1>;
>>               #size-cells = <0>;
>>
>> --
>> 2.34.1
>>
> Not sure if you need me to review this purely DT hardware description
> update but...

Hi Mike,

I am very glad to have you for reviewing, appreciate for your time.

Thanks,
Jie

> 
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> 


