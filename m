Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E195CCF65DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gO4YNQJWWfD/ARRZWKWkjPHJll8Owsq1oA4pi9BzLQQ=; b=1T3pMR3ZUJWIIC2GN6Jqarp3uo
	VE3K9bQK/9T8hhKsoz64FnfRjGVeMRW9xY0Of6GSzoCKMrvuju9xX2chW0zOEHnVekW/wP0xScyWW
	unw/JXTkjGryVvaUg/v9nrzML0zB2wDCo7PhH+xNqXHIitZHegYA+gkO5N9mGlh+3m18C70wRtwUW
	YXq2cnKZbTsVtEPmeCOloflk3kyCa+sj5/FZT5tSYKwDj7KnKEQgz0Or+dI7Y/6SLGDLpZUiD3oBC
	CnqltIm3bHoKWlD9RxCywTlNEwpJ8N/fWzxhgza5/v7xm68rkQt1n8Bf/vKRJ+BnVQhLLY5ojf8wO
	cdgOIrMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5J-0000000CJTT-3jlu;
	Mon, 26 Jan 2026 10:44:41 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5C-0000000CJLU-1k9F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:44:35 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4801ad6e51cso38209285e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 02:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769424272; x=1770029072; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gO4YNQJWWfD/ARRZWKWkjPHJll8Owsq1oA4pi9BzLQQ=;
        b=jIw3zIiqe784YuNZhcQeXr43/6XWX8PmrzJzR0L0+sPUOKEwT6b2v+hLWp3bfK/lzM
         cDw5U68p+SeNoXOsAIjlRA913JsxDLkGtLCZ10mLKJMdeUXj178n0/iQjgZ8lmiqft//
         j8pqBQ9zSTDnzbyu3qlXoUnRAqoDurpuET97f//yH0ySybBAAuATwR5nNpFptD3Ufsaz
         1ATDKpZihJA4zuYdtf2+LoR+cICbFhtFhBFSrHNZyL8o0SZE0EmqH36dqtlTYKaFcaoF
         tJvP1JLsm8vBOwIQvqqZi4erkAQuDTOJqXATjcqQrAPwNsTIcmcOBHHN4xvU4ElJNB0e
         ZpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424272; x=1770029072;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gO4YNQJWWfD/ARRZWKWkjPHJll8Owsq1oA4pi9BzLQQ=;
        b=q32yilG7rQ1W+mK2o0freobbjurIowGT4ARmMFlbB1e8FB8nCCWKICsFLQ1qCtHUwp
         +ac6H1upcBClM6CMbZ6vvlFYXaaJs0qfc2sXItZE2e7momyfaEKgp1NO22rgG8w5/n5l
         OawXf8Occ4Kz1cbUNfvYjQeg/c7kLk45MxZJWtHupWD49RcxT8e75vpvOxL5QBiPJeJp
         ph22EDnK7BeDAIR2BkDjrQD9AazCPrVFU/zmb988tLhXebJSQjvMYFiRza2nRBwSX2GR
         59hN6tFy4dZx1ki7ff2jL/2WzBGaDsx38vktNqSd1BWphUGw5OocBEIAoOPA0OVnEZbi
         Hbeg==
X-Forwarded-Encrypted: i=1; AJvYcCVjYHdyO9O60a5sLqDqhFSbuGSX53KmiSK8sHBn+mXogAeX9yCzsljlgejCwYJ6vJWzh6FWUNNU4zICSiqx0eKD@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2ZmIAD+8XKLiumifsZsCrl4spHfezFM50j3XK9qhK5DEbRmFP
	OOFWlleRRIU+5ULY7NQedLeUC5neWDpSvu5HUD5LkOA17LCF6o138BWE2Bjku5ioTZMNlr+OIvl
	aC5Qj3ddUwsqN/VbHoO+Bmg==
X-Received: from wmjx21.prod.google.com ([2002:a05:600c:21d5:b0:47d:86c6:ebc9])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e1a:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-4805cd430c9mr70494535e9.7.1769424272078;
 Mon, 26 Jan 2026 02:44:32 -0800 (PST)
Date: Mon, 26 Jan 2026 10:43:55 +0000
In-Reply-To: <20260126104419.1649811-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260126104419.1649811-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126104419.1649811-7-vdonnefort@google.com>
Subject: [PATCH v10 06/30] tracing: Add reset to trace remotes
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
X-CRM114-CacheID: sfid-20260126_024434_471771_839BB88D 
X-CRM114-Status: GOOD (  14.00  )
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

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/trace_remote.h b/include/linux/trace_remote.h
index feb3433c2128..55754ef78104 100644
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
 
 /**
diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 3d80ff98fd90..49c4ae127533 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -63,6 +63,7 @@ static int trace_remote_load(struct trace_remote *remote)
 	rb_remote->desc = remote->trace_buffer_desc;
 	rb_remote->swap_reader_page = remote->cbs->swap_reader_page;
 	rb_remote->priv = remote->priv;
+	rb_remote->reset = remote->cbs->reset;
 	remote->trace_buffer = ring_buffer_alloc_remote(rb_remote);
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
@@ -410,6 +426,26 @@ static const struct file_operations trace_pipe_fops = {
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
@@ -440,7 +476,9 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 	    !trace_create_file("buffer_size_kb", TRACEFS_MODE_WRITE, remote_d, remote,
 			       &buffer_size_kb_fops) ||
 	    !trace_create_file("trace_pipe", TRACEFS_MODE_READ, remote_d, remote,
-			       &trace_pipe_fops))
+			       &trace_pipe_fops) ||
+	    !trace_create_file("trace", TRACEFS_MODE_WRITE, remote_d, remote,
+			       &trace_fops))
 		goto err;
 
 	percpu_d = tracefs_create_dir("per_cpu", remote_d);
@@ -462,7 +500,9 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 		}
 
 		if (!trace_create_cpu_file("trace_pipe", TRACEFS_MODE_READ, cpu_d, remote, cpu,
-					   &trace_pipe_fops))
+					   &trace_pipe_fops) ||
+		    !trace_create_cpu_file("trace", TRACEFS_MODE_WRITE, cpu_d, remote, cpu,
+					   &trace_fops))
 			goto err;
 	}
 
-- 
2.52.0.457.g6b5491de43-goog


