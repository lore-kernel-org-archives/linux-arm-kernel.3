Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46CDCFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcApg1r9cceQ4UL6VhszcyvjDlQOmmlVckdEJQB7+XM=; b=2e3mAMXSWKa68geYxeMWmyhTzM
	0CJBl+H7S6Kr3iBSxnKpZg8C01VRdGrabI97db2aWizIwoNH5o4BHdkX28VTUJUsCNXFj7TaF8bpt
	KpCPNlKHCPlY4+bpO1J6YWz+wGbmTV55iQpBI8mPjJwOxodWW9rMdMMj+oUmTI1bE/3XmTrnNhmhy
	4d0R1mN/kPeGPSkbwf4pCBUWlKkHzs498r6nmTku1SxsEsYci0xoLSHmzlVQNdCyMI6U/Zb4PfV/4
	iSF/1SmTiGChgaiuOYHI/PV83B6FKHYPT245a1YUAQ/w5SQq4MgIhCs5MGv+HwtApAdaQ7Se6cvZu
	Gu16XCeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMoM-000000057yM-0UWb;
	Tue, 02 Dec 2025 09:36:42 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMoI-000000057t5-1FQC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 09:36:39 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-42e2973a812so2029624f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 01:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764668197; x=1765272997; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bcApg1r9cceQ4UL6VhszcyvjDlQOmmlVckdEJQB7+XM=;
        b=2zENoA7Az6+s9q7P+AmHG3oRFjhn2+lQLeqRBh6RCrRfCKEFdRvd6OxNZRlO4aZfjO
         hZeuXk+tUYve2ugglKTfz9/s3O+H97543FcBTHcYePOGjEf4tQn5L16TQOA4bohZLDpV
         UbDPwEnrpF3CH+CxZKoRk9u6FQP1k9M5FA42C+GaVs9mDp43mEN7ScF4alK5/mOCWOVR
         ewUtoVWVVDzod4HVMypj8A3YjtM/3GyVosgMuWAoVW+Z+kaaE2OW7jaHMt/+wX/F5enM
         H+v0FXg/5GXrjN6NNRhe6GwOn45+Cb4KbIVM/MQEEtrPmqq8lCN36O2RdM+ApHDcrnp7
         FMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764668197; x=1765272997;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bcApg1r9cceQ4UL6VhszcyvjDlQOmmlVckdEJQB7+XM=;
        b=I+R8MSCkabxW2r6m4M5dYqC+Koew8s8scixVWBeAnuOP0NS4PCeQur+515wv8SqtvU
         FtFIdjfAq7ar3IUHEzzGufFJw2y9LJA31/vovxM+EWbKDFqmBzNq7yO9HDf4brp+d7XM
         Ny1m7zDubwo1EuU5+87qtSqbdpEPMhONkT2+lf77cwgPWt5ya1QXdl120+v8reIv4HoQ
         8aEljHDuGgfI4CpWxpALYftNh4LP1HCV+EsnR37nTC1B/UmkbqkR4sbZ68Tvud0/8cvy
         ohQ66PZFhb9icx7BCupdfeXNQ2Iqa9biwRMYgk3ST3s78wfCEpZFWzdz27hp0+ooTiHi
         eQ/A==
X-Forwarded-Encrypted: i=1; AJvYcCWO5Z6ls3RaYr3j5yZygLkug21AaqCbUXNIFcAB1RR8ndCpeEDmzkiOP6/iXQhvja0FOtNpf0vo66re6wyVnwUM@lists.infradead.org
X-Gm-Message-State: AOJu0YynvVeX+/fMaRejG6GgHLzolkadyrP91yZt09H/z3afh3biCpsb
	Ubx1pDZHC+XncSfhc1ib7usupp6bYOZ8Bp+oIkgeYjj/OxqeD/6HPcj1sR3SGtEPLJYhrN24jzc
	GlhXbMnnMZLjaryr68e0uIw==
X-Google-Smtp-Source: AGHT+IH3TJvr2zAYSXNT15LqvRIVfjNU8KvCMY3SDV8a8EoKXObb9LHToW89bbL0XkNsfdv16z/uBGgWK/weaUkA
X-Received: from wrbdn6.prod.google.com ([2002:a05:6000:c06:b0:42b:349a:10fc])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1a87:b0:42b:3661:304e with SMTP id ffacd0b85a97d-42f6d5a0bf6mr1991537f8f.16.1764668196824;
 Tue, 02 Dec 2025 01:36:36 -0800 (PST)
Date: Tue,  2 Dec 2025 09:35:59 +0000
In-Reply-To: <20251202093623.2337860-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251202093623.2337860-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
Message-ID: <20251202093623.2337860-7-vdonnefort@google.com>
Subject: [PATCH v9 06/30] tracing: Add reset to trace remotes
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
X-CRM114-CacheID: sfid-20251202_013638_397427_B0BEB8AE 
X-CRM114-Status: GOOD (  13.91  )
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
2.52.0.107.ga0afd4fd5b-goog


