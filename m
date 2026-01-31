Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C837D79767
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 13:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERRzO3AEMEo0ywt1F8tEw+KoWErOg0ckwY8dacZ6eiw=; b=WGTwnkUMgyeeklkcbnYVhJjnmA
	r8VXvTRkj3OfPQKqTHm+4dn90aopKYeEY17T1GjvXhiVJl1PF9p8pWQlq2UIzfsKFqQhaV2RkpCl7
	u4VbeXWQteYs3xMySkKOe140Em+koGyAAbMf/P21yqx+oNLIUfxGagfIOgTb7b1wy0o+95PAvxdUp
	NFixZfEUzAyxwwxvs2zRQ5lYpTWzVDj28jYmott7omcYfIxdRdOfbuLj4soysl4GvnqJeYauzKONf
	/29J/d+u/KTvpRHLz8LJQaGaPH1Us/1eazZlGDWDYyEyLmtIh+kAf1nsXDNVLyUMBbzaEBLtx1xnA
	bJAC5bHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB2g-00000002bxE-3krN;
	Sat, 31 Jan 2026 13:29:38 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB2X-00000002bqD-20Ok
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 13:29:31 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4801c1056c7so16245265e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 05:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769866167; x=1770470967; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ERRzO3AEMEo0ywt1F8tEw+KoWErOg0ckwY8dacZ6eiw=;
        b=iibscf4zVSH65BSvGPMcznJr32IsL5mI2TeMq5vdwwXXfgd7pIDxMiIYbvu18MLbwH
         aeirbiHBTJbKlp9g/rZczevKRc5UVB9p1/aiO6e3uEwhKnVUr8fl5r2t7V/WZxy7S20A
         ZazYN+Wg0Ep2Qf47Gd+74tJr3MrTOnMKOMRUihTTsajlaO8FDSMhX21c/3UxW1PrRmkv
         F2hsPkQXOmINP1dfoAi+nyLsbmO8I9n2fWR1eC8cmgMARE1/yvuph9fygY9Pcji2UsDN
         pTfOkKixPzyzkweKGEObubhyxaXuu9Qh0j7ZlRVVrs+UiSnJX/mU6x/Dy4Aa/1toPhNo
         ymhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769866167; x=1770470967;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ERRzO3AEMEo0ywt1F8tEw+KoWErOg0ckwY8dacZ6eiw=;
        b=SME+35Ex++Wa9dTuGDBLCdx5V4gk/oXGG32zLiqfXljzHKQ0SSKZCxRXqWQFFbcOSq
         lwIyzHXPd8SDnAu/wi8++j+0xvuyDZHLUXmN0KiYrFmdu5wZvmiPx+9ZJG/SLzjqHqMU
         a4681q630z6L6KcyLNdCv5P1V1RGWSCBr/mcRUcbP6Rv2Wu357CrXy+DwLclH/UtsQXr
         uj6o/ChXsB+DehA4RSZNe5rSPCi7JKfQ751H336CfTsqpnVqTLy4uk1gu+FPnUm9s4qf
         9dLY6bbJpasdoYwgi403ODGprKvu1Vy+qnY1YEJzomPbEYQY9xxrdoHEsXtgHzNfEcvR
         ixsA==
X-Forwarded-Encrypted: i=1; AJvYcCUMUJQQ3rjTkCAhaDebG5ryAqQV+G8qEmRonjeReH8Jymjq+W25VbhWq7VjNYkZAyDweaFXXicoru1XM1INuu5e@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9075ckR/vfhrSfWP7THrQIykYfWDyq9n0ikgWxjejeJz/GJRe
	0+0xAvohOzTUCH9IJVZ8uCeu/JkoXjOPeXuksFSh6LhykN1+4qMT4RF+qFc/h09kHw6Fl0j8CeX
	UEXuecocGE1L7iGA4PgA1kA==
X-Received: from wmqu15.prod.google.com ([2002:a05:600c:19cf:b0:477:a0a1:eae8])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e24:b0:480:6a46:3616 with SMTP id 5b1f17b1804b1-482db448890mr79441815e9.4.1769866167109;
 Sat, 31 Jan 2026 05:29:27 -0800 (PST)
Date: Sat, 31 Jan 2026 13:28:24 +0000
In-Reply-To: <20260131132848.254084-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260131132848.254084-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260131132848.254084-7-vdonnefort@google.com>
Subject: [PATCH v11 06/30] tracing: Add reset to trace remotes
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
X-CRM114-CacheID: sfid-20260131_052929_564448_DF43B2F8 
X-CRM114-Status: GOOD (  14.06  )
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
index bd327a8184a0..7fb5271a8c30 100644
--- a/include/linux/trace_remote.h
+++ b/include/linux/trace_remote.h
@@ -18,6 +18,8 @@
  *			remote to allow writing.
  * @swap_reader_page:	Called when Tracefs consumes a new page from a
  *			ring-buffer. It is expected from the remote to isolate a
+ * @reset:		Called on `echo 0 > trace`. It is expected from the
+ *			remote to reset all ring-buffer pages.
  *			new reader-page from the @cpu ring-buffer.
  */
 struct trace_remote_callbacks {
@@ -25,6 +27,7 @@ struct trace_remote_callbacks {
 	void	(*unload_trace_buffer)(struct trace_buffer_desc *desc, void *priv);
 	int	(*enable_tracing)(bool enable, void *priv);
 	int	(*swap_reader_page)(unsigned int cpu, void *priv);
+	int	(*reset)(unsigned int cpu, void *priv);
 };
 
 int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs, void *priv);
diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index f8ab328df70a..82060bb19ba1 100644
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
2.53.0.rc1.225.gd81095ad13-goog


