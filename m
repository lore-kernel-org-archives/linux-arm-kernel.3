Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E0AC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 13:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CAntV7cf9FOGSVoXQbvcHO1SNXeVU07stlk2XXrAaE=; b=Jk2+v4ywzFoy2R6dfd1sJtkn0v
	oAXLZyOR7i+HJLWFaOAJ6NqkmK2VIzCh9SF0gUKwCeMFkJiy2yXPWHVd3TZi07gTBJ3y12bHfhNlz
	iWGj4r8oHTxf8VjalsRR/Ihes/wVB3gEUVOQPs8w2WHMY51QhFFpOKZhe7VqoeB3ecvwunT/7I3mg
	A74x68Z+RdbDIqcWf0HViArGBIsIOpNIjMeeF7N8jXItXfmUKZyjU2xRNe8/jvBDUosb92FdodoAq
	nLYTw2I7d3tePozzyf/7rYLOqHPFEh67CPVLoBoHahGQ5p2mkYijUTbQ51lNb6XaAWPz+S/dBP/EJ
	dd5ol84A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYHV-0000000DnE2-0AHJ;
	Mon, 24 Feb 2025 13:13:57 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXNE-0000000DeW9-1nIZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 12:15:49 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-438e180821aso22006325e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 04:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740399347; x=1741004147; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9CAntV7cf9FOGSVoXQbvcHO1SNXeVU07stlk2XXrAaE=;
        b=ZuyDVJETHHwD8uGBy+FOa2k5AMYej3BJl/m3lcpwlDNe0uirp1oNkls2HBBEXrxWCe
         UL4URj7pBfKsNIJOWMW9kBKUbY4tDlqXXlv+uEVGuQ5PnwNUtGQ31FYIi+pHQ2TXvWVa
         fp9vEaKZ3ydpKFnSdYJtBU3EsarK+xQuoZO48MCXAHcWWUDRhml5aygfCFoZ3E1XNRGf
         Mtw6MHxATNeej+AafFpMkV/FrzcfWMuOMQ0LwPhHsFjS/hxHGPMaQz7VynPk3zmW+Vzx
         fArmASp7hiq3IrCmnV9oiPXdWE/HgV9BxmY4e4d4Fmw8E/mvoRK+yq4lWeSNMaQ8fuav
         kFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740399347; x=1741004147;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9CAntV7cf9FOGSVoXQbvcHO1SNXeVU07stlk2XXrAaE=;
        b=WReF+oNEu/CxwVKO1Hevfm1oyInvbdO6Bv0owx9j67n7Bfo4WZW2Dggmfc8nGQezJq
         iYgUfeRejZCJDCw4QQ3r0XH4EGnz8uasZb6u1ln8NS446M9zF59Qv5opUhIXcuiPdcSE
         y/biSOBqbp99mOcx4dXITEQer4SNa7N/RANDcez1b1QYvRM6lKb2Bmsod5/t2uZQTMer
         d3v+cze6V1YIq+Jf4IeQvp+SFjLHXb0CbZrjQ6Fco5cc7b9ngQ0LuRirpry5YuuMcVMA
         p1+LzkTNIyNJc6gdgnBebt1rXl/H49AzmmkARxzSs5wImjSr2pGmp3VPaDKlnBHMIv2j
         INGA==
X-Forwarded-Encrypted: i=1; AJvYcCX95PlZ8598niABIr2QsYmPmIQGEPSWaPHnT2NkGaifiq7B6iqVHo0MpxcXpUQmj2WM73xiXZmq4yWzfkbqRzqs@lists.infradead.org
X-Gm-Message-State: AOJu0YyJqITCD9Bky/09FH5yTxoPh2nNAhf8zB+yR5tVgdtVB9K624D5
	OirtNs0d04RajKS756OEjluJQAOE9kdTBHeaa53KDe2DDU1KYL3Q9ThwZVDjdFedd6RbpA8G1B6
	QssQ/LQNNCBBpRoN0rQ==
X-Google-Smtp-Source: AGHT+IF9r3S0MEV0pAXIHdPmAlcUav0RqTDnvruMkd3+nrJooxI1n1GLlFqOTkZUvY5CUW1Km7zrrpubG9E1i1Nk
X-Received: from wmqe19.prod.google.com ([2002:a05:600c:4e53:b0:439:831e:ca7c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:468e:b0:439:9b3f:2de1 with SMTP id 5b1f17b1804b1-439ae1f199cmr103370945e9.15.1740399346852;
 Mon, 24 Feb 2025 04:15:46 -0800 (PST)
Date: Mon, 24 Feb 2025 12:13:53 +0000
In-Reply-To: <20250224121353.98697-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250224121353.98697-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250224121353.98697-12-vdonnefort@google.com>
Subject: [PATCH 11/11] KVM: arm64: Add kselftest for tracefs hyp tracefs
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_041548_494553_38D60578 
X-CRM114-Status: GOOD (  18.85  )
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

Add a test to validate the newly introduced tracefs interface for the
pKVM hypervisor. Covers buffer reset, loading/unloading, extended
timestamp and coherence of the tracing clock.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index afeb983ca97b..c798bd6ad27e 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -94,6 +94,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_reset_tracing,
 	__KVM_HOST_SMCCC_FUNC___pkvm_swap_reader_tracing,
 	__KVM_HOST_SMCCC_FUNC___pkvm_enable_event,
+	__KVM_HOST_SMCCC_FUNC___pkvm_selftest_event,
 };
 
 #define DECLARE_KVM_VHE_SYM(sym)	extern char sym[]
diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h
index 0b98a87a1250..25d8e23a3cc6 100644
--- a/arch/arm64/include/asm/kvm_hypevents.h
+++ b/arch/arm64/include/asm/kvm_hypevents.h
@@ -28,4 +28,14 @@ HYP_EVENT(hyp_exit,
 	),
 	HE_PRINTK(" ")
 );
+
+#ifdef CONFIG_PKVM_SELFTESTS
+HYP_EVENT(selftest,
+	  HE_PROTO(void),
+	  HE_STRUCT(),
+	  HE_ASSIGN(),
+	  HE_PRINTK(" ")
+);
 #endif
+
+#endif /* __ARM64_KVM_HYPEVENTS_H_ */
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index ead632ad01b4..fff9d24d7771 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -46,6 +46,7 @@ menuconfig KVM
 config NVHE_EL2_DEBUG
 	bool "Debug mode for non-VHE EL2 object"
 	depends on KVM
+	select PKVM_SELFTESTS
 	help
 	  Say Y here to enable the debug mode for the non-VHE KVM EL2 object.
 	  Failure reports will BUG() in the hypervisor. This is intended for
@@ -83,4 +84,13 @@ config PTDUMP_STAGE2_DEBUGFS
 
 	  If in doubt, say N.
 
+config PKVM_SELFTESTS
+	bool "Protected KVM hypervisor selftests"
+	depends on KVM
+	default n
+	help
+	  Say Y here to enable pKVM hypervisor testing infrastructure.
+
+	  If unsure, say N.
+
 endif # VIRTUALIZATION
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 96dde58f4984..8f0dafaab568 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -628,6 +628,19 @@ static void handle___pkvm_enable_event(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 1) = __pkvm_enable_event(id, enable);
 }
 
+static void handle___pkvm_selftest_event(struct kvm_cpu_context *host_ctxt)
+{
+	int smc_ret = SMCCC_RET_NOT_SUPPORTED, ret = -EOPNOTSUPP;
+
+#ifdef CONFIG_PKVM_SELFTESTS
+	trace_selftest();
+	smc_ret = SMCCC_RET_SUCCESS;
+	ret = 0;
+#endif
+	cpu_reg(host_ctxt, 0) = smc_ret;
+	cpu_reg(host_ctxt, 1) = ret;
+}
+
 typedef void (*hcall_t)(struct kvm_cpu_context *);
 
 #define HANDLE_FUNC(x)	[__KVM_HOST_SMCCC_FUNC_##x] = (hcall_t)handle_##x
@@ -674,6 +687,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_reset_tracing),
 	HANDLE_FUNC(__pkvm_swap_reader_tracing),
 	HANDLE_FUNC(__pkvm_enable_event),
+	HANDLE_FUNC(__pkvm_selftest_event),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index cb63af69c38d..1e887e430c42 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -892,6 +892,35 @@ static int hyp_trace_clock_show(struct seq_file *m, void *v)
 }
 DEFINE_SHOW_ATTRIBUTE(hyp_trace_clock);
 
+#ifdef CONFIG_PKVM_SELFTESTS
+static int selftest_event_open(struct inode *inode, struct file *file)
+{
+	if (file->f_mode & FMODE_WRITE)
+		return kvm_call_hyp_nvhe(__pkvm_selftest_event);
+
+	return 0;
+}
+
+static ssize_t selftest_event_write(struct file *f, const char __user *buf,
+				    size_t cnt, loff_t *pos)
+{
+	return cnt;
+}
+
+static const struct file_operations selftest_event_fops = {
+	.open	= selftest_event_open,
+	.write	= selftest_event_write,
+};
+
+static void hyp_trace_init_testing_tracefs(struct dentry *root)
+{
+	tracefs_create_file("selftest_event", TRACEFS_MODE_WRITE, root, NULL,
+			    &selftest_event_fops);
+}
+#else
+static void hyp_trace_init_testing_tracefs(struct dentry *root) { }
+#endif
+
 int hyp_trace_init_tracefs(void)
 {
 	struct dentry *root, *per_cpu_root;
@@ -950,6 +979,7 @@ int hyp_trace_init_tracefs(void)
 	}
 
 	hyp_trace_init_event_tracefs(root);
+	hyp_trace_init_testing_tracefs(root);
 
 	return 0;
 }
diff --git a/tools/testing/selftests/hyp-trace/Makefile b/tools/testing/selftests/hyp-trace/Makefile
new file mode 100644
index 000000000000..2a5b2e29667e
--- /dev/null
+++ b/tools/testing/selftests/hyp-trace/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+all:
+
+TEST_PROGS := hyp-trace-test
+
+include ../lib.mk
diff --git a/tools/testing/selftests/hyp-trace/config b/tools/testing/selftests/hyp-trace/config
new file mode 100644
index 000000000000..135657ef550d
--- /dev/null
+++ b/tools/testing/selftests/hyp-trace/config
@@ -0,0 +1,4 @@
+CONFIG_FTRACE=y
+CONFIG_ARM64=y
+CONFIG_KVM=y
+CONFIG_PKVM_SELFTESTS=y
diff --git a/tools/testing/selftests/hyp-trace/hyp-trace-test b/tools/testing/selftests/hyp-trace/hyp-trace-test
new file mode 100755
index 000000000000..9be0c5f57160
--- /dev/null
+++ b/tools/testing/selftests/hyp-trace/hyp-trace-test
@@ -0,0 +1,264 @@
+#!/bin/sh -e
+# SPDX-License-Identifier: GPL-2.0-only
+
+# hyp-trace-test - Tracefs for pKVM hypervisor test
+#
+# Copyright (C) 2024 - Google LLC
+# Author: Vincent Donnefort <vdonnefort@google.com>
+#
+
+log_and_die()
+{
+    echo "$1"
+
+    exit 1
+}
+
+host_clock()
+{
+    # BOOTTIME clock
+    awk '/now/ { printf "%.6f\n", $3 / 1000000000 }' /proc/timer_list
+}
+
+page_size()
+{
+    echo "$(awk '/KernelPageSize/ {print $2; exit}' /proc/self/smaps) * 1024" | bc
+}
+
+goto_hyp_trace()
+{
+    if [ -d "/sys/kernel/debug/tracing/hypervisor" ]; then
+        cd /sys/kernel/debug/tracing/hypervisor
+        return
+    fi
+
+    if [ -d "/sys/kernel/tracing/hypervisor" ]; then
+        cd /sys/kernel/tracing/hypervisor
+        return
+    fi
+
+    echo "ERROR: hyp tracing folder not found!"
+
+    exit 1
+}
+
+reset_hyp_trace()
+{
+    echo 0 > tracing_on
+    echo 0 > trace
+    for event in events/hypervisor/*; do
+        echo 0 > $event/enable
+    done
+
+    assert_unloaded
+}
+
+setup_hyp_trace()
+{
+    reset_hyp_trace
+
+    echo 16 > buffer_size_kb
+    echo 1 > events/hypervisor/selftest/enable
+    echo 1 > tracing_on
+}
+
+stop_hyp_trace()
+{
+    echo 0 > tracing_on
+}
+
+hyp_trace_loaded()
+{
+    grep -q "(loaded)" buffer_size_kb
+}
+
+write_events()
+{
+    local num="$1"
+    local func="$2"
+
+    for i in $(seq 1 $num); do
+        echo 1 > selftest_event
+        [ -z "$func" -o $i -eq $num ] || eval $func
+    done
+}
+
+consuming_read()
+{
+    local output=$1
+
+    cat trace_pipe > $output &
+
+    echo $!
+}
+
+run_test_consuming()
+{
+    local nr_events=$1
+    local func=$2
+    local tmp="$(mktemp)"
+    local start_ts=0
+    local end_ts=0
+    local pid=0
+
+    echo "Output trace file: $tmp"
+
+    setup_hyp_trace
+    pid=$(consuming_read $tmp)
+
+    start_ts=$(host_clock)
+    write_events $nr_events $func
+    stop_hyp_trace
+    end_ts=$(host_clock)
+
+    kill $pid
+    validate_test $tmp $nr_events $start_ts $end_ts
+
+    rm $tmp
+}
+
+validate_test()
+{
+    local output=$1
+    local expected_events=$2
+    local start_ts=$3
+    local end_ts=$4
+    local prev_ts=$3
+    local ts=0
+    local num_events=0
+
+    IFS=$'\n'
+    for line in $(cat $output); do
+        echo "$line" | grep -q -E "^# " && continue
+        ts=$(echo "$line" | awk '{print $2}' | cut -d ':' -f1)
+        if [ $(echo "$ts<$prev_ts" | bc) -eq 1 ]; then
+            log_and_die "Error event @$ts < $prev_ts"
+        fi
+        prev_ts=$ts
+        num_events=$((num_events + 1))
+    done
+
+    if [ $(echo "$ts>$end_ts" | bc) -eq 1 ]; then
+        log_and_die "Error event @$ts > $end_ts"
+    fi
+
+    if [ $num_events -ne $expected_events ]; then
+        log_and_die "Expected $expected_events events, got $num_events"
+    fi
+}
+
+test_ts()
+{
+    echo "Test Timestamps..."
+
+    run_test_consuming 1000
+
+    echo "done."
+}
+
+test_extended_ts()
+{
+    echo "Test Extended Timestamps..."
+
+    run_test_consuming 1000 "sleep 0.1"
+
+    echo "done."
+}
+
+assert_loaded()
+{
+    hyp_trace_loaded || log_and_die "Expected loaded buffer"
+}
+
+assert_unloaded()
+{
+    ! hyp_trace_loaded || log_and_die "Expected unloaded buffer"
+}
+
+test_unloading()
+{
+    local tmp="$(mktemp)"
+
+    echo "Test unloading..."
+
+    setup_hyp_trace
+    assert_loaded
+
+    echo 0 > tracing_on
+    assert_unloaded
+
+    pid=$(consuming_read $tmp)
+    sleep 1
+    assert_loaded
+    kill $pid
+    assert_unloaded
+
+    echo 1 > tracing_on
+    write_events 1
+    echo 0 > trace
+    assert_loaded
+    echo 0 > tracing_on
+    assert_unloaded
+
+    echo "done."
+}
+
+test_reset()
+{
+    local tmp="$(mktemp)"
+
+    echo "Test Reset..."
+
+    setup_hyp_trace
+    write_events 1000
+    echo 0 > trace
+    clock_before=$(host_clock)
+    write_events 5
+
+    pid=$(consuming_read $tmp)
+    sleep 1
+    stop_hyp_trace
+    kill $pid
+
+    validate_test $tmp 5 $clock_before $(host_clock)
+
+    rm $tmp
+
+    echo "done."
+}
+
+test_big_bpacking()
+{
+    local hyp_buffer_page_size=40
+    local page_size=$(page_size)
+    local min_buf_size
+
+    # Number of ring-buffer pages stored in a single bpacking page
+    min_buf_size=$(echo "$page_size / ($hyp_buffer_page_size * $(nproc))" | bc)
+    # Size of the ring-buffer to fill a single bpacking page
+    min_buf_size=$(echo "$page_size * $min_buf_size" | bc)
+    # Size in kiB of the ring-buffer to fill an order-1 bpacking page
+    min_buf_size=$(echo "$min_buf_size * 2 / 1024" | bc)
+
+    echo "Test loading $min_buf_size kB buffer..."
+
+    reset_hyp_trace
+
+    echo $min_buf_size > buffer_size_kb
+    echo 1 > tracing_on
+    assert_loaded
+
+    stop_hyp_trace
+
+    echo "done."
+}
+
+goto_hyp_trace
+
+test_reset
+test_unloading
+test_big_bpacking
+test_ts
+test_extended_ts
+
+exit 0
-- 
2.48.1.601.g30ceb7b040-goog


