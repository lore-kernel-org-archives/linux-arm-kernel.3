Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D6ECA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 09:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CoEuXCUHMThE7b0HEAeKA32nViaypVkNSYDvFKph1Uw=; b=I8YA4xaUsX/a48EovtteGNpPvC
	vQJDja5rNZ99BfMSHSGAnl9wNCBl7LNrx1e2E9cERcmoerXPnI3FvsMutzs9TRSavNYKyZY8cgBEY
	stPN3D434qrwZKW543xZyVFjfcPyVGI6LRkBV39HUSONaZzpUI7W/Ar6MvYd0Cl9fXgif4IVQndgp
	v4ynVkJDaNVguM+LFXIdfU+REuCm5lCLejSNaf5+5uxIH+fJcadw2F9hRxEqxKfItxE7NzshT3Lz2
	y8pjNqUEVejG/Ajx+ip1le74ZGhlSJEzM7DmjYFx/t1ZT0DdXrJeI/5XrqyrW71O4zR208Uk05f3a
	k3pK4KnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCUF-00000008GcQ-2uFh;
	Thu, 01 Oct 2026 08:49:55 +0000
Received: from mail-ed1-x545.google.com ([2a00:1450:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCUD-00000008GZA-0gJK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:49:54 +0000
Received: by mail-ed1-x545.google.com with SMTP id 4fb4d7f45d1cf-6ae14ecef5fso1695028a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 01:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790844590; x=1791449390; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CoEuXCUHMThE7b0HEAeKA32nViaypVkNSYDvFKph1Uw=;
        b=Iiq1lFxxJg5AB1l1gbTjjlYjqOjsJvb44exyjiD0gQD8krU0H8Ib/C8JAAa41UkSkj
         YxeK9nw7BlY/uea0HezcBBspeoYYFwbjwv8M6mYNTya7K8JsyApU7Ge0l3qnAfWWJthD
         OZxqmmeZUiIZ2k6t6knviU9Q5wTNrxtJMf1btLP1NfmKJMv4AJHcCN0CySTRoacTG940
         e4w2ihuP8YRmCll0aeEI/3O2UuC03EYRQyHF4uCKFTTiyFAtVXsZ7+1RceeVSDQD/LO9
         TVU2nPs27Yf3zBkLQ5EsKlzakBft2q7ArkrQ1bMzj8fEKEjkMUop8uh9laZcJvGJnHwW
         GUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844590; x=1791449390;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CoEuXCUHMThE7b0HEAeKA32nViaypVkNSYDvFKph1Uw=;
        b=GR1Y4NjopF13SWfvmah8li/zWXazAyzq32ZjYGIzUuL/L4PFYmFuffcZsqy7QxH9/N
         Xe6fGkHToiTi+kb0h4P+yXrkF0y4UCVW62Vp/BoyXxQy8lnXD8CWkJnwTu7Z7yuNCV/1
         cJfQUq6er7wjhc+jsKIq4ecVT2qU1/aZSjNxDEp7/N50LMammy3SnSWSMsLfPdnSNCvD
         JCJM9jWWc84q9PhkPEeLtC1x0RH/U21ETOY1SatXDGAt+OmeuUlirmaA5V+G6u3ABYwd
         X2utgv7/COrSnKwohLPeIp9tCQilKtk/j2xVJ3JkwbTW5BJ3dmYcT/JYTmqDy8VKV4aq
         P6Uw==
X-Forwarded-Encrypted: i=1; AKwUvBxOaA0dEdxUKVF6gHlx1S95gDYTj6/i20yWn5dWklv7oKq6xP8nzcdjAtM8mszkxz19zDZ+ndgBa9hz/5+dgwRW@lists.infradead.org
X-Gm-Message-State: AFq9FYLPCEm4vOSlGxt/Hf1Qk+0vr6ju+zeIIs3CMaCH2aeI9wh6ESkz
	NOPbAyTa6QFTt6eV/yMunuJjQTBV7UhVmqv7pbllJ/q9yFnFXhS4/097J+Q//7UAnNfba1Ku1fh
	Z5dP3iH+Qy2qR+185vt8Juw==
X-Received: from edbdc21.prod.google.com ([2002:a05:6402:3115:b0:6ae:197e:353e])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4003:b0:6ac:72da:dd98 with SMTP id 4fb4d7f45d1cf-6ae198f206fmr3222244a12.15.1790844590380;
 Thu, 01 Oct 2026 01:49:50 -0700 (PDT)
Date: Thu,  1 Oct 2026 09:49:07 +0100
In-Reply-To: <20261001084909.2937943-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261001084909.2937943-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001084909.2937943-4-vdonnefort@google.com>
Subject: [PATCH v4 3/4] tracing/remotes: Add REMOTE_EVENT_CUSTOM_PRINTK() helper
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_014953_221265_DC630E52 
X-CRM114-Status: GOOD (  12.31  )
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

The current REMOTE_EVENT() takes as a __printk argument a string format
and a list of arguments, such as RE_PRINTK("foo=%d bar=%d", foo, bar).
Add a REMOTE_EVENT_CUSTOM_PRINTK() where the __printk argument can be a
function. This intends to support the creation of a "printk" event for
the arm64 nVHE/pKVM hypervisor with a dynamic prototype and by extension
a dynamic print format.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Acked-by: Steven Rostedt <rostedt@goodmis.org>
---
 include/trace/define_remote_events.h | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/include/trace/define_remote_events.h b/include/trace/define_remote_events.h
index 676e803dc144..4f4d58e37b84 100644
--- a/include/trace/define_remote_events.h
+++ b/include/trace/define_remote_events.h
@@ -35,17 +35,26 @@ do {											\
 
 #define RE_PRINTK(__args...) __args
 
-#define REMOTE_EVENT(__name, __id, __struct, __printk)					\
-	REMOTE_EVENT_FORMAT(__name, __struct);						\
+#define REMOTE_EVENT_PRINT_FUNC(__name, __printk)					\
 	static void remote_event_print_##__name(void *evt, struct trace_seq *seq)	\
 	{										\
 		struct remote_event_format_##__name __maybe_unused *__entry = evt;	\
 		trace_seq_puts(seq, #__name);						\
-		remote_printk(__printk);						\
+		__printk;								\
 	}
+
+#define REMOTE_EVENT(__name, __id, __struct, __printk)					\
+	REMOTE_EVENT_FORMAT(__name, __struct);						\
+	REMOTE_EVENT_PRINT_FUNC(__name, remote_printk(__printk))
+
+#define REMOTE_EVENT_CUSTOM_PRINTK(__name, __id, __struct, __printk)			\
+	REMOTE_EVENT_FORMAT(__name, __struct);						\
+	REMOTE_EVENT_PRINT_FUNC(__name, __printk)
+
 #include REMOTE_EVENT_INCLUDE(REMOTE_EVENT_INCLUDE_FILE)
 
 #undef REMOTE_EVENT
+#undef REMOTE_EVENT_CUSTOM_PRINTK
 #undef RE_PRINTK
 #undef re_field
 #define re_field(__type, __field)							\
@@ -70,4 +79,8 @@ do {											\
 		.print_fmt	= remote_event_print_fmt_##__name,			\
 		.print		= remote_event_print_##__name,				\
 	}
+
+#define REMOTE_EVENT_CUSTOM_PRINTK(__name, __id, __struct, __printk)			\
+	REMOTE_EVENT(__name, __id, RE_STRUCT(__struct), "Unknown")
+
 #include REMOTE_EVENT_INCLUDE(REMOTE_EVENT_INCLUDE_FILE)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


