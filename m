Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE123C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 13:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qN1qLB688cXUuZ/HXgT/LV4b04RQzcH3V2EM2BOQMbg=; b=f7czZDtJ3M5ozQhxGq+s+1+yIo
	2j7quBXyx7W/pS/Na7+4n0m4B7+I4U4eSzClW+wHV56GC0Vc6wBRSHm+bG49/LmyXSV8M4bJ1m7XH
	EUlbZ5wnKfm6I0RTsOeKjQLCJdBsWFEr+4julLCNJA4ZRDyDl3KEJMhsQAISPGQ3U76yFzqWg9fSb
	Z+KUQYSv3NEXUS39L0wtO98sxPfMez5DVOYyIemS3QvmU/hu5HGWF1D1LjaGg2B0lQfGE6lsMynWh
	zJQ1WdEWNbpWdPYcJY3HMw4DwpFcEhNYNSPgsv9zze0ADYkLdfz6rWgM6T1nLqwPZn0qnPyywi+WR
	ilIGmhaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvSp-00000003aBd-3NOR;
	Fri, 16 May 2025 13:51:03 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvIp-00000003Xmj-2vRK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 13:40:44 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so11975755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 06:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747402842; x=1748007642; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qN1qLB688cXUuZ/HXgT/LV4b04RQzcH3V2EM2BOQMbg=;
        b=YiAUeZXgbBKaZW7fD4A0JCwPXDOh4uJEcjGMOqk8mzXKfJXl369zO9k/HZQzhJTFlK
         6J8awmxu0se8r4VUTQwazBNGeWbUY4HSNIPJtAeqVDaq2OkEHxTliLkH6vEAhD7i8dOH
         IPfcDECyde8NaILimvcBylrJNwPHlfcrPqgJFO3W8PJmw8t2jH5k/maSHGHf/ml5j/sf
         UigGkY0/3eEmzkL44fg2u0v0GHPhTm6x3LpnjH78vnzzvMliH40Jk1ME1NpNmkFFN1Nm
         FYqdsBnHxhnGPdgHf0QXvremYBdz/6Em3s3n0AlAoeDkIJx2hmJ5VGcszpe796iz7bLq
         cMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747402842; x=1748007642;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qN1qLB688cXUuZ/HXgT/LV4b04RQzcH3V2EM2BOQMbg=;
        b=vHVzS/ZDIJcueMZNz9dibPGkpfK6sGH29VToNAQ6oDpzJhofK2JgwLDo3rzxeOvdnl
         TnFeFmIf6dCw6pFp/+Z+28JpkAtTOD8Lqn3GwfVE5c+YDHXYXKX7BEMuPBR+srteTQkI
         /9YhKvyNrEalN28p/uym3EVuuUxpCkLL8RUHGoLvp9aLiXuaQIsVw/03Peu/Oh8qqQ55
         QhJDNbTlQB1rwJqSndb49gw0z+oc57JNJkB2Wd6ykEL7TyemS21ucdz0k0U6/EqxZcD1
         vNSKHVSV5yznMXgMMlNJ4r54xRSvpYIOGep1sZN/kGp/wxYtHX3YN1/9EdftKBoBwcyI
         wAsw==
X-Forwarded-Encrypted: i=1; AJvYcCXQcxV7ZHsmSBpNGRxmVLsqU/fKZsPiJ5mircn5Nu9RlwUuYV69JW9VwLOUok7uFm4Q3SkxEAUkOJRGZ57icNDG@lists.infradead.org
X-Gm-Message-State: AOJu0YzaxkSk/wD6JDNDanpQWB6ZZwMmXtBz6LHHquN7hPi1fdrJPM1u
	XmBba7uIQlg55GkB7mQzT6FT05UYO/sdwW/i4FH87jaKu0tTcDwtlUPKspqdSvO40kkBgNWHIZV
	C0NKrxio4cBcCm65Epq/QDA==
X-Google-Smtp-Source: AGHT+IFb0Ij3JAOsUyjNFzFS5ss/HuZjvc5vWhAsggz5dTMhe7SD0zTpYBX4PqyTUjGk2jMHuKx1WSKXkXFzSm0+
X-Received: from wmbbh10.prod.google.com ([2002:a05:600c:3d0a:b0:43e:9aac:5a49])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d28:b0:43d:ea:51d2 with SMTP id 5b1f17b1804b1-442fefee236mr24868925e9.14.1747402841965;
 Fri, 16 May 2025 06:40:41 -0700 (PDT)
Date: Fri, 16 May 2025 14:40:10 +0100
In-Reply-To: <20250516134031.661124-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250516134031.661124-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516134031.661124-5-vdonnefort@google.com>
Subject: [PATCH v5 04/25] tracing: Add reset to trace remotes
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
X-CRM114-CacheID: sfid-20250516_064043_733437_7B0B67C7 
X-CRM114-Status: GOOD (  12.70  )
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
2.49.0.1101.gccaa498523-goog


