Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3ABFCB601
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFq1QzHqVSYqV3EhHbsp/w5T0l1q5txSHzBQrIlCqvk=; b=X2Vbzci7MZUproKRZox1dCz7+C
	LMmZAlQfXHvif5/oRZG+PQrX5csTwmwxECJDXMZOld1SfemnAtXAl4AdV0HUfbf4Aj6hhMVLFwnBL
	nUc20KLasGKbSjTPt6+mhUSxgwSppZLd6w+MiprKxETZbRot5S8q+4/LJm1SiESFgcOgDLRDa9Xn4
	oTeLVydQOP0QjSeDZiwlHRoKGtNWZRQkNIt1XcvQZ2OTGWWasg1eFc5MjBnRFq700nxnp28kZpNyj
	IHL6Kv1uGJIMaQv2qtfq2ci8vYcWv6wbiEFQQ/H7VefcjwlOUFZBrz+HobuKrsxlIVpA90kbJdnrm
	SdE5lSYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWHe-00000003v51-3bbV;
	Fri, 06 Mar 2026 14:36:06 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWHY-00000003uyZ-3FQd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:36:02 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4836cf00787so96814675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772807758; x=1773412558; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IFq1QzHqVSYqV3EhHbsp/w5T0l1q5txSHzBQrIlCqvk=;
        b=dbDlWjjUCCM12CWtaa9dA9z7h14sj/PS0IUUlDo1ZOn16xd0KQRJp2sPfElxVQoEI/
         E6RjG+XfNTGh/vsvt6gTRShZ9rGWfQv/a7TU38MnE+aRycvSZ57jogx6MvA5rf77RbRS
         hBP8wFcZyuBcj1mpclr1JY0HduuPA9sSec6HUatHzHKu132RDDg9Oa1MQ2NR763XqOEV
         TX52F7xXzJBBjNLeog9INnocTPsZblwzq04DCP48NIDXazXZBBT5jSV76u1HQluQxNqh
         SeAF/koq4d/wT4YNMxQ/g6cr/QegD1Aj5ElTswG/ljiJ49qwLKUdCiGXcnqaercaKutv
         3XMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772807758; x=1773412558;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IFq1QzHqVSYqV3EhHbsp/w5T0l1q5txSHzBQrIlCqvk=;
        b=qqQNEhRgTdjoauUCDnaUXKwqVzVxmAIaWdHNC1ULtrdtvdwu6415nt6ayZByZUB6/o
         qOzomWozv4LmAym+bMgG2gHL/nATr/rOfqeDclBbNQ0l4Mrcy1kExw3noeemhC+NWC4V
         BBPqXDxBSRqyUMUSd5Q+XMAojkkedDAJoBzCXcvMbSaF2cdv0lvA7kxN6sf3fU5Z4AqH
         mGJhjHTrgkpSQuc6PNKIND4UAwIZMbDFJy8nC8j15UgHmOt+cIKbuofhMwuARZzmDQ79
         UXqjciQ82z8z9L7bcSMYpMVyvjvIJ6gluijVzUD2GVnLEmDaYuMBAR4mGAgNHkA/IBRl
         tAVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZWctYMTxfIyD1PWUKQw7D9XvK5Sa+BfMj1ZqE+lMU0SF0J5YZpOlKQnD7yU7xr+fAERtZd8eg6GLMDZdqLo9g@lists.infradead.org
X-Gm-Message-State: AOJu0YxhU8/qER5MVTWW1DhR2Ruz5cYjGeryfoXWosg2jjdPf2yOdfuw
	PZVAV0BVgv245K+4GQ3QbsEtFTucMh73ag4/OQrLns/eXbL6A7nC4YC3+Ol3Cydqm5tC+rC+mAU
	0D0x4kDufvB8W3H10jGQlBQ==
X-Received: from wmbf16.prod.google.com ([2002:a05:600c:5950:b0:47b:d5ad:dd7f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b2b:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-48526715213mr34206555e9.3.1772807758338;
 Fri, 06 Mar 2026 06:35:58 -0800 (PST)
Date: Fri,  6 Mar 2026 14:35:10 +0000
In-Reply-To: <20260306143536.339777-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260306143536.339777-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306143536.339777-7-vdonnefort@google.com>
Subject: [PATCH v13 06/32] tracing: Add reset to trace remotes
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
X-CRM114-CacheID: sfid-20260306_063600_859418_C7863DE1 
X-CRM114-Status: GOOD (  14.14  )
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

Allow to reset the trace remote buffer by writing to the Tracefs "trace"
file. This is similar to the regular Tracefs interface.

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/trace_remote.h b/include/linux/trace_remote.h
index 65b7e7b8267c..10ca03dc192b 100644
--- a/include/linux/trace_remote.h
+++ b/include/linux/trace_remote.h
@@ -17,6 +17,8 @@
  *			remote to allow writing.
  * @swap_reader_page:	Called when Tracefs consumes a new page from a
  *			ring-buffer. It is expected from the remote to isolate a
+ * @reset:		Called on `echo 0 > trace`. It is expected from the
+ *			remote to reset all ring-buffer pages.
  *			new reader-page from the @cpu ring-buffer.
  */
 struct trace_remote_callbacks {
@@ -24,6 +26,7 @@ struct trace_remote_callbacks {
 	void	(*unload_trace_buffer)(struct trace_buffer_desc *desc, void *priv);
 	int	(*enable_tracing)(bool enable, void *priv);
 	int	(*swap_reader_page)(unsigned int cpu, void *priv);
+	int	(*reset)(unsigned int cpu, void *priv);
 };
 
 int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs, void *priv);
diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 8b06f730376e..a7b94736dd38 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -63,6 +63,7 @@ static int trace_remote_load(struct trace_remote *remote)
 	rb_remote->desc = desc;
 	rb_remote->swap_reader_page = remote->cbs->swap_reader_page;
 	rb_remote->priv = remote->priv;
+	rb_remote->reset = remote->cbs->reset;
 	remote->trace_buffer = ring_buffer_alloc_remote(rb_remote);
 	if (!remote->trace_buffer) {
 		remote->cbs->unload_trace_buffer(desc, remote->priv);
@@ -138,6 +139,21 @@ static int trace_remote_disable_tracing(struct trace_remote *remote)
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
@@ -414,6 +430,26 @@ static const struct file_operations trace_pipe_fops = {
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
 	struct dentry *remote_d, *percpu_d, *d;
@@ -452,6 +488,10 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 	if (!d)
 		goto err;
 
+	d = trace_create_file("trace", TRACEFS_MODE_WRITE, remote_d, remote, &trace_fops);
+	if (!d)
+		goto err;
+
 	percpu_d = tracefs_create_dir("per_cpu", remote_d);
 	if (!percpu_d) {
 		pr_err("Failed to create tracefs dir "TRACEFS_DIR"%s/per_cpu/\n", name);
@@ -474,6 +514,11 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 					  &trace_pipe_fops);
 		if (!d)
 			goto err;
+
+		d = trace_create_cpu_file("trace", TRACEFS_MODE_WRITE, cpu_d, remote, cpu,
+					  &trace_fops);
+		if (!d)
+			goto err;
 	}
 
 	return 0;
-- 
2.53.0.473.g4a7958ca14-goog


