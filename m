Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABDFE9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 15:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrhhrmHzIsZI2KCLr8Q8iAPC9xtikp6+6Y5SdjRW0GY=; b=leJySungqW7rGJ5+mwGtnuToTF
	SLiKc9qQxfIIXMsKr2Nxg0MP4S6dwKkFKP+Z33iUdSUFBWCpubNg+DaCI4qUW8YupG1GXS1fJ/3Ja
	CUYczhc3zSj+GCoNrvOeG8+LrwVX2SOlqyIs0ufXPLnRqnhAtGbz49aBYdSp+1Pi/WkQ9tP0d1Wox
	vED4liBfj58/LeLyn+IPdeRvoTuBJuC6MVglI8tQqAYLW8G2qXcAVQKGRx5vXXI1qdL3ymfqyKovB
	zx+9U8wl5QayZERen+dWpLufG9IXf3z+FCH91FQpz8Cyb+IBe1lWskSHzKfLVutf2amnUC76qe4ER
	SCeCVSiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5Z4-0000000BUpr-0DYY;
	Thu, 19 Feb 2026 15:03:38 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5Ys-0000000BUfw-2FgD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 15:03:27 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4837907ec88so16684845e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 07:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771513404; x=1772118204; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jrhhrmHzIsZI2KCLr8Q8iAPC9xtikp6+6Y5SdjRW0GY=;
        b=BZ4jkFqKjvWsoEaxmC8ABQ2enzlfFOkPSjbk2dZ+XpnHmiPlJhNtieL19be0jPV1aZ
         F6CIrX3zDvdvgTmNIViKcqQjMNwTcfNIdXR94ExeC2/l5k4kwXMH4queiwvXoflntixH
         M1H2NLf2Oj0SnUAvRkxC+NMr+gVcZaep+EZV0vcVZIYuveIExwF21i6iwJI/ZAmbpmJE
         4zjpVCJ28N542EEqFQA3DsFr4gaQ7Pi1AJGC46jMPb1DY4ERsz2vnoCXElUf8RtNmRku
         TGL9PgPD9b/dgWP3OJGfJMGeoHPUOsL8erbI1LAKqT4MR9ixmbKiQKF/0dnVQyLfki3b
         DX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771513404; x=1772118204;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jrhhrmHzIsZI2KCLr8Q8iAPC9xtikp6+6Y5SdjRW0GY=;
        b=Rs138K85/FSaTDsW3jvTS7vzle7JNhoCrJpSdlJVJMODAfc+mtF1NKjkQ5S5kqbkts
         NUm9CP4bVgYSWs6GWo1ZqT3BUlg0TaTZbkc4rTlecqYwxZhPr/9uCj6u75myr5WB3po3
         ZBbJmL+7PJ1L1SM5omqQhdNMuyA8R83oQGhXO+WdbqPVwzAk8IA6c/1+5KJ4GjXKkO9L
         RUPqTaqPBqnvY4EYRCq9+f01oPx+dEkUkyF/WEJcSa1y5UXI5UvwxA4V6c2TWL7RydBs
         Cz1mhAYioOgh/lkSbLLiopAep+h4kleM5HGoR+jvL+i7c+709bY1hk91sJZVfsEkWqlT
         J/Kw==
X-Forwarded-Encrypted: i=1; AJvYcCU8I87WWgM1QVt894zDDPkdognH+CXkuuZLYp0tPiHZa2trDNIA6uT2E6593cIPzKekZr2BVXPSjo7duGAMeJYd@lists.infradead.org
X-Gm-Message-State: AOJu0YxPxOzXJY4xU8ulMoebsHEqDHFWYHaXD2c7Oycw5upzqq7HcVp0
	7rJCPh2SbxyDrXTPVqgriA9k1CeQutEw5uF5Amp1+Hh+PRGXxXg3msU5PoECwXoQBnQC8CbNqPn
	EjofTAhA5lb22ViuiBfYRwQ==
X-Received: from wmbes20.prod.google.com ([2002:a05:600c:8114:b0:483:6fc1:fcdb])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:6443:10b0:483:8062:b43 with SMTP id 5b1f17b1804b1-48380620d3amr203528975e9.19.1771513404539;
 Thu, 19 Feb 2026 07:03:24 -0800 (PST)
Date: Thu, 19 Feb 2026 15:02:43 +0000
In-Reply-To: <20260219150307.14538-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260219150307.14538-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
Message-ID: <20260219150307.14538-7-vdonnefort@google.com>
Subject: [PATCH v12 06/30] tracing: Add reset to trace remotes
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
X-CRM114-CacheID: sfid-20260219_070326_623776_836C9ECE 
X-CRM114-Status: GOOD (  14.68  )
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
index 7015280cc9d3..83593fb8b425 100644
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
2.53.0.335.g19a08e0c02-goog


