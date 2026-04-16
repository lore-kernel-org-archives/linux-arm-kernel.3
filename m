Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A03BF433D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 03:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mb3ZAQhsea54q8p8RFMNsDARhntx+n9OVpSYKpoRno=; b=XVmlbZcu3mShdL41LObG25ib2r
	immktkQezihzRoyMtJ30jiJ8lQIAoI3eTjIJV6P6PIW8K9X86AisEGjk3M93J7ef+tvfr30vtDNOy
	FYAr+BtN7A4xc6/b2OIpp6jaA2PRiuvP+kleDzuVZ8tbHLNUfga1qojNptOs1AJ9t1FS9YyptmVJo
	cWr8YyaZ65ABN1yNKXFyaADXVKchJjzHq5zbvOG1O7GSV80euWWpCqS15gNJ6iPjJB28kIxDeXKQF
	vtx6e+5R9sEIMFZ30gs4dQidlrPdDueVlfKu4SYMneaGNBo9SVGko9rDWF+TSDC/hJ5NVjRebjO1H
	xYJz69mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDD0Z-00000001tmd-0SqU;
	Thu, 16 Apr 2026 03:03:11 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDD0U-00000001tlh-3NNS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 03:03:09 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=4mb3ZAQhsea54q8p8RFMNsDARhntx+n9OVpSYKpoRno=;
	b=Ij1RBAcwL2Gv87YRSgvNTfb95nZhHfEHy5x+0gjxcvWZy+N6pDk/Jh/15fY5EMv/+0AoEvo7h
	0enegr0sJfnc5mHao97xkU5ygqkdOWKIfMHsJ8ynvHhxnUxNqshRKbmD4scQudHe/4EWPxImcTo
	+vsA2leP5sr+RYNRF6k1/h8=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4fx2hs6kXPzLlYX;
	Thu, 16 Apr 2026 10:56:29 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id EC54F40571;
	Thu, 16 Apr 2026 11:02:47 +0800 (CST)
Received: from [10.174.179.37] (10.174.179.37) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 16 Apr 2026 11:02:46 +0800
Message-ID: <7e69034d-ff8e-f0ed-1c79-59f4449d74ab@huawei.com>
Date: Thu, 16 Apr 2026 11:02:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Question mpam mpam/snapshot+extras/v6.18-rc1] Question with
 Configuring iommu_group in 'task'
Content-Language: en-US
To: Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>
CC: Qinxin Xia <xiaqinxin@huawei.com>, <amitsinght@marvell.com>,
	<baisheng.gao@unisoc.com>, <baolin.wang@linux.alibaba.com>,
	<carl@os.amperecomputing.com>, <dave.martin@arm.com>, <david@kernel.org>,
	<dfustini@baylibre.com>, <fenghuay@nvidia.com>, <gshan@redhat.com>,
	<jonathan.cameron@huawei.com>, <kobak@nvidia.com>, <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <punit.agrawal@oss.qualcomm.com>,
	<quic_jiles@quicinc.com>, <reinette.chatre@intel.com>,
	<rohit.mathew@arm.com>, <scott@os.amperecomputing.com>,
	<sdonthineni@nvidia.com>, <xhao@linux.alibaba.com>, Linuxarm
	<linuxarm@huawei.com>
References: <d13fdc75-b647-44f3-9657-d592353e8a1a@huawei.com>
 <08aacacc-e3e5-4e97-858b-cbcbdb9a1fcf@arm.com>
 <7b2681c3-9ef7-4882-ba57-2503934e2759@huawei.com>
 <0d578c61-1341-4149-9e8c-936ea0ce0c50@arm.com>
 <d5918112-0c9f-ecf3-226c-8c3cdd5cd508@huawei.com>
 <f800f0d5-7a00-4dad-95fe-a2aac2ece5ef@arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <f800f0d5-7a00-4dad-95fe-a2aac2ece5ef@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.37]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_200307_494655_161D6D90 
X-CRM114-Status: GOOD (  13.32  )
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



On 2026/4/15 20:42, Ben Horgan wrote:
> Hi Zeng,
> 
> On 4/15/26 02:27, Zeng Heng wrote:
>> Hi Ben,
>>
>> On 2026/4/13 23:02, Ben Horgan wrote:
>>> Hi Qinxin,
>>>
>>> On 4/3/26 03:44, Qinxin Xia wrote:
>>>>
>>>>
>>>> On 2026/3/27 18:47:49, Ben Horgan <ben.horgan@arm.com> wrote:
>>>>> Hi Qinxin,
>>>>>
>>>>> On 3/27/26 10:21, Qinxin Xia wrote:
>>>>>>
>>>>>> Hello everyone!
>>>>>>
>>>>>> In earlier versions, mpam supports the configuration of iommu_groups.
>>>>>>
>>>>>>     823 static ssize_t rdtgroup_tasks_write(struct kernfs_open_file *of,
>>>>>>     824                                     char *buf, size_t nbytes,
>>>>>> loff_t off)
>>>>>>     825 {
>>>>>>     826         struct rdtgroup *rdtgrp;
>>>>>>     827         int iommu_group_id;
>>>>>>     828         bool is_iommu;
>>>>>>     829         char *pid_str;
>>>>>>     830         int ret = 0;
>>>>>>     831         pid_t pid;
>>>>>>     832
>>>>>>     833         rdtgrp = rdtgroup_kn_lock_live(of->kn);
>>>>>>     834         if (!rdtgrp) {
>>>>>>     835                 rdtgroup_kn_unlock(of->kn);
>>>>>>     836                 return -ENOENT;
>>>>>>     837         }
>>>>>>     838         rdt_last_cmd_clear();
>>>>>>     839
>>>>>>     840         if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED ||
>>>>>>     841             rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
>>>>>>     842                 ret = -EINVAL;
>>>>>>     843                 rdt_last_cmd_puts("Pseudo-locking in progress\n");
>>>>>>     844                 goto unlock;
>>>>>>     845         }
>>>>>>     846
>>>>>>     847         while (buf && buf[0] != '\0' && buf[0] != '\n') {
>>>>>>     848                 pid_str = strim(strsep(&buf, ","));
>>>>>>     849
>>>>>>     850                 is_iommu = string_is_iommu_group(pid_str, &iommu_group_id);
>>>>>>
>>>>>> What puzzles me is why we would put it under 'task'—this seems a little
>>>>>>     strange to users.It seems they are not related.Why don't we add a new
>>>>>> interface like 'iommu'?
>>>>>
>>>>> I think it is likely that this interface would change if upstream support is added.
>>>>>
>>>>
>>>> I have done some work in this direction before, and I will release an
>>>> RFC later for further discussion.:-)
>>>
>>> Looking forward to seeing it.
>>>
>>> Ben
>>>
>>
>> Following the current SMMU approach, I've submitted several bugfix
>> patches for the MPAM driver, but haven't received any review feedback
>> yet.
>>
>> To avoid these being overlooked, I'd like to kindly remind to take a
>> look:
>> v2: https://lore.kernel.org/all/20260414032610.1523958-1-zengheng4@huawei.com/
>> v1: https://lore.kernel.org/all/20251107063300.1580046-1-zengheng4@huawei.com/
>>
>> Additionally, I'd like to check on the status of this branch — is it
>> still actively maintained? It would be helpful to understand the future
>> plans for MPAM development.
> 
> The MPAM snapshot and extras branches are no longer maintained. Work on these has stopped so that we can focus on
> upstream. Apologies for not making this clear earlier.
> 


Ack. If the extras branch scheme mentioned above is rebased onto
upstream, these bugfix patches would remain applicable and worth
reviewing.


Best regards,
Zeng Heng

