Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E535CCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VlIvMmYTYW9xFXQL0KLrUt7g4tYarY39wioQ68L5ZKE=; b=23Te0zYEqKhY5l1cr4tg/HfVF3
	lQQIdkjxdIbjZZHSD/xK3nL9ZtboPa9oR9hi5c5IvcefJc2uEfnv9lLPtovtShvn7OQcM7cM5lbi9
	DOHx6/AkeFWFFBpbVKrE2Ul6045mW7tEkLG67QgPUzfRVErCyqQEpfl+PAnhaj67xw0XKrbbu7+Vj
	occaDiPF1iML3vgnBg07yEwxIGHQ4L2U79HhRNQPuzyUlK3bW31qbi4J2k0m4uHEDI3s2eD5edXzZ
	7o59vYSpC03SI2hclPl4QLolbprNsIine75TqYQ9kM8Kf+7AXJPKpnj/fF1rhKmRidTbC/WIvONTl
	SDzezjTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0B-0000000CQLr-3if2;
	Fri, 03 Oct 2025 13:39:15 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g05-0000000CQA5-2kUW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:39:10 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-46e38957979so9443145e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 06:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759498747; x=1760103547; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VlIvMmYTYW9xFXQL0KLrUt7g4tYarY39wioQ68L5ZKE=;
        b=ssGayk3RXMLcberEi3/l169OC0deNjBK3qJ8f5wVBaGbXZVhP+fdcFMCrLcnXh2uin
         FMR6NHUu7MQItXi5L/zEvrHMq69vrrSna8N/6H0UvOCQwdOYkOElAZOYu2sh+6KjeKhf
         y/FSYykk/hr8ym5MVdrAambmgOXYBiMAWyyxl7KcOfYIGiq8wFqlvHC/hTJyOLC5YmR5
         pCfGRp+Ds9kzQFR1T4ROmgBLG9k67Gq5i5+88eiVAo4sU1Q7KlXW6zAa4eWiKXDLkimh
         AeiteYhKQOI419sIUh0yhadVnsVufK+yh55A81AaG/+AZHV64+1NoB1IZ9deBZS1Jvzg
         zS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759498747; x=1760103547;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VlIvMmYTYW9xFXQL0KLrUt7g4tYarY39wioQ68L5ZKE=;
        b=LezlAA+j8XqgKmrfShZIsQ+w0H5wUFCRNR4NtjaWJUtzHTPLnCw1KFmW7hV8B9sagC
         xAqwtVJ4y1H3qRlOAFKYTnYADILcQpWiqN3awHIrza6uO7uzqoFGbBcCwCr3qRw/vPX4
         lSUeR9bikL30FXBFWjK+cUjiUjVQ/bsNw614wYvwi003b8zwf0X6QcGYIf4eSAoj4ql/
         4gQD5JoAM/vyQ7MVb8CqYHUKe3xH6vBLl8kLLDwx3hA1Q1vvs0MEm2XlLyZoNGGpaWQV
         qj2cLQUuFCeEyGSnw9zxdPV0vgcKyUy12IZ3kYSmh5z3Oocpvjjl/RyOhs5KJTBIZsnc
         X65A==
X-Forwarded-Encrypted: i=1; AJvYcCX0n1EGIsYEe1T8VbF9R44//js0sC95QiMKwESC+W0DoCFMaYko4A1Xws2hFiHJlv+qhXvftUg8XsHZxipMFwH8@lists.infradead.org
X-Gm-Message-State: AOJu0YzcwWdF6OgRs1SwukggT6yRIiD5MBMDzLBNkwfNiQpSIJcVQOYg
	3DsnlBziQZqzq0VMRIPS7gb+/MwW21ioa/i5elUZpbV4VVdE9bPVafG8MTE8fhBnc5CVgVnXVbp
	dpbryJsbINE5bUJjR12zL6g==
X-Google-Smtp-Source: AGHT+IHsx8P5Vs9M8mnwbrakrOPGXjbApzSto+nkAQM4Qfn3U+7Iz7dieUnzsV71vFzwGuJGfn1Qycvc9bWbG44R
X-Received: from wmcq5.prod.google.com ([2002:a05:600c:c105:b0:46e:32e6:eb8f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b61:b0:45b:79fd:cb3d with SMTP id 5b1f17b1804b1-46e71157894mr21943305e9.36.1759498747404;
 Fri, 03 Oct 2025 06:39:07 -0700 (PDT)
Date: Fri,  3 Oct 2025 14:38:08 +0100
In-Reply-To: <20251003133825.2068970-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251003133825.2068970-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251003133825.2068970-12-vdonnefort@google.com>
Subject: [PATCH v7 11/28] tracing: Add helpers to create trace remote events
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
X-CRM114-CacheID: sfid-20251003_063909_719432_387FB44F 
X-CRM114-Status: GOOD (  13.59  )
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
2.51.0.618.g983fd99d29-goog


