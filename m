Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBD0CF65D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffA5SL3LC5b8XzI2Nz3h29Xpe+4f+LbMdzYhyUIPyHo=; b=THSUBAcKAVmZKjf6Vy4chNDXlo
	XW2kS780YrwvPEZnEd4LDP9xE0Akmgrr+agJ5/Hi7jHlF0H/P4OOvmxcqPWUXZCtjFq7COWK6QWki
	dCr9PhQyaOcXDYGxP0/QR5pqB1KWK2C91Aa6ikb1pVuK1F5KMEa8DLDYZiqOf54FwDDHHy2Bvg/Rj
	WXWYhGZDYx4Ms7e8h8sgFkap/+nAd09I7iYFdaWNg+m6F5LDl6Vle3G1ZtKJyCDByQ3xh6u6NiJMX
	UrsWfrdOHFl7dKvZVqRk91GJ6d82sVXy1nlMBfYw8RCywSPL2ajSuWafYzNfy4nWwFRtLYaS6BLTu
	Yykk20lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK58-0000000CJKA-3Pgc;
	Mon, 26 Jan 2026 10:44:30 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK56-0000000CJJA-40Wl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:44:30 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4801bceb317so47140745e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 02:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769424267; x=1770029067; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ffA5SL3LC5b8XzI2Nz3h29Xpe+4f+LbMdzYhyUIPyHo=;
        b=WG3gpFI+hQEe5I3Y6rJpl8XVNt9wUj4IIsFveJFjvfTdpGfSxMSG+52gPZ2Acw1QiU
         WCA3P2BJJK63AoMNNJeZQprLzHi01Js8pdqGhH2ntHq69+olxXBcLJ6hD4KPq3w2Y6YJ
         DzlF9i7su4S2xgY8uSX5TJdjtqhoyaSIuC6JgsUe+grTJ8PrJL9SXVOlxHBSbAId7iuW
         BVHD7cGC5VWyDX9zzYOpEFsd9wYrLdV0qYE8qgJyo+2E38y5645/MFWrKGfuY39S/A/6
         vvBem1ujZyWei2gdswaS0KhPyyVKdLmKZhDFVI4UNFctBxqsBOEuDutMsxRuFfu5gbGF
         pqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424267; x=1770029067;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ffA5SL3LC5b8XzI2Nz3h29Xpe+4f+LbMdzYhyUIPyHo=;
        b=oun4EZLGMA+D7p+J/RWlua2IN4cgFOOR5cU+8w4VJzNuQK+3MaKAULhY3tODMu4xNc
         FsuFaup5Q1GIPz9WA/GD/p9n2ZscBKN8mIZOfD/zLy+HXIaFBN6fdY7bzEd6wkRcFiED
         SbYL2L+TfCGZd+Dc9E6oMu88u5eKAwDHdg6owzURYVxv3goZ3Y09Fd5UVLqPfRMvaqet
         IDFaj9fig1CJfDQrREUQ/fx2oHXXfyhv6JFdt6WjNbLFBSIjwJBJReDjt05c3TqZsWGK
         jbv6HGC6Mt2YjJ3JUPn7eFV0FPME458/I2DDxvn2aW0FPS5nbnW3nXOMCbWGf0dQ95ay
         10VA==
X-Forwarded-Encrypted: i=1; AJvYcCVBp0cByLdIcW1fwNxVvW7UCe1nicsJnToiq9j+HcDzOJtnf9mp11zVLEmaSCCweikWgYEGGMjGbMNQMkKuylUq@lists.infradead.org
X-Gm-Message-State: AOJu0YwqbL3YEuUDrD8aW1Ryfg3yd5047hpopv/vk8oecvLW1zeXCfcl
	PK32+MwIf1bkFubKDPe0JNUdWgySp3dwLJk3TRKvQuVwPK8Y7ICJSMa26FuIvx8qTrUtAnRkrBT
	ug8CYf/zA2bY7CCcuwTC4bw==
X-Received: from wmbz12.prod.google.com ([2002:a05:600c:c08c:b0:480:4a03:7b6c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:35c2:b0:47f:b737:5ce0 with SMTP id 5b1f17b1804b1-4805cf66771mr72717075e9.23.1769424266779;
 Mon, 26 Jan 2026 02:44:26 -0800 (PST)
Date: Mon, 26 Jan 2026 10:43:50 +0000
In-Reply-To: <20260126104419.1649811-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260126104419.1649811-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126104419.1649811-2-vdonnefort@google.com>
Subject: [PATCH v10 01/30] ring-buffer: Add page statistics to the meta-page
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
X-CRM114-CacheID: sfid-20260126_024428_994310_DE8C60B7 
X-CRM114-Status: UNSURE (   9.74  )
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
index 630221b00838..1187d632dd5d 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6131,6 +6131,8 @@ static void rb_update_meta_page(struct ring_buffer_per_cpu *cpu_buffer)
 	meta->entries = local_read(&cpu_buffer->entries);
 	meta->overrun = local_read(&cpu_buffer->overrun);
 	meta->read = cpu_buffer->read;
+	meta->pages_lost = local_read(&cpu_buffer->pages_lost);
+	meta->pages_touched = local_read(&cpu_buffer->pages_touched);
 
 	/* Some archs do not have data cache coherency between kernel and user-space */
 	flush_kernel_vmap_range(cpu_buffer->meta_page, PAGE_SIZE);
-- 
2.52.0.457.g6b5491de43-goog


