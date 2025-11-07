Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB755CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8oUgbBX1ulXE/9DMN2n7zAGqIrRVP1Mxd8sp0hGAu+o=; b=mYh4k3VPZjKD6T21Q+HvjXPkdJ
	Ose3Ce6M4gy00LaQx+wdcAWTISpp8GdHHw210OYZWjiBp5oNhK400tofOU0BiWHjEg9HlS6paZnX0
	9/TKr+kFFJJ/CkDm1SQsibgkRSFqVSIaD9ZbUJc4pE/uTsICS8WAt1D58uU9gY6BFXh7x/1R3z84y
	+q/WuMHi+mQLyaOlYJbo5H7jWLS5VCuuLkEaoGLX6q24qmStxeQVgP/a05mBVWzNE7hw3ZvEZZffS
	KlE3RzKEeMCFQycLpV/0aOa+w+QtAem/k6kICaFIwfhYaBkfWgO7cO2Hwdl4Ul5yqlsX0Oaoymw7u
	OPUYYByw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIvm-0000000GyNi-3ptS;
	Fri, 07 Nov 2025 09:38:54 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIvj-0000000GyLT-2fje
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:38:52 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-477563a0c75so3190065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 01:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762508329; x=1763113129; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8oUgbBX1ulXE/9DMN2n7zAGqIrRVP1Mxd8sp0hGAu+o=;
        b=Os1cFGxmiLjw7OPtaVUEPqA+QMEXkD1E2P39QZm/Q22cnevJtrl5Ry04LA+6zGr7CZ
         Q5JM81F/iSPBy8vuSoxxNj+4QLQqQZU6stV071hMm/eXf+kdGLHPcuZXRNETnicOjXPV
         SlGLBnANf7Ii8KOlqFJBcQ+vM3g7eSnmjImAuDE85MzBqn1CuwATfP8F4CeXez5fjHLr
         eT0Bs8LelfaTlCWzXPyYNpU3Z8SYueuG/iOo9LA5EE8LWIocjNi9Rt4NwdR4qLTXXjfi
         uzRTh7MtyYX/j1BYTNXw16m1bk+NeYD0lLZEk5QYWCm1J0P9ncTj+rJbIVa83ik7R2v9
         RI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762508329; x=1763113129;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8oUgbBX1ulXE/9DMN2n7zAGqIrRVP1Mxd8sp0hGAu+o=;
        b=jNbrT1lscBM1rLpjrLYpNHsJCVe9P54rnd+CR1g8LIVvuCJe+AXWcyG8Gp7jxGJW8f
         CQEOWWyO1sbDHUxJpRptxYgyI10PbU5jnOG3k7YsexxK5HZuqyOoLrxrZjnMIl8epOaq
         UKqFzCnxFAuphCy15d9kk/QJat9pesz4I1KHCH0spSxS8u8ACRRDi+3sS5h8It2EkbO7
         IwTUhUuZYHROlUBoqhZ70LNDPwDiHN+GJvfeHzkZI91Hyw6X/CJWA36cUYl9w8pe1Kiw
         2rlwNDvm/oKGEDpw+hdBxoK3ttYQcLvtyTPDjg/HtLQ170HK8pDYeFlftq2LDUuOfTtI
         3hog==
X-Forwarded-Encrypted: i=1; AJvYcCXeRHhWuW6ERT30H0Kdzr176iqso6zdmC0PVa2OQ1B0s8VHxWZ4QIvLHZ3Nho7cARsSbt/GBbZ78LpGUJiCTcLa@lists.infradead.org
X-Gm-Message-State: AOJu0YzVANiqFKcoHZ/8TyIwqqXvs8NtRIhLEymU7ScSRBoKNyie6pcI
	5nI4x6u0tMqZBE6tErhiVCE8MzbbDftXJ3NnvH+wDFhZqgftU+qxRT5h3mz+pKhm4g5bziZMywm
	FKDdmi6kL47LGxIUmhS0CFg==
X-Google-Smtp-Source: AGHT+IE23rPEzYSe4I0moWqEMyLx5Nz/SDjuSLTsgRUDjXKubF44UKXd0LSGwV/bDB8OhzSN4YVGVIEmz4/I2dF8
X-Received: from wmot14.prod.google.com ([2002:a05:600c:450e:b0:477:bdc:7343])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:548a:b0:475:de14:db1f with SMTP id 5b1f17b1804b1-4776bcc2b13mr22237325e9.30.1762508329480;
 Fri, 07 Nov 2025 01:38:49 -0800 (PST)
Date: Fri,  7 Nov 2025 09:38:13 +0000
In-Reply-To: <20251107093840.3779150-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251107093840.3779150-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251107093840.3779150-2-vdonnefort@google.com>
Subject: [PATCH v8 01/28] ring-buffer: Add page statistics to the meta-page
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
X-CRM114-CacheID: sfid-20251107_013851_692259_D875C7B2 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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

Add two fields pages_touched and pages_lost to the ring-buffer
meta-page. Those fields are useful to get the number of used pages in
the ring-buffer.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/uapi/linux/trace_mmap.h b/include/uapi/linux/trace_mmap.h
index c102ef35d11e..e8185889a1c8 100644
--- a/include/uapi/linux/trace_mmap.h
+++ b/include/uapi/linux/trace_mmap.h
@@ -17,8 +17,8 @@
  * @entries:		Number of entries in the ring-buffer.
  * @overrun:		Number of entries lost in the ring-buffer.
  * @read:		Number of entries that have been read.
- * @Reserved1:		Internal use only.
- * @Reserved2:		Internal use only.
+ * @pages_lost:		Number of pages overwritten by the writer.
+ * @pages_touched:	Number of pages written by the writer.
  */
 struct trace_buffer_meta {
 	__u32		meta_page_size;
@@ -39,8 +39,8 @@ struct trace_buffer_meta {
 	__u64	overrun;
 	__u64	read;
 
-	__u64	Reserved1;
-	__u64	Reserved2;
+	__u64	pages_lost;
+	__u64	pages_touched;
 };
 
 #define TRACE_MMAP_IOCTL_GET_READER		_IO('R', 0x20)
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 1244d2c5c384..6e912527e44f 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6113,6 +6113,8 @@ static void rb_update_meta_page(struct ring_buffer_per_cpu *cpu_buffer)
 	meta->entries = local_read(&cpu_buffer->entries);
 	meta->overrun = local_read(&cpu_buffer->overrun);
 	meta->read = cpu_buffer->read;
+	meta->pages_lost = local_read(&cpu_buffer->pages_lost);
+	meta->pages_touched = local_read(&cpu_buffer->pages_touched);
 
 	/* Some archs do not have data cache coherency between kernel and user-space */
 	flush_kernel_vmap_range(cpu_buffer->meta_page, PAGE_SIZE);
-- 
2.51.2.1041.gc1ab5b90ca-goog


