Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAC1D1D870
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 06:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JmxQysCR134n2X2yxpyzNPSzsppqGu72HHKjpEfLnis=; b=xhCvGqh5o5ZipDz9M26C1x8c3A
	zhQpOvWhfV6sbMlZFx8sGiV/4boQoZCITh/Ar9MbiuwAPYhpRIDNozWq/3IU9uThitwXHtX9UXfye
	RerrUKwt3g4ndmToDcFVcbi3eldhXryYrzoEeO67bG42hdZJ/UQ9YIKVN1t+UAGuh7ftWvw4eBBDT
	spMbZIOuKozyJtTX/dxoJEJ06HrDyZSo4AXWTk4nReWGXfRldOGM0za5jPS9LlKQMS/b3h+Kk0i6F
	Xis4gYEKRseAzNB7S9efq8FRVksdhHmmddzuSwbcqVH9HHa8ffgPnKrCmaLJtakjeFERLE+oanP3D
	IDV/3QLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR39t-00000007aBw-34LO;
	Thu, 04 Dec 2025 06:49:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR39q-00000007aBZ-36MR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 06:49:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B468vaF133335
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Dec 2025 06:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JmxQysCR134n2X2yxpyzNPSzsppqGu72HHKjpEfLnis=; b=nEbNRvz3p6bWvbuz
	zIVmKDC76NjnOBKZIurOuqhCfda/Ts78YN8JAzPecRnMrO8cFPPf2Pwy6K8iqK6K
	VhVop6n2h4dfB7Fe9lSnPJlfJdxeiukr9mxMniq2djLwY5C62SPIyKIvAVTJ6Vwt
	DNEDrUw/Oj/KMQaqhMp1n9vModfHFXj/DgQIyfvJtnzGlG+BP1Y3PlmcnoQyWNNZ
	EPrQ5KDidEL/mE39n/kHwWw86JH2wB637uGrLj8evMf7DYDrRjSTJ3gNUr9d819Y
	53fapIOGp4InouwBBNhbmJsXuWQtulYCID9Flug3jcRE1fxfqsbsKKuNsc74Nsib
	d3Sodg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm0hu6gy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 06:49:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-295592eb5dbso11691575ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 22:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764830978; x=1765435778; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JmxQysCR134n2X2yxpyzNPSzsppqGu72HHKjpEfLnis=;
        b=JoxNFdi3Stx1zB+TswgMGp4SLfyb4f1FkvG4qC6ewJIdJoFwvgs2vO/gfc/mWYw9Yv
         75cMrstjOGVWCzOmA92tDyLC3bEK7e7hnEY9qXBuDaDfyEV/H9n4DTNeCOdentZGPyg5
         pxK2OfnqtQdewl8ucl66ExIGRHKUXHiGo5oD9/EugoijjX3g2O9euF3eiWBZoCUH0lo2
         mvkJ5nAR/1nrtRxKcFPGrPSdP8m+QrLjbgx/0xEfRKYCHG250AVBR5/UW2TSzafyyr8e
         8Sx9rpELmAhBr904sN+qj/VTbcCJl4Mq5E4xIYbEJr0j1fLzjH0Wb7SEYdNyKBjAdpEc
         Y9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764830978; x=1765435778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JmxQysCR134n2X2yxpyzNPSzsppqGu72HHKjpEfLnis=;
        b=Dq4bgselJm3b433B5Ub95BcxS/IA4OjaUi8+oYG07klf/NSL2sIP8PB5juvNcgZivZ
         zUltogBPKUSwZzcjOVymomjwQj4OPVUNVpq28uKOOWXCHHo2zKbZGFEbH5tp2qCPPW02
         UyeBsfRvnWaaS3G0kLaPY7ay5ePSaLihEynO1FmxnFvp/nspzjijfVFhTKpxPgEE/ITP
         1zviegrI+lQ13qi+2+v3eb49Ahymn43PoV/kMqPyPpqAnRhD5s09yPZxKfCPQeL67daG
         psev75QtVbeeZa9gc6xkRPz6J0yvtO0KcWW+H7BKPcln7PUYLIYUps0MyHzw66W+3fBO
         lxXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeO77Te38Y2SyjZHEodl1grjimCxiR2pI3gr8PxypcP0OddkRgat2TY48t1OWlSc6wzS54WUTdGoZrkJ95cKiF@lists.infradead.org
X-Gm-Message-State: AOJu0Yyfj2VJJoLuPbtkIsnXyXiYNqS6MnymO1WWG9zQwzm/ixlhVxM5
	QBfvYgUcupJxVkgcZzUr2DMKgbIey5342VsBR8aS2ZyLTtdh1z6gz8LvFupCZF+Dcd3OrMR/kPr
	eNPHrLHkvrk9KtPzrqew8Y+UEG71Y0qlbuDmUVAbPbPu+kL5Q8wdDh7ORtV+dh9DA4XMK5D2u1Q
	U3Yw==
X-Gm-Gg: ASbGncv5iGIikZ707U2xphB3WocyL9MQ8k7QlWgLuaZLDgShDYI+uYE70co79eHHS+n
	dd+RAwoZBa9dTRSgKm1WBSq3Q8V9X6dC1HPjfjQf+ldti431K2ntu1KZT4Bq3AKj5N2PptI7LaS
	XOLTMKPBgeA9zIpuFr/AQ9Q0kQRWw+JB4ddY7VWTtnyd9+0oNcIK81tStnPisMTbKav81kXIvDk
	ddTRqnrJBhUJ5u4EtEw3UlboWgJ9hQWrzJp4FDfqvsCs4x8ko/RH7QeKAUh3P6kyqhUVgwHZ0+f
	3pQodzMo1phfmcmv9P9Ma6R1tPhm71Z2rRtDQgtRnyWpl7S4BMmzX1XZ714Mh3p4URQv/2FaH5m
	mCJMNlVjAZYgV0GU+Xn7/gVc5jncfM9PFJO7/fQ==
X-Received: by 2002:a17:903:3504:b0:297:df4e:fdd5 with SMTP id d9443c01a7336-29d68374edcmr58468405ad.23.1764830977703;
        Wed, 03 Dec 2025 22:49:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgbdk7irsBvw1LZJUA0OWs78tPE68m1BrsOGzvi1/Vkcfye2t+5+TQ2h6idk9qPOk7MkUtEg==
X-Received: by 2002:a17:903:3504:b0:297:df4e:fdd5 with SMTP id d9443c01a7336-29d68374edcmr58467915ad.23.1764830976979;
        Wed, 03 Dec 2025 22:49:36 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaac16fsm8526875ad.87.2025.12.03.22.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 22:49:36 -0800 (PST)
Message-ID: <de44560d-4ed8-41fe-be7b-56412b933a8c@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 12:19:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] dt-bindings: clock: qcom: document the Kaanapali
 GPU Clock Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-7-fb44e78f300b@oss.qualcomm.com>
 <20251126-elated-stoic-scorpion-25b630@kuoka>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251126-elated-stoic-scorpion-25b630@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NP_xozQAJQNxFclQuMQIIz5OPzl2B-wF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA1MyBTYWx0ZWRfX5Xi+m4dy9Xa6
 7A1t/PVBC9MaPiWrTFEejgo5J0Pjyw0cBn+svwpdG++qE08m0gnJkF73KlxVNslQpRk0IpPFJBT
 WBEBCLH1wUkLk+blOxeaZonB2zeLmVsII9qV9TpXBG81720TQzwyISFmweMO79cF/Pz+iudAbZ1
 pNb2q9ypQy71tq6/WuTUj3Dr3yZOdE3SC7cKH1TTZK9HQhf0Ahb/s+Wedn6kVtzC+0/vVTAFUJ1
 n+u1kMociwDFfM6v6h6TAE1EU/n4/iuplfPoTUIZyQg6bELvEPs+6GDCffdXA5s6pKTgvs0+FvA
 ifHZWiIfDBkhtUR/qjYqrvb3mwUyiRRsznoF+J3vXVPeilA974bbtNAID6JnqFGduaTN4t6bBI7
 +Exye4ct6msSdOvjzkt388TuRTmtbQ==
X-Proofpoint-GUID: NP_xozQAJQNxFclQuMQIIz5OPzl2B-wF
X-Authority-Analysis: v=2.4 cv=V5lwEOni c=1 sm=1 tr=0 ts=69312f05 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=llZtH8EMZHlCI_xCz4EA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_224942_814307_95A035F1 
X-CRM114-Status: GOOD (  29.10  )
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



On 11/26/2025 3:05 PM, Krzysztof Kozlowski wrote:
> On Tue, Nov 25, 2025 at 11:15:16PM +0530, Taniya Das wrote:
>> Add bindings documentation for the Kaanapali Graphics Clock and Graphics
>> power domain Controller.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    | 63 ++++++++++++++++++++++
>>  .../bindings/clock/qcom,sm8450-gpucc.yaml          |  2 +
>>  include/dt-bindings/clock/qcom,kaanapali-gpucc.h   | 47 ++++++++++++++++
>>  .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    | 12 +++++
>>  4 files changed, 124 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..31398aec839d88007c9f1de7e1a248beae826640
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
>> @@ -0,0 +1,63 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,kaanapali-gxclkctl.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Graphics power domain Controller on Kaanapali
> 
> "Power Domain"
> 

will fix in the next patch.

>> +
>> +maintainers:
>> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>> +
>> +description: |
>> +  Qualcomm graphics power domain control module provides the power
>> +  domains on Qualcomm SoCs. This module exposes the GDSC power domain
>> +  which helps the recovery of Graphics subsystem.
>> +
>> +  See also::
> 
> Just one ':'
> 

My bad, will fix it in the next series.


>> +    include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,kaanapali-gxclkctl
>> +
>> +  power-domains:
>> +    description:
>> +      Power domains required for the clock controller to operate
>> +    items:
>> +      - description: GFX power domain
>> +      - description: GMXC power domain
>> +      - description: GPUCC(CX) power domain
>> +
>> +  '#power-domain-cells':
> 
> Power domain controllers do not belong to clocks, so this is:
> 1. Misplaced - wrong folder
> 2. Probably wrongly named. gxclkctl sounds like clock controller, but
> this is domain controller?
> 

The GFXCLKCTL is actually a clock controller which has PLLs, clocks and
Power domains (GDSC), but the requirement here is to use the GDSC from
the clock controller to recover the GPU firmware in case of any
failure/hangs. The rest of the resources of the clock controller are
being used by the firmware of GPU. The GDSC is a clock controller
resource and modeled from the clock controller drivers across chipsets.

>> +    const: 1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - power-domains
>> +  - '#power-domain-cells'
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        clock-controller@3d68024 {
>> +            compatible = "qcom,kaanapali-gxclkctl";
>> +            reg = <0 0x3d68024 0x0 0x8>;
> 
> Keep consistent hex, so first 0 -> 0x0.

Sure, will fix this.

> But the problem is that you defined a device for two registers,
> basically one domain. I have doubts now whether this is complete and
> real device.
> 

As the Linux GPU driver requires only the GDSC, I have mapped the region
which is required by the clock controller driver. If required, the
entire region can be mapped as well.

>> +            power-domains = <&rpmhpd RPMHPD_GFX>,
>> +                            <&rpmhpd RPMHPD_GMXC>,
>> +                            <&gpucc 0>;
>> +            #power-domain-cells = <1>;
> 
> And cells 1 makes no sense in such case.
> 

We would like to leverage the existing common clock driver(GDSC) code to
register the power-domains and also maintain uniformity across chipsets
and consistency in consumer GDSC phandle usage.


-- 
Thanks,
Taniya Das


