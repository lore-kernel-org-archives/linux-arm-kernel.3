Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF96F41807
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 16:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tqn5G0/qxFsd1rBMaP6ON3DnSHbXMjD+lZjYLddNIoQ=; b=XUbzk4StJkAIMGTclWLCUPs0Gp
	Gb26ge+b9y82QdrinbV7KIXgB15Brea2HqsGmzhX6G53DtyS0MSbdMXrebpM/OAuTBLoDgK7FYLyv
	gS39G0n/k8GHbzjib/gv+b3oqwThG4qde2ofcTCS+ycR09X0W6AtjpkLrTPyllUf51Maz+9mogu5I
	hwHjgKY3wNfLKod6a3HUaR7yXipXYIGZi2G8GNmLn0ZaQ7PoOqjgZLkTwpIkto/0a4oVByj2ihkSf
	CQM5/5ksPOBObtAOnvZh8+6xzJFI6LqpnqSH2YYLImpwmn0wVbiWfSHbRgQO3oYuiojCXi+ZumwQh
	slvLppNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdQk-00000007gqn-0YaW;
	Mon, 09 Mar 2026 16:26:06 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdQh-00000007gol-2ROq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 16:26:04 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-661ad73d41eso5252006a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773073561; x=1773678361; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tqn5G0/qxFsd1rBMaP6ON3DnSHbXMjD+lZjYLddNIoQ=;
        b=bblTLl239B5L19H5Y6TD5kbt4w9VpRZMLUvZVf28JyqWYFwpJIS1z+q34ltDGZMzgZ
         fXvr2hRGeGvMdxvhl6S2qxn1A+w6AAiT4A8O7xbZw+MJnQpuhYTBs02xk/wJ3+XAkJxj
         jgcx9c6cXuVvUouGdFZc1w4Iq7DPqkXRO8hXp9D/xZlaSphmO6uCPgwINcElcg/JtrQb
         3ffh6RJZfbmHFOagbfntyIAbS+Z8DQeQT1FVWNXd7ZxLCsNBPL5hjbNdkKWY9CVQzIxi
         wxHOpSloshD8cJGvIxXG2QL5Ogsv/DbzKSQ9JVUGiwSvRm5wbiYwRFTXk+rvs5bcUNAz
         7MgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773073561; x=1773678361;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tqn5G0/qxFsd1rBMaP6ON3DnSHbXMjD+lZjYLddNIoQ=;
        b=jyqISapNuR8mh1nsUoZHfFhfcn6++F0MuwKC9SzXbG+H1lkQ0UdZR0HiJSxRmYkzW+
         k6dA/Y7RbrEilI8w6K3P+D1PRChJ/dISQ+JG0AT0Gf6VeSq8xqYuILcBIVQ7aelBqUdZ
         PsqSUJWmbGdiOLqYa37Dgugcc72aqo0z7MjZYge6mlCPRt4nGHGRV6LkhpEERMXFoXCP
         dDuVxO99HtWjUw2op3BFQEbtJxp4F2bRYeFZGwnu+2mIDHc+PQ88jVaElX09mQaFfL7u
         T1OOgKXjsgl84glBDY932x2s6DC3D8vxDXYZJlmjv4rwHCIobSCSM2eTlmNWHD6xzOjC
         FfrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSrFkKPNNROKMjmmdNvpxDrNEIsrR6CNW/OGXKmoEw541P8I6hIiBv3S2RrLCoTXgTkiNcQIwpGNYPpdbGcC+R@lists.infradead.org
X-Gm-Message-State: AOJu0YwdJVM1eOQhXqTP7YEN/4eH2c8ESFN6LhhAjaSfDgmDPrP5xsJm
	PzX0zjt+/kqDhj0IIm3sttWsaAOn5q+Cg50s24QidO8UZ/UzC49nEn/HeXSTVqZxv567ooNcRyg
	2W8gUgkJbDbLgxdf+gXZRCw==
X-Received: from edro9.prod.google.com ([2002:aa7:d3c9:0:b0:660:ed52:a77c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:430c:b0:662:ac7e:aabe with SMTP id 4fb4d7f45d1cf-662ac7ead72mr637065a12.15.1773073561283;
 Mon, 09 Mar 2026 09:26:01 -0700 (PDT)
Date: Mon,  9 Mar 2026 16:24:47 +0000
In-Reply-To: <20260309162516.2623589-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260309162516.2623589-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260309162516.2623589-2-vdonnefort@google.com>
Subject: [PATCH v14 01/30] ring-buffer: Add page statistics to the meta-page
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
X-CRM114-CacheID: sfid-20260309_092603_623250_809B938E 
X-CRM114-Status: UNSURE (   9.77  )
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
index 17d0ea0cc3e6..82b4df579670 100644
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


