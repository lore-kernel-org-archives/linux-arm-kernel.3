Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4819CE9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 15:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URJ3le00qFg4aOMtpOoA5s7sZJE+RppKHRUBLLdA0KU=; b=yBTqEvoJwgV1Ezc29a0FvXql5S
	0TNyOMjPwsdb2Hjvfp84zZ+xKaKj+iQ8kgteMyVaYYnP3CE9XUcAbfhkCng2DnZ+PgujM4PO8ql94
	G+a/YhqS5qddQAF+0FXbMdLOj45KNKO7X7joUGyr1uX8MGbLxewbdrWZS6bOfcOXzEgsNfv5RRTrq
	QHZOhVZNahu2VxX9JAHL4BpOH8t1ERDINg4NETjVnC0D5UaOzDVt755GIxLXIWeR/qIGgMIebg3p7
	3K/pymuXBoJlt2Luu8kT574mOc8z+uLU8ohsDWYQy9t1yKDsSTFt2mQNVXMo6Y9+N4QFA4WS6dv/t
	ZJEtsnIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5Yv-0000000BUhk-16qY;
	Thu, 19 Feb 2026 15:03:29 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5Yo-0000000BUe2-3jG2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 15:03:24 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b8704795d25so90215566b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 07:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771513400; x=1772118200; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=URJ3le00qFg4aOMtpOoA5s7sZJE+RppKHRUBLLdA0KU=;
        b=hkNd1DRXD7Zb2p4ugRS49c94Vcycyru3DxqfGD7O7G14Av1KMGifQPTFZep8sglVKJ
         fM45veLYaOvnzWVYKyDogtHYeBLddOYBpdUA10dcEWXDUG2EFg5E5rwU3EgolJtrf/Ta
         kP2Y0SGY4+1E1xZxdSlyEtfxCeum2WhunmqGXBqf0Cs3A4ZgIICR3jU/tYBwHYPAMEEk
         9RymzZOc8k1K8FEulI/6ddjSkQqy6+H6WwOiu9BXYNBMCWkcvQs4hP3dwHhoyW8/Fyjf
         mawUwHGaycTSXGgbMCXikujShepbvikn7QFsI0kZtnIgdD0v1Z9UiiULLSq53CRLLyAZ
         cm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771513400; x=1772118200;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=URJ3le00qFg4aOMtpOoA5s7sZJE+RppKHRUBLLdA0KU=;
        b=WONKtJ/n4FH2HFm9QGN/jn+85HgUcKKZ+AWPBouYuq0Vuuik73tkMPtsI7rUu2o2Tk
         ibs/4ROxbYuqMsL8FG4fJhYHR4bHdoXfgwUJKtCzYRodMXenGokvCAtL+Ncu2dkHsC/K
         VQ4Ors1Uc4XDPzz3zzQ9/JvkV+zXbR87Rgm1nsj/wq7ICP80XaW25ZO6r1pzc6IFKB+K
         czR9RLtF/08IpurQPKdPlgZtGuuKHnI92pcABkQA0T/LQKIwfIVTChSm0pt59Vf/sWeC
         4MY+7CYNyEbw8gTzQL40q68jOKOUqwH+joBu7LVkhcpCBBZARDWflAth/ZWYoi5sKUBZ
         2+eg==
X-Forwarded-Encrypted: i=1; AJvYcCXxVVSiDZtjkukB6Cj0UIDGJA0tUdPAg5m7AUuU1xRbbWbRgznmwgk24uuxG8x12t3BEL0FvB+ReYaLzPIXVdal@lists.infradead.org
X-Gm-Message-State: AOJu0YxcXH1Jw3NF2GuVQtLovGpyngXXjj/5M25Tqdl6Fa0SWIWVESRR
	BrIb53GwAQI6w4eAMz9aUz67PsTJ8ldrmKaOV/2yznDkOGdJt3hDl3jFgFbpvOpwd0alfudWAE4
	fWUk/oVplXY1TG/d1ZE+GIg==
X-Received: from ejcm18.prod.google.com ([2002:a17:906:7d2:b0:b8f:8f61:e060])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:dc8c:b0:b7a:18ba:a63 with SMTP id a640c23a62f3a-b8fc3a3a05amr875259466b.19.1771513399894;
 Thu, 19 Feb 2026 07:03:19 -0800 (PST)
Date: Thu, 19 Feb 2026 15:02:39 +0000
In-Reply-To: <20260219150307.14538-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260219150307.14538-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
Message-ID: <20260219150307.14538-3-vdonnefort@google.com>
Subject: [PATCH v12 02/30] ring-buffer: Store bpage pointers into subbuf_ids
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
X-CRM114-CacheID: sfid-20260219_070322_945753_1055A9B5 
X-CRM114-Status: GOOD (  15.36  )
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
index 210c3811ba48..228c127b4489 100644
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
 
@@ -7031,7 +7031,7 @@ static void rb_free_meta_page(struct ring_buffer_per_cpu *cpu_buffer)
 }
 
 static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
-				   unsigned long *subbuf_ids)
+				   struct buffer_page **subbuf_ids)
 {
 	struct trace_buffer_meta *meta = cpu_buffer->meta_page;
 	unsigned int nr_subbufs = cpu_buffer->nr_pages + 1;
@@ -7040,7 +7040,7 @@ static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
 	int id = 0;
 
 	id = rb_page_id(cpu_buffer, cpu_buffer->reader_page, id);
-	subbuf_ids[id++] = (unsigned long)cpu_buffer->reader_page->page;
+	subbuf_ids[id++] = cpu_buffer->reader_page;
 	cnt++;
 
 	first_subbuf = subbuf = rb_set_head_page(cpu_buffer);
@@ -7050,7 +7050,7 @@ static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
 		if (WARN_ON(id >= nr_subbufs))
 			break;
 
-		subbuf_ids[id] = (unsigned long)subbuf->page;
+		subbuf_ids[id] = subbuf;
 
 		rb_inc_page(&subbuf);
 		id++;
@@ -7059,7 +7059,7 @@ static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
 
 	WARN_ON(cnt != nr_subbufs);
 
-	/* install subbuf ID to kern VA translation */
+	/* install subbuf ID to bpage translation */
 	cpu_buffer->subbuf_ids = subbuf_ids;
 
 	meta->meta_struct_len = sizeof(*meta);
@@ -7215,13 +7215,15 @@ static int __rb_map_vma(struct ring_buffer_per_cpu *cpu_buffer,
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
@@ -7248,7 +7250,8 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
 		    struct vm_area_struct *vma)
 {
 	struct ring_buffer_per_cpu *cpu_buffer;
-	unsigned long flags, *subbuf_ids;
+	struct buffer_page **subbuf_ids;
+	unsigned long flags;
 	int err;
 
 	if (!cpumask_test_cpu(cpu, buffer->cpumask))
@@ -7272,7 +7275,7 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
 	if (err)
 		return err;
 
-	/* subbuf_ids include the reader while nr_pages does not */
+	/* subbuf_ids includes the reader while nr_pages does not */
 	subbuf_ids = kcalloc(cpu_buffer->nr_pages + 1, sizeof(*subbuf_ids), GFP_KERNEL);
 	if (!subbuf_ids) {
 		rb_free_meta_page(cpu_buffer);
-- 
2.53.0.335.g19a08e0c02-goog


