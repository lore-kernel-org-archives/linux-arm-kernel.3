Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3148BCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 02:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:CC:Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=de6xzwds0PpdJLjxfLnFji0StK0sVKKBeV9nOZya29Y=; b=nWtIQXhn+Y2RM/At5eKH55Fgih
	tsyB07ZNYD769Bnzjz4/fwpniZZXB4YCEYaumiQzY4yL9uGTPylM5MmDeXLrFcCFDImyk5KprxF/X
	mr1Sn53hbQAxFlBW9CEC8WReGFUmdxl1H7JXtvkgbcoSbIv9d08h2haEszwLwaOBs7R3bXaOgOeP3
	RFAxG5bXJgyKt/ME9LTpdAnMV/0Fq77RwqbasA+OQkhsxHaO9vLKPOJxd83fRjjfQnSazeuKh3wq2
	8kf5VrBx7gD0G43t7GTjQjVRBvfIQMfAtAh+7d5iw03F9av7hmHtWH8Nqx5m9kwMVCX3k9QCBToEN
	CDYJ1Svg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v88jp-0000000C7wG-1DGJ;
	Mon, 13 Oct 2025 02:56:41 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v88jm-0000000C7vU-0ZK6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 02:56:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=de6xzwds0PpdJLjxfLnFji0StK0sVKKBeV9nOZya29Y=;
	b=arIPAr01816wgOkxmb80SsbQVMKqFohsrrWeyReRdRXj24SClEQzBJB/6QjdAKXqD8zMBM+wT
	FKwqHFVsagHk/UnHXTbGOJcCMIk1MSPrcxtJWKnpML4I66c0JDMdcHGaWgmomujccyLkhH0RuLX
	PWANODXQF7nyQFTpnf+TP/0=
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4clMRt4FnTz1K97v;
	Mon, 13 Oct 2025 10:56:10 +0800 (CST)
Received: from dggpemf500013.china.huawei.com (unknown [7.185.36.188])
	by mail.maildlp.com (Postfix) with ESMTPS id CCF1014010D;
	Mon, 13 Oct 2025 10:56:28 +0800 (CST)
Received: from [10.67.121.183] (10.67.121.183) by
 dggpemf500013.china.huawei.com (7.185.36.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 13 Oct 2025 10:56:28 +0800
Message-ID: <5269ecde-be8e-4920-a76f-882da1475d5d@huawei.com>
Date: Mon, 13 Oct 2025 10:56:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Marc Zyngier <maz@kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, Zenghui Yu <yuzenghui@huawei.com>
From: Jinqian Yang <yangjinqian1@huawei.com>
Subject: [Question] QEMU VM fails to restart repeatedly with VFIO passthrough
 on GICv4.1
CC: jiangkunkun <jiangkunkun@huawei.com>, Zhou Wang <wangzhou1@hisilicon.com>,
	liuyonglong <liuyonglong@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.183]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500013.china.huawei.com (7.185.36.188)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_195638_836385_2319E958 
X-CRM114-Status: UNSURE (   4.81  )
X-CRM114-Notice: Please train this message.
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

Hi, all

On a GICv4.1 environment running kernel 6.16, when launching VMs with
QEMU and passing through VF devices, after repeatedly booting and
killing the VMs hundreds of times, the host reports call traces and the
VMs become unresponsive. The call traces show VFIO call stacks.

[14201.974880] BUG: Bad page map in process qemu-system-aar 
pte:fefefefefefefefe pmd:8000820b1ba0403
[14201.974895] addr:0000fffdd7400000 vm_flags:80240644bb 
anon_vma:0000000000000000 mapping:ffff08208e9b7758 index:401eed6a
[14201.974905] file:[vfio-device] fault:vfio_pci_mmap_page_fault 
[vfio_pci_core] mmap:vfio_device_fops_mmap [vfio] mmap_prepare: 0x0 
read_folio:0x0
[14201.974923] CPU: 2 UID: 0 PID: 50408 Comm: qemu-system-aar Kdump: 
loaded Tainted: G           O        6.16.0-rc4+ #1 PREEMPT
[14201.974926] Tainted: [O]=OOT_MODULE
[14201.974927] Hardware name: To be filled by O.E.M. To be filled by 
O.E.M./To be filled by O.E.M., BIOS HixxxxEVB V3.4.7 09/04/2025
[14201.974928] Call trace:
[14201.974929]  show_stack+0x20/0x38 (C)
[14201.974934]  dump_stack_lvl+0x80/0xf8
[14201.974938]  dump_stack+0x18/0x28
[14201.974940]  print_bad_pte+0x138/0x1d8
[14201.974943]  vm_normal_page+0xa4/0xd0
[14201.974945]  unmap_page_range+0x648/0x1110
[14201.974947]  unmap_single_vma.constprop.0+0x90/0x118
[14201.974948]  zap_page_range_single_batched+0xbc/0x180
[14201.974950]  zap_page_range_single+0x60/0xa0
[14201.974952]  unmap_mapping_range+0x114/0x140
[14201.974953]  vfio_pci_zap_and_down_write_memory_lock+0x3c/0x58 
[vfio_pci_core]
[14201.974957]  vfio_basic_config_write+0x214/0x2d8 [vfio_pci_core]
[14201.974959]  vfio_pci_config_rw+0x1d8/0x1290 [vfio_pci_core]
[14201.974962]  vfio_pci_rw+0x118/0x200 [vfio_pci_core]
[14201.974965]  vfio_pci_core_write+0x28/0x40 [vfio_pci_core]
[14201.974968]  vfio_device_fops_write+0x3c/0x58 [vfio]
[14201.974971]  vfs_write+0xd8/0x400
[14201.974973]  __arm64_sys_pwrite64+0xac/0xe0
[14201.974974]  invoke_syscall+0x50/0x120
[14201.974976]  el0_svc_common.constprop.0+0xc8/0xf0
[14201.974978]  do_el0_svc+0x24/0x38
[14201.974979]  el0_svc+0x38/0x130
[14201.974982]  el0t_64_sync_handler+0xc8/0xd0
[14201.974984]  el0t_64_sync+0x1ac/0x1b0
[14201.975025] Disabling lock debugging due to kernel taint

This value (0xfefefefefefefefe) is very special - it's a "poison" value.
QEMU or the VFIO driver may have attempted to access or manipulate a
page that has already been freed.

Thanks in advance for any insights!
Jinqian



