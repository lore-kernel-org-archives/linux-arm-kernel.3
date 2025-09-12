Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74130CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ubdZE+2MGy4tFDpQKrzviatnp7P+PiPFBJ3kNogasGs=; b=MnS62cD9DnJGegzLYPKGxmse5i
	CklPNlRWKrIiI7UPzL+9JyHxplMq7woFCr6gswPo0OL55KCyrK0fLojsRF+eiDquWvd/vSspVv6ox
	vtq6BA4thG+5ofobA4ZpsgU4iAMO5E7oOWQ/ftmudw7lRB+U1taF8Rm059HaVue7wvlTZuHGpikA0
	PyRxR0CcscXuFf4G+ocMjFYUVCsmxjP0JeE5uvEGEeJvZ2rRraNJvGwyVGLd7hnqC2MLPN4VxvfI8
	yVz/UEUKPiGBoSQ/66st/Jmupww7UGwrBv22Bbi1x21YznzIYk2D0h1yaQrcB7s/fiiJh8pSmJFsX
	u5lTuz6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0I2-00000008LrL-1T2j;
	Fri, 12 Sep 2025 09:41:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0I0-00000008LqD-2kdy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 09:41:57 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fPaO012868
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 09:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ubdZE+2MGy4tFDpQKrzviatnp7P+PiPFBJ3kNogasGs=; b=frl1N9yBvDBrBz+g
	vYpk/y637iCILK5KDEzRuFB1WIT4wlp3iA7Ak3xcVXtckYYSF94Zme5MDaBuQXn2
	91njJBp2xEcqFGcBQUSHSCBnCBuYDkDiHbsoiQ8yGQmexU7bb7Ntfmp0WyCqOTE2
	uGBhM20XnimXZfWw4fPpeDIuzI/fN9Fzes9TkxsPQT4QCeCepqUAKEdHfQ9GoQe4
	yyubFKuDfYboEzIEUsyPMdiDwshIPMZ43ycg4ycI1BYoYRnv3T+sAr8dN6p5Ydok
	7pBYoiTgxjeMZhxFiYq4EkyTupvgEh5gDNuWZbvNu3+AaZD0zNVjIQzDOtn6lQYg
	w+PA8g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqgat6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 09:41:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-80d884c99e2so37306285a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 02:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757670115; x=1758274915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ubdZE+2MGy4tFDpQKrzviatnp7P+PiPFBJ3kNogasGs=;
        b=liWQLR1LNG85bG13afkfjSw+fttkecImaoVCWdKt/OV6eo789cC+GV9TcAhyylPSsM
         hhOONmC0Z6r35vQalPm/oE/Oh62MlVYfXpAIU/MEXX/R8SLrZ6+QrUAtRqzqhVbEAAFN
         Cb9yn+BcQFStrmRPmj/E8UcY/IVU0NjVS6wS+GPbxHlAMYnXd61JSOcbdPsr2e0GNDGI
         laR8kqmhQkftuVjCzLpziyxDCsQjavfJ0CnqkX2iE8+axFPuUyye2VNasqYuVymnB8i4
         X1aijvIMGDTEkfNsVP6IN3O8kKOTqfxTLMKTyh3zXt5usHV0mFcGsPHnqphfv5YtgLEp
         5kVw==
X-Forwarded-Encrypted: i=1; AJvYcCWYQNEq6PqPTJK+j4ZWP46MEboVH0R0JJpIbSYaQ+UO1O4hARFmCsbZ6DcuAFFSZayE8xh7YrDWXPjApkXJ825P@lists.infradead.org
X-Gm-Message-State: AOJu0YzaCCyVBB/GkRDcJmkm/1VejApeQ/G35msl/arPy+CzHk1085iH
	FE39HydIYnhTozHDOk7S9+x+meeP4Yjqbq3mju6fVlCGdLx/jlxkFysk1uvj8ocs2PKjc7C4VRa
	Vyywmt6w+RPQsTt932AfRxT0HC1U3Bwq/U2JkELbRrF7bNIn/5FJ8Hskeyo9TyDzJgmIAPL0DfU
	XcRw==
X-Gm-Gg: ASbGnctBWMRFpJk+Y7VMBZTmAazuEHl7Vn2ip69tGTCEa1HiMjtM2OVDFdRgOikYnn0
	eAdf2zsc9Zbx9MvgKMNmqVSsLLx0rfKcRrIijnDb2UW+hOaJp1cfWQS5jBkAN+X2Af4ZLCEVEH+
	NTFQmGdgPqHaU/HRny2oLox4Vq9AkysMrDZCH+FJeZcPO/lNhaEtm77FhCwPOFDfwLGSxy7E1kw
	dE8ryfPruwlGg0bDzCPptU6r57EVXxY2rRmJY60/OIYzsbjAu2+dzCdMSLLai1VFlTTbZf2AMrz
	ChbSQ0E8AFpBjbbiogw4EBP3NAjZ1yfvyeqJ7vdVZpj1eR5QxMWCWe5QB0llSVQnX6EwH++H333
	DLB27rFYTYg0wShyXl3C24w==
X-Received: by 2002:a05:6214:f05:b0:70d:e7e1:840f with SMTP id 6a1803df08f44-767c1c8fd01mr17754056d6.3.1757670114623;
        Fri, 12 Sep 2025 02:41:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEW19WjSadyXUxnUE5X6AqSmTHftlhz5SicnK4cbK2PU6jUKPiXVwSAYDJJeeQH+UMau1p6vw==
X-Received: by 2002:a05:6214:f05:b0:70d:e7e1:840f with SMTP id 6a1803df08f44-767c1c8fd01mr17753866d6.3.1757670114134;
        Fri, 12 Sep 2025 02:41:54 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62eed9aec1asm131613a12.3.2025.09.12.02.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 02:41:53 -0700 (PDT)
Message-ID: <0f9d55a4-83a1-48f6-aa19-e3117192bebb@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 11:41:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] dt-bindings: clock: Add required
 "interconnect-cells" property
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Luo Jie <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Devi Priya <quic_devipriy@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20250909-qcom_ipq5424_nsscc-v5-0-332c49a8512b@quicinc.com>
 <20250909-qcom_ipq5424_nsscc-v5-2-332c49a8512b@quicinc.com>
 <20250912-nocturnal-horse-of-acumen-5b2cbd@kuoka>
 <b7487ab1-1abd-40ca-8392-fdf63fddaafc@oss.qualcomm.com>
 <2951b362-c3c1-4608-8534-4d25b089f927@oss.qualcomm.com>
 <52714c33-5bd7-4ca5-bf1d-c89318c77746@linaro.org>
 <d293a11b-155d-45d3-bafc-00c2f90e8c43@oss.qualcomm.com>
 <1cd6a0f9-2955-4189-8d1e-85fa8ad8dddd@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1cd6a0f9-2955-4189-8d1e-85fa8ad8dddd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: swXadJwHCCqW1_due8rk7eIJAMNN3DwZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfXxUD2KltNFS9k
 31TqiDNCSeea+zSCnmPuPOJfPEZ6tbZxgdoO1lwyxbfGI1pHav66Ci5YxR3C6EnU2o5ydRQTjED
 ovDA6UxZqi6IXU1rYz2n1fZEhNeSl30aaXxp5MMqwD6QZkljt9ZcTtChd920gYT0UyV4zcuac2l
 7CKQPIMb41q2NPQyvo07S7v1yClWDOPp3rS4HPq51a+iPCHdaP8vlYKc4oP9YFD24fdFo2f2RTF
 1Y68WKN9Gso1vBGh126HNZw+8qb4ZU/lf1HHPV5PvxfW4geTz2Nprvf3HmfgefRvjLYtMScVc76
 XzCcZRtZfWoRfxa6uAAC5Vj7AGJmV7wTQ74JT/Zx3kAT550VeDJ2Dqow+wjQdz+LqfRpaGYs2PZ
 9pOSi9CN
X-Proofpoint-GUID: swXadJwHCCqW1_due8rk7eIJAMNN3DwZ
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c3eae4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=r2WM0BnHFFIPBb0dDCkA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_024156_707909_57574E72 
X-CRM114-Status: GOOD (  19.10  )
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

On 9/12/25 11:27 AM, Krzysztof Kozlowski wrote:
> On 12/09/2025 11:21, Konrad Dybcio wrote:
>> On 9/12/25 11:17 AM, Krzysztof Kozlowski wrote:
>>> On 12/09/2025 11:13, Konrad Dybcio wrote:
>>>> On 9/12/25 11:13 AM, Konrad Dybcio wrote:
>>>>> On 9/12/25 9:04 AM, Krzysztof Kozlowski wrote:
>>>>>> On Tue, Sep 09, 2025 at 09:39:11PM +0800, Luo Jie wrote:
>>>>>>> The Networking Subsystem (NSS) clock controller acts as both a clock
>>>>>>> provider and an interconnect provider. The #interconnect-cells property
>>>>>>> is mandatory in the Device Tree Source (DTS) to ensure that client
>>>>>>> drivers, such as the PPE driver, can correctly acquire ICC clocks from
>>>>>>> the NSS ICC provider.
>>>>>>>
>>>>>>> Although this property is already present in the NSS CC node of the DTS
>>>>>>> for CMN PLL for IPQ9574 SoC which is currently supported, it was previously
>>>>>>> omitted from the list of required properties in the bindings documentation.
>>>>>>> Adding this as a required property is not expected to break the ABI for
>>>>>>> currently supported SoC.
>>>>>>>
>>>>>>> Marking #interconnect-cells as required to comply with Device Tree (DT)
>>>>>>> binding requirements for interconnect providers.
>>>>>>
>>>>>> DT bindings do not require interconnect-cells, so that's not a correct
>>>>>> reason. Drop them from required properties.
>>>>>
>>>>> "Mark #interconnect-cells as required to allow consuming the provided
>>>>> interconnect endpoints"?
>>>>
>>>> "which are in turn necessary for the SoC to function"
>>>
>>> If this never worked and code was buggy, never booted, was sent
>>> incomplete and in junk state, then sure. Say like that. :)
>>>
>>> But I have a feeling code was working okayish...
>>
>> If Linux is unaware of resources, it can't turn them off/on, so it was
>> only working courtesy of the previous boot stages messing with them.
> 
> 
> Which is fine and present in all other cases/drivers/devices. Entire
> Linux in many places relies on bootloader and that is not a "work by
> coincidence".
> 
> Another thing is if you keep backwards compatibility in the driver but
> want to enforce DTS to care about these resources, but that is not
> explained here, I think.

I don't feel like arguing axiology today ;) But I see your point and I
won't object to either outcome, so long as the property is *allowed*

As a sidenote the IPQ SoCs have a rather thin layer of fw

Konrad

