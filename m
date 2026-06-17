Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08729CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 16:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDODFxvqjMAAbOWBcbLxnUN/zpkolakDgolvYWIF5VY=; b=0rcTOsAOCBR1B4ZkwAgATb83Yf
	vLmM6K0qXwCcoPUoVs/tRas6y/Nh03vjck9gIN7I+3H5mBLB1QX3wdcH+N2DUJhdCFx+OYIpFd0Oy
	2W2ITYjGcKwkeFw4fqz0bl5YpTbkjIPEXJwrI6/2ee/008qn9tqVKq5RfQrw4VG/5l/qv00BHBljo
	MSaZouspd1ZlEuWvW5Tz2/hCquJKOXLVoSNDC8M02cbR6p2sWUh+qzpbeXJl2CSFIzi8XhP+BXHm2
	GryI7ymY6SwHr+djpbjNzXmUP38rs3zFeDBMrtQSdiPtGlV9+K+SxPtSU4vocHgCS0HIM/f0cO3/T
	xfK6+v6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZtBn-000000003Vj-2pHc;
	Wed, 17 Jun 2026 16:32:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZtBl-000000003VL-2EJL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 16:32:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HFoVI72697247
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 16:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tDODFxvqjMAAbOWBcbLxnUN/zpkolakDgolvYWIF5VY=; b=FVpm4RLhwTJ5UyC7
	B6ZGjcXa2vAgMJ+e8iK7oJvmAAqYMj/eZMOaamwFRLMl12N5FkOXZvFP4Mlp1Ajy
	x6bwywCR6e810IfnJeqOF/JG4xSZErFagttXbb78rHgDxQQIag9OmUmlk1YrlXYP
	kvPzr17u2GI0bNWkxo/Sd+lSoyF5Wy0f4QmLN7kXlraJ8weXLfKW0ZG4dbTi5QCw
	Khy2/MkzufgcxzYGeE/fkpjvVsoexrFnwKkauDqwx1sOJLiOL2jtXApBr08HgoL6
	Lysw52Cz5XlOJ8GxYoaLIvslQKM+HmuRqp/nviqEEHzfcIgyxJ4BTvNZBbJS0f7F
	QZ2D+Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueet460t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 16:32:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c6af282daaso95155ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 09:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781713948; x=1782318748; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tDODFxvqjMAAbOWBcbLxnUN/zpkolakDgolvYWIF5VY=;
        b=eAg9FymodZxtYAfzO33RIwBwaCkK8jNOYI5cZ4m120QeyCop+axM2eV5WoyrolMMHw
         xy5p3NLubimX6Gf8JfdGNAwCVUu2mRK1Oo6JDt61rjumQjDW3K6s/Y40txyagAv9jn/e
         ovgjG4ArYJ/cBjTbgEyaROf05rBicYhDyHYlKu8r5R/8OzDpTLFSieXQ/kEQzLfTi/Hp
         7UICYkBoYdIDsSeuCLLeNTjFRbc/2JFfKMC7tHJ8j6yiShq/t387+dc0EKZ70Szjmyn9
         8x3huCRvJfCzcJlipvfAKTTlQykvvzgVVsbnIVRppKyeqQfUL3+aIFygMixOA9eRJQaz
         4y+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781713948; x=1782318748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDODFxvqjMAAbOWBcbLxnUN/zpkolakDgolvYWIF5VY=;
        b=n/MK6x/5biNwEJ86rez5BXNHuhOonovplhCSu1r+xGhDZogZhwrEuIs4o3OpekjQkJ
         weVJJ6/vQ3uXvr7ziq2PafZoSgweCN1PU2bF6H5Z9MBE2lgqNvfuKN3bs1kOQoVQEtER
         cmRjXZZ5RediWcP8xWHx//L4bBlrFi9XF7woRqRsW7WfVqzTlWIkQvgSssc2N8FNrbAH
         10QiJHpgwqcmhCRC4LC5NIVQAZKAXCsUjArx/CHeoc/B7d//oM0vqHQcMhLZ4muFdXYz
         MmZW0/51GSpFDmER+UCak3MhKSuni9tqqfdh7B19xfDD5vG84ZKxqNrKXWHMlKQnaoxG
         1s8w==
X-Forwarded-Encrypted: i=1; AFNElJ9RRx4+wuwSQhwg6Iu2sD1OhfGXmZdTjDkYsltg92pPBknp0fGQxNHKWF/5FliHSAppFu5pzfjSRz0e6M7clmzS@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhppvk7f4b35vKcQgpxnZfPTg6sIzOy8oO+SggBDeP0YmxWyb+
	GfQoFuwQu/pLJcU4Ksk63CIiCP8zjLmX8NxHFn2zg+lzHLG/Va2nthbvus+drTQC4cDg9fyjdlR
	jaQKGAj7TMw74ecUC+3qSkl8WarFpOkFUQXr8juO08F9GehPmXBr93QwIX9bprU7r7z/ljEvUZa
	2kLA==
X-Gm-Gg: AfdE7ckqs6iXF1cystyqZLKJ0/XlPi+qG0+4d2SM04OYVDCx8A7uDwzy+5reYOkN/14
	rhBKq9fy7OoveIFK2qo/5ym62JtNI2RWLLoOd0T9N/T7WDQfOpah4soyzlTU47FdY5BrdSxyGlj
	m4eTjKq/nqogh98R5KCchbx8GhgVClObszjE61DIB0aoy6fFICYJy9AeWN+c4+ARuk+7gIIFAL1
	KnjbtLqc78JUkbmSa442Fs4K2SqwFB0gXkmaHoD6d+ezw3uyS43ziRCE6iDXuzdHWyyqW0s1Fsi
	qJY7xRL1EcSYechULA+UII04hI4sbJARdZMBq394kGbQiuqefpUdc8L+Fa6UrqDWureE2H5Uqis
	PWOEPRcMI8JKsAHzuyBwe4RhnvVxck9bX3bLPuJU=
X-Received: by 2002:a17:903:3806:b0:2c0:b35d:ed49 with SMTP id d9443c01a7336-2c6bc09a06dmr48129615ad.2.1781713947982;
        Wed, 17 Jun 2026 09:32:27 -0700 (PDT)
X-Received: by 2002:a17:903:3806:b0:2c0:b35d:ed49 with SMTP id d9443c01a7336-2c6bc09a06dmr48129125ad.2.1781713947448;
        Wed, 17 Jun 2026 09:32:27 -0700 (PDT)
Received: from [10.219.57.228] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6d637caccsm7991475ad.20.2026.06.17.09.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 09:32:27 -0700 (PDT)
Message-ID: <984ff9c7-3eef-463c-a330-bf7acd063667@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 22:02:21 +0530
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
 <8518a085-b8b7-4ee6-b08c-8dde3971a6f1@oss.qualcomm.com>
 <2i6yzwu2yk5bngq723g75yeqzeg4ihvtbuydzunceltl526tjp@vnt6nmxxkfut>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <2i6yzwu2yk5bngq723g75yeqzeg4ihvtbuydzunceltl526tjp@vnt6nmxxkfut>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5fz0dgOQiwRLqC5_CnYVNrY5eiseUa2q
X-Authority-Analysis: v=2.4 cv=JufBas4C c=1 sm=1 tr=0 ts=6a32cc1c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XunzQJBhBzqSrgwI8wIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 5fz0dgOQiwRLqC5_CnYVNrY5eiseUa2q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE1OCBTYWx0ZWRfX3YCFnsQwdAeN
 zZaxC9Emo5BHbLSH4me/EL0TBkk9zAsEv4vZzeIlRUDg+vF68XtV/JxnBM7b2ZMYdrYeucSRVgw
 VzXOAiReZF/9+fhFJXQYw3/IwDFmHkDBdccytdKx8MvOGvdi4HMft0LcU7MmWzAH8KygQApTWVQ
 xPNKmLfuvplu/cQufbchwS+ENM5LXeLDzVr57cSpGDPs6ST7PPm8E3xdNQpryCo1i9a1ZTBDTyM
 z/APeTU5DJpK7FpHJFsZe7wx3yud/KQhsrHB0JWZ/1XkXjLCapIMNB57l9G743p7T4G6ivDhQUK
 5y95mU1cKXSWt0KlwP0RWhafFBSIq3TRZyjBoqLVGQVPuNy61l3nJywQknarln6IpdPAF86yzoJ
 SVaYlp6zIEAYaigJHnJkNxY9zZbZNQTGWuuur74GAxPiL8/+5/NZOSIiMaMqAilzBmwQER3XAa+
 0m3UL9IpZacAQlHLLGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE1OCBTYWx0ZWRfX0C+108HNFEo6
 JSTgnEjkrlpf0/W+vKUQsj+aYeTLYMxgaIZZokegf+AHA2wK0JIzbBCb9Nsb1W050AXHCrd0b1B
 nRWL0T0lFlu6QAkVRIJC5vnVnR/FEiQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_093229_591477_B2CFD76B 
X-CRM114-Status: GOOD (  24.20  )
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



On 6/16/2026 5:52 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 15, 2026 at 06:55:45PM +0530, Bibek Kumar Patro wrote:
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
>>>> +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
>>>> +
>>>>    static int force_stage;
>>>>    module_param(force_stage, int, S_IRUGO);
>>>>    MODULE_PARM_DESC(force_stage,
>>>> @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
>>>>    	}
>>>>    }
>>>> +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
>>>> +{
>>>> +	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
>>>
>>> Is there always only one bus / path in question?
>>>
>>
>> <Apologies, missed to respond to this query>
>> Yes for TCU, it needs to only have a vote on GEM_NOC interconnect
>> while accessing the DDR in downstream path (client->TCU->DDR), which we are
>> addressing here.
>> Hence it's only one icc path in question here.
> 
> Again, you are describing Qualcomm platform, while the code part is
> generic.
> 

ah yes, single icc path is specific to Qualcomm platforms as of now.

As per my assumption, it's possible for other vendors/ARM-SMMU users to
have one or more than one icc path to reach DDR in downstream flow
(similar to clocks).

I will revisit the logic for icc_voting to check for possibility on
additional icc path as well, so the generic code can cater to other arm-
smmu users.

Thanks & regards,
Bibek

> 


