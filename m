Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F19CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5yvbWhTiB0g5MKRQJDvE9eSL8LzKl9DcqfgxeSAHNnQ=; b=Azbs22jsUvFTsn+7/77HsCqc9L
	qrG2Rr++/ooYWV8ANTRbheTzJ7BaykiB49NEungz+Df0M+WESi1bxcw3d5z/qrdtHJJ4anR38m/CS
	upV/yeYgoZk8J9MftstmgRmxwgMSxH4IQC/0zkk6gC0bydY8INWWyncYl1I9kGPcDD1IsX5o6c765
	Yc9/zyu9Yyx5SRHo+Cg7HnAX8xm2I5TtxncRy0/7moZGE+s3TdNVl6wWaNX/+E3ycYdcX7KAOdXR2
	o5Q7CQrVpRk6R15lTVyIWMqm0P9Fh62nSlz5ubmQ2N+PXcakPHbbW7Iu1mJB4vScWMzCoLrit6V1j
	xJti4+8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4fzy-0000000CQ46-18Zh;
	Fri, 03 Oct 2025 13:39:02 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4fzv-0000000CQ2I-45ze
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:39:01 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b04a8ae1409so306577566b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 06:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759498738; x=1760103538; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5yvbWhTiB0g5MKRQJDvE9eSL8LzKl9DcqfgxeSAHNnQ=;
        b=BmtciHIAZSA8ty/RrZpRsBjvRmlrytdw/jIW03Q4A1s6Orb/YZm3yV+PFMyCoU9G5b
         lOOTSNC9wolDqmSJbN9BVUC5lOrVcjBR20HoLBoJ/awyP5gLlrwX+Obff7q6b8uTzHPl
         8x28JVDKp9Qi4E2en6tAyBCwXiypF1UCrRpXLAe0JChsSCa2qIl/HH0boWVBBUJ0GZMf
         FSvjM7pYYsn4iRdb8Htq//Cyz2+Tw8BXYoplRTdMGfFYgIgawmk+ds8a/bpVXML58BWr
         o0prXw+H3FeR8LI0GvqA+vKHTol61q6EeHiTynEsRW6dSH9Sjpqxw1in0F1Xgm0OE8jr
         wq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759498738; x=1760103538;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5yvbWhTiB0g5MKRQJDvE9eSL8LzKl9DcqfgxeSAHNnQ=;
        b=he0rH2Dno215rahAayRsJO7ApIVYD9qBcKovmGW96xlUf5eUGISxzQqW6xrC4CRoSq
         4NnGnS9hJPoqazRhCnRcBrDYaNQDFPFdM0a4j2BcvTzLXUcD2aUcW4Br+WRaiFIoL+oW
         OhX/cBspEAdTJqj17PojzKzQ03s1kG+BJhEZ6Qz0Wy/UydQvM2iUtB4nMY7ncyo9cKxX
         ly7FWJ1SK0mhgixJFwuuoUnJr3BtzjyY+e0zQ40CfB9JQXGm/B3FjerQUQzowmIEdwqx
         fJzzqQPzhREPrCtkAaBhHjhWYweAWcJB4tmwJC8IGB2d/NRaqPShxnqAzj/59e75WYfu
         U4QQ==
X-Forwarded-Encrypted: i=1; AJvYcCV88vTqCM52sto6U1UPytKo+2ML69fAz1EbRz9bE0JD6T4zVtBng1BRnMqgErqOiyFujpMRyczr89fzMF69NGf2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+mZ4w6PHhrPbeyTxy957nujdfryD6HogXBhzaDk5TmOBSsSx1
	1po87gczvzMISQaJdMwmm+XXNc5c3XnYEgqcExuYueHOk6wY6Pnzc0FGjcKzLE4Wm5B2SuZ8yfz
	s1Jhkxy0onlvbFZ5dgaSNBg==
X-Google-Smtp-Source: AGHT+IEDmCVx4kHhiREAX0skvRTb6ED4U7OtfqA8ZOw1gh/kLPh63qYxbg7uCqtcVIZm2PCNUon2JI3FP9RVn5iq
X-Received: from ejcsa18.prod.google.com ([2002:a17:907:6d12:b0:b3b:b79e:764])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:4789:b0:b04:1249:2b24 with SMTP id a640c23a62f3a-b49c3933062mr408664166b.37.1759498737576;
 Fri, 03 Oct 2025 06:38:57 -0700 (PDT)
Date: Fri,  3 Oct 2025 14:37:58 +0100
In-Reply-To: <20251003133825.2068970-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251003133825.2068970-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251003133825.2068970-2-vdonnefort@google.com>
Subject: [PATCH v7 01/28] ring-buffer: Add page statistics to the meta-page
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
X-CRM114-CacheID: sfid-20251003_063900_028941_65415017 
X-CRM114-Status: UNSURE (   9.71  )
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
index 43460949ad3f..2c157cb86989 100644
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
2.51.0.618.g983fd99d29-goog


