Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015B3D7308A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 02:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NIEPfSgO6NE4F/rCBAFm3maYZa1A5siWWeSJ+P/b3SE=; b=TrHQ/oylV5qwCuFFohPr1qnTO6
	tOlZFkdbwp41wg3PTyjArsOZ/95Z5r0qDTFsOeyx6hUwMY/iMngYAqMoKHgLykwS8aLFpEZRYhDSW
	wQ5pQeTBgEpYv4tjGX77LQMeGqjwxCetD99HdsTttcCVrl0FPjIRdYoyAMYEm9VOvTsemqbjx/wDC
	TUz97nJTPRhX+MLn34SHg/V8CuNfys/egqfgW5Xn1zYiZXlu8u972SvdyW0gEXBl7eZIw/rXdRL5Y
	ixLF7CVFDo7512QTo4Ksbp1KQuNWUSvdOazkrCjiJohTwrfFL3WD5lwEOkmk+1njJPOecM2ijAyGi
	vdoa9k0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8UWi-000000016tY-1ySq;
	Fri, 03 Apr 2026 02:44:52 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8UWf-000000016t1-07lX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 02:44:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=NIEPfSgO6NE4F/rCBAFm3maYZa1A5siWWeSJ+P/b3SE=;
	b=5L1kSBS/OB63VGYsrX3X30MQeYhY3uuBqNlNG87QIk1v/nEoE0OWxLRjzNnrG1xe5Sef7PpoJ
	vCFsbTsBUll7ensJpdr7UAtvrF9aGrpQ9tslYqHS8DlJMsTCKWyhVnGM5bnR/mgSwxIxNv/ROfA
	kwF+fq5j/kBX4mpCtuseefI=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4fn2w139YzzmV6n;
	Fri,  3 Apr 2026 10:38:25 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id B969D4056C;
	Fri,  3 Apr 2026 10:44:37 +0800 (CST)
Received: from [10.67.120.170] (10.67.120.170) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 3 Apr 2026 10:44:36 +0800
Message-ID: <7b2681c3-9ef7-4882-ba57-2503934e2759@huawei.com>
Date: Fri, 3 Apr 2026 10:44:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Question mpam mpam/snapshot+extras/v6.18-rc1] Question with
 Configuring iommu_group in 'task'
To: Ben Horgan <ben.horgan@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<dave.martin@arm.com>, <david@kernel.org>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <james.morse@arm.com>,
	<jonathan.cameron@huawei.com>, <kobak@nvidia.com>, <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <punit.agrawal@oss.qualcomm.com>,
	<quic_jiles@quicinc.com>, <reinette.chatre@intel.com>,
	<rohit.mathew@arm.com>, <scott@os.amperecomputing.com>,
	<sdonthineni@nvidia.com>, <xhao@linux.alibaba.com>, <zengheng4@huawei.com>,
	Linuxarm <linuxarm@huawei.com>
References: <d13fdc75-b647-44f3-9657-d592353e8a1a@huawei.com>
 <08aacacc-e3e5-4e97-858b-cbcbdb9a1fcf@arm.com>
From: Qinxin Xia <xiaqinxin@huawei.com>
In-Reply-To: <08aacacc-e3e5-4e97-858b-cbcbdb9a1fcf@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.170]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemj200003.china.huawei.com (7.202.194.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_194449_713823_873556F4 
X-CRM114-Status: GOOD (  13.66  )
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



On 2026/3/27 18:47:49, Ben Horgan <ben.horgan@arm.com> wrote:
> Hi Qinxin,
> 
> On 3/27/26 10:21, Qinxin Xia wrote:
>>
>> Hello everyone!
>>
>> In earlier versions, mpam supports the configuration of iommu_groups.
>>
>>   823 static ssize_t rdtgroup_tasks_write(struct kernfs_open_file *of,
>>   824                                     char *buf, size_t nbytes,
>> loff_t off)
>>   825 {
>>   826         struct rdtgroup *rdtgrp;
>>   827         int iommu_group_id;
>>   828         bool is_iommu;
>>   829         char *pid_str;
>>   830         int ret = 0;
>>   831         pid_t pid;
>>   832
>>   833         rdtgrp = rdtgroup_kn_lock_live(of->kn);
>>   834         if (!rdtgrp) {
>>   835                 rdtgroup_kn_unlock(of->kn);
>>   836                 return -ENOENT;
>>   837         }
>>   838         rdt_last_cmd_clear();
>>   839
>>   840         if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED ||
>>   841             rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
>>   842                 ret = -EINVAL;
>>   843                 rdt_last_cmd_puts("Pseudo-locking in progress\n");
>>   844                 goto unlock;
>>   845         }
>>   846
>>   847         while (buf && buf[0] != '\0' && buf[0] != '\n') {
>>   848                 pid_str = strim(strsep(&buf, ","));
>>   849
>>   850                 is_iommu = string_is_iommu_group(pid_str, &iommu_group_id);
>>
>> What puzzles me is why we would put it under 'task'—this seems a little
>>   strange to users.It seems they are not related.Why don't we add a new
>> interface like 'iommu'?
> 
> I think it is likely that this interface would change if upstream support is added.
> 

I have done some work in this direction before, and I will release an
RFC later for further discussion.:-)

>>
>>   851                 if (is_iommu)
>>   852                         ret = rdtgroup_move_iommu(iommu_group_id, rdtgrp, of);
>>   853                 else if (kstrtoint(pid_str, 0, &pid)) {
>>   854                         rdt_last_cmd_printf("Task list parsing error pid %s\n", pid_str);
>>   855                         ret = -EINVAL;
>>   856                         break;
>>   857                 }
>>   858
>>   859                 if (pid < 0) {
>>   860                         rdt_last_cmd_printf("Invalid pid %d\n", pid);
>>   861                         ret = -EINVAL;
>>   862                         break;
>>   863                 }
>>   864
>>
>> In future glue versions, will you re-enable support for iommu_group, and
>> if so, will the configuration scheme be changed?
> 
> Please can you let us know about your usecase so that we can get more information to decide
> what the best interface would be?
> 
> Thanks,
> 
> Ben
> 
> 
> 

We want to use the iommu mpam to implement stream control for different
PCIe devices. By limiting the access bandwidth of some PCIe devices, the
high-priority service devices can obtain more resources.

-- 
Thanks,
Qinxin


