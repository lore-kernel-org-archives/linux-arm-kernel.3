Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCF3C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 08:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71q6qFkbUbAl2V56zYmUPUePGcmMBG2bx1YcmcaTAes=; b=Ba/9qIizFFkO9nduE8zvlkeiqo
	qcWB31ssF1BEU+YokTnBEgtprus92F+n6f3SF7IqLXX0DyXN27PlecOlDEz122hWy/CIYBjyC9GSs
	5TfUlV0fFMP5TQoAvr5ufwTahIg2H4nPZYVOFszuiA0QMaLLZfmhD3oxoWW6r+yrx6kHrwowZDdbH
	/wiEjiHUcpMrO7gbPmIQ1G+Kkvti3B/PyFifcH5UQFrZecqRs5s/kcAsJr1x0yUCkd12yA3zeIk7o
	MYzFK3Nh87/Gyp0wR0bxuftmwAX0E0AYHrLJfHt2PSp81neY9iyiEu0r85RHYNbJv55RQgwQ5Y6/p
	ux0z7PMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVcw-00000003edt-0f2h;
	Thu, 27 Aug 2026 08:38:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVct-00000003edW-452Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 08:38:25 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R6RCrH3835280
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 08:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71q6qFkbUbAl2V56zYmUPUePGcmMBG2bx1YcmcaTAes=; b=gf1YeRfG0jMWjJvk
	A+oDzPUuH5WBz2seDRuTBu2O2cIwjWUZ0Rf2OTAZmWp/nwEucRDj2ASlkf9YJndd
	m61fwXt9K9twk2rCd5EG9R1gVAeNx8LP3S3A3PZxw1QiRAFVJLIXN5+hXX5iLE09
	yGJpRw9WPfnriuJ3zZUIDU7OJpi4Y8puOs2gKQmv2zMfIYdDg0//Hg3Puc0jojdj
	ONUk0WlMUW+waxBNtCLoSNv+UbSt7VuqiMydUJ0oQxgJQzFyGLGjvklRu+bf90g9
	+hQ4Oqqz45SmVapOj+ZZVDgAfcTbmDKTQz9RJbojp6uSD8IPRTsAjgcVuYQJ+rXl
	py/hUQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga0wbute0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 08:38:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso3178895a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 01:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787819902; x=1788424702; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=71q6qFkbUbAl2V56zYmUPUePGcmMBG2bx1YcmcaTAes=;
        b=bDLvuZFLKYaESaCbpjSsQxuu//U++Ie690QcvpDKoRJVMvyXUIbA1aG6V60BGcyjIy
         ZNGOOYdZYqSaEKsQr/TSxUmSCRBU75zLG6zfK1UeJYICzRkMUHVO10g8Oa+m5Ys7nD0I
         Yq59mYTie2OXj+m3TgZe+LhBU6voP2EUgG4upE6JPGCFpeMcRxriFn9uqg88P/vRglu4
         vq9DNyZjbmcdjAlQSMtU/4eN7Fz14sSbHRuCV0wNnAOhWDQvo8wqHPzirQ8MYu2fO7sK
         PU021fv0ONO6nzkmQRMJQqi4Qa69eirauN1haYZZCtjj8qfQ52vtpREup9yH+GpDKzK1
         ozfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787819902; x=1788424702;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71q6qFkbUbAl2V56zYmUPUePGcmMBG2bx1YcmcaTAes=;
        b=K09wIxpnWXo/4NMP7iyQFF7BrnAcH72GOcZCkkaBbhNz8rBxhK/3W6Yj1HbTDxbcR+
         MqH9hh/0vPH7xuaH6gx2fs4DJC60Ark3oryuTFz3gI0jxFlEy6Pe4hpCd0yXA/YH/QjR
         MOpK2arBqZIY7MEEJrXPqlDbrkV0hTwjMk553J19XtaWNodvI/yboXWGBwp8McQtZpGn
         CMxRX4AbqUEaWpkGjyn1XS5eBEW3hDHqCdq36Up/sFlFsAXGAPOQI7g55ljZB+1/b3Am
         pPzYiAVJOkIE3m3/zF6AVMK+pCI9eTsFXGzhsWkn0AFxE5xL4I1msAF6C0rzr4lyhBel
         Uwww==
X-Forwarded-Encrypted: i=1; AHgh+Rog5OunSV8FApt+zDc28Vk+m7f95UlbesXp7uKj/A3kVWdaip/OGHkU5EwMJYafnldpFWV45Z7cKGefx1PQ+jC5@lists.infradead.org
X-Gm-Message-State: AFuF++maQnXBlvr9PBcrU8sgvk9HX0uUjZV9vdLOT61ntjYiR/YhREq+
	Y8UPVPuZg6fAKG8SXWnWIHgQyuzDqnCi5/R8vH2+ziggbljdK1GLpKYJNUJI+z3woqJOmN2Lhni
	I/L+mu41Gza1zmncOh/XtP/8pSLfe+t6McAs7wpmFRbrgZp8NnhFL9DMdBUo8so1Ct/yJO8vE3H
	Nn/Q==
X-Gm-Gg: AR+sD10UrB+9QwvglyCRW2CGTJPqMYeYugYEMFpNtoPuOyQtWo51WXeMUlUQUshOYnY
	TRywXMPmjyc80J2NG5gUZosNUeXA+rUBSWNYEacXBZZv5aaF/pkhU1T1HSiTKtRC67xUWeDjvPI
	KQCRFsb0m+IhMk41QleGYyAews42hkrTw5JjpZA4DHtQvq2deQRH0qv/Toa+aMUtq49ve/GWqF3
	RKkA+ybpVn6Mjjui7v4W0kKgLQcHVX/19m+LOmYoBQHEsTSnX1sUlkpeyzE8Sh04IgheilRrdD1
	WOCiTHM6cVSQY4YoNLCT/8kHDqgWxp5yuPiolsv8uD6hKPpXbHZcwPc7tMbjxEivu1xKABiCIgT
	62q1ZzRrJAGa0C4hg7yyA03TeqjtkvNdjkw==
X-Received: by 2002:a17:90b:3890:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-3966d17865fmr25898125a91.2.1787819902421;
        Thu, 27 Aug 2026 01:38:22 -0700 (PDT)
X-Received: by 2002:a17:90b:3890:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-3966d17865fmr25898042a91.2.1787819901946;
        Thu, 27 Aug 2026 01:38:21 -0700 (PDT)
Received: from [10.218.39.50] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0d3d7fbsm1863422a91.3.2026.08.27.01.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:38:21 -0700 (PDT)
Message-ID: <071db604-0744-4a45-87ac-085a40cb5999@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 14:08:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
To: Daniel Mentz <danielmentz@google.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>
References: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
 <CAE2F3rB7zpPFfC376mP=god9HWRmKOaQUEgPVzKScxS12pZrvQ@mail.gmail.com>
 <8188c158-60ed-4d05-a26e-c127850520cb@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8188c158-60ed-4d05-a26e-c127850520cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Z_TlY00FHGFqOnjSw1zu-RMPSGJ_j5DS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA3MCBTYWx0ZWRfX9sB1nkDjAiBk
 vWc4C2u+1N/eFrY7zwWuhmi53e1Z5zFqxj9VrIClgmN8D6CN4uo3p7ELF1K6+9YSnurkKN3xLvd
 byYmdVRUFv9GnQK0yy0+WimgcAlPp90=
X-Proofpoint-GUID: Z_TlY00FHGFqOnjSw1zu-RMPSGJ_j5DS
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a8ff77f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3AgxOFbAtmQaTp21eccA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA3MCBTYWx0ZWRfX1oEB7CfGjPNy
 PrSOl1yHLWiNCMPMizGVvye+BXsMgoc8frSuUwLCdcFoWUeq0MrYhJI2jgC/TH6629Ebsk0WrZa
 4tje/Fr/1vpsTL1L8wAzbo3YPz40OVipNZ3ew3Hs5aXxuWRd12DdUphqd/ApakfRJHI6dxCxC+m
 duUH+OSXDuCaWe+SzP9ptrU7Zf1HGkU4uir85hNES6gUKxcvjzgsQQuBl/USFukPYY0X+QAUQ9H
 9qj5ElcJBjKhl2paePzWsbZ3NJTtfcINTT1/n5PrUW8nIOSAWvi94e1WFNdiIQS0pjuFulEcnsn
 56SLYAU5MEWGHEdBOACYyjB91u2f+7owWEWU4l3bmg3hi/dCtV1MUOQaUNyOwimw39veCWCriN6
 gbCzqE+SCp3j8lYgBFx4gfX67PazZVoRdY6jiKhOMCRzm5V271NiL7yk3s/u18ezHzDZ6Lp7c2s
 NibQaCuJjJwiVC2DGnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_013824_047550_A2C474AD 
X-CRM114-Status: GOOD (  32.54  )
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



On 8/27/2026 1:54 PM, Vijayanand Jitta wrote:
> 
> 
> On 8/15/2026 3:27 AM, Daniel Mentz wrote:
>> On Mon, Aug 3, 2026 at 11:19 PM Vijayanand Jitta
>> <vijayanand.jitta@oss.qualcomm.com> wrote:
>>> +static unsigned long arm_lpae_get_cont_sizes(struct io_pgtable_cfg *cfg)
>>> +{
>>> +       unsigned long pg_size, blk_size, l1_blk_size, cont_sizes = 0;
>>> +       unsigned long cont_leaf_size, cont_blk_size, cont_l1_blk_size;
>>> +       int pg_shift, bits_per_level;
>>> +
>>> +       if (!cfg->pgsize_bitmap || (cfg->quirks & IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT))
>>> +               return 0;
>>> +
>>> +       pg_shift = __ffs(cfg->pgsize_bitmap);
>>> +       bits_per_level = pg_shift - ilog2(sizeof(arm_lpae_iopte));
>>> +       pg_size = 1UL << pg_shift;
>>> +       blk_size = pg_size << bits_per_level;
>>> +       l1_blk_size = blk_size << bits_per_level;
>>> +
>>> +       cont_leaf_size = arm_lpae_num_cont(pg_size) * pg_size;
>>> +       if ((cfg->pgsize_bitmap & pg_size) &&
>>> +           arm_lpae_cont_size_fits(cfg, cont_leaf_size))
>>> +               cont_sizes |= cont_leaf_size;
>>> +
>>> +       if (cfg->pgsize_bitmap & blk_size) {
>>> +               cont_blk_size = arm_lpae_num_cont(blk_size) * blk_size;
>>> +               if (arm_lpae_cont_size_fits(cfg, cont_blk_size))
>>> +                       cont_sizes |= cont_blk_size;
>>> +       }
>>> +
>>> +       /*
>>> +        * l1_blk_size is only set in pgsize_bitmap if level-1 blocks are
>>> +        * supported for this granule (not 16K/64K, per
>>> +        * arm_lpae_restrict_pgsizes()), so no extra gating is needed here.
>>> +        */
>>> +       if (cfg->pgsize_bitmap & l1_blk_size) {
>>> +               cont_l1_blk_size = arm_lpae_num_cont(l1_blk_size) * l1_blk_size;
>>
>> Our AI model is saying that this might overflow cont_l1_blk_size on 32
>> bit platforms i.e. 16 * 1G doesn't fit into a 32 bit type. It says
>> that cont_l1_blk_size will be truncated to 0, and
>> arm_lpae_cont_size_fits() then calls ilog2(0) which is undefined.
>>
> 
> Ack. With arm_lpae_cont_size_fits removed this won't be an issue anymore.
> 
>>> +               if (arm_lpae_cont_size_fits(cfg, cont_l1_blk_size))
>>> +                       cont_sizes |= cont_l1_blk_size;
>>> +       }
>>> +
>>> +       return cont_sizes;
>>> +}
>> [...]
>>> @@ -660,6 +829,8 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>>>  {
>>>         arm_lpae_iopte pte;
>>>         struct io_pgtable *iop = &data->iop;
>>> +       size_t block_size = ARM_LPAE_BLOCK_SIZE(lvl, data);
>>> +       int num_cont = arm_lpae_num_cont(block_size);
>>>         int i = 0, num_entries, max_entries, unmap_idx_start;
>>>
>>>         /* Something went horribly wrong and we ran out of page table */
>>> @@ -674,10 +845,22 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>>>                 return 0;
>>>         }
>>>
>>> +       /*
>>> +        * Normalize an exact whole-CONT-group request down to the
>>> +        * equivalent block_size/pgcount, mirroring __arm_lpae_map().
>>> +        */
>>> +       if (!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT) &&
>>> +           num_cont > 1 && size == block_size * num_cont) {
>>> +               pgcount *= num_cont;
>>> +               size = block_size;
>>> +       }
>>> +
>>>         /* If the size matches this level, we're in the right place */
>>> -       if (size == ARM_LPAE_BLOCK_SIZE(lvl, data)) {
>>> +       if (size == block_size) {
>>> +               size_t cont_size = num_cont * block_size;
>>> +
>>>                 max_entries = arm_lpae_max_entries(unmap_idx_start, data);
>>> -               num_entries = min_t(int, pgcount, max_entries);
>>> +               num_entries = min_t(size_t, pgcount, max_entries);
>>>
>>>                 /* Find and handle non-leaf entries */
>>
>> This comment is no longer accurate. The handling now extends beyond
>> non-leaf entries.
>>
> 
> Agreed, that comment is stale -- the loop now also validates CONT-group
> alignment on leaf entries (rejecting an unmap that would split a tagged
> group) before falling through to the non-leaf teardown. Will update it to
> something like:
> 
> /* Validate leaf entries and handle non-leaf entries */
> 
> 

You can ignore the above comment, after moving the checks to outside the loop
the earlier comment would stay accurate for the loop.

Thanks,
Vijay
>>>                 for (i = 0; i < num_entries; i++) {
>>> @@ -687,6 +870,40 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>>>                                 break;
>>>                         }
>>>
>>> +                       /*
>>> +                        * A real CONT group must always be invalidated as a
>>> +                        * unit, so reject an unmap that splits one. Check the
>>> +                        * PTE's own CONT bit rather than the caller's size,
>>> +                        * since a legitimate unmap can span multiple prior
>>> +                        * iommu_map() calls and its size alone doesn't say how
>>> +                        * the underlying PTEs were grouped. Only the first and
>>> +                        * last entries can straddle a group boundary; an
>>> +                        * interior CONT-tagged entry's group is necessarily
>>> +                        * fully covered by this unmap, since groups can't
>>> +                        * overlap without also covering everything between
>>> +                        * them.
>>> +                        */
>>> +                       if (pte & ARM_LPAE_PTE_CONT) {
>>> +                               bool ok = true;
>>> +
>>> +                               if (i == 0)
>>> +                                       ok = ok && IS_ALIGNED(iova, cont_size);
>>> +                               if (i == num_entries - 1)
>>> +                                       ok = ok && IS_ALIGNED(iova + (i + 1) * block_size,
>>> +                                                             cont_size);
>>> +
>>> +                               /*
>>> +                                * Stop short of this entry instead of returning
>>> +                                * 0: entries before i may already have had
>>> +                                * non-leaf sub-tables torn down above, so the
>>> +                                * caller needs the real unmapped count, and the
>>> +                                * loop exit below still clears/gathers entries
>>> +                                * [0, i) correctly.
>>> +                                */
>>> +                               if (WARN_ON_ONCE(!ok))
>>
>> Consider aligning with the following WARN_ONCE in the same function:
>>
>> WARN_ONCE(true, "Unmap of a partial large IOPTE is not allowed");
>>
> 
> Ack.
> 
>>> +                                       break;
>>
>> I think this behavior is inconsistent: when a problem is detected at
>> the beginning of the unmap range, you return without modifying the
>> table, whereas if it's detected at the end, the code proceeds with
>> unmapping and leaves the table misconfigured. Could these checks be
>> performed before entering the loop?
>>
> 
> Agreed, Will move both checks before the loop so a rejected unmap is always a
> full no-op, regardless of whether the violation is at the start or end of
> the range.
> 
> Thanks,
> Vijay
> 
>>> +                       }
>>> +
>>>                         if (!iopte_leaf(pte, lvl, iop->fmt)) {
>>>                                 __arm_lpae_clear_pte(&ptep[i], &iop->cfg, 1);
>>>
> 


