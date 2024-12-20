Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A208E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 10:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhznmIQ872euCVjX9PvCB/YRGxvmR1KRYBeJuZw1uek=; b=wxORtUvToHN+HW2vL65dXQ8G+Y
	d2M+pOt291T391dXmm6d85QwwoZrmGQ5/7soOAbFPgHz5V5H+DRkeOqRBqn/fZdX/wFl6A7V2p7Xs
	lhRUQ3oSMMP1p+QSvkxMxnfvXSOyVyQ+iMkXsjTlRpINc0ayItNBMYQFxuqULpwfHIG6A+AzD1cRN
	rIx5bTuxlAfKIAqHN5yK3UijqxNlcllI6WLX4es21DYSJlEw3d0aESX+HS1bU2IAxJ/qmFk2YydhM
	gJJOUsXD26jLYSDBrz1z/pJkUCngH3VyTmH011c0kanQqUWW/xOt8l0m+6UmFCwFwrm0sy5ZU3/lu
	5/lIGPnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOa6h-00000004ZGc-3Tpa;
	Fri, 20 Dec 2024 10:19:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZuX-00000004WiO-1sMx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 10:07:10 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK7LiJ6029467
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 10:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AhznmIQ872euCVjX9PvCB/YRGxvmR1KRYBeJuZw1uek=; b=DCbTUp/u0UzUE86j
	U1AProRVEFOS3v5q00J6fMRNyuEYaPdl8FppQ3D1J8iUwSAF1dDGJQoHQQ2QyMMH
	In2RwZLDyqX8LED2z6LYksKsxiedZVDrLC66awmZ2Jsojq91gCCDfhOUU4DADOBC
	BuVhm3mHZpucAzigMmiDOTrTEUuDooGaQ9++q2XPmVytCyucOoR+iXPUEKfAnC5M
	e2lRR1ZyJ/jr3t0uEV7hyi7U3/xR48SkAI3j3kegiQ9AHpkvISoA4+zpWSjDGzvN
	P8j7e/oGveCGzNEFWfxO+cRODaza1ei/y/6Vx/dBAhupnXsqf/x+xi9wqj1wvAs8
	9Awd+g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n44fgffg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 10:07:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4679af4d6b7so4537711cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 02:07:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734689227; x=1735294027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AhznmIQ872euCVjX9PvCB/YRGxvmR1KRYBeJuZw1uek=;
        b=AqLdy0zpoDSSfv4VTpucajlsYe9VE3ZX6YDNFUVcn2+V+puhEabypzhBLYJPDC7d48
         KyPEb8jJIFOll2nK9sCfDMbTqGFphatF4Kx4S+F1a9Z7DeoIt5VsQjrUJ0Fr3+e7CRqq
         dJfE/X12qlapcM9QPLs28bTJ+M6weWqoAe82vWspRuUIWDQE/5Lyarg0lzzP218Al7bq
         l9waLGQScjnPyKZMSbjUb/WAAoTKOK8i77yCqBGu4ajh0myBgEMCXIwLmdVuUSincJZL
         IVvs+QWQ7UaCMhhI86kNmpyENyAsn6Av0Mr1ar0CQgg6SI+gIlBQGrqtj9k4StrwBurM
         BAcg==
X-Forwarded-Encrypted: i=1; AJvYcCUEEY8kKTAPNW5OQxNiOBmAIxBFrOg72WUz3+R2AK+d8IO8f5wVZP+x/Unw22pGbmHokG8AXGk07CtZjvei0EvR@lists.infradead.org
X-Gm-Message-State: AOJu0YxwZrfvMLor2joNXNnR7QIgopOeGWUmUQPFHZKTPLsyMzaNaRpp
	flVaXCYKEChYnXFtdThDdbpayu3sa93ftCrDJBnIESZdTxcfKM7Sm25Uz51gFgVzziWZjepWO6Y
	2OY1jT3ci95QSXajX/3TFIMiiK7IoEJAtDccP6nXUj6P/+nVTzgsHcmaZ3a353VooKsmWLAYwnA
	==
X-Gm-Gg: ASbGncsQr8zjmXffaTDw8VmIbIC80fNrE4dlNFAyX7YikfL0JnFybge90n7S3R5iM8j
	EBi/zFqLzt9sYR7i1bKhGBA2Ax5hHSXUSEb0VCSxGnxb9OFEM6Epfzx3NuVuXjDvRLCLZHECZJ/
	OHeYiloLYOTm9wK78ubE9DebcyIVEiywzY+NnL9CIAG5sZFDcvBzJubssfMhUFG5rJaoJ0h9shM
	8cNdS7nv0QiLlBDZ+csjCOMTAlIvmkI5Wi014DLYw/9ImQeVOwQdkL1TD5VYnuy4egI+kSKnBDK
	k2gJjudi+2/0Mw2mMsGRds9kQVr2tJWr598=
X-Received: by 2002:ac8:5810:0:b0:467:613d:c9bb with SMTP id d75a77b69052e-46a4a8eb7e3mr14253281cf.8.1734689227328;
        Fri, 20 Dec 2024 02:07:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFKrcZjN32LPENOthA5U++U9QRPl9Tet46R8uTtYFYSo6edNTPeFrDGQJlNVn7Sygo724ong==
X-Received: by 2002:ac8:5810:0:b0:467:613d:c9bb with SMTP id d75a77b69052e-46a4a8eb7e3mr14253101cf.8.1734689226948;
        Fri, 20 Dec 2024 02:07:06 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fed723sm1638648a12.64.2024.12.20.02.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 02:07:06 -0800 (PST)
Message-ID: <fb81ecb7-1ae8-4ace-9d6a-5954136d9142@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 11:07:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: Update IPQ9574 xo_board_clk to
 use fixed factor clock
To: Jie Luo <quic_luoj@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
References: <20241107-qcom_ipq_cmnpll-v6-0-a5cfe09de485@quicinc.com>
 <20241107-qcom_ipq_cmnpll-v6-5-a5cfe09de485@quicinc.com>
 <0776a26e-56cd-4838-9b52-210ae9a1f281@oss.qualcomm.com>
 <8063460d-18ad-4e54-8232-716bad9d37c3@quicinc.com>
 <2456ab36-f48e-4aa3-88e1-aeb7895c9816@quicinc.com>
 <fb9d117e-77bd-4a01-a738-f72d07f6b84c@oss.qualcomm.com>
 <f6930a4c-6d31-4cd9-a9ba-d6ff50e274e2@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f6930a4c-6d31-4cd9-a9ba-d6ff50e274e2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4KmAJiBv6jXJ-Ou0qi3NLMYlyLIfbf4S
X-Proofpoint-ORIG-GUID: 4KmAJiBv6jXJ-Ou0qi3NLMYlyLIfbf4S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_020709_492368_D9297B78 
X-CRM114-Status: GOOD (  23.65  )
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

On 20.12.2024 7:43 AM, Jie Luo wrote:
> 
> 
> On 12/20/2024 5:28 AM, Konrad Dybcio wrote:
>> On 18.12.2024 12:17 PM, Jie Luo wrote:
>>>
>>>
>>> On 12/13/2024 6:30 PM, Jie Luo wrote:
>>>>
>>>>
>>>> On 12/13/2024 2:33 AM, Konrad Dybcio wrote:
>>>>> On 7.11.2024 10:50 AM, Luo Jie wrote:
>>>>>> xo_board_clk is fixed to 24 MHZ, which is routed from WiFi output clock
>>>>>> 48 MHZ (also being the reference clock of CMN PLL) divided 2 by analog
>>>>>> block routing channel.
>>>>>>
>>>>>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>>>>>> ---
>>>>>>    arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 7 ++++++-
>>>>>>    arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 3 ++-
>>>>>>    2 files changed, 8 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/ arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>>>>>> index 78f6a2e053d5..9a8692377176 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>>>>>> @@ -174,8 +174,13 @@ &ref_48mhz_clk {
>>>>>>        clock-mult = <1>;
>>>>>>    };
>>>>>> +/*
>>>>>> + * The frequency of xo_board_clk is fixed to 24 MHZ, which is routed
>>>>>> + * from WiFi output clock 48 MHZ divided by 2.
>>>>>> + */
>>>>>>    &xo_board_clk {
>>>>>> -    clock-frequency = <24000000>;
>>>>>> +    clock-div = <2>;
>>>>>> +    clock-mult = <1>;
>>>>>>    };
>>>>>>    &xo_clk {
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/ dts/qcom/ipq9574.dtsi
>>>>>> index 8246a00a3e3e..25aed33e9358 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>>>>>> @@ -32,7 +32,8 @@ sleep_clk: sleep-clk {
>>>>>>            };
>>>>>>            xo_board_clk: xo-board-clk {
>>>>>> -            compatible = "fixed-clock";
>>>>>> +            compatible = "fixed-factor-clock";
>>>>>> +            clocks = <&ref_48mhz_clk>;
>>>>>
>>>>> This must be squashed with the previous patch, you can't introduce
>>>>> code and replace it immediately afterwards.
>>>>>
>>>>> Konrad
>>>
>>> Hi Konrad,
>>>
>>> Looking at this comment again, there may have been some
>>> misunderstanding. We are not introducing xo_board_clk in patch 4 of this
>>> series. xo_board_clk is a pre-existing node.
>>>
>>> As part of this additional patch 5, we wanted to address Dmitry's
>>> comment earlier in v5 (reference to comment below), by converting the
>>> xo_board_clk as well to a fixed-factor clock. So it is better to keep
>>> this change as a separate patch in my view. Hope this is OK.
>>
>> Oh okay..
>>
>> What's the difference between xo_board_clk and xo_clk then, if the
>> divider is accounted for in xo_board_clk?
>>
>> Konrad
> 
> Here is the clock chain for the relationship between the clocks:
> xo_clk (48 MHZ or 96 MHZ)-->WiFi (mul/div)--> 48 MHZ-->CMN PLL
>                                |
>                            +-->fixed factor(div by 2) --> xo_board_clk (24 MHZ)
> 
> So there are two dividers (fixed factor clocks): first for generating
> the 48 MHZ clock (ref-48mhz-clk) from the fixed clock source 'xo_clk',
> and a second for generating the 24 MHZ 'xo_board_clk' from the 48 MHZ
> ref clock.

Ok, thanks for the explanation

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

