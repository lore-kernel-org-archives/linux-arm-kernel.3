Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EECCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 14:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=An9cH8kmtTF2q7rWAOFIO0E7HomTnjc+hT38gPN++VE=; b=RqN7cl06xi4GU+H8v/xIDicbb9
	hDx0EsQabAlyuSpvSnKP//86B7e9+NlfYIgPGOsCA/p7KK9+XFWKLvDspJmSs8SE4q86dKCflh3Vy
	jOZasgwn5MvhSCf9uvxc3GLxtq8mIrKb30keo98jlFPg5KocgjsFHAGsR3/i8SNgL6FL44xjSDHvi
	fsSqNOcQelVOJvpfEBsMQRPBn2XBHQzbdDp6MkSI0OV3w/I6BNN18+KuIgk9QqxiiYuE8cr9IG+5Y
	IBs2PRez1h7hnmAjFlJ7xSJvFIFuD+eS4szGQWZDXHNc9TaRkeaMN0cZ52tCNZHMmENvLwdCrqBAc
	TlsXQ55g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrEe-0000000HTpI-03fr;
	Wed, 17 Jun 2026 14:27:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrEc-0000000HTov-11jN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 14:27:19 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HEEXbH2428568
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 14:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	An9cH8kmtTF2q7rWAOFIO0E7HomTnjc+hT38gPN++VE=; b=pYZpfHLf8lAVSEK5
	oidekzpgaXG+tKHMKtwM4AywhOMkdMed2gpUy819AdhqlKGdmiwOOGDWNkm+WCaH
	BiI8Qsrnz+jMNq/0XNVobb307i89lGEBr7EaJhwLT8E614PEYN/jmyFheXY+BwWR
	MhpWfczEBmrZhZOxlB0Ylj2jMD2N6LuItHe7PPxr5odRCxfi5ihi7d/V1LVI+QP3
	Wgyt6abp7B2FzbjQnzYP8CdTCpD4g8JwjeG9IWWRRMhdBanLCUJx8YX+vhIv99rS
	2djDPxN5P7bfZEltrHtk1W6dQj3cgTTmsZOT3GpmGQ0P0QiBj5jKoKpBQbGf4Qu7
	5JDAxg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueer3hfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 14:27:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37cc07f3e36so630577a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 07:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781706436; x=1782311236; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=An9cH8kmtTF2q7rWAOFIO0E7HomTnjc+hT38gPN++VE=;
        b=TOqBQw6phSfnEoZn6Kfbrn1kbuUrw8wJCGsLFJh2miKwm3xVd2GXD0eBBPZK6ZnxtP
         +oyJxrWsPgFvvgKsCJcp+9Shtd5/YAFKpxI11BnhAF9NEL0M7xnp8FuQ3fOvcsMcaC2J
         LsQKVVllRPqB4pLXp3DP9xhrfdTDYrGb/rixHnW9RgWVi8qwynYRG9OcPgZBJw0bO7+H
         bXDH1GG7b9cZ5XWLVPn9+i0voVtaKsF8X7rZyCj7xnT33BZFNtnvR2XAueEZ5LFOC/og
         Yf96d7DtEYQLfTjC92YF62ZwgeOCesbyBblC2jYOJueWySiNBUD06FmZarhcTL97lJJg
         ddoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781706436; x=1782311236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=An9cH8kmtTF2q7rWAOFIO0E7HomTnjc+hT38gPN++VE=;
        b=GxkvhDGsNLhinEPAlAtPmlWTi50K8JcDeEE4k6ycn3Q2XHkLZC2ST6A/bq2DI01Z9a
         M93trBCa+wspxntjQxAMHXtdU4sBjTqcW9Gn/2CAd36v/pj2a1LYlQwkbfkhACLOlEWF
         IUETkkOzcMSJbdEL5DiPaMIif1OOQq2uB0HKe5m1gTHlH5OjxHiAW2P1xIBXpMiRaUnK
         c8G9uUVsZlNaTcLsUREUaszOU5tof99Qe3CKKTeLrnZlkeriRsNiI4oxDJamOt+ihteY
         3gbd9I7lytvEUZOeKlIUnfn3r3NHigieFNYqC8HaRJRDExfOlAe5hkiIkPytnQsfKpkO
         uqAQ==
X-Forwarded-Encrypted: i=1; AFNElJ99XdI1GmGdoCjxjkdnGAlLKzS77D7eT2uDliqRjgHMytJ7vsLGVKc5PP/3TVPdJ0eRbeXyg3hE6i+cgRg3BoSQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwEpZqtObiV1nYR6z+BkZ8iGc0jxCj/FcJoIAijaBEdRgGIxdxd
	wtOIpNKylPUKOTnwZ74Njrt5zH3aEKbIGWO4gUvl0QbrXxiaLKrHFSgtQBmP3g1DvZ5WDK+ZmW7
	EbX8CIGAaSr1/3eftiIbQtUXH8+z1GZGcAwj3QY0Ad+vIVbE6MQuuPmCvD4A1JBe/sNMxMdXGtP
	eFvA==
X-Gm-Gg: AfdE7cnY+dLzGxICHgnFKclic0TbrgBGPGfdTgsaPQtfUrqBsyRn54MjOjciKSctIdF
	Ae7x52OZP4e688nY4OayLjqvtt0WVGD4XlA/tbwI3zpx29W5GQxRrKJNkqu6qRetc2c7hwow46V
	nqnedkc7+6c45J1zWrTYWX8QxWN0Qi+/C9/oajDA68EfIFmFUH4yHvY63Kd9sLR8+GdLCP0+sLC
	PL9KYbu+H9+Uf13euTJ5kjQk3tmHP2gE1aOqb+bpG2SlXU+KFHKiQV4ELYjvJx5WA4L4aZXqNBY
	f6yTvbUM3K4PoRNO57iys2iKMXedzW3qqBUTHHLyO3DDKn0HdS3XiYyo4QAYgSR2ngJzAXSgvpn
	wgIOruadU1GK0VLnJj9pcevm+2ZQGjeFYCoucK3g=
X-Received: by 2002:a17:90b:2c8c:b0:36b:a4c6:da96 with SMTP id 98e67ed59e1d1-37c94cfcb5amr3893320a91.25.1781706435945;
        Wed, 17 Jun 2026 07:27:15 -0700 (PDT)
X-Received: by 2002:a17:90b:2c8c:b0:36b:a4c6:da96 with SMTP id 98e67ed59e1d1-37c94cfcb5amr3893275a91.25.1781706435350;
        Wed, 17 Jun 2026 07:27:15 -0700 (PDT)
Received: from [10.219.57.228] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8665186aefsm14340442a12.15.2026.06.17.07.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 07:27:14 -0700 (PDT)
Message-ID: <ea345832-711d-4e32-af0f-bc74d8646aef@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 19:56:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
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
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
 <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
 <d25f24ca-5bb3-4276-ac8f-8340e8fb4ce8@oss.qualcomm.com>
 <sdm7sqiokmsgczeat2mxch42ois5rwabav6c5fm7abct2xoepf@j3kraqrjvpoc>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <sdm7sqiokmsgczeat2mxch42ois5rwabav6c5fm7abct2xoepf@j3kraqrjvpoc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 73HKrNQSGHJxJz_f5nt5JksLPLl7E3n8
X-Authority-Analysis: v=2.4 cv=Mr1iLWae c=1 sm=1 tr=0 ts=6a32aec4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=C6ffOseXIbhiAUGq2Q0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 73HKrNQSGHJxJz_f5nt5JksLPLl7E3n8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEzOCBTYWx0ZWRfXxKskqQ2olIvC
 OOJVYf/OEYYVRvvN6t0u3ixqPsdVKyAK/Mimk8Qe+lzzoMTI8m6rGmiWLfaMWuSWvWm6Og8DfFR
 e+27tGk8ZKtG53JhiVzDIJRikaBc0Xo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEzOCBTYWx0ZWRfX+MqLyYjjXHuh
 825GugE3+kWWgXy8brpfclI78xPj93YuP51JF/j0ZIkjgPbrs/vvNEy5ZOD8eJL+NokkRHobLg5
 Ft0xxOOxCUtGTEXy6Q6TV2ClSzFeH7MmN0VH+2Z81WuZ+c7l15RyWnqJW0yK/HICn3/xlmRNxHI
 x4ZytHpmMJdgCxTOe/id7UZ9JztYs3QR79jY7Qc3dZRnKZwGtRol7zkpxbJoTzeJLG9vaNgNcHw
 M1li9er5Y40okxUdyEokP9t8M4zrF7rjGRQUrDcexRFWNjQ8R3WYjPQw6WdBqawItX2dTsJvHHN
 6i36GNQutPa0S3FbEO5+f95LbMBLXHzeHO9Yn5muZ1zanEcvFxnPagHduKSMd8IE/rsrCqI9NRz
 Tlw6fli0ECA1l/LJXkwliiUTxX88EaQ0QgGTA5tHWjdK4LyZ09SbOVhgDzHayunsYSAdZMkrKW4
 FzAqGucKkCIbC2ju/QQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_072718_299527_3A714188 
X-CRM114-Status: GOOD (  27.82  )
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



On 6/16/2026 5:51 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 15, 2026 at 06:36:51PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 6/8/2026 7:25 PM, Dmitry Baryshkov wrote:
>>> On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
>>>> On some SoCs the SMMU registers require an active interconnect
>>>> bandwidth vote to be accessible. While other clients typically
>>>> satisfy this requirement implicitly, certain corner cases (e.g.
>>>> during sleep/wakeup transitions) can leave the SMMU without a
>>>> vote, causing intermittent register access failures.
>>>>
>>>> Add support for an optional interconnect path to the arm-smmu
>>>> driver and vote for bandwidth while the SMMU is active. The path
>>>> is acquired from DT if present and ignored otherwise.
>>>>
>>>> The bandwidth vote is enabled before accessing SMMU registers
>>>> during probe and runtime resume, and released during runtime
>>>> suspend and on error paths.
>>>>
>>>> Generally, from an architectural perspective, GEM_NOC and DDR are
>>>> expected to have an active vote whenever the adreno_smmu block is
>>>> powered on. In most common use cases, this requirement is implicitly
>>>> satisfied because other GPU-related clients (for example, the GMU
>>>> device) already hold a GEM_NOC vote when adreno_smmu is enabled.
>>>>
>>>> However, there are certain corner cases, such as during sleep/wakeup
>>>> transitions, where the GEM_NOC vote can be removed before adreno_smmu
>>>> is powered down. If adreno_smmu is then accessed while the interconnect
>>>> vote is missing, it can lead to the observed failures. Because of the
>>>> precise ordering involved, this scenario is difficult to reproduce
>>>> consistently.
>>>> (also GDSC is involved in adreno usecases can have an independent vote)
>>>>
>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>> ---
>>>>    drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>>>>    drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>>>>    2 files changed, 57 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> @@ -53,6 +53,11 @@
>>>>    #define MSI_IOVA_BASE			0x8000000
>>>>    #define MSI_IOVA_LENGTH			0x100000
>>>> +/* Interconnect bandwidth vote values for the SMMU register access path */
>>>> +#define ARM_SMMU_ICC_AVG_BW		0
>>>> +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
>>>
>>> totally random numbers, which might be different for non-Qualcomm platform.
>>>
>>
>> Ideally, any non-zero value would be enough to keep the path active.
> 
> This is true for Qualcomm devices. However, you are adding this to a
> generic code.
> 
>> Here 1 Would be enough to keep the path active, but might be too small to
>> reliably keep the bus active.
>> Other is UINT_MAX, which will reliably keep the bus active but might cause a
>> power penalty.
>>
>> #define ARM_SMMU_ICC_PEAK_BW_HIGH	UINT_MAX
>>
>> seems to be suitable here to reliably keep the bus active by BCM
>> for both Qualcomm and non-Qualcomm platforms (with some power penalty).
>>
>> LMK, if you feel otherwise.
> 
> Shift it to the qcom instance or provide platform-specific values? (My
> preference would be towards the first solution).
> 


To support platform-specific values, we may need to introduce a 
LUT-based approach in the driver. (Bandwidth voting values cannot be 
placed in device-tree property IIRC ?)

Currently, all Qualcomm platforms use 0x1000 for SMMU ICC voting. I
can evaluate if this could be moved to a Qualcomm-specific
implementation.

To clarify, this applies only to the bandwidth values.
Since the ICC path itself can remain part of struct arm_smmu_device, 
similar to clocks and IRQs, as it represents common infrastructure 
required for the SMMU device.

Thanks & regards,
Bibek


>>
>>
>>>> +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
>>>> +
>>>>    static int force_stage;
>>>>    module_param(force_stage, int, S_IRUGO);
>>>>    MODULE_PARM_DESC(force_stage,
> 


