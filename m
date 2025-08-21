Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7962CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 11:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJcUPeC8ocB5+j9OXdNiMliYvjrJgSIIHWHJsqMgtN8=; b=TeZiaeD4dHGpdWDyXZbHCKL4dk
	PbNOe3MosYrqbiK2WLqAmrBPcXpzDUml/RwDPs53iJ3OX66prisA/NkfNkN40h+/HkEqXlrGsyOQG
	D9lNTgfrqwoXqpAqPT3Z4eqj0yELXy37oZHxmTzHgN1KeGiMpclDSzUIfjkc3CVsAYkTjQMJlDdXB
	UH3kVcy3Z+rsHy+jIXOtbdZlf4AoouQ13jNsgjG9ksUxQDxVoC58+7Ff18d00HaMPPDgQmV7MLSnO
	I4+/8dZ70uLu30qi05ofz1WXpOrHtF5S6iI1+tZw52jrWI7m+KSs3mvb3hTsMkNXZCXRwykjZy7zB
	BmhlRpMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3AV-0000000Ghky-1d3S;
	Thu, 21 Aug 2025 11:09:19 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0RH-0000000GCdD-1BeM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:14:28 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45a1b0d0feaso4420195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 01:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755764065; x=1756368865; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NJcUPeC8ocB5+j9OXdNiMliYvjrJgSIIHWHJsqMgtN8=;
        b=UptMLJHh43PQkAQ5AxUgxlQA6T/e8lIYWJaXIUK0UkpZ6J6CnDuOKx7FUKkJPKx4FA
         x+6IEn4XYxAAt2u5OzrO16h+8JYpS+E6I7bavd/G+Wt4QlcpI80dW03SGyxLDjs97m1/
         j2txsaKO4gjFCrlp63upvZRCfGqS2kDRaGnaqu6Ua7Yg1A1WxYsoO3RTmUf5t6DSJpFs
         l5ovwRttUPd4BtwBoNAGTRLAiL0GS6VGsEGgu41LioZQZrspIDAiG/M2lh4R6e1C2fNY
         Me1FUNKhx1bFQyrpZZH3WptH2A4D98UfkDaCfWUfzZYPdaDuO+o8d9RhR4qqvcTKf3jc
         wOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755764065; x=1756368865;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NJcUPeC8ocB5+j9OXdNiMliYvjrJgSIIHWHJsqMgtN8=;
        b=kPQntc9fZQerAfH7sQ/Y2NaY9fTDiX25OOCwGc1OeAwvPB2drvt4RDClOQWN2bWJSR
         Q6jbgYpP2/qEEhqZQTwMpjnCGbAKw6an4UvyAQpFr3ZtEIEeX6h6zQHZOCxAQWibIj/x
         QBVneS48sSRbULcWeup83zzHhRaFSWD8IVSOq4o41QD7GOgZS2cdleeTeRSaFD06XmaY
         lTxxP668/btvJYLbhZTeqJt3TPOYOPeleuuYdEFWzbsWKZOWBVHe3Nlxtb5Oa7xzjY9z
         nUhB7fbcSjtZ8ddgL73XOifyY4+7VnmFQVdgEccJ3nwcSA5U3AbDEd5grlN9ymnjyiS2
         6kdw==
X-Forwarded-Encrypted: i=1; AJvYcCVv87TgVbwI+AKi582zdM6a8SDA89XWFUlMZEUVG0CbAJLDmXeseN5zGqBxjeCcyQFlE777cTMB4+RPESAFZibk@lists.infradead.org
X-Gm-Message-State: AOJu0YysquWTuxZ7G7aF3+1Q/yNSTubMrVFL2GJVwPQtAa4tMJMegkJ9
	M5kGOv97kU1wQaj5tBkOhcCfH/hzohhA1qOfWOEpyQomTkKsg2Bo+hHXMc46DJ6/eLVulKj/7Ep
	0VD9Qgo6yDae/gGYfv38W9w==
X-Google-Smtp-Source: AGHT+IHxHGYd1KeGVGM3iasiEuHwtuNNyEruew1KNtvROKmeBVTKi8SlkdS/376itCy6PY0wJZqfEhcdRnlQxCNH
X-Received: from wmbez8.prod.google.com ([2002:a05:600c:83c8:b0:459:e17c:3572])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f0e:b0:45b:47e1:ef76 with SMTP id 5b1f17b1804b1-45b4d86c5d6mr9909145e9.37.1755764065317;
 Thu, 21 Aug 2025 01:14:25 -0700 (PDT)
Date: Thu, 21 Aug 2025 09:13:52 +0100
In-Reply-To: <20250821081412.1008261-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250821081412.1008261-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821081412.1008261-5-vdonnefort@google.com>
Subject: [PATCH v6 04/24] tracing: Add reset to trace remotes
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
X-CRM114-CacheID: sfid-20250821_011427_320337_074ED6F7 
X-CRM114-Status: GOOD (  13.40  )
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

For standard trace instance, "trace" files allow to do non-consuming
read of the ring-buffers. This is however not applicable to ring-buffer
remotes due to the lack of support in the meta-page. Nonetheless this
file is still useful to reset a ring-buffer so let's add a write-only
version.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/trace_remote.h b/include/linux/trace_remote.h
index de043a6f2fe0..1aa99da3c96a 100644
--- a/include/linux/trace_remote.h
+++ b/include/linux/trace_remote.h
@@ -11,6 +11,7 @@ struct trace_remote_callbacks {
 	void	(*unload_trace_buffer)(struct trace_buffer_desc *desc, void *priv);
 	int	(*enable_tracing)(bool enable, void *priv);
 	int	(*swap_reader_page)(unsigned int cpu, void *priv);
+	int	(*reset)(unsigned int cpu, void *priv);
 };
 
 int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs, void *priv);
diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 1a4786b7970c..18b2930186cc 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -63,6 +63,7 @@ static int trace_remote_load(struct trace_remote *remote)
 	rb_remote->desc = remote->trace_buffer_desc;
 	rb_remote->swap_reader_page = remote->cbs->swap_reader_page;
 	rb_remote->priv = remote->priv;
+	rb_remote->reset = remote->cbs->reset;
 	remote->trace_buffer = ring_buffer_remote(rb_remote);
 	if (!remote->trace_buffer) {
 		remote->cbs->unload_trace_buffer(remote->trace_buffer_desc, remote->priv);
@@ -136,6 +137,21 @@ static int trace_remote_disable_tracing(struct trace_remote *remote)
 	return 0;
 }
 
+static void trace_remote_reset(struct trace_remote *remote, int cpu)
+{
+	lockdep_assert_held(&remote->lock);
+
+	if (!trace_remote_loaded(remote))
+		return;
+
+	if (cpu == RING_BUFFER_ALL_CPUS)
+		ring_buffer_reset(remote->trace_buffer);
+	else
+		ring_buffer_reset_cpu(remote->trace_buffer, cpu);
+
+	trace_remote_try_unload(remote);
+}
+
 static ssize_t
 tracing_on_write(struct file *filp, const char __user *ubuf, size_t cnt, loff_t *ppos)
 {
@@ -370,6 +386,26 @@ static const struct file_operations trace_pipe_fops = {
 	.release	= trace_pipe_release,
 };
 
+static ssize_t trace_write(struct file *filp, const char __user *ubuf, size_t cnt, loff_t *ppos)
+{
+	struct inode *inode = file_inode(filp);
+	struct trace_remote *remote = inode->i_private;
+	int cpu = RING_BUFFER_ALL_CPUS;
+
+	if (inode->i_cdev)
+		cpu = (long)inode->i_cdev - 1;
+
+	guard(mutex)(&remote->lock);
+
+	trace_remote_reset(remote, cpu);
+
+	return cnt;
+}
+
+static const struct file_operations trace_fops = {
+	.write		= trace_write,
+};
+
 static int trace_remote_init_tracefs(const char *name, struct trace_remote *remote)
 {
 	struct dentry *remote_d, *percpu_d;
@@ -400,7 +436,9 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 	    !trace_create_file("buffer_size_kb", TRACEFS_MODE_WRITE, remote_d, remote,
 			       &buffer_size_kb_fops) ||
 	    !trace_create_file("trace_pipe", TRACEFS_MODE_READ, remote_d, remote,
-			       &trace_pipe_fops))
+			       &trace_pipe_fops) ||
+	    !trace_create_file("trace", 0200, remote_d, remote,
+			       &trace_fops))
 		goto err;
 
 	percpu_d = tracefs_create_dir("per_cpu", remote_d);
@@ -422,7 +460,9 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 		}
 
 		if (!trace_create_cpu_file("trace_pipe", TRACEFS_MODE_READ, cpu_d, remote, cpu,
-					   &trace_pipe_fops))
+					   &trace_pipe_fops) ||
+		    !trace_create_cpu_file("trace", 0200, cpu_d, remote, cpu,
+					   &trace_fops))
 			goto err;
 	}
 
-- 
2.51.0.rc2.233.g662b1ed5c5-goog


