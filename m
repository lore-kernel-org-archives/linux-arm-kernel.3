Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F0FC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 07:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9u8vK7y24l4tdEbBKumAzRQyzhCWiiUx4/oaY05z2cM=; b=lcXRYNT1Bfa+hHzzkSXyDK0PNk
	guqD1B3zIE+4ZIXnLz0Vq2DJ4YSEMrfg+fh+0h4rBvX5WDyonS+/NxfhT2LcvoAlPUP4vhEeMoxP/
	6CDAjLiTefbPWlGlQzJHksH/wvIT3TmBKs15LmAlWlPmuWPyIAJnjRrF+ub05NtIZQd5xKa6XZpS1
	6FWgdK+0S3kTczRIg34m8uMaxFGGxyAYzyOtyr0/bjNhYGDmMZ3FLiIYa9AgphIt2QmdhvZ2cnUh1
	hd9Oh18LJVnM/Ns8kd/jSMNEvWvqYO9jy+i3zLRc8s8LQjVSjrwdTvHrje3tcRnuqVlyUfcHlJwYE
	CZSEumWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNAH-0000000GYi3-16jC;
	Wed, 08 Jul 2026 07:57:53 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNAE-0000000GYeb-1bsh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 07:57:52 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-c15d4224f9dso13687166b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 00:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783497468; x=1784102268; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9u8vK7y24l4tdEbBKumAzRQyzhCWiiUx4/oaY05z2cM=;
        b=FVX7DrwlQH37UKArEAYliRy3APYB5TpjBgIRZvYMSbFppzSaZgcTnTkXg7juB/rziu
         QC+I5m+JXeMaTAM39UmmHFF+5QdaHPcteahoRDRbaY6IOSuBP9kPxF3DEUs6UEdqqLXS
         Th5puvS5MnJkG3//xnPLa9sTp4cfs0wFu2A9L3dmPHi5DcbBZSau7oFeElqvbso0OIfd
         96GjO30q7AFUU4g0VN6fyIaf7Wgk278+uMhOZdjxiFjrLrwUfWIMVxVjLkzLcF45xx1t
         y1/Lf6swgaVlXH+yB9aJS3EomDnxWiom0k2pZca+mc3B1JtnzP5wa5dBpmarcXZBXCs7
         CC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783497468; x=1784102268;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9u8vK7y24l4tdEbBKumAzRQyzhCWiiUx4/oaY05z2cM=;
        b=V0sMMrEDVD9qy7MC2ftu+diIgQNCDkLh0qmRUYi0wKXLVBQAvU7Vl6zM00tP+ntYux
         4rkVd0paJmwm3zractGTyJSThyLr+MLcRH59LQfDIqzO790FMiortw8LF7DQp/mf+pm8
         lVmHYwM/pIKsq4t3o1YjZqvP0cd+l7z+E3y2JM+91qGqFEw5AGKSOg6Pe7JvAAJhK4b6
         Em6NJxWMLp0nLLdOeChXa3G9y260b8bYeHc1UwJw/rLKfgs1T8AR12KNwHWqIxH4eyu5
         jHqZht5zuSx0jqrejc6xDsb8mrjJ3p+lsV9MlJE6ROU8cP9CYUj17DziQOTzgDh52AVa
         4NgQ==
X-Gm-Message-State: AOJu0Yx7ONoZ+TdesfOeieIslqAQjj9j0G1rGdCBOFCUgKps7ZBoD4b7
	g8HtSVx9mv4V0i7YSKXogZVtXGk03J2ThLwTupwGhU7R3Ljn1xnekh1ok8YT2l1j8k2eWG2z2By
	VklnJ3OWR+D0+tqz4Y48i1w==
X-Received: from ejar8.prod.google.com ([2002:a17:906:3508:b0:c08:301b:2ab6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9454:b0:c15:b9b6:6b17 with SMTP id a640c23a62f3a-c15cdec7abfmr74573266b.4.1783497467071;
 Wed, 08 Jul 2026 00:57:47 -0700 (PDT)
Date: Wed,  8 Jul 2026 08:54:34 +0100
In-Reply-To: <20260708075435.47419-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260708075435.47419-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708075435.47419-4-vdonnefort@google.com>
Subject: [PATCH v2 3/4] tracing/remotes: Add REMOTE_EVENT_CUSTOM_PRINTK() helper
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, rostedt@goodmis.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	linux-trace-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_005750_805232_1D783109 
X-CRM114-Status: GOOD (  10.43  )
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
and a list of arguments, such as RE_STRUCT("foo=%d bar=%d", foo, bar).
Add a REMOTE_EVENT_CUSTOM_PRINTK() where the __printk argument can be a
function. This intends to support the creation of a "printk" event for
the arm64 nVHE/pKVM hypervisor with a dynamic prototype and by extension
a dynamic print format.

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

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
2.55.0.795.g602f6c329a-goog


