Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0474FF8850
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 02:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RkvcX8B1hwT/8VO32VTdl7opKUePM7Ger8bM8HBgqvs=; b=Uu4bnGTXLDJRtolvZQ74/KOh+J
	uZTXCaZQ4RuxhQig0p509faz7BuBGuoybnBd2jrPNtbHGyjbd2qndVW/u0mH4m6CMxxakDXxyqzEG
	jcpTX+hVnrFKLzEVosyDhhkfCtiypaF/liXHmG7ZaokmVzS8nXVxnuLOYJ2g+CZlEemVA1DrS1lak
	B32HINiZMhFgXKfmqKoa7rf2zg8ItFmPC5kPgFs0hY+p0JIO3s6fkpp0WDuBe0vIh4aVl3Fw9HQ7Z
	MEFi5OHbdynhGmyZ6+st+nU6plXss+w2XuVFn76+bH7NyYUguQumVI+CgG02dU41yueWpzsNTzYsO
	9OS+NVXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHBki-0000000G3Nu-0Quk;
	Mon, 27 Apr 2026 02:31:16 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHBke-0000000G3N3-3aA4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 02:31:14 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=RkvcX8B1hwT/8VO32VTdl7opKUePM7Ger8bM8HBgqvs=;
	b=CqeEq2o5z+a8QIlsmg8wSB8gWS67ggAqurzsOzpkUy44lSjGbSyjZ21YT3CVufajUHB7H7szM
	woPuuAL0nsC2WVtXWwiigsWgmMTEHDt1jhQ00oryV6EhD2Zo12GW0cTHOr3JdjkkWVoAsNQ06yu
	5JDJpatDiOwUQTcdPom603M=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4g3nSQ63TtzcZyv;
	Mon, 27 Apr 2026 10:24:06 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 4FA8F40571;
	Mon, 27 Apr 2026 10:30:58 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 27 Apr
 2026 10:30:57 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>,
	<punit.agrawal@oss.qualcomm.com>, <rafael.j.wysocki@intel.com>,
	<fengchengwen@huawei.com>, <chenl311@chinatelecom.cn>,
	<suzuki.poulose@arm.com>, <maz@kernel.org>, <timothy.hayes@arm.com>,
	<lpieralisi@kernel.org>, <mrigendra.chaubey@gmail.com>, <arnd@arndb.de>,
	<sudeep.holla@kernel.org>, <yangyicong@hisilicon.com>, <jic23@kernel.org>,
	<pierre.gondois@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <james.morse@arm.com>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2] cpu/hotplug: Fix NULL kobject warning in cpuhp_smt_enable()
Date: Mon, 27 Apr 2026 10:35:07 +0800
Message-ID: <20260427023507.1247418-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_193113_210443_22AA5E1D 
X-CRM114-Status: GOOD (  15.54  )
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

On arm64, when booting with `maxcpus` greater than the number of present
CPUs (e.g., QEMU -smp cpus=4,maxcpus=8), some CPUs are marked as 'present'
but have not yet been registered via register_cpu(). Consequently,
the per-cpu device objects for these CPUs are not yet initialized.

In cpuhp_smt_enable(), the code iterates over all present CPUs. Calling
_cpu_up() for these unregistered CPUs eventually leads to
sysfs_create_group() being called with a NULL kobject (or a kobject
without a directory), triggering the following warning in
fs/sysfs/group.c:

	if (WARN_ON(!kobj || (!update && !kobj->sd)))
		return -EINVAL;

When booting with ACPI, arm64 smp_prepare_cpus() currently sets all
enumerated CPUs as "present" regardless of their status in the MADT. This
causes issues with SMT hotplug control. For instance, with QEMU's
"-smp 4,maxcpus=8" configuration, the MADT GICC entries are populated as
follows: the first four CPUs are marked Enabled while the remaining four
are marked Online Capable to support potential hot-plugging.

Fix this by:

1. When booting with ACPI, checking the ACPI_MADT_ENABLED flag in the GICC
   entry before calling set_cpu_present() during SMP initialization.

2. Properly managing the present mask in acpi_map_cpu() and
   acpi_unmap_cpu() to support actual CPU hotplug events, This aligns with
   other architectures like x86 and LoongArch.

This ensures that only physically available or explicitly enabled CPUs
are in the present mask, keeping the SMT control logic consistent with
the actual hardware state.

How to reproduce:

	1. echo off > /sys/devices/system/cpu/smt/control
		psci: CPU1 killed (polled 0 ms)
		psci: CPU3 killed (polled 0 ms)

	2. echo 2 > /sys/devices/system/cpu/smt/control

	Detected PIPT I-cache on CPU1
	GICv3: CPU1: found redistributor 1 region 0:0x00000000080c0000
	CPU1: Booted secondary processor 0x0000000001 [0x410fd082]
	Detected PIPT I-cache on CPU3
	GICv3: CPU3: found redistributor 3 region 0:0x0000000008100000
	CPU3: Booted secondary processor 0x0000000003 [0x410fd082]
	------------[ cut here ]------------
	WARNING: fs/sysfs/group.c:137 at internal_create_group+0x41c/0x4bc, CPU#2: sh/181
	Modules linked in:
	CPU: 2 UID: 0 PID: 181 Comm: sh Not tainted 7.0.0-rc1-00010-g8d13386c7624 #142 PREEMPT
	Hardware name: QEMU KVM Virtual Machine, BIOS 0.0.0 02/06/2015
	pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
	pc : internal_create_group+0x41c/0x4bc
	lr : sysfs_create_group+0x18/0x24
	sp : ffff80008078ba40
	x29: ffff80008078ba40 x28: ffff296c980ad000 x27: ffff00007fb94128
	x26: 0000000000000054 x25: ffffd693e845f3f0 x24: 0000000000000001
	x23: 0000000000000001 x22: 0000000000000004 x21: 0000000000000000
	x20: ffffd693e845fc10 x19: 0000000000000004 x18: 00000000ffffffff
	x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
	x14: 0000000000000358 x13: 0000000000000007 x12: 0000000000000350
	x11: 0000000000000008 x10: 0000000000000407 x9 : 0000000000000400
	x8 : ffff00007fbf3b60 x7 : 0000000000000000 x6 : ffffd693e845f3f0
	x5 : ffff00007fb94128 x4 : 0000000000000000 x3 : ffff000000f4eac0
	x2 : ffffd693e7095a08 x1 : 0000000000000000 x0 : 0000000000000000
	Call trace:
	 internal_create_group+0x41c/0x4bc (P)
	 sysfs_create_group+0x18/0x24
	 topology_add_dev+0x1c/0x28
	 cpuhp_invoke_callback+0x104/0x20c
	 __cpuhp_invoke_callback_range+0x94/0x11c
	 _cpu_up+0x200/0x37c
	 cpuhp_smt_enable+0xbc/0x114
	 control_store+0xe8/0x1d4
	 dev_attr_store+0x18/0x2c
	 sysfs_kf_write+0x7c/0x94
	 kernfs_fop_write_iter+0x128/0x1b8
	 vfs_write+0x2b0/0x354
	 ksys_write+0x68/0xfc
	 __arm64_sys_write+0x1c/0x28
	 invoke_syscall+0x48/0x10c
	 el0_svc_common.constprop.0+0x40/0xe8
	 do_el0_svc+0x20/0x2c
	 el0_svc+0x34/0x124
	 el0t_64_sync_handler+0xa0/0xe4
	 el0t_64_sync+0x198/0x19c
	---[ end trace 0000000000000000 ]---

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: James Morse <james.morse@arm.com>
Cc: Yicong Yang <yangyicong@hisilicon.com>
Cc: stable@vger.kernel.org
Link: https://uefi.org/specs/ACPI/6.5/05_ACPI_Software_Programming_Model.html#gic-cpu-interface-gicc-structure
Fixes: eed4583bcf9a6 ("arm64: Kconfig: Enable HOTPLUG_SMT")
Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/acpi.c |  2 ++
 arch/arm64/kernel/smp.c  | 12 +++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index 5891f92c2035..681aa2bbc399 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -448,12 +448,14 @@ int acpi_map_cpu(acpi_handle handle, phys_cpuid_t physid, u32 apci_id,
 		return *pcpu;
 	}
 
+	set_cpu_present(*pcpu, true);
 	return 0;
 }
 EXPORT_SYMBOL(acpi_map_cpu);
 
 int acpi_unmap_cpu(int cpu)
 {
+	set_cpu_present(cpu, false);
 	return 0;
 }
 EXPORT_SYMBOL(acpi_unmap_cpu);
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 1aa324104afb..5932e5b30b71 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -566,6 +566,11 @@ struct acpi_madt_generic_interrupt *acpi_cpu_get_madt_gicc(int cpu)
 }
 EXPORT_SYMBOL_GPL(acpi_cpu_get_madt_gicc);
 
+static bool acpi_cpu_is_present(int cpu)
+{
+	return acpi_cpu_get_madt_gicc(cpu)->flags & ACPI_MADT_ENABLED;
+}
+
 /*
  * acpi_map_gic_cpu_interface - parse processor MADT entry
  *
@@ -670,6 +675,10 @@ static void __init acpi_parse_and_init_cpus(void)
 		early_map_cpu_to_node(i, acpi_numa_get_nid(i));
 }
 #else
+static bool acpi_cpu_is_present(int cpu)
+{
+	return false;
+}
 #define acpi_parse_and_init_cpus(...)	do { } while (0)
 #endif
 
@@ -808,7 +817,8 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 		if (err)
 			continue;
 
-		set_cpu_present(cpu, true);
+		if (acpi_disabled || acpi_cpu_is_present(cpu))
+			set_cpu_present(cpu, true);
 		numa_store_cpu_info(cpu);
 	}
 }
-- 
2.34.1


