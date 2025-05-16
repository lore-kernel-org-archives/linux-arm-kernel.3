Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE54AC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 13:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vbxz6VgsYQpmquuEf48m6ENRRnMX9gVzHugVlK3Ks6k=; b=bBfRJPv19tMt4rCRvmd45iba6F
	Y1Y8T8giFCKbxv63VKI5epRy7BkPZFdbem4rIWJK8PQY49gDCpFCBZEPFl7AGVmrmg9HrVRZluXd7
	AE+XqNVSkWEXt0LmeCRApUlnvpmdDcsOgQlgSaJwbJ9AW2KNK+bYbXaMoAeg7X5kiMxI9StIVWYld
	ovvsk44D2C3pSLoh2VTpbXdw+McLyXYtGkJ/REK3NY4hUmB3D6782Ts7tAjwWBvAl2J5yeKPZwdY0
	14Do1gRrF1DfbmIckwy1GBQkXVzjBQHRrsGAba8c35b5lRfcKaWK6WSzNlQBS4OusG8wSm0j/Tm9o
	cmyLc05w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvYr-00000003b1J-3x0n;
	Fri, 16 May 2025 13:57:17 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvIv-00000003XoK-1aCD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 13:40:50 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43ea256f039so17427235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 06:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747402847; x=1748007647; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vbxz6VgsYQpmquuEf48m6ENRRnMX9gVzHugVlK3Ks6k=;
        b=lrLkRyM6yF9zaF1PEsdbHuT1/Nl5VgcVCLLS4D0auTGDmPTl8+M4EOFpm5mQWyJ2Xr
         FCB8nVSxao+7qbqtVUluUhHCAoUIuOM7fkmQVoY+Fpanx2UOBsdz5jP3Y2mVuqC0oc1s
         SjQpYqWZcVIFzc5ThITcsF4x7QO3KO+uk7Li2BXueTqWUMPKS2tyNfCqZ1Q+tp4Aima3
         wiY2WCj0TjCttMZqUCJkgMrfoTkvwgG+WA9aBrFIwRaoGPAXoVYiLwKocAiAJjA32kTf
         51MwxKZuj+yKRL0SS/6Z2L4L02dGZnmWnKgDqNmqpvGSKo4d81osFUhPW/f8IcnroGMk
         9oag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747402847; x=1748007647;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vbxz6VgsYQpmquuEf48m6ENRRnMX9gVzHugVlK3Ks6k=;
        b=tgKE5IB0YWHSCQYCprL1zkdHpn1tUe8Z+30DlAfd/PAJQ4Bl/hBcvDZDKn0lCvJ3ok
         D322CeC4oAn4ZMSmlkACXyWDL61HOXbaHQPOU8gopNqzXoRTVssdBAngUfom3vgFABQS
         thob+seV8s6T/DV4X8vqom1F9DODV8ussqSBlSzStI7D4i/hGIWRvjDnQcvszXi1mG/D
         E5sXjCt29zee2ie/GkmYZ4A8eqXhu7KPXyFfwqA2O3W299/exTT102QB6rii0ugwCUoi
         tEsI2bYh5nOcvJde529c6JaB7eS5u39iErm9Va+7mtm0AKAWEgoOatmDPxhfDMX02gkf
         O9sQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1uBa6x8j3YHRtQ5cwQDMMdh+sczB+lcML3zUgK88yKnv6ZAiIUbHr4n/zvQwXlo3tVW3wFvLEa6yMs8KZeTU7@lists.infradead.org
X-Gm-Message-State: AOJu0YxY5Ea5nrguFurdtXvu2Dxxu4hQBNxPDR7B33Uf1ZSjnXBo5iAL
	IDa1WwulMN3Szyxl3EXIH+ZAgmsuM0AzA448Ha0b8d5EZdhBQl+bI4VmmJ/LQFKvnJhPF1vuy6N
	oqtqcyLaSb97pFrNchMis2A==
X-Google-Smtp-Source: AGHT+IEWs6z+aMdfnt/Nqv3/4XuvEER4z+Swr38ZCWgw9ZBInJe9N03F0hUkQVLXcRXpp3jXiSL7a/+YBquu8pJE
X-Received: from wmbfl14.prod.google.com ([2002:a05:600c:b8e:b0:43d:4ba5:b5d6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6748:b0:441:b698:3431 with SMTP id 5b1f17b1804b1-442fd67205fmr30489785e9.28.1747402847441;
 Fri, 16 May 2025 06:40:47 -0700 (PDT)
Date: Fri, 16 May 2025 14:40:13 +0100
In-Reply-To: <20250516134031.661124-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250516134031.661124-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516134031.661124-8-vdonnefort@google.com>
Subject: [PATCH v5 07/25] tracing: Add events/ root files to trace remotes
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
X-CRM114-CacheID: sfid-20250516_064049_416272_161153F5 
X-CRM114-Status: GOOD (  13.92  )
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
index 2aa7f77bdba0..8f94ccf3f55e 100644
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
index 822cdd76e334..5065b162c8ef 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -710,10 +710,118 @@ static int remote_event_callback(const char *name, umode_t *mode, void **data,
 	return 0;
 }
 
+static ssize_t remote_events_dir_enable_write(struct file *filp, const char __user *ubuf,
+					      size_t count, loff_t *ppos)
+{
+	struct trace_remote *remote = file_inode(filp)->i_private;
+	u8 enable;
+	int i, ret;
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
+static const struct file_operations remote_events_dir_enable_fops = {
+	.write = remote_events_dir_enable_write,
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
+		*mode = 0200;
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
@@ -729,7 +837,8 @@ static int trace_remote_init_eventfs(const char *remote_name, struct trace_remot
 	bool eventfs_create = false;
 
 	if (!eventfs) {
-		eventfs = eventfs_create_events_dir("events", remote->dentry, NULL, 0, NULL);
+		eventfs = eventfs_create_events_dir("events", remote->dentry, dir_entries,
+						    ARRAY_SIZE(dir_entries), remote);
 		if (IS_ERR(eventfs))
 			return PTR_ERR(eventfs);
 
-- 
2.49.0.1101.gccaa498523-goog


