Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85D1C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BsA8D4HjHlecCQdG9p+xY7qsrnVwx8gbv9XN30ZeOP4=; b=km0HdVtr9gRsKyouxp45L5VDl+
	wJK0w1TviBsA0ytPIjfZc+xHb4p1n7PpYMbeiy8tyxume6QCA3AZ10HZ9gBgmbRftmI6334wIa5L1
	ABASuRW1BNlPVxsRLWtDdccye3SeRubuYtL8XXsTOnJL9tLbOfpLclNoW57t1WovvQGgkYasJyY7P
	IAZzlTd7G2KdaiQ3u6e50BjEj4ujColtCFaA+NMy8yAg1Ma3EfzxcF2EvE81qtIv26lOiQqACI/e4
	xmSCDrVR0FBl7XM7r0ythqZpB+NhK9QAdRa2yHhmT7rrEI2+bxozQP+Z+KhWyOH6aotJFZYtphij0
	x4UkHifQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQhO-0000000DXc0-3iAV;
	Tue, 06 May 2025 22:23:38 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLTJ-0000000Cjof-28wH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:48:46 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so27639665e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 09:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746550123; x=1747154923; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BsA8D4HjHlecCQdG9p+xY7qsrnVwx8gbv9XN30ZeOP4=;
        b=lJRCbWn6+bGLmR5DXIEWheXN5jzhbfNV9xX61rJMnvX3//UK3MRBldhkxT9Dft05Ve
         ph9EGf9Ln2c/dKZVN8tB7SwgjiyccMmN/aVxzTp3khhoJ+NaeTJhYh1RgBNWOUfientx
         U8ajXQLoTs8kNeTtlw+f2hbx11slyCHosGzbB2lPKBOw6CrLZd3C2PAqnW7bGU7S0aSa
         OZz7+vapX4wY6yde6f1qprsjnrtxKbNK3TII93xj0vPyT10KeY1ojJnAo1dpoK3J5jfl
         E8S8qW52JwVw6Y9vNnpo2TMDOcnUwYOxKJdtaT1yILK3oesrE+BpcoUf7oJU27krgnLf
         kh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550123; x=1747154923;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BsA8D4HjHlecCQdG9p+xY7qsrnVwx8gbv9XN30ZeOP4=;
        b=uoi4mNTt5znaeOIP5A2LOImjKNQRtwq5hKR8bas8KPtRVei9Wv1mLLaWvlb1noD8BI
         epWcGPWcPL7l2c1yt3oqdxBufXlBP+1Rk18gxlyLjoRx3AIxDt45AEuaewS2FtPypYaD
         y3ty13Kkn4UHS4BsGcfTzl1S3WPS9v5I7IKhUVwTj2KP0s8YCCuKFb2/C1Xv9z7qKZUD
         KlCWCG54g9dPNysqxT6Y8mCNs9qaakzCrl0t4THRaJViEijgZG2xf6KeAwUle6cW/bpL
         JIPqr35nkeoOShrRdKm5e7u7WdSKtEIrESJHe/8MwKtQet1suXTrQxvZUAs5SMAw78wj
         CDlw==
X-Forwarded-Encrypted: i=1; AJvYcCXwLqP9LTHrFVr3y+8s4F1aywzdhAxpa5cK34lvX2kpEhzXH3LTt7yq00ElOtqEyjZ+CInp3EO5b6YC9fFcwmhO@lists.infradead.org
X-Gm-Message-State: AOJu0YzVD+UA8+/J6Hify7Gtk/FT9EMaKh0Ui+WpyOj+TvgCsrqbKltX
	dwcReptpkPqbPVioAs0STEPo3P7Gii4CjS5HlH3L41IJZ2MM88ccVcF3P7kJEjqN654OqqbXZdj
	Q6+17+4ODRKOc//ICLQ==
X-Google-Smtp-Source: AGHT+IF5PMMWTS3cwH1oB8k42s2Xq6vSAGn672jUyunHJnJQKljjoLiBSvKPyhszSFei8WE+2z41aT3Hv72Lx/Nf
X-Received: from wmbay23.prod.google.com ([2002:a05:600c:1e17:b0:43d:522a:45e8])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5105:b0:43d:1840:a13f with SMTP id 5b1f17b1804b1-441d100a9edmr34417665e9.25.1746550123251;
 Tue, 06 May 2025 09:48:43 -0700 (PDT)
Date: Tue,  6 May 2025 17:47:59 +0100
In-Reply-To: <20250506164820.515876-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250506164820.515876-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250506164820.515876-4-vdonnefort@google.com>
Subject: [PATCH v4 03/24] tracing: Add reset to trace remotes
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
X-CRM114-CacheID: sfid-20250506_094845_552062_D2D52493 
X-CRM114-Status: GOOD (  13.47  )
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
index 462c2d085a08..2221705f65f4 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -70,6 +70,7 @@ static int trace_remote_load(struct trace_remote *remote)
 	rb_remote->desc = remote->trace_buffer_desc;
 	rb_remote->swap_reader_page = remote->cbs->swap_reader_page;
 	rb_remote->priv = remote->priv;
+	rb_remote->reset = remote->cbs->reset;
 	remote->trace_buffer = ring_buffer_remote(rb_remote);
 	if (!remote->trace_buffer) {
 		remote->cbs->unload_trace_buffer(remote->trace_buffer_desc, remote->priv);
@@ -135,6 +136,19 @@ static int trace_remote_stop(struct trace_remote *remote)
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
+}
+
 static ssize_t
 tracing_on_write(struct file *filp, const char __user *ubuf, size_t cnt, loff_t *ppos)
 {
@@ -369,6 +383,26 @@ static const struct file_operations trace_pipe_fops = {
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
@@ -399,7 +433,9 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 	    !trace_create_file("buffer_size_kb", TRACEFS_MODE_WRITE, remote_d, remote,
 			       &buffer_size_kb_fops) ||
 	    !trace_create_file("trace_pipe", TRACEFS_MODE_READ, remote_d, remote,
-			       &trace_pipe_fops))
+			       &trace_pipe_fops) ||
+	    !trace_create_file("trace", 0200, remote_d, remote,
+			       &trace_fops))
 		goto err;
 
 	percpu_d = tracefs_create_dir("per_cpu", remote_d);
@@ -421,7 +457,9 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 		}
 
 		if (!trace_create_cpu_file("trace_pipe", TRACEFS_MODE_READ, cpu_d, remote, cpu,
-					   &trace_pipe_fops))
+					   &trace_pipe_fops) ||
+		    !trace_create_cpu_file("trace", 0200, cpu_d, remote, cpu,
+					   &trace_fops))
 			goto err;
 	}
 
-- 
2.49.0.967.g6a0df3ecc3-goog


