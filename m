Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C2ACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7u3zBILwoXGQwoYC0Xq9BW4AZq6+iJ2od8CaDzzVgvE=; b=EKEE5BKwWGTB6H5fx/t4E6ivHl
	L6elCOclSANVQNO5LrqV4H/foeqhuJCEyOsPusBoPLdpFyIKGyWtJSwEiteb9RtP4bdBeJoiTDUud
	hKvKSZAYVYG+pvfv4GwrhjpQiWlQRLfeR+I1IOCxc19WvApYzm8AXTPU6X8DGGR/UWuM6pdDhjXfM
	IYJY4svwviddCXCgMz2+zdXp/m7rLNPSbtrCIiXXHjzbxOerQZnyqzH3GU5uw/EWWepmhP/kXsZ0O
	5MqJMJIrJX6gH4LNfGM3kzgwHmMujPuc4S9mSrKvAJ6Lf3cYsGa3+bC/DP+SHHVfix7zs/hrfS59G
	WxziTxAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIvu-0000000GyUK-1EK8;
	Fri, 07 Nov 2025 09:39:02 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIvq-0000000GyNN-2Ivg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:38:59 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b726760acb7so83243666b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 01:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762508334; x=1763113134; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7u3zBILwoXGQwoYC0Xq9BW4AZq6+iJ2od8CaDzzVgvE=;
        b=qKF+hYftnbwZKolYQUhbbexMxqXJhG+n7uALYBPRLANzPpqv/m+LSFScgl4BSnvQzX
         suEElvt4CyI30O4qCXHjCl3ExalZ/08YZkuZugIT/e4biHoP63RSfLnW28klr0USakyp
         0t6dAV1POw4MAnOjwHcMz1cDcYd3jUIwx5GE1hYunA5OJZG7e64tEcqXZwPXagcprFHi
         dB0WdDiE45oVd2JS/2TNVy8XrDJNYHK0SkQs1i+4lqV3jJMDLEjA+LXoTwxW5yip/zSX
         vZfqkxxX5EsEQRUD0mse1XCjJM3Bm889fARI1OqWkohhDB2+FfLA3f7VG/yGgFILicjz
         41Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762508334; x=1763113134;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7u3zBILwoXGQwoYC0Xq9BW4AZq6+iJ2od8CaDzzVgvE=;
        b=QwMr4mi9kPbJoR8cmwWFtdbY9OcxhKB8chkwZNA4h+6iFcZxadCuu4uR431Bc/KElT
         Vbd9/ymkOJ/M9uVPi0CmgYIaFH0KEDRFms7gxjEEiGVKWtOcp/7tBY2F0B2vIZuGW4MZ
         LlF6YYXuWBrXd78c8pTellobQ1xzVqeKlfZRKHTcA4mI/MGoPgkSCfPH/IcT5ai6U6aS
         zfWn19VIBx1620qXDyUVtblDtYRgRpKrszSq2R52AAZqmeScqOawUhQQxx9lSZvsUevI
         Lx9gr/ClLVjEG+ZwQdpo9EqqsUIhFYJvfcQRZgpaIzyhErljfXrLiGrZk2osY/CSqyjs
         cZDA==
X-Forwarded-Encrypted: i=1; AJvYcCUika/fxCHXH0gkXEKgKQnXZLambBYAeWLo4rXzZ9BU9SEZc0TjWKTiA6vHUTxMeW0JBfm0F9uOVduhhTDo7giH@lists.infradead.org
X-Gm-Message-State: AOJu0YwPGt6vAZRvS1fFElH1Pw48qZrSANJj3hgKg6YMaL9I6JNlYgv9
	F8yimTRDBHF4zMx9aGshG2TY2daEGaMKAE/PSIa93PkufyFgV6mZ0p2ZI6Z8S1AMoYzLVwZelG6
	P6gvxKbha7P7APWH6j88hpw==
X-Google-Smtp-Source: AGHT+IHgDkuNncZlaLiNpLMu3aTitmPuR0CM9YTcGFIKOu+7HlV3Qva/fuAcZvKIOdIctQ4yRTHRz1pClFG3h2kI
X-Received: from ejcqo8.prod.google.com ([2002:a17:907:8748:b0:b72:41e4:751a])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e28:b0:b72:b495:828c with SMTP id a640c23a62f3a-b72c090e60amr266298966b.30.1762508333943;
 Fri, 07 Nov 2025 01:38:53 -0800 (PST)
Date: Fri,  7 Nov 2025 09:38:18 +0000
In-Reply-To: <20251107093840.3779150-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251107093840.3779150-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251107093840.3779150-7-vdonnefort@google.com>
Subject: [PATCH v8 06/28] tracing: Add reset to trace remotes
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
X-CRM114-CacheID: sfid-20251107_013858_611443_D666DF38 
X-CRM114-Status: GOOD (  13.67  )
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
2.51.2.1041.gc1ab5b90ca-goog


