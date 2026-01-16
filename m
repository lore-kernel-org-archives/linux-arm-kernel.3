Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BD9D47CC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 10:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4oVVsla4+xBFjzBi0ugNP6lImplJ8evffrnYHm8c7Y=; b=JKUy/ndpfgBO6p2SJgqj/oiq+M
	sQja//MW+cHMthrtlKj9nWt/ArgncLVUPF1Koni0wpm52mHYYBpCeKcCC+qF1xj56AzM/uLUdc1HV
	s+Y6tV+jaYVQ2DFvt2vxVB3B+ngYNPAbQpGBiWeVFGi4JUxfBg7F02Hpza86CLAHFb3KI+Ba6Fu2Y
	77dJD9PCTlcyr6bbGxoVYKH2LyGgpxgTO0WDcbbgK654jTdKqDefEj30KKvNjAXOULf+n/hAMarBk
	gePChUghs9fxSkTetXLKgf09UABdxYxad/kIZLrH95AC/2n/rc9QS3OHRuRNh51gLPI+1rlhzgpLM
	wzmoLeTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggjB-0000000Du6Q-0zMv;
	Fri, 16 Jan 2026 10:06:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggj8-0000000Du5f-1O34
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 10:06:48 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G7hmPW2615456
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 10:06:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V4oVVsla4+xBFjzBi0ugNP6lImplJ8evffrnYHm8c7Y=; b=b8h9QWn/IvMr34f8
	hkWLUbJrG+X8xdGywFSRk9UyiXZbk2XhJu2NAg74C3AY4l2fOkILpp+gpTYkvNeD
	izb1a1ShnfbJYtYaRfjlIen2YGQLpCLExTuvab4lzNpXaR72bLkMCvKI+6Nf0HZO
	aW1acb3Y2wWTDFNNJDwugPl1TyyXg6EpexjcaCh7PWvC/qAfmAfy4fCzmCLAOcJn
	fDbRcDMk2TPa8nVVsq2FMt5q60dqkNlPJwF8yN9QLdgnHPC7q69+NC6woHFVhwIq
	Z/Jv8WItIK0nEjIcVRTsOJf28pbBxKTrTy+gO0rPCdhaUm8oqu6Odu4TN2pYPTkh
	PalPXA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq977sscp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 10:06:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c277fe676eso522663185a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 02:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768558004; x=1769162804; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V4oVVsla4+xBFjzBi0ugNP6lImplJ8evffrnYHm8c7Y=;
        b=M+4pCcfzuJTbnPeiZUjFHFvU8et8et13ZffNBo7UjWDOZBF7J1LBAoFircDtyX4JXh
         ru7Lvl0VO3ZMjHvo+QW4F2ynL6WbaCwtCFhW+EblCBkmB8IZTwDbgal3ly30VASgcFXq
         wj03Gftq8l07tpvDXfgfwd4Z1BpO2De6T7JwRh2gtImHagHbAqt/6p7IWGGYASI3DPbQ
         ZWT+jLqsLUXDge/33oJwoG1tktYdkANEhxoPWJ3ACxwVlfgMqim7z0FN/aeqNE99YoUw
         AfQeTwanRFMOGUE2buTfd6k3cutU7Pg5f5jnsPgyba+DsJihkqJL6kSJh54ydX7ahqXX
         q5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768558004; x=1769162804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V4oVVsla4+xBFjzBi0ugNP6lImplJ8evffrnYHm8c7Y=;
        b=lclqj+4HPpRvToZiD7HbD+/x2M/ab9T6qufVz33El1BQ9k9B9frkzv+pxYzH7KFSCI
         gaowHVEpbrl3QYequrZD/cw3OMuKSsydFylpvax8H75NZC7YzR3XkVlPqd2QKsFWcPl/
         f+V2BFHCmzZg1A9y7TQmUHXgjpZeJ1X39YPpvf7QQCBdnhOXtdGHj86+oV/bm0twWX14
         RFpRRgaR8Gxh5toJ9xO21TDz238tIvooR9hh/QyM1fq9Nv2H2oOuYs4EFUKjeBcs2C3p
         Fq0XHshgCWIMSPBFyezKRmAStG3hjVrkG4diA/IizvAiB7EyyaFQ5hFXthLG2AwvirSQ
         NTag==
X-Forwarded-Encrypted: i=1; AJvYcCX4l/F6v9e00I6d5Ureg6EoIWxnfOONrF+AorabMpdyMBy/nzy0g2pFKoE3QhM5xBQ89wXWwlrzhCFAFSApfGCe@lists.infradead.org
X-Gm-Message-State: AOJu0YzUUXOdvWXs0WcN1qZrm0Wm7vj/PmFgi0LNyJHwwmNa54aMj/x5
	OIVjPtNjlKajKv5iWGyD8tCwDyY5scN9tMUFXUim3zBXC+PXh/syoUekQm973V8oFAYqnqiWyxa
	4nbyzaclwPzQA6TbcVs1JEEGe4xEKvsE/pL7ywr/1cA9b8XGnziDERwWEQU6M9rQY/2kRd0/Qfx
	LUDg==
X-Gm-Gg: AY/fxX7LwBNQAM6IU2Gk2BjRadlGjdSLgvSwd/+q6f/iJmlIZFeKKyfguUIg9AlHqrT
	ONkR++AjxGBIsff0poRbq5VKCcTOf6gusuPB8ngjn+SGrsOJgBoYVEeRiXkP99+iEfbb4cCXHDz
	NoTwvoOgMOQ5SzXh3x7jIFjvyrrHy2Y8vEjRW7Nwql9a9alDpAgunz1ck8pvSl5pIjH9HQb+2N5
	rMCXdFXKxjz6QALVRg/vX1Q5WfF0HoUi8mxo7chdGSOKCUdvFyr8rGDr4IUONgZKTr5NnSTQEgM
	a1WNrCcoyri6M/yp5uz9guOanKRnykLXJ4rrdCtFv63Wlfxag8l2rhQHbrWkjywXfIHNUXMK7oP
	N/G+F4c1ZLAr+9MSDQEImqrsACpMFKnMFNIctuosJ3O/LagFQeaRgE7no66u1ftU7D2hS+F/9gQ
	==
X-Received: by 2002:a05:620a:2913:b0:8c5:f67c:ce34 with SMTP id af79cd13be357-8c6a6700a5emr282382485a.39.1768558004404;
        Fri, 16 Jan 2026 02:06:44 -0800 (PST)
X-Received: by 2002:a05:620a:2913:b0:8c5:f67c:ce34 with SMTP id af79cd13be357-8c6a6700a5emr282379785a.39.1768558003879;
        Fri, 16 Jan 2026 02:06:43 -0800 (PST)
Received: from [10.111.171.115] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71c149esm191212785a.18.2026.01.16.02.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 02:06:43 -0800 (PST)
Message-ID: <f84d7a9e-2925-46ee-91a5-eca3ee68f478@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 18:06:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
 <20260115-sm6150_evk-v3-5-81526dd15543@oss.qualcomm.com>
 <3b16ffa2-1580-426c-aa9c-f377d913d49c@linaro.org>
 <e27deffc-bbcc-48bc-9e4e-ce52698d98f3@oss.qualcomm.com>
 <e081fa74-9e0b-4e54-a51d-eee97ae6f4fa@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <e081fa74-9e0b-4e54-a51d-eee97ae6f4fa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ABkN0Yvs_hahlG7Ys2NvS_3vSCnzRLLp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3NSBTYWx0ZWRfX9CgB+0sPvcEg
 nZ8Xyiob3XxKlfpltM0KI6i0h0x4y1nEZBc/qtD02zh8usu9EEG/ONY91LLRYdCm+0/nkBpjAnH
 JAiN7X1AvqP0X5fPDJNp+LTMD5o6hwK/trkTC0W8KiK4UwKzxarkMY7CfEdPkv/JFKA9ue+HJQb
 a77ndSaNRe3kS2ufZlar/+sEeK3OkHZzgF6eDG1t+MHgnbPTQ5vFi5pIO1GdYMeNPERRRxO89bY
 AtElGnMCp4RQvedBnqFWipMWdliPWTpkZvClAu7U5JWLjFi9I/CUQsfq6p+z32YI+yP11g/MAGS
 XDHhDgFyVhArwdEM63v9geM52xLFEIcD/8RttYG4V+zjLsqoiUsRKmjxl3KMn2HqZWBcmbLWTBZ
 0DnS1fwGR8AOMwqd9cEboReTjrWuEu+WMu85bhOvgVbcd9a8/z5S73emVgXN1eFWuXNvMsSdPfS
 CAev+b2GuGJrKGk+COQ==
X-Proofpoint-GUID: ABkN0Yvs_hahlG7Ys2NvS_3vSCnzRLLp
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=696a0db5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=XwWqFBnoW6hE9qul-A8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_020646_484148_9E0D9066 
X-CRM114-Status: GOOD (  17.11  )
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



On 1/16/2026 5:42 PM, Vladimir Zapolskiy wrote:
> On 1/16/26 11:32, Wenmeng Liu wrote:
>>
>>
>> On 1/16/2026 5:12 PM, Vladimir Zapolskiy wrote:
>>> On 1/15/26 12:12, Wenmeng Liu wrote:
>>>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>>>
>>>> The Talos EVK board does not include a camera sensor
>>>> by default, this DTSO has enabled the Arducam 12.3MP
>>>> IMX577 Mini Camera Module on the CSI-1 interface.
>>>>
>>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
>>>>    .../boot/dts/qcom/talos-evk-camera-imx577.dtso     | 63 ++++++++++++
>>>> ++++++++++
>>>>    2 files changed, 66 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/
>>>> qcom/Makefile
>>>> index
>>>> 00652614e73582fa9bd5fbeff4836b9496721d2d..be9aeff2cd1555bc436e1b8eb78d8e1c9b84f9c4 100644
>>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>>> @@ -339,8 +339,11 @@ dtb-$(CONFIG_ARCH_QCOM)    += sm8650-qrd.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)    += sm8750-mtp.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)    += sm8750-qrd.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)    += talos-evk.dtb
>>>> +dtbo-$(CONFIG_ARCH_QCOM)    += talos-evk-camera-imx577.dtbo
>>>
>>> Please remind me, what does dtbo-y Makefile target serve for?
>> Rob mentioned:
>> https://lore.kernel.org/all/20260106192609.GA2581379-robh@kernel.org/
> 
> It'd be better to ask Rob about it, I suppose that the concern may be about
> a missing in the qcom/Makefile mechanism to build standalone .dtbo 
> artefacts.

As i checked other platform,
dtb-$(CONFIG_ARCH_QCOM) += talos-evk-camera-imx577.dtbo is ok.

talos-evk-camera-imx577-dtbs	:= talos-evk.dtb talos-evk-camera-imx577.dtbo
this compile only, will not install *.dtbo.

> 
>> I checked, dtbo- is not an upstream usage, it will be updated form
> 
> Right, that's why it attracted the attention.
> 
>> dtbo-$(CONFIG_ARCH_QCOM) to dtb-$(CONFIG_ARCH_QCOM) in the next version.
>>
> 
> But...
> 
>>>> +talos-evk-camera-imx577-dtbs    := talos-evk.dtb talos-evk-camera-
>>>> imx577.dtbo
>>>>    talos-evk-lvds-auo,g133han01-dtbs    := \
>>>>        talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
>>>> +dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-camera-imx577.dtb
> 
> it's already here and it was here in the previous version.
> 


