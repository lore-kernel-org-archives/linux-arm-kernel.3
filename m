Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DDBC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 10:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6chsZ4b9REVXaCQX8gguiTmxYUwvB09uxReH1aMXZM=; b=lxL1zBluVfgO2FoQk6Z6D5574N
	UTx3yIg4TjeJIWSe/TpjGFCvBi0tqIJ523uXwcU0PnXAbxP/e/xqDhCMzpXqs0gdq63wuBOzcNxrZ
	qIqRWdIoCmhyDfqHrSNelQPAf7BnLFFyae0BaiYzwjetdZaA3nHTCV9iVh/F6TyWPww5jrj08jHTS
	ycaGzXfCY5w2rDtapeoO2Wk/fRr0iNx8KT4IYSlEH0FIfwS8tSpABJnxBFb5UPnxxO1Tx45DAjVrS
	xrxYvWNwprR+4b6VBRdcEYrkwUnx3xbPMZI/LvXBU5+hK/KLjRlf52loriFsUQH0vLYAOOOPCpl68
	nEyAXLCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xYL-000000051w9-0bs7;
	Tue, 22 Sep 2026 10:16:45 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xYH-000000051v9-0G4f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 10:16:43 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d8fdc579daso44000395ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 03:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790072200; x=1790677000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l6chsZ4b9REVXaCQX8gguiTmxYUwvB09uxReH1aMXZM=;
        b=jN9eHFECJy3d9b9mWmZhi/X+Jo/EJH7iW8BfK45UeDQPiYmOaoLvpnTXYBSTn02Udq
         mCwnbBFFmidkUF5bHBLcbqXZ0WzialSmyI8DyRhIy2W+36xNmji00TG19hlWzqPjh/AM
         e/gsrl+3NmnYp57bgcZz0xUytmoeU4xM8w0reLCW+BSm8lPgcFaS419nwnqooTtjfQTq
         vKGlNe82iSNNya4tr7AwlfxzKMc5otVfi8c2EfmzAcE8kE5JBLmwKiJvJ0VYWPiDwACT
         IZSFFUr6XZGR0wAR2xZXaL9G9b+LroydwC6Yq60ucEhGrD1fuX7nuIQq0ae9IUzYqFS8
         h2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072200; x=1790677000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l6chsZ4b9REVXaCQX8gguiTmxYUwvB09uxReH1aMXZM=;
        b=0P5ry73I9vaWqnBnorgtTcySj3qk4vNdHWqczeUWM13skJJoJVOvE2BkPwW2Nwpxnb
         fVW8M9oLYmMu1ALOC7/rqaiZRS43tuDnOpeoCMEv0und3begVFGbWDgn2I4POtmaTGNp
         LuFYTd/2/cPr6NpOyUHdfUGHjYXio9ivXQFyOlD9tYmYVJEKFHBXA2GtXlYG276OpXlF
         aikJJBX2GWky5n9sYf5bqaPuSHdMVD4gxgg6N4lTgYph222GBvJ0vMa4KVVgqqW41tBm
         lNpXhGRA53KZrABoETZkoHHJ01zd5s42rY7B8y2jOw3A0ybAEhlL1d8PankvVEmjmJyR
         /zxQ==
X-Forwarded-Encrypted: i=1; AKwUvByVSTAPN64vPosEwQJUW8pFHX367k/Gk6nuCfWgJmFKuDY1Ffqx9gAPluGixUviHAYUD0mBypf7Iw9f3pDRZjEA@lists.infradead.org
X-Gm-Message-State: AFuF++l7N9FcL5YPAdqrWh0Av1q8AwLCX5KKp4Qn1A2ypAaw37aMrIaB
	L9QxLlpP7tg+oSSIew8osWwRORigAsyAduMi9cQbMbV7BErX0SVMb6YP
X-Gm-Gg: AYBFou3SZlliq1hpFUwUCvAb/kbrgOGGuSclH7SoNkwpYhV8AqJ9V7ei67LqRO0E2It
	LilV3/xCkJqli43rH4xp8Cub1kuixj+ndAyRDhSRggiqebVugZ9y48sLpZQaOPfeUBU6zOhUIus
	GYbEtBn3zD1nfTJGQXAu5cPNZGNxmqbjTtS6VpD9SwkFj+j9nMO8qdmEDG+B6VzyZUuexgI7Mj+
	Rcu74l6yc+w23nZtWiuqdf9VVy/N1prNESCj3CZ8IUs0B9d/xh/z0oSYTkg/EGnjLqHq/wg4OU1
	lrM1u3mRogG59FlC87y/PgBjtexCoScjZiEicydiTEth7OD+gWoFOhYox84xuqjFc3CxYgIo9rV
	U3W/O/qIXmjano3Mtm/uwlt9mRw6R9zxsGQY5AJPedC0x8osguuca/akH6hrwJipBWc3hBeha6w
	e07KZStfCcRTosH5WYn6w6lR1hkxMf1uqhkSxfsCi/v2KcnE5QdeQoZcKsrMPzMLij6Ezf6jV9A
	iLwnLnO+h7zqo3wDX5rNreuXc6VnMZbQcXCCg==
X-Received: by 2002:a17:902:ecc5:b0:2df:5a5b:5763 with SMTP id d9443c01a7336-2df609ac388mr8409685ad.10.1790072199985;
        Tue, 22 Sep 2026 03:16:39 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:4d0:75ae:9920:3973])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d0199c4sm7330805ad.29.2026.09.22.03.16.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 03:16:39 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Fuad Tabba <tabba@google.com>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH] KVM: selftests: arm64: Add test for cross-vCPU LPI disable race
Date: Tue, 22 Sep 2026 18:16:32 +0800
Message-ID: <20260922101632.39497-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <87bj9r4h9z.wl-maz@kernel.org>
References: <87bj9r4h9z.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_031641_875810_02012AC3 
X-CRM114-Status: GOOD (  25.04  )
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

Add a selftest that validates the behavior of remote LPI disabling
while the target vCPU has in-flight/overflowing LPIs.

The test configures an ITS with multiple LPIs targeting vCPU 0, which
receives a continuous stream of MSIs forcing its List Registers to
overflow into the ap_list. Concurrently, vCPU 1 repeatedly toggles
GICR_CTLR.EnableLPIs on vCPU 0's redistributor.

On unpatched kernels, this race can lead to a use-after-free or host
kernel panic in vgic_fold_lr_state() due to a dangling last_lr_irq
pointer.  With the fix in place (stopping the VM and holding a
refcount on last_lr_irq), the test runs to completion without errors.

Signed-off-by: Yuchao Zhang <ndaugoing@gmail.com>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/arm64/vgic_lpi_disable.c    | 401 ++++++++++++++++++
 2 files changed, 402 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/arm64/vgic_lpi_disable.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 96bab7002d39..cf0baec3f6c7 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -190,6 +190,7 @@ TEST_GEN_PROGS_arm64 += arm64/vcpu_width_config
 TEST_GEN_PROGS_arm64 += arm64/vgic_init
 TEST_GEN_PROGS_arm64 += arm64/vgic_irq
 TEST_GEN_PROGS_arm64 += arm64/vgic_lpi_stress
+TEST_GEN_PROGS_arm64 += arm64/vgic_lpi_disable
 TEST_GEN_PROGS_arm64 += arm64/vgic_v5
 TEST_GEN_PROGS_arm64 += arm64/vpmu_counter_access
 TEST_GEN_PROGS_arm64 += arm64/no-vgic
diff --git a/tools/testing/selftests/kvm/arm64/vgic_lpi_disable.c b/tools/testing/selftests/kvm/arm64/vgic_lpi_disable.c
new file mode 100644
index 000000000000..078134919228
--- /dev/null
+++ b/tools/testing/selftests/kvm/arm64/vgic_lpi_disable.c
@@ -0,0 +1,401 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * vgic_lpi_disable - Test cross-vCPU LPI disabling race condition
+ *
+ * Copyright (c) 2026 Yuchao Zhang <ndaugoing@gmail.com>
+ *
+ * This test verifies that disabling LPIs from a remote vCPU while the
+ * target vCPU has in-flight/overflowing LPIs does not lead to use-after-free
+ * or kernel panic.
+ */
+
+#include <linux/sizes.h>
+#include <pthread.h>
+#include <stdatomic.h>
+#include <sys/sysinfo.h>
+
+#include "kvm_util.h"
+#include "delay.h"
+#include "gic.h"
+#include "gic_v3.h"
+#include "gic_v3_its.h"
+#include "processor.h"
+#include "ucall.h"
+#include "vgic.h"
+
+#define TEST_MEMSLOT_INDEX	1
+#define GIC_LPI_OFFSET		8192
+
+#define TARGET_VCPU_ID		0
+#define DISABLER_VCPU_ID	1
+
+static size_t nr_iterations = 200;
+static gpa_t gpa_base;
+
+static struct kvm_vm *vm;
+static struct kvm_vcpu **vcpus;
+static int its_fd;
+
+static struct test_data {
+	bool		request_vcpus_stop;
+	u32		nr_cpus;
+	u32		nr_devices;
+	u32		nr_event_ids;
+
+	gpa_t		device_table;
+	gpa_t		collection_table;
+	gpa_t		cmdq_base;
+	void		*cmdq_base_va;
+	gpa_t		itt_tables;
+
+	gpa_t		lpi_prop_table;
+	gpa_t		lpi_pend_tables;
+} test_data = {
+	.nr_cpus	= 2,
+	.nr_devices	= 1,
+	.nr_event_ids	= 64,
+};
+
+static void guest_irq_handler(struct ex_regs *regs)
+{
+	u32 intid = gic_get_and_ack_irq();
+
+	if (intid == IAR_SPURIOUS)
+		return;
+
+	GUEST_ASSERT(intid >= GIC_LPI_OFFSET);
+	gic_set_eoi(intid);
+}
+
+static void guest_setup_its_mappings(void)
+{
+	u32 device_id, event_id, intid = GIC_LPI_OFFSET;
+	u32 nr_events = test_data.nr_event_ids;
+	u32 nr_devices = test_data.nr_devices;
+
+	/* Map collection 0 to TARGET_VCPU_ID */
+	its_send_mapc_cmd(test_data.cmdq_base_va, TARGET_VCPU_ID, TARGET_VCPU_ID, true);
+
+	/* Map all LPIs to TARGET_VCPU_ID to force LR overflow */
+	for (device_id = 0; device_id < nr_devices; device_id++) {
+		gpa_t itt_base = test_data.itt_tables + (device_id * SZ_64K);
+
+		its_send_mapd_cmd(test_data.cmdq_base_va, device_id,
+				  itt_base, SZ_64K, true);
+
+		for (event_id = 0; event_id < nr_events; event_id++) {
+			its_send_mapti_cmd(test_data.cmdq_base_va, device_id,
+					   event_id, TARGET_VCPU_ID, intid++);
+		}
+	}
+}
+
+static void guest_invalidate_all_rdists(void)
+{
+	int i;
+
+	for (i = 0; i < test_data.nr_cpus; i++)
+		its_send_invall_cmd(test_data.cmdq_base_va, i);
+}
+
+static void guest_setup_gic(void)
+{
+	static atomic_int nr_cpus_ready;
+	u32 cpuid = guest_get_vcpuid();
+
+	gic_init(GIC_V3, test_data.nr_cpus);
+	gic_rdist_enable_lpis(test_data.lpi_prop_table, SZ_64K,
+			      test_data.lpi_pend_tables + (cpuid * SZ_64K));
+
+	atomic_fetch_add(&nr_cpus_ready, 1);
+
+	if (cpuid > 0)
+		return;
+
+	while (atomic_load(&nr_cpus_ready) < test_data.nr_cpus)
+		cpu_relax();
+
+	its_init(test_data.collection_table, SZ_64K,
+		 test_data.device_table, SZ_64K,
+		 test_data.cmdq_base, SZ_64K);
+
+	guest_setup_its_mappings();
+	guest_invalidate_all_rdists();
+
+	/* SYNC to ensure ITS setup is complete */
+	for (cpuid = 0; cpuid < test_data.nr_cpus; cpuid++)
+		its_send_sync_cmd(test_data.cmdq_base_va, cpuid);
+}
+
+static inline void *test_gicr_base_cpu(u32 cpu)
+{
+	return (void *)(GICR_BASE_GPA + cpu * SZ_64K * 2);
+}
+
+static void test_gicv3_gicr_wait_for_rwp(u32 cpu)
+{
+	unsigned int count = 100000;
+
+	while (readl(test_gicr_base_cpu(cpu) + GICR_CTLR) & GICR_CTLR_RWP) {
+		GUEST_ASSERT(count--);
+		udelay(10);
+	}
+}
+
+static void guest_code(size_t nr_lpis)
+{
+	u32 cpuid = guest_get_vcpuid();
+
+	guest_setup_gic();
+
+	if (cpuid == TARGET_VCPU_ID) {
+		local_irq_enable();
+		GUEST_SYNC(0);
+
+		while (!READ_ONCE(test_data.request_vcpus_stop))
+			cpu_relax();
+	} else {
+		GUEST_SYNC(0);
+
+		for (size_t i = 0; i < nr_iterations; i++) {
+			/* Remotely disable LPIs on target vCPU */
+			writel(0, test_gicr_base_cpu(TARGET_VCPU_ID) + GICR_CTLR);
+			test_gicv3_gicr_wait_for_rwp(TARGET_VCPU_ID);
+
+			for (int d = 0; d < 50; d++)
+				cpu_relax();
+
+			/* Remotely re-enable LPIs on target vCPU */
+			writel(GICR_CTLR_ENABLE_LPIS,
+			       test_gicr_base_cpu(TARGET_VCPU_ID) + GICR_CTLR);
+			test_gicv3_gicr_wait_for_rwp(TARGET_VCPU_ID);
+		}
+
+		WRITE_ONCE(test_data.request_vcpus_stop, true);
+	}
+
+	GUEST_DONE();
+}
+
+static void setup_memslot(void)
+{
+	size_t pages;
+	size_t sz;
+
+	sz = (3 + test_data.nr_devices) * SZ_64K;
+	sz += (1 + test_data.nr_cpus) * SZ_64K;
+
+	pages = sz / vm->page_size;
+	gpa_base = ((vm_compute_max_gfn(vm) + 1) * vm->page_size) - sz;
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, gpa_base,
+				    TEST_MEMSLOT_INDEX, pages, 0);
+}
+
+#define LPI_PROP_DEFAULT_PRIO	0xa0
+
+static void configure_lpis(void)
+{
+	size_t nr_lpis = test_data.nr_devices * test_data.nr_event_ids;
+	u8 *tbl = addr_gpa2hva(vm, test_data.lpi_prop_table);
+	size_t i;
+
+	for (i = 0; i < nr_lpis; i++) {
+		tbl[i] = LPI_PROP_DEFAULT_PRIO |
+			 LPI_PROP_GROUP1 |
+			 LPI_PROP_ENABLED;
+	}
+}
+
+static void setup_test_data(void)
+{
+	size_t pages_per_64k = vm_calc_num_guest_pages(vm->mode, SZ_64K);
+	u32 nr_devices = test_data.nr_devices;
+	u32 nr_cpus = test_data.nr_cpus;
+	gpa_t cmdq_base;
+
+	test_data.device_table = vm_phy_pages_alloc(vm, pages_per_64k,
+						    gpa_base,
+						    TEST_MEMSLOT_INDEX);
+
+	test_data.collection_table = vm_phy_pages_alloc(vm, pages_per_64k,
+							gpa_base,
+							TEST_MEMSLOT_INDEX);
+
+	cmdq_base = vm_phy_pages_alloc(vm, pages_per_64k, gpa_base,
+				       TEST_MEMSLOT_INDEX);
+	virt_map(vm, cmdq_base, cmdq_base, pages_per_64k);
+	test_data.cmdq_base = cmdq_base;
+	test_data.cmdq_base_va = (void *)cmdq_base;
+
+	test_data.itt_tables = vm_phy_pages_alloc(vm, pages_per_64k * nr_devices,
+						  gpa_base, TEST_MEMSLOT_INDEX);
+
+	test_data.lpi_prop_table = vm_phy_pages_alloc(vm, pages_per_64k,
+						      gpa_base, TEST_MEMSLOT_INDEX);
+	configure_lpis();
+
+	test_data.lpi_pend_tables = vm_phy_pages_alloc(vm, pages_per_64k * nr_cpus,
+						       gpa_base, TEST_MEMSLOT_INDEX);
+
+	sync_global_to_guest(vm, test_data);
+}
+
+static void setup_gic(void)
+{
+	its_fd = vgic_its_setup(vm);
+}
+
+static void signal_lpi(u32 device_id, u32 event_id)
+{
+	gpa_t db_addr = GITS_BASE_GPA + GITS_TRANSLATER;
+
+	struct kvm_msi msi = {
+		.address_lo	= db_addr,
+		.address_hi	= db_addr >> 32,
+		.data		= event_id,
+		.devid		= device_id,
+		.flags		= KVM_MSI_VALID_DEVID,
+	};
+
+	__vm_ioctl(vm, KVM_SIGNAL_MSI, &msi);
+}
+
+static pthread_barrier_t test_setup_barrier;
+
+static atomic_bool stop_lpi_thread;
+
+static void *lpi_worker_thread(void *data)
+{
+	u32 device_id = (size_t)data;
+	u32 event_id;
+
+	pthread_barrier_wait(&test_setup_barrier);
+
+	while (!atomic_load(&stop_lpi_thread)) {
+		for (event_id = 0; event_id < test_data.nr_event_ids; event_id++)
+			signal_lpi(device_id, event_id);
+		usleep(100);
+	}
+
+	return NULL;
+}
+
+static void *vcpu_worker_thread(void *data)
+{
+	struct kvm_vcpu *vcpu = data;
+	struct ucall uc;
+
+	while (true) {
+		vcpu_run(vcpu);
+
+		switch (get_ucall(vcpu, &uc)) {
+		case UCALL_SYNC:
+			pthread_barrier_wait(&test_setup_barrier);
+			continue;
+		case UCALL_DONE:
+			if (vcpu == vcpus[DISABLER_VCPU_ID]) {
+				atomic_store(&stop_lpi_thread, true);
+				write_guest_global(vm, test_data.request_vcpus_stop, true);
+			}
+			return NULL;
+		case UCALL_ABORT:
+			REPORT_GUEST_ASSERT(uc);
+			break;
+		default:
+			TEST_FAIL("Unknown ucall: %lu", uc.cmd);
+		}
+	}
+
+	return NULL;
+}
+
+static void run_test(void)
+{
+	pthread_t *vcpu_threads;
+	pthread_t lpi_thread;
+	u32 i;
+
+	pthread_barrier_init(&test_setup_barrier, NULL, test_data.nr_cpus + 1);
+
+	vcpu_threads = malloc(sizeof(pthread_t) * test_data.nr_cpus);
+	TEST_ASSERT(vcpu_threads, "Failed to allocate vcpu_threads");
+
+	for (i = 0; i < test_data.nr_cpus; i++)
+		pthread_create(&vcpu_threads[i], NULL, vcpu_worker_thread, vcpus[i]);
+
+	pthread_create(&lpi_thread, NULL, lpi_worker_thread, (void *)(size_t)0);
+
+	pthread_join(lpi_thread, NULL);
+	for (i = 0; i < test_data.nr_cpus; i++)
+		pthread_join(vcpu_threads[i], NULL);
+
+	free(vcpu_threads);
+}
+
+static void setup_vm(void)
+{
+	int i;
+
+	vm = vm_create_with_vcpus(test_data.nr_cpus, guest_code, vcpus);
+
+	vm_init_descriptor_tables(vm);
+	for (i = 0; i < test_data.nr_cpus; i++)
+		vcpu_init_descriptor_tables(vcpus[i]);
+
+	vm_install_exception_handler(vm, VECTOR_IRQ_CURRENT, guest_irq_handler);
+
+	setup_memslot();
+	setup_gic();
+	setup_test_data();
+}
+
+static void destroy_vm(void)
+{
+	close(its_fd);
+	kvm_vm_free(vm);
+}
+
+static void help(const char *name)
+{
+	pr_info("Usage: %s [-i iterations] [-e event_ids]\n", name);
+	pr_info(" -i: number of iterations to toggle GICR_CTLR.EnableLPIs (default %lu)\n",
+		nr_iterations);
+	pr_info(" -e: number of event IDs/LPIs to inject (default %u)\n",
+		test_data.nr_event_ids);
+}
+
+int main(int argc, char **argv)
+{
+	int opt;
+
+	TEST_REQUIRE(kvm_supports_vgic_v3());
+
+	while ((opt = getopt(argc, argv, "i:e:h")) != -1) {
+		switch (opt) {
+		case 'i':
+			nr_iterations = atoi_positive("iterations", optarg);
+			break;
+		case 'e':
+			test_data.nr_event_ids = atoi_positive("event_ids", optarg);
+			break;
+		case 'h':
+		default:
+			help(argv[0]);
+			exit(opt == 'h' ? 0 : 1);
+		}
+	}
+
+	vcpus = malloc(sizeof(struct kvm_vcpu *) * test_data.nr_cpus);
+	TEST_ASSERT(vcpus, "Failed to allocate vcpus array");
+
+	setup_vm();
+	run_test();
+	destroy_vm();
+
+	free(vcpus);
+
+	pr_info("Completed %lu iterations of remote LPI disable successfully\n",
+		nr_iterations);
+
+	return 0;
+}
-- 
2.53.0


