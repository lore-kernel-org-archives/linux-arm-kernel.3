Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB55ACCFA1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTGXk+lEQWu2rXlHhBAaWQnSfDozXn1jFf3AtP0+OHw=; b=2euENWFZjqOOOX/3tNBNOOiXN+
	wnKbdDauX4qw/GFqeBS2zElT3YQZH4ndqSKGz9NIgOOg+flaA0Mwl0YNpc0Vo2LJf000QNC0kTIwl
	qZXeUKb2R0WfZNloSo4JC+uS5mbEbYN8Kq13l46BfE1KOKVt8MgafDzznq7653hJCCgbfutYuvS74
	F1M3Gs8hVfO6QZA23edhz+5CClivP2KcYJdjExbV8CqBGkuWdC6GI86Zb0DaQ5lvC+yD42JOYS8rm
	NwyLp9avRs0lhIZCXUoldNDCt/vruC+MB2bim3PxRxfHAA8tQ4NUhe8pR5QGIIF7bBAO4FRhFbUZh
	sVv8TDsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIx1-0000000GzpC-0tet;
	Fri, 07 Nov 2025 09:40:11 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIw8-0000000Gyjn-1rY3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:39:27 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-40cfb98eddbso252207f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 01:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762508354; x=1763113154; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XTGXk+lEQWu2rXlHhBAaWQnSfDozXn1jFf3AtP0+OHw=;
        b=SJNwkIUd4Rb2UWEaVCP92asr3QH2cqUyAFep9EjJ/cSRCvrHf5T+1JmBta0gNwMziT
         rdnc6o4rBh6SBwBGQ4xlO/Kr5W9UFS2AWvtijbwoFUDJ62jvlrr6W3oG012Mxtyukb/W
         7GoyuJJK/oWoIAzC0J4x1DA9bMYOqTQnok66WqcG5D3g2e07CWE3xriN/q6YM9LeL99B
         4mDO01yZH6NCReSijyiuo2hFfNG1RkfYGCbQvN0P1LI/IrbfLNRuhlnVbhMeDKtYHUty
         gaeJhsCgb80Oc+mTljtA5MAHyAcki3cXxzSadMMjRSNNvnFCv2QSOJtfWEvpRu+bejdO
         LLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762508354; x=1763113154;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XTGXk+lEQWu2rXlHhBAaWQnSfDozXn1jFf3AtP0+OHw=;
        b=wClJmyamgw8Wyn7goPpINAFtNa1Ut/19P0z0fAV6n/Whv/yaEc81BSO97ZJiLrvIuN
         ZGdE4NlaV3Pt/84v3moPrYN8DGt3S+3WV1bWjjAuF1idk6W5S7SyHcIXy6IGIZnlFqBa
         QywPi6AEmHkgMQ+uBvX3UaUB6pNpHVGALImEv7r+ICDlQ7xlh/UqhuBI+bxk2OB1ApKq
         dVE4VBXFRtR5a4goyMwzsyZKEkqpeMSoVMI6mahlpNHkRTFpGIaWeFRfKE2VMxtHCip4
         nJrQDYuvz20HaIKV28A7USkh5RreTtltI9MVstQAHL6XDzg51fg/ZcOI6da2xN3JCQ64
         GVSw==
X-Forwarded-Encrypted: i=1; AJvYcCX9NWRRe1Ll4dpSMp3aZmNgTtxn7VU3uC7i7rnGDq4YJdjVSFlVzCTmbEzT73ivRGybawekJrkSJ7v+8Ykht/83@lists.infradead.org
X-Gm-Message-State: AOJu0Yw31o7tNbzII2YddHkWgjy5R7asFx9L91po9bYzk41xYoNKTN64
	wLPIeq8GsPU4FBHxJqCmyDrCKSrsmGsEzf1GQj1Sy9zWmNI+TLELMIiBepcGYG9I5fOOlTaktCd
	S6h5Q+uc+d5KbvU3lxknngQ==
X-Google-Smtp-Source: AGHT+IF/gtPJvCUAHC9x3215dCUFMskWv8ZlqPR+TxZo+QPZ0YsWx91fk4OG78nveWagqXOIs3IjHx01h0gv1Hon
X-Received: from wrme6.prod.google.com ([2002:adf:e386:0:b0:429:c854:2a08])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:18a3:b0:3e7:6424:1b47 with SMTP id ffacd0b85a97d-42b26f637c7mr1167260f8f.6.1762508353798;
 Fri, 07 Nov 2025 01:39:13 -0800 (PST)
Date: Fri,  7 Nov 2025 09:38:39 +0000
In-Reply-To: <20251107093840.3779150-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251107093840.3779150-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251107093840.3779150-28-vdonnefort@google.com>
Subject: [PATCH v8 27/28] KVM: arm64: Add selftest event support to pKVM hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_013916_962596_5738C011 
X-CRM114-Status: GOOD (  14.44  )
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

Add a selftest event that can be triggered from a `write_event` tracefs
file. This intends to be used by trace remote selftests.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index f7b29eae7010..6a3d65918e5d 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -96,6 +96,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_reset_tracing,
 	__KVM_HOST_SMCCC_FUNC___pkvm_swap_reader_tracing,
 	__KVM_HOST_SMCCC_FUNC___pkvm_enable_event,
+	__KVM_HOST_SMCCC_FUNC___pkvm_write_event,
 };
 
 #define DECLARE_KVM_VHE_SYM(sym)	extern char sym[]
diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h
index ce3953bc884a..3d1244972869 100644
--- a/arch/arm64/include/asm/kvm_hypevents.h
+++ b/arch/arm64/include/asm/kvm_hypevents.h
@@ -24,4 +24,18 @@ HYP_EVENT(hyp_exit,
 	),
 	HE_PRINTK()
 );
+
+#ifdef CONFIG_PKVM_SELFTESTS
+HYP_EVENT(selftest,
+	HE_PROTO(u64 id),
+	HE_STRUCT(
+		he_field(u64, id)
+	),
+	HE_ASSIGN(
+		__entry->id = id;
+	),
+	RE_PRINTK("id=%lld", __entry->id)
+);
 #endif
+
+#endif /* __ARM64_KVM_HYPEVENTS_H_ */
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 64db254f0448..af66e4bbeea9 100644
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
@@ -83,6 +84,15 @@ config PTDUMP_STAGE2_DEBUGFS
 
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
 config PKVM_TRACING
 	bool
 	depends on KVM
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index bb81906878c9..80e6b0159203 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -643,6 +643,20 @@ static void handle___pkvm_enable_event(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 1) = __pkvm_enable_event(id, enable);
 }
 
+static void handle___pkvm_write_event(struct kvm_cpu_context *host_ctxt)
+{
+	int smc_ret = SMCCC_RET_NOT_SUPPORTED, ret = -EOPNOTSUPP;
+#ifdef CONFIG_PKVM_SELFTESTS
+	DECLARE_REG(u64, id, host_ctxt, 1);
+
+	trace_selftest(id);
+	smc_ret = SMCCC_RET_SUCCESS;
+	ret = 0;
+#endif
+	cpu_reg(host_ctxt, 0) = smc_ret;
+	cpu_reg(host_ctxt, 1) = ret;
+}
+
 typedef void (*hcall_t)(struct kvm_cpu_context *);
 
 #define HANDLE_FUNC(x)	[__KVM_HOST_SMCCC_FUNC_##x] = (hcall_t)handle_##x
@@ -691,6 +705,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_reset_tracing),
 	HANDLE_FUNC(__pkvm_swap_reader_tracing),
 	HANDLE_FUNC(__pkvm_enable_event),
+	HANDLE_FUNC(__pkvm_write_event),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 73539f5b5e42..7d078f87f86d 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -318,8 +318,34 @@ static int hyp_trace_clock_show(struct seq_file *m, void *v)
 }
 DEFINE_SHOW_ATTRIBUTE(hyp_trace_clock);
 
+#ifdef CONFIG_PKVM_SELFTESTS
+static ssize_t hyp_trace_write_event_write(struct file *f, const char __user *ubuf,
+					   size_t cnt, loff_t *pos)
+{
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul_from_user(ubuf, cnt, 10, &val);
+	if (ret)
+		return ret;
+
+	ret = kvm_call_hyp_nvhe(__pkvm_write_event, val);
+	if (ret)
+		return ret;
+
+	return cnt;
+}
+
+static const struct file_operations hyp_trace_write_event_fops = {
+	.write	= hyp_trace_write_event_write,
+};
+#endif
+
 static int hyp_trace_init_tracefs(struct dentry *d, void *priv)
 {
+#ifdef CONFIG_PKVM_SELFTESTS
+	tracefs_create_file("write_event", 0200, d, NULL, &hyp_trace_write_event_fops);
+#endif
 	return tracefs_create_file("trace_clock", 0440, d, NULL, &hyp_trace_clock_fops) ?
 		0 : -ENOMEM;
 }
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/pkvm/trace.tc b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/trace.tc
new file mode 100644
index 000000000000..49dca7c3861a
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/trace.tc
@@ -0,0 +1,10 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test pkvm hypervisor tracing pipe
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/trace_pipe.tc
+
+set -e
+setup_remote "hypervisor"
+test_trace
-- 
2.51.2.1041.gc1ab5b90ca-goog


