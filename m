Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C935D2E9F0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 14:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dkmKDTA4eCKDEI//A1ircLOoxxitmq8ECJ4imtJktaA=; b=2BMj+MBuQFA8sfqukZFf0UOtc3
	gxW2OQ1F06opikyzi3XtxkvMiASe4+wd/Lt+ycPOuM3iuijXaZHSGYjj/e9riEpTnYTGU+Z+MUq2h
	QGpas8PcbAA7blfS1lPw3Lb07NclJY+TK5aLVC6LFR14pzr026wgWoPsbXXQdqq7wm/ND2m0ONHL6
	M5avkC8q3kIJvWZ2arPENXp4ItT4x7SuB15wJzhfBDGCIrx7I4mJoZqOZqlhIbKcXbh1/YLVjT1iV
	Iz6464o1hcDiQGxiDSgUSlelyWvxYtk2Ed7vHKE5i514YblruwaUcnSmv6Ou2/1z6FPMvhdStXS5l
	ErUKeLAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVTV-00000000KrC-47hz;
	Mon, 11 Nov 2024 14:33:05 +0000
Received: from m16.mail.126.com ([117.135.210.6])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVPO-00000000K83-1uKn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 14:28:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=dkmKD
	TA4eCKDEI//A1ircLOoxxitmq8ECJ4imtJktaA=; b=Cn+9OEsi3eTfVYJ8b/74o
	ZYj5TVgZNfpWqJhRW/DISJhnvuqlENCeOOdK8GQ9Cauq6Hhuu52RI5DrJCGP21jL
	2knbZyxlKx4xZNzZJiS1YSfY5mZ1MHN8QpYdVhtS16vE2h5Hlquw1fb5DxEmt+Q1
	sy/1xZd1S2WVr4jU1ZVzUw=
Received: from nilq-virtual-machine.. (unknown [60.24.211.208])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3X9aCFDJnGJjQBg--.59279S2;
	Mon, 11 Nov 2024 22:28:19 +0800 (CST)
From: niliqiang <ni_liqiang@126.com>
To: will@kernel.org,
	robin.murphy@arm.com,
	joro@8bytes.org
Cc: linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ni.liqiang@zte.com.cn,
	"ni.liqiang" <ni_liqiang@126.com>,
	"li . zhichao" <li.zhichao@zte.com.cn>,
	"ma . weichao" <ma.weichao@zte.com.cn>
Subject: [PATCH] drivers/iommu: Protect STE base address in multi-core and multi-process concurrent scenarios
Date: Mon, 11 Nov 2024 22:28:00 +0800
Message-Id: <20241111142800.63760-1-ni_liqiang@126.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3X9aCFDJnGJjQBg--.59279S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxKFyUKw1fJw4UKF1UJrW7CFg_yoW7CrWUpa
	1qkFySyr1UXFZrCFZ7J3yUZF95Ka9Y9a4akr48G3sxuF4qyryYyr17tryakr1kCrWUAFy3
	Jr929w45u3WrArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UszV8UUUUU=
X-Originating-IP: [60.24.211.208]
X-CM-SenderInfo: xqlbzxxtld0wa6rslhhfrp/1tbirwmU5WcyD0MhgQAAsu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_062851_495536_9100C613 
X-CRM114-Status: GOOD (  14.81  )
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

From: "ni.liqiang" <ni_liqiang@126.com>

Background information
======================

During the testing of our self-developed FPGA test board based on
linux 5.10.134, we identified an issue when concurrently loading drivers
for different PCIe peripherals, specifically with BDF numbers 0001:81:00.0
and 0001:81:00.1, in a multi-core, multi-process setup. 
During this process, the SMMU_STRTAB_BASE was allocated multiple times,
leading to errors in the STE content.
To address this, we referred to a relevant patch(https://lore.kernel.org/
linux-arm-kernel/20210401154718.307519-8-jean-philippe@linaro.org/)
from the Linux 5.13 kernel and introduced a mutex to ensure that
in the context of a single SMMU instance, the SMMU_STRTAB_BASE for devices
of the same type is only allocated once during concurrent operations.
Our testing confirmed that the issue of duplicate SMMU_STRTAB_BASE
allocation was resolved.

The issues
==========

I would like to know whether this is a known flaw in the Linux 5.10 kernel?
And is adding a mutex the correct and reasonable solution to this problem?

The call trace when two PCIe devices, each associated with a different
CPU, are accessed concurrently by two processes
======================================================================

> CPU: 3 PID: 433 Comm: systemd-udevd Tainted: G  OE  5.10.134-iommu #26
> Call trace:
>  dump_backtrace+0x0/0x208
>  show_stack+0x1c/0x28
>  dump_stack+0xd4/0x128
>  arm_smmu_write_strtab_ent+0xa0/0x3a8
>  arm_smmu_probe_device+0x1e0/0x670
>  __iommu_probe_device+0x5c/0x2a0
>  iommu_probe_device+0x2c/0x128
>  iort_iommu_configure_id+0x17c/0x240
>  acpi_dma_configure_id+0x8c/0xb8
>  pci_dma_configure+0xa8/0xc8
>  really_probe+0x74/0x420
>  __driver_probe_device+0x114/0x188
>  driver_probe_device+0x44/0x110
>  __driver_attach+0xbc/0x1a0
>  bus_for_each_dev+0x78/0xc8
>  driver_attach+0x28/0x30
>  bus_add_driver+0x1a4/0x248
>  driver_register+0x68/0x118
>  __pci_register_driver+0x48/0x50
>  dh_pf_pci_init_module+0x88/0x1000 [zg_pf]
>  do_one_initcall+0x50/0x268
>  do_init_module+0x4c/0x228
>  load_module+0x1998/0x1c70
>  __do_sys_finit_module+0xbc/0x120
>  __arm64_sys_finit_module+0x24/0x30
>  el0_svc_common+0xb8/0x208
>  do_el0_svc+0x88/0x90
>  el0_svc+0x1c/0x28
>  el0_sync_handler+0x88/0xb0
>  el0_sync+0x148/0x180
> CPU: 2 PID: 423 Comm: systemd-udevd Tainted: G  OE  5.10.134-iommu #26
> Call trace:
> zg_pf 0001:81:00.1: Adding to iommu group 8
>  dump_backtrace+0x0/0x208
>  show_stack+0x1c/0x28
>  dump_stack+0xd4/0x128
>  arm_smmu_write_strtab_ent+0xa0/0x3a8
>  arm_smmu_probe_device+0x1e0/0x670
>  __iommu_probe_device+0x5c/0x2a0
>  iommu_probe_device+0x2c/0x128
>  iort_iommu_configure_id+0x17c/0x240
>  acpi_dma_configure_id+0x8c/0xb8
>  pci_dma_configure+0xa8/0xc8
>  really_probe+0x74/0x420
>  __driver_probe_device+0x114/0x188
>  driver_probe_device+0x44/0x110
>  __driver_attach+0xbc/0x1a0
>  bus_for_each_dev+0x78/0xc8
>  driver_attach+0x28/0x30
>  bus_add_driver+0x1a4/0x248
>  driver_register+0x68/0x118
>  __pci_register_driver+0x48/0x50
>  init+0x44/0x1000 [zgm_pf]
>  do_one_initcall+0x50/0x268
>  do_init_module+0x4c/0x228
>  load_module+0x1998/0x1c70
>  __do_sys_finit_module+0xbc/0x120
>  __arm64_sys_finit_module+0x24/0x30
>  el0_svc_common+0xb8/0x208
>  do_el0_svc+0x88/0x90
>  el0_svc+0x1c/0x28
>  el0_sync_handler+0x88/0xb0
>  el0_sync+0x148/0x180
> zgm_pf 0001:81:00.0: Adding to iommu group 9

Signed-off-by: ni.liqiang <ni_liqiang@126.com>
Reviewed-by: li.zhichao <li.zhichao@zte.com.cn>
Tested-by: ma.weichao <ma.weichao@zte.com.cn>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 4 ++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 9ac7b3729..b5b58e53d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2346,6 +2346,7 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
        INIT_LIST_HEAD(&master->bonds);
        dev_iommu_priv_set(dev, master);
 
+       mutex_lock(&smmu->streams_mutex);
        /* Check the SIDs are in range of the SMMU and our stream table */
        for (i = 0; i < master->num_sids; i++) {
                u32 sid = master->sids[i];
@@ -2362,6 +2363,7 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
                                goto err_free_master;
                }
        }
+       mutex_unlock(&smmu->streams_mutex);
 
        master->ssid_bits = min(smmu->ssid_bits, fwspec->num_pasid_bits);
 
@@ -2818,6 +2820,8 @@ static int arm_smmu_init_structures(struct arm_smmu_device *smmu)
 {
        int ret;
 
+       mutex_init(&smmu->streams_mutex);
+
        ret = arm_smmu_init_queues(smmu);
        if (ret)
                return ret;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 57e5d223c..867b867b5 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -636,6 +636,8 @@ struct arm_smmu_device {
 
        /* IOMMU core code handle */
        struct iommu_device             iommu;
+
+       struct mutex                    streams_mutex;
 };
 
 /* SMMU private data for each master */
-- 
2.27.0


