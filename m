Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C313BCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 11:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4iWuJzzxP4gVw/2ZCfCXIAaNe6s3pd3DhFDuZCx99Fg=; b=QM2dESvtAB94X+XFhwZvgdyspn
	pbZRjkbkvJ3IxhMiQNB5lnR+qEzZYK4gqHX9T0GQiH6SRMSpggCjlLuERSfsGZYOK3PCCrJlNaqNz
	GmKPXqzJIkK2A4cOIjUYV0r+fHOTXORMa7DwBt8J9ryAvbtNJu9yTBonBRuxO2uQ6yd+U1LrGJEN4
	DmFuH2qkRRXrLN+4laj5t2kktBNoi6zqvPwooU5QhtyZitRLfCRNlBdagnboQBw5WMyQd9fpT1QAX
	FgFkRlAfZpsdvvALGmcO2QLGwRjZWXMuFya73TLhlmyfZi6GgNHtlkSu/ayt2HL77jMw0QhLHnlEP
	jP1TyzJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3Ks-0000000Gji9-2fI8;
	Thu, 21 Aug 2025 11:20:02 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0RN-0000000GCf7-3tEb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:14:35 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45a1b0caae1so3718085e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 01:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755764072; x=1756368872; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4iWuJzzxP4gVw/2ZCfCXIAaNe6s3pd3DhFDuZCx99Fg=;
        b=FYaA04OlMNRP0GhyGGpfJJRIuIehb/2EA3oxXX7dW3bNste7v44//ugwhvWOfhDZ52
         SnrIHGzziynFWMm1GFxXaWVQpcJR2yOHXpGo9riOm66VYDZCA6Ri0J+F8uwO55YaN8XQ
         zZLpLX6FQKXvM5RQ6ocdaYnXC+SXg8UnuIeqCfAipU7CyVrkdzjTXAmHI05tXIiDTJA0
         BLWVJRa9qa/Rzayam7iJpDDVGBTUqqJDRue/6II58ggipYLVnN4K8jbNNUs0HdfHKqc8
         hX4cBep5ZBTHJsIRgJVSfBfWwz7BVKWilvTQlFvYyf7FQv3q5aoh72RRO2X0Z2FUajbb
         xyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755764072; x=1756368872;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4iWuJzzxP4gVw/2ZCfCXIAaNe6s3pd3DhFDuZCx99Fg=;
        b=NyToWRnCOsN1hw8hQDSSqOzao6bka3zTF/3/cwJ/rKfjc5mkfvEm6UDz9lWKPFTaOo
         FkO2QQjeW2SvuuTrxyd3oISitShRJNGC6iAQjfdinl95/n1iCJcNCCgP/hN15mgxCfcK
         Chw3FpMft2ncTGssMclDq4SMRnkww5CEewASmnvRVDt2c9g6GksBzqM3IcwwxMrqTBnm
         7sns1InFCnqEoszk5NjgdWUlw/kCSfGuTOb/cU6V2cZZinucwG5bMg6HwRQo7GzCg5v7
         PlS7p30IvYgqf+hpfq3a07yvEvbM8CgWkYIIxNB6EJX+uEm5X3gnTYFHsq2/m8N1DFXM
         MZZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVS+kIr89oEB0OVybxkevxk5UaMD7Xe1OlQ7kw/j4IKdSl/M8JO+6SYNThMEp+4B5aUk+1TUaffw3g0PXR1HoU1@lists.infradead.org
X-Gm-Message-State: AOJu0YzmK/h2SGhyH+7tchuFGTtd0SkVPIBOS8TL43daLbfHmHT5p+bc
	tllO6ssK3Ln4vZQkC5eamgaVzh4FV+micT/Ys3kX2wPq/HIDsqIAjSvezpzIFI6/4XdajULKMFM
	5jRj6zuw+fSKyyU9/rMt5gw==
X-Google-Smtp-Source: AGHT+IG4Q8cp6jOORVXZXkfWOgrpfZ0eZv6m/uotMvvZvAtj714DTAyhspN3LAAa+n5V+47jBjIVsqxX1AfiCyxk
X-Received: from wmbhj7.prod.google.com ([2002:a05:600c:5287:b0:456:111e:4717])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1390:b0:456:161c:3d77 with SMTP id 5b1f17b1804b1-45b4d7f786cmr15535985e9.16.1755764072496;
 Thu, 21 Aug 2025 01:14:32 -0700 (PDT)
Date: Thu, 21 Aug 2025 09:13:56 +0100
In-Reply-To: <20250821081412.1008261-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250821081412.1008261-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821081412.1008261-9-vdonnefort@google.com>
Subject: [PATCH v6 08/24] tracing: Add helpers to create trace remote events
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
X-CRM114-CacheID: sfid-20250821_011433_971077_0B84618B 
X-CRM114-Status: GOOD (  13.70  )
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
2.51.0.rc2.233.g662b1ed5c5-goog


