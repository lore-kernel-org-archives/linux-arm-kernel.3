Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98D8FCB600
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDGVgx5O+tN6SEgYjU5DtzNVpKkiMVojTG14bXRGtGk=; b=DMFo03HjrSIsdnHBIRU9GoGy6J
	zupsrCGfTFnNTxk1etz++JK6QKhWGxxAKdm6zckAqz12WnKyrnc5spgtBHNGx0G5Q6hPixN0L8FBp
	PjQK/tQTfAQHODONqtcLq9zWXAqoAeS43IW3NbPL+bOJ1YYh3pusVzaiMYPjOawPeZVb4TyeZ3psc
	XI0ojJ2nVWCcA5D4gH1h5xmapOlxf2RH97K9R8zazfcy6t3zYfcRjsxc/fuwgdJj1/MjIW0E7lril
	8/c/o04JTD0p7KdyD/g65K7CZu/fY6ujoMdkwdY/iRer/YAkjHcCRCWTxMc9EzsKiw5DBf+Oby/rM
	w30lGqcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWHw-00000003vPJ-0Mc2;
	Fri, 06 Mar 2026 14:36:24 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWHd-00000003v1v-18VV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:36:07 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b943b0819cbso16610366b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772807762; x=1773412562; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TDGVgx5O+tN6SEgYjU5DtzNVpKkiMVojTG14bXRGtGk=;
        b=TgtnnHcy8vb1x7Q6lBKcivsqixDjpiXjh2oVAmB4qOB135ktnRY9CI3hzXBmytNWyj
         5hWCX0ukcj+SQpaDH1X6gaDFsuu6iOM+gX684lCoZI+gs7grDRX0wRKe03m8TW2/ktJd
         cVHYgVIMuhn64RKazs/9bv/Srep2TKwqmmvp6+N/zuVJJg36Y7dX9ORPySbX8gTvBlHp
         pRNEtPjvgaFxS9g5n5HPd1tXTJaLoZNPLOP18IhRJ9G60dN8kEWq5rMr7VDSghstKmsY
         5Osow7v2IIwVtftUmuVrHR2+l464m1A6mWq+ycDlhgQldpsSzH84gnlCsPxUh2gxNkNr
         Pnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772807762; x=1773412562;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TDGVgx5O+tN6SEgYjU5DtzNVpKkiMVojTG14bXRGtGk=;
        b=Eopzw1yglS7dORg8jGP1AeAbFhqKKuUtPCr99aDLFLw0WvZgppyRAD3620EWdeN4zZ
         OttFYNGPaWyJf2SjDAk1nPRP9tcYmdv4Wy8mW3w0Yu6VRAaVZYifi1yn9Z19qwco4H9f
         3MHCN9qwRccpurlRYOMQQlRD6fQpq9247WgLkqGdKRIbbJyWm577nQvYZzGz8XcdzbSG
         rHD67VG+7f9bSGIUqWUIDPvxM1DyC4Tx4MxChzmCfB2QKCz/m6LmnniGFtepFnGINMyc
         7Ousk6pat9ghAUfxXsuzZ1y+tVJgmSCGW+ZYF2kgLydKF/xZWj79TtIEDDTwuvfDtP4r
         khsg==
X-Forwarded-Encrypted: i=1; AJvYcCWcEkDsfglpGxmBomJhIw6myhZ0IOyv9BEVTpB0YDbEdRHqHi/1Z02c7aqcu2NwfD82VjmuoYVdc8bMoz8wbdm9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+tjnQpc7YvbR2G3CN+b2HEgIJCQOa7KcVYy+itgbVcklLueug
	/RSsxJyCTMxRd7/G5eDIE7WKZSGUxqLvvWyKjfS/62BkDXvKDEiCvb0apseHyZN2+LirMVYQ0b2
	T8GKyVsLe15MwuXc9zf+Spg==
X-Received: from ejeb12.prod.google.com ([2002:a17:906:194c:b0:b93:695d:528c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e0d:b0:b8f:ae35:cbd3 with SMTP id a640c23a62f3a-b942e05d792mr145125366b.60.1772807762262;
 Fri, 06 Mar 2026 06:36:02 -0800 (PST)
Date: Fri,  6 Mar 2026 14:35:14 +0000
In-Reply-To: <20260306143536.339777-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260306143536.339777-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306143536.339777-11-vdonnefort@google.com>
Subject: [PATCH v13 10/32] tracing: Add events/ root files to trace remotes
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
X-CRM114-CacheID: sfid-20260306_063606_063599_7470BA28 
X-CRM114-Status: GOOD (  14.85  )
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

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 115435f2e8b9..60492e66a679 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -640,7 +640,8 @@ int ring_buffer_print_page_header(struct trace_buffer *buffer, struct trace_seq
 	trace_seq_printf(s, "\tfield: char data;\t"
 			 "offset:%u;\tsize:%u;\tsigned:%u;\n",
 			 (unsigned int)offsetof(typeof(field), data),
-			 (unsigned int)buffer->subbuf_size,
+			 (unsigned int)(buffer ? buffer->subbuf_size :
+						 PAGE_SIZE - BUF_PAGE_HDR_SIZE),
 			 (unsigned int)is_signed_type(char));
 
 	return !trace_seq_has_overflowed(s);
diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 0d0af53c0ce9..0d78e5f5fe98 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -1125,10 +1125,145 @@ static int remote_event_callback(const char *name, umode_t *mode, void **data,
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
@@ -1144,7 +1279,8 @@ static int trace_remote_init_eventfs(const char *remote_name, struct trace_remot
 	bool eventfs_create = false;
 
 	if (!eventfs) {
-		eventfs = eventfs_create_events_dir("events", remote->dentry, NULL, 0, NULL);
+		eventfs = eventfs_create_events_dir("events", remote->dentry, dir_entries,
+						    ARRAY_SIZE(dir_entries), remote);
 		if (IS_ERR(eventfs))
 			return PTR_ERR(eventfs);
 
-- 
2.53.0.473.g4a7958ca14-goog


