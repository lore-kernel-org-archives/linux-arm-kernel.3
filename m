Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC86F107526F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 07:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGDLL6Ar9BwuYWHlCus806lUe1cL7vSPADZrnW2oChs=; b=ZmhxC6FIpvGB2nd4quA0ouLbjU
	RxU3LoroPFF/dwpU1GmgKEGq82nIAkXbQzVXXaOGPuzMjsMJ3uVlZnD0wx34NWG+OaiiZsCTSxyCS
	CXAMoIaQAXG0z3Yb+cae7fO+YPJC9BFQyLCI8un7w3gkRa8CQOmc6W+3mpmrMUscAtfTFkARLrxUt
	aMuQZcGyOecnyPtc8K/0E7Fd+5CaOMfdSFrxYL+AjtkOMocWH+/3rkyRm4Vv2/kvXCxT2FRyGOl6c
	EeH8Km+So88VNI6diPt8icEY/GmhtGXnrAfhjK77yNSOoMG/W2qEQiYYqcApYqQ00pfP4eH/gR2C9
	Kub4zfag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w380s-0000000AAiD-0hKr;
	Thu, 19 Mar 2026 07:41:50 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w380p-0000000AAha-0psE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 07:41:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1773906103; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=aGDLL6Ar9BwuYWHlCus806lUe1cL7vSPADZrnW2oChs=;
	b=WWqmQbXmKDAnitd00b5OoLs6Pfe1AuQz808v4eVZMZCnj4qo21VEpq2dA651pcZ8RJ/lMK2uSCnLCyuYv6GW1olvefhlNErVimISGIHtG5P92MgIM2h1mkdNiMjRty8W0q0/C1kmguEkKwkCBfPCBUHQlDmL6FhOR2RtSm4KMGw=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R921e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0X.Hj-we_1773906099;
Received: from 30.246.163.250(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0X.Hj-we_1773906099 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 19 Mar 2026 15:41:40 +0800
Message-ID: <0e2d1eb5-a58d-4fe6-9a63-e10e527abd6f@linux.alibaba.com>
Date: Thu, 19 Mar 2026 15:41:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] iommu/arm-smmu-v3: Block ATS upon an ATC
 invalidation timeout
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 bhelgaas@google.com, jgg@nvidia.com, rafael@kernel.org, lenb@kernel.org,
 praan@google.com, baolu.lu@linux.intel.com, kevin.tian@intel.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, vsethi@nvidia.com
References: <cover.1773774441.git.nicolinc@nvidia.com>
 <7e21e14faddeb0e3af692356f4fefbae2dfbebda.1773774441.git.nicolinc@nvidia.com>
 <eeee122f-54e2-4fe9-82a6-724c3f80a499@linux.alibaba.com>
 <abts8l0UPvGuzrzF@Asurada-Nvidia>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <abts8l0UPvGuzrzF@Asurada-Nvidia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_004147_548664_6FAF5CA1 
X-CRM114-Status: GOOD (  14.83  )
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



On 3/19/26 11:26 AM, Nicolin Chen wrote:
> On Thu, Mar 19, 2026 at 10:56:43AM +0800, Shuai Xue wrote:
>> On 3/18/26 3:15 AM, Nicolin Chen wrote:
>>> For batched ATC_INV commands, SMMU hardware only reports a timeout at the
>>> CMD_SYNC, which could follow the batch issued for multiple devices. So, it
>>> isn't straightforward to identify which command in a batch resulted in the
>>> timeout. Fortunately, the invs array has a sorted list of ATC entries. So,
>>> the issued batch must be sorted as well. This makes it possible to bisect
>>> the batch to retry the command per Stream ID and identify the master.
>>
>> Nit: The implementation is a linear per-SID retry, not a binary
>> search / bisection. Suggest rewording to:
>>
>>    "retry the ATC_INV command for each unique Stream ID in the batch
>>     to identify the unresponsive master"
> 
> You are right. And that sounds OK.
> 
>>> +	step = arm_smmu_get_step_for_sid(smmu, sid);
>>> +	WRITE_ONCE(step->data[1],
>>> +		   READ_ONCE(step->data[1]) & cpu_to_le64(~STRTAB_STE_1_EATS));
>>
>>
>> This non-atomic read-modify-write on step->data[1] can race with the
>> normal STE installation path (arm_smmu_write_entry → entry_set →
>> WRITE_ONCE).
>>
>> The error path runs from:
>>
>>    __arm_smmu_domain_inv_range()  (data path, no group->mutex)
>>      → arm_smmu_cmdq_batch_retry()
>>        → arm_smmu_master_disable_ats()
>>          → arm_smmu_disable_eats_for_sid()   ← NO locks on STE
>>
>> The normal STE path runs from:
>>
>>    iommu_attach_device()
>>      → mutex_lock(&group->mutex)
>>        → arm_smmu_attach_dev()
>>          → mutex_lock(&arm_smmu_asid_lock)
>>            → arm_smmu_install_ste_for_dev()
>>              → arm_smmu_write_entry()        ← holds both mutexes
>>
>> Since the error path holds neither group->mutex nor arm_smmu_asid_lock,
>> the following race is possible:
> 
> Because invalidations can be in atomic context so we can't hold
> those mutex locks.
> 
>>    CPU A (error path):             CPU B (attach path):
>>    READ data[1] = X
>>                                    WRITE data[1] = Y (new STE config)
>>    WRITE data[1] = X & ~EATS
>>                                    // Y is lost
>>
>> This could clobber a concurrent STE update from the attach path.
> 
> Oh, that's true. Maybe this:
> 	__le64 new, old = READ_ONCE(step->data[1]);
> 	[...]
> 	do {
> 		new = old & cpu_to_le64(~STRTAB_STE_1_EATS);
> 	} while (!try_cmpxchg64(&step->data[1], &old, new));
> ?

Yes, the cmpxchg loop looks correct to me.

Thanks.
Shuai


