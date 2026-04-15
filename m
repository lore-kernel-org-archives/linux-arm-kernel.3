Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE927F4199E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 12:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3QIIh3kwou0zTrPGwTCNLHQvIkzw9IeIf7f1j8kshU=; b=eg0SQ4gtW4++Swp4buBCfQdYQ5
	vUBIXbOdoF05Pt80GqOsOjNd4+0ontlZti2S5n/98oAFCEsoOHigI79wz4MOhq0i7p4pF6IBbHV77
	lbs0XJUMeVVyea3X0KAOyGcV4u4JlMwwiwFGGVTXP0LHRYc6zUAkPvoIfLTSQJ7wGvcYfMMvYSGWq
	w4vENoqpBn9nd50S5j9UWw3jdkCZvHoRtsJ3XyHZmWvyEt3oQhvperf86leBaRYwxsK2Q8P0ufgAv
	ZipQMuOckhnOPEhk8pqaKol+eaCWAIInxGKuVNgWD36q5ckwgf3HERJCs2IsrmRYHIyDfaK/E7hs/
	YnHIm24A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCzZf-000000018g4-3fbY;
	Wed, 15 Apr 2026 12:42:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCzZc-000000018fd-3Cgu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 12:42:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9076B4FAA;
	Wed, 15 Apr 2026 05:42:19 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C98C43F86F;
	Wed, 15 Apr 2026 05:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776256945; bh=AA/4BL2Th9GaGSXx0JWYhGRyELvEkyDn0qoQqHwlRY4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I/gkplXrcgeTdBvVd6kRCSikjhqvwwM4q84/lOBKhgxihlVMOMmBb5ZLx9I7Sb/5K
	 hMJCAIymxYL/kAM1vgnoE7exD1it2+8DovdyPmpHgby/48WcBtKREqipp8mPR22DOb
	 XLrCFphUsSKzt4UMCstFSdS7NbTCUvD8t8dHt8qA=
Message-ID: <f800f0d5-7a00-4dad-95fe-a2aac2ece5ef@arm.com>
Date: Wed, 15 Apr 2026 13:42:20 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [Question mpam mpam/snapshot+extras/v6.18-rc1] Question with
 Configuring iommu_group in 'task'
To: Zeng Heng <zengheng4@huawei.com>, James Morse <james.morse@arm.com>
Cc: Qinxin Xia <xiaqinxin@huawei.com>, amitsinght@marvell.com,
 baisheng.gao@unisoc.com, baolin.wang@linux.alibaba.com,
 carl@os.amperecomputing.com, dave.martin@arm.com, david@kernel.org,
 dfustini@baylibre.com, fenghuay@nvidia.com, gshan@redhat.com,
 jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 xhao@linux.alibaba.com, Linuxarm <linuxarm@huawei.com>
References: <d13fdc75-b647-44f3-9657-d592353e8a1a@huawei.com>
 <08aacacc-e3e5-4e97-858b-cbcbdb9a1fcf@arm.com>
 <7b2681c3-9ef7-4882-ba57-2503934e2759@huawei.com>
 <0d578c61-1341-4149-9e8c-936ea0ce0c50@arm.com>
 <d5918112-0c9f-ecf3-226c-8c3cdd5cd508@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <d5918112-0c9f-ecf3-226c-8c3cdd5cd508@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_054228_881663_462AA459 
X-CRM114-Status: GOOD (  16.99  )
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

Hi Zeng,

On 4/15/26 02:27, Zeng Heng wrote:
> Hi Ben,
> 
> On 2026/4/13 23:02, Ben Horgan wrote:
>> Hi Qinxin,
>>
>> On 4/3/26 03:44, Qinxin Xia wrote:
>>>
>>>
>>> On 2026/3/27 18:47:49, Ben Horgan <ben.horgan@arm.com> wrote:
>>>> Hi Qinxin,
>>>>
>>>> On 3/27/26 10:21, Qinxin Xia wrote:
>>>>>
>>>>> Hello everyone!
>>>>>
>>>>> In earlier versions, mpam supports the configuration of iommu_groups.
>>>>>
>>>>>    823 static ssize_t rdtgroup_tasks_write(struct kernfs_open_file *of,
>>>>>    824                                     char *buf, size_t nbytes,
>>>>> loff_t off)
>>>>>    825 {
>>>>>    826         struct rdtgroup *rdtgrp;
>>>>>    827         int iommu_group_id;
>>>>>    828         bool is_iommu;
>>>>>    829         char *pid_str;
>>>>>    830         int ret = 0;
>>>>>    831         pid_t pid;
>>>>>    832
>>>>>    833         rdtgrp = rdtgroup_kn_lock_live(of->kn);
>>>>>    834         if (!rdtgrp) {
>>>>>    835                 rdtgroup_kn_unlock(of->kn);
>>>>>    836                 return -ENOENT;
>>>>>    837         }
>>>>>    838         rdt_last_cmd_clear();
>>>>>    839
>>>>>    840         if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED ||
>>>>>    841             rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
>>>>>    842                 ret = -EINVAL;
>>>>>    843                 rdt_last_cmd_puts("Pseudo-locking in progress\n");
>>>>>    844                 goto unlock;
>>>>>    845         }
>>>>>    846
>>>>>    847         while (buf && buf[0] != '\0' && buf[0] != '\n') {
>>>>>    848                 pid_str = strim(strsep(&buf, ","));
>>>>>    849
>>>>>    850                 is_iommu = string_is_iommu_group(pid_str, &iommu_group_id);
>>>>>
>>>>> What puzzles me is why we would put it under 'task'—this seems a little
>>>>>    strange to users.It seems they are not related.Why don't we add a new
>>>>> interface like 'iommu'?
>>>>
>>>> I think it is likely that this interface would change if upstream support is added.
>>>>
>>>
>>> I have done some work in this direction before, and I will release an
>>> RFC later for further discussion.:-)
>>
>> Looking forward to seeing it.
>>
>> Ben
>>
> 
> Following the current SMMU approach, I've submitted several bugfix
> patches for the MPAM driver, but haven't received any review feedback
> yet.
> 
> To avoid these being overlooked, I'd like to kindly remind to take a
> look:
> v2: https://lore.kernel.org/all/20260414032610.1523958-1-zengheng4@huawei.com/
> v1: https://lore.kernel.org/all/20251107063300.1580046-1-zengheng4@huawei.com/
> 
> Additionally, I'd like to check on the status of this branch — is it
> still actively maintained? It would be helpful to understand the future
> plans for MPAM development.

The MPAM snapshot and extras branches are no longer maintained. Work on these has stopped so that we can focus on
upstream. Apologies for not making this clear earlier.

Thanks,

Ben

> 
> 
> Thanks for your time,
> Zeng Heng


