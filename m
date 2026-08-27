Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988F0C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 08:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WOkKUTTNS6mJs2BwdqhMg+NA2BpiKjHIQAe3GoU9ZE=; b=F7WX3JAMMROV6EzOzGdkATOav9
	Exb1sf6/7EXKyoCfNSkkqWD7sjt74t4Cb6GyYhMuzuj5l2Sw94F2aH1p82O9129F5leTYKoIRO1eo
	mhVOIeGnzK3xcQWeoz/mkVwqnH5AvmRuLsOhMMNAY051CbCHZYyZ9/WNTU8aTMuQr/1dT3D87bxXC
	TwxRa9UH/wUE9Q8n6B/6UyL1J/lOdTOKHbBW8dCD5BLX1FPKfjwyw/Kw0wWtwJF3camBasyTImdJl
	15yLmLs+vhsDl2LXgMUB30WvHteu/aATwLPW1WwEwO7ar1GhLttyLRTJPXaA0YMVFnpdf/llq5fVQ
	H0fy2+KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVPl-00000003dJ4-07os;
	Thu, 27 Aug 2026 08:24:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVPi-00000003dIc-48fg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 08:24:48 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R6RBTr3835103
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 08:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0WOkKUTTNS6mJs2BwdqhMg+NA2BpiKjHIQAe3GoU9ZE=; b=cHTYdhinTE2J6jHu
	CRsL3AEWHTNk59lfjUAvsY2eSKPkO65LCpqfIwm/F11fPHe/TxipKRpCch1qPUkZ
	g0Zdv5f7ZZXJglBzZ++Pp45Lmlp9ohyoW6BLLGdr+ZP+Eb2pjefHo3Nyqtq7TFBn
	tGBokPgf5kGmoiQD6ZWQttK8rcjHUoqkv7dbovdNbY3RHs9MfrB9/KowXcrbm+3g
	RoPU5AWjwPUqM57H5P/JtaOoIrJdhJG7Qsdqkkkb23DvYJsyWys2s3IEe4/ALx17
	qERojUpilfpRoAI/RLXWthRvqKZ7pp0nSDOrVbBrd+YGq69eQYKQZctTWJXklQ4n
	4ra5MA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga0wburkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 08:24:46 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso440479a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 01:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787819086; x=1788423886; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0WOkKUTTNS6mJs2BwdqhMg+NA2BpiKjHIQAe3GoU9ZE=;
        b=Qjk0Aod55EMaSmvPr/rBdOm2XGmD7D1tLqRrU4VuEKkBcCfIoDMM9k6Xl2j8YRH3xH
         70F7voaR3tUm6F12GqbymLAanMzwFAy1kDMcJ/xCN28I2ggCt8fGAjDXBybdkdWs3il/
         zyGUAsRPKKSlkXGnCdebPFCiTQb7tZvb5Pr4m3vVofkjZmT/RqZmEzj8FzHAv1k43yxO
         W8LlcgVhFpKS57Wd0bXxZVbFKLX6hBUcNoUT3oCAoc42BJrgzDK3MgAubNnOOMcP4X7x
         mzdSQjX+qVOLtX1Szz1pegES81RZ58j3uXq8fOnb5/TFA5DfcEXKZPLbu6AdfZVgpAPp
         jvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787819086; x=1788423886;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0WOkKUTTNS6mJs2BwdqhMg+NA2BpiKjHIQAe3GoU9ZE=;
        b=Dowo8DfWmCgSHVkHXftpigfyKGlLVp+caG/u30Q6qb3XatusbxuiXLasCZ29CORc5g
         LO3e8EXPli+N87ctK/3Uvm+ah6ZFF0zgp/XElqgPxuIwDyIZQ/TsxoAaJVXHVZAL7iNO
         EEN5ZE2yy/m6DtwrZd2y7SMhr4IszGHtcBeg1ZYMsHw+RJRR3SqH4fx/dAiSvJelaThq
         Jo3TbHfK+iSYBDx1MMCpGrNLTezdfUD8cuD2jWQ96lgZlzMeqddgbFBFQWLCjMjbV9EX
         gNl3Xdka/TgFAxMlMmnsgAs89lncKZRmWtfRtoJLfJSVaubZu2iPeE02lQJLlbpPmR9u
         PNog==
X-Forwarded-Encrypted: i=1; AHgh+RrrLl5ej8botGT4xzCMUMdqEGeBDGnsmZK0V3XG2J7vp3Kr5/UvJ5X5nxdtma+gyXmESA3AmiItyIuCucufQNf0@lists.infradead.org
X-Gm-Message-State: AFuF++lD0oHwS9/6P9PbnrG62WqhoH3tkSj3wp4q8/Hx+nySauZ4jjzn
	zPdokXSr6wBdBAJaw5cxEB+cf3sEEw7Q+9FnKppXqqXDlGKx4SUKwsXFex5AWBxwDhq4+eR6rjS
	XckY+PnmMv1wLIlcQXCyKVXQN2iVWmO6/8gbKBESyEFP54iCP+mIY0gZJTXujYakcHoTLg19vcp
	y+bA==
X-Gm-Gg: AR+sD10p3a8g6guquzxOqeC2MQnnxoue1ZUWFbs04w+wpoxHXThUD0h5lrV7BsmPuc0
	LiZjk/Y1cyja0j58EwJRhGbk9I0JdOOBT3k8RmioE72ajGnJCdA4TS13ysTeBNkDVsNX5JSEaJS
	XIdEmUYLFj/QLZ/q6NKz74HZuxtt9qSDLVO1QYV3wsyGTDgGW5m9VF/WfOdQCi1jIEXkVbHTaer
	mR7fOU6e4t8XTCRlQBN2KskBXg9Nj9rkBBG00Stfvni+mUfEIvWp9F4n5Xl2nYjo+TO5/8y8Tzm
	xbGjB2e8MPtdu0ciKYUeYtn0a1lMBp21U1YcoYOeJgCyHT8DEcSaOqqL3ZpDh1/SZ21U+XIphk4
	B2yOFIx3ldcDQw3si215a3CQHPVJaxoHiAg==
X-Received: by 2002:a05:6a21:9d84:b0:3c3:f371:1ea9 with SMTP id adf61e73a8af0-3cf844449abmr28579014637.10.1787819085648;
        Thu, 27 Aug 2026 01:24:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:9d84:b0:3c3:f371:1ea9 with SMTP id adf61e73a8af0-3cf844449abmr28578942637.10.1787819085169;
        Thu, 27 Aug 2026 01:24:45 -0700 (PDT)
Received: from [10.218.39.50] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1bec989f2sm1835547a12.28.2026.08.27.01.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:24:44 -0700 (PDT)
Message-ID: <8188c158-60ed-4d05-a26e-c127850520cb@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 13:54:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
To: Daniel Mentz <danielmentz@google.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>
References: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
 <CAE2F3rB7zpPFfC376mP=god9HWRmKOaQUEgPVzKScxS12pZrvQ@mail.gmail.com>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <CAE2F3rB7zpPFfC376mP=god9HWRmKOaQUEgPVzKScxS12pZrvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KXnmkZ1cVI3YVk6dLTD7fBqrGhQ0wk-F
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA2OCBTYWx0ZWRfX+QA3XUVQSt9K
 buTFUVxoup1/4qRvOQHE5z4waEwzAF3JBPo16xv25cc7la1iTsjQE66aK9FjNJkf1eyatmWP5oN
 OBKjGowTjd4iJAnt10E/lM8ACfeQbfc=
X-Proofpoint-GUID: KXnmkZ1cVI3YVk6dLTD7fBqrGhQ0wk-F
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a8ff44e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hD7wzR-C_dcGOD24FjMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA2OCBTYWx0ZWRfX97gKsW4Z4axu
 rk5BCLmgGIQFP0xIP6dGPk7DrafsVc8R3WXqHEejC8pJyUpy3wiHSylJCACM13ZUSaHE2I/GmaK
 dqjVvhJu1tjpdJJ7DXlZNG90yZl2bCHYdixEiGW7Vo38lQ0zTMc1ND5gLvSjkee6KohSLUFRM3J
 TierBYaDys0ZbsD5l6xbLurrMOn3rkkJ+TbcTuq+gjoKC/ccC2p0OVGeKR8h80/Tl46SB+ZOFJl
 y6XXcamwSUAtNcxjEjbbK/asfuHA0QVU1oMtt84GZOg0+tflNtTzc7SM5FEOfyPJREsQ5ZpIVQ5
 t7y7WlP5LeNtSU6xSjls2zha1bR3yTEltw9WAyCej9gQ4cV7tsmSG/Tevd8E24o0yuN80dI+HB+
 zIYizb5EleX4VC3CPLQo9Z8XHOe3UF/0y8hRNDUhFv1Y7U90fWfHQ5I8KY85PKvpdcSI9b81aHB
 n8aWMP8Scl2Xn3LNiIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_012447_033231_C1EC3586 
X-CRM114-Status: GOOD (  33.31  )
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



On 8/15/2026 3:27 AM, Daniel Mentz wrote:
> On Mon, Aug 3, 2026 at 11:19 PM Vijayanand Jitta
> <vijayanand.jitta@oss.qualcomm.com> wrote:
>> +static unsigned long arm_lpae_get_cont_sizes(struct io_pgtable_cfg *cfg)
>> +{
>> +       unsigned long pg_size, blk_size, l1_blk_size, cont_sizes = 0;
>> +       unsigned long cont_leaf_size, cont_blk_size, cont_l1_blk_size;
>> +       int pg_shift, bits_per_level;
>> +
>> +       if (!cfg->pgsize_bitmap || (cfg->quirks & IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT))
>> +               return 0;
>> +
>> +       pg_shift = __ffs(cfg->pgsize_bitmap);
>> +       bits_per_level = pg_shift - ilog2(sizeof(arm_lpae_iopte));
>> +       pg_size = 1UL << pg_shift;
>> +       blk_size = pg_size << bits_per_level;
>> +       l1_blk_size = blk_size << bits_per_level;
>> +
>> +       cont_leaf_size = arm_lpae_num_cont(pg_size) * pg_size;
>> +       if ((cfg->pgsize_bitmap & pg_size) &&
>> +           arm_lpae_cont_size_fits(cfg, cont_leaf_size))
>> +               cont_sizes |= cont_leaf_size;
>> +
>> +       if (cfg->pgsize_bitmap & blk_size) {
>> +               cont_blk_size = arm_lpae_num_cont(blk_size) * blk_size;
>> +               if (arm_lpae_cont_size_fits(cfg, cont_blk_size))
>> +                       cont_sizes |= cont_blk_size;
>> +       }
>> +
>> +       /*
>> +        * l1_blk_size is only set in pgsize_bitmap if level-1 blocks are
>> +        * supported for this granule (not 16K/64K, per
>> +        * arm_lpae_restrict_pgsizes()), so no extra gating is needed here.
>> +        */
>> +       if (cfg->pgsize_bitmap & l1_blk_size) {
>> +               cont_l1_blk_size = arm_lpae_num_cont(l1_blk_size) * l1_blk_size;
> 
> Our AI model is saying that this might overflow cont_l1_blk_size on 32
> bit platforms i.e. 16 * 1G doesn't fit into a 32 bit type. It says
> that cont_l1_blk_size will be truncated to 0, and
> arm_lpae_cont_size_fits() then calls ilog2(0) which is undefined.
> 

Ack. With arm_lpae_cont_size_fits removed this won't be an issue anymore.

>> +               if (arm_lpae_cont_size_fits(cfg, cont_l1_blk_size))
>> +                       cont_sizes |= cont_l1_blk_size;
>> +       }
>> +
>> +       return cont_sizes;
>> +}
> [...]
>> @@ -660,6 +829,8 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>>  {
>>         arm_lpae_iopte pte;
>>         struct io_pgtable *iop = &data->iop;
>> +       size_t block_size = ARM_LPAE_BLOCK_SIZE(lvl, data);
>> +       int num_cont = arm_lpae_num_cont(block_size);
>>         int i = 0, num_entries, max_entries, unmap_idx_start;
>>
>>         /* Something went horribly wrong and we ran out of page table */
>> @@ -674,10 +845,22 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>>                 return 0;
>>         }
>>
>> +       /*
>> +        * Normalize an exact whole-CONT-group request down to the
>> +        * equivalent block_size/pgcount, mirroring __arm_lpae_map().
>> +        */
>> +       if (!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT) &&
>> +           num_cont > 1 && size == block_size * num_cont) {
>> +               pgcount *= num_cont;
>> +               size = block_size;
>> +       }
>> +
>>         /* If the size matches this level, we're in the right place */
>> -       if (size == ARM_LPAE_BLOCK_SIZE(lvl, data)) {
>> +       if (size == block_size) {
>> +               size_t cont_size = num_cont * block_size;
>> +
>>                 max_entries = arm_lpae_max_entries(unmap_idx_start, data);
>> -               num_entries = min_t(int, pgcount, max_entries);
>> +               num_entries = min_t(size_t, pgcount, max_entries);
>>
>>                 /* Find and handle non-leaf entries */
> 
> This comment is no longer accurate. The handling now extends beyond
> non-leaf entries.
> 

Agreed, that comment is stale -- the loop now also validates CONT-group
alignment on leaf entries (rejecting an unmap that would split a tagged
group) before falling through to the non-leaf teardown. Will update it to
something like:

/* Validate leaf entries and handle non-leaf entries */


>>                 for (i = 0; i < num_entries; i++) {
>> @@ -687,6 +870,40 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>>                                 break;
>>                         }
>>
>> +                       /*
>> +                        * A real CONT group must always be invalidated as a
>> +                        * unit, so reject an unmap that splits one. Check the
>> +                        * PTE's own CONT bit rather than the caller's size,
>> +                        * since a legitimate unmap can span multiple prior
>> +                        * iommu_map() calls and its size alone doesn't say how
>> +                        * the underlying PTEs were grouped. Only the first and
>> +                        * last entries can straddle a group boundary; an
>> +                        * interior CONT-tagged entry's group is necessarily
>> +                        * fully covered by this unmap, since groups can't
>> +                        * overlap without also covering everything between
>> +                        * them.
>> +                        */
>> +                       if (pte & ARM_LPAE_PTE_CONT) {
>> +                               bool ok = true;
>> +
>> +                               if (i == 0)
>> +                                       ok = ok && IS_ALIGNED(iova, cont_size);
>> +                               if (i == num_entries - 1)
>> +                                       ok = ok && IS_ALIGNED(iova + (i + 1) * block_size,
>> +                                                             cont_size);
>> +
>> +                               /*
>> +                                * Stop short of this entry instead of returning
>> +                                * 0: entries before i may already have had
>> +                                * non-leaf sub-tables torn down above, so the
>> +                                * caller needs the real unmapped count, and the
>> +                                * loop exit below still clears/gathers entries
>> +                                * [0, i) correctly.
>> +                                */
>> +                               if (WARN_ON_ONCE(!ok))
> 
> Consider aligning with the following WARN_ONCE in the same function:
> 
> WARN_ONCE(true, "Unmap of a partial large IOPTE is not allowed");
> 

Ack.

>> +                                       break;
> 
> I think this behavior is inconsistent: when a problem is detected at
> the beginning of the unmap range, you return without modifying the
> table, whereas if it's detected at the end, the code proceeds with
> unmapping and leaves the table misconfigured. Could these checks be
> performed before entering the loop?
> 

Agreed, Will move both checks before the loop so a rejected unmap is always a
full no-op, regardless of whether the violation is at the start or end of
the range.

Thanks,
Vijay

>> +                       }
>> +
>>                         if (!iopte_leaf(pte, lvl, iop->fmt)) {
>>                                 __arm_lpae_clear_pte(&ptep[i], &iop->cfg, 1);
>>


