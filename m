Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E94E9A04A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 15:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9ZYrkp01SZudmPJIGgaD1hH5p56foVqTFoUkti6vZ0=; b=yh7YcB1iDT3W16umWt6ViUeM4N
	VSRmHFUoGcpktj3Ox+jOQwujPAPjmNMZ5mwYtUIrGzir0SGeFCjfikyRS1a9Y412C8hOy5V/fI8XM
	PuoH2jMIK7KT+ps8Be1gmuWGlF9xiC/Uns+Xk8uf6XRcKAE23Uah/SMz2sAwnCwZVv5NfnP1ULIfh
	3bPLr3NWS8ipdaUXIzfZRjJ5a3LCP9qwLbXO714+UYwD6934xaOBBaM1v9ZQYJDy+v7MsMSr19oaA
	aB/SBcFNN+iYYz08ygueRDPDyqeM2I8cL8FC2dT9QO3eicZ5C8fYxf2/LPn5RpO7UVwji2+cpj69C
	ltugmMcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5Yq-0000000BUfG-1lRD;
	Thu, 19 Feb 2026 15:03:24 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5Yn-0000000BUdl-143N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 15:03:22 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4836cd6dfe6so9385085e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 07:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771513399; x=1772118199; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=T9ZYrkp01SZudmPJIGgaD1hH5p56foVqTFoUkti6vZ0=;
        b=VV1MH0hbcH01rNVdU3ybH60b7SAygHP4ylqnW+pjKC4wtCRP+tIgTkHEvw+xYZZBXf
         UStDA9djwkaJG4u65ns9fVThajNQ5rvCy7GFrXGkB6VHz+IhMAPWgRWPssXgno4ksjAS
         v/P7bE7KfjNKaCppmSuNRKTmZJziwONYe23TACkmKXSmzI8WMQg/ct7bgP71s9dopWb9
         crbqGxomM08JxJysEaOBBibVbafbwAvat6cjYZVgK1P3Y3iXuEyPxjPnoHoJnf1WBiZ4
         WCc1jWpdJQ1Me6z9xQqKogtw1fyIJw8pQTrqSaU69bQs934697RBryEffa8SDVXUVlRU
         HUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771513399; x=1772118199;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T9ZYrkp01SZudmPJIGgaD1hH5p56foVqTFoUkti6vZ0=;
        b=ekghlVDRNbiWj8mOteS6z0pZI1QIOMe2drkm/jFlpsUi9HFrCFVmezwsfTwMDaQOiv
         KN9zJze8NcsiFlyg1M/4FlIZ8ZCirjcqOzKNGN1tknHfQjG345cYZakRhF/hCAzT7H+B
         HxFrfT5DPDZhcRsxZ2U9gwAWK0roDryQg1ztqBYFDi2imGXwsm2hXa5pqC7VaXJi/Rew
         Cul9xjKWziFlPfHrixTX0s3YeIazfJH22/tJhurM8QjAJMe7NiiTc+dtSBHuMnMOgOib
         0MofvXisJ2FP6q5uhyN1cL7Uc8y5LO05dEQeRGZFRf6o/FGXktZaG80z2ap1AG4ugnb7
         xMdw==
X-Forwarded-Encrypted: i=1; AJvYcCU+QzXygb0DKaF1pb2+Nxh/F4IBk94OMz+FPNt7UAzvsC7DHL4opfbwifxKEI43b6eqtB65ITR4q2mC7Ah0H28u@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+CA6y56VwhlooEUYF58n8zFNQHuP0XU9vIe700d7xg99yEx2a
	AnBE+05SBggiTBJjNEPLOlv+F+HtilWPgSeypGC4ckT10Ung4dlDeuOCSe8127AczDW1KvpgDnH
	3fc6YWOnWoF4xurUwKHoCcQ==
X-Received: from wmbib4.prod.google.com ([2002:a05:600c:a144:b0:480:6c91:3efb])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:34d4:b0:45d:f81d:eae7 with SMTP id 5b1f17b1804b1-48379c1fab5mr301474605e9.28.1771513398866;
 Thu, 19 Feb 2026 07:03:18 -0800 (PST)
Date: Thu, 19 Feb 2026 15:02:38 +0000
In-Reply-To: <20260219150307.14538-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260219150307.14538-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
Message-ID: <20260219150307.14538-2-vdonnefort@google.com>
Subject: [PATCH v12 01/30] ring-buffer: Add page statistics to the meta-page
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
X-CRM114-CacheID: sfid-20260219_070321_299863_C138357E 
X-CRM114-Status: UNSURE (   9.68  )
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
index d33103408955..210c3811ba48 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6149,6 +6149,8 @@ static void rb_update_meta_page(struct ring_buffer_per_cpu *cpu_buffer)
 	meta->entries = local_read(&cpu_buffer->entries);
 	meta->overrun = local_read(&cpu_buffer->overrun);
 	meta->read = cpu_buffer->read;
+	meta->pages_lost = local_read(&cpu_buffer->pages_lost);
+	meta->pages_touched = local_read(&cpu_buffer->pages_touched);
 
 	/* Some archs do not have data cache coherency between kernel and user-space */
 	flush_kernel_vmap_range(cpu_buffer->meta_page, PAGE_SIZE);
-- 
2.53.0.335.g19a08e0c02-goog


