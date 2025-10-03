Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6977ACCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HybwN5usXimaW4enq6meCBW9SZH/kRyin9xx36GATCg=; b=CesvOt0lPjymMv1dQBMo3K9neG
	TAFctvGVnAFNfqOz3nPHTl27Uvv9tfiCE9v9r3DxT0b55DkRBaBwnSejpQw1SKzO9iC4vAgIJpr07
	sgFpM5uI5cCkk4kJRu1sYCuUPxqNTQsoIsOW/vcfQHGJDeXC1z8rfCcZakbhmEHBLXgkFuW0e3LsV
	1ZHCRBzB9N4RORPrT3+s5RsTWbhK6zXujxHXSkOjTBfyp1c06+Q2HECpArm53PlwqjXmnZuo0WtwG
	AD5Nkr6giP/HgdEk0CxMlRl8pMv76OmDmkmyDLAWx9PMMZqwSe3s61Z9yuAnma7JTU39v5rjfCRP0
	BAedWEOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0z-0000000CRZW-3aFB;
	Fri, 03 Oct 2025 13:40:05 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0L-0000000CQXJ-1sZ5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:39:29 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-634779072f7so2902358a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 06:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759498762; x=1760103562; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HybwN5usXimaW4enq6meCBW9SZH/kRyin9xx36GATCg=;
        b=eTY4+QJuhUUmZyRZNHOcYcTRCnvTrUC/Zmwx+cXycrNv8XwNS38hDvHK2T4FkTFktG
         GIPHYK8AnyIf/bvIDfz3iXQ0fU6/WC9o3+86alNstACppGNcHN7u3Jj6ar8RTYDdmINv
         g9b/meI5oklrLJ5eUE0bBQm4DffvnCCBGIa3cEqVpLrnlNz2rsDqQLdBOpO6BAa1hPJp
         IAIOMxZMxo5mbyUd64ZJHUTlyJ07/PAcnzLsqP3DIoeaZJOGmETsb0P3g19WjrHC+Lfe
         SbYxts6yVBLP6by8e3ezUyRFJgwxneSTiRpqWSFRDoesDQqjb4pPMYTPdEFipO03EAV5
         n4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759498762; x=1760103562;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HybwN5usXimaW4enq6meCBW9SZH/kRyin9xx36GATCg=;
        b=pVsQdPlzxvLixwfA7IjWQJx2nTVAHtXZ7YfjV/KTIDMjexLBrvCgWufFuI1huJ6nx2
         jEfv8ndO/ARgceMj87BVMm1OpHSwyDiFOJQ6f7CgLX0P07yHXQfqJo3EI4nJXl6ayi9E
         WgelhmPWblaoqrKtt3kgk46+0FEevsUIMULzQN6JcVx941s3qQ+V7awdwtilSXPKpv4O
         5r64NRUPCVax4u5IaVmytWgkTLygozFXf+ryqCHu4Qe+E6G9+CbjW0q3blQIcx4sbPSq
         gqU9r+lxYAKFUoUhcYy9XaYf7sr0njU1OUJ+Fkf4aEAuyuDHbqrh6N7eVcaBiiLHVyYT
         S62A==
X-Forwarded-Encrypted: i=1; AJvYcCV/2Gi8a82uSPZ0/+yG64t2CWwS/hObpaVPBAXZgCb1l0Sj9zu+YawhQE+Uvo1FBGqhIe1TpTj5uNTWTdfvpaPG@lists.infradead.org
X-Gm-Message-State: AOJu0YwBwNocTjLol6W42FXWSe8ANzZnGwcRgSVM+RnJM2zmkzvXD7TD
	EZjqgzco++VBBJ158vXI8oI7io59Hu00X9ZolSNOmXdz16kaOEKHy0ysIVG5eIcweq5eihNSpqz
	bB0y2Xq+9kHv5zgDGaM/EwA==
X-Google-Smtp-Source: AGHT+IELwj3gBuJyF3leF3G8LaRkBWs2P6oRG/az18DDC/e2gYixHQvg3JdF7vBDcun0KzShSZpMuULh4WsxehBQ
X-Received: from edpd15.prod.google.com ([2002:aa7:c1cf:0:b0:631:f056:e88b])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1d53:b0:637:ec59:3169 with SMTP id 4fb4d7f45d1cf-639348e62c2mr3027788a12.14.1759498762216;
 Fri, 03 Oct 2025 06:39:22 -0700 (PDT)
Date: Fri,  3 Oct 2025 14:38:24 +0100
In-Reply-To: <20251003133825.2068970-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251003133825.2068970-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251003133825.2068970-28-vdonnefort@google.com>
Subject: [PATCH v7 27/28] KVM: arm64: Add selftest event support to pKVM hyp
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
X-CRM114-CacheID: sfid-20251003_063925_575111_C8FC45B7 
X-CRM114-Status: GOOD (  14.66  )
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
index 79019e11f529..522cccef32b7 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -94,6 +94,7 @@ enum __kvm_host_smccc_func {
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
index e06358aaf1af..dc2ac3049428 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -45,6 +45,7 @@ menuconfig KVM
 config NVHE_EL2_DEBUG
 	bool "Debug mode for non-VHE EL2 object"
 	depends on KVM
+	select PKVM_SELFTESTS
 	help
 	  Say Y here to enable the debug mode for the non-VHE KVM EL2 object.
 	  Failure reports will BUG() in the hypervisor. This is intended for
@@ -82,6 +83,15 @@ config PTDUMP_STAGE2_DEBUGFS
 
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
index f8361520967b..81d8628a9047 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -631,6 +631,20 @@ static void handle___pkvm_enable_event(struct kvm_cpu_context *host_ctxt)
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
@@ -677,6 +691,7 @@ static const hcall_t host_hcall[] = {
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
2.51.0.618.g983fd99d29-goog


