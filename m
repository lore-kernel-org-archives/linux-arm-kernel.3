Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8A5CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 09:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2h6bbHMCKo8QBg0xCoQbI1gK6dLPx7ToSsyB1dQ41Lo=; b=g6Hf+68GLqtuBNUDxwJ3tYECcv
	8mnIhwTDl1TTe+vr3lCtQP3q/7TI7ALaUEuT3CrKeMX2USObG29e84sxH99zcgssqlDQIutHbjmV9
	HAuVeSxgCXlwenQHDu84LKYvKJwp6hcyVln9/c+KrfKB3yEucLkjrsn8wydxa8Ws0BQr8jwxeYO57
	ClPYWCAQjntnuFKDnf5wXP+UOoFV5lIXqKYhri8ZTCbCAMACQpTAeh9Kr1PaQMChNmCL+Kk6S8tVK
	6+j6sNk1xmB3Aihp0V90x0LQGkysBxJdEEWY8Zr7XFzObLr50nl36xuHHAI+yJEgIGGyHw/dB3S4A
	L+GZhoJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waVtA-00000002FLz-2NDg;
	Fri, 19 Jun 2026 09:51:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waVt7-00000002FL9-42oD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 09:51:51 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7P0C33708051
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 09:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2h6bbHMCKo8QBg0xCoQbI1gK6dLPx7ToSsyB1dQ41Lo=; b=dTeWe7Q992PCmQNw
	hydDFe4n7/Yo6D2UA/JrjX3/IhxUSmsZVVbk5i1ysZYlHqaCPF3EZ9dMKSL4T1MG
	HJN27oz+qa7jBkUSXofWGEI1FJjmvfcYjn5YM0UjyzKRXZVVCy3aosCS+JRrK4o3
	afPUf9NjyWPv5iey0fT+oUBXfqJReZ+SNAj39a81jlfetUwSOkdU0M2kSyQoz9AA
	BOwMkQ7FjmKgkSdhmlP0KI06EYCtjGyNqEebk85hffhLSPekLwzmm0wMgg7kN1jQ
	j9B+r3lVZgqukv3PBezzIdvanCwccxLXVqrW3/eCKsTqPjVGi2KwHF3bbyHSqega
	Co7BwQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp672ndr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 09:51:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6bbd0afffso39182625ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 02:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781862707; x=1782467507; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2h6bbHMCKo8QBg0xCoQbI1gK6dLPx7ToSsyB1dQ41Lo=;
        b=besBKnHegWiJc4IeItylsVAvc+MVx22dQo9gSxGhRMbFeQl8RngzQwYeorUsBdNOLI
         Hv9cahMEukHeANjzyBEU/fDcRXz70cfYL3a6wnrwMkqbTIE36wo6hHQVv7cwcDV/PVWc
         xRVSPMIm2KmxX3G2q2sKtUc2gDFiRLWVLQ+dciCn3CLZToB47vNY/tdF1rVJ26ZG8p9Y
         nJqTL75z7JD+LbNM+HBCnFfc+fFgXep6Mj4JSAFxnOl7dCWX9wvgBymEcLafFc7Ur8ND
         UY6sy8wlkgIcr02ACzgxBa0tX5GuK31jNNU23s3jjs0xI4dOPu+Ul+L2ZVdc6GOXCG8e
         0/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781862707; x=1782467507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2h6bbHMCKo8QBg0xCoQbI1gK6dLPx7ToSsyB1dQ41Lo=;
        b=md3Po6FAgslZrIKydJ/E/RlruXdSQey/autTVk6KHFIysbR66Xmqa8Gx+P1l1ScQOx
         41MDpI/GGr5U7/CM7M3ajt62JHfUqr6y3pqmyKzrReTBuCVoMrGHJTOL2UCPzF+9Kzp/
         EdwOxk7mbfUY+W96C3xwL/guM+wYdjjAcb+DYvO1pGB0h+HbYpmnph0PPF63yktgtZUL
         hXASdnLpVuF1kWqt2bKV+X0N+isTN742b29E5CNUoWePywFdzsswyQnuwEWty+DSEbTG
         0wHvhrlV4UoiLAaxKqI50HrTi/mQh/0w+dNMn/HUTUjR+kCKp0d/5/a6Q5eRtm7TQ020
         xjyQ==
X-Forwarded-Encrypted: i=1; AFNElJ+rhxZAW3lI6so3ZwN6/gtngrZA0APVk81txVwwx61hGo2lGiV65mniQq4b6IAHDLIjBHKP7nxa/jHjyNSOBOIP@lists.infradead.org
X-Gm-Message-State: AOJu0YyniQX1hpWpU+IG/ZsbFyY6JP38jMsNLa9Fnj1O5lUBpZ5CquZT
	uUwIUjf8Lx8ympnO/W/loBN82TGYgujkEn0sWiMTgfnr4qxEmrc/Cpjh2kcJwQW5ZsDrEr2sGgU
	MHM9z9PLQ7ESeatO+NFk1p7f4JP08RPfRHPqVi0L0J797Kpy4kPOjmwRiX5Rqw71yIwVWmIV6Oq
	sDWw==
X-Gm-Gg: AfdE7cm8ncMDUdakKlBAwnMU4vthYobBMJNvXmE/8vBDYUu9X69mhZmlZxi89ClU9wR
	ASv/8oE3IMW8VVr4AwRRmFxPd+xwq+xT8zulv+Yu87FmU3RdZ8viHTgFQcwZ1b8VjH6sogWhQcD
	KGpt8Q1vspNhjo0a2IY9t1mR7vNXaIM4hYgRuJuXb5263jcFexZAfwIZDZDUPXduSd83SQAb9iK
	aLuZLuIlmrpigoTgAncWd13kSq8DP0CZCrkphu6BUSgtzDGytnh8W5rbOUsVQXsBqH0wk6MKOri
	IA44vXI56LnExjdzPH5jyJtZV9MPVAZD5Tu6QnG6nFFHEfTzNyxEC1MHYmddDmCx85PL8JnZgDP
	tm9DmsA7gzkJ28T+YTabdGpGmB5cmyuuJrUYoUQ==
X-Received: by 2002:a17:902:ec82:b0:2c0:cf44:3b3b with SMTP id d9443c01a7336-2c725d7c843mr21063445ad.24.1781862706867;
        Fri, 19 Jun 2026 02:51:46 -0700 (PDT)
X-Received: by 2002:a17:902:ec82:b0:2c0:cf44:3b3b with SMTP id d9443c01a7336-2c725d7c843mr21063035ad.24.1781862706405;
        Fri, 19 Jun 2026 02:51:46 -0700 (PDT)
Received: from [10.219.56.41] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c720c23b8bsm17913045ad.80.2026.06.19.02.51.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 02:51:45 -0700 (PDT)
Message-ID: <b8ef8488-7585-4226-9b8b-c79f8caaffeb@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 15:21:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC interconnect
 for adreno SMMU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-3-2a6d8ca30d63@oss.qualcomm.com>
 <p4xnrkcpbufkkbv4kq5civbt6hiwv3warrz7jiyinsfkihfedh@jfa7sgyzot6j>
 <26d51cbb-2d87-4564-b3c6-cc61ab900e19@oss.qualcomm.com>
 <3384ecdf-599f-4862-a3c4-9f54b4ddfe63@oss.qualcomm.com>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <3384ecdf-599f-4862-a3c4-9f54b4ddfe63@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2YmBAkKtvWCnTdAaaiiHX0zrtXijTNx-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA5MSBTYWx0ZWRfX02MQWJlOy08d
 Z6wBzuwQMoJEX9MPQtSvcyQ9IUlkr8myqoBaUFZ1gqMs6WEfTJmB05H5rfGAaGxFlmp9lEB39r3
 +eUqbmnqIbVSh1SaZ8PKa8x3t5ZE7mdJXVhHfdwb7jGuPw3tWE1B/Uu+Hfj7wUMB01LF9lHt2uX
 Ezn7bBkqaIchdr0G5oywaIyBOPIuYxhbteMkY301axlPCkU9DXwnWsHY9KC82xAcaLmYmzjhQcv
 OPre+BpeRRo0efZffaqfWGefu3fT+/FoSNwoPeW10l/ofeVhD4JoWM/vTAdKdyUv6oFtr4Xt+Qp
 pIQZHynaVAS/qXZtDW5t1VvpuR86A6fniJz8/KI6QUrxTeHe2fm5gdKFnL6VfJI771iVuh3HNsB
 bHZd6JzWiSdvKflurCcpMNpoTg7exiBEwCAY7boA046hGBvMCRhZDLTzRDULhfR097qmdEFDkMl
 M5ON0HJY2kJ1T4xvCtw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA5MSBTYWx0ZWRfX6rgHj6fol+Jq
 ghNbdf5NhMTxi01IxughP1pA5wn/QGfkcV5WSzqbJyAeGy7tF1pQk1E1PDh9G5X/kRILU0pZBQZ
 OnDXJ+u5KsRu09Bb8hUu0UCR9VlVqfk=
X-Proofpoint-GUID: 2YmBAkKtvWCnTdAaaiiHX0zrtXijTNx-
X-Authority-Analysis: v=2.4 cv=TdOmcxQh c=1 sm=1 tr=0 ts=6a351133 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=u9O3v9hlqvzur-BCVJ8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_025150_012192_A91F305C 
X-CRM114-Status: GOOD (  20.99  )
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



On 6/18/2026 2:56 PM, Konrad Dybcio wrote:
> On 6/8/26 4:37 PM, Bibek Kumar Patro wrote:
>>
>>
>> On 6/8/2026 7:27 PM, Dmitry Baryshkov wrote:
>>> On Tue, May 26, 2026 at 08:12:04PM +0530, Bibek Kumar Patro wrote:
>>>> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
>>>> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
>>>> are accessible. Without this vote, the SMMU may become unreachable,
>>>> leading to intermittent probe failures and runtime issues.
>>>>
>>>> Add the required interconnect to ensure reliable register access.
>>>
>>> Does it only concern the GPU SMMU? What about the APPS SMMU? Should it
>>> be voting on other interconnects too? I guess so, because currently I
>>> see that TBUs vote for various interconnects. BTW: should apps_smmu also
>>> vote on the power domains?
>>>
>>
>> This race mainly occurs in GPU SMMU, where the GDSC can have an
> 
> Mainly or exclusively?
> 

It is exclusively in GPU SMMU as of now. We haven't seen any instance on 
other SMMU, e.g pcie AMMU, APPS SMMU.
Also as per my understanding of the architecture which i mentioned 
earlier [1], this issue will only arise in GPU SMMU.

Thanks & regards,
Bibek



> Konrad
> 
>> independent vote on the Adreno SMMU. However, the GEM_NOC vote may
>> already have been removed by the GPU (or any consumer of adreno_smmu,
>> e.g gmu), unless it is explicitly voted by the GPU SMMU (which acts as a
>> supplier for the GPU). This mismatch can lead to SHUB timeouts or NoC
>> errors.
>>
>> Mostly this race reported in suspend/resume cycle (when gpu/gmu devices moves to slumber/suspend state before adreno_smmu powers down
>> and the later doesn't have explicit interconnect voting).
>>
>> In the case of APPS SMMU, such a race is not expected for any known
>> use case. APPS SMMU is part of a shared infrastructure block, and its
>> power is typically kept enabled as long as attached master devices are
>> active. Therefore, explicit power-domain voting from APPS SMMU may not
>> be required.
>>

[1]

>> Thanks,
>> Bibek
>>
>>
>>>>
>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> index fa540d8c2615dc02d941eb16bc7253204c2750bd..eefa4b836a81374ff437ab4bbcbc3fecc1590ab6 100644
>>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> @@ -3386,6 +3386,8 @@ adreno_smmu: iommu@3da0000 {
>>>>                  power-domains = <&gpucc GPU_CC_CX_GDSC>;
>>>>                dma-coherent;
>>>> +            interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
>>>> +                     &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>>>            };
>>>>              gfx_0_tbu: tbu@3dd9000 {
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
>>


