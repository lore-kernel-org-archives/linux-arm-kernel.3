Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04BCC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KsWcVMJwJ2v5K6dzKusBzpR5lVUpfbb9D8XZrMSTi04=; b=amz4rROaJybfpF5RSuO/RHZEur
	gfzjfKh+wsMxuyN+M1ETefktgbXqcL+68a+sT09mopvRMWBnCw+EQWeolxxEHS8YfKL6wlBem3ohT
	JpVhP/LN4A2YP4mW/HFnRDhzvglKBwZXoixtjh6c82g0b5ZO8KgAWUsKUmUD1GEhv1zB3jZxUdikM
	yFYu92ErZjP/iA+q0uZNMItQEzfO41zVVoKpuWxCmdC/84MWHByJmZMlql699LwzwWkr5BGgaw7DK
	Ps3g41UX3Eplx6WLnzB5LYdCZh5Bk1K9SpcQOKZlfek01qIx/UyvuOR5HZkbc7J3+KFgdrAcO3nVf
	0nViYbWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5jt-00000008o2c-1CLc;
	Tue, 21 Jul 2026 08:22:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5jq-00000008o1d-1S12
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:22:08 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6SesX3978764
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KsWcVMJwJ2v5K6dzKusBzpR5lVUpfbb9D8XZrMSTi04=; b=R0JoYaJJBWBswlFL
	bDt96RZe/Db2JSAkLola8cMVGdYdnVlLgA02vGpGIntAOgfxcRKYH/L8ChPBX74X
	MXReYeJ8erk4qCDYJCh+FACaiamNN60GQlFCorU4OKfFgnVa/mYEGR2n+0CTCx0h
	vRz5Uu5HAUfNoGhNyh6Q/AVA7a8dG9Unatm6VGnHmVkBT2veQM+N4xl+5wcYtse2
	pTMJRXOOTg5AnxA1ie/rZSvGAi1o+mUATnNo27GNDblSIvWfS3mUesJggZ0VPnsz
	O5KYuyZ5iuhj6/FepSnATG1lPaT07RcHQbozmOUzfoAPX4SvpBrKUQfryiCP7m9C
	brcUIg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv437y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:22:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ca5d2474c7so199311975ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 01:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784622124; x=1785226924; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KsWcVMJwJ2v5K6dzKusBzpR5lVUpfbb9D8XZrMSTi04=;
        b=a6GGJIQ6I3QISRGS3W2q1eZbCcdltnA/A1A4mDRTkKlnWQ+FpmiaY/R3VRwr3W8ZC5
         txLMG3192+SvGvzFwdYmDCSGaqJlMhVgUv0bXsEp8Jw++Ae5zqRFjhK5n7z1r7GdFIK5
         xyqidPeL21BzNsIvi+7vlZyBO1TGvaZVHiblMvDuIPWVsGVT9jroRIwZ/oCe7qqbtykV
         QJjT7ZLvLOZQvhbwGf5ZrDEC7fph/bc9Ikck5W7UPN42XZ4Ina1mLoulKZKOUraX8k0A
         60dvOjsLTUrQqKX/0egcGmxyXzZyZXWkB0kmp+zJetl661THr4Os77Xx5fP/DF2NULZn
         T72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622124; x=1785226924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KsWcVMJwJ2v5K6dzKusBzpR5lVUpfbb9D8XZrMSTi04=;
        b=kn6cYz9yv5RxtVyh7s3uXCXUo1xTATm50coADM2o89pci2jIFSPR8Yfh17R5xWJhdR
         uZj+FZLpx9ybE+35Lu8yvBeNac8q0anGQFpezj7rBK/hVXhPil8P9k4Ut/Yg71YxMYmf
         UMDxMnqmAgNVfnJPnemkLMMA6ZT2reMp94Y+AH8sEgpi9nq7fu8WBdS73aF59qUu4ZRl
         TuDgTwwhuz4t54PAkpc9jevaQOEhPOv21fnmzwOS87bbYFHVX+hrREu/Er/nubZhQfEZ
         e8olf//mmZFov6csKE+VAeKuEa8qeuHiJwMTLZbx6tPPOZlN+61P7WzjTZid6xNZowlS
         tk7w==
X-Forwarded-Encrypted: i=1; AHgh+RqqqdV5MYpgzd8acS5Q+0yrIEweNWZG9/5+aIXaZXXUEeTw4xQk44bEwq2vg6bmq93TDiuUkFsIP1XklVBqUhB1@lists.infradead.org
X-Gm-Message-State: AOJu0YzBbkitcSWcJ7mWloWIbdkmAdKjtJwtMSBqSjqRMrrT7DG3n0Ni
	LrEzOtSQ9Fna51zvjYFvFcjs0x5gRheMW4AJuXStYnYO1d+DA/bulIwrDvz47YEGzTW4CKniBB1
	pEJFgJRyYOr9QI3w9s2wEoQDe7rY+JzAZHcvWpuUxs+8gnngCl0g8oegvtyOLEOwFtvP+uNUjV7
	2v2Q==
X-Gm-Gg: AR+sD12WovJrPwEB+IoPr/Sfeo0EymVBiqE2Il8YzkoAGIl12zKzZLz5N4OtZTf20H9
	+DTjBd/Gt9O95fNDbXDT0UMgs6YMrR3Wt4zoYVXMHh+i8pS0g8tAa//xn9Of5a4IB74Zgpbqkil
	WMu6DY+CEdsd4yRmVDUSYLBc8W8jXhKplyUETHuNHbgBTnj822Wo0ofC0CAdM20y6PCJFumELsA
	+ZKKRd06LTz/6ZSRhgiQwTJqzL4NmDAhcI5PZURXDcNhLZVPvbbaHdFUkazO6dEqMm7q19qViEV
	fODjXkhj9kN2VnEeszGa7wnbgYVS8smqZkAedrPkst6LhQAEUFLtKyq0ioa6YqrIgw2/0cR2k/c
	CkDKMXKgwE9hZCuAuYDKvsAzBvjVuEiH/uQ==
X-Received: by 2002:a17:903:37c5:b0:2ca:5d9a:ecc6 with SMTP id d9443c01a7336-2cf3494af91mr190418465ad.28.1784622124136;
        Tue, 21 Jul 2026 01:22:04 -0700 (PDT)
X-Received: by 2002:a17:903:37c5:b0:2ca:5d9a:ecc6 with SMTP id d9443c01a7336-2cf3494af91mr190418205ad.28.1784622123656;
        Tue, 21 Jul 2026 01:22:03 -0700 (PDT)
Received: from [10.218.39.50] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3476ba24sm70079565ad.75.2026.07.21.01.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 01:22:03 -0700 (PDT)
Message-ID: <efd5167f-48bf-4dba-b968-d1dac65ccfb8@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 13:51:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>
References: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
 <20260703161228.GA1948451@nvidia.com>
 <b7224dff-7e51-49cb-8421-14d090492dfc@oss.qualcomm.com>
 <20260715113913.GA3775915@nvidia.com> <ald3CuddY6I7gml1@willie-the-truck>
 <2ce09e84-c57f-4087-9dda-07245fadfc02@arm.com>
 <20260715125039.GA50536@nvidia.com>
 <d20d258d-d970-4ef1-bbb6-cdc83fc20c9d@arm.com>
 <20260715180949.GD3775915@nvidia.com>
 <787fa0d3-c1d4-442e-beaa-91a03238f511@arm.com>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <787fa0d3-c1d4-442e-beaa-91a03238f511@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oDKPhGcpxlbiiadZp6LlLOfLk45Zrvg1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfX8M18e7dlN+oC
 UWyqE4J+I+p7lvpN++TBwjI/B7KwrkWrrj4xaHJpg3/YbSaf+6m0C43azYmxCOuWDLhrpbfgggv
 4GR1ybH1ar/DXK9UKSOI7JVEes4A6Wjm7hnakqnScywwp5eiEnJJuu38p/YvPARGPxBWFfC/nth
 c/JfXUxLVd4cv8PI1r0ans/b8j1X/g1y3zyr11ktIXrY+wgahC5B3wQuA3oOZ8BykALQzMTc5OC
 3T0jvs+FLcK2n4VQdWGc/9sGiTvbJmmYag8lVfSCqctw31ivJXz1nVFs4VzowYk07a30+ETFiMh
 pvUzGPcewvZT93d+PKtUzakjpp2BWhGZtf3CsSqH167NqYoYypuDyLd6Tp44g/3LtV60Jg/nhRZ
 +Z4PxieET0BzxiXmrdOmTkpow6qPL59+scl2Ubx+XUy/b1o6c0eqdY8TJhV4nsbNpqVXqbu2K8u
 7MstWMSjoHJGlzaLf1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfX5Vh6mNbKhqBB
 rQ9f989BhbHfH3DKX46PQpZ+zMUOt6UamVrJVWGB384cqZNeTGYdhNbMNPB+HPlJamxuAPDubF3
 CQSBEgx8oIPoXiQzQUGBIDuNklHh3k0=
X-Authority-Analysis: v=2.4 cv=daawG3Xe c=1 sm=1 tr=0 ts=6a5f2c2d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=sSvbjkl6__CUZ7MaMMgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: oDKPhGcpxlbiiadZp6LlLOfLk45Zrvg1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_012206_499977_B7F5BCE0 
X-CRM114-Status: GOOD (  34.92  )
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



On 7/16/2026 5:29 PM, Robin Murphy wrote:
> On 15/07/2026 7:09 pm, Jason Gunthorpe wrote:
>> On Wed, Jul 15, 2026 at 06:45:09PM +0100, Robin Murphy wrote:
>>
>>>> AFAICR the biggest issue with arm-smmu was it using IO_PGTABLE_ARMV7S
>>>> as well. I think it would be fine to implement all the unique LPAE
>>>> features it needs in iommupt, I did most of them already.
>>>>
>>>> I do have an ARMV7S implementation for iommupt, but I did not solve
>>>> the sub page problem. So while it is functionally working it is not
>>>> usable since it wastes so much memory. That's a tricky problem to
>>>> solve since the algorithms depend on the gather->freelist.
>>>>
>>>> I didn't spend any time trying to do anything about this as I was not
>>>> intending to touch arm-smmu
>>>
>>> Indeed between the irregular table sizes (before you even get to the
>>> Mediatek shenanigans...), and the awkward GFP_DMA limitations and/or reality
>>> that many of the systems using it really don't have memory to waste, I'd
>>> have considered v7s pretty much terminally incompatible with iommu_pages and
>>> the abstraction that iommupt is trying to be... :/
>>
>> At least Matthew has talked about having a sub page allocator with
>> meta data, maybe with the memdesc support someday. Even today we could
>> have iommu-pages allocate a companion struct pointed to from struct
>> page that was sized 4x so it could be used for the freelist.
>>
>> There are some other options for alterantive algorithms that could
>> work without requiring the free list. I had some thoughts about placing
>> the free list inside the data itself as a non-present entry.
>>
>> It is not insolvable, I'm just not sure it is worth doing vs leaving
>> arm-smmu to keep using iopgtable from ARMv7.
> 
> Yeah, if you did want to keep bashing at it, then ultimately there are at least a couple more short-descriptor inspired implementations in exynos and omap too, however at this point I don't see the cost:benefit ratio looking at all favourable...
> 
>> Otherwise to have arm-smmu use iommupt you'd end up with two
>> iommu_domains specialized to 32 and 64 bit page tables, with their own
>> ops and a shared invalidation like how the tlbi struct is providing
>> for smmuv3.
>>
>> It is not outrageously bad, but it certainly is a chunk of work.
>>
>> If the goal is arm-smmu support of CONT then maybe there is some merit
>> in doing iopgtable as a one off feature. But there have been many
>> attempts so far to add CONT and they all had troubles, I had the
>> impression is is not so easy..
> 
> I think now that partial unmaps are firmly ruled out and we already have the multi-page map/unmap design it should be pretty minor. I'm also more than happy to stop there, have dirty tracking, splitting/merging and all the fancy new IOMMUFD stuff require iommupt, and keep io-pgtable strictly for the GPUs and "media" IOMMUs that only need to keep providing map/unmap/iova_to_phys for iommu-dma or equivalent usage. By now I'd also say we can reasonably park arm-smmu in the latter category - while technically it could try to support stuff like nesting and vIOMMU (at least on MMU-500), the hardware is in embedded platforms which either don't care at all, or at worst where virtualisation is Xen's problem not ours. As far as I'm aware even the NXP Layerscape platforms are happy with the status quo of just basic VFIO type 1 for DPDK.
> 
> Thanks,
> Robin.


FYI, I've just posted v2 addressing the review comments from the
earlier round — it doesn't touch the io-pgtable/iommupt split discussed
above, just the CONT-hint quirk in the existing io-pgtable-arm code.

Thanks,
Vijay

