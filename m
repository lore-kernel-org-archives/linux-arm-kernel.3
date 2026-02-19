Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C51E9A04C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 15:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TzK/3B1VQb6SprmKmRsZnV3yZajCXE7sXg4mEEAwt00=; b=GmwGjxu+dtm7yXy80EX8T2U9YU
	FY+OepDMtgkvhrl9jK85YhzmFgWecWr2boij8GS86zvxweyamAJJN29aGLPGRDm2o0XNwFZFqBLPm
	AdWx4RTmIHFqCluEQTO6fErFd35Dw9/N0TWoGCIMsZJmGqxU634KBT7iOiii6gz4Ha4G5lmkD3FYN
	GlYhIUoBv6sP4hGdEPCVj6t1VxfrVqk65ubYxKGuvghFz/wIF37ayilMuqKZc+gukQeBQ2pEftktO
	HTsmIrZBFoQ7Kb2SF5GOSTycNPiAedHQX5CoGlZz34ZhEnNyi567F4Uqi5cVsBaNHdMQakGmnbYQ/
	DjQYg2tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5Z5-0000000BUsH-2nbr;
	Thu, 19 Feb 2026 15:03:39 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5Yx-0000000BUj6-2hcx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 15:03:32 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b8f9599feb8so100654766b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 07:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771513409; x=1772118209; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TzK/3B1VQb6SprmKmRsZnV3yZajCXE7sXg4mEEAwt00=;
        b=ygZpxHfSZWd4qBq7sKlS3fdIp/6ZZZJ/Vu1ZJPb789r028pTo8FZ9vPaxYuaql8Bjp
         Zj+RDgq3EKFrJfT0A0cbREsDByBbqy+bJ7zXJmFmLaWQYXQdclJTe/R4zt4Ie+HiX2nQ
         5OlI+bRDHXoRucuvjl4kpyGO+eDRgmQf1/2QWBEJ0unxRHlBR9ySV9X04bJVjQxbuGu6
         7nEkRPKjteUEXVTvYsfs1wUGK8Fh4aSumcp8ikWSDxjHOhj5cyYTPmCTUN8O7eMEiR4I
         Io0MMAkvGwbViVRkLrpuLaOTH3cGB3FKm8fWI9U6EP/274rrmIFGEXo1myOj9VIiz7yn
         LUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771513409; x=1772118209;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TzK/3B1VQb6SprmKmRsZnV3yZajCXE7sXg4mEEAwt00=;
        b=hHGimejNZ5I4YFa+2f+rIVaa31tXS+KWCZW8N7YLz6PtOM4tE2Eb7kBNKXB1q71ZbC
         UwOROFuo1MAY+Qwv+BQfsjRxjgtFFGIdlU9XMRYxBiDwDHU0IyHTlB09zHa6bu3aqbCV
         RqUCmHd7fJlY3vK+JHB6/939slecRTkxCHhJwEqDliUsu+IeZ5CrtT/mXBKqN7Iq3Lbx
         nG1NoubGjsKdPGNGUYI5/T0gk8uaVqLlpYEZp+mJHzMSBx2l4jPtWZ0g6RLMlkWUiI3C
         SmECnAnNwNnUfSeVpysJZTswGq6JQ7albU8MC0aBCAMQq9fi3PH8BLr3312qZnooLgYw
         n8Cg==
X-Forwarded-Encrypted: i=1; AJvYcCXi/CX/yik32NZnAaAXvu/4t/rd2mF0rKB35+1gbb04ir+iG2SxE1wiTRI4L46xNHUWYhERW5w96yz1hRUbRqw7@lists.infradead.org
X-Gm-Message-State: AOJu0YxwQ4Kq3zHofHIaoi949t3GkgzLbHRPdYir2XZciOpWiuMYCwCQ
	L40KWS3Qf7zqXKEGQDTX7oBuMrohcBS7mLyKl+U/lHUcNrW+rPVfSMmRszHBitIq5Ji8QvFQK+L
	Dzs/KhXbABR5dLo0iitDK0Q==
X-Received: from ejfw17.prod.google.com ([2002:a17:906:a11:b0:b8f:b527:5d02])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:980a:b0:b88:6309:c300 with SMTP id a640c23a62f3a-b903dc90470mr313180566b.39.1771513409188;
 Thu, 19 Feb 2026 07:03:29 -0800 (PST)
Date: Thu, 19 Feb 2026 15:02:47 +0000
In-Reply-To: <20260219150307.14538-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260219150307.14538-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
Message-ID: <20260219150307.14538-11-vdonnefort@google.com>
Subject: [PATCH v12 10/30] tracing: Add events/ root files to trace remotes
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
X-CRM114-CacheID: sfid-20260219_070331_722420_6E81D971 
X-CRM114-Status: GOOD (  15.38  )
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
index e36e70e2c998..190a90816f02 100644
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
index 7dde7143aa20..595277fe5b2f 100644
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
2.53.0.335.g19a08e0c02-goog


