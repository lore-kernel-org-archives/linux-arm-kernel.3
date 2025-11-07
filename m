Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A895CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZQXGkPHe9/U37tQNGKvI1ZfLYMo8CduBTar9VDjyVg=; b=mBT84UK0JDJ4fGLmMDdEyXcpG6
	9Qv3gvxfHASykcRQLCq+TkogRCMRs9U9exYvetlTWGrHlVnquFwq1HsBPZ2MoK9GmA0nNs0boUQ1M
	X7sJZLfKbUUztGLeC42uPMpYtkV9IcKUeydyJDJB8kexi+Jax7hvZJdyDoONPkA+j85S7p3Qye/2D
	0McnyQiOqdtHIr3wD1BIUUKI1Sue5apnYPxJsFYbCNOp6L69TdkeEJCAfc9vKEgO8SyYCqEJfbvEK
	aDIsh9X2vt/0GMsf23CZEYRTrQrng2BRRqLdzJhjJmWlIBAHCLazaew7Jn7qTYN7gAQ7vz5ys8u00
	ECB2HXyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIw9-0000000GymK-2Mk4;
	Fri, 07 Nov 2025 09:39:17 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIvs-0000000GyQa-3cYR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:39:02 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4776079ada3so4795155e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 01:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762508339; x=1763113139; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kZQXGkPHe9/U37tQNGKvI1ZfLYMo8CduBTar9VDjyVg=;
        b=jUffQQlLcVYALyXWYvWLLAXUPErxw7PnZZwAI5yzoLwFlzEwxfTHbcZ2l/1Iwk64Ja
         nN3tdIL27hqAkrSJDyK6U0OniKk4Mya3GuSkMuTDtwJquTL1NBlqvy8DV+9v0QXcE3El
         +tNysWEwF10btkvOHhgRPp0Z+cclKY4PpOEmHnvSOYPAOxSWxz0iZdP9yEgA/1I6mHzu
         SXIDs5kmgnn3DOdFLEZ8m4oGxGaRp+9Guctj4ijsO835rZcjjyv7rTajpw1N+awtXTTi
         hEsqeRFw8ER/VkCVTzk7J3qIQrx5uEBJ27n8S7ZYLliebFUToItBLMfB754CdBGkeojz
         H4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762508339; x=1763113139;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kZQXGkPHe9/U37tQNGKvI1ZfLYMo8CduBTar9VDjyVg=;
        b=Ll5cYzhJsZm+5KXb7sGxqmeLuRjZ7shsgzT+C4jQBe7BiQBgg3+H9ZvJiIKvMEKOkb
         aMMTiSh4c+TzvvlD8/NHzf6uf8ADqyodZUZ1gfp4IwGLbLIfnv3RaYFhf3uUXvH9pFXS
         SACHeC4J6GKvFtymBAtLKvvxbnmA70IETnskMU6REMpaQJCCA8AyL6X/3QmT+yxAhFXJ
         ZWCeuHyyILWVk6RdRP/S7y+Ij4tyVohcjibYYoA4Pv/BScg0/JJ/wBozFWQGFM/qpnAk
         EpZM5jGQCwVhaX1q1Ej5QqzI6djvt67ILTtLPsoqqF82Xv6bPRmHheNCFqzjOhtXDVrm
         cGsg==
X-Forwarded-Encrypted: i=1; AJvYcCXtoy5kMYS7bUfYK9ajz1w6T+pDYboESAKUtaQt+9LPfShKUWXh6Gc6tzdFMbTp0mXwZIbss9BjmYpxCs4BcrKG@lists.infradead.org
X-Gm-Message-State: AOJu0YzJwSK0Y6+QGWmaoStY/n3A6eJ+aWijjRVrgGXW0sxHzk1jcXLI
	ErTpaXWiJ/DnAU9u+uMnmWDNNDR7KDwXUQWexQFf1POx8lp1YDxJoLZq8V1p3WWuQbvfwAqaS3y
	P3ybUXHlCKw95MUGrvLsqCw==
X-Google-Smtp-Source: AGHT+IEgHqXeHwKXNC++2iV0+wfS/fik7pjpkk7m9+1zJmg2GRsFEpcM8FI8jOV3R+GhV8IJz514M5L5g+FvFVCF
X-Received: from wman13.prod.google.com ([2002:a05:600c:6c4d:b0:477:14b1:69d7])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4592:b0:471:11a3:a6a9 with SMTP id 5b1f17b1804b1-4776bccacd0mr18890925e9.37.1762508339110;
 Fri, 07 Nov 2025 01:38:59 -0800 (PST)
Date: Fri,  7 Nov 2025 09:38:23 +0000
In-Reply-To: <20251107093840.3779150-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251107093840.3779150-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251107093840.3779150-12-vdonnefort@google.com>
Subject: [PATCH v8 11/28] tracing: Add helpers to create trace remote events
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
X-CRM114-CacheID: sfid-20251107_013900_942194_13D48FEB 
X-CRM114-Status: GOOD (  13.19  )
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
2.51.2.1041.gc1ab5b90ca-goog


