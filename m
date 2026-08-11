Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9F7C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fLmbfzBbmwEHJMWWKfeQ9KCK6mpkgcHpwny+DSlSQKc=; b=bcBn5endTYN46w3PMpRUh3zxWQ
	lm9Jxiq7eH5AefgTZ0ESu2YZUcIpAiG2iY4T00+3Q4x/qpHe+ODczBLDhJiFdLoBpdtRYqKon7OAA
	bBQ64ozNmBuWNctGCC+5aPeTJI9nXGdKFVdExoyFd59W0AuDcKGS7bMU9VB9pswbdoy/I5OKH0h+u
	Cs8fxKmyW7NRUcBDQuKfXf6rI50dIeohCEqXNt4K970Byyut/ZInAY9kEmbP10JF/BXjhecTVZatO
	sm6/I1OZYuF1HNktuiSjAUumDQ9n2F+mNxJbF1J4JYG4vDPhbtmtXttfZWJdaUA5ivvBWvnsto2ER
	1Pcz7T1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wto7M-0000000EHi1-2iUP;
	Tue, 11 Aug 2026 15:10:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wto7J-0000000EHhY-0s1x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:10:14 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWvrj766899
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 15:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fLmbfzBbmwEHJMWWKfeQ9KCK6mpkgcHpwny+DSlSQKc=; b=TdMN0NdjLUGAgQxY
	tjx9wjb9d4NJWK/0eWqzeQeGQFpi/KuLyxUNPIB+lkIFwXsJ+579gbWyeY1ByD5e
	05S40M0qliYwJYsLHDRLom2Z87Vcc72lNfe64GXDK4Q+mMRlYDG2D4E+mcLyRoqb
	Car3TKcQYxypRmI9mq10n5v3M27Rm0zDVG0JVOWDVdt695GIgSCBEiNi3sGaydEZ
	JZ3C56PfxlBM3oD6p4uoOig3lcxPtswVhDcOwO5FWlY9gvZF6GsqBpMICBdVuKmd
	0asrJUav2BuQGSe6XrX8Uy91E+3/4gzGhRjYoMmFyIdlKfPaSshBPdd7MSDqlEQx
	xSJa0A==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01q1152g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 15:10:11 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81cb01c07b2so55778347b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 08:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786461011; x=1787065811; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fLmbfzBbmwEHJMWWKfeQ9KCK6mpkgcHpwny+DSlSQKc=;
        b=NtixVkfcAJ3x6whOz0rrXIltYU9WVBOZqBZymNVXYivIIultuw6UXXGHIxN8XAvaMk
         iEVcNdETKamnQxHkcaqI7xxBHnN+QOyRc9CQ1Pm+MNroLpltc85DI/MeCk4UvHzhRGcb
         WfNPN8GqIApoCTbbFwf9oy4qO88GLdy8hmIfeC5RgZs4svNWbAy9yB3nZ+DlHNFBc3ya
         UOC9QkU1LbwEegtGuEyaKkjn7+2w969iD1XWReXNGbY0F+pMR/jI44Vx/9qhNATFaF4v
         hPn4oRAP5ixu1u2EgHdNkqqHxZ/dqQ/pfDVpCiqKSEJOAR8aEjTkY09unM2auHCvzcj5
         ZO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786461011; x=1787065811;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fLmbfzBbmwEHJMWWKfeQ9KCK6mpkgcHpwny+DSlSQKc=;
        b=QVkys2qSR7lNG7/fvDmCTkXz0GWd16g4sUVtN2Mb7uJtiArWqouqwDYddNxHdKMkCM
         wDe0VYhyGOLdSEb/ykRiUB6qQLeTSQTLgCi1bWKAsjObd8LHasfYpUVBro7su9+fJu/X
         4y8SXfda22EzDK4QL/WtIW9rauFAJu0JN4i9lVny7wmvY+J6anuN9L7mePUYHXBFDGrH
         xMht93izzcwkPO4M5OIEaXMi0P6LIW7QdF1ief9TNAr+ru1fPnSYXzqGJHU7H0ijTwUU
         6HnCVfa50UNKE5tVz/oxfH9HMwMCyrQw2m8a4ha7dg/yAPZ2zXGPUBUVByEn84k8fNaV
         X7uA==
X-Forwarded-Encrypted: i=1; AHgh+RqxtXuRC5zht7mH7KXWRC61gTeUZQMvMpGJCNYejO/xi1Z27NRy0cYGzTo8UNu+Sma4pr2DmYU6R2snhYnbRH9d@lists.infradead.org
X-Gm-Message-State: AOJu0YwTmJ3ZUrYYSUtfAav3ulvRh22IjLLtvov9o6PL0M+Fp31Qt8s+
	nc4tNmqzNT4//AAb8ErLjh0Wl8Sel20Qr1QokB3r/mx7nS703UWD1iF9wl9MVAplAsum9uRZFPO
	RQumw+zQr5tQptttBAatOfKhg0g8/TMuRjJKeLGMxgQqDWlawtITjv6cTi90Tr+71YXTgDz2vDi
	peSw==
X-Gm-Gg: AR+sD10Rx+eLgx6t8b3yPgiLd4dUqZT/sZHNEhqXRBMOAkfqWRjgRe9W34jgAY45ZRP
	KEJP708x27WLQ6bcinODkvhQq6CFY/olTLXh+BTNbtsexKp/YYypwY1k3LNZe+UARCmPs+OslgG
	ZlgMo1P1q5R5fCcbyb4KivC2uYq+O3oGp/biU3LNZYrs369bp4FyqKUvbrpu+ugUbKFpytyHlgy
	JdY2HwpJ/y/+gAMKnfUpbH34rOr2xjVdEl0a0Kd+jLkDA2E1HG32LZk9XTudfk+ph3BW0TpUkBm
	GkqWjJ3cytw9kSqNhTqioQkFx76Vy+C9POaxQXSAja5RIkxaRR7p06uy9KtdSybKdJtN2LGaTQa
	9xjTrz7pRoBDtCUs5f4puKwXmV5ec
X-Received: by 2002:a05:690c:e3d0:b0:812:be92:6ea6 with SMTP id 00721157ae682-82f2e45d7dfmr27386247b3.28.1786461010587;
        Tue, 11 Aug 2026 08:10:10 -0700 (PDT)
X-Received: by 2002:a05:690c:e3d0:b0:812:be92:6ea6 with SMTP id 00721157ae682-82f2e45d7dfmr27385417b3.28.1786461010018;
        Tue, 11 Aug 2026 08:10:10 -0700 (PDT)
Received: from [10.218.33.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-82ebdb7bad4sm11169137b3.12.2026.08.11.08.10.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 08:10:09 -0700 (PDT)
Message-ID: <328b2179-3284-40fe-808e-b1bbda322e1d@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 20:39:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
 <nrht4irqtvt2vk3lrqvljonarc4kanht2nrwjt7pppsfhozffv@o4xei47l6gcj>
 <e8b247d9-d60d-497f-a831-a9772d27481a@oss.qualcomm.com>
 <phlk6zsxr7szdadsvgoecf7ewcqjkuaj5aeqmfqa4uvvvvnsmj@57u2pofxewuh>
 <4e266d45-ee88-42f8-91da-6253927686ae@oss.qualcomm.com>
 <ak5pC_meP8KRc3wJ@baldur>
 <9f31bf3d-3c7d-45ba-bc25-e6349f689b70@oss.qualcomm.com>
 <kb2ftnhyvewqgfjdsteenrd3vr4qbrcy3ooiasiui2rchpytol@u2wqjrsc6ebb>
Content-Language: en-US
In-Reply-To: <kb2ftnhyvewqgfjdsteenrd3vr4qbrcy3ooiasiui2rchpytol@u2wqjrsc6ebb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SmiSF3mRJd_qJHctG5Tq8glTEJxqhKyC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEyNiBTYWx0ZWRfXzPPdnb41U1Rj
 6QRwK1eJOATy4l6df5Z5xSDAbnooCBotfuuBjYE3PrII+S5nazA0/gquI3ugw4NMJtsuyFIH93E
 q3Ib4OqynMuOJs79UAWjFf5Wd/9L1x6odBKEkBRfJ4Y9uJPwpM8zws3og/8sMt7j1DvRwSzYGD3
 MnVjYl1PvnxDOsM2XVtSbh9S6HPFvpe4fIaemXpwkdJd3dLBJ8aEDpPscYl69nneDngdCuHc1g9
 Fbr5gkoPpOQGpNtH1bOOHyak5VOuYYGbvuNykawxU2vgx8mt5ebl8hOwEN5oRZJlsaPG08qWlvw
 ZmR23MZrUz4sIPCoV+YyHkD549sQvd9qQI7Y6mewFw5u4B4V9PJGUW9q/1fK75CzaEdOwocR6oY
 Bq4+NkRJUtT93wNhfc6LCHKNEWISSjdDlRpPt17qck+b4xaozCM9GBqZYgslC6LPCXBm9gq92b5
 CEnO3xAsGZQl96r6zcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEyNiBTYWx0ZWRfX6wPdWgqoyGbd
 4xxoWmtVbomyxXFp81QvpQrj1S0HrhqiabW7LaIw8bytkXVm5QSqiN61cIlDUtVH48mWTOdIvI7
 uW/r+bz5p6szVcjIk+fonuwkQANfXac=
X-Proofpoint-ORIG-GUID: SmiSF3mRJd_qJHctG5Tq8glTEJxqhKyC
X-Authority-Analysis: v=2.4 cv=brt8wkai c=1 sm=1 tr=0 ts=6a7b3b53 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=vyUGYwsnUGOcFljtYcEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_081013_399409_872A6213 
X-CRM114-Status: GOOD (  26.50  )
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



On 7/20/2026 8:10 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 20, 2026 at 07:41:35PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 7/8/2026 8:48 PM, Bjorn Andersson wrote:
>>> On Wed, Jul 08, 2026 at 08:22:00PM +0530, Bibek Kumar Patro wrote:
>>>>
>>>>
>>>> On 7/7/2026 10:12 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, Jul 07, 2026 at 06:06:59PM +0530, Bibek Kumar Patro wrote:
>>>>>>
>>>>>>
>>>>>> On 7/6/2026 11:09 PM, Dmitry Baryshkov wrote:
>>>>>>> On Mon, Jul 06, 2026 at 10:26:34PM +0530, Bibek Kumar Patro wrote:
>>>>>>>> Some SoC implementations require a bandwidth vote on an interconnect
>>>>>>>> path before the SMMU register space is accessible. Add the optional
>>>>>>>
>>>>>>> Why is it limited only to those SoCs? Is it also applicable to other
>>>>>>> Qualcomm SoCs?
>>>>>>>
>>>>>>
>>>>>> I was hoping to keep this series focused on the core infrastructure
>>>>>> changes: the bindings, base ICC bandwidth-voting support, and DT
>>>>>> interconnect properties for the platforms currently supported on
>>>>>> Qualcomm Linux and have been validated so far.
>>>>>>
>>>>>> The additional targets have not been tested yet, so I'd prefer
>>>>>> to add their support in a separate follow-up series once validation
>>>>>> is complete, rather than growing this series further. WDYT?
>>>>>
>>>>> Then it should be a part of the commit message. All SoCs since SDM12345
>>>>> need to vote on the interconnect (and then, in the cover letter mention
>>>>> that you convert only a few of the SoCs). We possibly can help with
>>>>> testing on other platforms.
>>>>>
>>>>
>>>> Ack, sounds reasonable.
>>>> I'll add the first platform onwards which interconnect voting is required in
>>>> commit description.
>>>
>>> But to what degree is this related to a specific set of platforms? If we
>>> look ahead, aren't we expecting the list to grow to include all
>>> platforms in the end - resulting in a lot of noise and churn.
>>>
>>
>> We have seen this issue consistently on SM8750 and later platforms, along
>> with at least one customer-reported instance on SM8550. As a result,
>> downstream Android implementations already vote for the required
>> interconnect bandwidth explicitly on these platforms.
>>
>> On Qualcomm Linux targets, we have observed similar issues on Kodiak, with a
>> few occurrences on Talos as well.
>>
>> My understanding is that the interconnects property remains optional, but in
>> practice it is needed for Adreno SMMU operation on these platforms.
> 
> So, it goes back to Kodiak and Talos. What about SM8150? SDM845? Earlier
> platforms? Is it limited to MMU-500? A6xx+?
> 

Thanks for waiting this long for response,
I rechecked all the legacy platforms which are present in upstream.

As per the design it will be applicable to all targets with MMU-500,
(Even though issue hasn't been reported for all the targets on MMU-500,
e.g sm8650/sm8250 but the nodes will still be needed).
It's independent of adreno version i.e A6xx+/A5xx+.

Reason being the design difference on
how TCU works in QSMMU (SMMU-v2) vs SMMU-500

   QSMMU (SMMU-v2) — SM6250 / SDM845 era
   ──────────────────────────────────────────────────────────────
     The TCU is NOT a separate hardware master.
     It is integrated INSIDE the SMMU-v2 block itself.

     GPU SS
     ┌──────────────────────────────────┐
     │  QSMMU (SMMU-v2 @ 0x5040000)     │
     │  ┌────────────────────────────┐  │
     │  │  TCU (integrated, no       │  │
     │  │  separate AXI master port) │  │
     │  └────────────┬───────────────┘  │
     │               │ page table walk  │
     │               │ issued on same   │
     │               │ AXI port as GPU  │
     └───────────────┼──────────────────┘
                     │
                     │  qxm_gpu0 / qxm_gpu1
                     │  (GPU data + TCU walks share same NOC master)
                     ▼
                GEM_NOC
                     │
                     ▼  qns_llcc0
                LLCC → MC → DDR


   SMMU-500 — SM8150+ / SA8775P / SC7280 etc.
   ──────────────────────────────────────────────────────────────
     The TCU is a SEPARATE hardware block with its OWN AXI master.

     GPU SS
     ┌──────────────────────────────────┐
     │  ┌─────────────┐  ┌───────────┐  │
     │  │  GPU Core   │  │ GPU TCU   │  │  ← distinct HW block
     │  │  (rendering)│  │  + DVM    │  │
     │  └──────┬──────┘  └─────┬─────┘  │
     └─────────┼───────────────┼────────┘
               │               │
        qnm_gpu0/1        alm_gpu_tcu    ← separate NOC master port
               │               │
               └───────┬───────┘
                       ▼
                  GEM_NOC
                       │
                       ▼  qns_llcc0/1/2/3/4/5
                  LLCC → MC → DDR

   ---
   Why this matters for the ICC vote

  SMMU       TCU hardware          NOC master        ICC vote?
   ---------  --------------------  ----------------  -------------------
   QSMMU      Integrated inside     Shares qxm_gpu0/  No — GPU data
   (SMMU-v2)  SMMU, no separate     1 with GPU data   traffic implicitly
              AXI master                              keeps path alive

   SMMU-500   Separate GPU TCU+DVM  Dedicated         Yes — TCU can be
              block with own        alm_gpu_tcu        the only active
              AXI master port       on GEM_NOC        master on wakeup;
                                                      no implicit vote
                                                      from GPU data

On SMMU-v2 platforms the TCU never needs an
independent vote because it physically cannot be active without the GPU
data path also being active.

On SMMU-500 the TCU has its own master port — it can be active (e.g
possible page table walks during wakeup) while the GPU data path is
idle, leaving GEM_NOC without any other voter. Hence the explicit
MASTER_GPU_TCU → SLAVE_EBI1 vote is required.

Following are the targets which I found out available in upstream with 
qsmmu/smmu-v2 and mmu-500 respectively

   Adreno SMMU — upstream Qualcomm targets

   SMMU-v2 (QSMMU)
   Platform   Compatible
   ---------  ------------------------------------
   MSM8996    qcom,msm8996-smmu-v2, qcom,adreno-smmu
   SDM670     qcom,sdm670-smmu-v2, qcom,adreno-smmu
   SDM845     qcom,sdm845-smmu-v2, qcom,adreno-smmu
   SC7180     qcom,sc7180-smmu-v2, qcom,adreno-smmu
   SM6350     qcom,sm6350-smmu-v2, qcom,adreno-smmu
   SM7150     qcom,sm7150-smmu-v2, qcom,adreno-smmu
   SM6375     qcom,sm6375-smmu-v2  (apps only, no adreno-smmu node)
   MSM8998    qcom,msm8998-smmu-v2 (apps only, no adreno-smmu node)
   SDM630     qcom,sdm630-smmu-v2  (adreno binding to be fixed)

   SMMU-500 (MMU-500) — with qcom,adreno-smmu
   Platform   Compatible
   ---------  ------------------------------------
   SM6115     qcom,sm6115-smmu-500, qcom,adreno-smmu
   QCM2290    qcom,qcm2290-smmu-500, qcom,adreno-smmu
   SM8150     qcom,sm8150-smmu-500, qcom,adreno-smmu
   SM8250     qcom,sm8250-smmu-500, qcom,adreno-smmu
   SC8180x    qcom,sc8180x-smmu-500, qcom,adreno-smmu
   SM8350     qcom,sm8350-smmu-500, qcom,adreno-smmu
   SC7280     qcom,sc7280-smmu-500, qcom,adreno-smmu  ← our patch series
   SM8450     qcom,sm8450-smmu-500, qcom,adreno-smmu
   SC8280xp   qcom,sc8280xp-smmu-500, qcom,adreno-smmu
   QCS615     qcom,qcs615-smmu-500, qcom,adreno-smmu  ← our patch series
   SM8550     qcom,sm8550-smmu-500, qcom,adreno-smmu
   SA8775P    qcom,sa8775p-smmu-500, qcom,adreno-smmu  ← our patch series
   SM8650     qcom,sm8650-smmu-500, qcom,adreno-smmu
   QCS8300    qcom,qcs8300-smmu-500, qcom,adreno-smmu  ← our patch series
   SAR2130P   qcom,sar2130p-smmu-500, qcom,adreno-smmu
   X1E80100   qcom,x1e80100-smmu-500, qcom,adreno-smmu
   Glymur     qcom,glymur-smmu-500, qcom,adreno-smmu
   Milos      qcom,milos-smmu-500, qcom,adreno-smmu

   SMMU-500 — without qcom,adreno-smmu (apps SMMU only)
   SDM670     qcom,sdm670-smmu-500  (apps)
   SDM845     qcom,sdm845-smmu-500  (apps)
   SC7180     qcom,sc7180-smmu-500  (apps)
   SM6350     qcom,sm6350-smmu-500  (apps)
   SM8450     qcom,sm8450-smmu-500  (apps)
   SC8280xp   qcom,sc8280xp-smmu-500 (apps)
   SM8750     qcom,sm8750-smmu-500  (adreno-smmu not available yet)

Thanks & regards,
Bibek







