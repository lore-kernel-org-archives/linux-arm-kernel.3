Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FE1F9D0F6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 01:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8XtA1EyYgn41uAU/MTEXCY/CsCra52HysC3sbmkEf68=; b=OGW77uxHIqLiRoX3Wfgcb2pYET
	IJVvM7mC3ZVLakEsEfZIiCkvy8epAbTui1oF6nImCNDRJ6t2eSM7EbFzKGMMeTMpyA78H54tgXy7o
	DICaLhgK7sztFjU84vLbe7Zwte71SsKsqBLJE4kiUACoCg69sqjynzn132/GwZeuwguKkEv0Pz1Vt
	YQvcpfqqSQq+KFJTsV+TP5z2OCza1kgXAdPCR1WxrQOsGyZuNJTXNEydpUVof+ZzKeQPEIsYwiQ44
	kC1CYw/2HO1npcoRKr5ydto19v05ndrWYZqhdSpGFe8kaYf4uzv9Mext4oaDuiRSr5b9U4GhZwkag
	EqC6yGEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCp2W-00000000Qgx-3o6s;
	Wed, 15 Apr 2026 01:27:36 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCp2S-00000000QgD-3fia
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 01:27:35 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8XtA1EyYgn41uAU/MTEXCY/CsCra52HysC3sbmkEf68=;
	b=axN/6JiDV8CeNDO3m1v/grb3Tl/1S2uz4IWT52lRujIhut/lnAVhip8Yg7MqyKMYMyW/VJCek
	lCSb9pZeT6nqj3B8yf9lGRZRS2j7B/WrzSDFAihXlSJ4M6+nBkr+Vo1QeOrNuUjYxe1q9Ex7Utj
	YzPLEsTmjETGsaSI01aBj/Q=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fwNdQ5yZMz1T4G8;
	Wed, 15 Apr 2026 09:21:14 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 0575440572;
	Wed, 15 Apr 2026 09:27:15 +0800 (CST)
Received: from [10.174.179.37] (10.174.179.37) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 15 Apr 2026 09:27:13 +0800
Message-ID: <d5918112-0c9f-ecf3-226c-8c3cdd5cd508@huawei.com>
Date: Wed, 15 Apr 2026 09:27:12 +0800
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
	<james.morse@arm.com>, <jonathan.cameron@huawei.com>, <kobak@nvidia.com>,
	<lcherian@marvell.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <peternewman@google.com>,
	<punit.agrawal@oss.qualcomm.com>, <quic_jiles@quicinc.com>,
	<reinette.chatre@intel.com>, <rohit.mathew@arm.com>,
	<scott@os.amperecomputing.com>, <sdonthineni@nvidia.com>,
	<xhao@linux.alibaba.com>, Linuxarm <linuxarm@huawei.com>
References: <d13fdc75-b647-44f3-9657-d592353e8a1a@huawei.com>
 <08aacacc-e3e5-4e97-858b-cbcbdb9a1fcf@arm.com>
 <7b2681c3-9ef7-4882-ba57-2503934e2759@huawei.com>
 <0d578c61-1341-4149-9e8c-936ea0ce0c50@arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <0d578c61-1341-4149-9e8c-936ea0ce0c50@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.37]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_182733_588222_F983B8D2 
X-CRM114-Status: GOOD (  11.18  )
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

Hi Ben,

On 2026/4/13 23:02, Ben Horgan wrote:
> Hi Qinxin,
> 
> On 4/3/26 03:44, Qinxin Xia wrote:
>>
>>
>> On 2026/3/27 18:47:49, Ben Horgan <ben.horgan@arm.com> wrote:
>>> Hi Qinxin,
>>>
>>> On 3/27/26 10:21, Qinxin Xia wrote:
>>>>
>>>> Hello everyone!
>>>>
>>>> In earlier versions, mpam supports the configuration of iommu_groups.
>>>>
>>>>    823 static ssize_t rdtgroup_tasks_write(struct kernfs_open_file *of,
>>>>    824                                     char *buf, size_t nbytes,
>>>> loff_t off)
>>>>    825 {
>>>>    826         struct rdtgroup *rdtgrp;
>>>>    827         int iommu_group_id;
>>>>    828         bool is_iommu;
>>>>    829         char *pid_str;
>>>>    830         int ret = 0;
>>>>    831         pid_t pid;
>>>>    832
>>>>    833         rdtgrp = rdtgroup_kn_lock_live(of->kn);
>>>>    834         if (!rdtgrp) {
>>>>    835                 rdtgroup_kn_unlock(of->kn);
>>>>    836                 return -ENOENT;
>>>>    837         }
>>>>    838         rdt_last_cmd_clear();
>>>>    839
>>>>    840         if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED ||
>>>>    841             rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
>>>>    842                 ret = -EINVAL;
>>>>    843                 rdt_last_cmd_puts("Pseudo-locking in progress\n");
>>>>    844                 goto unlock;
>>>>    845         }
>>>>    846
>>>>    847         while (buf && buf[0] != '\0' && buf[0] != '\n') {
>>>>    848                 pid_str = strim(strsep(&buf, ","));
>>>>    849
>>>>    850                 is_iommu = string_is_iommu_group(pid_str, &iommu_group_id);
>>>>
>>>> What puzzles me is why we would put it under 'task'—this seems a little
>>>>    strange to users.It seems they are not related.Why don't we add a new
>>>> interface like 'iommu'?
>>>
>>> I think it is likely that this interface would change if upstream support is added.
>>>
>>
>> I have done some work in this direction before, and I will release an
>> RFC later for further discussion.:-)
> 
> Looking forward to seeing it.
> 
> Ben
> 

Following the current SMMU approach, I've submitted several bugfix
patches for the MPAM driver, but haven't received any review feedback
yet.

To avoid these being overlooked, I'd like to kindly remind to take a
look:
v2: 
https://lore.kernel.org/all/20260414032610.1523958-1-zengheng4@huawei.com/
v1: 
https://lore.kernel.org/all/20251107063300.1580046-1-zengheng4@huawei.com/

Additionally, I'd like to check on the status of this branch — is it
still actively maintained? It would be helpful to understand the future
plans for MPAM development.


Thanks for your time,
Zeng Heng

