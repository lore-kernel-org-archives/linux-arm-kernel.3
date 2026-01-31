Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18D9D79772
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 13:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7EnUsHuSY31rm33Evz3AO9vawTajgwNWCLhwQDTSMr4=; b=QMTSph3HqKhRQCfED+P7FdzAsa
	3oLguut7+CMdf3yP814L/Qh5/lIJbNbErrn+buMkMel4hbWXFpBn4F+FtALIQ2gMKTyuB4bZt8RaK
	dgTz/r7IdlWYvN0YRht/fQZBLHxfsWohuR24zHobDmcG+iEJI17zbXm2DAbMtFuxv7xUS5OatPFab
	4T8e9K6HbsMxTtoa48q4HwIAR7HFIfA6/v7XTHPxG7Su+RgRHKF4Wd+FcZG32Af7ztxb0HXMOMq34
	3h4SC80c+Kqa7ENpJiVSGeIVYK8fr8dBXDK6h7ib0o1N8VaiZ9RMnxoIJ3HgEEKjqbmzUA/nSU5j8
	jLELzCzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB2h-00000002byH-2LBa;
	Sat, 31 Jan 2026 13:29:39 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB2Z-00000002bqs-0u21
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 13:29:32 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-658c933ead7so3366109a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 05:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769866169; x=1770470969; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7EnUsHuSY31rm33Evz3AO9vawTajgwNWCLhwQDTSMr4=;
        b=oNmNqpI37WWQwLzMAYoc1CZeUoAa1DPV6kGhiVk5BZSMPEkO4gYDyUaTpa0rWR5KgW
         U3YlvlHzS6gd6xWwm02CBVTDYG626M1VNHRwsKVmnEoQ+P2QkNL9jjloRiqVlvRALeIB
         +NgPCWVWJSYG+Y+0Bs9UJOawvINlG136VUgUUBFE6NiwlXNpVbwFhs+KesRwfWVpYJ85
         tnbKM6qXcgG+Wq9HTH0cpQ7zXdQyP4XKSBcnEu/RYkuD/aeH3YZrTR3cQMDyPVDq8ce+
         aKu41xob/0whbKCPnA9zWaUPtkjbTF6qwy9rF/uqvq8kQA6haKu6L/GiRyu0XxcIkA1p
         eRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769866169; x=1770470969;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7EnUsHuSY31rm33Evz3AO9vawTajgwNWCLhwQDTSMr4=;
        b=kYuMSktOkQ7SRMZFK5B2pjxrBvaRr/FkSj/LjoJqUa4oCaUOPEsSpDLBzmFAncicNN
         xHcLk0p0hN658n+HOkp7vdnXBcEDQT7SUgySDO+kZhvRZpVXK5zial8a+CoOG+FLU3c3
         /YEAM6yjnU9b07yyZJiMWD4EDuWEreOdEChW0hy/Ei44R6U/QAWJvbKJKealGMD2550z
         qQCZ7ANd4gfYhUl4zAc8aZTuT7BLEf9tLkFpOpPQTgLlVVZGqg5Gr6l9NFSGkrpogSxy
         F8ZCgE34AGPbEwHMrxidzbhd/C4KqonVew2u7D8VU7PGrZmBWu6hkWZN4iTsrg/2NA87
         4zbg==
X-Forwarded-Encrypted: i=1; AJvYcCXqVdfYp1z8KMqKGr2g5kKGZptJkshPR1XqeLfhS+XIdZ1w5bkXmvWtxEwXozLuptxKVzIdU/M9z4wK7fxlbW5o@lists.infradead.org
X-Gm-Message-State: AOJu0YwQAeljPmbphwXn1Sc2oqOcbptyX6U9mwF7IqlerE3X3YexnmZu
	LtYYYbNKUxk8XcunJjoHx5cW4aRZ87wCzaCAh8iRDuFUoEF5sMORfACGsLnrbqUoYGmOpqV33t3
	NoChvzQEERAfNEmv0j7x/vQ==
X-Received: from edxz19.prod.google.com ([2002:aa7:cf93:0:b0:647:6be6:f4ec])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3587:b0:658:d405:9797 with SMTP id 4fb4d7f45d1cf-658de58b4f5mr3837419a12.16.1769866168670;
 Sat, 31 Jan 2026 05:29:28 -0800 (PST)
Date: Sat, 31 Jan 2026 13:28:26 +0000
In-Reply-To: <20260131132848.254084-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260131132848.254084-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260131132848.254084-9-vdonnefort@google.com>
Subject: [PATCH v11 08/30] tracing: Add init callback to trace remotes
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
X-CRM114-CacheID: sfid-20260131_052931_312798_BEB89BAE 
X-CRM114-Status: GOOD (  10.99  )
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

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/trace_remote.h b/include/linux/trace_remote.h
index 7fb5271a8c30..c4df3d98e5dc 100644
--- a/include/linux/trace_remote.h
+++ b/include/linux/trace_remote.h
@@ -3,11 +3,14 @@
 #ifndef _LINUX_TRACE_REMOTE_H
 #define _LINUX_TRACE_REMOTE_H
 
+#include <linux/dcache.h>
 #include <linux/ring_buffer.h>
 
 /**
  * struct trace_remote_callbacks - Callbacks used by Tracefs to control the remote
  *
+ * @init:		Called once the remote has been registered. Allows the
+ *			caller to extend the Tracefs remote directory
  * @load_trace_buffer:  Called before Tracefs accesses the trace buffer for the first
  *			time. Must return a &trace_buffer_desc
  *			(most likely filled with trace_remote_alloc_buffer())
@@ -23,6 +26,7 @@
  *			new reader-page from the @cpu ring-buffer.
  */
 struct trace_remote_callbacks {
+	int	(*init)(struct dentry *d, void *priv);
 	struct trace_buffer_desc *(*load_trace_buffer)(unsigned long size, void *priv);
 	void	(*unload_trace_buffer)(struct trace_buffer_desc *desc, void *priv);
 	int	(*enable_tracing)(bool enable, void *priv);
diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index e03fde73aac7..8a7662ff775f 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -863,6 +863,7 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs, void *priv)
 {
 	struct trace_remote *remote;
+	int ret;
 
 	remote = kzalloc(sizeof(*remote), GFP_KERNEL);
 	if (!remote)
@@ -880,7 +881,11 @@ int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs,
 		return -ENOMEM;
 	}
 
-	return 0;
+	ret = cbs->init ? cbs->init(remote->dentry, priv) : 0;
+	if (ret)
+		pr_err("Init failed for trace remote '%s' (%d)\n", name, ret);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(trace_remote_register);
 
-- 
2.53.0.rc1.225.gd81095ad13-goog


