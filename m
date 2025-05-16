Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9C5C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 13:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTgve1xWELrcXmzWf6SXpdMIqoD+DsmzRfBMgyMmWFg=; b=L+ps9k6m5nxDAgi76dvH4AfUTs
	92B3DRlzSmQJWZciUnJk1vynlM3eiL+H8gZeiYk/M4Hliypz4jgX8h40jOm4uHTB/Ti29AEacHjcc
	bqEhUyyklq65UK+KU/Q6pT7cjTUbyuJUf2VxmgNbOV9THCwzgQuZrIBf7MzmgnlXSehkVsTn8hSXD
	WbJJ1bYYAzQ0hbd9yJ3woutUJlbIfozr2kTLe0uCJ1cM4q0kTgfygPdccm0Ry+/NpeCdytmOR1ZD7
	vqDB+8gUMlW/DadoWjTINxftU7tZABg6/H5jBYd6hg4+2titLv77nlvCFGi/aljLBa+nRjkkeLkN6
	IsuuTDjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvMm-00000003YkJ-0If3;
	Fri, 16 May 2025 13:44:48 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvIk-00000003XlB-1enp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 13:40:39 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-44059976a1fso9510085e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 06:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747402836; x=1748007636; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pTgve1xWELrcXmzWf6SXpdMIqoD+DsmzRfBMgyMmWFg=;
        b=PxxTc9WvYeUJJga4D4xda8BxDacCTe/JzialPz0O9aa4axytRTruNgijlUvS0Kr9lm
         q5PSccz4aXVOKfMeDt321Ke9AZ3zFvOyzh4ga+k6Y44JWGPzQmWKsRdEl5AycBC0Re7U
         wBaT/nG12soIjpwTNk2TiGA/g1SRD+gJ90c2/8efWIih4xmKZzElZ5ROFLw6ineWpjHe
         W/uFIGvZ0XniA1T3QEsAMSA/gRS6lWf0ZEOWRenZOf5rHvIKWbD/xe4F5GhgJKt4dTTe
         YT5wFO5J3XC+TLcB8G7BlCW7VtDHAnZETixbTpYg8o2YV43K3MCcsTdwke3IGRY2qqKw
         VFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747402836; x=1748007636;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pTgve1xWELrcXmzWf6SXpdMIqoD+DsmzRfBMgyMmWFg=;
        b=KhN/pIw3sRDSNiGqMRm6graX2QRBYVqdlvxcClVsz/2fZ0hbprpoDL8Bh9n9frAgZC
         f+2GLli3fCpl+Igh2I3Z8FHjJxZR/UwawFS2iFRkL6/K37Td4U+vuHysBMa1ZwlrhMB8
         VtJN6xxxUu+dt4vaqLKUxy85iePL6rQAYEYT4ow+5tYod1Xv/eystX8PgJxAWEwIXw73
         BGOI7fLKJjBl93Wod6PV7NyBxVYbGkgK1kq8KCkxMAl5YH+Abz+peMjgDkQcos/Sp56p
         OJOCZqiqNMndwncmEBHJ1/yaenvHIFw9J94V0tYiqMof1dXWJTGgUksLUYIA1H6Fa1Qe
         I7sg==
X-Forwarded-Encrypted: i=1; AJvYcCU04ARkthczgUhHR0ZIZ6VR7yFrrcTkOXVHAFLV2Jf3Tz/wl+6fYx21yxcyryTBj8XtKafEl46FveYNgvsi4OFc@lists.infradead.org
X-Gm-Message-State: AOJu0YxdSJPB/+X6bVVwbMgb0fxTHhHQansHaRXJ9pck41y9oqxgbejp
	quTAaCo1HemlY/otRUzzY6aRhye42z63VbSDyK8C68RRDaCPIdCQTjGVXMQUZ8uwBBcLh3gxJNZ
	P4WbN4tuWXfRVN72YdQFbdQ==
X-Google-Smtp-Source: AGHT+IFL0LVuDvqNNVcVOoiBdDx5TazIXVwWBCNVMeYAJMsyUHLfmYM0SukSyOsyeQgmX+rhBkYVWkj0+YJRRVQg
X-Received: from wmbfl14.prod.google.com ([2002:a05:600c:b8e:b0:43d:4ba5:b5d6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:609a:b0:43c:fbba:41ba with SMTP id 5b1f17b1804b1-442fd6785acmr28243685e9.28.1747402836485;
 Fri, 16 May 2025 06:40:36 -0700 (PDT)
Date: Fri, 16 May 2025 14:40:07 +0100
In-Reply-To: <20250516134031.661124-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250516134031.661124-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516134031.661124-2-vdonnefort@google.com>
Subject: [PATCH v5 01/25] ring-buffer: Add page statistics to the meta-page
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
X-CRM114-CacheID: sfid-20250516_064038_431010_82B17D8A 
X-CRM114-Status: UNSURE (   9.20  )
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
index 3f9bf562beea..06214588c05a 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6016,6 +6016,8 @@ static void rb_update_meta_page(struct ring_buffer_per_cpu *cpu_buffer)
 	meta->entries = local_read(&cpu_buffer->entries);
 	meta->overrun = local_read(&cpu_buffer->overrun);
 	meta->read = cpu_buffer->read;
+	meta->pages_lost = local_read(&cpu_buffer->pages_lost);
+	meta->pages_touched = local_read(&cpu_buffer->pages_touched);
 
 	/* Some archs do not have data cache coherency between kernel and user-space */
 	flush_kernel_vmap_range(cpu_buffer->meta_page, PAGE_SIZE);
-- 
2.49.0.1101.gccaa498523-goog


