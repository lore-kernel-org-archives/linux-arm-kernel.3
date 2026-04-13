Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47D2F34C5C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 15:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdic55kJkgqqtekkPCrnMVV2U2EEFBuUOf8TmBsmakk=; b=Mzx42clnNUo0BdaBqyfCJHXz92
	NAlgJTmd/z5qMRhnNMACc5fA/RyJOERsDEJCPnVjdja7tKLhmRG53yLdVDpI8sgHkUHeWHRt2ksVf
	aQvdsjAnSt8PANpWlv63bsTb8qfIw2KIO0tzNJZMMVk7aNrvNwW8tZO3gX6WsRtG4pia7/ZaM+gyR
	1jk9h1/xp8K/Kclhx90vUJsBBAP+eL913t8tPXFOgtOXow5B40TldpNgwb/2FEC7SyDg8AofaC8sd
	l4EZP1YPI+Mmzj6WPUyEEYSvs+A6SNteJxs9dMMoxiqAsUGEU1KWvczh6ChqR3GZC63JyS/tVVVei
	GTLt/tyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCIoW-0000000FvdB-26Pt;
	Mon, 13 Apr 2026 15:03:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCIoT-0000000Fvcm-1U9U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 15:02:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6488232F9;
	Mon, 13 Apr 2026 08:02:50 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C7153F641;
	Mon, 13 Apr 2026 08:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776092576; bh=yMAZYv3MxMU1URr5yhGvfq7LBueQQ71YkBoWEluqilQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WbheYaLPFFcpo+Ehjmv5bNVJvgUGYD2py62Fi7eclio47GAkJwJ3aK4Q06Iq1dnCW
	 Io7kJ7/+2rA0OvthlV97pY7/MWUvA+7Mvjkf30TfX5Vr2BfyTglgHpDuX4BJ4IXOfZ
	 McDmAyOU5RZNQy0XF8dEdWCTgRQfqOOs1ppNoj/s=
Message-ID: <0d578c61-1341-4149-9e8c-936ea0ce0c50@arm.com>
Date: Mon, 13 Apr 2026 16:02:51 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [Question mpam mpam/snapshot+extras/v6.18-rc1] Question with
 Configuring iommu_group in 'task'
To: Qinxin Xia <xiaqinxin@huawei.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 xhao@linux.alibaba.com, zengheng4@huawei.com, Linuxarm <linuxarm@huawei.com>
References: <d13fdc75-b647-44f3-9657-d592353e8a1a@huawei.com>
 <08aacacc-e3e5-4e97-858b-cbcbdb9a1fcf@arm.com>
 <7b2681c3-9ef7-4882-ba57-2503934e2759@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <7b2681c3-9ef7-4882-ba57-2503934e2759@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_080257_471243_7BC8E3B5 
X-CRM114-Status: GOOD (  15.78  )
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

Hi Qinxin,

On 4/3/26 03:44, Qinxin Xia wrote:
> 
> 
> On 2026/3/27 18:47:49, Ben Horgan <ben.horgan@arm.com> wrote:
>> Hi Qinxin,
>>
>> On 3/27/26 10:21, Qinxin Xia wrote:
>>>
>>> Hello everyone!
>>>
>>> In earlier versions, mpam supports the configuration of iommu_groups.
>>>
>>>   823 static ssize_t rdtgroup_tasks_write(struct kernfs_open_file *of,
>>>   824                                     char *buf, size_t nbytes,
>>> loff_t off)
>>>   825 {
>>>   826         struct rdtgroup *rdtgrp;
>>>   827         int iommu_group_id;
>>>   828         bool is_iommu;
>>>   829         char *pid_str;
>>>   830         int ret = 0;
>>>   831         pid_t pid;
>>>   832
>>>   833         rdtgrp = rdtgroup_kn_lock_live(of->kn);
>>>   834         if (!rdtgrp) {
>>>   835                 rdtgroup_kn_unlock(of->kn);
>>>   836                 return -ENOENT;
>>>   837         }
>>>   838         rdt_last_cmd_clear();
>>>   839
>>>   840         if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED ||
>>>   841             rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
>>>   842                 ret = -EINVAL;
>>>   843                 rdt_last_cmd_puts("Pseudo-locking in progress\n");
>>>   844                 goto unlock;
>>>   845         }
>>>   846
>>>   847         while (buf && buf[0] != '\0' && buf[0] != '\n') {
>>>   848                 pid_str = strim(strsep(&buf, ","));
>>>   849
>>>   850                 is_iommu = string_is_iommu_group(pid_str, &iommu_group_id);
>>>
>>> What puzzles me is why we would put it under 'task'—this seems a little
>>>   strange to users.It seems they are not related.Why don't we add a new
>>> interface like 'iommu'?
>>
>> I think it is likely that this interface would change if upstream support is added.
>>
> 
> I have done some work in this direction before, and I will release an
> RFC later for further discussion.:-)

Looking forward to seeing it.

Ben

> 
>>>
>>>   851                 if (is_iommu)
>>>   852                         ret = rdtgroup_move_iommu(iommu_group_id, rdtgrp, of);
>>>   853                 else if (kstrtoint(pid_str, 0, &pid)) {
>>>   854                         rdt_last_cmd_printf("Task list parsing error pid %s\n", pid_str);
>>>   855                         ret = -EINVAL;
>>>   856                         break;
>>>   857                 }
>>>   858
>>>   859                 if (pid < 0) {
>>>   860                         rdt_last_cmd_printf("Invalid pid %d\n", pid);
>>>   861                         ret = -EINVAL;
>>>   862                         break;
>>>   863                 }
>>>   864
>>>
>>> In future glue versions, will you re-enable support for iommu_group, and
>>> if so, will the configuration scheme be changed?
>>
>> Please can you let us know about your usecase so that we can get more information to decide
>> what the best interface would be?
>>
>> Thanks,
>>
>> Ben
>>
>>
>>
> 
> We want to use the iommu mpam to implement stream control for different
> PCIe devices. By limiting the access bandwidth of some PCIe devices, the
> high-priority service devices can obtain more resources.
> 


