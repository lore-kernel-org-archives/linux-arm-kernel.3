Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB0DCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5ChM7xYZbIcJhJhkgKHyrsGnApdkThlCNMDyu2wV38=; b=mWQjEcvGlDRnOV87WaDBvOC9Gr
	lWRPdjJZ6PMi2f/hjs0yRZKpUIzr0xuTDQ5KhfrLZshMyksMf719QSFagEO7xNbJLQ3dcHCUbYyZp
	jY9cw6owf/aK95ZIuae6AUPuVpAdn2/29eyiLOA187m/5BMjQpOv3eDpx2/Rq8TEUljAhrv2zQQa1
	eUqv8XzOyg+dMYvXAk9aB5j+al+OXrZVR4j2ec5E8dEp7L6uJzv034gIqR6hPG6R7UJn9kdtjQJhN
	nHifVCIGzdW6MbHTDfCXo1jr+i8vuDwQoIerrDBJldB0EILv20TS3LabIOA6wv+RRrEcnsPDn6tKj
	QD68+D5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g05-0000000CQBa-0kg0;
	Fri, 03 Oct 2025 13:39:09 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g01-0000000CQ4y-0kT4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:39:06 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-46e3dcb36a1so16039055e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 06:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759498743; x=1760103543; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=d5ChM7xYZbIcJhJhkgKHyrsGnApdkThlCNMDyu2wV38=;
        b=0OZcdEGKDh34CVooWKSjUtCmg73Qk2cSHbl2RLNgAGG0cJMQEGaUPm60oOClRNv35/
         HBw21P+weUQmGcb2cDiJ9b7ScRxdUIwqs4UIDxaWQ8Z5T+80vbdSdCsEAfnianpjRTef
         w2b4ESS1HVDf75sqPCo0tk8kANF7IFsdbes/sppe5KtxkMPrnFEtlMzlVvhjPOfNOU5d
         GsSNF+pK1eVdk8gWXMnzQicThiANHYikLfEKhRMb26Qyw9yRR0Zgovwz/LL7Poi2T7Cr
         GUo//+r4DVcdy3N9/YhNCAbZxAvL9sgHXmNxXG20o0jAc/Z42dr0ElwWqyUDoIHImE7I
         R6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759498743; x=1760103543;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d5ChM7xYZbIcJhJhkgKHyrsGnApdkThlCNMDyu2wV38=;
        b=smrWVWwae2PZMP82O7uRtgxNI5JrjPR69vJRhuFqsmu4fUdozvAXLA4oO13K6Nf3lI
         MFK4n36EC19YprkXtGN4u1Vu/AwhTagD+SAfpsVce7J2vD3Ot0qE4EmCca10M2D5U+Pf
         V181/zpXGOKQuUKPopgM8+ht1R17eUuRcKYoL/m98mRwJZbNFrudeNx5v2yRvSCvpVL+
         BjjTe27w2ciayVHoQkXniVIVuoaj7ETdjpaA2atM0N8FGXSkJbC/w3h0/w7mYmU/x0i6
         cpEIkZPK6u5j6SKp4Zw5jP1ZEWZU0eDd0AWuDoXzxFuE/0nOvFuD+Di1+n4MsgUHITGz
         8ysA==
X-Forwarded-Encrypted: i=1; AJvYcCU75nIRbpLl6BVyaYYJqi5m08wqpI4K+znKrvuCvSIj4yVGJLvTNkOB1FnA55Y6UdCQTbjPvtAvknfB2NfAKJCB@lists.infradead.org
X-Gm-Message-State: AOJu0YwViF0xsZl+jNeVB7FhWR6jL2kMMl/rAnSSd0Xxpn5CyNdw5ZrK
	9Pq1tTPP6+f+sV6l4Tvs7eEM9beoG0DyeCcJI7ty/cG5FyhF0pyO+hCfxaLmO8Y0wY2Va/UF03o
	idBE2d4IOk4SSVc7TY0cOqg==
X-Google-Smtp-Source: AGHT+IGEKVUnoX9TtZqLBT0f/tik6zhh9b91Brx6pOn/31k484u2FIJbEyDbYJWN7r7k8vY/aCKrmMghs8AZJmNC
X-Received: from wmcn6.prod.google.com ([2002:a05:600c:c0c6:b0:45d:d522:48a9])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3d90:b0:46e:3d5a:d15d with SMTP id 5b1f17b1804b1-46e7114dea1mr21903175e9.26.1759498743037;
 Fri, 03 Oct 2025 06:39:03 -0700 (PDT)
Date: Fri,  3 Oct 2025 14:38:03 +0100
In-Reply-To: <20251003133825.2068970-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251003133825.2068970-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251003133825.2068970-7-vdonnefort@google.com>
Subject: [PATCH v7 06/28] tracing: Add reset to trace remotes
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
X-CRM114-CacheID: sfid-20251003_063905_247174_4467F158 
X-CRM114-Status: GOOD (  13.87  )
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
index 3d76a4d7d5f5..abf83ff75df5 100644
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
@@ -411,6 +427,26 @@ static const struct file_operations trace_pipe_fops = {
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
@@ -441,7 +477,9 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 	    !trace_create_file("buffer_size_kb", TRACEFS_MODE_WRITE, remote_d, remote,
 			       &buffer_size_kb_fops) ||
 	    !trace_create_file("trace_pipe", TRACEFS_MODE_READ, remote_d, remote,
-			       &trace_pipe_fops))
+			       &trace_pipe_fops) ||
+	    !trace_create_file("trace", TRACEFS_MODE_WRITE, remote_d, remote,
+			       &trace_fops))
 		goto err;
 
 	percpu_d = tracefs_create_dir("per_cpu", remote_d);
@@ -463,7 +501,9 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 		}
 
 		if (!trace_create_cpu_file("trace_pipe", TRACEFS_MODE_READ, cpu_d, remote, cpu,
-					   &trace_pipe_fops))
+					   &trace_pipe_fops) ||
+		    !trace_create_cpu_file("trace", TRACEFS_MODE_WRITE, cpu_d, remote, cpu,
+					   &trace_fops))
 			goto err;
 	}
 
-- 
2.51.0.618.g983fd99d29-goog


