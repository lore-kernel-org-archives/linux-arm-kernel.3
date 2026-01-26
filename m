Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF6ACF65D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eBVdHdK5pnty3kUjGmHkkia8pj/26sMijHr3rT8k8L0=; b=u+qqSCR9qF6cEtcvoA4ihkOE9X
	YiSlVKtP3FgZU/CIsuKN5JtsGFx7XYqpw0nYFjHApDZI8hqFkwtROq+v57bhiRYKwlOjMX2LlJYb5
	rN9SJmQiqkcwX+Q3EP8SCIJAgK8KQ80IjNQhnatin8DmVJxc9BY9EgwcmlLwiKEICR3xreJxGVeP0
	Ar2D6JCuZVJje+wOw+QorP4gkyRnfbVGHIM6Op1TFedkLA2cHVenh1qqWnBuqpRE3k7jcWyllLH63
	wqYp7CrTamiZeX6rZzDR4ghZ5Q58qKzaBfIAiZfam5RJDCqUUOakWbB9y4o9BJKYC+8Uig2d4Qgmw
	+g3pRWqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5o-0000000CJyD-1jvL;
	Mon, 26 Jan 2026 10:45:12 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5G-0000000CJOa-22t1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:44:40 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-480600391e2so7883205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 02:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769424276; x=1770029076; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eBVdHdK5pnty3kUjGmHkkia8pj/26sMijHr3rT8k8L0=;
        b=xb/6R90SOpvfjsyIIImWIQdWP29UKXlIAEN1ceTwTeA2QuPujgxtbKfiZcQEpyroZ4
         0fDMXcYB2hir9Qz3GRTlr+g+C6oDetk1/Nk4rI8L+iQFdraKznljPPf+WGQqVxtMbOkO
         OwO+XYTPgyMKOUaeab36Au2vzqMRuG4lDNChxwDOQApV7LbpeonaTkXW7nFF6ibuMPJ9
         1kpSQn3+QHO/rSBHbNXIkUp7E2lYfr4GibUSz6au+x/iNOoj4RVelx841NyPeTIUy21R
         MJfo+bj1RZ4NKSMJkGkp9h3Vi7s8JJzP5NfbMDvg+geXC22j9AeSsWdN2motESjybsZC
         9POQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424276; x=1770029076;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eBVdHdK5pnty3kUjGmHkkia8pj/26sMijHr3rT8k8L0=;
        b=p2YkomUGY+5Rg1MTYnEuSfnmXMrnvDd/bKcqcixb0yZ7sayRLu0XPFZu7FAumlF4M7
         tE9JLWY6QCZWtUFBfixvwmXyjFYjyUKLWkOT2Kv/iz90gdBIxExLfn74joIyOZDskqcz
         DjqkSWBH3WNhr4KbQpyASNl3fBoLQLiMW4ytaz9aQH5cymWr1aJTZT+kwd/Y9/nmKN/n
         JXF9pq3p8FY1F3gBRUepgdhYUmC6EMZx/MMYYcsYDgWyLJDDbYCO8AglP3iUSLcRKqBZ
         Jyh2DvUg8vyM/LD+PjcnXVZsFfZ8o1YI64Xy7m0BA126uHI4eWcJeHch1HhNcC7Jmwia
         /whw==
X-Forwarded-Encrypted: i=1; AJvYcCUKOYUvNYpecY+TM9ux4O8XTJh2QUdjp2t5np+RuKmUW3vk5jjLgsr9Xj/ufntFDgEjtXZr7aonxIFJBxOk/gsD@lists.infradead.org
X-Gm-Message-State: AOJu0YyH79/uu5bLBljVwugXPSJmczgqJMzbkxt2IJ07f/SAf87Xm0lw
	i6X0uBuycS5nyZ6IGQrHes1eBOkf3E3VcP1/vgG6qzTf+O17UfSXKf6fVo56QUSGvQOBJOlmZmU
	uqeKXlrZkBYFHom4XNVP0cA==
X-Received: from wmdv19.prod.google.com ([2002:a05:600c:12d3:b0:47e:e953:a478])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a306:b0:477:a246:8398 with SMTP id 5b1f17b1804b1-4805d9664aemr50974305e9.2.1769424276747;
 Mon, 26 Jan 2026 02:44:36 -0800 (PST)
Date: Mon, 26 Jan 2026 10:44:00 +0000
In-Reply-To: <20260126104419.1649811-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260126104419.1649811-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126104419.1649811-12-vdonnefort@google.com>
Subject: [PATCH v10 11/30] tracing: Add helpers to create trace remote events
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
X-CRM114-CacheID: sfid-20260126_024438_717911_B410395F 
X-CRM114-Status: GOOD (  13.52  )
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
index 000000000000..676e803dc144
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
+#define REMOTE_PRINTK_COUNT_ARGS(__args...) \
+	__COUNT_ARGS(, ##__args, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 0)
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
2.52.0.457.g6b5491de43-goog


