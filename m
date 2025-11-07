Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588DDCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dE9bbheCp9V2aFuRlDh4WDEP/Ei7sW5/5LGgdkpufdc=; b=G9lJ1Q5qY5ws8+hINUGgh2Devv
	zCv5vRc6/tgh+Ji66NvLm47CgYIVr0NEI3lP5cYKB+UryzbLirXIxdsBRiuVuxP2ONg9KL1KJB2Su
	ZL0MXAjxLV5AXjkdLgU9Tesir+zjQ0JHcmbRlsbMPON9w+zAOsWZJ9EkzmT1KnT8x2+QarItACvRQ
	EDrQYbAdPyjwobihjR/w0X5PJyRRx/kV9F/iL5DYmbJzeDSDdiwj9QYYpmSQy0PzNCR8uJUgvEZkk
	aFeuG+cmhC3ej3nEpXHhMTwYHRkPVzohC98ZlGmmpfD6D+RvCqHKwYn/QNowQFkYb4WYkRevnumwa
	lEdbI6cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIvn-0000000GyO3-0zIe;
	Fri, 07 Nov 2025 09:38:55 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIvk-0000000GyLX-2IiT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:38:53 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4773e108333so3068125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 01:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762508330; x=1763113130; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dE9bbheCp9V2aFuRlDh4WDEP/Ei7sW5/5LGgdkpufdc=;
        b=bLP1woIfYV2NXaI7Dvu6GVScSmv6KgMe1xrHVIlh/OnGjum4sGWj9N1XOWtofGSB49
         D48O9QrW5HUFT+w1O+uVwChX0nYDM0rt0Dp9wiqszKg23Vd9ZmugIDeSyABJKw61pRCn
         k4Er/rA0SDEPs3kORz17OUFoDEv/Ph92KaiY/y8K5HbJrdo3sgzejRTgOFe8Tbbhze18
         ZF+uiFemJtMF4U/GrmWbRc4/XjTfT5v3meU/kxfp+/gUvRO//ctVASYrw1RgKmTElwxw
         IBFurGnU8rHxVpRrhIb9sVHYdnQ0kxSlErDn8yMGm3laeRh1AQowKEXm5XrFJZxStMVE
         R+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762508330; x=1763113130;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dE9bbheCp9V2aFuRlDh4WDEP/Ei7sW5/5LGgdkpufdc=;
        b=T6U8d2JUqhCI9+z54tfVKB8llFyS2XWjvCbFXEmG4Az9kLzvTzcH5cidhuCd9BBmGG
         UXh3g5+oQ6bXqmb3tGFCxD1BNZE1N13u5oyv33Q8hucK5dIV3WG3GRewjkUZalS5sLF+
         XZduK+77rphrhWfFeVZG5Z1eUCp7L6PvMSsrgwBMDoWfqY1U6RUmJ4NlfaqG147E6V3b
         49L0V3osLreYTnXqLvb/j4+37XhnZjiipUe17d7ANTsEkR4aywaFArwvA4HjXU3eY8+1
         b8wMKrOtHuWrKeVSRNIv9ypPXwmdWAai2Nt3zucIbCbj6CRvizucD2hDOPpRkE3/YhMq
         5cSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK7moK1Fz1hMSS7hfAqFZkLPBNy8OfmmaDxxo7zwV8Fpu/mBPIDjZoRz5pFgLftH1L5ETgB65kyMAI4QRuRZyb@lists.infradead.org
X-Gm-Message-State: AOJu0YzU5jE5ZtFIcUCfXrVE/mOunkBVpbqK4aVkmoPFuC5iyHbFUSYM
	WGgj+f62CMit2Of5E8ihsuSVEErLGGTb0Q+xD35xFIIjXiaTFwauOkIRhqAOhG5vx5vXmOuNTwv
	Mrk0yJ3G7uuLYpjvlHqV0nA==
X-Google-Smtp-Source: AGHT+IHJKQcuTuHVy5lW9/pddPtXEWrJkUHRKDzcCdWDYQlwal5t/VwhJiu80ev0kYlXjbKdm3HJXTGh6pg8IuqO
X-Received: from wmim9.prod.google.com ([2002:a7b:cb89:0:b0:46e:1f26:9212])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4512:b0:471:114e:5894 with SMTP id 5b1f17b1804b1-4776bce1ae8mr18497205e9.25.1762508330429;
 Fri, 07 Nov 2025 01:38:50 -0800 (PST)
Date: Fri,  7 Nov 2025 09:38:14 +0000
In-Reply-To: <20251107093840.3779150-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251107093840.3779150-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251107093840.3779150-3-vdonnefort@google.com>
Subject: [PATCH v8 02/28] ring-buffer: Store bpage pointers into subbuf_ids
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
X-CRM114-CacheID: sfid-20251107_013852_604564_6465A4ED 
X-CRM114-Status: GOOD (  15.20  )
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

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 6e912527e44f..80099a8b2495 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -519,7 +519,7 @@ struct ring_buffer_per_cpu {
 	unsigned int			mapped;
 	unsigned int			user_mapped;	/* user space mapping */
 	struct mutex			mapping_lock;
-	unsigned long			*subbuf_ids;	/* ID to subbuf VA */
+	struct buffer_page		**subbuf_ids;	/* ID to subbuf VA */
 	struct trace_buffer_meta	*meta_page;
 	struct ring_buffer_cpu_meta	*ring_meta;
 
@@ -7002,7 +7002,7 @@ static void rb_free_meta_page(struct ring_buffer_per_cpu *cpu_buffer)
 }
 
 static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
-				   unsigned long *subbuf_ids)
+				   struct buffer_page **subbuf_ids)
 {
 	struct trace_buffer_meta *meta = cpu_buffer->meta_page;
 	unsigned int nr_subbufs = cpu_buffer->nr_pages + 1;
@@ -7011,7 +7011,7 @@ static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
 	int id = 0;
 
 	id = rb_page_id(cpu_buffer, cpu_buffer->reader_page, id);
-	subbuf_ids[id++] = (unsigned long)cpu_buffer->reader_page->page;
+	subbuf_ids[id++] = cpu_buffer->reader_page;
 	cnt++;
 
 	first_subbuf = subbuf = rb_set_head_page(cpu_buffer);
@@ -7021,7 +7021,7 @@ static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
 		if (WARN_ON(id >= nr_subbufs))
 			break;
 
-		subbuf_ids[id] = (unsigned long)subbuf->page;
+		subbuf_ids[id] = subbuf;
 
 		rb_inc_page(&subbuf);
 		id++;
@@ -7030,7 +7030,7 @@ static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
 
 	WARN_ON(cnt != nr_subbufs);
 
-	/* install subbuf ID to kern VA translation */
+	/* install subbuf ID to bpage translation */
 	cpu_buffer->subbuf_ids = subbuf_ids;
 
 	meta->meta_struct_len = sizeof(*meta);
@@ -7186,13 +7186,15 @@ static int __rb_map_vma(struct ring_buffer_per_cpu *cpu_buffer,
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
@@ -7219,7 +7221,8 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
 		    struct vm_area_struct *vma)
 {
 	struct ring_buffer_per_cpu *cpu_buffer;
-	unsigned long flags, *subbuf_ids;
+	struct buffer_page **subbuf_ids;
+	unsigned long flags;
 	int err;
 
 	if (!cpumask_test_cpu(cpu, buffer->cpumask))
@@ -7243,7 +7246,7 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
 	if (err)
 		return err;
 
-	/* subbuf_ids include the reader while nr_pages does not */
+	/* subbuf_ids includes the reader while nr_pages does not */
 	subbuf_ids = kcalloc(cpu_buffer->nr_pages + 1, sizeof(*subbuf_ids), GFP_KERNEL);
 	if (!subbuf_ids) {
 		rb_free_meta_page(cpu_buffer);
-- 
2.51.2.1041.gc1ab5b90ca-goog


