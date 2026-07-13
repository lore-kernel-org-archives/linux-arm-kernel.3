Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00073C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 19:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsYB8yHPbPP+skFaM9JiYXJZSC7Kk8Ggqc+cNJG8mMI=; b=upR0RaGFF1G1Syi52FuIJrGW0t
	9NTPdzsOo83DPGvaVO/X4uXKqTQTC9iNP6+bsw275k1bkPxf7mBxNVKcQQlXu1EeQJSf2cAYrMcOZ
	AYm44ogiLCYzdzxGfsKXiD660JeFOmx5JeNOFzorqye11m5dV9qgneHShOS8crYR6a9n7U40aTdyT
	vYnq5J8Nx+42LnBVBbwg7Fm/v714LnKaQQGQ9u+YKTWIAI+oz48uDxJYRuNkwFnijjns32SvA0ANZ
	9i1zcrcqT10+XNIntqbVdljJI+tw1+7Nmx22svLEOOWIdANbOPvz907MEDEuy7043ropSUWw0KGrI
	ktKiTJ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMd2-0000000AJwp-2gvL;
	Mon, 13 Jul 2026 19:47:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMd0-0000000AJwR-2cVq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 19:47:47 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DJ9QaF2256804
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 19:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LsYB8yHPbPP+skFaM9JiYXJZSC7Kk8Ggqc+cNJG8mMI=; b=E/gg9+NM7cdqU6GK
	J1bGF6571fqlPr11tx0ljupGSTx+WHiufAYJ0CWbEGlT9oszrTgyU+z9FAknSGwy
	fG9jvps2RIE10yGfVj2sWn/RcY8J+JeBzsMePAQJVgF6/in5qK7E7c1fTkvv6XhF
	cSG2MzLBtd29VIrn8aHj7+wshe1L8u998/J6n1ewYeW/yUZ1r+nwS1ky7lk/74b+
	AdR2WG4PBFDPeLq3sJYZyGo3Z+eF9xf9+oRcovn8qc+W8YqS63VQisAf4yQaoOwb
	46FcO5uxfjisKfE5RqYIzistF+zZ4KclOKJJMXUzyENA2Vm344ngFQJMnXVmPosR
	iwBOMg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk9tbmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 19:47:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c916d17dd43so6094092a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 12:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783972064; x=1784576864; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LsYB8yHPbPP+skFaM9JiYXJZSC7Kk8Ggqc+cNJG8mMI=;
        b=hyeRPV3vfxEaXItZ4hG5Qd3GqDhC68v7lBCo1mBcGr4Xs/afSsuyd40hCcbZdoW4SR
         7qg784tOL6F0giRsd/8il5Xx0yciQzkVudA9oVianv9TLXsTm8ou31W2qNv3nnhFgzvm
         QPg2I4OHsw3g6sKLN05A+jlVc5KHUfvC/OPf+SxF3Zfer2T6HelWxOQ29lz55S3lVcPd
         O6S53Bews60jEwjlDlSfWYDEA3u1Gla7LMDSQaCKpsaWRq86DXxkdU3mGoQDaImvc3Xb
         WG7tT5VzXu/UeICzjVUu3aAeI7rgSG8w6fsWOkWFH5VAwhv1Rev49/k0KDIA6No59Fgw
         Yrug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783972064; x=1784576864;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LsYB8yHPbPP+skFaM9JiYXJZSC7Kk8Ggqc+cNJG8mMI=;
        b=Sxz4w86zLYvq3rDC1tO9aV1nY4YcKkRCnYHRefbbuIa17JpN0PbvJj/6wwRnPjrWlU
         zIJNWz6UIvzQtxlbSTBWZoBWZeRBQc0jexdhEVJgb9ggI/L/FtoCyN+sjaDZNdvoT60t
         5DB9y4HH4BEr3Uw1Y0fqLhiT/SN/x3mKgPOKphB4/ZfXXiWIRPsISjgXYr6tKQpfXIcb
         kzj7XR0XCR7Ssg+37ibxOsQ0oJMQNDqAx7VMDeXz6GGwoN/7YLTyRKEzIZMhrnTFrToA
         2znfKKPwKfVYS2XMB8dkq+cUgU6DLMrD/OS/MAx6HTdllSi1Ih4H4aUoYf3d0qmoaYiR
         hQJQ==
X-Forwarded-Encrypted: i=1; AHgh+RqxNJ1tBX9dTle97hOPl/LA3xGKef0df3DjduqT1fVOgF9LX+0oMVt7HMklwzEaPTy2zFQ/KXLfOPMCXhJLvBJt@lists.infradead.org
X-Gm-Message-State: AOJu0YxH4ZnVlPX0kqCNmvCUbHJpgmHieJz3/80FbRmInBQ22cAhOX31
	E4S/fXLuYZkTgJ0uygSEUvTtnd1BCDL5gF25icLBXLxgewp/70zHImOvYTIqr7giRYwNJdXHxrq
	PPfjQq96p+WqQxA4s0kY7zQaCWEVfXSn/RiySeF8bIb9EA8sbCrebbWWU8ftiON41ji57NhNjpT
	oIOg==
X-Gm-Gg: AfdE7cnzwQzZYuWuMM1FNW5G8Y9eAFPrQxtQOxYW8poXXw4BPVh7abwRmNqiZAHiL+V
	HNCzIc7wCXsMFuMP0i5zFbYxS66x0sEqIlOnGMB9S8IJK2JyS+vQmVQLfuLTVZjSN9KqwqOS+j8
	J92YK2nj6ALiU9j+X3Roo2eOm3ej1fAed4cvEuAL8buKdwwlQ1pkN2s5wLQmm9q0t9+tubs6Zqn
	D/TLNYCI3LauBmKbbop/QULhUUN+aAqfRSubTGVCWpXNdImg2iGgboFINz6HadC9rCPr6cXda/a
	nqiZNi/Ioil6xZKmSIbCSj+k8LGGeu2iN5D1WzfJPH4g76k+3qVCxm4i2EjvxOgTv9c0VOaP1Tw
	KQNoso2RYH7pys/aCYprcY3KCKxfG9Agdc2s=
X-Received: by 2002:a05:6a20:6a28:b0:3c0:9c19:65be with SMTP id adf61e73a8af0-3c110a74421mr10454885637.70.1783972064014;
        Mon, 13 Jul 2026 12:47:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a28:b0:3c0:9c19:65be with SMTP id adf61e73a8af0-3c110a74421mr10454838637.70.1783972063592;
        Mon, 13 Jul 2026 12:47:43 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ba45b7049sm6823350c88.12.2026.07.13.12.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 12:47:42 -0700 (PDT)
Message-ID: <e8255fe2-a67c-490e-a905-ed056c6af950@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 01:17:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] arm64: dts: qcom: eliza: Add GPU SMMU node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-6-c9f1354dbd29@oss.qualcomm.com>
 <10b0ad51-8766-449c-a51c-979364e6c781@oss.qualcomm.com>
 <5fcc0bc1-7f9e-4611-be77-42860e0f4c74@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <5fcc0bc1-7f9e-4611-be77-42860e0f4c74@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDIwNSBTYWx0ZWRfXwr8C1Bam358c
 gzXL+kniSHX5Q1kZCpf3vtt5VobULm0J5nhBlHzs3TDO4GuI4DjGCPOLC+D7Avh9q7ox1sei04S
 aNSNdkP7+eOfDpjXNj7dea51vFsvTHWAEsD/pQlN/vno+hgyj1V5er+lcXI/g7IK4JZGQ8U6qel
 HwXfeve1yd76zEHfebHNRgS5llgZh9fsnKBypMD0S+Q1Sdi8AMjPx8nE/Mjv8VdxsRVo5h2uVXm
 TBBps2GLRr6Cu/mUFHc1mrmT8Moi48mFr5D3Ft5FQsIeAU6oD1HRQAe0RiXqVP+Jh9wIeCu3+1R
 WyO/nTGhJNiNa3eU2S4trhC5fNaOuilksrgh/RZmog25uzV/9rosRsZIq1eSQN7NUMZEzzAJKnK
 d+2QYw7pgBHBdcyxBtCSmVMxQrrORark1R0lR0AIcVGyHXwnM3UTqvMeyZugI919XLVBXi3sPj2
 2d02HcKKP/y7ro43CpQ==
X-Proofpoint-ORIG-GUID: 2X0_MaWOK5b-ENM2nPIMrYo3lDSUIhFt
X-Authority-Analysis: v=2.4 cv=UMHt2ify c=1 sm=1 tr=0 ts=6a5540e1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=yNfbWwvibup9Ri9izU+P7Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=sy2TSPCRsGNh5uQNLmIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 2X0_MaWOK5b-ENM2nPIMrYo3lDSUIhFt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDIwNSBTYWx0ZWRfX8IMAPseXONai
 7oJZyBmtQQnu2Kjyd1ICGHYk2lc/VtT5HL15iKW4UiO+yrhqaFDfVLJsdAEUIRlJ9e/ntEWOlKS
 GctFXU88uhvI4D9NnXvSzWm4kAiztaA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130205
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_124746_816972_A101A2BD 
X-CRM114-Status: GOOD (  19.05  )
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

On 7/6/2026 4:38 PM, Konrad Dybcio wrote:
> On 7/6/26 1:07 PM, Konrad Dybcio wrote:
>> On 7/5/26 10:14 AM, Akhil P Oommen wrote:
>>> From: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>
>>> Add the nodes to describe the GPU SMMU.
>>>
>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/eliza.dtsi | 38 +++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 38 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
>>> index c5635f22e2a7..e5b8377e6c3a 100644
>>> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
>>> @@ -2674,6 +2674,44 @@ mdss_dp0_out: endpoint {
>>>  			};
>>>  		};
>>>  
>>> +		adreno_smmu: iommu@3da0000 {
>>> +			compatible = "qcom,eliza-smmu-500", "qcom,adreno-smmu",
>>> +				     "qcom,smmu-500", "arm,mmu-500";
>>> +			reg = <0x0 0x03da0000 0x0 0x40000>;
>>> +			#iommu-cells = <2>;
>>> +			#global-interrupts = <1>;
>>> +			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
>>
>> 674 is the correct globla
> 
> (modulo the issue i explained below)
> 
> [...]
> 
>> This list is not quite correct. It must be sorted by the context index,
>> to which a given interrupt corresponds to - the driver relies on that
>> to give you information about where a context fault happens
>>
>> Moreover, I see that the interrupt sheet has the bug where some
>> interrupts are offset by 32 from the base vector, and others are offset
>> by 31 (i.e. the SPI number doesn't equal irq vector - 32) - please find
>> out which mapping is correct with the right folks

I reviewed this and looks correct to me. Also, this matches the
downstream configuration. Did you confuse with Dest Port vs Vector ID in
the documentation?

-Akhil.

> 
> Konrad


