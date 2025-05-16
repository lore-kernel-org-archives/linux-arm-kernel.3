Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C17C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 13:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uMPV6q6AhxevNFuuJTWHVmUqHFVmOMovU6ugpBlq244=; b=jKq4G1eBRUQhzIrfPH9yG+/x7W
	PZcdc8BdmQUJFIQeFIK70CNj2IFv+H4Jb8W9i45hoIB6U84DGfVcmyVFxjuzgzjfACC2xxJupFTsh
	VoHkpDfDlL0YuSSX21nPo1aeRJqQZalxpHqcxX8DsU7YqsjHrUmi1MhFpd1jn1PuDgfHJ40/7LzFf
	qUpTzSP1xn5RSZho+g8MmXJk13cHS6JkbFEWAweGFYtuIEu5qSQEMBrGJLSfXed6i/YoEgQ/DGIN1
	oYO/WeGzgMQDnEvLP7WLPrMMBXjzXixfiRHULppfn/l/zthwX9PwA/POOpR0tnkQzHb6GMiXdNqgo
	PX2FNx1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvaq-00000003bAB-2fcY;
	Fri, 16 May 2025 13:59:20 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvIw-00000003Xoi-3Id4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 13:40:51 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so14932385e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 06:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747402849; x=1748007649; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uMPV6q6AhxevNFuuJTWHVmUqHFVmOMovU6ugpBlq244=;
        b=zmlVcWTDG3YJ+kPj8wyjjEMczWKZJwpka2VkdPcknzjg7lobxGXeSuGOee2AIoQy4U
         fK0+C5dUYG+9nve0Z3ta7JvTSOoqy2gwpi8kpG351YG1QLBMNw2LGX/GM+j97T4tFQ8i
         Gfdb+okVc0OhRaK5lAocpGqcje53xV2psmugqT++CwDYHh2as7wj6FKk6u8eyjBt5aMS
         /X6JA3U3mTAD/IHCz8fS1gRTuP0b+A+aP6IwcMHhiDHP+MtCVMOMIrVVqFL2jCSB0rub
         pqJm7qty7l3buDBVdJc2lfg7rIbf2RbJCgoDHHkuKchSDeqpyGYRqrwMToNgpvf4CKLO
         InBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747402849; x=1748007649;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uMPV6q6AhxevNFuuJTWHVmUqHFVmOMovU6ugpBlq244=;
        b=UcBlQ/DqHQV9qtgpBmgkeAbgqfmA7aUr1WR0DgChwbbFnfW01KOHtqnKfCVp9Rhvzc
         sp6xgta0EAJWGaEq8YUPjnWtOcHGwf3BWcz69zegC9cfcL62qxeNYII9fz0GeY+S600d
         VnALgrizDu7BjeYWajBTVULBNIh51by2LrAfkVMxdoZ3L9UHKciAXMUNDwmeXQ5is9or
         4pBM/89ge6iJS55f2BKgPD1uy/gaz3I8FzT/DIC2qZmXrpiPjcm3DpYeAbyhICtJT7OT
         byIx9CHkNvcWU70J2kmhfn9Nrjk4T20M40clzVujvWWuPSLKpzn4uZjJ7sdaKI0EYUv4
         UeYg==
X-Forwarded-Encrypted: i=1; AJvYcCWBxyCoOhcCduk7UhOkctzvVew40tmHcGNLkK4rNFSHlP/cdKoh5nwZyR1g2LtaQytcUKV8hvONgSbBbjKu2Wdq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5X1DZIO7nX9sfDgr2n9Vyp3hkUnZqIYfYnhCl4EaWusoAw936
	Z9OoT94v0Zy1ZjlE0LVB5s0IBzQ3ePYmShs1Dr02wctqhcN225y7fzyquUgZoUs9drUhSBXXoXi
	VigmK/NeiIHCZhuwnwRS9wQ==
X-Google-Smtp-Source: AGHT+IHjdYekjEtSxYYuQf8wZlV0mGx8EyL0cimXZ1RlU//8JTdiC8v32KOEE5rEeE110DQaD1BJQza2ZZZwb4Cn
X-Received: from wmbei22.prod.google.com ([2002:a05:600c:3f16:b0:43c:ef1f:48d3])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f42:b0:442:f4d4:522 with SMTP id 5b1f17b1804b1-442fd60a5bemr35175355e9.5.1747402849231;
 Fri, 16 May 2025 06:40:49 -0700 (PDT)
Date: Fri, 16 May 2025 14:40:14 +0100
In-Reply-To: <20250516134031.661124-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250516134031.661124-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516134031.661124-9-vdonnefort@google.com>
Subject: [PATCH v5 08/25] tracing: Add helpers to create trace remote events
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
X-CRM114-CacheID: sfid-20250516_064050_824248_904BBAFF 
X-CRM114-Status: GOOD (  13.08  )
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

Declaring remote events can be cumbersome let's add a set of macros to
simplify developers life. The declaration of a remote event is very
similar to kernel's events:

 REMOTE_EVENT(name, id,
     RE_STRUCT(
        re_field(u64 foo)
     ),
     RE_PRINTK("foo=%llu", __entry->foo)
 )

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/trace_remote_event.h b/include/linux/trace_remote_event.h
index a4449008a075..c8ae1e1f5e72 100644
--- a/include/linux/trace_remote_event.h
+++ b/include/linux/trace_remote_event.h
@@ -5,6 +5,7 @@
 
 struct trace_remote;
 struct trace_event_fields;
+struct trace_seq;
 
 struct remote_event_hdr {
 	unsigned short	id;
@@ -20,4 +21,13 @@ struct remote_event {
 	char				*print_fmt;
 	void				(*print)(void *evt, struct trace_seq *seq);
 };
+
+#define RE_STRUCT(__args...) __args
+#define re_field(__type, __field) __type __field;
+
+#define REMOTE_EVENT_FORMAT(__name, __struct)	\
+	struct remote_event_format_##__name {	\
+		struct remote_event_hdr hdr;	\
+		__struct			\
+	}
 #endif
diff --git a/include/trace/define_remote_events.h b/include/trace/define_remote_events.h
new file mode 100644
index 000000000000..03c9f5515c5a
--- /dev/null
+++ b/include/trace/define_remote_events.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/trace_events.h>
+#include <linux/trace_remote_event.h>
+#include <linux/trace_seq.h>
+#include <linux/stringify.h>
+
+#define REMOTE_EVENT_INCLUDE(__file) __stringify(../../__file)
+
+#ifdef REMOTE_EVENT_SECTION
+# define __REMOTE_EVENT_SECTION(__name) __used __section(REMOTE_EVENT_SECTION"."#__name)
+#else
+# define __REMOTE_EVENT_SECTION(__name)
+#endif
+
+#define __REMOTE_PRINTK_COUNT_ARGS(_0, _1, _2, _n, __args...) _n
+#define REMOTE_PRINTK_COUNT_ARGS(__args...) __REMOTE_PRINTK_COUNT_ARGS(, ##__args, 2, 1, 0)
+
+#define __remote_printk0()								\
+	trace_seq_putc(seq, '\n')
+
+#define __remote_printk1(__fmt)								\
+	trace_seq_puts(seq, " " __fmt "\n")						\
+
+#define __remote_printk2(__fmt, __args...)						\
+do {											\
+	trace_seq_putc(seq, ' ');							\
+	trace_seq_printf(seq, __fmt, __args);						\
+	trace_seq_putc(seq, '\n');							\
+} while (0)
+
+/* Apply the appropriate trace_seq sequence according to the number of arguments */
+#define remote_printk(__args...)							\
+	CONCATENATE(__remote_printk, REMOTE_PRINTK_COUNT_ARGS(__args))(__args)
+
+#define RE_PRINTK(__args...) __args
+
+#define REMOTE_EVENT(__name, __id, __struct, __printk)					\
+	REMOTE_EVENT_FORMAT(__name, __struct);						\
+	static void remote_event_print_##__name(void *evt, struct trace_seq *seq)	\
+	{										\
+		struct remote_event_format_##__name __maybe_unused *__entry = evt;	\
+		trace_seq_puts(seq, #__name);						\
+		remote_printk(__printk);						\
+	}
+#include REMOTE_EVENT_INCLUDE(REMOTE_EVENT_INCLUDE_FILE)
+
+#undef REMOTE_EVENT
+#undef RE_PRINTK
+#undef re_field
+#define re_field(__type, __field)							\
+	{										\
+		.type = #__type, .name = #__field,					\
+		.size = sizeof(__type), .align = __alignof__(__type),			\
+		.is_signed = is_signed_type(__type),					\
+	},
+#define __entry REC
+#define RE_PRINTK(__fmt, __args...) "\"" __fmt "\", " __stringify(__args)
+#define REMOTE_EVENT(__name, __id, __struct, __printk)					\
+	static struct trace_event_fields remote_event_fields_##__name[] = {		\
+		__struct								\
+		{}									\
+	};										\
+	static char remote_event_print_fmt_##__name[] = __printk;			\
+	static struct remote_event __REMOTE_EVENT_SECTION(__name)			\
+	remote_event_##__name = {							\
+		.name		= #__name,						\
+		.id		= __id,							\
+		.fields		= remote_event_fields_##__name,				\
+		.print_fmt	= remote_event_print_fmt_##__name,			\
+		.print		= remote_event_print_##__name,				\
+	}
+#include REMOTE_EVENT_INCLUDE(REMOTE_EVENT_INCLUDE_FILE)
-- 
2.49.0.1101.gccaa498523-goog


