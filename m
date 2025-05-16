Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB426C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 14:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpAELfoeAsFVtMepRzx2zM79+vNwJLrfBYC1dznWjvY=; b=1xg9WryzTiYIAWWcCCyE5q70d5
	p79qtCBWVJ2xJNiJ9w8tfQmswDYZDpVC4LQk+Haeqk46B6ak5uFw/7pz0BDyeoC+c6L2AxXadkyAW
	N7NQpZy0PvVaCVvUIjeZov2PertQCdhMwGscUp+Qf1DCjMwrboNwTFgS5MYFbHtb1rby/zrkDqeJ7
	Wm2qxagnf77bZge3OrSP8onu3D1AqsElkFYLZKHOXf9VGZ8kh9wpcIWFk5G9z1san+z4sTNpOP8qU
	FtTN0/9HK7dfxGMse0lqV5836Gj+uEONOjTYPPgNSNDIAcQfIMQaNYt9bngM7Jior1MNPzEcT6i7t
	WcMMGRJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFw70-00000003fuA-1MLa;
	Fri, 16 May 2025 14:32:34 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvJQ-00000003Y09-3Cc8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 13:41:21 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3a363beb5ebso216575f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 06:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747402878; x=1748007678; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OpAELfoeAsFVtMepRzx2zM79+vNwJLrfBYC1dznWjvY=;
        b=gkqFsIJkk5zJLrMPgE5HyssFzQfWgl9BYJuOMcqpLyUvFXU3royMYUJ4/IcFc82nwe
         OgYX610ZabZlo77mB35+fDLb68GrQFi86K891iCfhLsBdD/xqjB9/mC/6mC1bwM6hUT+
         /dV82t6YWkYPGnE6ZEnBhIPFMhCKe2f4TA1pX9HqzL7+zFQsooL45eSCZf+mMGfGRE4q
         GRlTBOebux32YzoRiVUhJANTO99hxuQnumtc4vBZyCBBbuwSuQ7xqvP9dy+y4heq12pM
         7SRN4qeaLL25NcZuqvCvRCSOtpLa5+XfYrktVhJaI+OBPbPc7r3/96ByRlGNagaBLG/e
         1kLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747402878; x=1748007678;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OpAELfoeAsFVtMepRzx2zM79+vNwJLrfBYC1dznWjvY=;
        b=D7pn/q7anlY9g8mGExnFbBcdtd/KlP+g6WVEXJBwFVWdw5ey0W43bqOdTnFNE0jUum
         n3QddIiMSIacZXM4hLZh7fVh2WjULjq8GpY1cqTcTJiSCVg90soV/Q5besGOLRjBDz2Y
         nltiYNkk8NI/V9Gc/wDdIcsX9ZbdyvzgPZXF6i/0f+3n1W712HX/ubFLIL3Qj6jOkLQQ
         R4hpA69QP0HmXhwyXnSYsBXC7oUzZxb/Fsna3QA93f3k9/ddbuQc8cSf7lJgLXr8SpDp
         zmyhlkODjW5ytwGY0WIvKgxh5EgVBxI9g7KzFjosphbNXjjEOwOoIey08HO1MJ96gfEH
         AHig==
X-Forwarded-Encrypted: i=1; AJvYcCXOZiyLpl1/QqaLTaIJdOaL8PxV47EFSUGhpO2lSj63+1rhgJxTeglAroJxBXRpdTnRETjXrjaReVkstgIZRMXf@lists.infradead.org
X-Gm-Message-State: AOJu0YxDk7bBeaJ99kCgjRrQ5FoZH/8WrzcwFIP3UzEp9aiHsC5JepIa
	DXy4j2DjK2s6yF4DA5FakMOoj708xLsa6BgcTIqbejJXS7BnfiGoD7z63VFCuTwdbYkpmqo4fVH
	cQLBvic4iB+SPt7OW+pOISQ==
X-Google-Smtp-Source: AGHT+IEExJBuC7RFCuynPTpengmlGUugJWjBceO6wu7ms84bKjx06UaFKlpNW0XZ+nv2qFVPSYjFHNd7fTq0iTw5
X-Received: from wmbec10.prod.google.com ([2002:a05:600c:610a:b0:441:b661:2d94])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2502:b0:3a1:fc84:f75f with SMTP id ffacd0b85a97d-3a3601d09b9mr2120545f8f.58.1747402878524;
 Fri, 16 May 2025 06:41:18 -0700 (PDT)
Date: Fri, 16 May 2025 14:40:30 +0100
In-Reply-To: <20250516134031.661124-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250516134031.661124-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516134031.661124-25-vdonnefort@google.com>
Subject: [PATCH v5 24/25] KVM: arm64: Add selftest event support to pKVM hyp
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
X-CRM114-CacheID: sfid-20250516_064120_801941_B7088646 
X-CRM114-Status: GOOD (  11.80  )
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
index f7d1d8987cce..333824325c9e 100644
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
index 7d7d0c07a6d4..e6b45631c48b 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -628,6 +628,20 @@ static void handle___pkvm_enable_event(struct kvm_cpu_context *host_ctxt)
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
@@ -674,6 +688,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_reset_tracing),
 	HANDLE_FUNC(__pkvm_swap_reader_tracing),
 	HANDLE_FUNC(__pkvm_enable_event),
+	HANDLE_FUNC(__pkvm_write_event),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 70c0939ebc6a..5b5d17a47ecc 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -317,8 +317,34 @@ static int hyp_trace_clock_show(struct seq_file *m, void *v)
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
-- 
2.49.0.1101.gccaa498523-goog


