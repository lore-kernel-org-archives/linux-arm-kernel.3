Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BCCCA5FC3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 08:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6NFbmBv4gX6DwCKpCQ6ZygoAz0yTdrXq4bO5uUeCkzI=; b=EV67GBjUotFuUm/HKAORigQLjk
	aEqWxK/CKIjncrnDUghCoT9vcZDIRnAIV2X/mxHgfVCY9MfZioKfwLQzQvThdbeUdtSIli5o/l1+t
	r2BFcoM5sgzprdviLzHZ40mUyX0O3iqil71XNQ+2kGZOKzMtlgXNPSLvqtXUrQH6AedUAbFop7VtO
	NOHoz0zMTuRfejg3/BPnLYvOGSavopMLRwyXltCsPNLOFHe7RtbDB7o/d9LZ10/TWADegNVZZCsb0
	oNuvxJvipsBkRuA7Etxo/HnFxt60L7WSobggLGa8DFxDgPtbXUSIM0/5xBFI+GRQ++/McoGNWUQqW
	jFuiD4Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpUy-00000005OiM-1ZD6;
	Wed, 30 Sep 2026 08:17:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpUv-00000005Ohe-2vMm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 08:17:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AFC61477;
	Wed, 30 Sep 2026 01:17:01 -0700 (PDT)
Received: from [192.168.1.148] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAA463F85F;
	Wed, 30 Sep 2026 01:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790756224; bh=GNXZa7j1/VTmq7tnRy/t6ruvY0i6WuGqOi1nPlTRzL8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BKFn+Xi71PDm13PN8c8mgumEtRVu6FdNVGMRI1NxBTY3+SXllrtsQ3wOiOa9C9yGH
	 50qcRfxA51AqF4pH++UxpnBh8vGYwXCVwWTAkE001/+beCOgzfLMxE2tz0ga5977lw
	 wFuOCDVKLSU2T89a1BcDCSroJtJc5QdZ9Gr6OJe0=
Message-ID: <af49e948-3120-401f-a00d-74c853ee17b9@arm.com>
Date: Wed, 30 Sep 2026 09:17:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 6/7] firmware: arm_rmm: Ensure the RMM has GPT entries
 for memory
Content-Language: en-GB
To: Shanker Donthineni <sdonthineni@nvidia.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 gshan@redhat.com, joey.gouly@arm.com, tabba@google.com,
 yuzenghui@huawei.com, linux-coco@lists.linux.dev,
 gankulkarni@os.amperecomputing.com, alpergun@google.com,
 fj0570is@fujitsu.com, WeiLin.Chang@arm.com, lpieralisi@kernel.org,
 enju.kohei@fujitsu.com, sudeep.holla@arm.com,
 jonathan.cameron@oss.qualcomm.com
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-7-suzuki.poulose@arm.com>
 <a27970c6-a7d2-4abc-84c3-7e50225f0a1a@nvidia.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <a27970c6-a7d2-4abc-84c3-7e50225f0a1a@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_011705_824145_CD415454 
X-CRM114-Status: GOOD (  18.25  )
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

On 29/09/2026 23:29, Shanker Donthineni wrote:
> Hi Suzuki,
> 
> On 9/24/2026 8:52 AM, Suzuki K Poulose wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> From: Steven Price <steven.price@arm.com>
>>
>> The RMM maintains the state of all the granules in the system to make
>> sure that the host is abiding by the rules. This state can be maintained
>> at different granularity, per page (TRACKING_FINE) or per region
>> (TRACKING_COARSE or TRACKING_INTERMEDIATE). The region size depends on 
>> the
>> underlying "RMI_GRANULE_SIZE". For a "coarse"/"intermediate" region,
>> all pages in the region must be of the same state, this implies we 
>> need to
>> have "fine" tracking for DRAM, so that we can delegate individual pages.
>>
>> For now we only support a statically carved out memory for tracking
>> granules for the "fine" regions. This can be extended in the future to
>> allow modifying the tracking granularity and remove the need for a
>> static allocation by the firmware.

...

>> +
>> +/*
>> + * We do not support creating L1 GPTs yet. So, make sure that
>> + * all the regions are managed by the firmware.
>> + */
>> +static int rmi_verify_gpt_firmware_managed(phys_addr_t start, 
>> phys_addr_t end)
>> +{
>> +       unsigned long l0gpt_sz;
>> +       unsigned long next, par_state;
>> +
>> +       l0gpt_sz = 1UL << (30 + FIELD_GET(RMI_FEATURE_REGISTER_1_L0GPTSZ,
>> +                                         rmi_feat_reg(1)));
>> +       start = ALIGN_DOWN(start, l0gpt_sz);
>> +       end = ALIGN(end, l0gpt_sz);
>> +
>> +       while (start < end) {
>> +               long ret = rmi_gpt_info(start, end, &next, &par_state);
>> +
>> +               if (ret != RMI_SUCCESS)
>> +                       return -ENOMEM;
>> +
>> +               if (WARN_ON(next <= start))
>> +                       return -ENXIO;
>> +
>> +               if (par_state != RMI_GPT_PAR_PLAT) {
>> +                       pr_err("GPT for the region is not managed by 
>> firmware %llx-%lx\n",
>> +                               start, next);
>> +                       return -ENOMEM;
> 
> Accepting only RMI_GPT_PAR_PLAT rules out the host ever creating its own
> L1 GPTs. On NVIDIA platforms the PARs backing system RAM come up as
> RMI_GPT_PAR_HOST_NOT_CREATED, so this returns -ENOMEM and CCA cannot be
> enabled at all.

Like I mentioned in the previous response, this is staged upstreaming.
The dynamic GPT/Tracking will follow after. This also calls for 
on-demand activation which Catalin requested and can be combined together,
as we dedicate quite a lot of memory for the metadata and L1GPTs.


> 
> With local changes to promote granule tracking via RMI_GRANULE_TRACKING_SET
> and to create the host L1 GPTs, I was able to boot a Realm with multiple
> vCPUs and exercise basic boot functionality on NVIDIA silicon.

Thanks for the testing !

Cheers
Suzuki

