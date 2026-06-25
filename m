Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97BFCDE002
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 05:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3I+DqW2/rPEMQxEB4Tut72vdKlbdYsutIbq0uGtNJE=; b=s7HUKrlSAEYfOqWfJJBJCC3CxK
	FbS4ccxSBp7yxxHlR6S44FbirCVJdhCJ0zKi5hVLWBZpPMYCdM1mNAVQ4M3b1PPHCAYxNRTaRf9yr
	SnYx2AYFhumn/yCo31RIr2GSrSEYQGMS3yTUM0xqxW6ATJYX5ETK63TVo7ocXqxKgqANmZYorCJEm
	EJHHHy+DXQB/2DeIgoGg5jn0UQzirMB+xXPCP4BC30f2LQp/8XkMJ7rQRlk7fSbNZXhG/lNQcmBwf
	Nz2CJ9LYxwyhBkUjPAt77Bq+LsbPyN2fuOP5WdezkFvZjJa3J+HpfWRAj55nZnpELkUnRRoccpXBg
	KPFbftaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wccwK-00000008g96-2c2f;
	Thu, 25 Jun 2026 05:47:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wccwI-00000008g8j-0XcS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 05:47:51 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3e1nK3405679
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 05:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M3I+DqW2/rPEMQxEB4Tut72vdKlbdYsutIbq0uGtNJE=; b=knk/ccUxuYUeuhqY
	pdLnzCEbOCPpAxWu3+BOFN6RC5NhBF7yiQbjorS3jGDvc6Iw74jH5SGVpDpXEHWN
	VfRuvUKqrGT/hOcQeR0Su3QkK55YFvxPGgBXUOk2qgJcrIEFwQEGvgYfn32VAQSK
	25Ck37sCRMHpaRWSoTbvYQBJkM2bePYYo8O4aWa8h6Gsfzu/s5cRaiSUWIH5itce
	bqC4u4l8wulKN69i7W4QoDXJO0OrDYyunytLkkrZ93yIIg187fhop3Mx5LBDxKQK
	q6QcvskHQsRHwoikLAUpXsLGVTsMDcy2lvOt5KnidoalAnxgR18i8GeK/zonCY2p
	q6uOYQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0tsprwb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 05:47:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-845b97ebc72so87864b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 22:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782366469; x=1782971269; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M3I+DqW2/rPEMQxEB4Tut72vdKlbdYsutIbq0uGtNJE=;
        b=RZ80M9jOI+y9JCTQocB6Fi+SXv01aS0ZXK9K3ArYQDEDpER8cw7Iq8YdMt25gUdzFf
         akTWIYI5cVNpa61L3x4lAQSzAIb0kIfh9I5L4n6fR5nbcHql99cjuelOCAgpkdbEf924
         4himrckJPQviWP7NZKieddKU/3jVOIPHwU1yCrKuS9vBEt8MeNYnQz8stJF3cAhnVfuK
         mRB9tFPCz2U5kSwiOjpA0nykBt4uDg7BRuFQhFohUz9uRXMrX3yR5Ss+LAwUgidN0+i5
         eUTCsRX4fCB4VPbU5hvZ4hBSg0ztY3mwnyfe9h958AsDgGJLUeXY3yyB+7xSTR6oIDOm
         QuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782366469; x=1782971269;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M3I+DqW2/rPEMQxEB4Tut72vdKlbdYsutIbq0uGtNJE=;
        b=oPeNwRyV3YWeXypvr53da5lj/jWZ4xCgUiUpbL0qZ+cVAwfqeHT3eRVoXpJDAhbPIN
         M9IU+LXKHL47LbRBMFOeLoEnscNWNTbeRNdgJ3ezYY13TpiXu2NmiYMC2L4eKmstOkge
         L8auDMkPsBCtmCulGC59eS2Zsz8sT6gwIvM84o2+Q35SXFHXCLt1if7fC11x1g2vuy84
         00ra6TMgZxewEE0Lo3zwm339XJxMpbvKMmeVy0o3/QHecNd9WPAONsUDVaRQjScZek92
         XxiyOY7pO0TklTPcWjDHG2u7c5striJZgrsayRB0IjGAtf5K/G6JPi256ja/F1NnjR7l
         rtpg==
X-Forwarded-Encrypted: i=1; AFNElJ8pTVf4taQkv3HsjA8zZr6j2ByrZpAlB2t1/Rq1E/OEGjyi6ProP5P/zv3p3fL/EYEUABCTlhe3if91yVsQgcnN@lists.infradead.org
X-Gm-Message-State: AOJu0YzcPtAcef9EJ8/fNI/xc3/82m4lzgjDUS6/JapCMbCaJdlA35ZH
	6DYgPgWaE4f1QRf7K+R2CQa4XE05H8HCS45qXUPmXheqR2oRlVCcJmLTOrv475YFSqnJ1EkXNog
	9+hl4wBqqpfohkZ31ZpCFMReaVwgIUGA9TEzKzN8uoMWFyvsbG536HWsrK5PffUyKq2SLXW3IVo
	rfQg==
X-Gm-Gg: AfdE7clhUEMIhnlTdbfQCpxPkTKpHA+SxnHijiVq6RwOCgpl6huatDj4ys3W9TjmiRh
	3Z4Ji0dtCZeIFH8nv4D5qRaZ+xbWSUtCzlnjGXTv0kAt6HvQxkBd6Cn3Qt1cEJjPLuW9O5lxh48
	b+LxIUSZEewOBfSRkgO7HMSJFD6kGlGBXCM4Z1fOmWRhtCf8QJMqd/PuKI1qKXfT0ap9VdpNJDL
	vmU2BuFhTilorVt8GO2gWkkNcv3D6wQIVgvVGeqn2MPVU5kxm9lx6m102yEvO/JgZckFvuzffEU
	qhpAgCIRWy/gRE3SX8aYgVY2cLb/ygNdCtHlXZkFVOaiI2jxwbHzQV8PtHXYDmW3qxL2WaOfEtq
	PuaHkJG+aL+b+t0cr8PXlq8uziwE/y1+Pxwcf1rnhTM7y
X-Received: by 2002:a05:6a00:f8b:b0:842:7f81:8079 with SMTP id d2e1a72fcca58-845b3ae1ac6mr1470948b3a.37.1782366468451;
        Wed, 24 Jun 2026 22:47:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:f8b:b0:842:7f81:8079 with SMTP id d2e1a72fcca58-845b3ae1ac6mr1470925b3a.37.1782366467845;
        Wed, 24 Jun 2026 22:47:47 -0700 (PDT)
Received: from [10.218.39.50] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcc82dsm4343164b3a.7.2026.06.24.22.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 22:47:47 -0700 (PDT)
Message-ID: <9b5b8feb-da05-4381-93dc-c11e135fff10@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 11:17:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Daniel Mentz <danielmentz@google.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>
References: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
 <CAE2F3rABU2_d+e+NuFJ3ngDCEnGuVCsmE612V9RAKmyAX-R9Mw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAE2F3rABU2_d+e+NuFJ3ngDCEnGuVCsmE612V9RAKmyAX-R9Mw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OL8XGyaB c=1 sm=1 tr=0 ts=6a3cc105 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2pZLd1I5B0H_JK-GwgIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA0NyBTYWx0ZWRfX7hr0Zc6JNXpB
 ZSu3inlxFzThEfdwqjTOrjen/nPSfGvidecgz7UGwkGy3J1ITiZ5ZPByZWHjMd7Bnd7H8aRxFK6
 M8H0tnEvjQKHQ+yeBqPFtIi11JAgLLOvWjOeltiSv4C52XLcUc8i60YpsjWzzn4BV3dKeeh9K/6
 h8y80CNuJUvKvDSqNWYTVgBsg9gqVdGo9h2WPT7cTi3ZSBxdDekKDglWRRYCFTdXF+C9LIFuZcQ
 LmkpRKWxRj9RW9zPwBSMRiSIct1w7SFF/yRomNL84bUD8cS7YiihoVo+wnC6u/PJblr7NL3QF61
 zm/kBE9m6m3sVo5ZK7Z+3X4akjjNGVyvoiKtYoqWtZjikVgTG42Bd5WRcQ11A1BlL/K8TWM9CsF
 RRLV4NSGuvj4oNVJ0lQohJ2D0HPUa+DBkwzpNOoXP3NsrOBCDeAIFlAGKl3oxwrH394od5uaj/d
 63mMgYzrT9jpJT+6joQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA0NyBTYWx0ZWRfXwHFOmkO94TlZ
 VOcho4FAsqieWXPJtCk+DfUFcG0fhTEabHEYQRm62y2KhTMgF2y0w4PISd64qZO8SJYxI89qfYI
 ZP+0gzCro4IxqH4sOTCAnWCpHUz4yPk=
X-Proofpoint-ORIG-GUID: zd14iHUeqE4jEmCHUWMUGjrRAQqpZpyE
X-Proofpoint-GUID: zd14iHUeqE4jEmCHUWMUGjrRAQqpZpyE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_224750_183877_8AC3DEB1 
X-CRM114-Status: GOOD (  41.60  )
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



On 6/20/2026 1:10 AM, Daniel Mentz wrote:
> On Thu, Jun 18, 2026 at 2:06 AM Vijayanand Jitta
> <vijayanand.jitta@oss.qualcomm.com> wrote:
>> Support is gated behind CONFIG_IOMMU_IO_PGTABLE_CONTIG_HINT, which
>> provides a compile-time opt-out for hardware affected by SMMU errata
>> related to the contiguous bit.
> 
> Have you considered making this a runtime option? Compare this with
> arm_smmu_device_iidr_probe() where the smmuv3 driver disables certain
> features based on the identified implementation and the errata
> affecting that implementation.
> 

Thanks for the review comments.

Good point. I’ll drop the Kconfig switch and make this runtime-controlled
via an io-pgtable quirk, so SMMU drivers can disable CONT based on errata.

>> On the mapping side, __arm_lpae_map() detects when the requested size
>> matches a contiguous range at the next level, sets the CONT bit on all
>> PTEs in the group, then recurses with the base block size and an
>> adjusted pgcount.
> 
> I would perform this check at the current level not the previous
> level. See comments below.
> 

Sure, will update this check at current level.

>>
>> On the unmapping side, the CONT bit is cleared from all PTEs in the
>> affected contiguous group before any individual entry is invalidated,
>> following the Break-Before-Make requirement of the architecture.
> 
> My understanding is that for unmap operations, the following rule applies:
> 
> The IOVA range targeted by an unmap operation must exactly match the
> IOVA range of a previous map operation. Partial unmap operations are
> not allowed.
> 
> The iopgtable code previously had a function named
> arm_lpae_split_blk_unmap() which allowed a block mapping to be split
> up. However, that function has since been removed, which aligns with
> prohibiting partial unmaps.
> The other concern I have is a potential race condition: While one
> thread clears the contiguous bit, another thread could try to unmap
> the same descriptor.
> 
> Consider dropping support for partial unmap and just triggering a
> WARN_ON() if you detect that a contiguous group is partially unmapped.
> 

Sure, will drop partial unmap support and  I'll update with WARN_ON()
as suggested.

>> +static inline int arm_lpae_cont_pmds(unsigned long size)
> 
> PMD is not a term that is used in this file. I advise against
> introducing this term.
> 

Agreed, I’ll avoid PMD terminology here and rename those helpers/comments
to use block-level wording.

>> +static u32 arm_lpae_find_num_cont(struct arm_lpae_io_pgtable *data, int lvl)
>> +{
>> +       if (lvl == ARM_LPAE_MAX_LEVELS - 2)
>> +               return arm_lpae_cont_pmds(ARM_LPAE_BLOCK_SIZE(lvl, data));
>> +       else if (lvl == ARM_LPAE_MAX_LEVELS - 1)
>> +               return arm_lpae_cont_ptes(ARM_LPAE_BLOCK_SIZE(lvl, data));
> 
> Consider supporting the contiguous bit at lookup level 1.
> 

Sure.

>>  static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
>>                           phys_addr_t paddr, size_t size, size_t pgcount,
>>                           arm_lpae_iopte prot, int lvl, arm_lpae_iopte *ptep,
>> @@ -463,6 +583,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
>>         size_t tblsz = ARM_LPAE_GRANULE(data);
>>         struct io_pgtable_cfg *cfg = &data->iop.cfg;
>>         int ret = 0, num_entries, max_entries, map_idx_start;
>> +       u32 num_cont = 1;
>>
>>         /* Find our entry at the current level */
>>         map_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
>> @@ -505,6 +626,24 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
>>                 return -EEXIST;
>>         }
>>
>> +       if (arm_lpae_pte_is_contiguous_range(data, size, lvl + 1, &num_cont)) {
> 
> I would recommend performing this check at the actual level not at the
> previous lookup level i.e. not at the (lvl - 1) level. Imagine the
> following situation: The granule size is 4KB, the initial lookup level
> is 2, and size is 32MB. I'm wondering if in that case, it'll just keep
> recursing until it hits (WARN_ON(lvl >= ARM_LPAE_MAX_LEVELS - 1)).
> 

Right, I see your point. The contiguous-size check should be done against the
current level, I’ll fix that in v2.

>> +#ifdef CONFIG_IOMMU_IO_PGTABLE_CONTIG_HINT
>> +static void arm_lpae_cont_clear(struct arm_lpae_io_pgtable *data,
>> +                               unsigned long iova, int lvl,
>> +                               arm_lpae_iopte *ptep, size_t num_entries)
>> +{
>> +       struct io_pgtable_cfg *cfg = &data->iop.cfg;
>> +       u32 num_cont = arm_lpae_find_num_cont(data, lvl);
>> +       arm_lpae_iopte *cont_ptep;
>> +       arm_lpae_iopte *cont_ptep_start;
>> +       unsigned long cont_iova;
>> +       int offset, itr;
>> +
>> +       cont_ptep = ptep - ARM_LPAE_LVL_IDX(iova, lvl, data);
>> +       cont_iova = round_down(iova,
>> +                              ARM_LPAE_BLOCK_SIZE(lvl, data) * num_cont);
> 
> As a result of this round_down() function, you are accessing a
> descriptor that describes an IOVA outside the range targeted by the
> iommu_unmap call. Consequently, you might race against another thread
> accessing the same descriptor.
> 

Agreed. I’m going to drop partial-unmap handling for contiguous groups,
so we will only operate on an exact aligned contiguous range and
reject partial unmaps with WARN_ON(). That also removes the need for
the current round_down()-based logic.

>> +       cont_ptep += ARM_LPAE_LVL_IDX(cont_iova, lvl, data);
>> +       cont_ptep_start = cont_ptep;
>> +
>> +       /*
>> +        * iova may not be aligned to the contiguous group boundary; include
>> +        * any leading entries so round_up() covers all overlapping groups.
>> +        */
>> +       offset = ARM_LPAE_LVL_IDX(iova, lvl, data) -
>> +                ARM_LPAE_LVL_IDX(cont_iova, lvl, data);
>> +       num_entries = round_up(offset + num_entries, num_cont);
>> +
>> +       for (itr = 0; itr < num_entries; itr++) {
>> +               WRITE_ONCE(*cont_ptep, READ_ONCE(*cont_ptep) & ~ARM_LPAE_PTE_CONT);
> 
> This read-modify-write operation is not safe due to the potential race
> described above.
> 

With partial unmap support removed, I suppose this should be fine now.

>> +               cont_ptep++;
>> +       }
>> +
>> +       if (!cfg->coherent_walk)
>> +               __arm_lpae_sync_pte(cont_ptep_start, num_entries, cfg);
>> +}
>> +#else
>> +static void arm_lpae_cont_clear(struct arm_lpae_io_pgtable *data,
>> +                               unsigned long iova, int lvl,
>> +                               arm_lpae_iopte *ptep, size_t num_entries)
>> +{
>> +}
>> +#endif
>> +
>>  static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>>                                struct iommu_iotlb_gather *gather,
>>                                unsigned long iova, size_t size, size_t pgcount,
>> @@ -660,7 +841,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>>  {
>>         arm_lpae_iopte pte;
>>         struct io_pgtable *iop = &data->iop;
>> -       int i = 0, num_entries, max_entries, unmap_idx_start;
>> +       int i = 0, num_cont = 1, num_entries, max_entries, unmap_idx_start;
>>
>>         /* Something went horribly wrong and we ran out of page table */
>>         if (WARN_ON(lvl == ARM_LPAE_MAX_LEVELS))
>> @@ -675,9 +856,15 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>>         }
>>
>>         /* If the size matches this level, we're in the right place */
>> -       if (size == ARM_LPAE_BLOCK_SIZE(lvl, data)) {
>> +       if (size == ARM_LPAE_BLOCK_SIZE(lvl, data) ||
>> +           (size == arm_lpae_find_num_cont(data, lvl) *
>> +                    ARM_LPAE_BLOCK_SIZE(lvl, data))) {
>> +               size_t pte_size;
>> +
>>                 max_entries = arm_lpae_max_entries(unmap_idx_start, data);
>> -               num_entries = min_t(int, pgcount, max_entries);
>> +               num_cont = arm_lpae_check_num_cont(data, size, lvl);
>> +               num_entries = min_t(int, num_cont * pgcount, max_entries);
>> +               pte_size = size / num_cont;
>>
>>                 /* Find and handle non-leaf entries */
>>                 for (i = 0; i < num_entries; i++) {
>> @@ -687,11 +874,27 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>>                                 break;
>>                         }
>>
>> +                       /*
>> +                        * Break-Before-Make: before invalidating any leaf
>> +                        * entry, clear the CONT bit from every entry in the
>> +                        * contiguous group(s) and flush the TLB, as required
>> +                        * by the architecture.  arm_lpae_cont_clear() covers
>> +                        * the full [iova, iova + num_entries * pte_size) range
>> +                        * via round_up(), so subsequent entries read back
>> +                        * CONT=0 and skip this block.
>> +                        */
>> +                       if (pte & ARM_LPAE_PTE_CONT) {
>> +                               arm_lpae_cont_clear(data, iova, lvl, ptep, num_entries);
>> +                               io_pgtable_tlb_flush_walk(iop, iova,
>> +                                                         num_entries * pte_size,
>> +                                                         ARM_LPAE_GRANULE(data));
> 
> I believe this is inefficient. Consider the case where we unmap 2MB
> worth of IOVA space mapped by 512 4KB page descriptors with the
> contiguous bit set. If I'm not mistaken, you're running CMOs
> (__arm_lpae_sync_pte) twice for every page descriptor. In addition,
> io_pgtable_tlb_flush_walk() will submit an extra CMD_SYNC and wait for
> it's completion.
> 
> Additionally, you perform rounding in arm_lpae_cont_clear(). However,
> io_pgtable_tlb_flush_walk() is called on the original, potentially
> unaligned range. Can this lead to under invalidation? Again, my
> preference would be to drop support for partial unmaps which would
> also remove the requirement for calling io_pgtable_tlb_flush_walk()
> here.
> 

Agreed. The current unmap path is more complex and expensive than necessary.
Since partial unmap of contiguous groups should not be supported, I will remove
the rounding-based handling and only permit unmaps that exactly match an
aligned contiguous group. That also eliminates the need for the 
extra io_pgtable_tlb_flush_walk() here.

Thanks,
Vijay

>> +                       }
>> +
>>                         if (!iopte_leaf(pte, lvl, iop->fmt)) {
>>                                 __arm_lpae_clear_pte(&ptep[i], &iop->cfg, 1);
>>
>>                                 /* Also flush any partial walks */
>> -                               io_pgtable_tlb_flush_walk(iop, iova + i * size, size,
>> +                               io_pgtable_tlb_flush_walk(iop, iova + i * pte_size, pte_size,
>>                                                           ARM_LPAE_GRANULE(data));
>>                                 __arm_lpae_free_pgtable(data, lvl + 1, iopte_deref(pte, data));
>>                         }


