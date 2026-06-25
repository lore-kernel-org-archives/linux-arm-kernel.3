Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680F6CDE006
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 08:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MIZ+Uqqvmj3NIegJ7KZAdRkOcTSWSNArKesrmTVP7Cg=; b=RAl9xMIB+IW16hOGOODCjzFVEg
	WL2qOF9hyYhu/OaKuCwR9/Ru1c8tPKUsB8zpuYfGO6Ej7rkLGFLGW1NgmRU1rrjFtlHJE+Tf4TqIx
	egN5QlUyjpACQybnErV1jvblQAQ5rzhM9DEjPxUSaELK0YTXnoXJk2wmI8mfzQH5vnSnxNghnrqEe
	GXnGftH5fn7U0mJZT28qg9ndeXVE4vde8yHCOAXbKpR38t+G2NS64+1nFgYx+k9Ez3YpdyjmqbVav
	UUzk1jxTW+wKRpy8wZFtHxKHIaXAR/h98GxgUinsrD/77hN0XDKAp1ulSWivHw27YrNHxPCY1+yjv
	AEcCrWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcfjv-00000008qfJ-1DAT;
	Thu, 25 Jun 2026 08:47:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcfjt-00000008qeG-1HpU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 08:47:14 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P7SS182763056
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 08:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MIZ+Uqqvmj3NIegJ7KZAdRkOcTSWSNArKesrmTVP7Cg=; b=BfX/MfuPWOPJJyxT
	YOTO6nsCRHX+zeMD6KtqzRyVyGCRUJ4TQKzNQrLPCmnLBHUuht8vCtHHpc4L0rpU
	vf1QKuwZWrxLyzixIewYgd2CP5b3mtrE3qreJKbhQBi07drl0je6K/U4TjL58bNv
	j5lrRbL7sAZIDKO+NGENnCBeMS23PkAjP724b1jyX4imrgP0JaWK/+hmJwO/0NUu
	YyCBgFCWp+BVEdOaWC/6ff+JZIoslZ/GB9xTv3exeirjLWB6ak+/IIz2gpZt64ad
	KPjiBmwcIRkO2lDOkaBCSE4Q7NGEUrilla5eOvUhRIRZ1+6NrdWrx6P11VMnxjRK
	Fs+m7w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0yynr9rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 08:47:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517647fbff1so4330411cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 01:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782377231; x=1782982031; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MIZ+Uqqvmj3NIegJ7KZAdRkOcTSWSNArKesrmTVP7Cg=;
        b=axztS39w1RIUiIyIgVQou+Al8n8RdFSBcLaxRn7O7YIjurv9AZ42uIuch1fx4adbzB
         W8ubmbDZsdsteYSSmfudv7WnM6jSda/bKH8np5T7YvbrDBCRT9FP9IWflUA9HsTHmcKy
         LpWDYT5sAeu4iCcLl4akn48Pr9EMliI2WMukpNQXLSmDdMEerCyMix+JBKMn7S+3mpd9
         cn4hz5Gx685eRGCYZ4yOd+CdpITGDE3AwdHzl4h81vMIEOsuUk5+TzvBLGIyxQgepPsh
         7dul+oc6P3UyviZ8XXITiaA3ctGSa+0TrFViM/RgMErkPXiP1QDaIUlct6i29pVrcTeu
         SBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782377231; x=1782982031;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MIZ+Uqqvmj3NIegJ7KZAdRkOcTSWSNArKesrmTVP7Cg=;
        b=QOKkDFCjkjqskzaNdlUG9hhadBKAtvPBVCgEhEq6HJp5Nz2nyrHgFfSBBhFLXoyRTF
         ycaeaxXgxlm9bsSX2tw9VAxG3lnCtwUZhwetoy5C9mIc7iFuLPkZ4svBMpX4D7RSbqwZ
         o3iePlUjmyIElFIYwfFudcPNHcNWE+yrKnFR1XVmj3xVbGWx36DABs3XFg6rgRIN7VBE
         QzzW8f7qc6jvhfkCRqdOi+dj55zgT6cCgefS8aLdfhBdRsB655PK+Z2ZABfsJtpXA8Al
         h1svCSfMX2YITzxXVRLpy+E8l+aim3hpmOeYzE2d6qigoVKP7z5vh6PlO7E+6XgwaLyG
         Td7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/uLjUXc+A5oh4zEEdezSsHfWFPrEdQ/FTov/4YTQet30Iy0w6bxFr4/X66lsUauQDDM/mrjvz2aQytlbgmqQ8Q@lists.infradead.org
X-Gm-Message-State: AOJu0YyKqXLhTznw1kMfLUvUlC1Tj+VHcHa8/flhMY7NwA4NbrKD6Yfp
	zIfx88Pbza8HlwaHgRDWwQO0hDho+MB6TW5VmyVPQbY97Cir6YVhojqxyICGuH+o1MZASFWq9RL
	v+Y0uPACutQd/5f4VNy9XMi7rUt0Un9Z5CJf8/TDr6n1tfZBEpnw+rf2d8UDVV3JCnfqQBUuEnI
	Z98d4SFxu0RQ==
X-Gm-Gg: AfdE7cna7R7L386KbLQl3LEzOMg8Niws93BAcYvEwm0HpJBGnQaFH9pbfEVt3pLgNRd
	mD5tAFun6lZukJt+bvhJN+DGK+tagTDg2taGb9nFxmiamChZYas01uGNHieO9Z5JHB5R32P3rWp
	H1Rz8nJipIQLsnYKQoYJfwUrQBUl7/EqE47xlX4zII4yszWoGBoNUXYzVJKfYEIP2k9WZb6LMSX
	fXojjPYWq2gvFn8gIgPZprE2Yn15umHbijj2248me2TrgSWzxGhE2RugbDos4cKODBdZaugeKKv
	mZ53OamcoDxKMBMbEHs8NoaugiCpWohI8H6TMQAzkFrmWw3hlTCya8TcKykdruEu0qn4l38/85e
	EASxeUvPkFRlDIWAZNQn0cfpgf/HTFp6wEAs=
X-Received: by 2002:a05:622a:1451:b0:517:6d82:9d7b with SMTP id d75a77b69052e-51a7279ef50mr12133351cf.4.1782377230953;
        Thu, 25 Jun 2026 01:47:10 -0700 (PDT)
X-Received: by 2002:a05:622a:1451:b0:517:6d82:9d7b with SMTP id d75a77b69052e-51a7279ef50mr12133051cf.4.1782377230257;
        Thu, 25 Jun 2026 01:47:10 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05f9csm132345966b.31.2026.06.25.01.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 01:47:09 -0700 (PDT)
Message-ID: <4f0878a0-2ab1-490d-b251-c6d68c4ee241@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 10:47:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
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
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
 <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
 <d25f24ca-5bb3-4276-ac8f-8340e8fb4ce8@oss.qualcomm.com>
 <sdm7sqiokmsgczeat2mxch42ois5rwabav6c5fm7abct2xoepf@j3kraqrjvpoc>
 <ea345832-711d-4e32-af0f-bc74d8646aef@oss.qualcomm.com>
 <299d54c5-fb93-47ee-9495-fbf48a3204fd@oss.qualcomm.com>
 <aaf4daee-4886-4214-a761-80545d2565ee@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aaf4daee-4886-4214-a761-80545d2565ee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3NCBTYWx0ZWRfX++G5k5gplyKe
 /LSfNSQYk6uovHIl+F/Xj+m0wL/wqAx4NBHYJP2z1s8b28B+JzSUEniKxbgKQeACGEDZCZuNfLJ
 O6TPdpUZltQShx/1bsjffhHAtx65/4Bjz1rCXUlsGW6bqxV9xHHRuQ+4pFv01nb2pNwkH7puYxw
 zy+fEgkEAmqsQ3dyR1robKCvVT0gUoUdFOoFGSEytxydwbBkj8KzAmZWXDIFgkpxmadLlZIoPdj
 VJzlN72JdSFXK0NkySj5l/FsSYTwkWdh8/mLzgNGLubMEXrtwTyjuMS8QSl2ZqB8R8AXEhjQHUD
 QzO7KctAiKZ9xNHnjYFHSA/1jc41pJce2y4M+s9ylNpeZCbF6kXfoM8Z2uAQfs0SoBivyZADRq8
 XwyLI9/7xmXn1W33ob20CaDgTqybP8YAmaoOa4RiCgHNxfkNFF4K8TdmmZZ92J0iRFLXqcQQBFL
 BKlF+NIFmB/ZbIzUEng==
X-Authority-Analysis: v=2.4 cv=aoyCzyZV c=1 sm=1 tr=0 ts=6a3ceb10 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TtB6gFZ535HFW_zVIisA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: labkMGg3kBo7yAfCA2tQaQGx2QaUoFfX
X-Proofpoint-GUID: labkMGg3kBo7yAfCA2tQaQGx2QaUoFfX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3NCBTYWx0ZWRfX0ejBrvXhJm7u
 XF6pofzg9qsNTHdEAIXSpZE9jDJYBwLOMhihVDmvpb5kK21R0SYljXmLmJ4TzBDvRRrAIkClV0k
 UGZzLV1I4smGd+WfRnpo39Azpx/Tl/A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_014713_355586_E9744463 
X-CRM114-Status: GOOD (  27.93  )
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

On 6/19/26 12:54 PM, Bibek Kumar Patro wrote:
> 
> 
> On 6/18/2026 2:58 PM, Konrad Dybcio wrote:
>> On 6/17/26 4:26 PM, Bibek Kumar Patro wrote:
>>>
>>>
>>> On 6/16/2026 5:51 AM, Dmitry Baryshkov wrote:
>>>> On Mon, Jun 15, 2026 at 06:36:51PM +0530, Bibek Kumar Patro wrote:
>>>>>
>>>>>
>>>>> On 6/8/2026 7:25 PM, Dmitry Baryshkov wrote:
>>>>>> On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
>>>>>>> On some SoCs the SMMU registers require an active interconnect
>>>>>>> bandwidth vote to be accessible. While other clients typically
>>>>>>> satisfy this requirement implicitly, certain corner cases (e.g.
>>>>>>> during sleep/wakeup transitions) can leave the SMMU without a
>>>>>>> vote, causing intermittent register access failures.
>>>>>>>
>>>>>>> Add support for an optional interconnect path to the arm-smmu
>>>>>>> driver and vote for bandwidth while the SMMU is active. The path
>>>>>>> is acquired from DT if present and ignored otherwise.
>>>>>>>
>>>>>>> The bandwidth vote is enabled before accessing SMMU registers
>>>>>>> during probe and runtime resume, and released during runtime
>>>>>>> suspend and on error paths.
>>>>>>>
>>>>>>> Generally, from an architectural perspective, GEM_NOC and DDR are
>>>>>>> expected to have an active vote whenever the adreno_smmu block is
>>>>>>> powered on. In most common use cases, this requirement is implicitly
>>>>>>> satisfied because other GPU-related clients (for example, the GMU
>>>>>>> device) already hold a GEM_NOC vote when adreno_smmu is enabled.
>>>>>>>
>>>>>>> However, there are certain corner cases, such as during sleep/wakeup
>>>>>>> transitions, where the GEM_NOC vote can be removed before adreno_smmu
>>>>>>> is powered down. If adreno_smmu is then accessed while the interconnect
>>>>>>> vote is missing, it can lead to the observed failures. Because of the
>>>>>>> precise ordering involved, this scenario is difficult to reproduce
>>>>>>> consistently.
>>>>>>> (also GDSC is involved in adreno usecases can have an independent vote)
>>>>>>>
>>>>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>     drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>>>>>>>     drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>>>>>>>     2 files changed, 57 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>>> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
>>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>>> @@ -53,6 +53,11 @@
>>>>>>>     #define MSI_IOVA_BASE            0x8000000
>>>>>>>     #define MSI_IOVA_LENGTH            0x100000
>>>>>>> +/* Interconnect bandwidth vote values for the SMMU register access path */
>>>>>>> +#define ARM_SMMU_ICC_AVG_BW        0
>>>>>>> +#define ARM_SMMU_ICC_PEAK_BW_HIGH    1000
>>>>>>
>>>>>> totally random numbers, which might be different for non-Qualcomm platform.
>>>>>>
>>>>>
>>>>> Ideally, any non-zero value would be enough to keep the path active.
>>>>
>>>> This is true for Qualcomm devices. However, you are adding this to a
>>>> generic code.
>>>>
>>>>> Here 1 Would be enough to keep the path active, but might be too small to
>>>>> reliably keep the bus active.
>>>>> Other is UINT_MAX, which will reliably keep the bus active but might cause a
>>>>> power penalty.
>>>>>
>>>>> #define ARM_SMMU_ICC_PEAK_BW_HIGH    UINT_MAX
>>>>>
>>>>> seems to be suitable here to reliably keep the bus active by BCM
>>>>> for both Qualcomm and non-Qualcomm platforms (with some power penalty).
>>>>>
>>>>> LMK, if you feel otherwise.
>>>>
>>>> Shift it to the qcom instance or provide platform-specific values? (My
>>>> preference would be towards the first solution).
>>>>
>>>
>>>
>>> To support platform-specific values, we may need to introduce a LUT-based approach in the driver. (Bandwidth voting values cannot be placed in device-tree property IIRC ?)
>>>
>>> Currently, all Qualcomm platforms use 0x1000 for SMMU ICC voting. I
>>
>> (you used decimal 1000)
>>
> 
> It's my bad, i meant 1000 only
> (I'll check on the icc_bw calculation to get clarity on the values)
> 
>>> can evaluate if this could be moved to a Qualcomm-specific
>>> implementation.
>>
>> Add a vendor hook to arm_smmu_runtime_suspend/resume and handle it within
>> the QC driver
>>
> 
> Just curious, wouldn't this apply for all the arm-smmu users in addition to Qualcomm devices as i mentioned here [1].
> Vendor hook would make it Qualcomm specific.

You're proposing to use a Qualcomm-specific bandwidth value so that
fits

Konrad

> 
> [1]: https://lore.kernel.org/all/984ff9c7-3eef-463c-a330-bf7acd063667@oss.qualcomm.com/
> 
> Thanks & regards,
> Bibek
> 
>> Konrad
> 

