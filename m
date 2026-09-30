Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63219CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22jRFGKxaXFtlNaZ+C1HtHMLzFRhPhrTjV8Sjs2+m0c=; b=gcGvep+Yc1fz7xiaswE25sDXJ/
	s72OqZS1l1hbe89sRNjXW384oAeWi0ft5hxNpGcacFcz5KrzzFrD0R0Tw15cPe3gWcGmMJL7dH8+L
	w6gFFxZj99kpZK76SPjjcSfyldezv4sEjRDHXQqIcoVbOI1Oz+w/4gzua0YZVDe9HzQjuZN/iEtf8
	72dGvos3Pg8HMoGORk2mNXoGPKghcySXeQq6GGe/DXyd1cpPgXpSH5+2y1zWpLEcDhX30XhGaDkgG
	XponPtYItXaOyl+lCXjgT3hE+9JPKPFjE3JVztLoG4bkiQXlmgArqQyB45Y6BaYI0yUaRZYZIbKL3
	l25Vl+TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwLJ-00000006XKX-2vIr;
	Wed, 30 Sep 2026 15:35:37 +0000
Received: from mail-wm1-f71.google.com ([209.85.128.71])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwLC-00000006XHQ-1aFx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:35:32 +0000
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so47040605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 08:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790782527; x=1791387327; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=22jRFGKxaXFtlNaZ+C1HtHMLzFRhPhrTjV8Sjs2+m0c=;
        b=vKXY4E0KD3Y6BVd1xx9Va6e2slGiHPLPJFd7OnZwulY3GYJ85VNyGO4cfDy3L+f44p
         Rr7FbhfQeha0x9oZjqzVxr5fkgLG55E4PqyOMU50E/dBQqMUbeC4YE0ikWhppE347G5o
         or5ySOSfcE6v/EOOL19znTrtQP5l55PRZKAhCjsd38olfNtcKDKoYmauD+L74B4h21IM
         OoxqvR1k3kSbGY2uzVVercHm/Nt7t3zzcSb16s293+Syn5/BMSKcSgFl+VKe8bH8MHWa
         gwDtoXYncaMAOgXFpj5ygy1yu/xCS3fDKtXS7Fe39KKGQunwCs2TM6493c5b5hcEKhrX
         kieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790782527; x=1791387327;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=22jRFGKxaXFtlNaZ+C1HtHMLzFRhPhrTjV8Sjs2+m0c=;
        b=PwrjSEbKUZ523RlNwZwAWoEUPzLexUHdkuxf54o+KB9FSVsfAhpwhgJsWerjhZcMoc
         nkCaMOA7oi2003b84UFa28PCostfTkGRvUrsnlcLP0s2Mog8vgA+jm7Qtn5/Z6jcDVXZ
         0DmT+P71i0yxNIQrsNz0qCQyN72t7wIjVBDswY9V8A54ffc/s8Rjq/4Bbbc8rXwTdttx
         wPCMDpsWx/Bw5wcHWyCRInJq9acJE6sooC42K1Sb19KgRVbBH/Dc4HXDGTf2POfZm3CD
         JgM+txWtOGsajwJ3g15/mP8Bx2mhXqe4ZBC1Jy1jS16uDIQPqdlpSoJ0zuGPh8M7g8Dc
         2/aA==
X-Forwarded-Encrypted: i=1; AKwUvBwg4B05RIo/PeHUd60yXyP2b4eNwHXUCpzIi6Zq1YtXExHkBHgaXzkptMrUTQapDpnPqd2q6ZLZ/6zoa8fHpqFe@lists.infradead.org
X-Gm-Message-State: AFuF++nux9TNceAD2BeogC6QpHNOC7BuDIWoMuN6VfVgBQepBm4LwqtI
	4nth9ogf2r5aF470C40D6S+QqOt32KCdYb3bJdItLBhBdd8PNo95Grmxma5F8kXz5DljWn1H8Xt
	1/a89ONxWE5KfrFVnyyS6Qg==
X-Received: from wmox21.prod.google.com ([2002:a05:600c:1795:b0:4a0:1203:95d0])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b21:b0:49e:817a:ca7 with SMTP id 5b1f17b1804b1-4a01afe1ec3mr31096795e9.8.1790782527166;
 Wed, 30 Sep 2026 08:35:27 -0700 (PDT)
Date: Wed, 30 Sep 2026 16:35:05 +0100
In-Reply-To: <20260930153505.2144559-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260930153505.2144559-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930153505.2144559-5-vdonnefort@google.com>
Subject: [PATCH v3 4/4] KVM: arm64: Add hyp_printk event to nVHE/pKVM hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_083530_491738_4A49C39E 
X-CRM114-Status: GOOD (  26.40  )
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

To not waste tracing buffer data, use a dynamic size. Each
argument is 8 bytes and the in-kernel printing function can simply know
how many of them there are by looking at the event length.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_hypevents.h        | 14 ++++
 arch/arm64/include/asm/kvm_hyptrace.h         |  8 +++
 arch/arm64/kernel/image-vars.h                |  1 +
 arch/arm64/kernel/vmlinux.lds.S               |  4 ++
 .../kvm/hyp/include/nvhe/define_events.h      |  2 -
 arch/arm64/kvm/hyp/include/nvhe/trace.h       | 65 +++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/events.c              |  6 ++
 arch/arm64/kvm/hyp_trace.c                    | 61 +++++++++++++++++
 8 files changed, 159 insertions(+), 2 deletions(-)

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
index de133b735f72..46097105fdd8 100644
--- a/arch/arm64/include/asm/kvm_hyptrace.h
+++ b/arch/arm64/include/asm/kvm_hyptrace.h
@@ -23,4 +23,12 @@ extern struct remote_event __hyp_events_end[];
 extern struct hyp_event_id __hyp_event_ids_start[];
 extern struct hyp_event_id __hyp_event_ids_end[];
 
+#define HYP_STRING_FMT_MAX_SIZE 128
+
+struct hyp_string_fmt {
+	const char	fmt[HYP_STRING_FMT_MAX_SIZE];
+};
+
+extern struct hyp_string_fmt __hyp_string_fmts_start[];
+extern struct hyp_string_fmt __hyp_string_fmts_end[];
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
index af1d72020976..7f9b6c7dfe70 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -324,6 +324,10 @@ SECTIONS
 		__hyp_events_start = .;
 		*(SORT(_hyp_events.*))
 		__hyp_events_end = .;
+
+		__hyp_string_fmts_start = .;
+		*(_hyp_string_fmts)
+		__hyp_string_fmts_end = .;
 	}
 #endif
 	/*
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
index 8813ff250f8e..3d0b5c634bb3 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/trace.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/trace.h
@@ -46,6 +46,69 @@ static inline pid_t __tracing_get_vcpu_pid(struct kvm_cpu_context *host_ctxt)
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
+static __always_inline void __trace_hyp_printk(struct hyp_string_fmt *fmt, int nr_args, ...)
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
+
+#define trace_hyp_printk(__fmt, __args...)						\
+do {											\
+	static struct hyp_string_fmt __used __section("_hyp_string_fmts") fmt = {	\
+		.fmt = __fmt								\
+	};										\
+	BUILD_BUG_ON(sizeof(__fmt) > HYP_STRING_FMT_MAX_SIZE);				\
+	/* __TO_U64 prepends a comma if there are arguments */				\
+	__trace_hyp_printk(&fmt, COUNT_ARGS(__args) __TO_U64(__args));			\
+} while (0)
+
 int __tracing_load(unsigned long desc_va, size_t desc_size);
 void __tracing_unload(void);
 int __tracing_enable(bool enable);
@@ -58,6 +121,8 @@ static inline void *tracing_reserve_entry(unsigned long length) { return NULL; }
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
index 8faaec899f92..9d4378bcad74 100644
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
+	const char *fmt = (const char *)(&__hyp_string_fmts_start[entry->fmt_id]);
+	struct ring_buffer_event *evt = (void *)entry - RB_EVNT_HDR_SIZE;
+	int nr_args;
+
+	trace_seq_putc(seq, ' ');
+
+	if ((void *)fmt >= (void *)__hyp_string_fmts_end) {
+		trace_seq_printf(seq, "Unknown hyp_string_fmt ID %d\n", entry->fmt_id);
+		return;
+	}
+
+	nr_args = (ring_buffer_event_length(evt) -
+		   offsetof(struct remote_event_format_hyp_printk, args)) / sizeof(entry->args[0]);
+	switch (nr_args) {
+	case 0:
+		trace_seq_printf(seq, fmt);
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
+	if (seq->buffer[trace_seq_used(seq) - 1] != '\n')
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


