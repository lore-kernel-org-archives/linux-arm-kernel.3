Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF397D65C6F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 10:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqgHf1P44U6+iXgzbbPS+DGRuZ/JJ1n6EooYA/AkJPM=; b=Z+p7sLqpjK21qsdgVqLvW/6Rcb
	PPATYqKilk8Uk1EV0vbSbvYQAhAmnAV6ttgSZhENhHYzsWi4tyr7Ta5ZCz1KXMmlVz/bbkL8jYkB0
	jtrk1rMRk4SGbxJigeM8C3bq4gO9xIlbVnpO4QrmmZNh1IbE9vlzv85qa4E5rULy9/kzqwDlT0zgD
	f6iJYsqk/C1f4IApFZXacF21m0Gtcqm+/MxX3WO3SaAmWu3s8AwSa9nd/NZArUJProefG7CBfBTGV
	xRoclNOD3nXCG853oqF51tXDN657OpLuT2GC5LhPrUOcBzu3MA1tYFx5MdVgkupEIwheUVX3fPkJE
	zG0ef03w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXSi-00000009cFv-3m7p;
	Thu, 14 Nov 2024 10:52:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWlz-00000009T8B-0KoO;
	Thu, 14 Nov 2024 10:08:31 +0000
X-UUID: 59ea0e86a27011ef82ff63e91e7eb18c-20241114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GqgHf1P44U6+iXgzbbPS+DGRuZ/JJ1n6EooYA/AkJPM=;
	b=C2N3zW6okpN9jReT9HE+88JEzioc7MIBZKXrlyqiTiJSlg/kmF6Jw/w9qtUEbK2Ib73VoccjNQXgoPMAc7UirZWoatN7kz+cFIWA1tfLRSY7Jlp74ySUHne5TLkVwMRYetPK6NIlP1j3icmGWb1iLXC/TtEmjFZi0int+yY8bEI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:0e9bd75f-7551-44ab-a5c1-c71ba509e619,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0fcdc3,CLOUDID:205f0c4f-a2ae-4b53-acd4-c3dc8f449198,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 59ea0e86a27011ef82ff63e91e7eb18c-20241114
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <liju-clr.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 596615033; Thu, 14 Nov 2024 03:08:10 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Nov 2024 18:08:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Nov 2024 18:08:06 +0800
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
Subject: [PATCH v13 23/25] virt: geniezone: Add support for guest VM CPU idle
Date: Thu, 14 Nov 2024 18:08:00 +0800
Message-ID: <20241114100802.4116-24-liju-clr.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241114100802.4116-1-liju-clr.chen@mediatek.com>
References: <20241114100802.4116-1-liju-clr.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_020823_312102_2D265D96 
X-CRM114-Status: GOOD (  23.34  )
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

From: Kevenny Hsieh <kevenny.hsieh@mediatek.com>

Implement CPU idle functionality for guest VMs, allowing the guest
VM's CPU to relinquish control to the host when it enters an idle
state. Enable the host to schedule other processes, thereby reducing
CPU usage and achieving power savings.

Introduce a new capability (`enable_idle_support`) to support the idle
feature. Emulate the WFI (Wait For Interrupt) instruction for the
guest VM when it enters an idle state. Allow the host Linux kernel to
schedule other processes and enable the vCPU to enter the `wait`
state. Ensure that the vCPU can be woken up by interrupts such as the
virtual timer (vtimer) and virtio interrupts.

With the idle feature, the vCPU can efficiently enter a lower power
state, such as decreasing CPU frequency or even entering an idle
state, thereby reducing CPU usage and improving overall system power
efficiency.

Signed-off-by: Kevenny Hsieh <kevenny.hsieh@mediatek.com>
Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
---
 arch/arm64/geniezone/vm.c               |  3 ++
 drivers/virt/geniezone/gzvm_exception.c | 46 +++++++++++++++++++++++++
 drivers/virt/geniezone/gzvm_vcpu.c      | 26 +++++++++++++-
 drivers/virt/geniezone/gzvm_vm.c        | 15 ++++++++
 include/linux/soc/mediatek/gzvm_drv.h   |  7 ++++
 include/uapi/linux/gzvm.h               |  2 ++
 6 files changed, 98 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/geniezone/vm.c b/arch/arm64/geniezone/vm.c
index fccdcd5b8c75..cfd0aeb865e5 100644
--- a/arch/arm64/geniezone/vm.c
+++ b/arch/arm64/geniezone/vm.c
@@ -449,6 +449,9 @@ int gzvm_vm_ioctl_arch_enable_cap(struct gzvm *gzvm,
 	case GZVM_CAP_BLOCK_BASED_DEMAND_PAGING:
 		ret = gzvm_vm_arch_enable_cap(gzvm, cap, &res);
 		return ret;
+	case GZVM_CAP_ENABLE_IDLE:
+		ret = gzvm_vm_arch_enable_cap(gzvm, cap, &res);
+		return ret;
 	default:
 		break;
 	}
diff --git a/drivers/virt/geniezone/gzvm_exception.c b/drivers/virt/geniezone/gzvm_exception.c
index 5ffee863e378..391168a3f737 100644
--- a/drivers/virt/geniezone/gzvm_exception.c
+++ b/drivers/virt/geniezone/gzvm_exception.c
@@ -5,6 +5,8 @@
 
 #include <linux/device.h>
 #include <linux/soc/mediatek/gzvm_drv.h>
+#include <linux/sched.h>
+#include <linux/rcuwait.h>
 
 /**
  * gzvm_handle_guest_exception() - Handle guest exception
@@ -59,3 +61,47 @@ bool gzvm_handle_guest_hvc(struct gzvm_vcpu *vcpu)
 		return gzvm_arch_handle_guest_hvc(vcpu);
 	}
 }
+
+static void vcpu_block_wait(struct gzvm_vcpu *vcpu)
+{
+	struct rcuwait *wait = &vcpu->wait;
+
+	prepare_to_rcuwait(wait);
+
+	while (true) {
+		set_current_state(TASK_INTERRUPTIBLE);
+		if (vcpu->idle_events.virtio_irq) {
+			vcpu->idle_events.virtio_irq = 0;
+			break;
+		}
+		if (vcpu->idle_events.vtimer_irq) {
+			vcpu->idle_events.vtimer_irq = 0;
+			break;
+		}
+		if (signal_pending(current))
+			break;
+		schedule();
+	}
+	finish_rcuwait(wait);
+}
+
+/**
+ * gzvm_handle_guest_idle() - Handle guest vm entering idle
+ * @vcpu: Pointer to struct gzvm_vcpu struct
+ * Return:
+ */
+int gzvm_handle_guest_idle(struct gzvm_vcpu *vcpu)
+{
+	int ret = 0;
+	u64 ns = 0;
+
+	ns = gzvm_vcpu_arch_get_timer_delay_ns(vcpu);
+
+	if (ns) {
+		gzvm_vtimer_set(vcpu, ns);
+		vcpu_block_wait(vcpu);
+		gzvm_vtimer_release(vcpu);
+	}
+
+	return ret;
+}
diff --git a/drivers/virt/geniezone/gzvm_vcpu.c b/drivers/virt/geniezone/gzvm_vcpu.c
index ba85a6ae04a0..247848ee126c 100644
--- a/drivers/virt/geniezone/gzvm_vcpu.c
+++ b/drivers/virt/geniezone/gzvm_vcpu.c
@@ -16,8 +16,29 @@
 /* maximum size needed for holding an integer */
 #define ITOA_MAX_LEN 12
 
+/**
+ * gzvm_vcpu_wakeup_all - wakes up all vCPUs associated with the specified
+ * gzvm.
+ * @gzvm: Pointer to gzvm structure.
+ */
+void gzvm_vcpu_wakeup_all(struct gzvm *gzvm)
+{
+	for (int i = 0; i < GZVM_MAX_VCPUS; i++) {
+		if (gzvm->vcpus[i]) {
+			gzvm->vcpus[i]->idle_events.virtio_irq += 1;
+			rcuwait_wake_up(&gzvm->vcpus[i]->wait);
+		}
+	}
+}
+
 static enum hrtimer_restart gzvm_vtimer_expire(struct hrtimer *hrt)
 {
+	struct gzvm_vcpu *vcpu;
+
+	vcpu = container_of(hrt, struct gzvm_vcpu, gzvm_vtimer);
+
+	gzvm_vcpu_wakeup_all(vcpu->gzvm);
+
 	return HRTIMER_NORESTART;
 }
 
@@ -111,7 +132,7 @@ static bool gzvm_vcpu_handle_mmio(struct gzvm_vcpu *vcpu)
 static long gzvm_vcpu_run(struct gzvm_vcpu *vcpu, void __user *argp)
 {
 	bool need_userspace = false;
-	u64 exit_reason = 0;
+	u64 exit_reason;
 
 	if (copy_from_user(vcpu->run, argp, sizeof(struct gzvm_vcpu_run)))
 		return -EFAULT;
@@ -160,6 +181,9 @@ static long gzvm_vcpu_run(struct gzvm_vcpu *vcpu, void __user *argp)
 			fallthrough;
 		case GZVM_EXIT_GZ:
 			break;
+		case GZVM_EXIT_IDLE:
+			gzvm_handle_guest_idle(vcpu);
+			break;
 		case GZVM_EXIT_UNKNOWN:
 			fallthrough;
 		default:
diff --git a/drivers/virt/geniezone/gzvm_vm.c b/drivers/virt/geniezone/gzvm_vm.c
index 2ce36ad8791b..999c8c586d7b 100644
--- a/drivers/virt/geniezone/gzvm_vm.c
+++ b/drivers/virt/geniezone/gzvm_vm.c
@@ -170,6 +170,7 @@ gzvm_vm_ioctl_set_memory_region(struct gzvm *gzvm,
 int gzvm_irqchip_inject_irq(struct gzvm *gzvm, unsigned int vcpu_idx,
 			    u32 irq, bool level)
 {
+	gzvm_vcpu_wakeup_all(gzvm);
 	return gzvm_arch_inject_irq(gzvm, vcpu_idx, irq, level);
 }
 
@@ -556,6 +557,18 @@ static int setup_mem_alloc_mode(struct gzvm *vm)
 	return 0;
 }
 
+static int enable_idle_support(struct gzvm *vm)
+{
+	int ret;
+	struct gzvm_enable_cap cap = {0};
+
+	cap.cap = GZVM_CAP_ENABLE_IDLE;
+	ret = gzvm_vm_ioctl_enable_cap(vm, &cap, NULL);
+	if (ret)
+		pr_info("Hypervisor doesn't support idle\n");
+	return ret;
+}
+
 static struct gzvm *gzvm_create_vm(struct gzvm_driver *drv, unsigned long vm_type)
 {
 	int ret;
@@ -604,6 +617,8 @@ static struct gzvm *gzvm_create_vm(struct gzvm_driver *drv, unsigned long vm_typ
 
 	pr_debug("VM-%u is created\n", gzvm->vm_id);
 
+	enable_idle_support(gzvm);
+
 	return gzvm;
 }
 
diff --git a/include/linux/soc/mediatek/gzvm_drv.h b/include/linux/soc/mediatek/gzvm_drv.h
index 901bc2fe28f1..54fa7aea7245 100644
--- a/include/linux/soc/mediatek/gzvm_drv.h
+++ b/include/linux/soc/mediatek/gzvm_drv.h
@@ -130,6 +130,11 @@ struct gzvm_vcpu {
 	struct gzvm_vcpu_run *run;
 	struct gzvm_vcpu_hwstate *hwstate;
 	struct hrtimer gzvm_vtimer;
+	struct {
+		u32 vtimer_irq;
+		u32 virtio_irq;
+	} idle_events;
+	struct rcuwait wait;
 };
 
 struct gzvm_pinned_page {
@@ -260,6 +265,8 @@ bool gzvm_handle_guest_exception(struct gzvm_vcpu *vcpu);
 int gzvm_handle_relinquish(struct gzvm_vcpu *vcpu, phys_addr_t ipa);
 bool gzvm_handle_guest_hvc(struct gzvm_vcpu *vcpu);
 bool gzvm_arch_handle_guest_hvc(struct gzvm_vcpu *vcpu);
+int gzvm_handle_guest_idle(struct gzvm_vcpu *vcpu);
+void gzvm_vcpu_wakeup_all(struct gzvm *gzvm);
 
 int gzvm_arch_create_device(u16 vm_id, struct gzvm_create_device *gzvm_dev);
 int gzvm_arch_inject_irq(struct gzvm *gzvm, unsigned int vcpu_idx,
diff --git a/include/uapi/linux/gzvm.h b/include/uapi/linux/gzvm.h
index ce73735f0be2..61ce53cd9448 100644
--- a/include/uapi/linux/gzvm.h
+++ b/include/uapi/linux/gzvm.h
@@ -21,6 +21,7 @@
 /* query hypervisor supported block-based demand page */
 #define GZVM_CAP_BLOCK_BASED_DEMAND_PAGING	0x9201
 #define GZVM_CAP_ENABLE_DEMAND_PAGING	0x9202
+#define GZVM_CAP_ENABLE_IDLE		0x9203
 #define GZVM_CAP_QUERY_HYP_BATCH_PAGES	0x9204
 
 /* sub-commands put in args[0] for GZVM_CAP_PROTECTED_VM */
@@ -188,6 +189,7 @@ enum {
 	GZVM_EXIT_SYSTEM_EVENT = 0x92920008,
 	GZVM_EXIT_SHUTDOWN = 0x92920009,
 	GZVM_EXIT_GZ = 0x9292000a,
+	GZVM_EXIT_IDLE = 0x9292000b,
 };
 
 /* exception definitions of GZVM_EXIT_EXCEPTION */
-- 
2.18.0


