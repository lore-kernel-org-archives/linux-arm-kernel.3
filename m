Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE761CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 03:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHWzcrLEfsdSNs2MHMZ9l6wvzjV+VwxYhrV+RK6//AU=; b=PLBEPvdUCBtq/OoSEAnwNK8Fge
	caDUPylJ4kttu/AUH2SAkUstRAPd/95sPjQLRFystPOCUAyZe/IpbkI5oIA/mN3lILo+vmLl5kMoe
	dWQ6tl8mE6CxmuQfmbcoJJAOCq40IVpUc6Tkm6+mLyuTS38qRziDDdoOj0XOtWP7XluUQ/ZUyh00i
	GuMWCUWtEFdE5L3SJm20aEumfYb/t2ZinaVxZUwCTxeA/ARvQbgmS0IX9VCAb/V3cj2LJaJJeaN8J
	cH4GMplrTaVYweyiRLnWX0kqNGsTPgAwzZoh9aJ0FKAuWBQJ7UV3ZiT8WEVnekvXpdriyVDLXzRdq
	ocOTyAHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usC2D-00000007N4M-1ONG;
	Sat, 30 Aug 2025 03:13:45 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usBzR-00000007MwW-3Vsn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 03:10:55 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4cDKrn30S9z14Mdq;
	Sat, 30 Aug 2025 11:10:33 +0800 (CST)
Received: from kwepemo100013.china.huawei.com (unknown [7.202.195.244])
	by mail.maildlp.com (Postfix) with ESMTPS id 8AA25180491;
	Sat, 30 Aug 2025 11:10:41 +0800 (CST)
Received: from [10.67.120.83] (10.67.120.83) by kwepemo100013.china.huawei.com
 (7.202.195.244) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 30 Aug
 2025 11:10:40 +0800
Message-ID: <142957c5-64c2-47cd-846f-6ff0654aa3b7@h-partners.com>
Date: Sat, 30 Aug 2025 11:10:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] sysfs: duplicate resource file creation during PCIe rescan
From: moubingquan <moubingquan@h-partners.com>
To: <bhelgaas@google.com>
CC: <ilpo.jarvinen@linux.intel.com>, <lukas@wunner.de>, linux-arm
	<linux-arm-kernel@lists.infradead.org>, linux-kernl
	<linux-kernel@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>,
	fanghao <fanghao11@huawei.com>, gaozhihao <gaozhihao6@h-partners.com>,
	lujunhua <lujunhua7@h-partners.com>, shenyang <shenyang39@huawei.com>,
	wushanping <wushanping@huawei.com>, zengtao <prime.zeng@hisilicon.com>,
	<jonathan.cameron@huawei.com>
References: <b51519d6-ce45-4b6d-8135-c70169bd110e@h-partners.com>
 <9e3047e5-a6a2-4a56-967b-4dddbd3d1b43@h-partners.com>
Content-Language: en-US
In-Reply-To: <9e3047e5-a6a2-4a56-967b-4dddbd3d1b43@h-partners.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.83]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemo100013.china.huawei.com (7.202.195.244)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_201054_216272_1EAD5415 
X-CRM114-Status: GOOD (  16.80  )
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

Friendly ping ...

On 8/11/2025 10:12 AM, moubingquan wrote:
> Hello everyone, does anyone have any ideas on how to approach this problem。
> 
> On 7/29/2025 9:13 AM, moubingquan wrote:
>> Hi all,
>>
>> When uninstalling the driver on the ARM64 platform and invoking `sriov_disable()`,
>> another thread simultaneously performed `echo 1 > /sys/bus/pci/rescan`,
>> which resulted in a call trace error (`sysfs: cannot create duplicate filename`) when subsequently loading the driver.
>>
>> Under certain multi-threaded scenarios (e.g. VF teardown + PCI rescan triggered in parallel),
>> The following sequence may result in files appearing in sysfs that should not exist:
>>
>> 1. sriov_disable() uninstalls VFs and removes the corresponding VF files in sysfs.
>> 2.At the same time, when rescan_store() rescan the entire PCI device tree,
>> there is a possibility that VF files that should have been deleted are added back,
>> resulting in VF files in sysfs that should have been removed but were not.
>>
>> Tested on:
>> - Kernel version: Linux version 6.15.0-rc4+ (phisik3@10-50-163-153-ARM-openEuler22-3)
>> - Platform: ARM64 (Huawei Kunpeng920)
>> - Repro steps:
>> 1.Thread A unloads the driver and VF (requires calling sriov_disable()).
>> 2.Thread B calls `echo 1 > /sys/bus/pci/rescan `
>>
>> The system will report a call trace as follows:
>>
>> sysfs: cannot create duplicate filename '/devices/pci0000:3c/0000:3c:01.0/0000:3e:00.2/resource2'
>> CPU: 138 UID: 0 PID: 11067 Comm: sh Kdump: loaded Tainted: G      D W  O        6.15.0-rc4+ #1 PREEMPT
>> Tainted: [D]=DIE, [W]=WARN, [O]=OOT_MODULE
>> Call trace:
>>   show_stack+0x20/0x38 (C)
>>   dump_stack_lvl+0x80/0xf8
>>   dump_stack+0x18/0x28
>>   sysfs_warn_dup+0x6c/0x90
>>   sysfs_add_bin_file_mode_ns+0x12c/0x178
>>   sysfs_create_bin_file+0x7c/0xb8
>>   pci_create_attr+0x104/0x1b0
>>   pci_create_resource_files.part.0+0x50/0xd0
>>   pci_create_sysfs_dev_files+0x30/0x50
>>   pci_bus_add_device+0x40/0x120
>>   pci_bus_add_devices+0x40/0x98
>>   pci_bus_add_devices+0x6c/0x98
>>   pci_rescan_bus+0x38/0x58
>>   rescan_store+0x80/0xb0
>>   bus_attr_store+0x2c/0x48
>>   sysfs_kf_write+0x84/0xa8
>>   kernfs_fop_write_iter+0x120/0x1b8
>>   vfs_write+0x338/0x3f8
>>   ksys_write+0x70/0x110
>>   __arm64_sys_write+0x24/0x38
>>   invoke_syscall+0x50/0x120
>>   el0_svc_common.constprop.0+0xc8/0xf0
>>   do_el0_svc+0x24/0x38
>>   el0_svc+0x34/0xf0
>>   el0t_64_sync_handler+0xc8/0xd0
>>   el0t_64_sync+0x1ac/0x1b0
>>
>> The general analysis and corresponding code are as follows:
>>
>> drivers/pci/iov.c
>>
>> 736 static void sriov_disable(struct pci_dev *dev)
>> 737 {
>> 738         struct pci_sriov *iov = dev->sriov;
>> 739
>> 740         if (!iov->num_VFs)
>> 741                 return;
>> 742
>> 743         sriov_del_vfs(dev);
>> 744         iov->ctrl &= ~(PCI_SRIOV_CTRL_VFE | PCI_SRIOV_CTRL_MSE);
>> 745         pci_cfg_access_lock(dev);
>> 746         pci_write_config_word(dev, iov->pos + PCI_SRIOV_CTRL, iov->ctrl);
>> 747         ssleep(1);
>> 748         pci_cfg_access_unlock(dev);
>> 749
>> 750         pcibios_sriov_disable(dev);
>> 751
>> 752         if (iov->link != dev->devfn)
>> 753                 sysfs_remove_link(&dev->dev.kobj, "dep_link");
>> 754
>> 755         iov->num_VFs = 0;
>> 756         pci_iov_set_numvfs(dev, 0);
>> 757 }
>>
>> sriov_disable() will unload the VF and remove its files from sysfs.
>>
>> drivers/pci/pci-sysfs.c
>>
>>   435 static ssize_t rescan_store(const struct bus_type *bus, const char *buf, size_t count)
>>   436 {
>>   437         unsigned long val;
>>   438         struct pci_bus *b = NULL;
>>   439
>>   440         if (kstrtoul(buf, 0, &val) < 0)
>>   441                 return -EINVAL;
>>   442
>>   443         if (val) {
>>   444                 pci_lock_rescan_remove();
>>   445                 while ((b = pci_find_next_bus(b)) != NULL)
>>   446                         pci_rescan_bus(b);
>>   447                 pci_unlock_rescan_remove();
>>   448         }
>>   449         return count;
>>   450 }
>>   451 static BUS_ATTR_WO(rescan);
>>
>> The `rescan_store()` function will scan the entire PCI bus, including the relevant sysfs files for the aforementioned VFs.
>>
>> Initially, it seemed that directly adding the pci_lock_rescan_remove() lock to sriov_disable() could solve the problem.
>> However, it was later discovered that this might lead to a deadlock issue (because the remove_store() function would call sriov_disable(), causing a deadlock).
>>
>> drivers/pci/pci-sysfs.c
>>
>>   487 static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
>>   488                             const char *buf, size_t count)
>>   489 {
>>   490         unsigned long val;
>>   491
>>   492         if (kstrtoul(buf, 0, &val) < 0)
>>   493                 return -EINVAL;
>>   494
>>   495         if (val && device_remove_file_self(dev, attr))
>>   496
>>          //Subsequently, sriov_disable() will be invoked.
>>                  pci_stop_and_remove_bus_device_locked(to_pci_dev(dev));
>>   497         return count;
>>   498 }
>>   499 static DEVICE_ATTR_IGNORE_LOCKDEP(remove, 0220, NULL,
>>   500                                   remove_store);
>>
>> The function `pci_stop_and_remove_bus_device_locked()` acquires the `pci_lock_rescan_remove()` lock and subsequently calls `sriov_disable()`.
>> If the lock is added within `sriov_disable()`, it could lead to a deadlock.
>>
>> Should we add a new lock to address this issue, or are there any other ideas? I would like to consult and discuss this with everyone.
>>
>> Thanks,
>> Bingquan Mou <moubingquan@h-partners.com>
> 


