Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8742CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IrBFhkITbSN8UWPGppEwnUycZpASHfPM0q0E2Ptifos=; b=gazUb8elIUciyZTIDAVVDR6IDd
	vE3d9zPwaFgizjzQyry5MdJbS56zfXMz6PrK9ahiWk+mFsS1qMBfyYat7mUc/hm7oL3p3cO20YV2m
	4PyJ4JXOjRdrsBNw1SjwR1cQWtEKA18nP5nCvI8wSHWL1reds+BtLeUpyehFL42jxtfx3d/MuWr2n
	TO0ActZCSJldHuGZK8drB2O0t04wZOwy5/izv/GDIQzzeqBq5jC2u0Gvxrb/eSyyJrXGUJeBk5onp
	tPdmDtgJ7cF/Pgugg4APtAzwxMQ7aCTHomr8PlelpTLgycehNe0E/Mx6dXzsc5sXmJu3YMYggRCLO
	AzstWpBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHnq-00000009OW5-09EZ;
	Thu, 01 Oct 2026 14:30:30 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHnf-00000009OM3-1bcy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:30:24 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-48b02d63407so1222780f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 07:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790865017; x=1791469817; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IrBFhkITbSN8UWPGppEwnUycZpASHfPM0q0E2Ptifos=;
        b=S2qTFYHaDuvyl06x3nVUqiNwhAL7yLCz+7l7UMf9kHEaSl/Q97eCGjy3P3g6YWLFGP
         hIY4rY6WNSVulO0LVzMZciSEUudtvOTUdjbhdwzSeYH9bsmpmOFvT5/TYcHNLrfdoG5s
         QcUWBw2R3qIhFuA/3O+/C7jLvFHj8P+OU9Fo1IZaB8KwCZCbd8mZlZLyQJ1M0l91H1uR
         tLV5UUJ55ymc6QfAO6TnYgJqBEAvh1r08z2d3giv7R4bcASoNvvmEDicectmTK+C0TzE
         Hca9UCZtxP5tcyplAFOw+IssXdEcbS2djTZkSmKFDSyUcQpyrHapdbnBosUeTMT9JJIX
         evBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865017; x=1791469817;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IrBFhkITbSN8UWPGppEwnUycZpASHfPM0q0E2Ptifos=;
        b=pzHmqoJZd+DO18gyTJm/fCEjgZTTmRyZUYdDWyhDqSGADwStnXPMtNpy9z91j2DuYv
         ygWcp1gSEwcmexxJku1QFZVTgldOU6IkY+cI7w57SKlM2oTnLZWTBDKsU99L699iVWxG
         SIwTml3232OUcJ4Nd5Qo0MlBVrWg3w95aJAPt5O259YMwLK+TxpKqpkf+0TkBEkyLXFI
         Te0hGtRov+SFH8sDJf3SzjgyT73/1JEjru4Tv763lILRjX6TZiFifEVsyEUCgYdqdysr
         /+BaKDNq1rT2INA4ENq18Gt48lrTo2wxQ8UPEdl1OHyvPKbZX3eBcre5sOSw+VzteW9+
         NsoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfowjGqQZDM3+xIjZZciOQLSAitcPXPpnovwGco+U8HL2jW5ZrkZEWBSAZjLJX8tluGX29uIrgyVLmjPi8V8Ag@lists.infradead.org
X-Gm-Message-State: AFq9FYKApCqB3khmVQq5A77ZN3s7x72uXbBhYVQBAZPWCULmoVN9Z0RC
	fuVJY2tfupRiMoT7jdeUQ7yCOXpmEoAqr53uA+2xY2P5uZ7cYltCWn84RjzZGtZzB6UfxeRN4Zs
	SU/CtNwcyGhI3tzw/Ybzuzw==
X-Received: from wrio15.prod.google.com ([2002:a5d:648f:0:b0:48b:175:52cf])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2007:b0:487:baa:aa6b with SMTP id ffacd0b85a97d-48b02541506mr8294054f8f.43.1790865013573;
 Thu, 01 Oct 2026 07:30:13 -0700 (PDT)
Date: Thu,  1 Oct 2026 15:30:00 +0100
In-Reply-To: <20261001143000.3371786-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261001143000.3371786-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001143000.3371786-5-vdonnefort@google.com>
Subject: [PATCH v5 4/4] KVM: arm64: Add hyp_printk event to nVHE/pKVM hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_073019_580360_6C9A350E 
X-CRM114-Status: GOOD (  26.73  )
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

Create an event to allow developers to log pretty much anything into the
hypervisor tracing buffer with trace_hyp_printk(), just like the kernel
tracing has the function trace_printk().

  #include <asm/kvm_hypevents.h>

  trace_hyp_printk("foobar");
  trace_hyp_printk("foo=%d", foo);
  trace_hyp_printk("foo=%d bar=0x%016llx", foo, bar);

To ensure writing into the tracing buffer is fast, store the string
format into a kernel-accessible ELF section. The hypervisor only has to
write into the event the string ID, which is the delta between the
hyp_string_fmt and the start of the ELF section.

The string format is parsed by the kernel. It is therefore not possible
to dereference hypervisor pointers and the format specifier %s is not
supported. Also the %p specifiers will fail to find the hypervisor
function.

To not waste tracing buffer data, use a dynamic size. Each argument is 8
bytes.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_hypevents.h        | 14 ++++
 arch/arm64/include/asm/kvm_hyptrace.h         |  9 +++
 arch/arm64/kernel/image-vars.h                |  1 +
 arch/arm64/kernel/vmlinux.lds.S               |  8 +++
 .../kvm/hyp/include/nvhe/define_events.h      |  2 -
 arch/arm64/kvm/hyp/include/nvhe/trace.h       | 66 +++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/events.c              |  6 ++
 arch/arm64/kvm/hyp_trace.c                    | 61 +++++++++++++++++
 8 files changed, 165 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h
index 5f6e6789d121..3396deb1a1f8 100644
--- a/arch/arm64/include/asm/kvm_hypevents.h
+++ b/arch/arm64/include/asm/kvm_hypevents.h
@@ -58,4 +58,18 @@ HYP_EVENT(selftest,
 	),
 	RE_PRINTK("id=%llu", __entry->id)
 );
+
+/*
+ * trace_hyp_printk() has too many specificities to be declared with HYP_EVENT().
+ * However, we can use a REMOTE_EVENT macro to automatically do the declaration
+ * for the kernel side.
+ */
+REMOTE_EVENT_CUSTOM_PRINTK(hyp_printk,
+	0, /* id will be overwritten during hyp event init */
+	RE_STRUCT(
+		re_field(u16, fmt_id)
+		re_field(u64, args[])
+	),
+	__hyp_trace_printk(evt, seq)
+);
 #endif
diff --git a/arch/arm64/include/asm/kvm_hyptrace.h b/arch/arm64/include/asm/kvm_hyptrace.h
index de133b735f72..16e8d60abba9 100644
--- a/arch/arm64/include/asm/kvm_hyptrace.h
+++ b/arch/arm64/include/asm/kvm_hyptrace.h
@@ -23,4 +23,13 @@ extern struct remote_event __hyp_events_end[];
 extern struct hyp_event_id __hyp_event_ids_start[];
 extern struct hyp_event_id __hyp_event_ids_end[];
 
+#define HYP_STRING_FMT_MAX_SIZE 127
+
+struct hyp_string_fmt {
+	const char	fmt[HYP_STRING_FMT_MAX_SIZE];
+	u8		nr_args;
+};
+
+extern const struct hyp_string_fmt __hyp_string_fmts_start[];
+extern const struct hyp_string_fmt __hyp_string_fmts_end[];
 #endif
diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index 14beb7b9d304..ef9875a95f95 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -143,6 +143,7 @@ KVM_NVHE_ALIAS(__hyp_rodata_end);
 #ifdef CONFIG_NVHE_EL2_TRACING
 KVM_NVHE_ALIAS(__hyp_event_ids_start);
 KVM_NVHE_ALIAS(__hyp_event_ids_end);
+KVM_NVHE_ALIAS(__hyp_string_fmts_start);
 #endif
 
 /* pKVM static key */
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index af1d72020976..69ef676e659d 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -214,6 +214,14 @@ SECTIONS
 
 	HYPERVISOR_RODATA_SECTIONS
 
+#ifdef CONFIG_NVHE_EL2_TRACING
+	.rodata.hyp_string_fmts : {
+		__hyp_string_fmts_start = .;
+		*(_hyp_string_fmts)
+		__hyp_string_fmts_end = .;
+	}
+#endif
+
 	.got : { *(.got) }
 	/*
 	 * Make sure that the .got.plt is either completely empty or it
diff --git a/arch/arm64/kvm/hyp/include/nvhe/define_events.h b/arch/arm64/kvm/hyp/include/nvhe/define_events.h
index 776d4c6cb702..370e8c2d39fe 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/define_events.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/define_events.h
@@ -10,5 +10,3 @@
 #define HYP_EVENT_MULTI_READ
 #include <asm/kvm_hypevents.h>
 #undef HYP_EVENT_MULTI_READ
-
-#undef HYP_EVENT
diff --git a/arch/arm64/kvm/hyp/include/nvhe/trace.h b/arch/arm64/kvm/hyp/include/nvhe/trace.h
index 8813ff250f8e..d38e0fb284f8 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/trace.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/trace.h
@@ -46,6 +46,70 @@ static inline pid_t __tracing_get_vcpu_pid(struct kvm_cpu_context *host_ctxt)
 void *tracing_reserve_entry(unsigned long length);
 void tracing_commit_entry(void);
 
+/*
+ * The trace_hyp_printk boilerplate is too fiddly to be declared with
+ * HYP_EVENT():
+ *
+ * The string format is stored into a kernel-accessible ELF section. The
+ * hypervisor only writes the format ID.
+ *
+ * The function has a variadic prototype. We have no easy way to know each
+ * argument width so they must all cast to u64.
+ */
+#define REMOTE_EVENT_CUSTOM_PRINTK(...)
+
+#define __TO_U64_0()
+#define __TO_U64_1(x)			, (u64)(x)
+#define __TO_U64_2(x, ...)		, (u64)(x) __TO_U64_1(__VA_ARGS__)
+#define __TO_U64_3(x, ...)		, (u64)(x) __TO_U64_2(__VA_ARGS__)
+#define __TO_U64_4(x, ...)		, (u64)(x) __TO_U64_3(__VA_ARGS__)
+#define __TO_U64_5(x, ...)		, (u64)(x) __TO_U64_4(__VA_ARGS__)
+#define __TO_U64_6(x, ...)		, (u64)(x) __TO_U64_5(__VA_ARGS__)
+#define __TO_U64_7(x, ...)		, (u64)(x) __TO_U64_6(__VA_ARGS__)
+#define __TO_U64_8(x, ...)		, (u64)(x) __TO_U64_7(__VA_ARGS__)
+
+#define __TO_U64_X(N, ...)		CONCATENATE(__TO_U64_, N)(__VA_ARGS__)
+#define __TO_U64(...)			__TO_U64_X(COUNT_ARGS(__VA_ARGS__), ##__VA_ARGS__)
+
+REMOTE_EVENT_FORMAT(hyp_printk, HE_STRUCT(he_field(u16, fmt_id) he_field(u64, args[])));
+extern struct hyp_event_id hyp_event_id_hyp_printk;
+
+static __always_inline void __trace_hyp_printk(const struct hyp_string_fmt *fmt, int nr_args, ...)
+{
+	struct remote_event_format_hyp_printk *entry;
+	va_list va;
+	int i;
+
+	if (!atomic_read(&hyp_event_id_hyp_printk.enabled))
+		return;
+
+	entry = tracing_reserve_entry(struct_size(entry, args, nr_args));
+	if (!entry)
+		return;
+
+	entry->hdr.id = hyp_event_id_hyp_printk.id;
+	entry->fmt_id = fmt - __hyp_string_fmts_start;
+
+	va_start(va, nr_args);
+	for (i = 0; i < nr_args; i++)
+		entry->args[i] = va_arg(va, u64);
+	va_end(va);
+
+	tracing_commit_entry();
+}
+
+#define trace_hyp_printk(__fmt, __args...)						\
+do {											\
+	static const struct hyp_string_fmt __used __section("_hyp_string_fmts")		\
+	__hyp_str_fmt  = {								\
+		.fmt		= __fmt,						\
+		.nr_args	= COUNT_ARGS(__args),					\
+	};										\
+	BUILD_BUG_ON(sizeof(__fmt) > HYP_STRING_FMT_MAX_SIZE);				\
+	/* __TO_U64 prepends a comma if there are arguments */				\
+	__trace_hyp_printk(&__hyp_str_fmt, COUNT_ARGS(__args) __TO_U64(__args));	\
+} while (0)
+
 int __tracing_load(unsigned long desc_va, size_t desc_size);
 void __tracing_unload(void);
 int __tracing_enable(bool enable);
@@ -58,6 +122,8 @@ static inline void *tracing_reserve_entry(unsigned long length) { return NULL; }
 static inline void tracing_commit_entry(void) { }
 #define HYP_EVENT(__name, __proto, __struct, __assign, __printk)      \
 	static inline void trace_##__name(__proto) {}
+#define REMOTE_EVENT_CUSTOM_PRINTK(...)
+#define trace_hyp_printk(fmt, args...) do { } while (0)
 
 static inline int __tracing_load(unsigned long desc_va, size_t desc_size) { return -ENODEV; }
 static inline void __tracing_unload(void) { }
diff --git a/arch/arm64/kvm/hyp/nvhe/events.c b/arch/arm64/kvm/hyp/nvhe/events.c
index add9383aadb5..12223d2e3618 100644
--- a/arch/arm64/kvm/hyp/nvhe/events.c
+++ b/arch/arm64/kvm/hyp/nvhe/events.c
@@ -9,6 +9,12 @@
 
 #include <nvhe/define_events.h>
 
+/*
+ * The hyp_printk event is not declared with HYP_EVENT in kvm_hypevents.h,
+ * so we manually add the boilerplate here.
+ */
+HYP_EVENT(hyp_printk, 0, 0, 0, 0);
+
 int __tracing_enable_event(unsigned short id, bool enable)
 {
 	struct hyp_event_id *event_id = &__hyp_event_ids_start[id];
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 8faaec899f92..c61488d16f4c 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -402,6 +402,9 @@ static struct trace_remote_callbacks trace_remote_callbacks = {
 
 static const char *__hyp_enter_exit_reason_str(u8 reason);
 
+struct remote_event_format_hyp_printk;
+static void __hyp_trace_printk(struct remote_event_format_hyp_printk *entry, struct trace_seq *seq);
+
 #include "define_hypevents.h"
 
 static const char *__hyp_enter_exit_reason_str(u8 reason)
@@ -421,6 +424,61 @@ static const char *__hyp_enter_exit_reason_str(u8 reason)
 	return strs[min(reason, HYP_REASON_UNKNOWN)];
 }
 
+static void __hyp_trace_printk(struct remote_event_format_hyp_printk *entry, struct trace_seq *seq)
+{
+	const struct hyp_string_fmt *hyp_str_fmt;
+	const char *fmt;
+
+	trace_seq_putc(seq, ' ');
+
+	if (entry->fmt_id >= (__hyp_string_fmts_end - __hyp_string_fmts_start)) {
+		trace_seq_printf(seq, "Unknown hyp_string_fmt ID %u\n", entry->fmt_id);
+		return;
+	}
+
+	hyp_str_fmt = &__hyp_string_fmts_start[entry->fmt_id];
+	fmt = hyp_str_fmt->fmt;
+
+	switch (hyp_str_fmt->nr_args) {
+	case 0:
+		trace_seq_puts(seq, fmt);
+		break;
+	case 1:
+		trace_seq_printf(seq, fmt, entry->args[0]);
+		break;
+	case 2:
+		trace_seq_printf(seq, fmt, entry->args[0], entry->args[1]);
+		break;
+	case 3:
+		trace_seq_printf(seq, fmt, entry->args[0], entry->args[1], entry->args[2]);
+		break;
+	case 4:
+		trace_seq_printf(seq, fmt, entry->args[0], entry->args[1], entry->args[2],
+				 entry->args[3]);
+		break;
+	case 5:
+		trace_seq_printf(seq, fmt, entry->args[0], entry->args[1], entry->args[2],
+				 entry->args[3], entry->args[4]);
+		break;
+	case 6:
+		trace_seq_printf(seq, fmt, entry->args[0], entry->args[1], entry->args[2],
+				 entry->args[3], entry->args[4], entry->args[5]);
+		break;
+	case 7:
+		trace_seq_printf(seq, fmt, entry->args[0], entry->args[1], entry->args[2],
+				 entry->args[3], entry->args[4], entry->args[5], entry->args[6]);
+		break;
+	default:
+		trace_seq_printf(seq, fmt, entry->args[0], entry->args[1],
+				 entry->args[2], entry->args[3], entry->args[4], entry->args[5],
+				 entry->args[6], entry->args[7]);
+		break;
+	}
+
+	if (trace_seq_used(seq) && seq->buffer[trace_seq_used(seq) - 1] != '\n')
+		trace_seq_putc(seq, '\n');
+}
+
 static void __init hyp_trace_init_events(void)
 {
 	struct hyp_event_id *hyp_event_id = __hyp_event_ids_start;
@@ -430,6 +488,9 @@ static void __init hyp_trace_init_events(void)
 	/* Events on both sides hypervisor are sorted */
 	for (; event < __hyp_events_end; event++, hyp_event_id++, id++)
 		event->id = hyp_event_id->id = id;
+
+	WARN(__hyp_string_fmts_end - __hyp_string_fmts_start > U16_MAX + 1,
+	     "Too many trace_hyp_printk() callsites\n");
 }
 
 int __init kvm_hyp_trace_init(void)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


