Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841A0CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 09:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ce3Ew1kgGBzVv6bcwdm6x/HblgO4rzUZSXd+QkZ2/04=; b=oIzIv6kK8L1WRYuYwNxt6oZvcZ
	NLd2ah8dirTrTp9OXqTf+wYM6UkWm7IJp+lJNyZm825i2RMPHMOTZB8zWX7F0pLVaYU0Ik/4VQeGH
	6lqYz4UNEQoVMn+ovwmMHq3nuVJuMLGsyKymOv00Fv14cHVuAuEd3k01hYws12CGL0SyHcITxzSES
	s2adHlmY9qUq/psVJu/Er7ZRR5F6NvXpHh4GAbGn9Q/aN32Yj1q6tRum2Yy8frcOWXjxDnCeJqr0L
	EKSzeTvu5O5tl9e6t2omfasLc2ZSZ2c7CbOmPWW6cFpLrZsdt0vJpYUBD5v8pVYV4ADI96LQ90sAq
	MsGSakBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa91F-00000000xFV-1umJ;
	Thu, 18 Jun 2026 09:26:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa91C-00000000xCy-3ldS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 09:26:40 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8G1xr1157457
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 09:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ce3Ew1kgGBzVv6bcwdm6x/HblgO4rzUZSXd+QkZ2/04=; b=iaLU2eiKyGioQKfF
	/1fGySA5k47KEhF5b7rmC+ewjIjlpA8gHmg1f2K1rynLSajU8h3loDZFIzXimb7U
	5Td/y5PXvhBxvY7hi0F0W7TOoNeJsCTT3O8mfhL8d7pLvup+prt1hIiqJcn6cUmY
	OU17XVNl3Uevnom7ONAipUD/sFYQTqDwTrJI8K2SSViWZqze7un2V+JaK1/E18Ef
	JKwKRR5OVCcSvbUX8UkMQq7IGCWNAX8d3xtojTjKDlgouxO6hmsQ7F9yFHb04HJt
	fN+1MT/OC5Nt/WWguR4EMqsV8IqhFPFc3zk9Jmzp4XRq0yJ1UuCau4T8T/GDxd16
	ER0Jzg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev19a2rbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 09:26:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915976b2dffso15148585a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 02:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781774797; x=1782379597; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ce3Ew1kgGBzVv6bcwdm6x/HblgO4rzUZSXd+QkZ2/04=;
        b=PotkLRHkXttlKnY5qoMBAESMFo525o2BPLG5y79lsewj4q78Rn3JREHXxTYabMc3Dr
         GddaKKZwNN+EdkFzOXOZzb2ZgJJYy0KHGdbo47PArdvCDZxkqhOG2NbEV28A9h8Lw8H2
         ihkdp5SI1mk57fY+e4s2hg0FJuFrOiL2VLiMcIQ0aViWUqHC/PLyuA3p65nqxGS7ug4a
         p9rsfOQfGyCLcmtartpFOKB8a1a/NO24O7usC8uP/9HJE4n6s/JthLZH3H9cM7wLfLkL
         wweWcIFwme3lu3SW2viABiYhF8Tgh8iUvTt1M1g/AanuXGdsPLo0qq4BeZlX8GAa2ymG
         gGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781774797; x=1782379597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ce3Ew1kgGBzVv6bcwdm6x/HblgO4rzUZSXd+QkZ2/04=;
        b=H0jzykZ8OyGl5hJliSBtLhskZu0ViDI4EYmw4rvW8k3P8fENadzI6atjG/6DD8wK6h
         35FOjH/5Ecc5QMywsJUfkiIPnNgp5tUOULoaLBXLRVk8uBO10wygC+27W5i7pywZkVj5
         ijIPxYq8GWB5jEW2WBHViQ9yYJIS08WBICUSMu1voxDrEcTc/2EnTfPIiR8iy+4l9Cnr
         Ts/6fVNT8FmP31L88CyQPWGkjJRqjcx8845U64eZW1d8kOde41p6tPKVCh6awopd5Kr5
         XNHEv6KSAG5Q10oxhmqZcRcVc/vT0XsiZn+Zc7W0kmaU1+ww0xvxq2+iEnzwMgg5IdYh
         v+aA==
X-Forwarded-Encrypted: i=1; AFNElJ/zCqscn/IPvdkHw2qaHIoU2Dhpox6JranB1PIpd8KFFSmYmdTHKzVdJECmdSZ7C5IyvBM0Jqy9UAGSZCbvtsFy@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8FdMrcBjxaF7jiax0dZDz/IdVzK44yjwKtGOL9LGlJq/zYZ3l
	6QmFHU4iMCOZqsevIuA8y2dW5ZBL6MU1/S1nKKUK56z7mYooR2jusAZs0gH+BCYV0cwaio6R4L8
	N45t3QoriXurmwpqTgI8jF21P4OPi6V6HzvobRQPfBobOvesBmahu/3qRFvXKPTo5jcda+2V5/F
	VxCQ==
X-Gm-Gg: Acq92OEmdwVE9uutNE/VuSRouqxrhtR07EeX9g7jST76Z2TqX5cBqDL22xIPIpP5azN
	MOHRuXCVY5eH/VW3hywN9BlNTWOozrSduljGybsHiC87D8aZBq/l8X1vWeBbRky9lfs08AdsFbx
	5lT3n77I+bYo6d59/FzTHgXskk8h36D2lqFUpbKaUbM/zOcfqh7arfR29IDEhmyt7tJG4+1tuxR
	N/lijV/D2FEcxI3c4BoE/CZfFnANLV25sjI3dTyToqRzNqVsdlBwAz8LysWCnG2u/ZgnPoswIqE
	PkYPPNeK7bGyVQneeG5bpfMNWFv7Q+nfn/yqCSLh7Q/BYt7tIHUmQc9NMs8yhW0/opuQzOvRMn2
	6Um6dOqSvdXf6P0c0gwWC/eC2aFPzC4HqAKc=
X-Received: by 2002:a05:620a:458a:b0:90d:11b2:80f3 with SMTP id af79cd13be357-91f2b477d71mr290816985a.7.1781774797383;
        Thu, 18 Jun 2026 02:26:37 -0700 (PDT)
X-Received: by 2002:a05:620a:458a:b0:90d:11b2:80f3 with SMTP id af79cd13be357-91f2b477d71mr290814085a.7.1781774796807;
        Thu, 18 Jun 2026 02:26:36 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb83428a8sm925516266b.44.2026.06.18.02.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 02:26:35 -0700 (PDT)
Message-ID: <3384ecdf-599f-4862-a3c4-9f54b4ddfe63@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 11:26:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC interconnect
 for adreno SMMU
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <26d51cbb-2d87-4564-b3c6-cc61ab900e19@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YbmNIQRf c=1 sm=1 tr=0 ts=6a33b9cd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=HaZQysj9wVKA4b69cM0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4NiBTYWx0ZWRfX++JzvGYEIN/7
 p093AKoT5D+VBeQ8ctbuz++Gw+C11CMhEmr3dUom/T9cLRVFIFt8YQwPXhO40+kuTlZb8CtbdO5
 uRXhJWKc+onAE5Z8PF4p+vRGazjWXn0=
X-Proofpoint-GUID: YXhi85OUJpRDFiP0gYdtOijISFeX94XZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4NiBTYWx0ZWRfX8FXi+nYbYz8f
 7WJmlYLyuXBWpLgJLyF8hKq1VwiAaM/MSKu193/3igVXQQbgjrm3mKtLd7oanfD8Te4NN7gsHSG
 wolwvYy4FKGSg0Sa9IBV4H5sd+j4+yMhK9Iwu5v3lIxK6A6XEcPUc7qKWnWUUCwfOKW4FTGywoW
 qvfxRElVmHuoFx17n/ipwnA+tTxMVAp7o6xCYq0xSxY0bU7wRwCWHMLXoNNOvEVTNg5zVFvw9BS
 RJovsRsMP+/spGCY892ZS7zMa2K4m0SNqMTAvLFghrM/jrGtNC/LQFrZJtrClgH68Ehg6+qIvyA
 PME2kjgWyDypy47Bi6v2wqnBrfTbrCYbinfcVxiLpXZiIbJy6SLv0/LsOkOeeUhhaRzDFHAv9oV
 9lEcrLXIg3AB60QXQLN6TEzDSQRKmyvoAYjPzTwyLhVV/qZlLYlSJTKHsxsmsEIW2Xq+cGCy6qE
 /cN1U6xpMQGiXOl0YDA==
X-Proofpoint-ORIG-GUID: YXhi85OUJpRDFiP0gYdtOijISFeX94XZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_022639_576473_DF942E3F 
X-CRM114-Status: GOOD (  22.34  )
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

On 6/8/26 4:37 PM, Bibek Kumar Patro wrote:
> 
> 
> On 6/8/2026 7:27 PM, Dmitry Baryshkov wrote:
>> On Tue, May 26, 2026 at 08:12:04PM +0530, Bibek Kumar Patro wrote:
>>> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
>>> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
>>> are accessible. Without this vote, the SMMU may become unreachable,
>>> leading to intermittent probe failures and runtime issues.
>>>
>>> Add the required interconnect to ensure reliable register access.
>>
>> Does it only concern the GPU SMMU? What about the APPS SMMU? Should it
>> be voting on other interconnects too? I guess so, because currently I
>> see that TBUs vote for various interconnects. BTW: should apps_smmu also
>> vote on the power domains?
>>
> 
> This race mainly occurs in GPU SMMU, where the GDSC can have an

Mainly or exclusively?

Konrad

> independent vote on the Adreno SMMU. However, the GEM_NOC vote may
> already have been removed by the GPU (or any consumer of adreno_smmu,
> e.g gmu), unless it is explicitly voted by the GPU SMMU (which acts as a
> supplier for the GPU). This mismatch can lead to SHUB timeouts or NoC
> errors.
> 
> Mostly this race reported in suspend/resume cycle (when gpu/gmu devices moves to slumber/suspend state before adreno_smmu powers down
> and the later doesn't have explicit interconnect voting).
> 
> In the case of APPS SMMU, such a race is not expected for any known
> use case. APPS SMMU is part of a shared infrastructure block, and its
> power is typically kept enabled as long as attached master devices are
> active. Therefore, explicit power-domain voting from APPS SMMU may not
> be required.
> 
> Thanks,
> Bibek
> 
> 
>>>
>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> index fa540d8c2615dc02d941eb16bc7253204c2750bd..eefa4b836a81374ff437ab4bbcbc3fecc1590ab6 100644
>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> @@ -3386,6 +3386,8 @@ adreno_smmu: iommu@3da0000 {
>>>                 power-domains = <&gpucc GPU_CC_CX_GDSC>;
>>>               dma-coherent;
>>> +            interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
>>> +                     &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>>           };
>>>             gfx_0_tbu: tbu@3dd9000 {
>>>
>>> -- 
>>> 2.34.1
>>>
>>
> 
> 

