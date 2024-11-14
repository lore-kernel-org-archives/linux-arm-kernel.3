Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7626AD65C6C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 10:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZLvt6rFYTSRmrKjlh7enWtSJg9ZauHU9LAg9zI7MSY=; b=mxk0uz8oP1EnXiRTQRYEVcBKX9
	6zdnRslBjnRKCNeXk+nD2aizFzuMQuBK3Npx46utfrdHqkhv32q5t8uy+oT5AF7IRTuJ9Kt9EwUJs
	34OjKRHYIatMCTZ6w1Hih3q1gKpxiLG11HtBX30r5csbR79bk/c1iGG/J47NNRQZwGUzqPdIDWPmn
	Bzgbm5XQVaOUuMsT0ZQ6cmRahD5R0u2acf6tVg6XG7n29/cxwYaKdIG15paB2uN0vvihBeW/O92ZH
	swAIWvn7s5lsIxAQs+kBCg82tQajpHb1eF3IV/rNhWsZCP/oCNlSVPEiRAANh4DX2zDRsMt36tf3t
	ZT4tZLag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBX0t-00000009WJ3-2mIb;
	Thu, 14 Nov 2024 10:23:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWlp-00000009T86-1gqj;
	Thu, 14 Nov 2024 10:08:21 +0000
X-UUID: 58faf8aaa27011ef9048ed6ed365623b-20241114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BZLvt6rFYTSRmrKjlh7enWtSJg9ZauHU9LAg9zI7MSY=;
	b=Vxos/rBkI/iMFVM5jENukpdgmYaX3B2ck9XTC/xyvrWgQtHEx2KjhbmgoVbFW5bnnfA528c7za25oyR584mZP6WxkDIucsH2kuu8XujM1u8KYPjraPWe8sXrEqirepSiDSYOQz6x7Hd+qIG8hXXnOqP9jpl+geSYlbVCml+lN9A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:bbcd213e-b6dd-46f0-80f1-1f8293c4d382,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0fcdc3,CLOUDID:116c1307-6ce0-4172-9755-bd2287e50583,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 58faf8aaa27011ef9048ed6ed365623b-20241114
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <liju-clr.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1363328128; Thu, 14 Nov 2024 03:08:08 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Nov 2024 18:08:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Nov 2024 18:08:05 +0800
From: Liju-clr Chen <liju-clr.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Richard Cochran
	<richardcochran@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liju-clr Chen <Liju-clr.Chen@mediatek.com>, Yingshiuan Pan
	<Yingshiuan.Pan@mediatek.com>, Ze-yu Wang <Ze-yu.Wang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-trace-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <PeiLun.Suei@mediatek.com>, Chi-shen Yeh
	<Chi-shen.Yeh@mediatek.com>, Kevenny Hsieh <Kevenny.Hsieh@mediatek.com>
Subject: [PATCH v13 16/25] virt: geniezone: Add demand paging support
Date: Thu, 14 Nov 2024 18:07:53 +0800
Message-ID: <20241114100802.4116-17-liju-clr.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241114100802.4116-1-liju-clr.chen@mediatek.com>
References: <20241114100802.4116-1-liju-clr.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_020813_517960_30816EBF 
X-CRM114-Status: GOOD (  29.80  )
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

From: Yingshiuan Pan <yingshiuan.pan@mediatek.com>

This page fault handler helps GenieZone hypervisor to do demand paging.
On a lower level translation fault, GenieZone hypervisor will first
check the fault GPA (guest physical address or IPA in ARM) is valid
e.g. within the registered memory region, then it will setup the
vcpu_run->exit_reason with necessary information for returning to
gzvm driver.

With the fault information, the gzvm driver looks up the physical
address and call the MT_HVC_GZVM_MAP_GUEST to request the hypervisor
maps the found PA to the fault GPA (IPA).

There is one exception, for protected vm, we will populate full VM's
memory region in advance in order to improve performance.

Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
Co-developed-by: Jerry Wang <ze-yu.wang@mediatek.com>
Signed-off-by: Jerry Wang <ze-yu.wang@mediatek.com>
Co-developed-by: Kevenny Hsieh <kevenny.hsieh@mediatek.com>
Signed-off-by: Kevenny Hsieh <kevenny.hsieh@mediatek.com>
Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
---
 arch/arm64/geniezone/gzvm_arch_common.h |  2 ++
 arch/arm64/geniezone/vm.c               | 13 +++++++
 drivers/virt/geniezone/Makefile         |  3 +-
 drivers/virt/geniezone/gzvm_exception.c | 39 ++++++++++++++++++++
 drivers/virt/geniezone/gzvm_main.c      |  2 ++
 drivers/virt/geniezone/gzvm_mmu.c       | 41 +++++++++++++++++++++
 drivers/virt/geniezone/gzvm_vcpu.c      |  6 ++--
 drivers/virt/geniezone/gzvm_vm.c        | 48 ++++++++++++++++++++++++-
 include/linux/soc/mediatek/gzvm_drv.h   | 14 ++++++++
 include/uapi/linux/gzvm.h               | 13 +++++++
 10 files changed, 177 insertions(+), 4 deletions(-)
 create mode 100644 drivers/virt/geniezone/gzvm_exception.c

diff --git a/arch/arm64/geniezone/gzvm_arch_common.h b/arch/arm64/geniezone/gzvm_arch_common.h
index 4366618cdc0a..928191e3cdb2 100644
--- a/arch/arm64/geniezone/gzvm_arch_common.h
+++ b/arch/arm64/geniezone/gzvm_arch_common.h
@@ -24,6 +24,7 @@ enum {
 	GZVM_FUNC_INFORM_EXIT = 14,
 	GZVM_FUNC_MEMREGION_PURPOSE = 15,
 	GZVM_FUNC_SET_DTB_CONFIG = 16,
+	GZVM_FUNC_MAP_GUEST = 17,
 	NR_GZVM_FUNC,
 };
 
@@ -48,6 +49,7 @@ enum {
 #define MT_HVC_GZVM_INFORM_EXIT		GZVM_HCALL_ID(GZVM_FUNC_INFORM_EXIT)
 #define MT_HVC_GZVM_MEMREGION_PURPOSE	GZVM_HCALL_ID(GZVM_FUNC_MEMREGION_PURPOSE)
 #define MT_HVC_GZVM_SET_DTB_CONFIG	GZVM_HCALL_ID(GZVM_FUNC_SET_DTB_CONFIG)
+#define MT_HVC_GZVM_MAP_GUEST		GZVM_HCALL_ID(GZVM_FUNC_MAP_GUEST)
 
 #define GIC_V3_NR_LRS			16
 
diff --git a/arch/arm64/geniezone/vm.c b/arch/arm64/geniezone/vm.c
index ac3d163a40fd..53e487912d2c 100644
--- a/arch/arm64/geniezone/vm.c
+++ b/arch/arm64/geniezone/vm.c
@@ -378,15 +378,28 @@ int gzvm_vm_ioctl_arch_enable_cap(struct gzvm *gzvm,
 				  struct gzvm_enable_cap *cap,
 				  void __user *argp)
 {
+	struct arm_smccc_res res = {0};
 	int ret;
 
 	switch (cap->cap) {
 	case GZVM_CAP_PROTECTED_VM:
 		ret = gzvm_vm_ioctl_cap_pvm(gzvm, cap, argp);
 		return ret;
+	case GZVM_CAP_ENABLE_DEMAND_PAGING:
+		ret = gzvm_vm_arch_enable_cap(gzvm, cap, &res);
+		return ret;
 	default:
 		break;
 	}
 
 	return -EINVAL;
 }
+
+int gzvm_arch_map_guest(u16 vm_id, int memslot_id, u64 pfn, u64 gfn,
+			u64 nr_pages)
+{
+	struct arm_smccc_res res;
+
+	return gzvm_hypcall_wrapper(MT_HVC_GZVM_MAP_GUEST, vm_id, memslot_id,
+				    pfn, gfn, nr_pages, 0, 0, &res);
+}
diff --git a/drivers/virt/geniezone/Makefile b/drivers/virt/geniezone/Makefile
index e0451145215d..f62f91f02640 100644
--- a/drivers/virt/geniezone/Makefile
+++ b/drivers/virt/geniezone/Makefile
@@ -8,4 +8,5 @@ GZVM_DIR ?= ../../../drivers/virt/geniezone
 
 gzvm-y := $(GZVM_DIR)/gzvm_main.o $(GZVM_DIR)/gzvm_vm.o \
 	  $(GZVM_DIR)/gzvm_vcpu.o $(GZVM_DIR)/gzvm_irqfd.o \
-	  $(GZVM_DIR)/gzvm_ioeventfd.o $(GZVM_DIR)/gzvm_mmu.o
+	  $(GZVM_DIR)/gzvm_ioeventfd.o $(GZVM_DIR)/gzvm_mmu.o \
+	  $(GZVM_DIR)/gzvm_exception.o
diff --git a/drivers/virt/geniezone/gzvm_exception.c b/drivers/virt/geniezone/gzvm_exception.c
new file mode 100644
index 000000000000..2f5c05045e61
--- /dev/null
+++ b/drivers/virt/geniezone/gzvm_exception.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 MediaTek Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/soc/mediatek/gzvm_drv.h>
+
+/**
+ * gzvm_handle_guest_exception() - Handle guest exception
+ * @vcpu: Pointer to struct gzvm_vcpu_run in userspace
+ * Return:
+ * * true - This exception has been processed, no need to back to VMM.
+ * * false - This exception has not been processed, require userspace.
+ */
+bool gzvm_handle_guest_exception(struct gzvm_vcpu *vcpu)
+{
+	int ret;
+
+	for (int i = 0; i < ARRAY_SIZE(vcpu->run->exception.reserved); i++) {
+		if (vcpu->run->exception.reserved[i])
+			return false;
+	}
+
+	switch (vcpu->run->exception.exception) {
+	case GZVM_EXCEPTION_PAGE_FAULT:
+		ret = gzvm_handle_page_fault(vcpu);
+		break;
+	case GZVM_EXCEPTION_UNKNOWN:
+		fallthrough;
+	default:
+		ret = -EFAULT;
+	}
+
+	if (!ret)
+		return true;
+	else
+		return false;
+}
diff --git a/drivers/virt/geniezone/gzvm_main.c b/drivers/virt/geniezone/gzvm_main.c
index 60348b88cd24..6142d1d792a4 100644
--- a/drivers/virt/geniezone/gzvm_main.c
+++ b/drivers/virt/geniezone/gzvm_main.c
@@ -36,6 +36,8 @@ int gzvm_err_to_errno(unsigned long err)
 		return 0;
 	case ERR_NO_MEMORY:
 		return -ENOMEM;
+	case ERR_INVALID_ARGS:
+		return -EINVAL;
 	case ERR_NOT_SUPPORTED:
 		fallthrough;
 	case ERR_NOT_IMPLEMENTED:
diff --git a/drivers/virt/geniezone/gzvm_mmu.c b/drivers/virt/geniezone/gzvm_mmu.c
index 743df8976dfd..dcc8c4d7be83 100644
--- a/drivers/virt/geniezone/gzvm_mmu.c
+++ b/drivers/virt/geniezone/gzvm_mmu.c
@@ -101,3 +101,44 @@ int gzvm_vm_allocate_guest_page(struct gzvm *vm, struct gzvm_memslot *slot,
 
 	return 0;
 }
+
+static int handle_single_demand_page(struct gzvm *vm, int memslot_id, u64 gfn)
+{
+	int ret;
+	u64 pfn;
+
+	ret = gzvm_vm_allocate_guest_page(vm, &vm->memslot[memslot_id], gfn, &pfn);
+	if (unlikely(ret))
+		return -EFAULT;
+
+	ret = gzvm_arch_map_guest(vm->vm_id, memslot_id, pfn, gfn, 1);
+	if (unlikely(ret))
+		return -EFAULT;
+	return ret;
+}
+
+/**
+ * gzvm_handle_page_fault() - Handle guest page fault, find corresponding page
+ *                            for the faulting gpa
+ * @vcpu: Pointer to struct gzvm_vcpu_run of the faulting vcpu
+ *
+ * Return:
+ * * 0		- Success to handle guest page fault
+ * * -EFAULT	- Failed to map phys addr to guest's GPA
+ */
+int gzvm_handle_page_fault(struct gzvm_vcpu *vcpu)
+{
+	struct gzvm *vm = vcpu->gzvm;
+	int memslot_id;
+	u64 gfn;
+
+	gfn = PHYS_PFN(vcpu->run->exception.fault_gpa);
+	memslot_id = gzvm_find_memslot(vm, gfn);
+	if (unlikely(memslot_id < 0))
+		return -EFAULT;
+
+	if (unlikely(vm->mem_alloc_mode == GZVM_FULLY_POPULATED))
+		return -EFAULT;
+
+	return handle_single_demand_page(vm, memslot_id, gfn);
+}
diff --git a/drivers/virt/geniezone/gzvm_vcpu.c b/drivers/virt/geniezone/gzvm_vcpu.c
index 446c0e42dec6..3f6bffbafc7a 100644
--- a/drivers/virt/geniezone/gzvm_vcpu.c
+++ b/drivers/virt/geniezone/gzvm_vcpu.c
@@ -112,9 +112,11 @@ static long gzvm_vcpu_run(struct gzvm_vcpu *vcpu, void __user *argp)
 		 * it's geniezone's responsibility to fill corresponding data
 		 * structure
 		 */
-		case GZVM_EXIT_HYPERCALL:
-			fallthrough;
 		case GZVM_EXIT_EXCEPTION:
+			if (!gzvm_handle_guest_exception(vcpu))
+				need_userspace = true;
+			break;
+		case GZVM_EXIT_HYPERCALL:
 			fallthrough;
 		case GZVM_EXIT_DEBUG:
 			fallthrough;
diff --git a/drivers/virt/geniezone/gzvm_vm.c b/drivers/virt/geniezone/gzvm_vm.c
index 12f2c3c3810f..f63487809148 100644
--- a/drivers/virt/geniezone/gzvm_vm.c
+++ b/drivers/virt/geniezone/gzvm_vm.c
@@ -29,6 +29,31 @@ int gzvm_gfn_to_hva_memslot(struct gzvm_memslot *memslot, u64 gfn,
 	return 0;
 }
 
+/**
+ * gzvm_find_memslot() - Find memslot containing this @gpa
+ * @vm: Pointer to struct gzvm
+ * @gfn: Guest frame number
+ *
+ * Return:
+ * * >=0		- Index of memslot
+ * * -EFAULT		- Not found
+ */
+int gzvm_find_memslot(struct gzvm *vm, u64 gfn)
+{
+	int i;
+
+	for (i = 0; i < GZVM_MAX_MEM_REGION; i++) {
+		if (vm->memslot[i].npages == 0)
+			continue;
+
+		if (gfn >= vm->memslot[i].base_gfn &&
+		    gfn < vm->memslot[i].base_gfn + vm->memslot[i].npages)
+			return i;
+	}
+
+	return -EFAULT;
+}
+
 /**
  * register_memslot_addr_range() - Register memory region to GenieZone
  * @gzvm: Pointer to struct gzvm
@@ -60,7 +85,10 @@ register_memslot_addr_range(struct gzvm *gzvm, struct gzvm_memslot *memslot)
 	}
 
 	free_pages_exact(region, buf_size);
-	return 0;
+
+	if (gzvm->mem_alloc_mode == GZVM_DEMAND_PAGING)
+		return 0;
+	return gzvm_vm_populate_mem_region(gzvm, memslot->slot_id);
 }
 
 /**
@@ -349,6 +377,22 @@ static const struct file_operations gzvm_vm_fops = {
 	.unlocked_ioctl = gzvm_vm_ioctl,
 };
 
+static int setup_mem_alloc_mode(struct gzvm *vm)
+{
+	int ret;
+	struct gzvm_enable_cap cap = {0};
+
+	cap.cap = GZVM_CAP_ENABLE_DEMAND_PAGING;
+
+	ret = gzvm_vm_ioctl_enable_cap(vm, &cap, NULL);
+	if (!ret)
+		vm->mem_alloc_mode = GZVM_DEMAND_PAGING;
+	else
+		vm->mem_alloc_mode = GZVM_FULLY_POPULATED;
+
+	return 0;
+}
+
 static struct gzvm *gzvm_create_vm(struct gzvm_driver *drv, unsigned long vm_type)
 {
 	int ret;
@@ -385,6 +429,8 @@ static struct gzvm *gzvm_create_vm(struct gzvm_driver *drv, unsigned long vm_typ
 		return ERR_PTR(ret);
 	}
 
+	setup_mem_alloc_mode(gzvm);
+
 	mutex_lock(&gzvm_list_lock);
 	list_add(&gzvm->vm_list, &gzvm_list);
 	mutex_unlock(&gzvm_list_lock);
diff --git a/include/linux/soc/mediatek/gzvm_drv.h b/include/linux/soc/mediatek/gzvm_drv.h
index 920af91ea576..1a722121ff82 100644
--- a/include/linux/soc/mediatek/gzvm_drv.h
+++ b/include/linux/soc/mediatek/gzvm_drv.h
@@ -45,6 +45,7 @@ struct gzvm_driver {
  */
 #define NO_ERROR                (0)
 #define ERR_NO_MEMORY           (-5)
+#define ERR_INVALID_ARGS        (-8)
 #define ERR_NOT_SUPPORTED       (-24)
 #define ERR_NOT_IMPLEMENTED     (-27)
 #define ERR_FAULT               (-40)
@@ -59,6 +60,11 @@ struct gzvm_driver {
 
 #define GZVM_VCPU_RUN_MAP_SIZE		(PAGE_SIZE * 2)
 
+enum gzvm_demand_paging_mode {
+	GZVM_FULLY_POPULATED = 0,
+	GZVM_DEMAND_PAGING = 1,
+};
+
 /**
  * struct mem_region_addr_range: identical to ffa memory constituent
  * @address: the base IPA of the constituent memory region, aligned to 4 kiB
@@ -137,6 +143,7 @@ struct gzvm_pinned_page {
  * @irq_lock: lock for irq injection
  * @pinned_pages: use rb-tree to record pin/unpin page
  * @mem_lock: lock for memory operations
+ * @mem_alloc_mode: memory allocation mode - fully allocated or demand paging
  */
 struct gzvm {
 	struct gzvm_driver *gzvm_drv;
@@ -161,6 +168,7 @@ struct gzvm {
 	struct hlist_head irq_ack_notifier_list;
 	struct srcu_struct irq_srcu;
 	struct mutex irq_lock;
+	u32 mem_alloc_mode;
 
 	struct rb_root pinned_pages;
 	struct mutex mem_lock;
@@ -183,6 +191,8 @@ int gzvm_arch_set_memregion(u16 vm_id, size_t buf_size,
 int gzvm_arch_check_extension(struct gzvm *gzvm, __u64 cap, void __user *argp);
 int gzvm_arch_create_vm(unsigned long vm_type);
 int gzvm_arch_destroy_vm(u16 vm_id);
+int gzvm_arch_map_guest(u16 vm_id, int memslot_id, u64 pfn, u64 gfn,
+			u64 nr_pages);
 int gzvm_vm_ioctl_arch_enable_cap(struct gzvm *gzvm,
 				  struct gzvm_enable_cap *cap,
 				  void __user *argp);
@@ -201,6 +211,10 @@ int gzvm_arch_vcpu_run(struct gzvm_vcpu *vcpu, __u64 *exit_reason);
 int gzvm_arch_destroy_vcpu(u16 vm_id, int vcpuid);
 int gzvm_arch_inform_exit(u16 vm_id);
 
+int gzvm_find_memslot(struct gzvm *vm, u64 gpa);
+int gzvm_handle_page_fault(struct gzvm_vcpu *vcpu);
+bool gzvm_handle_guest_exception(struct gzvm_vcpu *vcpu);
+
 int gzvm_arch_create_device(u16 vm_id, struct gzvm_create_device *gzvm_dev);
 int gzvm_arch_inject_irq(struct gzvm *gzvm, unsigned int vcpu_idx,
 			 u32 irq, bool level);
diff --git a/include/uapi/linux/gzvm.h b/include/uapi/linux/gzvm.h
index 7aec4adf2206..61a7a87b3d23 100644
--- a/include/uapi/linux/gzvm.h
+++ b/include/uapi/linux/gzvm.h
@@ -18,6 +18,7 @@
 
 #define GZVM_CAP_VM_GPA_SIZE	0xa5
 #define GZVM_CAP_PROTECTED_VM	0xffbadab1
+#define GZVM_CAP_ENABLE_DEMAND_PAGING	0x9202
 
 /* sub-commands put in args[0] for GZVM_CAP_PROTECTED_VM */
 #define GZVM_CAP_PVM_SET_PVMFW_GPA		0
@@ -186,6 +187,12 @@ enum {
 	GZVM_EXIT_GZ = 0x9292000a,
 };
 
+/* exception definitions of GZVM_EXIT_EXCEPTION */
+enum {
+	GZVM_EXCEPTION_UNKNOWN = 0x0,
+	GZVM_EXCEPTION_PAGE_FAULT = 0x1,
+};
+
 /**
  * struct gzvm_vcpu_run: Same purpose as kvm_run, this struct is
  *			 shared between userspace, kernel and
@@ -250,6 +257,12 @@ struct gzvm_vcpu_run {
 			__u32 exception;
 			/* Exception error codes */
 			__u32 error_code;
+			/* Fault GPA (guest physical address or IPA in ARM) */
+			__u64 fault_gpa;
+			/* Future-proof reservation and reset to zero in hypervisor.
+			 * Fill up to the union size, 256 bytes.
+			 */
+			__u64 reserved[30];
 		} exception;
 		/* GZVM_EXIT_HYPERCALL */
 		struct {
-- 
2.18.0


