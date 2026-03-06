Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC42F33A92
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Q6YHflryAt4GuwVgZW5CjVF0OSLajguucPNlc9fXbU=; b=EBcelGfsJvcjoFYmYdI/ZhPFv2
	WVOMxhnHePkaZzXYOd5vf5Nbn/2PLxiGPimSUAeH7EBXHuX3MPgPwz7jeDFPUsi8td/prAe+ryFUl
	VtluS9hmLZfafjZiHR8vwVG9Hyjzr4z7P0Pej7K2N3Z8yZC1iMlyfNZiaY5WBaWTL4fo3MJ3PnPib
	XhKQOXmj/DYJNak6FoCGASbtiU8N6lmT1Y9uYBIb4mWn4hljqNUsZddDtehH5Im2LHp/aydvdlezc
	mupnarx4kyWUqDMX8OI7dM/owou7iI/i7QM1uKcUzxMB09lBDNJ6I/5uYPT4CKLtYBiIz3AWN/zv7
	BZv0p9eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWHY-00000003uzG-0Spd;
	Fri, 06 Mar 2026 14:36:00 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWHT-00000003uwW-1XNl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:35:56 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-439b484ee04so3874848f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772807753; x=1773412553; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Q6YHflryAt4GuwVgZW5CjVF0OSLajguucPNlc9fXbU=;
        b=QXbEv9szl5Xiyag6EbLOmswfsycFaJA4nD+lGHSPmNSEMDAaZbLblJzG4ujVfRozwA
         xUbzP0xiOJHDVTiSZnut0I+vXJWl3jvzqQhigpMJ33M+OYkHUvDlivvcB36XDTmdfeIU
         R0vBkqlo2dd74xvO9CI8BBCxYKF1qMos3Yy+pRjDiw59VmawC4bbqUub0z/2nmkFPmHr
         GHklkY86GGry3yyMnUYFZX48I8jT4QCpNJqfOIHm6lr0wS7hDxb/Csz/mtpPXAyQrB8i
         baTYXbYidesAGM/95KPVtzF88nDPtiZgxt8KlQSvDBVF93Fy74pygxmlg+zuMvmckFwt
         oskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772807753; x=1773412553;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Q6YHflryAt4GuwVgZW5CjVF0OSLajguucPNlc9fXbU=;
        b=DUxKNwgFmYoV/wXTwKRq2CW0CpTizWIwiqitiMcB10zAXEmA7ZWGqbP3KXsDn2Cnqg
         j1wjwZK7dhyRmqHXEox9zsLrfGrYnqmCsBA7ksYIcNVwRBi9XXKIn3WshyAj1CyrPiju
         tAVZhN0aJ9F97B0nn1hjYG8Lc+Hm2eFRVlu9mrJExmnt8SBZ9HVYHdzuNTgA02ZAoxbj
         86gjZlHYP7L0lVLmA+06gJx+Gje9c+Y4yZrqbm2hTunCpYSHtqF6CCDYU0imM5nVLaC3
         ISXIQJ0R/twXXPD79tHApvefwvjUI0RrIz8y6WHxxP1mc2etWiz2MUCI7OEjKb1HC3HY
         8bUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1IDC5G464qnsOv8ut4+cK50EgneYYhgpyKHZfy50LKbxy1dTMFcJhy2ViNMGHzQLR2UQRDjVKU3EDGg8H9acm@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv8er3Q6w0Pbr87v3uWg4JCibudS2UPnbZ69vy21wan4Y+S0Ph
	kKEmTDBGOewn4EFK67oN2HuBlk9CSVxOPaqq/MLILCvbTuJUgNT/Np6YAv1oFIRm5yvAkKkWGJj
	12Cd/pghXwHTSlcFJ0BArvg==
X-Received: from wmpg39.prod.google.com ([2002:a05:600c:4ca7:b0:483:8ade:6472])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:64c7:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-4852671d9c3mr34583765e9.8.1772807752682;
 Fri, 06 Mar 2026 06:35:52 -0800 (PST)
Date: Fri,  6 Mar 2026 14:35:05 +0000
In-Reply-To: <20260306143536.339777-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260306143536.339777-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306143536.339777-2-vdonnefort@google.com>
Subject: [PATCH v13 01/32] ring-buffer: Add page statistics to the meta-page
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
X-CRM114-CacheID: sfid-20260306_063555_410504_26BFBA56 
X-CRM114-Status: UNSURE (   9.14  )
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

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
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
index f16f053ef77d..1b8be41faa78 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6154,6 +6154,8 @@ static void rb_update_meta_page(struct ring_buffer_per_cpu *cpu_buffer)
 	meta->entries = local_read(&cpu_buffer->entries);
 	meta->overrun = local_read(&cpu_buffer->overrun);
 	meta->read = cpu_buffer->read;
+	meta->pages_lost = local_read(&cpu_buffer->pages_lost);
+	meta->pages_touched = local_read(&cpu_buffer->pages_touched);
 
 	/* Some archs do not have data cache coherency between kernel and user-space */
 	flush_kernel_vmap_range(cpu_buffer->meta_page, PAGE_SIZE);
-- 
2.53.0.473.g4a7958ca14-goog


