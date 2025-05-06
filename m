Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1169FC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UccoAy7t6DYOqtAFght6GRLYbDtLDUJp2RBCqm6XV8E=; b=vbj0X/mac7sMO81IHV1Bdg6P4Y
	2/ea0ZwkRWjiaE8fagBFmI6WweCXmr5vxrn9fLKPKNMW19r/i0xwfQ4fqzWJcGhZl/cniHA91Bxft
	8r7kkp5mPakgXiEwKRBIY6YgHH7zjYagtd0uUAH1UOaAdBrlFm0ERpPFKrHZNMJw5OxT8ZZK/0yac
	EuSCSEnYHp3G8XbddD6FASGny3bRQUWTVJyBr5cf6t+kXjNj39fMBxPxAqPqyJRbokvIBkTvuJHS0
	dYrXwmDPRpCV4p8CDVRo3gTfNUntjgAyelmKRVdqcTccsEDLt4N6GHbJLC7OWJdnrQdU9aGCcSUwD
	VIWy6xrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQhT-0000000DXkn-1oiT;
	Tue, 06 May 2025 22:23:43 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLTQ-0000000CjrV-3wS0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:48:54 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3a0adce033bso330739f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 09:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746550131; x=1747154931; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UccoAy7t6DYOqtAFght6GRLYbDtLDUJp2RBCqm6XV8E=;
        b=cr3fO0lRcmC/zJja+PP2kcoepH739TFLGB42w5iIxFVKG95nX4FRvwO027juXhEU+S
         sf9l3/BsFIBJZsBLcRzS8JiwQaLaLFrKQ7WHSfd6C72bJKc9OyXV1qC7OCo9HqdIgkfJ
         aJDr1Tn5cvMrVnfphccfOqOkA/UI2bHR2Q5Bl21yiMEN9x7lZgVW3QWeCOwC5Yc/2fxv
         cMyZWu/luemOmOIBTODJDAJgsrV009XO2GDNUQ0EUK/XldE52wZ/ZbCnpuARJJMvimwj
         tGuNmWOVXKWJxGYi9ZyKwYxtjLstWUM60jziQgTSi0o8VM/6DmFt+huy9m+6wVu6VFc7
         zT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550131; x=1747154931;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UccoAy7t6DYOqtAFght6GRLYbDtLDUJp2RBCqm6XV8E=;
        b=o3BcqqPeciQA3oO/XLjhw/kkM+oFG5lSNaId4xwsmwBMhYtmmLGDPgVwDExwgkSfuF
         CiXOmE//yOGNayHridf+7m3b/+GwnoMMw9/zaxCROudc+bZRt3mHQRBIYy0Bmw4CHMhW
         1mq31gH4pZzCZTCGGhBgtBejOywSu30FMOoqQPs7lScF2uhNfI1iQy60SH2EOWieenUB
         K/Mq5vE+3LB0taDYtjwEgH2K59Rvh4a/riaE6LhVHMjpXIH4WwQIV1EyqPb7K/XQLdLi
         L7NujZE/ho3nC8NIEkLDCeci0JhFx/XmL1WYpyiIVW2pebU5yOYNY3zVbRSrd3bkOLNt
         rYgA==
X-Forwarded-Encrypted: i=1; AJvYcCX2QNe+/HXI8C5q4I4xqVB13FqVM4F95hRNLKqQ7MNPljyjf/EDAkEX2Wq+HN2jW0Ydg0lW9GwQ78uNLeEabtuK@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7QHU8fspHv7iZMBpUxuSuKzE8IspBaXxGR7tWgeQWx1a1L7qX
	fG3LrYYUj9w2Rwt12u/ROCvJxMYsNT4IlJfiSkKAUjHn5n/u8ZVLUnvmS5CjMSMd83T3UYIWD7E
	d4SkOTu0JYS4UloOMLg==
X-Google-Smtp-Source: AGHT+IEM95jiwlSfZQ54wnNuqC2fl6D7aBnxwDMPr9V7cIV+4uN83c8dv1x96zRkvBxrXCRdBy2/bVIFl9Y7AHEs
X-Received: from wmbek12.prod.google.com ([2002:a05:600c:3ecc:b0:440:5e01:286b])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2a6:b0:3a0:86b0:5f63 with SMTP id ffacd0b85a97d-3a0b49e5583mr173846f8f.34.1746550131142;
 Tue, 06 May 2025 09:48:51 -0700 (PDT)
Date: Tue,  6 May 2025 17:48:03 +0100
In-Reply-To: <20250506164820.515876-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250506164820.515876-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250506164820.515876-8-vdonnefort@google.com>
Subject: [PATCH v4 07/24] tracing: Add helpers to create trace remote events
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
X-CRM114-CacheID: sfid-20250506_094852_976210_9C5FEBF6 
X-CRM114-Status: GOOD (  13.47  )
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
index 621c5dff0664..d00e85d2a633 100644
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
2.49.0.967.g6a0df3ecc3-goog


