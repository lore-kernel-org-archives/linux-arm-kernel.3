Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306D4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 01:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dg9S1ReWnO628QueH5exSmyzBX+YB3dCIncjF9Fit/g=; b=xNp1M0st0ORwYmn4v65BpAxE/t
	M18JHLsS0m1nZs4G58MKx85SRsBEWvfC/kIE54xb85v3SVUp+TIcDSHWlLu1r927Y7I1WlKS1ZkX9
	NmHWrlbvGwOwjbeize48xt6eVChu5N4vlQVF74CCwtQMAfXOqUMp/o/MQ3FFIR1afpqYGLYcBjnZP
	3bNCHiD+utbhuq2HFzG/SJd6zu6lhgkzawvwovKAIlR5uhB6816ajlB0lwNsXY8zfvHcWS3WWLyVh
	QQH342I+iMpviQ9XLvGoCxkyrXZCVnjw0NJAWpmhaxPT1kiouiTtd8knzN2WS0CkWp7pqWhu8Dyja
	wNVDjAtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whHGU-0000000G6r1-29CH;
	Wed, 08 Jul 2026 01:39:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whHGR-0000000G6qZ-2HnD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 01:39:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667MdBjs974801
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Jul 2026 01:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dg9S1ReWnO628QueH5exSmyzBX+YB3dCIncjF9Fit/g=; b=ShLeWp1829Zxz3pA
	rMJbwZSnB2Xcv3uwTMUpd1+DyUEnB55gn/RL6XWzE8sy/behNltJqmhsGvECKcx4
	uAxHXwvYP1VbU2VZP1+AGtkEBKI9b7RqgjbkjZtcoOOV2NRXPeSohZDRsnm0EszK
	WTvCIApwc8Fug0aA0dxrkxMr9ofoSrbLPwKqKCbJC9fr2MJDDtAJmwtQBYRuDKCn
	54YCcvaokUjdU9eIbC896aHZNSf/4KnXYRjRD9qjFPrJAdnoPaSUWj6Us4A7KHMu
	4HD1IEMn470zVEqPsBsVVnsQdb+wLSYMobEkBoW/pd5lKNcYLSF1r9GWv3VUMmT1
	Z+l3kA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5t163-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 01:39:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811279d51aso374134a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 18:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783474789; x=1784079589; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dg9S1ReWnO628QueH5exSmyzBX+YB3dCIncjF9Fit/g=;
        b=WIE+eS36aJt6a6P6N1NBq2lmYeFxTAxgHc5nPB1QmvvQ5srMMvOSneJKKLTHnZ0c7F
         GD8tR5N6bBERSu3eVObIHDfEIbBkHZ9L1egUYjiQX2mstZXGA5Q5hfBYgx5+wnw5dugw
         l7JW/lARmQjPwadZZuzwPKhE4a2xPcNFW5ot60rurdEaJXSU/U5zxbHQDsXV/loLX8Sn
         sdd6C7NfSe3NpK462dNJv8Sg6IeJbtj5yREeyJpI0f70XnS4vGbJ26J4rIFIB8spaxzE
         XiSxhO6VfbdMJ+/L+ghJq6qbOWm3KKjlmTFolG82+2ra/cynz+2vf1pZoCg2Y6I+6ioO
         PNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783474789; x=1784079589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dg9S1ReWnO628QueH5exSmyzBX+YB3dCIncjF9Fit/g=;
        b=spdNJ01WtmHiWel9lyVK2ZlaoPDaDQaywgKyON2HW5PEb1S0i6ztwFvW4RljxweUxE
         bUvL1osp4RM8W41eT3K7dVq5gnoK7q5iSJ/z91wHfr7qh1oWMnNa39z0pec0e7P5uPQg
         ueqqb+Vqf8+Wld1xZbQMhddcdU8drqjJyx+k7naHTxP4XcD0GEhg2oKZ74mn2wJ0QKay
         R+e1Tdu3QTLeR2zDmwaFY2noVQNiT65lO3+OyB6WXGSver/Ex7wfXuRu+h8FStik2oym
         1UqZNxs1XBwjdAkUi6B+6YORirslQPlNb6/T7z6YF4ABsfiQK86HcEOWox3kWYOO2Cp0
         E4aA==
X-Forwarded-Encrypted: i=1; AHgh+RreQQ5glq8gFALQdinLVWwVJYhfZITtGcfixRU7VAhCFcCRmTjQw/+y4J3W907+di/zj8FYh37B34Hfya22P81/@lists.infradead.org
X-Gm-Message-State: AOJu0YwjBVyhYEBlo7pw/2UrRVOTUe8Onnmuv5EIFo6iYvmqPpp9Tw5p
	vO6ooy0qPvn/myi3+8uBKSshHwCEs8rJsd0Qk4zVIQgaFBKLHGoux/P8JWRv/m+9zAsOpQY9Ux/
	PUNfYH2T9IVCnZdmxETYA9Tu4ZJWPpkeyMiU6lUsFhL+KjIp1k6r7T5SBTLF6jgq3Z3cMDMWWi8
	GeKw==
X-Gm-Gg: AfdE7cmO38m8DNa6vQtEID2/2By+ahHHgVm2EpG9TlbwShhuXJ/NtvDdSYRVpuhUl1n
	HaqDHPbgs+sT2/+BPdkt48C3FbiNK4Iu/n4xbeSkpZEUUI0TcywIcYcPGCGAV96EcW+qXFSlMzv
	fDOfxj31PK47xyTbkskOiPLzTiik2AHju1Wbasrku8cXinYT5n54fW1f+0TPt2mOpzf0qtcSCA+
	R7yoEo8EkAD1ucwqnlfX3Jbh2d4hIq9okfwiETNqNKNu25FQnlv2Rn5rJF5F3gIFa+47FhuR5GG
	BuVW3yBDcobMyfzpsNlWpnT0c5n+0MzevlZ5fd1nIvgT9PIgPuLiDfvY82WfqbcJomg3Qx2mgXv
	XkRGDLBAr2hd63gFlpVPkM4sACdKjjodTFc3CEMtmpH7fl+klHSbPfDKByQDXS6DY2xhbt6Xk+m
	20
X-Received: by 2002:a17:90b:2641:b0:387:e0db:3fab with SMTP id 98e67ed59e1d1-389424990fbmr352050a91.36.1783474788994;
        Tue, 07 Jul 2026 18:39:48 -0700 (PDT)
X-Received: by 2002:a17:90b:2641:b0:387:e0db:3fab with SMTP id 98e67ed59e1d1-389424990fbmr352017a91.36.1783474788369;
        Tue, 07 Jul 2026 18:39:48 -0700 (PDT)
Received: from [10.133.33.179] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d17ed52bsm1853284a91.11.2026.07.07.18.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 18:39:47 -0700 (PDT)
Message-ID: <3547c76e-0b6a-41e3-9ce1-e7ff652b199d@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 09:39:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Enable CTCU and ETR devices for multiple QCOM
 platforms
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
 <545b4ebb-2c7e-480d-80bb-5e08dd3c52a7@arm.com>
 <f2f23d0a-dc24-4a06-948d-56df913994ba@oss.qualcomm.com>
 <6b7294a1-8c13-42aa-9f64-5b5c9af0b41f@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <6b7294a1-8c13-42aa-9f64-5b5c9af0b41f@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3AH2Yoh2Ykq0wIjJ2tpLCMeB90YFJcH1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDAxNCBTYWx0ZWRfX79/qZ9LehF+D
 wYi61kU/6ppCrohh47PpEDhul//JzfCBYJ/Qmnj9Evfz0krzlPpKZijLQp5yxJvSKWUTFIbSjAa
 3w8R534U6p7d3SKPZ3uP8OqveMn3ptc=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4daa65 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=Z8Xz-ZLPEYxu-CxkxF4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 3AH2Yoh2Ykq0wIjJ2tpLCMeB90YFJcH1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDAxNCBTYWx0ZWRfX+zk5/J31LGc9
 ONAnJ767oABJpuO+q6mDRiReWMcwFoytB0AF1cIpPVOwQu7uNngbwRWGVJOiHHsjX4nEA8hksQe
 agQ8lcql1SBzGjG0MBtlJZ89QMy9MK4Nkw3Kr8AVcCEjBt8gD0UGWMonesA+lNCqbyU8q9n7FNG
 MSoey9cHOBehuuVPBzRSKzb90QFi98Nl3ivviUdFYtSCWEn1sbYWCAsibkQq2hHvBld6AkjNkui
 NZo+7JVJD+Fvpz4YrX7nfBnVpYqqvuluB7vLBGUP6KLEE6jbuYAuWAuLNUfBb8LY3X96zd2N1NG
 mKsbRSIyHeaFf19CwrR2/5P6NEEZlxiVkWx5xd8/3E9vxyFx5RsdxY4hOk5CF9Lwz8nns5VJQxe
 vn6oCIsssgKXwCeFB7dLCQW3YBs9Em4PYPR24Lqn9eI1ONAa09uL9MdawgQpBNgA2Vu+BinynK+
 IaFUlvjLLS53bflKerQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_183951_736417_6E4CF648 
X-CRM114-Status: GOOD (  21.08  )
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



On 5/29/2026 7:10 PM, Suzuki K Poulose wrote:
> On 29/05/2026 11:26, Jie Gan wrote:
>>
>>
>> On 2/27/2026 6:10 PM, Suzuki K Poulose wrote:
>>> Hello,
>>>
>>>
>>> On 04/02/2026 02:22, Jie Gan wrote:
>>>> The DT‑binding patch adds platform‑specific compatibles for the
>>>> CTCU device, and the following Qualcomm platforms are included:
>>>> Kaanapali
>>>> Pakala(sm8750)
>>>> Hamoa(x1e80100)
>>>> Glymur
>>>
>>> Given this is predominantly DTS changes, and there is very low chances
>>> of a conflict with the binding yaml change, I would recommend this to go
>>> via soc or the qcom platform tree.
>>>
>>> For the series:
>>>
>>> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>
>> Hi Suzuki,
>>
>> May I ask is there a chance this patch series could go through the 
>> CoreSight tree?
> 
> Like I said, it is mostly Qcom platform changes. So, I would leave it to
> the appropriate channel
> 
> Suzuki
> 

Hi Bjorn/Konrad,

Gentle reminder.

Could you please help to review the patch series?

Thanks,
Jie

> 
>>
>> Thanks a lot.
>> Jie
>>
>>>
>>>
>>>>
>>>> Since the base Coresight DT patches for the Kaanapali and Glymur
>>>> platforms have not yet been applied, I created DT patches only
>>>> for the Pakala and Hamoa platforms. I will submit the Kaanapali
>>>> and Glymur patches once their corresponding base Coresight DT patches
>>>> are merged.
>>>>
>>>> The Hamoa‑related patches were posted in a separate email, and I
>>>> have included them in the current patch series.
>>>>
>>>> Link to the previous Hamoa patch series:
>>>> https://lore.kernel.org/all/20251106-enable-etr-and-ctcu-for-hamoa- 
>>>> v2-0-cdb3a18753aa@oss.qualcomm.com/
>>>>
>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>> ---
>>>> Changes in v3:
>>>> - change back to the numeric compatible from hamoa to x1e80100.
>>>> - Link to v2: https://lore.kernel.org/r/20260203-enable-ctcu-and- 
>>>> etr- v2-0-aacc7bd7eccb@oss.qualcomm.com
>>>>
>>>> Changes in v2:
>>>> - change back to the numeric compatible from pakala to sm8750.
>>>> - Link to v1: https://lore.kernel.org/r/20260203-enable-ctcu-and- 
>>>> etr- v1-0-a5371a2ec2b8@oss.qualcomm.com
>>>>
>>>> ---
>>>> Jie Gan (3):
>>>>        dt-binding: document QCOM platforms for CTCU device
>>>>        arm64: dts: qcom: hamoa: enable ETR and CTCU devices
>>>>        arm64: dts: qcom: sm8750: enable ETR and CTCU devices
>>>>
>>>>   .../bindings/arm/qcom,coresight-ctcu.yaml          |   4 +
>>>>   arch/arm64/boot/dts/qcom/hamoa.dtsi                | 160 +++++++++ 
>>>> + + +++++++-
>>>>   arch/arm64/boot/dts/qcom/sm8750.dtsi               | 177 +++++++++ 
>>>> + + ++++++++++
>>>>   3 files changed, 340 insertions(+), 1 deletion(-)
>>>> ---
>>>> base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
>>>> change-id: 20260203-enable-ctcu-and-etr-31f9e9d1088d
>>>>
>>>> Best regards,
>>>
>>
> 


