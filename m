Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEAFD64099
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 09:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k5eSqAi+UmVzEQJzPdvYOyZ8r83jZpTMhH6t4IKjvyc=; b=akeS0sxfpOns/uwSTgC677D7Lz
	9bR7e2iDPHZwCFJw5GXEzV7W9cv9mHkOMqpuSvyPXsTLGGGmsS44uTdP48WphxVYW1WxtPa22TZzr
	t1W7HS9q589XLWjDdhKr9+vcHyXkqjgymyFZwNkqCX/FXNoH3GKvFsYTxkM17FYdPALDXpddaxB2B
	Dl1NxrFnL39fOSplmrQtq8yHhj70lWnQIuMHtzm7oxoy4XSv6Z5fjD5+65P/zEsGrjhIHQS5GGSKX
	co5sA5hajocKTQd95uxXxclzghBK10vLHkn0EkQLdZZl/tOP1leSBeVmh5/QpWKbnf8Lr6SP05LIL
	sViMfiDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVntL-00000006PwA-0m3W;
	Wed, 17 Dec 2025 09:32:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVntI-00000006Pve-3iMv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 09:32:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH86Riu1946768
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 09:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k5eSqAi+UmVzEQJzPdvYOyZ8r83jZpTMhH6t4IKjvyc=; b=W94gv6xWyx61wULt
	Ek1YjlEgwrMYRchM8lepWXGvncaTCf0L5BwyIPWatQ/g6dGbx2XEvGmhcQcIYVBo
	KsXcUGNe7ZiOAkckuVJtN3anaiQUw25cnP336Ey51ctNlSxxpBYke9O8AhxUSCSO
	qZbG2N6+DVOrSSLPMVkbqvWsmxM375FhNbIIclSVfu/xnCcX/mq7LFQWlXAJUli2
	xRmoE0T8E9LbOtZFJtdat1WMezMqQXmY9mYbpaW2tJ6b2RbYsAkqfq5z2fH98nZw
	8ehJU3EC2T9vfybnwZ5ECuwlcblQVGdpusc5JppVI9sjYe+r6aviOl3C1nVLfAX/
	b06H9Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3rqa89up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 09:32:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34cc8bf226cso3995231a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 01:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765963935; x=1766568735; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k5eSqAi+UmVzEQJzPdvYOyZ8r83jZpTMhH6t4IKjvyc=;
        b=UMog105vdoqxzLAYddeMhWrG1B18NC9N3BV1f3YC+YzoQFGRxHdntY2NRt7a7fDWHo
         ggTjCIeCvIDw5qxSnQiPht1CStp713wi04jnQdNckK0lI/+rqGMhw7mncg5XgmSR5UYH
         R1tfXH3PJ0fo29uz2rntA6X5jMMb9WBQ+YJt96UqgfCetxRDyezUzslsJndVM69DB+Rn
         zLYAzkyKi5XNHw5XTxtwremM7e5gVp3d8cAfiT6rPCTtoXgP/r3793GnC9GZGlSA9qGi
         IlWrRuTW6bJ/S1r8xtbhSS9jx3ijyZ2CWSDn3BID/hOOtnoHRcpmnqTEx7aTbGZ2RC+p
         BP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765963935; x=1766568735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k5eSqAi+UmVzEQJzPdvYOyZ8r83jZpTMhH6t4IKjvyc=;
        b=Azf3CO7P/ArdufSFbsVsQ3JSyvdK26MI9+MIwhQPa2gMXhqupwKaz/Bl6vtpjsTse9
         dROTj9EAsZ1UH2Qrpp+13QjQZkT1zA9ec3jWZcInlclxPlg+kUWh6/B9Dv73eqpFPeIQ
         hInITsSFg48jBEfXW/r1te0NCnD9xNe5x+7VuhAs2Zyvgg2CMuPneiwiotjyrx1F0dza
         JexGk/fw8JjvTo/AnNj1APVt8CwHC8k7cAci45/XlB2MDO0VPh1EwEGFbyK4CHFoBCOS
         PS32jPE81bvtxlRmJUvwS7pmFWeeULkDbArhXqDyG0z+L0cen3KcpTKEPeCZy8Tmepvv
         8MUg==
X-Forwarded-Encrypted: i=1; AJvYcCWBVHiUEM7rd8jATIcWhL6WK6rtMRUUIL0ideTMazrz4JMc6LQvR8LmTMwmtay5Gl5q3q/n2GG4Mce5fR/2ysPt@lists.infradead.org
X-Gm-Message-State: AOJu0YxyyG6gttPKfP/j7NAZr2hOFkzCgw0ytdBOEVJ3Y4QLsatmoqJ7
	4yG+FwbMRW+AJn4sZwkMsVD57w8ij3zhjfnfBhAajCU23gEqaey5r+P/GNY9NIaRN0JCErQf1ql
	1bRnJDSvBQNWh9CD5LeL+ZsRAficJZZaZmd/1uNDvfFlOWbyl7gzK6BCIzuoyuy13+SNQ5iPI8x
	m+1w==
X-Gm-Gg: AY/fxX6A3X8wIIMvNspcxn1QXbArIT2lnQthaw2cIGLo9oCAFVd11FxCXPwOL7ueiia
	xMyfjCtogztlSlfB7H8Yfx2y2YcUxBGfnLrz62tYXAjcG9wRuZ89517TRpm8CnmJ3pOI8jCxugi
	r/vhYPh5XRvKXvV11m2Xrsx7i8KlxF9vrJDVBNM4ydD/OWPVCl8flljEKwG5Nf88PKUrUdM/9ja
	ZHAz+8S7bwq/G0xAsQOEoRkJ/PRI1mIQqkEdY3QHV81qub51YfXATQnVWqOFeRc/kSyeeCrQ31R
	tlmFjYkKNc5hKrfDp9Ibk8vLjhuaLHi0jmTGxGWJZ73oR5zQ+Hi5Uv9OGECM5D6PQi9Q3Mi+rIk
	BuILUQRV3DDUnMApTT6bCjZmcWViTLu941S8d
X-Received: by 2002:a17:90b:37c5:b0:341:2b78:61b8 with SMTP id 98e67ed59e1d1-34abd75b84cmr16118275a91.20.1765963935258;
        Wed, 17 Dec 2025 01:32:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2IAzyeAsxmbkCnxnu4u0xxCDf9pVYnBNLb9NM9pOCNAkCdEN4BEa2l81OARdkqZ8OLtxezA==
X-Received: by 2002:a17:90b:37c5:b0:341:2b78:61b8 with SMTP id 98e67ed59e1d1-34abd75b84cmr16118239a91.20.1765963934714;
        Wed, 17 Dec 2025 01:32:14 -0800 (PST)
Received: from [10.218.35.249] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34cfdc607c0sm1774392a91.12.2025.12.17.01.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 01:32:14 -0800 (PST)
Message-ID: <503f445e-0d12-407d-bc77-f48ad335639b@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 15:02:06 +0530
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
 <de44560d-4ed8-41fe-be7b-56412b933a8c@oss.qualcomm.com>
 <fbe39eac-7c92-4a08-bafb-31e5c51a0613@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <fbe39eac-7c92-4a08-bafb-31e5c51a0613@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1HdxHiz0qNGElS2mjJwo671EwLA8CeJD
X-Authority-Analysis: v=2.4 cv=ALq93nRn c=1 sm=1 tr=0 ts=694278a0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EdL18t7L_n9XgEVTQngA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3NSBTYWx0ZWRfX9z3tQSlKRB3c
 NUB7xYH42XUQ6YGcqEOF0Zu8SWAl+vIeOJbr7QgDDbTV0TRExFxETk1yGDkQARTyBN8Q+eOVc6t
 +5gmrmWhi40RZ6e6V+mnMP43Zlw0NqGT5VIPMJkhdqepOAkvXmrMjvrIjl8AN2mlZGmRuRcVEye
 AcnLMfImuXk/GQHG4X6RmvSdZ/3LeU40fZqNCJcoeS82qm9WTDvWiW1ExFMU/Rpx4ypBPmfpWCR
 O5+fptAnQSjHok8GuFN722rzibL9BMZ1aHCP6OO+lizFTU1UeC9LmlGJNTiqpc3QDtZUaSl6CE1
 Xy/TsOHjWYohcDvobYTjbVnCU+ufowpcfRsLL6sInf8yHEbS+GM63YIFLi1YgnCFTgIqXOCQNxk
 2jeKbIZoLpshxrMzcQJpQu2TOOCBuQ==
X-Proofpoint-GUID: 1HdxHiz0qNGElS2mjJwo671EwLA8CeJD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_013216_934435_B1C2F8BB 
X-CRM114-Status: GOOD (  24.10  )
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



On 12/16/2025 2:21 PM, Krzysztof Kozlowski wrote:
> On 04/12/2025 07:49, Taniya Das wrote:
>>>> +  power-domains:
>>>> +    description:
>>>> +      Power domains required for the clock controller to operate
>>>> +    items:
>>>> +      - description: GFX power domain
>>>> +      - description: GMXC power domain
>>>> +      - description: GPUCC(CX) power domain
>>>> +
>>>> +  '#power-domain-cells':
>>>
>>> Power domain controllers do not belong to clocks, so this is:
>>> 1. Misplaced - wrong folder
>>> 2. Probably wrongly named. gxclkctl sounds like clock controller, but
>>> this is domain controller?
>>>
>>
>> The GFXCLKCTL is actually a clock controller which has PLLs, clocks and
>> Power domains (GDSC), but the requirement here is to use the GDSC from
>> the clock controller to recover the GPU firmware in case of any
>> failure/hangs. The rest of the resources of the clock controller are
>> being used by the firmware of GPU. The GDSC is a clock controller
>> resource and modeled from the clock controller drivers across chipsets.
> 
> This should be somewhere explained.

I will capture it in the binding description in the next patch set.

> 
>>
>>>> +    const: 1
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - power-domains
>>>> +  - '#power-domain-cells'
>>>> +
>>>> +unevaluatedProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>>>> +    soc {
>>>> +        #address-cells = <2>;
>>>> +        #size-cells = <2>;
>>>> +
>>>> +        clock-controller@3d68024 {
>>>> +            compatible = "qcom,kaanapali-gxclkctl";
>>>> +            reg = <0 0x3d68024 0x0 0x8>;
>>>
>>> Keep consistent hex, so first 0 -> 0x0.
>>
>> Sure, will fix this.
>>
>>> But the problem is that you defined a device for two registers,
>>> basically one domain. I have doubts now whether this is complete and
>>> real device.
>>>
>>
>> As the Linux GPU driver requires only the GDSC, I have mapped the region
>> which is required by the clock controller driver. If required, the
>> entire region can be mapped as well.
> 
> Required is to properly describe the hardware, please read writing
> bindings doc.
> 

Sure, will map the entire region to be describe the entire hardware.

>>
>>>> +            power-domains = <&rpmhpd RPMHPD_GFX>,
>>>> +                            <&rpmhpd RPMHPD_GMXC>,
>>>> +                            <&gpucc 0>;
>>>> +            #power-domain-cells = <1>;
>>>
>>> And cells 1 makes no sense in such case.
>>>
>>
>> We would like to leverage the existing common clock driver(GDSC) code to
> 
> Fix the driver code if it cannot handle other cells. Your drivers do not
> matter for choices made in bindings.
> 

As it is still a clock controller from hardware design and in SW I will
be map the entire hardware region and this way this clock controller
will also be aligned to the existing clock controllers and keep the
#power-domain-cells = <1> as other CCs.

>> register the power-domains and also maintain uniformity across chipsets
>> and consistency in consumer GDSC phandle usage.
> 
> There is no such consistency rule. Don't make up your own rules.
> 
-- 
Thanks,
Taniya Das


