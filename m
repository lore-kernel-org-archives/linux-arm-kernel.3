Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD48BCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8KNLbl8QdPPBMIgkSLN8a6S+JK5BFx4uC+e5u2r3tFA=; b=ZkQf+2vRqJ0vGat4x8OxZQ7GBw
	mwqbn4JlFu8ehi4pO9KtLEnVUpU9UK3sJggd32SeKTmZwsXd9bUMcpB5BpGCpYwCDZ2EABMKdmI+4
	baIIh4BitbcvNCrw+gehTlQsuueHMmjEy/2RJGUScIt85kBLfGPU65zk4Mw2crAot9aKF91abxZBm
	Xkl1sx67+PF97OaX51PFbCoAfJwoem3p9/REmLzev+198Pb3XJWso3FNeD8a3Zmm0hMpIRD+74E1K
	OQgqOMHC97Zju+Bm4THPuCDVn0O8iFQDTd80MCnpWwBcUYHh975c0XSBTUbEa3ot5/ZOAEog6oJXM
	xl+Rjuuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIwx-0000000Gzjs-1qRn;
	Fri, 07 Nov 2025 09:40:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIwE-0000000Gyo8-2E2Q
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Nov 2025 09:39:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8KNLbl8QdPPBMIgkSLN8a6S+JK5BFx4uC+e5u2r3tFA=; b=d00Xe6/s55CenXhbMVo3ekNnCn
	in7FtnfOsnCHXsAD20Q/LFzDuqcodhCnqqdvK8DwAFZ5ouMDqVNJEuhFoADc8n+qKAtdHi7FhBvmk
	9RGaRduA5cC/2rLsXY8xACGepdpvBEsvy0e4yzCnVxXVD2rA4rbQKEbhNGakVDwSDqm7RgFLChTxo
	gS/sVZCo9pFt3UmvYaFo+GI4OLEAkoYXRTzSK8olwHvT9zjFP2nVwM5RKhe7lgmC1TCjzeca+Qb/L
	zoXG3MvcrrSop67eMlq6E0VjpcgqHNkMKgxfDuUcS4eoP1GdFlS4X7dV321wVXz21605xrcuwB9op
	rDG20ucA==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHI4R-000000064mU-1UcW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 08:43:51 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4721b4f3afbso2459025e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 01:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762508352; x=1763113152; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8KNLbl8QdPPBMIgkSLN8a6S+JK5BFx4uC+e5u2r3tFA=;
        b=4km4wMC12lV5pvRyoQTUe4oJDscOsVRx2dpsmqrvBdyP4rxuBX/X6bUTctqUTRt4/S
         Kz84lWNECM9cAZ3nZgYVVHI4x5hvLb3kQ3VNihXor3b9lBn0N/nK+Qg1HpOS7URNcwee
         IA56ot4H8xibhwAkrxzRfJfiRWeeEbFtMf0j13UpiCoUi5c66hvUD38cs1q7eWrTC51B
         awoCsgvYOYNl0j8mn/tFHetfOb+0d7QFOHQ11fmYm2TYpheumCUW4ntIE58h2bqWyrP5
         9FrSoKjnrDgBOI9qaeJtAUiDQjJQI0kejDRnuoaJJEBcNGfG3f7w+r80WvvS8jrIlk48
         F6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762508352; x=1763113152;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8KNLbl8QdPPBMIgkSLN8a6S+JK5BFx4uC+e5u2r3tFA=;
        b=UZPAUimpv/nf+bz6BKT8TIWJ7X2KlZYj2HsKU/QkGqzKMDm8I56aKJVz9NnAY1xZsy
         U5Y0hPkJiZkHJD9x385NAU9Vn5DzfW4dutcXDDMffK4R0ol3IIqpAoSTqu4f/gcMuZiZ
         qZ1eEcWzIGZQQTMdwnXC1bdV2tmYRkKinDLkVSYgc2c1pj1NOz19CPiXEOTYiYeDxc0F
         KMB99OSZc/uLMmpDaJ8SS8xxdYo0K/lwEkwwd8QdsOJE+koVXOdTLLQSaD3W3t5d4l4w
         MIv/Fnzf5RUiqHmf4Ue73q3pLfUNYDGFFrvAjsK/7NfVbyjasnJPfd5AVfzkb8OlQCcy
         mYww==
X-Forwarded-Encrypted: i=1; AJvYcCXZFUCO+Of/zirEuPpk12GidSsNJgkEtqK4QQR2v3dmyW5JQsRUOHjXrnLJ6xBK2HaHTW7YXy4SrQtD8Re0yrcA@lists.infradead.org
X-Gm-Message-State: AOJu0YxyVW03YhEiFVBwNojTgTcg6XOn2Q6J4pJNOEG/NWzut80TD3fz
	FJ7uBlBZ01RR3QsM0kW826UVsdKbaoORVGFGvG8dEal+AB/+g++/biH6cvAmcuKVefLrvic+W5o
	zcqWjmWLoI+X7ro61sxZRJg==
X-Google-Smtp-Source: AGHT+IHmNTKIfmJBSV1zkhye9J1bZMXznN6MdE2ykHFf8Q6WXhD9/5vx9kVWIQamab59N40QbsoOW07BLrHumaQu
X-Received: from wmbz19.prod.google.com ([2002:a05:600c:c093:b0:475:d8ac:bbb0])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d0b:b0:477:cb6:805e with SMTP id 5b1f17b1804b1-4776bcac819mr17070115e9.18.1762508351802;
 Fri, 07 Nov 2025 01:39:11 -0800 (PST)
Date: Fri,  7 Nov 2025 09:38:37 +0000
In-Reply-To: <20251107093840.3779150-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251107093840.3779150-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251107093840.3779150-26-vdonnefort@google.com>
Subject: [PATCH v8 25/28] KVM: arm64: Add event support to the pKVM hyp and
 trace remote
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
X-CRM114-CacheID: sfid-20251107_084349_305022_5FD4D7B4 
X-CRM114-Status: GOOD (  21.06  )
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

Allow the creation of hypervisor and trace remote events with a single
macro HYP_EVENT(). That macro expands in the kernel side to add all
the required declarations (based on REMOTE_EVENT()) as well as in the
hypervisor side to create the trace_<event>() function.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 4faabf398881..f7b29eae7010 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -95,6 +95,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_enable_tracing,
 	__KVM_HOST_SMCCC_FUNC___pkvm_reset_tracing,
 	__KVM_HOST_SMCCC_FUNC___pkvm_swap_reader_tracing,
+	__KVM_HOST_SMCCC_FUNC___pkvm_enable_event,
 };
 
 #define DECLARE_KVM_VHE_SYM(sym)	extern char sym[]
diff --git a/arch/arm64/include/asm/kvm_define_hypevents.h b/arch/arm64/include/asm/kvm_define_hypevents.h
new file mode 100644
index 000000000000..0ef5a9eefcbe
--- /dev/null
+++ b/arch/arm64/include/asm/kvm_define_hypevents.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef HYP_EVENT_FILE
+# undef __ARM64_KVM_HYPEVENTS_H_
+# define REMOTE_EVENT_INCLUDE_FILE arch/arm64/include/asm/kvm_hypevents.h
+#else
+# define REMOTE_EVENT_INCLUDE_FILE HYP_EVENT_FILE
+#endif
+
+#define REMOTE_EVENT_SECTION "_hyp_events"
+
+#define HE_STRUCT(__args)		__args
+#define HE_PRINTK(__args...)		__args
+#define he_field			re_field
+
+#define HYP_EVENT(__name, __proto, __struct, __assign, __printk) \
+	REMOTE_EVENT(__name, 0, RE_STRUCT(__struct), RE_PRINTK(__printk))
+
+#define HYP_EVENT_MULTI_READ
+
+#include <trace/define_remote_events.h>
diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h
new file mode 100644
index 000000000000..d6e033c96c52
--- /dev/null
+++ b/arch/arm64/include/asm/kvm_hypevents.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#if !defined(__ARM64_KVM_HYPEVENTS_H_) || defined(HYP_EVENT_MULTI_READ)
+#define __ARM64_KVM_HYPEVENTS_H_
+
+#ifdef __KVM_NVHE_HYPERVISOR__
+#include <nvhe/trace.h>
+#endif
+
+#endif
diff --git a/arch/arm64/include/asm/kvm_hyptrace.h b/arch/arm64/include/asm/kvm_hyptrace.h
index 9c30a479bc36..d6e0953a07d6 100644
--- a/arch/arm64/include/asm/kvm_hyptrace.h
+++ b/arch/arm64/include/asm/kvm_hyptrace.h
@@ -10,4 +10,17 @@ struct hyp_trace_desc {
 	struct trace_buffer_desc	trace_buffer_desc;
 
 };
+
+struct hyp_event_id {
+	unsigned short	id;
+	void		*data;
+};
+
+extern struct remote_event __hyp_events_start[];
+extern struct remote_event __hyp_events_end[];
+
+/* hyp_event section used by the hypervisor */
+extern struct hyp_event_id __hyp_event_ids_start[];
+extern struct hyp_event_id __hyp_event_ids_end[];
+
 #endif
diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index 5369763606e7..c0efa9aa541b 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -137,6 +137,10 @@ KVM_NVHE_ALIAS(__hyp_data_start);
 KVM_NVHE_ALIAS(__hyp_data_end);
 KVM_NVHE_ALIAS(__hyp_rodata_start);
 KVM_NVHE_ALIAS(__hyp_rodata_end);
+#ifdef CONFIG_PKVM_TRACING
+KVM_NVHE_ALIAS(__hyp_event_ids_start);
+KVM_NVHE_ALIAS(__hyp_event_ids_end);
+#endif
 
 /* pKVM static key */
 KVM_NVHE_ALIAS(kvm_protected_mode_initialized);
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index ad6133b89e7a..0e201a3c8de5 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -13,12 +13,23 @@
 	*(__kvm_ex_table)					\
 	__stop___kvm_ex_table = .;
 
+#ifdef CONFIG_PKVM_TRACING
+#define HYPERVISOR_EVENT_IDS 					\
+	. = ALIGN(PAGE_SIZE);					\
+	__hyp_event_ids_start = .;				\
+	*(HYP_SECTION_NAME(.event_ids))				\
+	__hyp_event_ids_end = .;
+#else
+#define HYPERVISOR_EVENT_IDS
+#endif
+
 #define HYPERVISOR_RODATA_SECTIONS				\
 	HYP_SECTION_NAME(.rodata) : {				\
 		. = ALIGN(PAGE_SIZE);				\
 		__hyp_rodata_start = .;				\
 		*(HYP_SECTION_NAME(.data..ro_after_init))	\
 		*(HYP_SECTION_NAME(.rodata))			\
+		HYPERVISOR_EVENT_IDS				\
 		. = ALIGN(PAGE_SIZE);				\
 		__hyp_rodata_end = .;				\
 	}
@@ -307,6 +318,13 @@ SECTIONS
 
 	HYPERVISOR_DATA_SECTION
 
+#ifdef CONFIG_PKVM_TRACING
+	.data.hyp_events : {
+		__hyp_events_start = .;
+		*(SORT(_hyp_events.*))
+		__hyp_events_end = .;
+	}
+#endif
 	/*
 	 * Data written with the MMU off but read with the MMU on requires
 	 * cache lines to be invalidated, discarding up to a Cache Writeback
diff --git a/arch/arm64/kvm/hyp/include/nvhe/define_events.h b/arch/arm64/kvm/hyp/include/nvhe/define_events.h
new file mode 100644
index 000000000000..2298b49cb355
--- /dev/null
+++ b/arch/arm64/kvm/hyp/include/nvhe/define_events.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef HYP_EVENT_FILE
+# define __HYP_EVENT_FILE <asm/kvm_hypevents.h>
+#else
+# define __HYP_EVENT_FILE __stringify(HYP_EVENT_FILE)
+#endif
+
+#undef HYP_EVENT
+#define HYP_EVENT(__name, __proto, __struct, __assign, __printk)	\
+	atomic_t __ro_after_init __name##_enabled = ATOMIC_INIT(0);	\
+	struct hyp_event_id hyp_event_id_##__name			\
+	__section(".hyp.event_ids."#__name) = {				\
+		.data = (void *)&__name##_enabled,			\
+	}
+
+#define HYP_EVENT_MULTI_READ
+#include __HYP_EVENT_FILE
+#undef HYP_EVENT_MULTI_READ
+
+#undef HYP_EVENT
diff --git a/arch/arm64/kvm/hyp/include/nvhe/trace.h b/arch/arm64/kvm/hyp/include/nvhe/trace.h
index 0d2732f0d406..f7b286e92853 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/trace.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/trace.h
@@ -1,21 +1,52 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 #ifndef __ARM64_KVM_HYP_NVHE_TRACE_H
 #define __ARM64_KVM_HYP_NVHE_TRACE_H
+
+#include <linux/trace_remote_event.h>
+
 #include <asm/kvm_hyptrace.h>
 
+#define HE_PROTO(__args...)	__args
+
 #ifdef CONFIG_PKVM_TRACING
 void *tracing_reserve_entry(unsigned long length);
 void tracing_commit_entry(void);
 
+#define HE_ASSIGN(__args...)	__args
+#define HE_STRUCT		RE_STRUCT
+#define he_field		re_field
+
+#define HYP_EVENT(__name, __proto, __struct, __assign, __printk)		\
+	REMOTE_EVENT_FORMAT(__name, __struct);					\
+	extern atomic_t __name##_enabled;					\
+	extern struct hyp_event_id hyp_event_id_##__name;			\
+	static __always_inline void trace_##__name(__proto)			\
+	{									\
+		struct remote_event_format_##__name *__entry;			\
+		size_t length = sizeof(*__entry);				\
+										\
+		if (!atomic_read(&__name##_enabled))				\
+			return;							\
+		__entry = tracing_reserve_entry(length);			\
+		if (!__entry)							\
+			return;							\
+		__entry->hdr.id = hyp_event_id_##__name.id;			\
+		__assign							\
+		tracing_commit_entry();						\
+	}
+
 void __pkvm_update_clock_tracing(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
 int __pkvm_load_tracing(unsigned long desc_va, size_t desc_size);
 void __pkvm_unload_tracing(void);
 int __pkvm_enable_tracing(bool enable);
 int __pkvm_reset_tracing(unsigned int cpu);
 int __pkvm_swap_reader_tracing(unsigned int cpu);
+int __pkvm_enable_event(unsigned short id, bool enable);
 #else
 static inline void *tracing_reserve_entry(unsigned long length) { return NULL; }
 static inline void tracing_commit_entry(void) { }
+#define HYP_EVENT(__name, __proto, __struct, __assign, __printk)      \
+	static inline void trace_##__name(__proto) {}
 
 static inline
 void __pkvm_update_clock_tracing(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc) { }
@@ -24,5 +55,6 @@ static inline void __pkvm_unload_tracing(void) { }
 static inline int __pkvm_enable_tracing(bool enable) { return -ENODEV; }
 static inline int __pkvm_reset_tracing(unsigned int cpu) { return -ENODEV; }
 static inline int __pkvm_swap_reader_tracing(unsigned int cpu) { return -ENODEV; }
+static inline int __pkvm_enable_event(unsigned short id, bool enable)  { return -ENODEV; }
 #endif
 #endif
diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index 504c3b9caef8..b77959e963f3 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -29,7 +29,7 @@ hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
 	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o
 hyp-obj-y += ../../../kernel/smccc-call.o
 hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
-hyp-obj-$(CONFIG_PKVM_TRACING) += clock.o trace.o ../../../../../kernel/trace/simple_ring_buffer.o
+hyp-obj-$(CONFIG_PKVM_TRACING) += clock.o trace.o ../../../../../kernel/trace/simple_ring_buffer.o events.o
 hyp-obj-y += $(lib-objs)
 
 ##
diff --git a/arch/arm64/kvm/hyp/nvhe/events.c b/arch/arm64/kvm/hyp/nvhe/events.c
new file mode 100644
index 000000000000..5905b42cb0d0
--- /dev/null
+++ b/arch/arm64/kvm/hyp/nvhe/events.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Google LLC
+ * Author: Vincent Donnefort <vdonnefort@google.com>
+ */
+
+#include <nvhe/mm.h>
+#include <nvhe/trace.h>
+
+#include <nvhe/define_events.h>
+
+extern struct hyp_event_id __hyp_event_ids_start[];
+extern struct hyp_event_id __hyp_event_ids_end[];
+
+int __pkvm_enable_event(unsigned short id, bool enable)
+{
+	struct hyp_event_id *event_id = __hyp_event_ids_start;
+	atomic_t *enable_key;
+
+	for (; (unsigned long)event_id < (unsigned long)__hyp_event_ids_end;
+	     event_id++) {
+		if (event_id->id != id)
+			continue;
+
+		enable_key = (atomic_t *)event_id->data;
+		enable_key = hyp_fixmap_map(__hyp_pa(enable_key));
+
+		atomic_set(enable_key, enable);
+
+		hyp_fixmap_unmap();
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 8adad701fc76..5e4b519e5204 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -634,6 +634,14 @@ static void handle___pkvm_swap_reader_tracing(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 1) = __pkvm_swap_reader_tracing(cpu);
 }
 
+static void handle___pkvm_enable_event(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(unsigned short, id, host_ctxt, 1);
+	DECLARE_REG(bool, enable, host_ctxt, 2);
+
+	cpu_reg(host_ctxt, 1) = __pkvm_enable_event(id, enable);
+}
+
 typedef void (*hcall_t)(struct kvm_cpu_context *);
 
 #define HANDLE_FUNC(x)	[__KVM_HOST_SMCCC_FUNC_##x] = (hcall_t)handle_##x
@@ -681,6 +689,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_enable_tracing),
 	HANDLE_FUNC(__pkvm_reset_tracing),
 	HANDLE_FUNC(__pkvm_swap_reader_tracing),
+	HANDLE_FUNC(__pkvm_enable_event),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp.lds.S b/arch/arm64/kvm/hyp/nvhe/hyp.lds.S
index d724f6d69302..a68411bf4bef 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp.lds.S
+++ b/arch/arm64/kvm/hyp/nvhe/hyp.lds.S
@@ -16,6 +16,12 @@ SECTIONS {
 	HYP_SECTION(.text)
 	HYP_SECTION(.data..ro_after_init)
 	HYP_SECTION(.rodata)
+#ifdef CONFIG_PKVM_TRACING
+	. = ALIGN(PAGE_SIZE);
+	BEGIN_HYP_SECTION(.event_ids)
+		*(SORT(.hyp.event_ids.*))
+	END_HYP_SECTION
+#endif
 
 	/*
 	 * .hyp..data..percpu needs to be page aligned to maintain the same
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 1062b4310f8c..73539f5b5e42 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -307,7 +307,7 @@ static int hyp_trace_reset(unsigned int cpu, void *priv)
 
 static int hyp_trace_enable_event(unsigned short id, bool enable, void *priv)
 {
-	return 0;
+	return kvm_call_hyp_nvhe(__pkvm_enable_event, id, enable);
 }
 
 static int hyp_trace_clock_show(struct seq_file *m, void *v)
@@ -334,10 +334,27 @@ static struct trace_remote_callbacks trace_remote_callbacks = {
 	.enable_event		= hyp_trace_enable_event,
 };
 
+#include <asm/kvm_define_hypevents.h>
+
+static void hyp_trace_init_events(void)
+{
+	struct hyp_event_id *hyp_event_id = __hyp_event_ids_start;
+	struct remote_event *event = __hyp_events_start;
+	int id = 0;
+
+	/* Events on both sides hypervisor are sorted */
+	for (; (unsigned long)event < (unsigned long)__hyp_events_end;
+		event++, hyp_event_id++, id++)
+		event->id = hyp_event_id->id = id;
+}
+
 int hyp_trace_init(void)
 {
 	if (!is_protected_kvm_enabled())
 		return 0;
 
-	return trace_remote_register("hypervisor", &trace_remote_callbacks, &trace_buffer, NULL, 0);
+	hyp_trace_init_events();
+
+	return trace_remote_register("hypervisor", &trace_remote_callbacks, &trace_buffer,
+				     __hyp_events_start, __hyp_events_end - __hyp_events_start);
 }
diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 4f2b67d1bfec..e54cc3e75dc5 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -1040,7 +1040,7 @@ static int remote_event_format_show(struct seq_file *s, void *unused)
 	while (field->name) {
 		seq_printf(s, "\tfield:%s %s;\toffset:%zu;\tsize:%u;\tsigned:%d;\n",
 			   field->type, field->name, offset, field->size,
-			   !field->is_signed);
+			   field->is_signed);
 		offset += field->size;
 		field++;
 	}
@@ -1071,7 +1071,7 @@ static int remote_event_callback(const char *name, umode_t *mode, void **data,
 
 	if (!strcmp(name, "format")) {
 		*mode = TRACEFS_MODE_READ;
-		*fops = &remote_event_id_fops;
+		*fops = &remote_event_format_fops;
 		return 1;
 	}
 
-- 
2.51.2.1041.gc1ab5b90ca-goog


