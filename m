Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AB5C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 22:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4B3h1KneRsR4g4P8DoAhcb5VoEzgECZqghlNOYZOMuU=; b=MAJpmC7IOFaC8V3GuJq1i1J6TD
	QqCsb8EhwPJ1anIjelkTSglKcMQDus+cu9BRMEq1BJox232Fv5dTIIDrlBSkzO2CFomcKPrRY+fND
	zbF2BNyWRxB2OPQXBAyRoVlzE+xokvM00utoPFAEpP3LLybCRE623dltCtlxq5vZ6rZbdJuZcskro
	qEy9WzNCVROS1ySUJIG4TtAdnZttbXWrMaCOPWJZkm0mTy/MDm7EYOCm0rtuKLBKPQAyL//howER4
	V5QUS6dQr9z0MGuUoAvd8FHPWMVduhd9/k6FKOpV4eEv/y80+5E3Vy+/2DJSCKZxH2zvFkhZoGX9v
	ZloJnzVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH9FQ-0000000AmAw-375B;
	Mon, 19 May 2025 22:46:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH9DH-0000000Alpg-1O5K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 22:44:04 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JLJSSY006521
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 22:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4B3h1KneRsR4g4P8DoAhcb5VoEzgECZqghlNOYZOMuU=; b=fSUyTXP0wQdu3qa6
	NSZ2pz+xtkiPjjuHJ5zP6gekDpFkkVLJFqjIFDf0n/bQCDeNkjrHXx4vvZ21oOCY
	sYKydzjoTJebqU1GuAzz+RCEqmSkV7BWPFz/09QFqPMpq2UyauS4MHrt/mvYUDc9
	i9FyChWzyvh4hmAXExD/rG/+Pjr8j08EcbWnda/aiYhYxSkhbT6DbO48r/A51aYh
	WaVfA/4vNyvXpdOVp9akIqp4HH0nrP7h+bvwkKa9XSrgSh1r2PDrc8X9FMl+pv2W
	wBnJh1H3BCQ2AVNNhHzeptA0CD0xQQ4ckKAG4ZZMWv6uSvtOTQ1q7b9a0j3FRqgx
	MlueGg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjswqgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 22:44:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f89a2df0deso14718776d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 15:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747694639; x=1748299439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4B3h1KneRsR4g4P8DoAhcb5VoEzgECZqghlNOYZOMuU=;
        b=scXjZ+2rnwWWJUOSjaBqGlPIJdNn/lheGYxDhRwOvJpApU90beb07+lWMaSmfOMe9d
         r11Tr7CjVPtR7JjRDeAFvboqq3HLjyprguwps+ibn8HCC7hSdKvXsxBMgdesy3BnC7Za
         6m5VWX9zXpInT8/Xay/GE8vlLbDaSYtQkuk99mn5BqTtcA3rY09sj0ujcFRjEw+dNGgV
         sZn7UObT0ss9Cl0/+xQva5RgRhvv1GQJ5+I+BxPxoEXliNdPPQ0Vr/BhfPxfLnUuPk+a
         lbamHlqAMkAZ7qz/YQTPrZTTn6W/4Hx1zBcfPH+rXaMUk8sWOLRGTNfryu6N6YvL5XJN
         YN3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+kB7FR9GxYH9yIqmidZ0hwzS4ZEzzZlycZz29lP2HclbRgqSq0xEivws+8iwSOUswernhnKBdxpH1kmVXJhkQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+ieexw4aOQhwlM/x6i+NP56qyk6e/hJ4eFDc8Jd0AbCe6AwQ8
	oKEcMATud8q6veIs2hgKzBs2I7Z6OmgXa6lFCWQS90KlGbyfntte6CCjPFvMX6HrCocLICA2iDl
	DLpfNK1tqoJBMoiGr28ift7P5NU+y0KeON/DIi3ApJJWtbggPFh4q0FSYNbFZ+x5Blucdvmiz55
	Fm0Q==
X-Gm-Gg: ASbGncs4jqeL6Ax/MDbiYFrV+GetNVT+bjHpoNUqTecrji0KR2SIAeM+K4r3pwZW29o
	cCcEhYhTtOkfgB1IMiHBeYWG10olSJYkRFteJs9+bsJHbDxyUBhjMCn2lfNmaBcpShmzvxFYFqh
	kAjXvN/ECH+imVjvv44F7YDbTlKbWchWv6oFEyGcCFjh5IirdSV9vLpoEO1qR+k3kFLcPydQOVL
	6N2HalCYl1rCw49M18A757xm/Hks/Q8j3f+XipcoUySa/M6SJ5brNZDCGhakExpm6hoZu8LazWc
	CURYl6RPJOXFfgVs0+sn7ML3EwGa3QchFP6M+8meD0SIk0gJ3sCR+zLmUr7FsCNIpA==
X-Received: by 2002:a05:6214:2e09:b0:6f8:b1e9:e5df with SMTP id 6a1803df08f44-6f8b1e9e6afmr67305476d6.3.1747694639350;
        Mon, 19 May 2025 15:43:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIcNvJxTpaX4aSwxX8+XLPauKtBWB3PQV78lz2duPuZaNPM5o3XDBuZzyTejxUixxBkLYQYA==
X-Received: by 2002:a05:6214:2e09:b0:6f8:b1e9:e5df with SMTP id 6a1803df08f44-6f8b1e9e6afmr67305326d6.3.1747694638927;
        Mon, 19 May 2025 15:43:58 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4e8afdsm649638066b.176.2025.05.19.15.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 15:43:57 -0700 (PDT)
Message-ID: <3fcc04b8-42b5-4715-a2ea-815b7c4808a1@oss.qualcomm.com>
Date: Tue, 20 May 2025 00:43:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
To: Wesley Cheng <quic_wcheng@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
 <20250409-sm8750_usb_master-v4-6-6ec621c98be6@oss.qualcomm.com>
 <Z/exOF4T+0vNLQwg@vaman> <0517c37d-b1ba-466e-bffd-9f47b0d458d5@quicinc.com>
 <aCRVaNDQP/PdAXPR@vaman> <5183b76b-8043-4309-b25d-e1ae505f929e@quicinc.com>
 <6fa4959c-d733-4d50-904f-caf933e02da9@oss.qualcomm.com>
 <f3727b53-8da3-d4f6-575b-108a8d6898e5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f3727b53-8da3-d4f6-575b-108a8d6898e5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RUTO4ZDqlhW0H8z23xGLJuxH4l57_ymY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDIxMiBTYWx0ZWRfX78CAVujKuQcc
 8ppt7wjh9wvObW4t06E52g+rQ7mYnyn3ElYCNRHS6MHqjd3vqVbq1kLJ2KOU6qZy2BQEsPStnjh
 5s9J5rI1MBzSeymBaaAcidkfWQK4gzhmr7PXT07fgXHATuUVQF4Skf6/kBt69GOkntPNoxTHaQM
 msV+6xrFV1Zga0MF2qy41k+raO39Q6/hjchKA35B6VCqyGS8hWWYbnKdlhQJkTioeCaT4WClHyD
 Xie62z4U53g0R+k2bfczQVkw+dZVtjaPZ7KmTtrq3nMig5qZcseeIxAhpbIdBx934Mp0bZJypy+
 4IYQ5pRLwLPd3WJL+AaqQqbLR2Anr2wfCR2yx3i3h7e65xOKT5TmWoypctdt+9DmfurtU7GYmF6
 rxQ9ui41YGNMgKwS76Fc5oAn2QMYYU+kMaVT8Ul8J+9BC8B/1FFfTP7wP81Qsd5eYPQSNAxY
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682bb430 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=jJrOw3FHAAAA:8 a=VwQbUJbxAAAA:8
 a=7CQSdrXTAAAA:8 a=9j9lLQFCJERsiU0aoWIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-FEs8UIgK8oA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: RUTO4ZDqlhW0H8z23xGLJuxH4l57_ymY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_09,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_154403_502506_842E7317 
X-CRM114-Status: GOOD (  20.40  )
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

On 5/20/25 12:04 AM, Wesley Cheng wrote:
> Hi Konrad,
> 
> On 5/17/2025 11:28 AM, Konrad Dybcio wrote:
>> On 5/14/25 8:24 PM, Wesley Cheng wrote:
>>> Hi Vinod,
>>>
>>> On 5/14/2025 1:33 AM, Vinod Koul wrote:
>>>> On 16-04-25, 15:45, Wesley Cheng wrote:
>>>>> Hi Vinod,
>>>>>
>>>>> On 4/10/2025 4:53 AM, Vinod Koul wrote:
>>>>>> On 09-04-25, 10:48, Melody Olvera wrote:
>>>>>>
>>>>>>> +static int m31eusb2_phy_write_readback(void __iomem *base, u32 offset,
>>>>>>> +                    const u32 mask, u32 val)
>>>>>>> +{
>>>>>>> +    u32 write_val;
>>>>>>> +    u32 tmp;
>>>>>>> +
>>>>>>> +    tmp = readl_relaxed(base + offset);
>>>>>>> +    tmp &= ~mask;
>>>>>>> +    write_val = tmp | val;
>>>>>>> +
>>>>>>> +    writel_relaxed(write_val, base + offset);
>>>>>>> +
>>>>>>> +    tmp = readl_relaxed(base + offset);
>>>>>>
>>>>>> Why are you using _relaxed version here?
>>>>>>
>>>>>
>>>>> No particular reason.  I think someone pointed this out previously, and I
>>>>> was open to use the non-relaxed variants, but I assume using the relaxed vs
>>>>> non-relaxed apis comes down to preference in this case.
>>>>
>>>> Nope you cant! There _needs_ to be a specific reasons!
>>>> When you are doing read, modify, write, it is very important to know the
>>>> right version to use...
>>>>
>>>
>>> I mean, its a write readback, which ensures the bus transaction is complete
>>> based on [1], hence why **in this situation** it is up to preference.
>>>
>>> Otherwise, w/o the readback then we'd need to ensure writes are made
>>> depending on the required sequencing (in spots where the sequence is
>>> strictly defined), and that can be enforced using barriers.  If you feel
>>> like using the non-relaxed variant is preferred let me know.  I can replace
>>> it and remove the readback.
>>
>> Readback is stronger on arm64, as otherwise the writes may be buffered and
>> not observable at the other endpoint even though the instruction has been
>> issued, even if a barrier has been issued
>>
>> Some resources:
>>
>> https://youtu.be/i6DayghhA8Q
>> https://lore.kernel.org/linux-arm-msm/20240618153419.GC2354@willie-the-truck/
>> https://developer.arm.com/documentation/ddi0487/latest sec B2.6.9
>>
>> There's been a real bug observed (pun not intended):
>> Commit 2f8cf2c3f3e3 ("clk: qcom: reset: Ensure write completion on reset de/assertion")
>>
> 
> Thanks for sharing.  Useful info...The way I interpret it, even between relaxed and non-relaxed variants, a readback is always desired.

Yes, and IIRC it didn't exactly matter which of the parameters was set
first, so we can use relaxed

Konrad

