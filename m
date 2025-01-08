Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C13E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 12:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GlQWGu8jmtIvOtRUmNoKfRUqkWu3tRvtK1Xuk9VMi2w=; b=nTbbQvkLEy09yi6zBiY6SIph+/
	/yjO46eiEhTOgN+CunhoSbgGfHnFhrL2/pvgMW5P2TH+NYu5cedifA3AcyQrwupJlsdyxLAYErx++
	EPHpc0s2HI5t+TA2n5iGhyukw+b3p6YRmXJgjNaJkUSgdrQh+iHbWREPdjO+An1ZjsvvgQwUX5uMb
	mDyd7XTs8pABSevybv69lrUTVixmZQf9bEkXDrzqFGymeypmo/yHQqw/jsEv2XgwipqBgaploHRHY
	2HMT6LOB64d0klK/pMmrp2bgMh/raCUa/YWmr9O9Z6KAy811HJj6ZMaZccutgDpgP74q8/9fqCjca
	hLkbc9hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVV0Y-00000008OU4-3IFh;
	Wed, 08 Jan 2025 12:17:58 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUVh-00000008GzW-0uEE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 11:46:07 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3862c67763dso6907536f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 03:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736336763; x=1736941563; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GlQWGu8jmtIvOtRUmNoKfRUqkWu3tRvtK1Xuk9VMi2w=;
        b=Pe0lqbDO8J5Q45EU3+f6V6Hwg2MbCMLVzTIF462TJFi+xkvBATnYKLVXg8SsTTzP8j
         fWgQo93IwLu0en1LIgyFkpB6KbVsGsLKJc0RB9wgTQPl0t+HvTg5VbjV80pWJDVOSfnp
         Dqg7e4miqrfwfj2RHVy44ir3Sx1RInT/24s2kppRw/rChrGlJPzjxNFdzwcyCJicWOcE
         GudQjXCfx1dVHDefiWzZN28SumYKKyVY3o26tbM2rs9NGkz5wdDWnHfeF5ObMGYhJCLJ
         X9/cnVooI0a4O1XdegfeFtI80r6dVReDz80U43n7EMkdGDc+Z3ht+1qLB8htyuaggaXU
         9pJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736336763; x=1736941563;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GlQWGu8jmtIvOtRUmNoKfRUqkWu3tRvtK1Xuk9VMi2w=;
        b=TuuRAhQQ4oqmR0KwWLWhIJPhrFC8X0oN5cG4s82K1k09XeyAbFPZRhLkghNlllrr0O
         l/i2bppsrWpXME6ECMLqfqWJMrOtdXiRf+RFSzjjUeEgh3y1l8U27OLnAmV1CLDC3pkR
         rWUC4iiIWIDjIgz53F4QKT7C+4QrLhRBzJq2nNgwM/3+WlceWfrAGNjFmN9aq9NAt3fK
         fKtnHCcLlf1ssiWs64ca379uvDD4TU3vfGQVzjj29j+lbd99CaiFDpqkUsUh8egEPNLB
         l/hqv1ZQwWvqHrl7D4O/0eZobsgScPyRVZ2kNn7Z1AXOP4I0YkXFXoR+lVlnrzHYQMdC
         rHmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWpZqPhzXb8NfHlxrDKkl9c7zOAUynsJvcb3cHsZ0CvyHJ+LU9PtifRGaF/BuxmYNJ9xPTTYhsiT1vluIIvw0R@lists.infradead.org
X-Gm-Message-State: AOJu0YwDJo2gMalbSM2EyIsETjG0WBlYztIXDDunBzOMGtDcubMQPwn6
	ia0AgWWAX7ord+fjj6/D2XqaXhSsdrZYu3a1X+2ktT5z8iZjmYW9iQaVqywRy9rE0UdlV/wkagE
	b87SLa9UcxrDq0TIxNQ==
X-Google-Smtp-Source: AGHT+IEsCuJFvJabPcJ0/q5MQuWzgchKOfMrLBtBvZQzD03qm3RdWOAWIvuvDxtaZjB1IDdZEPVC6IpmGkJZeMJs
X-Received: from wmbg16.prod.google.com ([2002:a05:600c:a410:b0:436:5887:e183])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4714:b0:374:c4e2:3ca7 with SMTP id ffacd0b85a97d-38a872f673cmr1877142f8f.5.1736336763167;
 Wed, 08 Jan 2025 03:46:03 -0800 (PST)
Date: Wed,  8 Jan 2025 11:45:25 +0000
In-Reply-To: <20250108114536.627715-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250108114536.627715-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250108114536.627715-2-vdonnefort@google.com>
Subject: [PATCH v2 01/12] ring-buffer: Check for empty ring-buffer with rb_num_of_entries()
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
X-CRM114-CacheID: sfid-20250108_034605_257167_336BB916 
X-CRM114-Status: GOOD (  14.50  )
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

Currently there are two ways of identifying an empty ring-buffer. One
relying on the current status of the commit / reader page
(rb_per_cpu_empty()) and the other on the write and read counters
(rb_num_of_entries() used in rb_get_reader_page()).

with rb_num_of_entries(). This intends to ease later
introduction of ring-buffer writers which are out of the kernel control
and with whom, the only information available is through the meta-page
counters.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 60210fb5b211..479bbbcbf61b 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -4682,40 +4682,22 @@ int ring_buffer_write(struct trace_buffer *buffer,
 }
 EXPORT_SYMBOL_GPL(ring_buffer_write);
 
-static bool rb_per_cpu_empty(struct ring_buffer_per_cpu *cpu_buffer)
+/*
+ * The total entries in the ring buffer is the running counter
+ * of entries entered into the ring buffer, minus the sum of
+ * the entries read from the ring buffer and the number of
+ * entries that were overwritten.
+ */
+static inline unsigned long
+rb_num_of_entries(struct ring_buffer_per_cpu *cpu_buffer)
 {
-	struct buffer_page *reader = cpu_buffer->reader_page;
-	struct buffer_page *head = rb_set_head_page(cpu_buffer);
-	struct buffer_page *commit = cpu_buffer->commit_page;
-
-	/* In case of error, head will be NULL */
-	if (unlikely(!head))
-		return true;
-
-	/* Reader should exhaust content in reader page */
-	if (reader->read != rb_page_size(reader))
-		return false;
-
-	/*
-	 * If writers are committing on the reader page, knowing all
-	 * committed content has been read, the ring buffer is empty.
-	 */
-	if (commit == reader)
-		return true;
-
-	/*
-	 * If writers are committing on a page other than reader page
-	 * and head page, there should always be content to read.
-	 */
-	if (commit != head)
-		return false;
+	return local_read(&cpu_buffer->entries) -
+		(local_read(&cpu_buffer->overrun) + cpu_buffer->read);
+}
 
-	/*
-	 * Writers are committing on the head page, we just need
-	 * to care about there're committed data, and the reader will
-	 * swap reader page with head page when it is to read data.
-	 */
-	return rb_page_commit(commit) == 0;
+static bool rb_per_cpu_empty(struct ring_buffer_per_cpu *cpu_buffer)
+{
+	return !rb_num_of_entries(cpu_buffer);
 }
 
 /**
@@ -4861,19 +4843,6 @@ void ring_buffer_record_enable_cpu(struct trace_buffer *buffer, int cpu)
 }
 EXPORT_SYMBOL_GPL(ring_buffer_record_enable_cpu);
 
-/*
- * The total entries in the ring buffer is the running counter
- * of entries entered into the ring buffer, minus the sum of
- * the entries read from the ring buffer and the number of
- * entries that were overwritten.
- */
-static inline unsigned long
-rb_num_of_entries(struct ring_buffer_per_cpu *cpu_buffer)
-{
-	return local_read(&cpu_buffer->entries) -
-		(local_read(&cpu_buffer->overrun) + cpu_buffer->read);
-}
-
 /**
  * ring_buffer_oldest_event_ts - get the oldest event timestamp from the buffer
  * @buffer: The ring buffer
-- 
2.47.1.613.gc27f4b7a9f-goog


