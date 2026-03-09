Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BD5F41807
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 16:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIAmVVv2A3LDKUFGtswIg5tSBiw6xfgb8ZrLFDafxOg=; b=lozwP/leGvU7JovjYQimxG2LVQ
	RIUZg/OIklIoBEYAUGQBVuB+ghlTtrtbjADcNXV3T7cg4Xv/Dq80FcryDwa/ioSqUB5AlXDStxp9z
	lm+IOIV+QVR3/81ZEQiukylO1c8JDNbmkwS0HTTwmRjlEoZORJ/S5sfkS5LsrANHTOEY4I+Tre7V3
	+YugLCUiIvfjYQE2legpRQ1jKaS+LEYYj6VWy6SUlgcGS9Phl1TGECN+qqlSon0pPRJRoOx8xmNPj
	td0f8/k0GnILx9HshJdye7X+0f0iZnDQ8pf6GrlnKG4uIYnvlzTvNeMelzX8SOwxQ+y4BJd9Pf0uW
	3S7NLyKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdQp-00000007gus-06pj;
	Mon, 09 Mar 2026 16:26:11 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdQj-00000007gpI-1WAM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 16:26:06 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-485355493aeso4090645e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773073563; x=1773678363; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UIAmVVv2A3LDKUFGtswIg5tSBiw6xfgb8ZrLFDafxOg=;
        b=KuUPokJ4N0QrRPsKaUK2PUhXzR3Wx+9ipMT1kYfV3R11nFQ1vP3vy5f01ThffiEtIq
         5Y1Ci4PdKdXOnl8W78RKJ0ZdOadx3hog0rt7iW4EF4+axd9uRgMfXoG3an7+PRF6jW2j
         t4y4W6GkeDeQ6Fhrrnc4e96zHQq8J8EdRaTYSYpLFWLEGbwOdpkZgRDrNU7RGGm+Rxjr
         e7P4KZKultOnJaf4uJQJHEy2L0y1Jzo5WcJhD4LOk6tDvoqz/pUF13jjobhtk0xpcP5G
         EIrtlj8KV5+UkFLFF33/qrcYUetlZGIvIzA3c4oHPDvXE5quBBeZM5EzDcOiTkXCT+X2
         Wj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773073563; x=1773678363;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UIAmVVv2A3LDKUFGtswIg5tSBiw6xfgb8ZrLFDafxOg=;
        b=FJ1g6NF2rHd8Tl/RJ2IRA830XAZmDgw/4fJHrTAuabjeB0Cgtm7/aRFyQAXRGgXDEL
         pFbTJ1XjXzXOsbmP57oDC4vGvDeXQXTrlz6ZiWrsCZIzBSf8lL6sLJH+PWwzvhyKrdFK
         pl8xPboj9rxh6NO7Nz4ERmRDV595+b7Q5HJoLYTqGu0IupayvSQ7LMekcijSYrkt+gnt
         tJOMWxRHa5jqVqjayrN3BnGQjSZzOKjZnjxKUoB1Sz2IxHyd5csyBagY5xAiTuYDC/uY
         qvBSe20cP9mxG+Jt1J3Pi9j15tiwgnlzNZJ6dIgYxs/9PIPSnXWnJCRQpV8BfM65Nvik
         TO8w==
X-Forwarded-Encrypted: i=1; AJvYcCWUQl9QNh59GwDmeMQZrF2JtE/mMExTJQjSP0xNYESkmDq+k5ellgXvdX0ceg260WjY1ukKHP7nJNqGWdhzqwfu@lists.infradead.org
X-Gm-Message-State: AOJu0YxKtGe2HCHZhVvRAojHhYepyetDFrW4H0FBuxVGWSbUK/bxT1es
	Vvimfv+PVBHlVHamPuXO5uC6U1+mfos/QiHBfEDDZDL63Uw9z2PFcs6+/XcJvxx6m26FT1opCt1
	NcgV7QWZ4506ZgRI0unVT1w==
X-Received: from wmv3.prod.google.com ([2002:a05:600c:26c3:b0:485:40d2:1ebf])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ecd:b0:485:3c2d:d02b with SMTP id 5b1f17b1804b1-4853c2dd2e5mr52980145e9.22.1773073562472;
 Mon, 09 Mar 2026 09:26:02 -0700 (PDT)
Date: Mon,  9 Mar 2026 16:24:48 +0000
In-Reply-To: <20260309162516.2623589-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260309162516.2623589-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260309162516.2623589-3-vdonnefort@google.com>
Subject: [PATCH v14 02/30] ring-buffer: Store bpage pointers into subbuf_ids
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
X-CRM114-CacheID: sfid-20260309_092605_468109_99014FFE 
X-CRM114-Status: GOOD (  15.46  )
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

The subbuf_ids field allows to point to a specific page from the
ring-buffer based on its ID. As a preparation or the upcoming
ring-buffer remote support, point this array to the buffer_page instead
of the buffer_data_page.

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 82b4df579670..3d2804a7e8ab 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -555,7 +555,7 @@ struct ring_buffer_per_cpu {
 	unsigned int			mapped;
 	unsigned int			user_mapped;	/* user space mapping */
 	struct mutex			mapping_lock;
-	unsigned long			*subbuf_ids;	/* ID to subbuf VA */
+	struct buffer_page		**subbuf_ids;	/* ID to subbuf VA */
 	struct trace_buffer_meta	*meta_page;
 	struct ring_buffer_cpu_meta	*ring_meta;
 
@@ -7036,7 +7036,7 @@ static void rb_free_meta_page(struct ring_buffer_per_cpu *cpu_buffer)
 }
 
 static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
-				   unsigned long *subbuf_ids)
+				   struct buffer_page **subbuf_ids)
 {
 	struct trace_buffer_meta *meta = cpu_buffer->meta_page;
 	unsigned int nr_subbufs = cpu_buffer->nr_pages + 1;
@@ -7045,7 +7045,7 @@ static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
 	int id = 0;
 
 	id = rb_page_id(cpu_buffer, cpu_buffer->reader_page, id);
-	subbuf_ids[id++] = (unsigned long)cpu_buffer->reader_page->page;
+	subbuf_ids[id++] = cpu_buffer->reader_page;
 	cnt++;
 
 	first_subbuf = subbuf = rb_set_head_page(cpu_buffer);
@@ -7055,7 +7055,7 @@ static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
 		if (WARN_ON(id >= nr_subbufs))
 			break;
 
-		subbuf_ids[id] = (unsigned long)subbuf->page;
+		subbuf_ids[id] = subbuf;
 
 		rb_inc_page(&subbuf);
 		id++;
@@ -7064,7 +7064,7 @@ static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
 
 	WARN_ON(cnt != nr_subbufs);
 
-	/* install subbuf ID to kern VA translation */
+	/* install subbuf ID to bpage translation */
 	cpu_buffer->subbuf_ids = subbuf_ids;
 
 	meta->meta_struct_len = sizeof(*meta);
@@ -7220,13 +7220,15 @@ static int __rb_map_vma(struct ring_buffer_per_cpu *cpu_buffer,
 	}
 
 	while (p < nr_pages) {
+		struct buffer_page *subbuf;
 		struct page *page;
 		int off = 0;
 
 		if (WARN_ON_ONCE(s >= nr_subbufs))
 			return -EINVAL;
 
-		page = virt_to_page((void *)cpu_buffer->subbuf_ids[s]);
+		subbuf = cpu_buffer->subbuf_ids[s];
+		page = virt_to_page((void *)subbuf->page);
 
 		for (; off < (1 << (subbuf_order)); off++, page++) {
 			if (p >= nr_pages)
@@ -7253,7 +7255,8 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
 		    struct vm_area_struct *vma)
 {
 	struct ring_buffer_per_cpu *cpu_buffer;
-	unsigned long flags, *subbuf_ids;
+	struct buffer_page **subbuf_ids;
+	unsigned long flags;
 	int err;
 
 	if (!cpumask_test_cpu(cpu, buffer->cpumask))
@@ -7277,7 +7280,7 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
 	if (err)
 		return err;
 
-	/* subbuf_ids include the reader while nr_pages does not */
+	/* subbuf_ids includes the reader while nr_pages does not */
 	subbuf_ids = kcalloc(cpu_buffer->nr_pages + 1, sizeof(*subbuf_ids), GFP_KERNEL);
 	if (!subbuf_ids) {
 		rb_free_meta_page(cpu_buffer);
-- 
2.53.0.473.g4a7958ca14-goog


