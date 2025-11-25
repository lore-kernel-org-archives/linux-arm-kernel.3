Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8022DD0EE00
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 17:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rfmkhk6fI8nQ7zM7WRF33dysSOhxawuyL810u6pnhUo=; b=QL2ccw04ehoi4t/Ylymm9KHFAT
	o1wk42Kb4cjTRusBmVci4BJ6ZR+Gete6ZaEAUVtDbX1zmLYiHXhP3fNQBGjF3uGL5xWJ5vNoN/TSY
	4b9p0Idw3ZgEwpVo2lGqQ/p3DIQmAdgQnA1+7/oFeSEy/OH4u+WkKUNirsh/Yp1DhiODOSfhDvmZT
	kThct/oHF1Cw4XBnd+HBnV/WZqD4M2DiMEKCbkDAnqQ38JqXAW/sw0KCH6uNY73CuHM9PYWhZwrjR
	QaXBlRtv9K5AGBtXVBxTw5frXD5Wo7BZCuExJEjJ7Ed/9FVSr68dpCiw4tPNmFwUKFSuwZ/ymKoy8
	RU58V2vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNwRo-0000000Ddph-0BTw;
	Tue, 25 Nov 2025 17:03:24 +0000
Received: from sender3-of-o54.zoho.com ([136.143.184.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNwRl-0000000Ddo9-47zH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 17:03:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1764090144; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RT95WB7XP3yF4hNe0URWd4hj5n5OqH3kD0bG3yA6E5djqYfx7lyd/O0otu1Tz6H8QwoHGzGFzhnUk34OnY/iyEvZur0JmEJXLkCU3k/IsBvGCtFKgg7/8VUMby69d+qTd5nzWOy0N2Fr7ju7f7pOHOT9RNdD5XBU5NyIFcgjoLs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764090144; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rfmkhk6fI8nQ7zM7WRF33dysSOhxawuyL810u6pnhUo=; 
	b=MArsVwlSCJQhqViFvr3iOkqBRz7dfxo+fKmDYMR4YAqjIQYsfEe985aISe5mjJOsX1GbhimMMB8PMNFDH2YsgL/0F/FFnc8+rPtc4a2lqdjGdG2u6ksd55fKmrOcsRX0WzDP/UEAnbP4ZhNntruD4lns/VhY2tvLKbvwwh/fPHg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=anirudhrb.com;
	spf=pass  smtp.mailfrom=anirudh@anirudhrb.com;
	dmarc=pass header.from=<anirudh@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764090144;
	s=zoho; d=anirudhrb.com; i=anirudh@anirudhrb.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=rfmkhk6fI8nQ7zM7WRF33dysSOhxawuyL810u6pnhUo=;
	b=quVQ69LJP0Zceq6Kbomc9byr+r/F65UXX+YF8LuQsXdIl2GTprpzqRZc3lgDS9aL
	Nio8FhASGi0DQ5XEVocVIKW+T3kycdSKvIUYCkpRgn1tUVNaQc9KP0IYULFaGeRFb/0
	VxsCIFSbiVl7IO0c7Zw5xrpLc229W/s3aLDKvGq4=
Received: by mx.zohomail.com with SMTPS id 1764090142173941.9960396999667;
	Tue, 25 Nov 2025 09:02:22 -0800 (PST)
From: Anirudh Raybharam <anirudh@anirudhrb.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	tglx@linutronix.de,
	Arnd Bergmann <arnd@arndb.de>,
	akpm@linux-foundation.org,
	anirudh@anirudhrb.com,
	agordeev@linux.ibm.com,
	guoweikang.kernel@gmail.com,
	osandov@fb.com,
	bsz@amazon.de,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Cc: Jinank Jain <jinankjain@microsoft.com>
Subject: [PATCH 3/3] mshv: add support for VMEXIT interrupts on aarch64
Date: Tue, 25 Nov 2025 17:01:24 +0000
Message-Id: <20251125170124.2443340-4-anirudh@anirudhrb.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125170124.2443340-1-anirudh@anirudhrb.com>
References: <20251125170124.2443340-1-anirudh@anirudhrb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_090322_095504_0BEC3E90 
X-CRM114-Status: GOOD (  19.28  )
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

From: Anirudh Rayabharam <anirudh@anirudhrb.com>

From: Anirudh Rayabharam (Microsoft) <anirudh@anirudhrb.com>

Use the SGI allocated for MSHV as the interrupt vector to get notified
of hypervisor intercepts.

Currently, HYPERVISOR_CALLBACK_VECTOR is hardcoded for this. This macro
exists only for x86. To make things generic, introduce an arch-specific
init function mshv_arch_parent_partition_init() which, for now, is
responsible for setting up the interception interrupt and writing it to
the mshv_interrupt global. mshv_interrupt is then used when programming
the SYNIC.

Co-developed-by: Jinank Jain <jinankjain@microsoft.com>
Signed-off-by: Jinank Jain <jinankjain@microsoft.com>
Signed-off-by: Anirudh Rayabharam (Microsoft) <anirudh@anirudhrb.com>
---
 drivers/hv/mshv_root_main.c    | 59 ++++++++++++++++++++++++++++++++++
 drivers/hv/mshv_synic.c        | 15 +++++----
 include/asm-generic/mshyperv.h |  3 ++
 3 files changed, 70 insertions(+), 7 deletions(-)

diff --git a/drivers/hv/mshv_root_main.c b/drivers/hv/mshv_root_main.c
index bc15d6f6922f..e48a89688ecb 100644
--- a/drivers/hv/mshv_root_main.c
+++ b/drivers/hv/mshv_root_main.c
@@ -17,7 +17,9 @@
 #include <linux/file.h>
 #include <linux/anon_inodes.h>
 #include <linux/mm.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/irq.h>
 #include <linux/cpuhotplug.h>
 #include <linux/random.h>
 #include <asm/mshyperv.h>
@@ -75,6 +77,11 @@ static vm_fault_t mshv_vp_fault(struct vm_fault *vmf);
 static int mshv_init_async_handler(struct mshv_partition *partition);
 static void mshv_async_hvcall_handler(void *data, u64 *status);
 
+
+int mshv_interrupt = -1;
+int mshv_irq = -1;
+static long __percpu *mshv_evt;
+
 static const union hv_input_vtl input_vtl_zero;
 static const union hv_input_vtl input_vtl_normal = {
 	.target_vtl = HV_NORMAL_VTL,
@@ -2311,6 +2318,47 @@ static void mshv_init_vmm_caps(struct device *dev)
 	dev_dbg(dev, "vmm_caps = %#llx\n", mshv_root.vmm_caps.as_uint64[0]);
 }
 
+#if IS_ENABLED(CONFIG_ARM64)
+static irqreturn_t mshv_percpu_isr(int irq, void *dev_id)
+{
+	mshv_isr();
+	add_interrupt_randomness(irq);
+	return IRQ_HANDLED;
+}
+
+static int mshv_arch_parent_partition_init(struct device *dev)
+{
+	int ret;
+
+	mshv_irq = mshv_get_intercept_irq();
+	mshv_interrupt = irq_get_irq_data(mshv_irq)->hwirq;
+
+	mshv_evt = alloc_percpu(long);
+	if (!mshv_evt) {
+		dev_err(dev, "Failed to allocate percpu event\n");
+		return -ENOMEM;
+	}
+
+	ret = request_percpu_irq(mshv_irq, mshv_percpu_isr, "MSHV", mshv_evt);
+	if (ret) {
+		dev_err(dev, "Failed to request percpu irq\n");
+		goto free_percpu_buf;
+	}
+
+	return ret;
+
+free_percpu_buf:
+	free_percpu(mshv_evt);
+	return ret;
+}
+#elif IS_ENABLED(CONFIG_X86_64)
+static int mshv_arch_parent_partition_init(struct device *dev)
+{
+	mshv_interrupt = HYPERVISOR_CALLBACK_VECTOR;
+	return 0;
+}
+#endif
+
 static int __init mshv_parent_partition_init(void)
 {
 	int ret;
@@ -2329,6 +2377,10 @@ static int __init mshv_parent_partition_init(void)
 
 	dev = mshv_dev.this_device;
 
+	ret = mshv_arch_parent_partition_init(dev);
+	if (ret)
+		return ret;
+
 	if (version_info.build_number < MSHV_HV_MIN_VERSION ||
 	    version_info.build_number > MSHV_HV_MAX_VERSION) {
 		dev_err(dev, "Running on unvalidated Hyper-V version\n");
@@ -2396,6 +2448,13 @@ static void __exit mshv_parent_partition_exit(void)
 	mshv_irqfd_wq_cleanup();
 	if (hv_root_partition())
 		mshv_root_partition_exit();
+	if (mshv_irq >= 0) {
+		if (mshv_evt) {
+			free_percpu_irq(mshv_irq, mshv_evt);
+			free_percpu(mshv_evt);
+			mshv_evt = NULL;
+		}
+	}
 	cpuhp_remove_state(mshv_cpuhp_online);
 	free_percpu(mshv_root.synic_pages);
 }
diff --git a/drivers/hv/mshv_synic.c b/drivers/hv/mshv_synic.c
index f8b0337cdc82..3bdb798f8948 100644
--- a/drivers/hv/mshv_synic.c
+++ b/drivers/hv/mshv_synic.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/mm.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/random.h>
 #include <asm/mshyperv.h>
@@ -451,9 +452,7 @@ int mshv_synic_init(unsigned int cpu)
 	union hv_synic_simp simp;
 	union hv_synic_siefp siefp;
 	union hv_synic_sirbp sirbp;
-#ifdef HYPERVISOR_CALLBACK_VECTOR
 	union hv_synic_sint sint;
-#endif
 	union hv_synic_scontrol sctrl;
 	struct hv_synic_pages *spages = this_cpu_ptr(mshv_root.synic_pages);
 	struct hv_message_page **msg_page = &spages->hyp_synic_message_page;
@@ -496,10 +495,13 @@ int mshv_synic_init(unsigned int cpu)
 
 	hv_set_non_nested_msr(HV_MSR_SIRBP, sirbp.as_uint64);
 
-#ifdef HYPERVISOR_CALLBACK_VECTOR
+
+	if (mshv_irq > 0)
+		enable_percpu_irq(mshv_irq, 0);
+
 	/* Enable intercepts */
 	sint.as_uint64 = 0;
-	sint.vector = HYPERVISOR_CALLBACK_VECTOR;
+	sint.vector = mshv_interrupt;
 	sint.masked = false;
 	sint.auto_eoi = hv_recommend_using_aeoi();
 	hv_set_non_nested_msr(HV_MSR_SINT0 + HV_SYNIC_INTERCEPTION_SINT_INDEX,
@@ -507,13 +509,12 @@ int mshv_synic_init(unsigned int cpu)
 
 	/* Doorbell SINT */
 	sint.as_uint64 = 0;
-	sint.vector = HYPERVISOR_CALLBACK_VECTOR;
+	sint.vector = mshv_interrupt;
 	sint.masked = false;
-	sint.as_intercept = 1;
 	sint.auto_eoi = hv_recommend_using_aeoi();
+	sint.as_intercept = 1;
 	hv_set_non_nested_msr(HV_MSR_SINT0 + HV_SYNIC_DOORBELL_SINT_INDEX,
 			      sint.as_uint64);
-#endif
 
 	/* Enable global synic bit */
 	sctrl.as_uint64 = hv_get_non_nested_msr(HV_MSR_SCONTROL);
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index ecedab554c80..8e30347f7946 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -189,6 +189,9 @@ void hv_setup_crash_handler(void (*handler)(struct pt_regs *regs));
 void hv_remove_crash_handler(void);
 void hv_setup_mshv_handler(void (*handler)(void));
 
+extern int mshv_interrupt;
+extern int mshv_irq;
+
 #if IS_ENABLED(CONFIG_HYPERV)
 /*
  * Hypervisor's notion of virtual processor ID is different from
-- 
2.34.1


