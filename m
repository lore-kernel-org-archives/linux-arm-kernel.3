Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851B2C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 16:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhpcGE0kY2U2qHSOUrNH4gIXVYCbpgzCRlKlqKyiksA=; b=iXPcygXzrQ9ywUNGPW7vPdzZiR
	k8spn0NdrfulZSPURmwk+e9vlzSeaAyxe3wlMtvq/e/ex4EKc/oOmclon7iYTofOWwiHXNMfrVk4A
	7MB8TbozY3PBH+IhKApHR1AI8ST1TpXnbHAQpngAK6nexxUdu6lFIN5lgMLOVEul3fvi73ig0Wqmo
	Vrtq/oUhF0KPmkCEEuk69tzysBSqiY7mWSL/cx8VRngBlzeJXfFYdzBhdRwiX1OqW4rDS9pZhhwr2
	Ashi540I5J3mDtffYIFmqkjNYnUdQMTDsQA6/lYQyJTPXdzmCtgst6mDZ3YqtxJ2cADJF42FHyY6O
	ggMR8mgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBus-0000000FGE9-0xp7;
	Fri, 27 Jun 2025 16:27:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVB60-0000000F7VO-2Lzr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:34:33 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBZQsJ014635
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 15:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fhpcGE0kY2U2qHSOUrNH4gIXVYCbpgzCRlKlqKyiksA=; b=ZIh7/9dPTaRIKAbz
	qtcRTfYJUmfDMD/1CB8sEgyGGumkjtTwe+1FCskmH91irz9aLvC7+w8nrjV0yIl5
	QB0xqTRmG3P3Ft7yR9hK7RMWZYwi2POUq3sly/dUJ48WJWKJ9oC/oYfZUNb7O7vm
	LRWccN5ciTm5RhWLpEa4ACEx19S+i4nLKISatypp1vBgmGk4bGCx72jy9YNPJfE0
	o0qY4acjP6oYf70tubxgG7+gVbaXm9gWVcLv0iapLnGrDbi7elYbdiW8YQARPy4E
	GwNMvpxwKqqfzTXYEUxP9yi+/mXni1WFKeH7ELAXBg4/7DE74URNzH7E2BxvGiH2
	99Dl+w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm25wbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 15:34:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d2038aae69so3721585a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 08:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751038470; x=1751643270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fhpcGE0kY2U2qHSOUrNH4gIXVYCbpgzCRlKlqKyiksA=;
        b=wRkgW9r0Zeef3Fc4KokOcgIJ72wmzuNmPhRs9JL/xgI1xEms4Kv/WV6F2YEWomUtJs
         e8DBsKxtdoFq8UDXlaXkeox0PxW6Gr1Vt0YvS2xhSTJVypZ3rAmUJph9V/pebNaSl7gR
         hkVE2vMAEe+XubSG3s617KPxDrhUgvGaCth6MY1eMQ9VhKeRE2QLmr4+Kol6ETA903AF
         kl/By0ORGQ1LYIoJgeMGyDjFetT7N6uQyc43u7/vgL+e2+HcZH81CI5OkUzp/vkCOSkT
         6cuzkTVJARij+sb8rlw9Ne4gmSZgoONJaanhBQgotEbXAO1RG+BNuSl3H840NnlGbdll
         Lhxg==
X-Forwarded-Encrypted: i=1; AJvYcCXARvCMTPV3QfJAXnMBIqBdsLZWroTFTlMZiB1EudivDnHEZLFSlK9UOeW9YgWlFUNQ0wDcXRUjBz4ldRPtWwsZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzYyg/OmeGPFl9YGZnx7DXtiZ0Zb1J7eThHJIEVFbp+LhbjOR33
	yUO1fnHlcRoBvV3ql/a4rlxPQ4G+c104P8WShnT5O87qO6Yqp4f9mbxA2BuPrVVUbwVNf0c7wp3
	KKa+aeIwa8xCJIYfA8D/W1IJkP0GCw+26g++KKQqORg3nRLInwVIR0VpqvX3+RRiHN869pHKkaX
	wM0g==
X-Gm-Gg: ASbGncsu9qAYTtCpvvyLhT96XDmsg7D8Roqv5tf3lFHj2PafjX/8/xlZReZiJy3AIt1
	wenOshagWd6M/aItPzLxIG13ArP+xEoUJZbbMX92kp4NS9EWXswsGUc69KkT3/V4Tf8of2ZlojQ
	EjBzJE9qvd4BgBTjilIdwO5zFXy3M0adL9NiqYMxx/fLPDw7DamaiBC0ar6SBOy4Mp1A0yYrc47
	j9B6q7mgOH3VF1+e+YDxWRfFezeSwh7jZ/vBrmaCCXUnyWiC9hvxoq7hdJF3dord1CB89sMNEJl
	PP9EVoiwInttPYVFAQcouDV5O2HfO1F4ZzfOU9FnWhHD0xNYQfd0uiLxRHk/dRHmkPicQ1nwyHq
	uYtA=
X-Received: by 2002:a05:620a:4390:b0:7c0:bc63:7b73 with SMTP id af79cd13be357-7d443966417mr201232485a.13.1751038470179;
        Fri, 27 Jun 2025 08:34:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzOTtjkZGz3phOnalpunb7y20OgdgwVxcjlA9JNDAl2YYT7eAuxSBmhUwNsqtuPUIJtvAnnQ==
X-Received: by 2002:a05:620a:4390:b0:7c0:bc63:7b73 with SMTP id af79cd13be357-7d443966417mr201228685a.13.1751038469653;
        Fri, 27 Jun 2025 08:34:29 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b244sm142288066b.30.2025.06.27.08.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:34:28 -0700 (PDT)
Message-ID: <3fbae47b-d20d-426b-a967-b584e32b8c6e@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 17:34:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] arm64: dts: qcom: Add The Fairphone (Gen. 6)
To: Luca Weiss <luca.weiss@fairphone.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Thomas Gleixner
 <tglx@linutronix.de>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-mmc@vger.kernel.org
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
 <20250625-sm7635-fp6-initial-v1-14-d9cd322eac1b@fairphone.com>
 <4200b3b8-5669-4d5a-a509-d23f921b0449@oss.qualcomm.com>
 <DAXA7TKVM4GI.J6C7M3D1J1XF@fairphone.com>
 <6d4e77b3-0f92-44dd-b9b0-3129a5f3785b@oss.qualcomm.com>
 <DAXEA131KUXZ.WTO7PST1F3X6@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DAXEA131KUXZ.WTO7PST1F3X6@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685eba07 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=huVnaSGCcg0LVUp1CDwA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: rCx6WVlDuD6iUz9mRGQg-aTB5cqKerY2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyNSBTYWx0ZWRfX+SM7pn4LG1/r
 At4StltsSWqgv//aN5f9E0wsrATOWxs6jqkrjhdKOFl479nq4BoNDCnL9tRXFLxwdia7AK/2tw4
 im3pdTUBjJGGrPzFbNIjKGkUym7s4sRxK5WIP679luwuhPLGOpWiQqrYgZ+ZNCR0drzUFwF+uBZ
 7Q75Ljf6hLkf3tEz2ldbXtJsKv/KTjQzy+nv84CLCVSCFc/ID7qaLPDaNv5ilZr4JEqY/yvY/df
 lnDYCZewb3pm+0y5C9aCCCLyQZcA0lSe2koU+Y2PdrwH4eVdqLy9APsJEQYc9PvAOoCc9yczO87
 fU9cUH4buKp/va2ZHmU1FuaWGpaWST58Bh/OFctepaNRrzpSbKeSn6E6+ygJTD6nwBkrNhhPB6d
 N1NJyLAOZ4s1OUaM5SNj6+5sJ4JZ1RK80/5SSbVrHmfQLWixvx5qsHSIjsxxNffo4axHbyAU
X-Proofpoint-ORIG-GUID: rCx6WVlDuD6iUz9mRGQg-aTB5cqKerY2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_083432_721875_37A01F29 
X-CRM114-Status: GOOD (  23.42  )
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

On 6/27/25 4:44 PM, Luca Weiss wrote:
> On Fri Jun 27, 2025 at 4:34 PM CEST, Konrad Dybcio wrote:
>> On 6/27/25 1:33 PM, Luca Weiss wrote:
>>> On Wed Jun 25, 2025 at 4:38 PM CEST, Konrad Dybcio wrote:
>>>> On 6/25/25 11:23 AM, Luca Weiss wrote:
>>>>> Add a devicetree for The Fairphone (Gen. 6) smartphone, which is based
>>>>> on the SM7635 SoC.
>>>>
>>>> [...]
>>>>
>>>>> +	/* Dummy panel for simple-framebuffer dimension info */
>>>>> +	panel: panel {
>>>>> +		compatible = "boe,bj631jhm-t71-d900";
>>>>> +		width-mm = <65>;
>>>>> +		height-mm = <146>;
>>>>> +	};
>>>>
>>>> I haven't ran through all the prerequisite-xx-id, but have
>>>> you submitted a binding for this?
>>>
>>> Actually not, kind of forgot about this. I believe I can create a
>>> (mostly?) complete binding for the panel, but this simple description
>>> for only width-mm & height-mm will differ from the final one, which will
>>> have the DSI port, pinctrl, reset-gpios and various supplies.
>>>
>>> I think I'll just drop it from v2 and keep it locally only, to get the
>>> simpledrm scaling right.
>>
>> Yeah I think that'd be best in general
> 
> Ack

[...]

>>>>> +&pm8550vs_d {
>>>>> +	status = "disabled";
>>>>> +};
>>>>> +
>>>>> +&pm8550vs_e {
>>>>> +	status = "disabled";
>>>>> +};
>>>>> +
>>>>> +&pm8550vs_g {
>>>>> +	status = "disabled";
>>>>> +};
>>>>
>>>> Hm... perhaps we should disable these by deafult
>>>
>>> Do you want me to do this in this patchset, or we clean this up later at
>>> some point? I'd prefer not adding even more dependencies to my patch
>>> collection right now.
>>
>> I can totally hear that..
>>
>> Let's include it in this patchset, right before SoC addition
>> I don't think there's any pm8550vs users trying to get merged in
>> parallel so it should be OK
> 
> Okay, can do. Disable all of them (_c, _d, _e, _g), and re-enable them
> in current users? I assume there might also be boards that only have
> e.g. _d and no _c.

I suppose it's only fair to do so, in line with

d37e2646c8a5 ("arm64: dts: qcom: x1e80100-pmics: Enable all SMB2360 separately")


>>>>> +&usb_1 {
>>>>> +	dr_mode = "otg";
>>>>> +
>>>>> +	/* USB 2.0 only */
>>>>
>>>> Because there's no usb3phy description yet, or due to hw design?
>>>
>>> HW design. Funnily enough with clk_ignore_unused this property is not
>>> needed, and USB(2.0) works fine then. Just when (I assume) the USB3
>>> clock is turned off which the bootloader has enabled, USB stops working.
>>
>> The USB controller has two possible clock sources: the PIPE_CLK that
>> the QMPPHY outputs, or the UTMI clock (qcom,select-utmi-as-pipe-clk).
> 
> So okay like this for you, for a USB2.0-only HW?

Yeah, maybe change the comment to something like:

/* USB 2.0 only (RX/TX lanes physically not routed) */

to avoid getting this question asked again

>> Because you said there's no USB3, I'm assuming DP-over-Type-C won't
>> be a thing either? :(
> 
> Yep. I'd have preferred USB3+DP as well since it's actually quite cool
> to have with proper Linux. On Android, at least on older versions it's
> barely usable imo. Can't even properly watch videos on the big screen
> with that SW stack.

Bummer! Not something we can change though :(

Konrad

