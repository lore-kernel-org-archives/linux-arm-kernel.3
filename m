Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A27CD98D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 14:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p20ew6e403t+YJXmbrP6YhcLac/7S4zk6VacatBVdC4=; b=g/iTFFkUO5pDlhxkfXviiQboba
	94PIEcTTmQdMgOf9cztnmqRZJ5kTqVVvANqXg7QEuGL1RPOHnLAJNCvmZEwCzhWfiiWfe1LdPTAca
	aY7e5ETJ5D0GYrWy18Ay4wZ04apfIteKP90DdKHx42FNcc7/CsGNq7aTMA3gpmXvVr19jC/57PVBG
	DmCLyKTnmLt4siaCRmQD7cJv1PludHexeVGlK0a5TkBdGSZ2YwCrW5FHWJrI+HaNBgVGkXRIDr9xv
	ITG9CcFrJnWKSoZ63r8p7fKFngs8VpE+rrFkdzNkXQ1L/AuEsQKv5rzUm8EHFtB1N5uOvJoEfdSP6
	hHH8FnBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2mj-0000000B3Ai-23Xv;
	Fri, 12 Jun 2026 14:23:01 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2mg-0000000B37u-4Bgd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 14:23:00 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490b37e1ebfso5284645e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 07:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781274177; x=1781878977; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p20ew6e403t+YJXmbrP6YhcLac/7S4zk6VacatBVdC4=;
        b=fz5cxbel6Jy2nv7v/VzENyyu3pOVpdve0pwn+vhackkWPH3SpYsIRVvaEZfQjHs2dh
         AwkHBJ+bJgdXKDn73aDROqRYY7im/+fQvsTNWusAw6vq73M6jxvEeZYLv18NO9SgBCYR
         bt0gLs2jOlEFp88IKTBuRDcgChGH6ySEJeIQDBwXHhejaMWFNz42SVfWEmWREAaEpnuD
         RSKuzFyvWeIjAwLQDtheBLCze6lrg04ZMyJ7oDWefQZOu6RE6A7Nd8ffh84ezPpO6BHg
         Dt0IK//j7J+Iwmk80d8zjTtbbSrnuVD0ljNwSBXB1onYKIEJVIRBKVbaG7refYNPcTbZ
         dWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274177; x=1781878977;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p20ew6e403t+YJXmbrP6YhcLac/7S4zk6VacatBVdC4=;
        b=MrN2t4smLqKNfQ9lRPi+07RLWcdCs/4eY9qkma5mtd3/XJnYh5CsHZtWxJx1cy5VM0
         Uyo49lxg83i1ceWo6U/ekbMKrkCAzuv5R3hfk0NjWbArtLG12772A2LrWuEzh4z91mIn
         bImzEvVXnPDFrNcQS5kQjrujUjqB+D+7JMHxVVJxMjGvASY1zIdcWaldCAqy7e8k9gzQ
         rBXLSeS7YwdXAubFDZEIL43CyKyxUtPp6vGZe5t5k5mFqqFoSi6Wc2u75jNbUz1T8Qai
         GV5GsjdNhk2y7w6XXPEK4KJM0GL9Nsb7upS69larVSmcJDgb1Wkb3zObgRQQDC0KYg/t
         28cw==
X-Gm-Message-State: AOJu0Yxt3Qp0gKdx9AuXkKBZy+0t2AM4qhwEnXi0Fit4nZJQunIdaEpn
	VPp0WrFhJoGYx3zy2arc2J+jLRVjgd4T9u19z1U4JZSQtoNei09PDF9sNeFGIgMOzQyb0ok6w0w
	p451y59QhDDS5vlAE0iVnAw==
X-Received: from wmxb6-n1.prod.google.com ([2002:a05:600d:8446:10b0:490:b2ca:ed1a])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:6452:20b0:490:3f7a:108b with SMTP id 5b1f17b1804b1-490ec4fb540mr30673625e9.16.1781274176923;
 Fri, 12 Jun 2026 07:22:56 -0700 (PDT)
Date: Fri, 12 Jun 2026 15:22:44 +0100
In-Reply-To: <20260612142245.1015744-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260612142245.1015744-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612142245.1015744-4-vdonnefort@google.com>
Subject: [PATCH v1 3/4] tracing/remotes: Add REMOTE_EVENT_CUSTOM_PRINTK() helper
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, rostedt@goodmis.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, tabba@google.com, qerret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_072259_042719_BB7D6078 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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
2.54.0.1136.gdb2ca164c4-goog


