Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832AFD7976B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 13:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUISk/ccjHYHokYv6vg+0xvhja6CQE9jzscbfeu7VUc=; b=QYv/rRbs2w1eyRv1sdbz8jXNgl
	T4Ei8Nr5FqKV7v0oGbbZVTcvNnCOapcMS6jaHYskJ/hcZb62nsYDu54cIX5bOJTg+tzBILn0Ju4pD
	AapT5/1yaGg70QffA8FGqmSvzX0QF/L7CmP8g8YfOUvBa7Kyqoos1+NRADFmKOi3qvMbB8gEf+b1d
	G3CI/WQGtDy0rRrt3j038QUkILdCL+7zZwBBEfE9thlx6XtStz1iTGzibY2AISLlClT3Vu/M+4Byb
	UnLqHronkKDLRoZurxrMMUWoG76IzDS511DBu1bEF9RKQxYPAedRGSVVs6PkfkPAUuUPAc/fcouhH
	ne5ZRCcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB2f-00000002bvD-1wt3;
	Sat, 31 Jan 2026 13:29:37 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB2U-00000002boq-0xJf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 13:29:27 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-65811f8a102so2920938a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 05:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769866164; x=1770470964; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tUISk/ccjHYHokYv6vg+0xvhja6CQE9jzscbfeu7VUc=;
        b=kw2iTAAvWj4VN3oo7odZE3bTnTGP+/UAc+okRID7TvJBJfk53ie2S6qi2Gr7cPc0F8
         4uZlen8akNkOHPPkLLOy5ShC6KNvjefzVuTGlSxJuqqxZM3ICPPeH8RH5w/YdPN26Lv/
         l0uzh9AxpRnUCsvY33c0Lpk0q6afFl6zRrx6oGLFn/YM+Uzj9C0aGejFxoc7LMY+GVHp
         AiO8kgCJQv3RvS4+RPOkhofVa31l6VMPQhxAgNPj3U5Ld/9ZM4nRflHBGocbQos6E+z2
         iPzDecnDETGUI/kK6aRC4ln/P6lB7WJsmmp5vqgMc6kouSm9P8YRDHjgTPYMj5vkpHiO
         gFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769866164; x=1770470964;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tUISk/ccjHYHokYv6vg+0xvhja6CQE9jzscbfeu7VUc=;
        b=S+dZ4driLuWc5O0T2nJhrhdBO24rYIxQCynaBq+gvazseaIzwRZQxapxKd+Rs0OV21
         ljtUazMP3N3Irn08FK5dkBsCsdzC3GYQvZmh6rqvgjOp/mTH08qFkW2fxYTA5ayfHfk+
         PI3GVkXfJmusY/VWsIAd9JPoHf++w2RWgqPcn5v3xjKA6qWlhz5vaWoToqn2T3ARLt45
         emhqer7Ht03aWpc9JZMvILe/hZYJ+VUE5mks63TgpSidL9dgj3/kLY2wLxKhs7lqKfll
         Sk295kf+tnm5lme+o5B2x2iwywZp0HAO7g4rlSbgb/8L2duL7S4W/L4NPErmkIzyPcuP
         ErxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQLHue8bzyz2SdirxCFpaA+SqO9fZXyiYj5FFkorGNSIoYS4rklsEkgPWS+29/v27a0reyiuQqIcRokE6yzwIW@lists.infradead.org
X-Gm-Message-State: AOJu0YzLZrKV+0Dneykh39cKh6ne4iYVL68DyO+IvWVIvQviYMVaqzR3
	mO9glqclFqGJZYRDIi6Juy5m6XqScB2cyTEvdYzwFShzY0MnlkuKbIuVdre7cSbGUZTxqx2Ijf4
	oxUyJosggWrwML49Jo4LZFw==
X-Received: from edad40.prod.google.com ([2002:a05:6402:4028:b0:658:817:e783])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2711:b0:658:11c5:2f96 with SMTP id 4fb4d7f45d1cf-658de5a9a0bmr3448451a12.25.1769866163834;
 Sat, 31 Jan 2026 05:29:23 -0800 (PST)
Date: Sat, 31 Jan 2026 13:28:20 +0000
In-Reply-To: <20260131132848.254084-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260131132848.254084-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260131132848.254084-3-vdonnefort@google.com>
Subject: [PATCH v11 02/30] ring-buffer: Store bpage pointers into subbuf_ids
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
X-CRM114-CacheID: sfid-20260131_052926_280982_89C3CD21 
X-CRM114-Status: GOOD (  14.75  )
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
index 1187d632dd5d..a5d11487337e 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -554,7 +554,7 @@ struct ring_buffer_per_cpu {
 	unsigned int			mapped;
 	unsigned int			user_mapped;	/* user space mapping */
 	struct mutex			mapping_lock;
-	unsigned long			*subbuf_ids;	/* ID to subbuf VA */
+	struct buffer_page		**subbuf_ids;	/* ID to subbuf VA */
 	struct trace_buffer_meta	*meta_page;
 	struct ring_buffer_cpu_meta	*ring_meta;
 
@@ -7013,7 +7013,7 @@ static void rb_free_meta_page(struct ring_buffer_per_cpu *cpu_buffer)
 }
 
 static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
-				   unsigned long *subbuf_ids)
+				   struct buffer_page **subbuf_ids)
 {
 	struct trace_buffer_meta *meta = cpu_buffer->meta_page;
 	unsigned int nr_subbufs = cpu_buffer->nr_pages + 1;
@@ -7022,7 +7022,7 @@ static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
 	int id = 0;
 
 	id = rb_page_id(cpu_buffer, cpu_buffer->reader_page, id);
-	subbuf_ids[id++] = (unsigned long)cpu_buffer->reader_page->page;
+	subbuf_ids[id++] = cpu_buffer->reader_page;
 	cnt++;
 
 	first_subbuf = subbuf = rb_set_head_page(cpu_buffer);
@@ -7032,7 +7032,7 @@ static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
 		if (WARN_ON(id >= nr_subbufs))
 			break;
 
-		subbuf_ids[id] = (unsigned long)subbuf->page;
+		subbuf_ids[id] = subbuf;
 
 		rb_inc_page(&subbuf);
 		id++;
@@ -7041,7 +7041,7 @@ static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
 
 	WARN_ON(cnt != nr_subbufs);
 
-	/* install subbuf ID to kern VA translation */
+	/* install subbuf ID to bpage translation */
 	cpu_buffer->subbuf_ids = subbuf_ids;
 
 	meta->meta_struct_len = sizeof(*meta);
@@ -7197,13 +7197,15 @@ static int __rb_map_vma(struct ring_buffer_per_cpu *cpu_buffer,
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
@@ -7230,7 +7232,8 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
 		    struct vm_area_struct *vma)
 {
 	struct ring_buffer_per_cpu *cpu_buffer;
-	unsigned long flags, *subbuf_ids;
+	struct buffer_page **subbuf_ids;
+	unsigned long flags;
 	int err;
 
 	if (!cpumask_test_cpu(cpu, buffer->cpumask))
@@ -7254,7 +7257,7 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
 	if (err)
 		return err;
 
-	/* subbuf_ids include the reader while nr_pages does not */
+	/* subbuf_ids includes the reader while nr_pages does not */
 	subbuf_ids = kcalloc(cpu_buffer->nr_pages + 1, sizeof(*subbuf_ids), GFP_KERNEL);
 	if (!subbuf_ids) {
 		rb_free_meta_page(cpu_buffer);
-- 
2.53.0.rc1.225.gd81095ad13-goog


