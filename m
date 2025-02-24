Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55515C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 13:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAhUrVqLivzp9jwXFDW1HJkTiMmByFJAoDrNGn0+mK0=; b=OyIUMZ0iuhD6GDo5VyVRX9TssJ
	9bCm29947mdqbiNNq7wXspl5T3+jzTlWwlCMgzI3kjsbhwuzmpNyYH+ZcKdT6ixnBez3ErUYTN4uJ
	vUG2eM55wOogOUtz/f72egfvENCLBElUXjvvT6HlVWRWLXNuG2JJOnMTeid7uBVoMmczrC/itcHdr
	UgdcVYd9I1nz+J1BoQS7dLgNfQ83k5uGTxr4gy51RI3e/Qse7ShyFVMeS499Sfb2bFbvVQLP+Bati
	yVDKNXeF4cuehf2L/sgTGc4Xa2DTVzd6O8EQEoldLPu7ByXa8j7E0uYDlWMwWyG8DhDhwoDgSDw1N
	4sMsYp5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYHS-0000000Dn9z-1kS8;
	Mon, 24 Feb 2025 13:13:54 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXN8-0000000DeRI-1Q3S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 12:15:43 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43947979ce8so18296445e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 04:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740399340; x=1741004140; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DAhUrVqLivzp9jwXFDW1HJkTiMmByFJAoDrNGn0+mK0=;
        b=j7px3+H2Z6OJTeSBoV+BsQT4fqleeMmHrx8tsdQk+DW55fHGoJekxFNsxtMG09F2Jr
         X0K6CcTfVojbee9upa17xhwb/kHexBvb7OhuPhFuVCOsGnJR7vGFgS9kq9sLmfxCRR0d
         HUeMmy1Ph5GeB5UtXLfO9neUmKaFk5L0c0CMRy46NqtPslj8WomSF59hCWdaYfczprp+
         7AGGX3EKgDy7rbnA0ZeZkQug/EgMmmyMo+lma7beQWzD7o4mwmI1IF6TWSrdTFS39dRZ
         33OvDwpgz9MJJF1M05pv7hwnegl6afIFiSopCVzaxFgfc+tFMtLdS8ygnaivodIXdzTM
         hA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740399340; x=1741004140;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DAhUrVqLivzp9jwXFDW1HJkTiMmByFJAoDrNGn0+mK0=;
        b=MwaLlX7VKcjkMuWWBywJ2qkEP96W+DoCfXEeys8WqH2CgUF62vzF9GwYj8JFtpYnxV
         PM09tC5v4+tih+csHnjp8abICA2r4idkWsf0Q3zoXcN+2JQH/sh3uHvyEJ+b7U0Rrd7A
         +5YFSgQ12XYCH8yEvpsaJWPX+K1iceTtpHbKBtikKM4rW7d8X+9YYw4oTyqp3CKgQP/f
         loVu9CwkXsP4o0l1H62OWfBOg1xwmAAiWCASg/unFWlCm4eW0Vpboq9SgePnEVM90ju6
         QIRthG9kjpECtwTkOidpwySSgdAI62kiP+Hgap88XB9A3yJHKg7zTEhSd0RTnJbnai+X
         y7Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVvr67HhCIoTXEeg+zVANK0XPrd6rss+F0pyNzJZ7YS+7EoBvjcFYQh5tBWvNrQeBRzHYAWkNpLCp3e0VafTd+L@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/ad4JB6l2YJnYVvnhy/8oI4bdnNc727mFMqAUtT/h1aqH7rx9
	egvGza7703P6SQqnvBb6V5lcwKXLUAEqEvsfZrLjfpK3acNs0KbPCwEBSCzqEkHBBO+n7mqmk8l
	8iSZjJcYpVJraV+DKQA==
X-Google-Smtp-Source: AGHT+IHQGpayqqEkTmw/Zvqr6LdF1E/ueJfO1lglmZUQzjDwUDQWHOMK/KK1dg4emFnGMwfhnTYT5JRRxbk4ic04
X-Received: from wmbhc15.prod.google.com ([2002:a05:600c:870f:b0:439:858e:8ce6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e23:b0:439:987c:2309 with SMTP id 5b1f17b1804b1-439ae221d7dmr101374675e9.27.1740399340381;
 Mon, 24 Feb 2025 04:15:40 -0800 (PST)
Date: Mon, 24 Feb 2025 12:13:50 +0000
In-Reply-To: <20250224121353.98697-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250224121353.98697-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250224121353.98697-9-vdonnefort@google.com>
Subject: [PATCH 08/11] KVM: arm64: Add raw interface for hyp tracefs
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
X-CRM114-CacheID: sfid-20250224_041542_377490_4E7C470E 
X-CRM114-Status: GOOD (  13.15  )
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

The raw interface enables userspace tools such as trace-cmd to directly
read the ring-buffer without any decoding by the kernel.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 3f91ad69c25b..38d97e34eada 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -746,6 +746,85 @@ static const struct file_operations hyp_trace_pipe_fops = {
 	.release        = hyp_trace_pipe_release,
 };
 
+static ssize_t
+hyp_trace_raw_read(struct file *file, char __user *ubuf,
+		   size_t cnt, loff_t *ppos)
+{
+	struct ht_iterator *iter = (struct ht_iterator *)file->private_data;
+	size_t size;
+	int ret;
+
+	if (iter->copy_leftover)
+		goto read;
+
+again:
+	ret = ring_buffer_read_page(iter->trace_buffer,
+				    (struct buffer_data_read_page *)iter->spare,
+				    cnt, iter->cpu, 0);
+	if (ret < 0) {
+		if (!ring_buffer_empty_cpu(iter->trace_buffer, iter->cpu))
+			return 0;
+
+		ret = ring_buffer_wait(iter->trace_buffer, iter->cpu, 0, NULL,
+				       NULL);
+		if (ret < 0)
+			return ret;
+
+		goto again;
+	}
+
+	iter->copy_leftover = 0;
+
+read:
+	size = PAGE_SIZE - iter->copy_leftover;
+	if (size > cnt)
+		size = cnt;
+
+	ret = copy_to_user(ubuf, iter->spare + PAGE_SIZE - size, size);
+	if (ret == size)
+		return -EFAULT;
+
+	size -= ret;
+	*ppos += size;
+	iter->copy_leftover = ret;
+
+	return size;
+}
+
+static int hyp_trace_raw_open(struct inode *inode, struct file *file)
+{
+	int ret = hyp_trace_pipe_open(inode, file);
+	struct ht_iterator *iter;
+
+	if (ret)
+		return ret;
+
+	iter = file->private_data;
+	iter->spare = ring_buffer_alloc_read_page(iter->trace_buffer, iter->cpu);
+	if (IS_ERR(iter->spare)) {
+		ret = PTR_ERR(iter->spare);
+		iter->spare = NULL;
+		return ret;
+	}
+
+	return 0;
+}
+
+static int hyp_trace_raw_release(struct inode *inode, struct file *file)
+{
+	struct ht_iterator *iter = file->private_data;
+
+	ring_buffer_free_read_page(iter->trace_buffer, iter->cpu, iter->spare);
+
+	return hyp_trace_pipe_release(inode, file);
+}
+
+static const struct file_operations hyp_trace_raw_fops = {
+	.open           = hyp_trace_raw_open,
+	.read           = hyp_trace_raw_read,
+	.release        = hyp_trace_raw_release,
+};
+
 static int hyp_trace_clock_show(struct seq_file *m, void *v)
 {
 	seq_puts(m, "[boot]\n");
@@ -800,6 +879,9 @@ int hyp_trace_init_tracefs(void)
 
 		tracefs_create_file("trace_pipe", TRACEFS_MODE_READ, per_cpu_dir,
 				    (void *)cpu, &hyp_trace_pipe_fops);
+
+		tracefs_create_file("trace_pipe_raw", TRACEFS_MODE_READ, per_cpu_dir,
+				    (void *)cpu, &hyp_trace_pipe_fops);
 	}
 
 	return 0;
-- 
2.48.1.601.g30ceb7b040-goog


