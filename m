Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBFEC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 06:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=764Phtwd3fK6Miua79lODWauqsKM+9dHxURkjgBLlsE=; b=tgVS5Ua8uVtTpXTqpIUL1kZydO
	VP8cXIdZYbGKvhBEiIixlFoLpaxpJ7Iejpr5UN8YXV9stB+TU9/ltm3B6PpUSmQJOjdh0bwLriVMg
	jXcdm1cf5nmdCXLaIirM8IvIIda7QlZ0F73D6TqEBeUPYzXj/CTO72vSy0x+oW9TaCdLVL8F+nMKP
	rjmeF5FEOvhXf60zartjiVDG0V31VOXEyC/QRbaTYUvexam0nhA+8FJzU8aDprgUhS9bAkTPQF2SH
	FJIp67vbDjzQspwUNFHfxV+yU7ea8BwQgQnEN0HeOCQ5teCEeEFxhwvtQuBoL4rIjTdiAM1Denibw
	xJR1qJJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wulAC-000000020mx-3tWL;
	Fri, 14 Aug 2026 06:13:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wulAA-000000020m2-3NNY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 06:13:08 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4Qfx1669354
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 06:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	764Phtwd3fK6Miua79lODWauqsKM+9dHxURkjgBLlsE=; b=fflAcvjtyGxUVYtg
	q2sL2Dt9qL2bxZcbrsbyLhxoViSKgBxP13EHdeBEtAuU+AVb3JFIMjxFeTEBLM7q
	g8WiOb/xMEGeFlxWQFEamR7Sy5RWzskN/jZEDnYHtkySLbrTznMdSZWJDIgEhzaM
	QLlQMVslaiYNYsgu3d4+ECmcr93LOPZTbdMHosM5rOSbUQUlmizXZAVMgwfDLGDS
	lFoYcPj97aa/VG5uIb6qm5qoJ7lEk3GAhZhCrpS8QS16Ly0NwCf4Ve27UM/6uzzC
	v9T3gWZSpcICqkSVKXCLbXv8LDR+eaXZGJKziLzEZGs1bqTIqGMJM6ZKKt9yL8Gp
	ffJ4ZQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h1uu0r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 06:13:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so1432339a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 23:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786687984; x=1787292784; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=764Phtwd3fK6Miua79lODWauqsKM+9dHxURkjgBLlsE=;
        b=VOejedh6Q3MX5V1ZUWt6cDSVj2zfimQ7ZGS6ZDFV6mvMCuAar31UIhu4Eh0sRxGDW7
         iKX0AtclbBenA+zqeL83HydOLD05OYeesInVUYaw0vufGbUu13UFNDI4KMbAiObokn3j
         2Ud14CQmhswMnjNopeAjfETSwHRQRVqZgDtrNA2x5GmCci/0EW4pbHuwR0yBUKSclXzN
         XPQCstCD+7+dyDXgR2P1JDNGyyYHVam+K0ZTQEQPhDJEjRNF4gmn/behdiOg5bcajX8T
         7fQ1yTRqoN9aTrEmt/nFiKqv98zUrmCnfprZfA3lOvJyB2ks35qsY0L1hmwUMhBzi2HI
         Y8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786687984; x=1787292784;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=764Phtwd3fK6Miua79lODWauqsKM+9dHxURkjgBLlsE=;
        b=D41loCPorb0hC+2e8PnS7wleS2DxN2Z/awN7I5H98vEjGInCjSur7qpY/lHZ58G0jp
         4POqVPsp3t/lyYf7IYHZs6FtFCT87MKyiX3la83D0xkW9NaB5wZTTBpZqsQKaQB8/R6k
         7shOwTtBfbX5xsquSwqkAkxYK6Jl7tksmQea37x/yildB4pU84rKwadqCQtCUd3uDpUN
         L78Xb+TPmNW/UM1TpgVkHk1f0ddtLaNvx52WQ4lTVSnDQgGGbV0eFi08Tdc9wdCUf9/g
         3M+BJq4E77UclMrevm0lJUwnDaoIANNyBFqAHMlczUKY5gbq+7Pp5UUhXyeqcNw0LmaK
         lQ3Q==
X-Forwarded-Encrypted: i=1; AHgh+RqoHP0TuQfnsO27x+JtDCc/WwtvWOauSv78ATuifrGfHhRsAx/eTefS6a+zZ10bTYZdza8eWvDxf87awnWfj/2j@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3VmsMF8nW3McfMUWKQGS4H5oF+jGS3wLcFqgB6+8TiFCsolfO
	1f5pfIqo5Aafwq+lOLBW/zTVZewAeAn3pDJ5nbdr9ZKcmgHD1bddi9vduYVKNzJbe/jimBF3bIl
	gvAfR1lp/2M08JE7Tb5KLFAymzyoyF5dfzUVY40TAw41U1u6tHXgsW5kb4vu4nwxjkPJV4T/paW
	5Enw==
X-Gm-Gg: AR+sD12FOG41D7BSK8xigkcFT1vuMQ8riVCocDEHrVEJbnYRYGwa8N0/iCSd+2FjcKV
	hoBXktNBe2kqTjZMVG2WDUhID9+OtcFFs73cLpbey+l98Wv1pj1IM67M5kG3oxg/SU5Rcd3uNvs
	6hAy2dlBd/rhNLcwdlMGyy7qTCBAGLiY9iNd/RtpY63NC4bdPWJaubVhEqoWdEb/xayra713CWs
	Sua2xu/uEc85wz8v8UF1SeH9FV6+znaarJNXpAT9l8QbrUPCIqPht8Adg4Qd7I/UK07taZswdi1
	7MztrasXsaFT0qF0GMKn7b6bX8pv4CkfWGBDW9FeVcaLn4dZIqNTQAO5gNGkfImixVJZU99d0Dn
	b0RpYSEYVVtSW/AIw7wXwFEclkB3ohamKFQ==
X-Received: by 2002:a17:90a:e7cd:b0:380:fead:448d with SMTP id 98e67ed59e1d1-3933b87224cmr3434206a91.13.1786687984276;
        Thu, 13 Aug 2026 23:13:04 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cd:b0:380:fead:448d with SMTP id 98e67ed59e1d1-3933b87224cmr3434146a91.13.1786687983643;
        Thu, 13 Aug 2026 23:13:03 -0700 (PDT)
Received: from [10.218.39.50] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394e921709dsm1167120a91.0.2026.08.13.23.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 23:13:03 -0700 (PDT)
Message-ID: <c84e61b1-785e-4a47-9082-c5111bf35fd4@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 11:42:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
To: Daniel Mentz <danielmentz@google.com>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
 <CAE2F3rBQQEHsksOyE2ojQPbMd_vvFqaFMC2RzT0B6KkxMB5YgQ@mail.gmail.com>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <CAE2F3rBQQEHsksOyE2ojQPbMd_vvFqaFMC2RzT0B6KkxMB5YgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IjvB8ZkEsX5xorC9SdHFCFWVdXR4t17W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA0NyBTYWx0ZWRfX6MjtjEdzCMff
 kkuWL7jtn9+gxVqHB7RX7HuPPhy3yqKQgArOl7vRhKak8uhIdicYrxJYdXteftNnV/5xMM3sN0C
 g+ma+aZjxZZkSp7lzGRyvvgP23iKI7ZXmNyt0unk74DiRNYM0rAbIK5YEUzIyPzutlddBNvABAx
 jL0gFRfnnZlYD4BYFDMljBdJpfeJC7LYOFFuzhGgo+gcrWzqpV3y3zutAz/7RVm5//a4yayOpqK
 SwtupNvkOh7AFJy8Yhyb283tDAWXgzOTHoU2Y3CHJeXfbOsyUP/MWdDJXhEJyY8UNA3LhWFCa9H
 t4VEzIKlFTrEOioo4YJ10QAt1ZR+F/+GK32PINj6JSsbOQBFECVyISeepS0BJXxmlQ1nsZcQTVi
 EVQykwVlgf8m6DFnJieYWtz3OyBTXgt5i3nOEiscC+CxC7O6m2flsywF/vxnPe6PDth4oiPl5lo
 aDh5+EvvDq0Akg77P8A==
X-Proofpoint-ORIG-GUID: IjvB8ZkEsX5xorC9SdHFCFWVdXR4t17W
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=6a7eb1f1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0oEs0c1nrpSZiC37xdsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA0NyBTYWx0ZWRfX0AQ22r55XP78
 ukHPO3uitJ3NiaOWptml4ELc00n2vx5bLkkzPcPqrdSrZoV6RTeMetheB1lHCRQmfoRYRRY0JJ9
 bW4FbhsIzFJIvH4qzfq+Lau4B5bw18o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_231306_971986_403B8CC1 
X-CRM114-Status: GOOD (  42.71  )
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



On 8/11/2026 10:34 AM, Daniel Mentz wrote:
> On Mon, Aug 3, 2026 at 11:19 PM Vijayanand Jitta
> <vijayanand.jitta@oss.qualcomm.com> wrote:
>> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
>> index 476c0e25631af..23a238de53ed5 100644
>> --- a/drivers/iommu/io-pgtable-arm.c
>> +++ b/drivers/iommu/io-pgtable-arm.c
>> [...]
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
> 
> bits_per_level is also calculated in arm_lpae_alloc_pgtable(). I'm
> wondering if we can somehow re-use that value, although, I do
> understand that data->bits_per_level is only populated later.
> 

For the same reason that you mentioned, I don't see we can reuse,
at this point we only have cfg, no data.
>> +       pg_size = 1UL << pg_shift;
> 
> In arm_lpae_restrict_pgsizes(), they call the same value "granule".
> Can we align with that and call it granule instead of pg_size?
> 

Sure, will rename it to granule.

>> +       blk_size = pg_size << bits_per_level;
> 
> I'm wondering if we can re-use the macro ARM_LPAE_BLOCK_SIZE. I do
> acknowledge, though, that this macro doesn't work in this context,
> because (d)->bits_per_level is still not populated.
> Also, for consistency, you might want to call this l2_blk_size.
> 

I don't see a easy way to reuse it, for same reason that you mentioned.
Sure, will rename it to l2_blk_size.

>> +       l1_blk_size = blk_size << bits_per_level;
>> +
>> +       cont_leaf_size = arm_lpae_num_cont(pg_size) * pg_size;
>> +       if ((cfg->pgsize_bitmap & pg_size) &&
> 
> Is (cfg->pgsize_bitmap & pg_size) ever false?
> 
> [...]
> 

You are right, it's always true. The !cfg->pgsize_bitmap check above
rules out the zero case. Will drop the redundant check and keep just
the arm_lpae_cont_size_fits() check.

>> +/*
>> + * Install num_entries leaf entries starting at ptep (index map_idx_start
>> + * within the current table), tagging arm_lpae_num_cont()-sized groups with
>> + * the contiguous hint where both idx and paddr are aligned to the group
>> + * size. Entries in a misaligned group are installed without the hint.
>> + *
>> + * idx and paddr both advance by block_size per entry, so their alignment
>> + * relative to the group size is invariant across a run of entries within
>> + * this call: once a group qualifies (or fails to), every later whole group
>> + * does too, up to num_entries. This merges each such run into a single
>> + * arm_lpae_init_pte() call instead of one call per group.
>> + */
> 
> Can you provide an example for when this function installs descriptors
> where the contiguous bit is only set on a subset of them. I would
> assume that the contiguous bit is either set for all descriptors or
> none of them.
> 

That assumption doesn't hold in general -- it's only true when the
map request happens to start and end on a cont_size boundary. For an
arbitrary map_pages() call it usually doesn't.

Example, 4K granule (num_cont = 16, cont_size = 64K),
iova = paddr = 0x1000, pgcount = 34:

   - idx 1..15  (off != 0, misaligned prefix):        installed plain
   - idx 16..31 (off == 0, paddr now 64K-aligned):     installed w/ CONT
   - idx 32..34 (off == 0, remaining < num_cont):      installed plain

One arm_lpae_install_leaf() call, three chunks, CONT set on only the
middle one. 

>> +static int arm_lpae_install_leaf(struct arm_lpae_io_pgtable *data,
>> +                                unsigned long iova, phys_addr_t paddr,
>> +                                arm_lpae_iopte prot, int lvl,
>> +                                int map_idx_start, int num_entries, int num_cont,
>> +                                arm_lpae_iopte *ptep, size_t *mapped)
>> +{
>> +       size_t block_size = ARM_LPAE_BLOCK_SIZE(lvl, data);
>> +       size_t cont_size = num_cont * block_size;
>> +       int done = 0;
>> +
>> +       while (done < num_entries) {
>> +               int idx = map_idx_start + done;
>> +               int remaining = num_entries - done;
>> +               int off = idx % num_cont;
>> +               arm_lpae_iopte pte = prot;
>> +               int chunk, ret;
>> +
>> +               if (off) {
>> +                       /* Misaligned prefix: advance to the next boundary */
>> +                       chunk = min_t(int, num_cont - off, remaining);
>> +               } else if (remaining >= num_cont && IS_ALIGNED(paddr, cont_size)) {
>> +                       /* Aligned: merge every full group in this run */
>> +                       chunk = remaining - remaining % num_cont;
>> +                       pte |= ARM_LPAE_PTE_CONT;
>> +               } else {
>> +                       /*
>> +                        * Aligned idx but paddr doesn't line up with cont_size,
>> +                        * or too short for a full group. That holds for the
>> +                        * rest of this call too, so install the remainder
>> +                        * plain in one go.
>> +                        */
>> +                       chunk = remaining;
>> +               }
>> +
>> +               ret = arm_lpae_init_pte(data, iova, paddr, pte, lvl, chunk, ptep);
>> +               if (ret)
>> +                       return ret;
>> +
>> +               *mapped += chunk * block_size;
>> +               ptep += chunk;
>> +               iova += chunk * block_size;
>> +               paddr += chunk * block_size;
>> +               done += chunk;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>>  static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
>>                           phys_addr_t paddr, size_t size, size_t pgcount,
>>                           arm_lpae_iopte prot, int lvl, arm_lpae_iopte *ptep,
>> @@ -462,21 +608,44 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
>>         size_t block_size = ARM_LPAE_BLOCK_SIZE(lvl, data);
>>         size_t tblsz = ARM_LPAE_GRANULE(data);
>>         struct io_pgtable_cfg *cfg = &data->iop.cfg;
>> -       int ret = 0, num_entries, max_entries, map_idx_start;
>> +       bool cont_hint_enabled = !(cfg->quirks & IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT);
>> +       int num_entries, max_entries, map_idx_start;
>> +       int num_cont = cont_hint_enabled ? arm_lpae_num_cont(block_size) : 1;
>> +       bool use_cont = cont_hint_enabled && num_cont > 1;
>>
>>         /* Find our entry at the current level */
>>         map_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
>>         ptep += map_idx_start;
>>
>> +       /*
>> +        * Normalize an exact whole-CONT-group request down to the
>> +        * equivalent block_size/pgcount so it funnels through the same
>> +        * leaf path below. arm_lpae_install_leaf() independently decides,
>> +        * per sub-chunk, whether the CONT hint actually applies.
>> +        */
>> +       if (use_cont && size == block_size * num_cont) {
>> +               pgcount *= num_cont;
>> +               size = block_size;
> 
> This appears to me as if you're throwing away information about
> whether this mapping request is suitable for the contiguous bit, and
> then in arm_lpae_install_leaf(), you're trying to recover that
> information. Can't you just do "prot |=ARM_LPAE_PTE_CONT" here and
> then completely avoid the logic in arm_lpae_install_leaf?
>

That optimization only applies to the exact-whole-group case already
handled above (size == block_size * num_cont). A single map_pages()
call can also cover the general case shown above, where a misaligned
prefix/suffix surrounds one or more aligned groups within the same
call. Setting prot |= ARM_LPAE_PTE_CONT unconditionally here would
incorrectly tag those misaligned entries with the hint.

arm_lpae_install_leaf()'s off/remaining logic is what detects those
group boundaries per chunk, so I don't think we can drop it in favor
of always setting prot |= CONT at this call site. The size ==
block_size * num_cont check here is just a fast path for the common
whole-group case, avoiding a walk through install_leaf() for something
the caller has already told us.

Thanks,
Vijay

>> +       }
>> +
>>         /* If we can install a leaf entry at this level, then do so */
>>         if (size == block_size) {
>> +               int ret;
>> +
>>                 max_entries = arm_lpae_max_entries(map_idx_start, data);
>> -               num_entries = min_t(int, pgcount, max_entries);
>> -               ret = arm_lpae_init_pte(data, iova, paddr, prot, lvl, num_entries, ptep);
>> -               if (!ret)
>> -                       *mapped += num_entries * size;
>> +               num_entries = min_t(size_t, pgcount, max_entries);
>>
>> -               return ret;
>> +               if (!use_cont) {
>> +                       ret = arm_lpae_init_pte(data, iova, paddr, prot, lvl,
>> +                                               num_entries, ptep);
>> +                       if (!ret)
>> +                               *mapped += num_entries * size;
>> +                       return ret;
>> +               }
>> +
>> +               return arm_lpae_install_leaf(data, iova, paddr, prot, lvl,
>> +                                            map_idx_start, num_entries,
>> +                                            num_cont, ptep, mapped);


