Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35394FCB600
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ik5Gwulkcj6xpLazaW4U87LROZJemTRhzFJsU5ExpD4=; b=dWDmu8HK1EsfyVod3Ww1nvgbQC
	nVri3nUFO1INoY15kqz4anSfCCsQquk/IeCx+MBssP5+VBhWIxQltToJlm4eg1+X65Z0+/BMN7DjI
	VK81QcLz9VLzev2uCYdTqWKSxE1F17V92UpnSWqNar+0wAwXyfWAlt2HH5DOnQ1ewl9PfzJCeOBf7
	2AIGo3tm/308h6mXQv7aEFGnLn4eJrX8zfRfwXHqKjgGD7FbK2PdrIf0fkNItw/MwW5cYACaU0jl9
	poUTfHITSzfmNLjUBI64x9rHVbC+NCf++1xr4sZFlBcw/PjqOuLVMOs8AokMLbDwFILdXeCieaTuH
	a8ui/O0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWHv-00000003vNy-1Fm8;
	Fri, 06 Mar 2026 14:36:23 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWHd-00000003v2Y-3uOQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:36:07 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48529c087f6so2249515e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772807763; x=1773412563; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ik5Gwulkcj6xpLazaW4U87LROZJemTRhzFJsU5ExpD4=;
        b=4y0GTWKfl23BzP1aIGYbfw9guhuT9Wunv1QjeYkx3MrbBrfO8/cnEWR7HGEyPVqUci
         jKHHOR2KZxdEhcRHVeeUYsSlY2sixOnsLcFLH0HrfxXTTolLidjG7eJkmJUmhu7/+SuH
         znKazZs5hPuMWZeoAFMDmwjhLtNuLbCQUMbEx067tyCDSmwcyyndF0KpWyQBf4vBTkea
         G0yG7jzNm+y2h6t4RHOQ/eas4fRPtppdMr6ct6DcUSztyoVxttgs9nx5Dqpy6JOLQxic
         jD1nYDjcv/7y0tm7CrnVFxQltkglJfKEMStU7JC9u6QPa6nFs7NPenAxh0ovdJfKjcl8
         N7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772807763; x=1773412563;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ik5Gwulkcj6xpLazaW4U87LROZJemTRhzFJsU5ExpD4=;
        b=exgm1s8afZar7LJaxGYuHqKqzf4RKuDtInrunVOsYLCEjpnnjaNf0oBbunnEQEkVEy
         k4TlaRwqhfUVKrRAKhaALpuwEWPjf8Cila4fM3JIX2TR2Mm1Rk7JUA+pXR9j0B9wzGAM
         ECtToGEgzXlgFyP7gvN6yiin1YPfwSA56M3UJg0Z63l8dzgGsziUts99OG+I20w6DJ8S
         9td/w0a0/6zyt3zng7fW/4v6+CmP9QDZcCRTnWDS2RZXQ2V/1O0eBXg68NbqaeygX32w
         ln3VWFBkVw18QviLtZgfVy0ycDSbsCtqr6F8Dh5VvvN5v1TEokWPs/gqiMsEWXWLyb+O
         ZVTA==
X-Forwarded-Encrypted: i=1; AJvYcCXoUVqbPGU1Y+D+wpCrvLqGawE0IdoheYpmPWbkV6l5Hm/KWHQFWNjI9rozeZIJe0Q4E4LgkPfL/Y792cvlvtb5@lists.infradead.org
X-Gm-Message-State: AOJu0YzLifbj0BD5kSWRdX0u7L2YWzWOqhOhKgeWljxD573FiO6FdD11
	aygjpKMRrDgXBDTeD0FAdJX082WmAsoCbjqD30TN7r/sPLp/s4BsFCse8PE80fzYBTAI+H6ElHu
	puPJzMDUG0f95AyK/BvGUXw==
X-Received: from wmlu24.prod.google.com ([2002:a05:600c:2118:b0:47e:ddf0:fd00])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b0c:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-48526979668mr36579565e9.24.1772807763338;
 Fri, 06 Mar 2026 06:36:03 -0800 (PST)
Date: Fri,  6 Mar 2026 14:35:15 +0000
In-Reply-To: <20260306143536.339777-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260306143536.339777-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306143536.339777-12-vdonnefort@google.com>
Subject: [PATCH v13 11/32] tracing: Add helpers to create trace remote events
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
X-CRM114-CacheID: sfid-20260306_063606_059526_EC3F74AC 
X-CRM114-Status: GOOD (  13.02  )
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
2.53.0.473.g4a7958ca14-goog


