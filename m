Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4B1D2F7E4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 11:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IIeEbHT2VcCtWz2n+Opyz7ieZwO0LhGLiuIEjFNJcYU=; b=M6zSdAfjClr2ZDSQ4MeBuH2YNb
	KK//bpBHngMesUZQCiiTkm7yCvReoKdxSUe9+19Ka8JvmIq1HV4C5VFe+KnIyk12zHsiYAM5zsi9G
	OMag1+dr1tA1uK+crJ2EzO3xaqcRVJaxVQXWxHqn6Yawgm44otfzUBsLdK50ltTh46i7DXz51E04/
	xfyWtlyLXVQbErckExXN7Hsf7wyQvPkz0I4hZ1XEGUO1CIljxgBmwSAaBzAGq9MQKAxPYaq1tP+Yt
	LPCn60aKe7YWfMDrJ33pTHuX3wivNKOh0jeqEp5nwnRgOZy2GRv9iaapbqcygH83twx4kNvgQU2lg
	pzAV9pMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRUSM-00000009RmK-0iRK;
	Fri, 05 Dec 2025 11:58:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRUSJ-00000009Rlq-0crs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 11:58:36 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B58XGHs2516887
	for <linux-arm-kernel@lists.infradead.org>; Fri, 5 Dec 2025 11:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IIeEbHT2VcCtWz2n+Opyz7ieZwO0LhGLiuIEjFNJcYU=; b=OY0HldBLAoFsiGbO
	ALG0eqbs0lRGfH/fyO8HQNG8A1l2w261sj94DZ5a7lp+DxajjjUgcEEZzf9xf2MV
	rSMqPyvRce1oWlIGDFubE1leuznXerYPv0dcOFlGuB7W++75mQWp8wSDg6JvirkU
	NuPeSZDhHC2xvkKYBpF7J7WALYPH9xZji3Aiiocs02caKS0LAf3/hxsC6yn3Nm6o
	iI/0F3L3UsRfaQ0e0+3pELhvxo+L4R1liTI0V5oyXHbhMOuHk7+NzrPswrqjK/zd
	tKfyUC3WkFLlratEp3RfjJal+UrDprVIxt4JhCM2bT3CyZmBRNaYiMPf0pUMra/V
	vSruOA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auj7n22ty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 11:58:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b25c5dc2c3so41905085a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 03:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764935912; x=1765540712; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IIeEbHT2VcCtWz2n+Opyz7ieZwO0LhGLiuIEjFNJcYU=;
        b=G0qWFqdNQEI5uLlMIacV2WGLGZ97MA1cWqK5PXEvH7RvOBYQtix8cMfd7dLD9Fk5PM
         qdK11ZjH1vLtIv40b0I0zle+EnPfBpn/kgh1GTJjp7ImfPpOxU23IJ/aIESpFfv0TNNQ
         4bQSQVW63oCoPph8KbxAK43auReTiiXXkOkr1WlvahYHwwFqmTacIzBWUhiu1RcTGLqz
         vgvM6Bz/JS5LtGclTq3J+SfGzNoluQKtmJxXDi2dfGVbiJQaiGdpG+ca4bGo4OvV2rBZ
         YTfGe1USGraXeJ9akc/XSzkj73VAkwQAHF6GmHe3TJxP41qaLK18TMPafBi9E9Iarpfi
         9q1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764935912; x=1765540712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IIeEbHT2VcCtWz2n+Opyz7ieZwO0LhGLiuIEjFNJcYU=;
        b=J1GXTq5DQ7QzjXJw6boczFKqJg2Vpjy0cfJwPYN3Utw7FJGBGX3uNIU4G2faCjvbXq
         yLttTYqIKKtTzLlpaz0Eq0OwwswxRCiYmMAwjF50tVJIhsGporrtTZuGhalz+YpFfO5l
         4xBHHJxaQZ+zO8KuoKEuyqOuLO6L41R7WmUZ+wEi1AWnPY73yZPAnNNA8kvOIJ6AmK42
         BayGt5eaBkdmG1i4j2ri9bjYCVPINr6FnrDZC35rQn/2abu3VEN3lLM5JbE3VE3Wx92O
         hHB1ggzbHjfQBmowtwuZRT6QjE4dfTPrK9wfMSY91POpaONqZcHju3vCU8YsnqyPwZy9
         c0sg==
X-Forwarded-Encrypted: i=1; AJvYcCUPZ6+igkZwKFFb+BTdWXKIk9iShzf9+9/2/5o8kasbkPpeZ1FwGpg+nWhoGD3MjpgzxMIqb1l2gJq6BuydUPQN@lists.infradead.org
X-Gm-Message-State: AOJu0YyPOaGzODZcF/+OnzJ0jbALWcIoQgJP6AMBAT6Y4aJ8qSyLAmr6
	/ZoLt9dDWuXVxGZU+rOcjqxPxHICPqWju/yLL20RGMHXATZAONxInCVCrnl5QdJa5CoI/Oln2h+
	/3Ps8WTz7To+KV2OHbofvB2GEpHYvjOEG0BKCmJxN42WcNQ2XP56H6q+FmDpOEfH03+hzyQqk08
	Jziw==
X-Gm-Gg: ASbGnctyqGvzuRCFlQFDLClgKWooqSsn1D3uwBevUok/kRNQQsIHcWJws5WVv6QQx8H
	Tu7b5t4RlErXL9uzFeH8wHLeQS7mspLxSvAHfQi65sDui6a8fH2EpJDHukPf21B58pQZ2H6e4WQ
	x8dZ0U+Nkj2uLcSYjjrGvSaNHxNNgWejGluefD+6dSFLFndB9FDizj/zaA4c5+hdwT47ljnnBC6
	uJWId/UwnhKp1TlxFEg8N/5c7HyiPUJK6KPgsXR+pgSwQ13eJmPhQKz43ET9pIRiFZ7ETwuQ4fz
	0C2OD3Vh818QgQi4LPa4Sl10I6Diri7u+4uITufpDSobAHv6CDU1weHOz+kg5Vwjpl9/gm6iYn/
	Py2sPp+thE2be7FnKSS1JOgejwNrVDNXogzcoZtxlNe+80MlpDF5pJMw02HzW3zpg+Q==
X-Received: by 2002:ac8:7f54:0:b0:4ee:1588:6186 with SMTP id d75a77b69052e-4f0176844ddmr100707251cf.11.1764935911672;
        Fri, 05 Dec 2025 03:58:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFov2I2X1RO4Ob8MYXyaeF8rMVGALAElCw7tm9Bp7+qYh3T528OfAwWshEwbYv5+VJc7P3dSA==
X-Received: by 2002:ac8:7f54:0:b0:4ee:1588:6186 with SMTP id d75a77b69052e-4f0176844ddmr100706771cf.11.1764935911237;
        Fri, 05 Dec 2025 03:58:31 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f445967fsm349282966b.10.2025.12.05.03.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 03:58:30 -0800 (PST)
Message-ID: <6e6ecdbf-f3cb-4d7e-a679-4640d6603ac8@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 12:58:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] arm64: dts: qcom: qcs8300: Add CCI definitions
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>,
        Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_svankada@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>
References: <DS0PR02MB11311CE33DFFE0739BE747590E3D8A@DS0PR02MB11311.namprd02.prod.outlook.com>
 <d49920eb-0b4e-4042-b0c6-28d1ba348ddc@quicinc.com>
 <3f1dbf91-f967-44dc-bb21-25fdcbbc8db2@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3f1dbf91-f967-44dc-bb21-25fdcbbc8db2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DOSCIiNb c=1 sm=1 tr=0 ts=6932c8e8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=JE8FtNjG4eDj_IBO3V8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: mjZqW_VhpFVQK8DMD9CJh0BXZ7fXV5LI
X-Proofpoint-GUID: mjZqW_VhpFVQK8DMD9CJh0BXZ7fXV5LI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA4NiBTYWx0ZWRfX+Y4u+Kn+ao7d
 7/tZQchXwAz/U2LJ2h0POq7POzRJ7oZd9Bv16YFpNWxfwJ9jMQVVLG1m7JsRskTfOgM5a+ZavOV
 dnpTRmA4THka1rgzagw1vPBdhLUs/pahHTZvhM/ndJoJrCgvWUAqxC12sHVTOTk2JXv/czvE3r1
 Rh56qG5X+h44bMvWFrZpBl9RnRuEsIMESnlbOUyx1VQz1MnWWCZZMLSLfSzTKk5qE1VB9ITs43F
 yXhZDVzktBdqV8hXXQDiV+reUVdVL1JMK2A048d3jVryx0SamSKEsi7Z4khFAHs8rJIDgse47AT
 S4/Ekh6SSyoSYFIiJ0Y5uWFnZBmjsyp7K22gWRtwwPhUuZ31vAlbnLvm7UfeTcBce2733nZwHhz
 j4Wz6UNWmiRuvaVPSdnzNE9VYjOn/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_035835_320669_B4703C5A 
X-CRM114-Status: GOOD (  20.21  )
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

On 12/2/25 8:35 AM, Nihal Kumar Gupta wrote:
> 
> 
> On 11/26/25 9:10 AM, Vikram Sharma wrote:
>>> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>>>
>>> Qualcomm QCS8300 SoC contains three Camera Control Interface (CCI).
>>> Compared to Lemans, the key difference is in SDA/SCL GPIO assignments
>>> and number of CCIs.
>> [...]
>>
>>> @@ -5071,6 +5182,240 @@ tlmm: pinctrl@f100000 {
>>>                       #interrupt-cells = <2>;
>>>                       wakeup-parent = <&pdc>;
>>>
>>> +                     cam0_avdd_2v8_en_default: cam0-avdd-2v8-en-state {
>>> +                             pins = "gpio73";
>>> +                             function = "gpio";
>>> +                             drive-strength = <2>;
>>> +                             bias-disable;
>>> +                     };
>> I'm not sure whether I was unclear, but my intention was to ask you to move the MCLK pin definitions to the SoC DTSI, because that comes from the design of the platform and doesn't vary between end products.
>>
>> GPIO_73 being related to a voltage regulator is strictly a property of the EVK.
> 
> MCLK pin definitions are already present under the tlmm block in SoC dtsi(monaco.dtsi) as required by the pinctrl subsystem(qcom,qcs8300-tlmm.yaml).

The latter part of your sentence refers to the pin definition having to end
up under TLMM in the final DT, which it will be regardless of where exactly
in the source files it appears.

What I'm alluding to is that we organize some of these definitions in a
specific source file to make logical sense and keep them within relevant
scope (i.e. you shouldn't be able to refer to a board X-specific setting
from board Y DT - that's unnecessary room for error, whereas pin definitions
that are a result of the SoC design make sense to be shared)

> Are you suggesting they shouldn’t be part of TLMM in the SoC DTSI? This doesn’t align with the YAML file.

That's not exactly true, the YAML file you're referencing only lists the
allowed entries in the 'function' property of the pinmux subnodes.

The DT checker makes no effort to analyze your file structure, it only
makes sure that you're not adding illegal properties (or lacking required
ones) for a given device described by a binding.

> Regarding GPIO_73: Noted. I will move it to monaco-evk.dts under the tlmm section.
> 
> Below are the example snippets:
> In monaco.dtsi (SoC level):
> tlmm: pinctrl@... {
>     cam_mclk0_default: cam-mclk0-default-state {
>         pins = "gpio67"; 
>         function = "cam_mclk";
>         drive-strength = <2>;
>     };
>     ....
> };
> 
> In monaco-evk.dts (Board level):
> &tlmm {
>     cam0_avdd_2v8_en_default: cam0-avdd-2v8-en-state {
>         pins = "gpio73";
>         function = "gpio";
>         drive-strength = <2>;
>         bias-disable;
>     };

That was my entire points, thanks

Konrad

