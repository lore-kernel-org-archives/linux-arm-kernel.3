Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2CFC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 13:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3t+9Hbrx3b4pdy+1CD6jYpc+HxoCZtIYl3kVPAq1eqM=; b=jGf3luBDIqIOa66HQ+8hDUsw+c
	v/tMGBrQj5Z62IwSpPKjA7onPJ31yjTPk50zrhos+rSBVyms5vNPCYIxHuBVJCwODmsT8gsXRGqwV
	ubftQVRmbLj5InRgXSOhoLoW4VJZfti7Lfxw6gI5F7FgDDJ+4efny95EXAnIXJo/OljAZsiGO5Mfg
	cgU/8QcJrlWJDLXgYOzP5oNRd+C53LXWAYX07BcTw0rFXvyG9rL4lfWqiWXoDOt7Jb3Sih3QqGByi
	Mvq8LdqNqWdUc1/VzfHr35plZbTRVfJsgWGH3khP5R+70C5dNIC1vrXPDCvelBccwTQDnK9mvzn+A
	e6qJyOEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvUq-00000003aWt-23LJ;
	Fri, 16 May 2025 13:53:08 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvIr-00000003Xn8-1RNh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 13:40:46 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43eed325461so11867205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 06:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747402844; x=1748007644; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3t+9Hbrx3b4pdy+1CD6jYpc+HxoCZtIYl3kVPAq1eqM=;
        b=k4MdiSgWWnqxiIGDvCGdrvToZJM7wrjaqrlkr7yETV7ultRKKU7gQ0KknaFFu6h9dv
         +TvVHOLj4ybacbrLw9vBFbXly0uvwYKWFv42Fh8RB+08yOH+wHZg9Fgg2KCt501+03rE
         V86h6YDIKEpNDSOW0C9rn1z+VdnKJf/Zr+HpZSBPQWl3RKgTIONLkkxyMJmw6ulpSsJK
         Ji+J7KlztuSEep5Jq//nCSP0cRY1wESWaIa4aYvUOsHJPyVb0pdnqfLZsbqvW6C0OzZG
         JPABk2gW7IdXqguWSEhXqYu2ZeYcTSDc87JQz/E5tSSAd+Vw1LByNwbV4GItdJblXOEL
         rUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747402844; x=1748007644;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3t+9Hbrx3b4pdy+1CD6jYpc+HxoCZtIYl3kVPAq1eqM=;
        b=UNe3R/8tXAvzsYNd/S7j3uwiGtuwmo1g5q7UKzjz6ZKq9C6zOWwhcuic7DM4OVNeIs
         C4fPgVHZ6hp85Boazco9RWhvOfW8/Te2F9BToUekLI7SbSIaFt9wTMLvdq8ZKh2eOFmM
         4bfmmPGbf72z3puLMU8miFwG4Z/GEaCceaOW8NWvH07NMSnlPrRl1SpOPdgb+Id6y3fC
         58cbVQBJyWIdGBg0mm4xlAu38qBvtrAAub2Ki2yNVhVDB6rVT/FkJ0SsvimZTCD8qIcO
         wcu+46ct2100hdHtcqdq+VjLF8mtsa2iboY8SVk/HlSYGU1SEBe7wkCLHeUGN73KaZnN
         ouXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOBucrQNcnkBjtLibv25oagPDVRoQlGtMHaLk1FXZXOW5drPG0LrnW+rQGNsXkVMjq2HzjUqq9eJCdGZD93F12@lists.infradead.org
X-Gm-Message-State: AOJu0YzXpzB40P4AYB5vqiaZOLmbchki+2wS76hpxIInMEtJGwg8E6Mr
	C1SYhYfZNjD23r7GtQlPDc3ofGOHSOwpZ77e8MXLmnoA0lD5m/QQ8yFgv6ZGHVSDy7vAAP61i4k
	xxSrXxn66+I9A43rtbi5O2g==
X-Google-Smtp-Source: AGHT+IHBk0uTFQehW6fZF3OCY0h82+X4e1sass1zittKFrmN//RLeJcEgCwGWBGBCezpJMkuQurUbPrGR+5L4tEP
X-Received: from wmbei9.prod.google.com ([2002:a05:600c:3f09:b0:441:b607:4ec0])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:64c5:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-442fefdad81mr26193435e9.1.1747402843791;
 Fri, 16 May 2025 06:40:43 -0700 (PDT)
Date: Fri, 16 May 2025 14:40:11 +0100
In-Reply-To: <20250516134031.661124-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250516134031.661124-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516134031.661124-6-vdonnefort@google.com>
Subject: [PATCH v5 05/25] tracing: Add init callback to trace remotes
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
X-CRM114-CacheID: sfid-20250516_064045_380051_5B1ED0C3 
X-CRM114-Status: UNSURE (   9.55  )
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

Add a .init call back so the trace remote callers can add entries to the
tracefs directory.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/trace_remote.h b/include/linux/trace_remote.h
index 1aa99da3c96a..82d26d97a536 100644
--- a/include/linux/trace_remote.h
+++ b/include/linux/trace_remote.h
@@ -3,9 +3,11 @@
 #ifndef _LINUX_TRACE_REMOTE_H
 #define _LINUX_TRACE_REMOTE_H
 
+#include <linux/dcache.h>
 #include <linux/ring_buffer.h>
 
 struct trace_remote_callbacks {
+	int	(*init)(struct dentry *d, void *priv);
 	struct trace_buffer_desc *
 		(*load_trace_buffer)(unsigned long size, void *priv);
 	void	(*unload_trace_buffer)(struct trace_buffer_desc *desc, void *priv);
diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 18b2930186cc..8f8eb1f1e889 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -482,6 +482,7 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs, void *priv)
 {
 	struct trace_remote *remote;
+	int ret;
 
 	remote = kzalloc(sizeof(*remote), GFP_KERNEL);
 	if (!remote)
@@ -498,7 +499,11 @@ int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs,
 		return -ENOMEM;
 	}
 
-	return 0;
+	ret = cbs->init ? cbs->init(remote->dentry, priv) : 0;
+	if (ret)
+		pr_err("Init failed for trace remote '%s' (%d)\n", name, ret);
+
+	return ret;
 }
 
 void trace_remote_free_buffer(struct trace_buffer_desc *desc)
-- 
2.49.0.1101.gccaa498523-goog


