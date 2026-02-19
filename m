Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D388E9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 15:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mn2h6vlbvaGJL2bTqXnVkXpgyiXn9lRqOIfc6OvhU2k=; b=kiVwQUBDwnqw6flDBc6EmR47x/
	nkSxqTZ/+CbCMrFl1LIUVIoHSMYHhNq0+awZxzGgvfQA6l9PXhZtA7/0bU6vHbjQV+OwypvY0r96p
	CZ+sBXMJfRJfqZ34gzVe9vNGtErNUseY+F/xP4YiCLq1Qls2/1wK3zx5ktNMH2Jq5B6lHWIohO9cB
	kvbTLyKVMA4sXCH02eJqFXhDjheMjS2xTEJkRByXj2QGPdT67WaaaYLNLHk6ZfxRUlIBg8hWLHhwk
	BpPfj89qymXlUarcsCeDySiDqG7ec8rdnt9biW+UT+lIyN5yCJoC5lxzIEX6kcgz0mMnPj0Zx4QxF
	Jlbr97dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5Z6-0000000BUtJ-1eB1;
	Thu, 19 Feb 2026 15:03:40 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5Yy-0000000BUkq-2E9v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 15:03:33 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-483786a09b1so10733555e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 07:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771513411; x=1772118211; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mn2h6vlbvaGJL2bTqXnVkXpgyiXn9lRqOIfc6OvhU2k=;
        b=fG3eS6QOC26czFS/rkSzNsyfZtNAsIl2iitP+FK8lQxzMTtPlGL9KCffCpyk7oKtSm
         ilMkBZF2Q+LJ+7WjcQtOa2xOsbeK7remoVPzKJ/hIBU+hx0VEWnAs/KL7QYAdY3RIDHf
         d5V1z6Wgt+95aJkiXPSnjuoW9REnWIhmK81Hx+hpdFiy0zOJNqwx3JuKlfJaxBIaSifE
         1onTBIB+ZSFkhWsUVm73mqNCVA+QemP/kUb9ciR/lvcGVMQ0wNRQMbAMhzZf9mcIXjUz
         dxD17MFRf4qrtPLz8oHAvXzZJBkgukNnrZc4QdHXuUSvaLNLWd78KeMEFJXihnwHGvRZ
         jZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771513411; x=1772118211;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mn2h6vlbvaGJL2bTqXnVkXpgyiXn9lRqOIfc6OvhU2k=;
        b=adThGhrATxYxwUV41/+A2ySK01oK9OMei5+Z9lGyLkNx/fzOe60LMUC/fngn7a/9ig
         aE9k9XTgawwfFAwqMdNXl0iKnKbTg5Ug7rFcu9GSDuDH0qPZa5yCgnkYa+qYaYJIvDif
         O7wPHj8T8QdQyO36SAs4SY6jjQG2R8Y781bGNyza6EHtxLZc3zj4AFNXfzWegQBgy3QQ
         WHK3Whop6+dVtGmalxdJvL2MTrGr+P/XUiTdqw88Klbhm+mldJk4UIKR+i/st5VknHfZ
         rpHCzPE+BbsCU1nWh5nBeaYS/SPtAAKu2ZMh6JCU0Oy6XyCerOAaMlg72cNBXJdNQ9Bg
         J2gg==
X-Forwarded-Encrypted: i=1; AJvYcCU9aNLJYgBqQV72xqNOdAt7ldqIZnZm9kuQM5Yfr5z7Ugiy5IdwDOnY5aolfGGjQRkMV9uIQs030AOVxyxSDUip@lists.infradead.org
X-Gm-Message-State: AOJu0YwgJELGZwzfuToymzQASVrLdASyPhNOg1Xe0UhAb2bNXxhRFt34
	r017vpU9HE2esBQnxxMDeDK+I8X54p13OBkjbwNGmXwMXTaczjiwE3XwYWwXkJG+K29nPq0PvKM
	V6/JpT+MWjxNvi0gBSQDPsA==
X-Received: from wmaq5.prod.google.com ([2002:a05:600c:6c85:b0:480:6b43:8a18])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b26:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-48398a47222mr82552755e9.6.1771513410488;
 Thu, 19 Feb 2026 07:03:30 -0800 (PST)
Date: Thu, 19 Feb 2026 15:02:48 +0000
In-Reply-To: <20260219150307.14538-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260219150307.14538-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
Message-ID: <20260219150307.14538-12-vdonnefort@google.com>
Subject: [PATCH v12 11/30] tracing: Add helpers to create trace remote events
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
X-CRM114-CacheID: sfid-20260219_070332_616404_4A48363B 
X-CRM114-Status: GOOD (  13.84  )
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

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
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
2.53.0.335.g19a08e0c02-goog


