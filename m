Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202ABD19512
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 00:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YR8JboXN9/6hwv7wNQ3EDN2O2tmeKpBTJemRHuPwNT4=; b=OBt0gqpvTHvVgwbc1uMm1/6Bny
	V82YUHaClWoIwlc5xGdsWJpryNwMefVJqyeMA6rglTtD2pK42Opjyu2VuHdg20vgJuw24SOiJYkaU
	D65hSPT3Dd2MlRuO38RnG3TgaR7Qekko7UFu/rh/WIXb4BdhlL99QRJEKPxvo8kG/95Kz5Xpg4B3x
	kzw8xKMHBnIO25X0cKLKzculjH1wPqQ57FpGABbEGoMTXa1223gsccCIl/J90dg7cmgfU2tXjDlLs
	xQX30zKJE+i0GX1Uwo/591ftkPGL4A+Pkr1mBgXLiy1/J1cWSLSi35Wud0eWZUQkZq4TCwYYzS1gn
	oglHmYtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkXQo-0000000DPbl-0eb2;
	Tue, 27 Jan 2026 00:59:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkXQl-0000000DPat-3BNy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 00:59:45 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgHSW3350523
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 00:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YR8JboXN9/6hwv7wNQ3EDN2O2tmeKpBTJemRHuPwNT4=; b=ADz6hDkVntfYmT18
	KiwcrJsszqZLU6xGG51/vwCq6SU8k81SJqrK2VPtYZtDaAihPVz3PtKZZHkOH+Zo
	mBsi7acnwjOOO/09LmhiOJhpbDTHIhiNhR9ZP4WSk5VnwV0ITmpKYkATrMoeYVyN
	1YUFC+c97P05zU1lnBNCa47wiJkQ0yq2mqqsOe+lu7JhKoI4/yTOrqHcuVy5bdhu
	UA3sDQWCjiSR3M/R6wiZFr4CaU6qPpdse7xPtf6EhaJSmKTgb9QQxmSEDFd0RXeL
	QWXAt8Iens2JpWSOkW4sfvWRTTy12wDZSyLPRYXHercdcwCISqtYMHR0ydO6HYwN
	DRxlMQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxcb0h7k3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 00:59:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8232bde979bso1050895b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 16:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769475581; x=1770080381; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YR8JboXN9/6hwv7wNQ3EDN2O2tmeKpBTJemRHuPwNT4=;
        b=RoEk04jpbSvMw2To9iZRW8BIpCmcu8IpctlJgy0O8Dn4godOVYbd0qMviTc1thizQM
         8VaAXOm1UhJbMsG1vhDOalf53wgVzK2Vd+D/v/s4aPrtHdPMJ+Qo0QwsO9Fl8KaBCXF0
         5A+trXDGDNE7xmi7v7bf9mb1Sd5o8q1dCaDyXFNx1QR/yRHgeA7sIVTUyLmsLMwqNb7R
         23dHx9DKJs6ZVhHC3rnhEPQRNnl+altoj93K/Kxot3BVEQQmquiUHgcZZ6vn/a1yS6j0
         Y5VscVtWfDh0cROtEvRPKG20ezx4Zs3kZt60gK5u8K91LCqbJdzT41+mgMxUrTiFxOkM
         nKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769475581; x=1770080381;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YR8JboXN9/6hwv7wNQ3EDN2O2tmeKpBTJemRHuPwNT4=;
        b=MpaAo+hEszYGUpGlVP/IRvJiEVvyo14T11ugevE+mfC4jj9PtgciAERLdUJfjcVvW+
         VvUFOfVVwNDgUsEpxAvPIir+uNUkmLaIb/13L/XIGld7EL3tbZYfDjck6amL7r7gCjD8
         Z5sYGI0hh3zfIFsWuUlVU1nY6u0hOtpx6Yd7ll69+VGNvlJazmRl0MxerVyZeXUaRaKO
         kIA/YysGwsK1V9y0flVOz/NI/uqj5BUdWyTB5GQaDK67DbFKXSl7MmgtS7VdqQmmvA5m
         jJpG2p8SPSf93NfxzQLddEwwBiu0lJwMA/fM77dv7EPBhK0yTInfDZBECJ9VZQz1DQ3n
         4iqA==
X-Forwarded-Encrypted: i=1; AJvYcCWPSwYDsWT3/Gpx3EdFwalQWxgGhPoXILggsCeADu6U+01MDKf4SBtKIlCA+OJjytQsZGmVWca1jD/7r3PVDtHe@lists.infradead.org
X-Gm-Message-State: AOJu0Yyiude55r6kjO4QlLuG7Ip9LPk5N7xsdNcDOtAYR6WfcuC1YiL0
	kOOyDg3sZwWNxawF91SDcuYd3nX3ozt9Pj3AV1C5Rn4yIjMw8vwKHhNwMOndRKrnJGCWbV08CRR
	RzOQo7qMasaS3FeZrPlBN5hkwq7K/BRfwSvluyEW+VUT76sCPO5sbf2iPuL2YBQApLQQgITZ/4k
	XlBA==
X-Gm-Gg: AZuq6aILnzo/I0LPz1UQEPqnj8lXQ5Zlo+BiRjMwkGWix7JJjKO0q5/PdgIiLhXIhVb
	f1EOVwdSwQNiEfvmmj5fEOpQqevG+TQnGPRAnQVMXKSVW45CwEcy7ksqkn21CsbGZNCbPTjhh17
	UDct2aw/xRixmlhQGpPujnUphN72122vlyiK2IejxP8SUDSR6YSZcerbTfVBxABdfIEV8hJLh0V
	7DCeZP/Q6nLTNmiMWDtaUKHHnjqXtKLZxXi4+c1aXIOzCPBqXRSEhoQaqGMcJvjBi7AQLkCDFBg
	sOAidmlUeDhM1CbMO6jyuwTNYeVI4NXxrYVbb5nsKs1FcCKwFrWLUoqicr+x3IILxhlrjE2Wy0o
	braTd/6vePEYS8Z/VkxIyzSppEoF5HCbFSAGcDj7bVS7kjoo6luq017+O5Ht2Mj6zek/nXbw7II
	I=
X-Received: by 2002:a05:6a00:1495:b0:822:abcd:db0f with SMTP id d2e1a72fcca58-823692c3b99mr99315b3a.52.1769475581300;
        Mon, 26 Jan 2026 16:59:41 -0800 (PST)
X-Received: by 2002:a05:6a00:1495:b0:822:abcd:db0f with SMTP id d2e1a72fcca58-823692c3b99mr99287b3a.52.1769475580837;
        Mon, 26 Jan 2026 16:59:40 -0800 (PST)
Received: from [10.133.33.228] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318644bcasm10356570b3a.2.2026.01.26.16.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 16:59:40 -0800 (PST)
Message-ID: <49e38ec0-3ad8-4808-9488-46d444a52211@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 08:59:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
 <20260122-enable-byte-cntr-for-ctcu-v10-5-22978e3c169f@oss.qualcomm.com>
 <cd175b3d-d8d1-4efd-9698-80a6c238d819@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <cd175b3d-d8d1-4efd-9698-80a6c238d819@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9J-S4I1lUTibmB5hJNFqhmC4rUz4yMTK
X-Proofpoint-GUID: 9J-S4I1lUTibmB5hJNFqhmC4rUz4yMTK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAwNiBTYWx0ZWRfXx7ARklRbq/U6
 VC7y+mqijPg75ucr2V50eIPU7XzH849KLIiTxxAqhmunIqsckqqHabBHj/MYMun1si+M9rjyTVb
 h3E1/kzOBDwZ4gGGuMB0jAERpSH5WCw5pSCRAmQwohuKGgMOuK5UyQ19p/PaKv0qeSFw4+Wx7Ci
 zyfW7lNOL5FYzkkOh8iBr5pSOrMb8X7vSLjRKM84pCIcf89OBHmN7drZxrdL1G96qVToFrnuBqx
 M3+1mGvDWbkDkrDennlXWBY1Ymk2p67X/j066A4K0nTCXK9IEA3Qy6gxD51EXGeQqnMO8GVAWky
 jFll4TbfybqOMwvqeRi/feFpA4xZNsKvnPPYEGquwUC1SKWATNJAevYB9DWoOjBIxyV0hlM2off
 mZFP00mYNHacRNefFf7Exk96ewlm2KOsAQwZQn36Vo4t3pasJ+jhg3k4+cdV6eDJ426WLKqyrwe
 jPArr3HI+OSGbed5/Lw==
X-Authority-Analysis: v=2.4 cv=IdyKmGqa c=1 sm=1 tr=0 ts=69780dfe cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=SkUS4XPTP4F0jhogtscA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_165943_940982_5EFD047D 
X-CRM114-Status: GOOD (  18.89  )
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



On 1/27/2026 1:22 AM, Suzuki K Poulose wrote:
> On 22/01/2026 02:08, Jie Gan wrote:
>> Add an interrupt property to CTCU device. The interrupt will be triggered
>> when the data size in the ETR buffer exceeds the threshold of the
>> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
>> of CTCU device will enable the interrupt.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 
>> ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight- 
>> ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight- 
>> ctcu.yaml
>> index c969c16c21ef..ac27a8b89085 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> @@ -39,6 +39,11 @@ properties:
>>       items:
>>         - const: apb
>> +  interrupts:
>> +    items:
>> +      - description: Interrupt for the ETR device connected to in-port0.
>> +      - description: Interrupt for the ETR device connected to in-port1.
> 
> Is this all the hardware supports ? i.e., can it only have two ports 
> ever ? If not, why restrict it to two ?
> 

The maximum number of the TMC ETR devices of the existed QCOM platforms 
is 2. Per Krzysztof's suggestion in the earlier version, I limited the 
port number to [0..1], so as well as the interrupts.

Thanks,
Jie


> Suzuki
> 
> 
>> +
>>     label:
>>       description:
>>         Description of a coresight device.
>> @@ -60,6 +65,8 @@ additionalProperties: false
>>   examples:
>>     - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>>       ctcu@1001000 {
>>           compatible = "qcom,sa8775p-ctcu";
>>           reg = <0x1001000 0x1000>;
>> @@ -67,6 +74,9 @@ examples:
>>           clocks = <&aoss_qmp>;
>>           clock-names = "apb";
>> +        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
>> +
>>           in-ports {
>>               #address-cells = <1>;
>>               #size-cells = <0>;
>>
> 


