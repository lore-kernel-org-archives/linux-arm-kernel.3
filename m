Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66930CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qu7GyFLfNLwQVA6ni9FoSx3ZpEkIIUn3sjQhqzYAiz8=; b=iClHDwNKJ7oIrkz8dYBfAgLtL0
	mvybiJ00JDt6rNsyCmr8n78sF8RrRv7uZbwAuq6jZumpKoJ+gUwGsdjqs/jf1YXp+53ff1Trs2aHp
	0SDXa1yNt+Ca4/YvbFXKPQ0VWQvy7UtwSZWTRpbkqZXzME8+DOZdtx4nT5JFREw4faLYJbRoJjql5
	Wq25QeztlouQ76v0d4BtJaIKGi7uec/aYjKnNTg1HkTFMc7Sgntf50bcXWf9iCX9yrrYc6PTMMd5A
	7HMSf9ygFg5xHKjc438lFWc9/tXN3KCuSnMGGDXGz4hGMk1gEegn4igNrKVt4OBPqSMXXy7eqEmIf
	LDBzDoOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMoR-0000000586F-0XHO;
	Tue, 02 Dec 2025 09:36:47 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMoM-000000057xo-2Qta
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 09:36:43 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-477bf8c1413so32283185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 01:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764668201; x=1765273001; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qu7GyFLfNLwQVA6ni9FoSx3ZpEkIIUn3sjQhqzYAiz8=;
        b=XHeCquAJVryVQHGatiCGASUqvAF1662jGb7iQQ/YLr/Ioj+vhteJ39LnhXgKbp4tkr
         IP2ZYtVMj3No3C6mTEEvVc4Gqo/Id6FVN7VMHpRmyi7MjjvhWkbodXlC3mUF/hjDtIOp
         a5xMmymxeVV4s/xosZYyV9vZlwxFA3k7VcQdokK9udYcQBZriIH06jrrWUMvyuOGIaKY
         R9oAx2Sliq150p9BHGJ7xmI48P0LxRB6OLof94WLoR9JDVmxGU+bmV/4T9CtB8x12f8P
         EjYuZMYlj/wDrJU1o6boGQ+Rg/OuD4XrmO/p0Osv2B6CRlyFUvw4ld4jhtrRfOiRgNrI
         vZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764668201; x=1765273001;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qu7GyFLfNLwQVA6ni9FoSx3ZpEkIIUn3sjQhqzYAiz8=;
        b=xAHl3TmwWyksYjcGFaFhtGEKY2jekmKnOjIuT9DpxR1fre7NF9EcKg5fPN1ONKFYun
         Khve0kc1BoEjgYOQczS8LySx/WSOgBz+FCkaUhRdYZE5teUjHg8H5jyKVNd0Ba/bG5Mt
         B3mcDVowRwgVH5HxKMZ6MjnlHG5/5z9NHEr4MULMLeYbK3j1AT/VhLDKpuB4iRF8wsyF
         67EHHhJErVLSl7ALtdRAvfoDsAIz7d+PPlzhpzj6RPmfLlISUvfTJ3GI4PmTIRk8IN98
         PqKy1aXsuOMbRX9AO0KSOkScItij6EOBqJhggxDcYxcbARlW6uZnUK5oDHs2RQwTDp1c
         0dhA==
X-Forwarded-Encrypted: i=1; AJvYcCUEobbPDIt6n0Lq9BMMV0i+1e0pZa2+B5HOKVbzvhJ6B5m6G2AM3FmTICvcbJwMGFzH7G1VVJFHWtNwfIV3demQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwppZjAZCjqN6GdBidKPJQmw8oguPTgYLvvfyv+Ao/QIOEZxURS
	Gg1nwG5JlMjUNBlvrMJCw55z3ApyoxZxEtFoW1r/KJU3Wp1j6TubPMo0mWTZ14G0F1q4OYn70to
	aBMUSNivAZ8kiH/8x49j5Fg==
X-Google-Smtp-Source: AGHT+IGBhA+hYCk05ot5XcSydU2F4dh3hUYcdu6uEl1EyzVytZWMoWSTTtHR1nwrUQLSQ9KOqoRHKY+3DhHSVcCR
X-Received: from wmaj12.prod.google.com ([2002:a05:600c:6c0c:b0:477:7893:c737])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:474b:b0:477:9dc1:b706 with SMTP id 5b1f17b1804b1-477c01b494fmr433009495e9.19.1764668200914;
 Tue, 02 Dec 2025 01:36:40 -0800 (PST)
Date: Tue,  2 Dec 2025 09:36:03 +0000
In-Reply-To: <20251202093623.2337860-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251202093623.2337860-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
Message-ID: <20251202093623.2337860-11-vdonnefort@google.com>
Subject: [PATCH v9 10/30] tracing: Add events/ root files to trace remotes
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
X-CRM114-CacheID: sfid-20251202_013642_687354_5D5D2227 
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

Just like for the kernel events directory, add 'enable', 'header_page'
and 'header_event' at the root of the trace remote events/ directory.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index cb674a9fc359..9f28e7b3058c 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -604,7 +604,8 @@ int ring_buffer_print_page_header(struct trace_buffer *buffer, struct trace_seq
 	trace_seq_printf(s, "\tfield: char data;\t"
 			 "offset:%u;\tsize:%u;\tsigned:%u;\n",
 			 (unsigned int)offsetof(typeof(field), data),
-			 (unsigned int)buffer->subbuf_size,
+			 (unsigned int)(buffer ? buffer->subbuf_size :
+						 PAGE_SIZE - BUF_PAGE_HDR_SIZE),
 			 (unsigned int)is_signed_type(char));
 
 	return !trace_seq_has_overflowed(s);
diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 8527804f2d22..e54cc3e75dc5 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -1078,10 +1078,145 @@ static int remote_event_callback(const char *name, umode_t *mode, void **data,
 	return 0;
 }
 
+static ssize_t remote_events_dir_enable_write(struct file *filp, const char __user *ubuf,
+					      size_t count, loff_t *ppos)
+{
+	struct trace_remote *remote = file_inode(filp)->i_private;
+	int i, ret;
+	u8 enable;
+
+	ret = kstrtou8_from_user(ubuf, count, 10, &enable);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&remote->lock);
+
+	for (i = 0; i < remote->nr_events; i++) {
+		struct remote_event *evt = &remote->events[i];
+
+		trace_remote_enable_event(remote, evt, enable);
+	}
+
+	return count;
+}
+
+static ssize_t remote_events_dir_enable_read(struct file *filp, char __user *ubuf, size_t cnt,
+					     loff_t *ppos)
+{
+	struct trace_remote *remote = file_inode(filp)->i_private;
+	const char enabled_char[] = {'0', '1', 'X'};
+	char enabled_str[] = " \n";
+	int i, enabled = -1;
+
+	guard(mutex)(&remote->lock);
+
+	for (i = 0; i < remote->nr_events; i++) {
+		struct remote_event *evt = &remote->events[i];
+
+		if (enabled == -1) {
+			enabled = evt->enabled;
+		} else if (enabled != evt->enabled) {
+			enabled = 2;
+			break;
+		}
+	}
+
+	enabled_str[0] = enabled_char[enabled == -1 ? 0 : enabled];
+
+	return simple_read_from_buffer(ubuf, cnt, ppos, enabled_str, 2);
+}
+
+static const struct file_operations remote_events_dir_enable_fops = {
+	.write = remote_events_dir_enable_write,
+	.read = remote_events_dir_enable_read,
+};
+
+static ssize_t
+remote_events_dir_header_page_read(struct file *filp, char __user *ubuf, size_t cnt, loff_t *ppos)
+{
+	struct trace_seq *s;
+	int ret;
+
+	s = kmalloc(sizeof(*s), GFP_KERNEL);
+	if (!s)
+		return -ENOMEM;
+
+	trace_seq_init(s);
+
+	ring_buffer_print_page_header(NULL, s);
+	ret = simple_read_from_buffer(ubuf, cnt, ppos, s->buffer, trace_seq_used(s));
+	kfree(s);
+
+	return ret;
+}
+
+static const struct file_operations remote_events_dir_header_page_fops = {
+	.read = remote_events_dir_header_page_read,
+};
+
+static ssize_t
+remote_events_dir_header_event_read(struct file *filp, char __user *ubuf, size_t cnt, loff_t *ppos)
+{
+	struct trace_seq *s;
+	int ret;
+
+	s = kmalloc(sizeof(*s), GFP_KERNEL);
+	if (!s)
+		return -ENOMEM;
+
+	trace_seq_init(s);
+
+	ring_buffer_print_entry_header(s);
+	ret = simple_read_from_buffer(ubuf, cnt, ppos, s->buffer, trace_seq_used(s));
+	kfree(s);
+
+	return ret;
+}
+
+static const struct file_operations remote_events_dir_header_event_fops = {
+	.read = remote_events_dir_header_event_read,
+};
+
+static int remote_events_dir_callback(const char *name, umode_t *mode, void **data,
+				      const struct file_operations **fops)
+{
+	if (!strcmp(name, "enable")) {
+		*mode = TRACEFS_MODE_WRITE;
+		*fops = &remote_events_dir_enable_fops;
+		return 1;
+	}
+
+	if (!strcmp(name, "header_page")) {
+		*mode = TRACEFS_MODE_READ;
+		*fops = &remote_events_dir_header_page_fops;
+		return 1;
+	}
+
+	if (!strcmp(name, "header_event")) {
+		*mode = TRACEFS_MODE_READ;
+		*fops = &remote_events_dir_header_event_fops;
+		return 1;
+	}
+
+	return 0;
+}
+
 static int trace_remote_init_eventfs(const char *remote_name, struct trace_remote *remote,
 				     struct remote_event *evt)
 {
 	struct eventfs_inode *eventfs = remote->eventfs;
+	static struct eventfs_entry dir_entries[] = {
+		{
+			.name		= "enable",
+			.callback	= remote_events_dir_callback,
+		}, {
+			.name		= "header_page",
+			.callback	= remote_events_dir_callback,
+		}, {
+			.name		= "header_event",
+			.callback	= remote_events_dir_callback,
+		}
+	};
 	static struct eventfs_entry entries[] = {
 		{
 			.name		= "enable",
@@ -1097,7 +1232,8 @@ static int trace_remote_init_eventfs(const char *remote_name, struct trace_remot
 	bool eventfs_create = false;
 
 	if (!eventfs) {
-		eventfs = eventfs_create_events_dir("events", remote->dentry, NULL, 0, NULL);
+		eventfs = eventfs_create_events_dir("events", remote->dentry, dir_entries,
+						    ARRAY_SIZE(dir_entries), remote);
 		if (IS_ERR(eventfs))
 			return PTR_ERR(eventfs);
 
-- 
2.52.0.107.ga0afd4fd5b-goog


