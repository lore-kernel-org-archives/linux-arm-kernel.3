Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D9DCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6V/dwP2/cPc37KZ6fRfJbHeVitho/24+GF4+3qcxjQ=; b=pR/z1cC7HWdSGIPY74CF51Th8+
	5cw8dap6Seqfg2hOlptue3KYx/+HvDvisKTqTSOjre+RsPv+FMkW4Gq4eahH1ZdFZLC9kBLzjjrg9
	xZhtzoFHVh5mj7I2XtgG06HUku9BztfSQo7U58KNKncCD9muevE44hMjP41TOKhXl7i/xIOdP64Te
	yoqkiGzoT8bOruCL4fzobIaqH7zIuVO8ZacTkN6hP6BMlQ1OKON8VUUwmTgw1e0rsBRqi2DUUps3j
	X3oP/gyFTbQiumF9aTA8L6v1LnfWGgUkkTauZecckuHRbkPr9MAQ4KoR3WFZGrVQ8FRm+7qO8Ze6q
	dR/TviiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvs6x-00000004mQj-3Ecg;
	Tue, 09 Sep 2025 06:45:51 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgSw-00000001UR0-0re0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 18:19:47 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b4fa6cd2377so3071206a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 11:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1757355585; x=1757960385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6V/dwP2/cPc37KZ6fRfJbHeVitho/24+GF4+3qcxjQ=;
        b=D47sj8MRxOixxaMCE11vbPsFShzVo8qAGXH9p5/9R1LXtD8XtZzwamqmSyytyq07Nc
         E0oAHpI+3/5LKyxE6LtZa4/Gluu7nx2Q2qpA6PyDaNQxOAy+No5FocKDZQXGhdnwR1ZK
         6mpcpmCH5BptrfcKQsIYIFjbfkjG76yt0TEn8x/gpO6QZkUmS1UsFEwWO7g28TncKD0v
         vTJ6hNTr8ZFw781uR71PCGVxnGcAfbLRKriOJFoANHcYM97GF7hL9tQBQ42awDbd/TSG
         9+yhQ6l7zBBLcJiJSC79e74M6zqDiuo+Qw8rzm94Mm84vXjV0jbQpdh0bXnp1IeGwmj0
         z9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757355585; x=1757960385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6V/dwP2/cPc37KZ6fRfJbHeVitho/24+GF4+3qcxjQ=;
        b=jXQw/wKkuXC6608e6QB+ibhdlyQApmWihlYQ+PGeGHz1G9p2djSZdo5I5G2LqlI5Ky
         TRYYTGPHz0vH4ZkPXxuK+zAzWxMXeIweK6YjnjN53WNdInI0qLdaoW6RPMYowE0zzYnn
         O6LWUVpykLYwWrMlH22NokPxqZJLONU1TCj7iTijqPwWLTpoXV+QaRMqv321+aV2FyXH
         m5ZTqo2lOK/pbxtyc5BargLoEAt6Bnt4akTpTXiEVtvOpH+nFwBZKZFf/GUVGg4al4Ly
         1cgxnCe9Cyrh/cOiqr5gTs6RvknWg3A8P91Zq4naAIf97LQkfqHOO9/UyvE09yu2P1Uj
         Ha/w==
X-Forwarded-Encrypted: i=1; AJvYcCXK5J9r9bPxIhL2QSBgoTSHX7CK36tITi+apWm5GCu2+Vz9hckJ01FeBgTHEEIAuJvU2vMKhVHaHcf2GsgFsdIV@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6kqzm9op0WRrG8GqlOWzzGruweWcUN1xgODKEAjhOUybcvF8a
	9g0ZFVSpeqPponIlFjz0YT1dA6kaCNNfmJFBChKImChirSWkPaq2u1d7/qIvynlx7YU=
X-Gm-Gg: ASbGnctUtPOyL+AlJ9u3LmrMBMZJrOSfTx7sux+obdsTVz1Nun9hL8Ix89xaX55TOby
	lwYNKki0mOR8GaU3fp/lEHCQFl2g2bnkZgr07hk08S/WJAXD3lUH2lwS9Tt/zGVFhacZNLY6x5C
	3SW24KNt8ax5AJTo3eRRC09l1KfWUdlxRifzUuvt985NjJP5qG1iwgTPKO5nPDMkqD+o1U1dYPR
	QKBVT4ShHWYodT2DXbp5T2KLet4EnOg//mdk1SZWIyw3nmXLbcmPNosmVhETwb5VRdoQ9DOgoU9
	RV/9rkfMkSW65pksl+NHeO2SE4wK04kPFjJnnI4Rge1EiHZ5YkCcsHs6Sbtl3l4m1c0JXQgabcj
	fFJM=
X-Google-Smtp-Source: AGHT+IHm6bZzRXmeABRwy/G5p7vy/KaN9wuIGKtA/dz7LR+i0K/fWZnNXX5BokaCfbMv/B97mbG9kA==
X-Received: by 2002:a17:903:19c6:b0:24c:ed95:2725 with SMTP id d9443c01a7336-2516e97ecbfmr104227365ad.4.1757355585343;
        Mon, 08 Sep 2025 11:19:45 -0700 (PDT)
Received: from cleger.eu.int ([2001:41d0:420:f300::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccd763948sm117012755ad.118.2025.09.08.11.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 11:19:44 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v7 5/5] selftests/riscv: add SSE test module
Date: Mon,  8 Sep 2025 18:17:07 +0000
Message-ID: <20250908181717.1997461-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908181717.1997461-1-cleger@rivosinc.com>
References: <20250908181717.1997461-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_111946_257985_4A01E75E 
X-CRM114-Status: GOOD (  26.06  )
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

This module, once loaded, will execute a series of tests using the SSE
framework. The provided script will check for any error reported by the
test module.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 tools/testing/selftests/riscv/Makefile        |   2 +-
 tools/testing/selftests/riscv/sse/Makefile    |   5 +
 .../selftests/riscv/sse/module/Makefile       |  16 +
 .../riscv/sse/module/riscv_sse_test.c         | 513 ++++++++++++++++++
 .../selftests/riscv/sse/run_sse_test.sh       |  44 ++
 5 files changed, 579 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/riscv/sse/Makefile
 create mode 100644 tools/testing/selftests/riscv/sse/module/Makefile
 create mode 100644 tools/testing/selftests/riscv/sse/module/riscv_sse_test.c
 create mode 100644 tools/testing/selftests/riscv/sse/run_sse_test.sh

diff --git a/tools/testing/selftests/riscv/Makefile b/tools/testing/selftests/riscv/Makefile
index 099b8c1f46f8..c62f58414b29 100644
--- a/tools/testing/selftests/riscv/Makefile
+++ b/tools/testing/selftests/riscv/Makefile
@@ -5,7 +5,7 @@
 ARCH ?= $(shell uname -m 2>/dev/null || echo not)
 
 ifneq (,$(filter $(ARCH),riscv))
-RISCV_SUBTARGETS ?= abi hwprobe mm sigreturn vector
+RISCV_SUBTARGETS ?= abi hwprobe mm sigreturn vector sse
 else
 RISCV_SUBTARGETS :=
 endif
diff --git a/tools/testing/selftests/riscv/sse/Makefile b/tools/testing/selftests/riscv/sse/Makefile
new file mode 100644
index 000000000000..67eaee06f213
--- /dev/null
+++ b/tools/testing/selftests/riscv/sse/Makefile
@@ -0,0 +1,5 @@
+TEST_GEN_MODS_DIR := module
+
+TEST_FILES := run_sse_test.sh
+
+include ../../lib.mk
diff --git a/tools/testing/selftests/riscv/sse/module/Makefile b/tools/testing/selftests/riscv/sse/module/Makefile
new file mode 100644
index 000000000000..02018f083456
--- /dev/null
+++ b/tools/testing/selftests/riscv/sse/module/Makefile
@@ -0,0 +1,16 @@
+TESTMODS_DIR := $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
+KDIR ?= /lib/modules/$(shell uname -r)/build
+
+obj-m += riscv_sse_test.o
+
+# Ensure that KDIR exists, otherwise skip the compilation
+modules:
+ifneq ("$(wildcard $(KDIR))", "")
+	$(Q)$(MAKE) -C $(KDIR) modules KBUILD_EXTMOD=$(TESTMODS_DIR)
+endif
+
+# Ensure that KDIR exists, otherwise skip the clean target
+clean:
+ifneq ("$(wildcard $(KDIR))", "")
+	$(Q)$(MAKE) -C $(KDIR) clean KBUILD_EXTMOD=$(TESTMODS_DIR)
+endif
diff --git a/tools/testing/selftests/riscv/sse/module/riscv_sse_test.c b/tools/testing/selftests/riscv/sse/module/riscv_sse_test.c
new file mode 100644
index 000000000000..e49a2f1179f6
--- /dev/null
+++ b/tools/testing/selftests/riscv/sse/module/riscv_sse_test.c
@@ -0,0 +1,513 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024 Rivos Inc.
+ */
+
+#define pr_fmt(fmt) "riscv_sse_test: " fmt
+
+#include <linux/array_size.h>
+#include <linux/completion.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/riscv_sbi_sse.h>
+#include <linux/slab.h>
+#include <linux/smp.h>
+
+#include <asm/sbi.h>
+#include <asm/sse.h>
+
+#define RUN_LOOP_COUNT		1000
+#define SSE_FAILED_PREFIX	"FAILED: "
+#define sse_err(...)		pr_err(SSE_FAILED_PREFIX __VA_ARGS__)
+
+struct sse_event_desc {
+	u32 evt_id;
+	const char *name;
+	bool can_inject;
+};
+
+static struct sse_event_desc sse_event_descs[] = {
+	{
+		.evt_id = SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS,
+		.name = "local_high_prio_ras",
+	},
+	{
+		.evt_id = SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP,
+		.name = "local_double_trap",
+	},
+	{
+		.evt_id = SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS,
+		.name = "global_high_prio_ras",
+	},
+	{
+		.evt_id = SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW,
+		.name = "local_pmu_overflow",
+	},
+	{
+		.evt_id = SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS,
+		.name = "local_low_prio_ras",
+	},
+	{
+		.evt_id = SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS,
+		.name = "global_low_prio_ras",
+	},
+	{
+		.evt_id = SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED,
+		.name = "local_software_injected",
+	},
+	{
+		.evt_id = SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED,
+		.name = "global_software_injected",
+	}
+};
+
+static struct sse_event_desc *sse_get_evt_desc(u32 evt)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sse_event_descs); i++) {
+		if (sse_event_descs[i].evt_id == evt)
+			return &sse_event_descs[i];
+	}
+
+	return NULL;
+}
+
+static const char *sse_evt_name(u32 evt)
+{
+	struct sse_event_desc *desc = sse_get_evt_desc(evt);
+
+	return desc != NULL ? desc->name : NULL;
+}
+
+static bool sse_test_can_inject_event(u32 evt)
+{
+	struct sse_event_desc *desc = sse_get_evt_desc(evt);
+
+	return desc != NULL ? desc->can_inject : false;
+}
+
+static struct sbiret sbi_sse_ecall(int fid, unsigned long arg0, unsigned long arg1)
+{
+	return sbi_ecall(SBI_EXT_SSE, fid, arg0, arg1, 0, 0, 0, 0);
+}
+
+static int sse_event_attr_get(u32 evt, unsigned long attr_id,
+			      unsigned long *val)
+{
+	struct sbiret sret;
+	unsigned long *attr_buf, phys;
+
+	attr_buf = kmalloc(sizeof(unsigned long), GFP_KERNEL);
+	if (!attr_buf)
+		return -ENOMEM;
+
+	phys = virt_to_phys(attr_buf);
+
+	sret = sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_READ, evt, attr_id, 1,
+			 phys, 0, 0);
+	if (sret.error)
+		return sbi_err_map_linux_errno(sret.error);
+
+	*val = *attr_buf;
+
+	return 0;
+}
+
+static int sse_test_signal(u32 evt, unsigned int cpu)
+{
+	unsigned int hart_id = cpuid_to_hartid_map(cpu);
+	struct sbiret ret;
+
+	ret = sbi_sse_ecall(SBI_SSE_EVENT_INJECT, evt, hart_id);
+	if (ret.error) {
+		sse_err("Failed to signal event %x, error %ld\n", evt, ret.error);
+		return sbi_err_map_linux_errno(ret.error);
+	}
+
+	return 0;
+}
+
+static int sse_test_inject_event(struct sse_event *event, u32 evt, unsigned int cpu)
+{
+	int res;
+	unsigned long status;
+
+	if (sse_event_is_global(evt)) {
+		/*
+		 * Due to the fact the completion might happen faster than
+		 * the call to SBI_SSE_COMPLETE in the handler, if the event was
+		 * running on another CPU, we need to wait for the event status
+		 * to be !RUNNING.
+		 */
+		do {
+			res = sse_event_attr_get(evt, SBI_SSE_ATTR_STATUS, &status);
+			if (res) {
+				sse_err("Failed to get status for evt %x, error %d\n", evt, res);
+				return res;
+			}
+			status = status & SBI_SSE_ATTR_STATUS_STATE_MASK;
+		} while (status == SBI_SSE_STATE_RUNNING);
+
+		res = sse_event_set_target_cpu(event, cpu);
+		if (res) {
+			sse_err("Failed to set cpu for evt %x, error %d\n", evt, res);
+			return res;
+		}
+	}
+
+	return sse_test_signal(evt, cpu);
+}
+
+struct fast_test_arg {
+	u32 evt;
+	int cpu;
+	bool completion;
+};
+
+static int sse_test_handler(u32 evt, void *arg, struct pt_regs *regs)
+{
+	int ret = 0;
+	struct fast_test_arg *targ = arg;
+	u32 test_evt = READ_ONCE(targ->evt);
+	int cpu = READ_ONCE(targ->cpu);
+
+	if (evt != test_evt) {
+		sse_err("Received SSE event id %x instead of %x\n", test_evt, evt);
+		ret = -EINVAL;
+	}
+
+	if (cpu != smp_processor_id()) {
+		sse_err("Received SSE event %d on CPU %d instead of %d\n", evt, smp_processor_id(),
+			cpu);
+		ret = -EINVAL;
+	}
+
+	WRITE_ONCE(targ->completion, true);
+
+	return ret;
+}
+
+static void sse_run_fast_test(struct fast_test_arg *test_arg, struct sse_event *event, u32 evt)
+{
+	unsigned long timeout;
+	int ret, cpu;
+
+	for_each_online_cpu(cpu) {
+		WRITE_ONCE(test_arg->completion, false);
+		WRITE_ONCE(test_arg->cpu, cpu);
+		/* Test arg is used on another CPU */
+		smp_wmb();
+
+		ret = sse_test_inject_event(event, evt, cpu);
+		if (ret) {
+			sse_err("event %s injection failed, err %d\n", sse_evt_name(evt), ret);
+			return;
+		}
+
+		timeout = jiffies + HZ / 100;
+		/* We can not use <linux/completion.h> since they are not NMI safe */
+		while (!READ_ONCE(test_arg->completion) &&
+			time_before(jiffies, timeout)) {
+			cpu_relax();
+		}
+		if (!time_before(jiffies, timeout)) {
+			sse_err("Failed to wait for event %s completion on CPU %d\n",
+				sse_evt_name(evt), cpu);
+			return;
+		}
+	}
+}
+
+static void sse_test_injection_fast(void)
+{
+	int i, ret = 0, j;
+	u32 evt;
+	struct fast_test_arg test_arg;
+	struct sse_event *event;
+
+	pr_info("Starting SSE test (fast)\n");
+
+	for (i = 0; i < ARRAY_SIZE(sse_event_descs); i++) {
+		evt = sse_event_descs[i].evt_id;
+		WRITE_ONCE(test_arg.evt, evt);
+
+		if (!sse_event_descs[i].can_inject)
+			continue;
+
+		event = sse_event_register(evt, 0, sse_test_handler,
+					   (void *)&test_arg);
+		if (IS_ERR(event)) {
+			sse_err("Failed to register event %s, err %ld\n", sse_evt_name(evt),
+				PTR_ERR(event));
+			goto out;
+		}
+
+		ret = sse_event_enable(event);
+		if (ret) {
+			sse_err("Failed to enable event %s, err %d\n", sse_evt_name(evt), ret);
+			goto err_unregister;
+		}
+
+		pr_info("Starting testing event %s\n", sse_evt_name(evt));
+
+		for (j = 0; j < RUN_LOOP_COUNT; j++)
+			sse_run_fast_test(&test_arg, event, evt);
+
+		pr_info("Finished testing event %s\n", sse_evt_name(evt));
+
+		sse_event_disable(event);
+err_unregister:
+		sse_event_unregister(event);
+	}
+out:
+	pr_info("Finished SSE test (fast)\n");
+}
+
+struct priority_test_arg {
+	unsigned long evt;
+	struct sse_event *event;
+	bool called;
+	u32 prio;
+	struct priority_test_arg *next_evt_arg;
+	void (*check_func)(struct priority_test_arg *arg);
+};
+
+static int sse_hi_priority_test_handler(u32 evt, void *arg,
+					struct pt_regs *regs)
+{
+	struct priority_test_arg *targ = arg;
+	struct priority_test_arg *next = READ_ONCE(targ->next_evt_arg);
+
+	WRITE_ONCE(targ->called, 1);
+
+	if (next) {
+		sse_test_signal(next->evt, smp_processor_id());
+		if (!READ_ONCE(next->called)) {
+			sse_err("Higher priority event %s was not handled %s\n",
+			      sse_evt_name(next->evt), sse_evt_name(evt));
+		}
+	}
+
+	return 0;
+}
+
+static int sse_low_priority_test_handler(u32 evt, void *arg, struct pt_regs *regs)
+{
+	struct priority_test_arg *targ = arg;
+	struct priority_test_arg *next = READ_ONCE(targ->next_evt_arg);
+
+	WRITE_ONCE(targ->called, 1);
+
+	if (next) {
+		sse_test_signal(next->evt, smp_processor_id());
+		if (READ_ONCE(next->called)) {
+			sse_err("Lower priority event %s was handle before %s\n",
+				sse_evt_name(next->evt), sse_evt_name(evt));
+		}
+	}
+
+	return 0;
+}
+
+static void sse_test_injection_priority_arg(struct priority_test_arg *args, unsigned int args_size,
+					    sse_event_handler_fn handler, const char *test_name)
+{
+	unsigned int i;
+	int ret;
+	struct sse_event *event;
+	struct priority_test_arg *arg, *first_arg = NULL, *prev_arg = NULL;
+
+	pr_info("Starting SSE priority test (%s)\n", test_name);
+	for (i = 0; i < args_size; i++) {
+		arg = &args[i];
+
+		if (!sse_test_can_inject_event(arg->evt))
+			continue;
+
+		WRITE_ONCE(arg->called, false);
+		WRITE_ONCE(arg->next_evt_arg, NULL);
+		if (prev_arg)
+			WRITE_ONCE(prev_arg->next_evt_arg, arg);
+
+		prev_arg = arg;
+
+		if (!first_arg)
+			first_arg = arg;
+
+		event = sse_event_register(arg->evt, arg->prio, handler, (void *)arg);
+		if (IS_ERR(event)) {
+			sse_err("Failed to register event %s, err %ld\n", sse_evt_name(arg->evt),
+				PTR_ERR(event));
+			goto release_events;
+		}
+		arg->event = event;
+
+		if (sse_event_is_global(arg->evt)) {
+			/* Target event at current CPU */
+			ret = sse_event_set_target_cpu(event, smp_processor_id());
+			if (ret) {
+				sse_err("Failed to set event %s target CPU, err %d\n",
+					sse_evt_name(arg->evt), ret);
+				goto release_events;
+			}
+		}
+
+		ret = sse_event_enable(event);
+		if (ret) {
+			sse_err("Failed to enable event %s, err %d\n", sse_evt_name(arg->evt), ret);
+			goto release_events;
+		}
+	}
+
+	if (!first_arg) {
+		sse_err("No injectable event available\n");
+		return;
+	}
+
+	/* Inject first event, handler should trigger the others in chain. */
+	ret = sse_test_inject_event(first_arg->event, first_arg->evt, smp_processor_id());
+	if (ret) {
+		sse_err("SSE event %s injection failed\n", sse_evt_name(first_arg->evt));
+		goto release_events;
+	}
+
+	/*
+	 * Event are injected directly on the current CPU after calling sse_test_inject_event()
+	 * so that execution is premmpted right away, no need to wait for timeout.
+	 */
+	arg = first_arg;
+	while (arg) {
+		if (!READ_ONCE(arg->called)) {
+			sse_err("Event %s handler was not called\n",
+			      sse_evt_name(arg->evt));
+			ret = -EINVAL;
+		}
+
+
+		event = arg->event;
+		arg = READ_ONCE(arg->next_evt_arg);
+	}
+
+release_events:
+
+	arg = first_arg;
+	while (arg) {
+		event = arg->event;
+		if (!event)
+			break;
+
+		sse_event_disable(event);
+		sse_event_unregister(event);
+		arg = READ_ONCE(arg->next_evt_arg);
+	}
+
+	pr_info("Finished SSE priority test (%s)\n", test_name);
+}
+
+static void sse_test_injection_priority(void)
+{
+	struct priority_test_arg default_hi_prio_args[] = {
+		{ .evt = SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED },
+		{ .evt = SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED },
+		{ .evt = SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS },
+		{ .evt = SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS },
+		{ .evt = SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW },
+		{ .evt = SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS },
+		{ .evt = SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP },
+		{ .evt = SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS },
+	};
+
+	struct priority_test_arg default_low_prio_args[] = {
+		{ .evt = SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS },
+		{ .evt = SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP },
+		{ .evt = SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS },
+		{ .evt = SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW },
+		{ .evt = SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS },
+		{ .evt = SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS },
+		{ .evt = SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED },
+		{ .evt = SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED },
+
+	};
+	struct priority_test_arg set_prio_args[] = {
+		{ .evt = SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED, .prio = 5 },
+		{ .evt = SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED, .prio = 10 },
+		{ .evt = SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS, .prio = 15 },
+		{ .evt = SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS, .prio = 20 },
+		{ .evt = SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW, .prio = 25 },
+		{ .evt = SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS, .prio = 30 },
+		{ .evt = SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP, .prio = 35 },
+		{ .evt = SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS, .prio = 40 },
+	};
+
+	struct priority_test_arg same_prio_args[] = {
+		{ .evt = SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW, .prio = 0 },
+		{ .evt = SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS, .prio = 10 },
+		{ .evt = SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED, .prio = 10 },
+		{ .evt = SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED, .prio = 10 },
+		{ .evt = SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS, .prio = 20 },
+	};
+
+	sse_test_injection_priority_arg(default_hi_prio_args, ARRAY_SIZE(default_hi_prio_args),
+					sse_hi_priority_test_handler, "high");
+
+	sse_test_injection_priority_arg(default_low_prio_args, ARRAY_SIZE(default_low_prio_args),
+					sse_low_priority_test_handler, "low");
+
+	sse_test_injection_priority_arg(set_prio_args, ARRAY_SIZE(set_prio_args),
+					sse_low_priority_test_handler, "set");
+
+	sse_test_injection_priority_arg(same_prio_args, ARRAY_SIZE(same_prio_args),
+					sse_low_priority_test_handler, "same_prio_args");
+}
+
+
+static bool sse_get_inject_status(u32 evt)
+{
+	int ret;
+	unsigned long val;
+
+	/* Check if injection is supported */
+	ret = sse_event_attr_get(evt, SBI_SSE_ATTR_STATUS, &val);
+	if (ret)
+		return false;
+
+	return !!(val & BIT(SBI_SSE_ATTR_STATUS_INJECT_OFFSET));
+}
+
+static void sse_init_events(void)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sse_event_descs); i++) {
+		struct sse_event_desc *desc = &sse_event_descs[i];
+
+		desc->can_inject = sse_get_inject_status(desc->evt_id);
+		if (!desc->can_inject)
+			pr_info("Can not inject event %s, tests using this event will be skipped\n",
+				desc->name);
+	}
+}
+
+static int __init sse_test_init(void)
+{
+	sse_init_events();
+
+	sse_test_injection_fast();
+	sse_test_injection_priority();
+
+	return 0;
+}
+
+static void __exit sse_test_exit(void)
+{
+}
+
+module_init(sse_test_init);
+module_exit(sse_test_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Clément Léger <cleger@rivosinc.com>");
+MODULE_DESCRIPTION("Test module for SSE");
diff --git a/tools/testing/selftests/riscv/sse/run_sse_test.sh b/tools/testing/selftests/riscv/sse/run_sse_test.sh
new file mode 100644
index 000000000000..888bc4a99cb3
--- /dev/null
+++ b/tools/testing/selftests/riscv/sse/run_sse_test.sh
@@ -0,0 +1,44 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (C) 2025 Rivos Inc.
+
+MODULE_NAME=riscv_sse_test
+DRIVER="./module/${MODULE_NAME}.ko"
+
+check_test_failed_prefix() {
+	if dmesg | grep -q "${MODULE_NAME}: FAILED:";then
+		echo "${MODULE_NAME} failed, please check dmesg"
+		exit 1
+	fi
+}
+
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
+check_test_requirements()
+{
+	uid=$(id -u)
+	if [ $uid -ne 0 ]; then
+		echo "$0: Must be run as root"
+		exit $ksft_skip
+	fi
+
+	if ! which insmod > /dev/null 2>&1; then
+		echo "$0: You need insmod installed"
+		exit $ksft_skip
+	fi
+
+	if [ ! -f $DRIVER ]; then
+		echo "$0: You need to compile ${MODULE_NAME} module"
+		exit $ksft_skip
+	fi
+}
+
+check_test_requirements
+
+insmod $DRIVER > /dev/null 2>&1
+rmmod $MODULE_NAME
+check_test_failed_prefix
+
+exit 0
-- 
2.43.0


