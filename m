Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AB2D2D8EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 10:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZYKX34HbyGd3trz45+xdQmtQY+aPDvL9EcsqKfZ20s=; b=OdNBF2T7fBBTBUl9Sq64DSXn7v
	DSD/w5rq4MW5Cw/2DltbaprLVXaz+CXkitAcoh59MJdJa5gFaSMc4/jHCQgFw5nveMoD1R86Xow6Y
	bxQUjUQzgK/9gLPSrQLU4GP39xC0aFP/476mklAIrb+/GYipXi3LnOyyJoqgmdTgY/azMkOO5f2RP
	dQtjGRiMwbnm0Vea2ykh5aOFDkkvl0WirXIcOkyln0bBE5lH3IxFFi+g39FOEM9FQB0dZfnJ5oyHV
	4f238it9FuPwO6uee34eke12BsBOsgBMMHVPMCm87Ig0aU6Oy3oKhQyTvTXi1C+yKbGZ7XAJjQIbB
	BjhumC/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgLP-0000000E3Y8-1yLC;
	Tue, 27 Jan 2026 10:30:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgLN-0000000E3Xk-0byt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 10:30:46 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAOJLb3714671
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 10:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BZYKX34HbyGd3trz45+xdQmtQY+aPDvL9EcsqKfZ20s=; b=LTLwNie5R4NqQDe2
	D3C0VRXvK5iU8BwLWbYW8e4NTK+9jKG/6gqgcuimZEOAzcbVzlcabXRext/nK7MI
	+dX9NkbojnDUeo87cho2BUcoAR0+n5ubZjmhkr2wwL/40A1hfTODaESb2w7ksexk
	UFhZs3IE2BiBkCN/OkIv9JkU4WE+VSLReh4JR3X0QbiNEdxY7K05VC/Obw3tYFiN
	iPsFNTiiX9y65LA0nT3nYnOgd2L+UmVdFM+xv2OpMXr9DVF7SeXAUWj25/dC1OR2
	0YTwF/V/CGBVICOzbsfkE521NNwY1QCckE3PuN/ixZD4DSIZpXgSoLvdqmqme/oH
	VKNNuA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv0amtn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 10:30:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50146e00a23so6637801cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 02:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769509843; x=1770114643; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BZYKX34HbyGd3trz45+xdQmtQY+aPDvL9EcsqKfZ20s=;
        b=YxQ2fDPuV0OOd3pccSR0puVrkiS7H06i5INC0e7oinz8xYsWGEhjrIRJbBFPruOVMi
         0aEuSEyNUMSDZRluznuhRrHzqJwg8TZVbsnhMnAVQFTARPpJrtsGBau6Ar9ln7eobzLC
         lV0Ev/xJGoCU5JiD4T63xXxlXDnrpGD5ziVGfGN8t0WjUbC3a746QG38/KgDnnDJvFYT
         x7QqOBGiOMq5NWP2kGBlyOduKuftEqsePv+ZntnIGPLEiV/4GeJQ22BYLHv41TdGUuN3
         yuuNxX7Mx5zAJb5oM3i7DdLoltDqJsHYy+SXyExuXdDzL04fG8k8Hq8Uz+Y/Mf5/GxSJ
         T/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769509843; x=1770114643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZYKX34HbyGd3trz45+xdQmtQY+aPDvL9EcsqKfZ20s=;
        b=IfTBnUmF6kQ+JVA4IbTL+38ZlUOD0ZARjPxhw6OA1AsgH/FCHfgd/KbFoZkbCVcxFG
         AA5HzK3xeviFhrPtQTZ3OxlAgQw5dK6kuM0MmXFH+uvdYyuxoL1s7A3Bix3TRU6Ahqnw
         YJ26Xbn3q5gPEEI13fKPEYAKLJlJ0UhZhY4EtQG1VBstN1QjWzmlLVH3EIhyd9NIcIGw
         OMuOeMVCs4gYiuqEqabEO6AXDUfFS85y8nbvNK3S1ABcXbKiApuU6hyVC8Pqwny9Wg4e
         n/dkfhZx8sEOfMlBthXbI2uA9xorrAULzd2YrZp20VzAeooF9X4w+7NUvJEzEj6M7HiK
         lo9g==
X-Forwarded-Encrypted: i=1; AJvYcCVmPTFna6RdHuChS0eEns0GtVCfqoVCS/lv+ROGjcEc7gld4hUVrWeKPPHieT2avggzhMR7IOMHyPhxFhct9Psd@lists.infradead.org
X-Gm-Message-State: AOJu0Yxcedsa0XFmhuvkTvBBPT/+50/YlUKkPlcV7GyT0akG9oAmrdOl
	Nzbeehc9v3OsEvFqjwKyq4VHAVeKAviJBQGn4RmmYRAzQ3HDwfBbnfJk0hYdMQjJ/AaUQhv6FHF
	LHiiAf4hLUUi60Bx2Q/i/2X3oUKbBFMvQk6ggLugAarzw/hReZanWawM6QPkR8AJeQJcl0gtBMs
	0FyA==
X-Gm-Gg: AZuq6aLEnCoV7zA3oRJmBoYKHlwSg/Wk3+GOlTuEXIJmuP/yj4PHHMzRpUDH6mL+pQB
	UysJprtQDIK1mu2W8M4F6k43+2Fmr4jhGHks/Mv9/DNVZr+XOdc/1pziG/BsPYNOwp2e37/Y1u+
	kATaYLSGCzCoK4b458hq9GCu7zkAaGeuoTNnc4shklJPk79wMVsIvusfvEvmvfKP07e83IgSGGh
	xEDFmhxDvci4DeT2XuhXD5Y5wIUUh/HylhzCnZ9nSagw44BvFCFZ8Vr6i5jxDP8EFln2d6yb/uP
	CCokyeo+pxpRpBQ1Mpk0oUQ988xyira0uqmqJAIPNTFIIzer00kf0rqR8IyiqT8kmispQjX4EgB
	m1dd7TwGzOTeWI+uzWsylzxXqH/qGCi+Uzz+6Fc5u4kyVB4qQxV9CnK4ixeoRkz/8T8A=
X-Received: by 2002:ac8:5988:0:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-5032f9f14c7mr9458321cf.6.1769509843461;
        Tue, 27 Jan 2026 02:30:43 -0800 (PST)
X-Received: by 2002:ac8:5988:0:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-5032f9f14c7mr9458111cf.6.1769509843081;
        Tue, 27 Jan 2026 02:30:43 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b3ea422sm6007927a12.10.2026.01.27.02.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 02:30:42 -0800 (PST)
Message-ID: <80e774c9-c4b7-4129-aed4-17830377bd61@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 11:30:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/7] qcom-tgu: Add signal priority support
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-4-songwei.chai@oss.qualcomm.com>
 <f34abcca-6b09-4f6c-96f3-e2295a82284e@oss.qualcomm.com>
 <bcc3547c-b7d5-41a3-b291-4669c11d7f1c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bcc3547c-b7d5-41a3-b291-4669c11d7f1c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: __Ps8vrImDoXoLeG9BKraIxLMLBdEz8Y
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=697893d4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Vvjh0lqrh_H4iIbA9MMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: __Ps8vrImDoXoLeG9BKraIxLMLBdEz8Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA4NSBTYWx0ZWRfX5PkwslSceq75
 vSf03DJCoo8BCEWh+h8zoGDiyBmQi5SzkxE/MFJ1KWITEEv2aVMry1stiE8MMAqZPFVUZHtRZle
 ISyIn6ZHzfWJd4/YpbqOrlO+ZKrqw9FUoxZdz10dmUQLZoWXZtydAV5L/UtSu7e6bOD8fEKuoQH
 xiA9KkicxfqUFT2ZKulafqMR/rpD8bVVONFvy94Fj9TRRGk1zcRAQpNP5F3fAz198JVUcRWOMpH
 prSvTNrn0Ul6bwcEEbr1018eag+owldmEnQyuqbkO1KPA7omWYR8W/LRaTAwmodg8a3sr0letUB
 p1SFyvXDUHcoUr4Quc07uGo2Gu4Sx3QnVrneXa5ZQo7G83zrZjHr11N6Prtt406uuZNRyfbVuMn
 qMC7Mifxan1AhtdTE77OUXe3XZ+/d1HoRC0VvgOmF2U2h9k+nkrRxh4jDKZhZa3wdIPxY+epJIO
 R68e7ZPsPbono32Fkig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_023045_388141_03DFAAE7 
X-CRM114-Status: GOOD (  14.96  )
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

On 1/27/26 3:23 AM, Songwei Chai wrote:
> 
> 
> On 1/13/2026 7:09 PM, Konrad Dybcio wrote:
>> On 1/9/26 3:11 AM, Songwei Chai wrote:
>>> Like circuit of a Logic analyzer, in TGU, the requirement could be
>>> configured in each step and the trigger will be created once the
>>> requirements are met. Add priority functionality here to sort the
>>> signals into different priorities. The signal which is wanted could
>>> be configured in each step's priority node, the larger number means
>>> the higher priority and the signal with higher priority will be sensed
>>> more preferentially.
>>>
>>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>>> ---

[...]

>>> +    if (tgu_attr->step_index < drvdata->max_step) {
>>> +        ret = (tgu_attr->reg_num < drvdata->max_reg) ?
>>> +            attr->mode : 0;
>>> +    }
>>> +    return ret;
>>
>> This is very convoluted
>>
>> How about:
>>
>> if (tgu_attr->step_index >= drvdata->max_step)
>>     return 0;
>>
>> if (tgu_attr->reg_num >= drvdata->max_reg)
>>     return 0;
>>
>> return attr->mode;
>>
>> ?
>>
>> [...]
>>
> I agree that the expanded form is clearer step-by-step, but I intentionally kept the current version as it keeps the bounds checks localized and avoids multiple early returns in this simple case.

Multiple early returns are not an anti-pattern to avoid

Konrad

