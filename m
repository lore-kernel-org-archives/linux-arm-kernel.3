Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE1BCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 16:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=losT85IqK/EGuwOmznCnocjfeG/q92lYBlNczhHDlvs=; b=znzSgiM+4Q67HCYhBhZT1hUxJI
	G5PtJ/pvhidYw773xU5r4dpb7ktlSalhxnFzGIU7XNQU4JcKqq250DAYQLbvZ+GlKfDwpMUVT1mns
	BAnz1gkiQh43hFzZj3j271O0g6DiMxUSROuVkhFElvuJ2u72OlFYu6ke+9hcbjC7+rmpdC0XbIpMF
	LOEPmg3rPjJNLwfEFmlaFdxE4BzwiKpm/uEn5yL+GF60Fujy2zly/PqOJtpeBl0EMSoStVU1sy2ip
	ojkukTT3ZFCA32mZHlE4QSOh1rSuPTRR2dCRUJcYz72hjYYuxW0TkjzDcimBVDPpDCJeMtPUO83j2
	MsuBvwhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZt0e-000000002L2-0F4V;
	Wed, 17 Jun 2026 16:21:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZt0b-000000002KO-37rP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 16:20:58 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HFog4m2649284
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 16:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	losT85IqK/EGuwOmznCnocjfeG/q92lYBlNczhHDlvs=; b=f0pnPqchVoogz6/I
	7qY7Zy0N0sPnMYAGbR3Ni/JchJirqBjSIf0FEFAGrYXGHNjJDUNQRXY0O3dxxlhQ
	D9z2LPFkwQ75jW7TKH7X/a4KRNXTk21TLCie/tBmkJje5mJ3rh5h+M+DcdSHQF7A
	GWW7VIoEFiwWZmNkOh2Ac6+PTZUCyartF6XC6T2WyDcCihAFjk/0X1hFnV3lG1jw
	vzQuTOws47CjxLE6DjewKykJIS0BM+YLdvWiQCRvgceZZFIuzESEqck+e6T6a5Qt
	m3DViBp3zGi6TpHjVU4DD06jY6agaXMxoPFb55efKjd6inBTF/fmZtNcvqrJGXCC
	5z+5HA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueer45kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 16:20:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85c530ddebso4310a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 09:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781713256; x=1782318056; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=losT85IqK/EGuwOmznCnocjfeG/q92lYBlNczhHDlvs=;
        b=TDKMklSOgZDQZy81kTNJ8lEbeJMRqv/7DsqBLljBT9ILthsFwNxDCT9hpnPsMdu1vD
         X21woWGOH6Cqio0YsmERrd7eALf1OVURC+Z7ABhthf4y344LmpgKcSoPUok7l1g4upv+
         q1UDpMeFy3KhLc3owdbWrObvNUrvq1oP1LB1kNzvW0DA1YXhXXUEySU+OCygQ/40CVc4
         IYaddjaPGYn5HH4t35wXhUFCu0wAi6wYCoaCt3Ap64X6Bi8TwHJzkdoDNToCOAXet4zY
         7CyCqvzeqBxY6FbG41Ioh5cHERBXHDUMvJf7dyZjt0b18f5PvHbceXLe+Mq+KpVljcIZ
         PsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781713256; x=1782318056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=losT85IqK/EGuwOmznCnocjfeG/q92lYBlNczhHDlvs=;
        b=cw6mos4RyDWYvRP7HSIaZr00lNEVV3lwWsCE/b8NH0QegOt9EDaWZraKNPxfkOieIF
         uL3Ysu1Q3EjG/EHx1JuLq87dEdtN3JjHyS4sSYEFDNNceQoMKtiki7yFXvej/9XBJQRK
         23wM3mzZ3rdh+6NOzwcOK+Bze8ZTLR4+RRaQQ3fejIFdqzXNV2426Ux2v0h4LBWvITyE
         jEpzpV/j9RtgPQdkvbTp03x7umpfhDxRyUkmptXUFKsCoCaYtHm8fUBwfGvHR+sKOO59
         9L25rbAknRG7wW7US4XhhroqhWlMNryAMglYQ0s8+ZuC2R45tQFGu2VXMq0r1JXg/XKc
         GPlg==
X-Forwarded-Encrypted: i=1; AFNElJ8KCZvdgn/Tnfq3K6DUoEB9GMRo+6xoau9BPUDd6NV0ZJ/sOfxfY2AUL3PBRSEmBBOU31p0hQjFjVGnlZyrTB3o@lists.infradead.org
X-Gm-Message-State: AOJu0YxaKd8I9s//B+8QhuWIRGXxfdp/r+ssxykFwPsVf/ZwNTJT7tXT
	q0u6HcfOm8nWvPTInm0k3QCyp7PJjmrORcSdHM9/WcIwV/lk0j09jEQklkBIih5igbvYEnpWyeQ
	w0nnvMd3/ECJVsBliaahnDOD+z4ejAOUEMtLAW4hYI6Q6QXZ/+iE4knhtgvRoJlbjrhCXvaQojj
	IqGg==
X-Gm-Gg: Acq92OGWDQTp9KSH5Ge7e5yUKtNxq9F1xkO2z9WPqNr3xHKsELvgPCzvXulGUc+sc9D
	Wy7bAnLQobAje6xD9wIaZ9Ixh52OhQaXE7I/g6rrBSxy5MCREzGnsAe+IVz7szDf57lcUS4mKQ2
	iCPwj9z5bvB9H+3WhHWf/vywtDrXk53RX3s5O3UuKGQtSu06HlWvwEQ8RwbGgPQc13+EwLdXPy6
	EBrY8A0fUVg3KCnlHmgyI5qyg2qthVnBTerbHieOSyjaLh1XodJC1ULYMGFPlGXglrCNQxdKo3D
	MWYuDpZGq8eeqLnj0MvRWxSXSCS7RQyr16kasURl8YFO1Q/z8EIvMbZ/6vqDtN8duR1dnrdgBML
	wlY0hGTw9tRq+/6wtdUwbXuHs8VtoSPg5KuDPZEc=
X-Received: by 2002:a05:6a20:c79a:b0:3aa:c93b:6266 with SMTP id adf61e73a8af0-3b8b64824a0mr5231194637.19.1781713256317;
        Wed, 17 Jun 2026 09:20:56 -0700 (PDT)
X-Received: by 2002:a05:6a20:c79a:b0:3aa:c93b:6266 with SMTP id adf61e73a8af0-3b8b64824a0mr5231159637.19.1781713255883;
        Wed, 17 Jun 2026 09:20:55 -0700 (PDT)
Received: from [10.219.57.228] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661b5b207sm15074358a12.5.2026.06.17.09.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 09:20:55 -0700 (PDT)
Message-ID: <1bf2708a-bd2a-46a9-97ea-8c1ad96e7ac3@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 21:50:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC interconnect
 for adreno SMMU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <zhdacu4upv5kyvyqx5hcm6im4p7r3z5bsnup7hqu2okxyxmeib@snpseurpvhtc>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <zhdacu4upv5kyvyqx5hcm6im4p7r3z5bsnup7hqu2okxyxmeib@snpseurpvhtc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5u8r-V8Gm5ZI1U3fpUQOCV6Edz4d3Jq5
X-Authority-Analysis: v=2.4 cv=Mr1iLWae c=1 sm=1 tr=0 ts=6a32c969 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Rg3GaRgnNXoUDx2UCPMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 5u8r-V8Gm5ZI1U3fpUQOCV6Edz4d3Jq5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE1NiBTYWx0ZWRfX45igm2hhk3R9
 ILLYmu2bgh+cy6cc2Dq1xMWXRDN9AtZqqUfpv//Ch0OxCju8QH9Dr9JGvkyX1cT3AVIeb5ubSgf
 6tOGXZGCxvcqLd5QqdZNpdrOkVjJxRM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE1NiBTYWx0ZWRfXwDa7Da3G9Uy2
 mHa/iUpuZjWht8VnGhDBeDtIqrfJW6AcvVaUuqREDRcZULqECPGIFk9eEpNH93VWxnt2VlXZWab
 ixNWqblEXmBFgxIQ8h4PCJ8OlsoXYHpEoBLUIwmrxvigh70tJExHseIBfgCl3CzXyiDwMVqs4hC
 OsULkA8zeu2++phzJpF3QMkSVF3+taIv5TYZ/l/OGLeAypG5eODERD5sPyvbXw7VJ8VYNczdwAG
 R9rqDCvT4jXWjrWyTedpu8to6sQcJbbbKv6HDZipzMrVjgqNijcl7O60Ibb48vGSVWPV4r6N5T3
 mo4qfNUd3qggYQRGjiG9ootZg3/x6dRihAzYyp7P+t+TRpzX5YutH2oxZVof18/+s6xi3mNihg9
 SLGuXmT/ROTnKz3k+qfSodbiVZOhzlFZa6zyZOccFTMTZyAgg6JxtE34N+IwikQh0ltFZ8Qf0+8
 14N0EKpvGaEZ85xWOKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_092057_793406_2FC3866F 
X-CRM114-Status: GOOD (  23.04  )
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



On 6/16/2026 5:49 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 08, 2026 at 08:07:07PM +0530, Bibek Kumar Patro wrote:
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
>> independent vote on the Adreno SMMU. However, the GEM_NOC vote may
>> already have been removed by the GPU (or any consumer of adreno_smmu,
>> e.g gmu), unless it is explicitly voted by the GPU SMMU (which acts as a
>> supplier for the GPU). This mismatch can lead to SHUB timeouts or NoC
>> errors.
>>
>> Mostly this race reported in suspend/resume cycle (when gpu/gmu devices
>> moves to slumber/suspend state before adreno_smmu powers down
>> and the later doesn't have explicit interconnect voting).
>>
>> In the case of APPS SMMU, such a race is not expected for any known
>> use case. APPS SMMU is part of a shared infrastructure block, and its
>> power is typically kept enabled as long as attached master devices are
>> active. Therefore, explicit power-domain voting from APPS SMMU may not
>> be required.
> 
> This looks like a good part of the commit message. Please add it where
> it belongs.
> 

Ack, thanks for this suggestion. It seems like i haven't explained this 
specific info in any of the patches in this series.
Will take care of this in the next revision.

Thanks & regards,
Bibek

>>
>> Thanks,
>> Bibek
>>
>>
>>>>
>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> index fa540d8c2615dc02d941eb16bc7253204c2750bd..eefa4b836a81374ff437ab4bbcbc3fecc1590ab6 100644
>>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> @@ -3386,6 +3386,8 @@ adreno_smmu: iommu@3da0000 {
>>>>    			power-domains = <&gpucc GPU_CC_CX_GDSC>;
>>>>    			dma-coherent;
>>>> +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
>>>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>>>    		};
>>>>    		gfx_0_tbu: tbu@3dd9000 {
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
> 


