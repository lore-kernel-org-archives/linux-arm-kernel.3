Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D92ECF65D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7YJRP+G3rcImUrxUFghhwl9H2MwKFHCz4aOODu5pyqY=; b=GvY/JJQ0DUWkSk25XTs2lVoJ+L
	xE/yp2KstlTE8wrHBKb61JlGZ5c6zlVcygyXFwdx6Gv3thv6xC3uX9ETtMA4PfzXiKXq/THMuh0M9
	tgJ1C2TfHg5GJ+miwnPA5JWmix/XHakHVZy1rjXsS5m4XpnimQPlBfjG4EiAbdqL/SjqUtteMLjQp
	KUFizqyMjtgh599qq3HsPPFy/TCQI+qJdDkxboXSUyYjBHzkgLJHwEkUSG7D1REYHhwOvKmLi34ZN
	7lBnR8l1SpJomJaoeZIqn63AMeF4pL4fTqMuTxJXozJktmgJVxmR4hHK2zg9//yuXB6D7bkxa7hgn
	2ZA7vPug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5w-0000000CKAv-3KSg;
	Mon, 26 Jan 2026 10:45:20 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5G-0000000CJO2-1qVD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:44:39 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-432c05971c6so3233192f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 02:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769424276; x=1770029076; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7YJRP+G3rcImUrxUFghhwl9H2MwKFHCz4aOODu5pyqY=;
        b=yDWrm4nlosqmKiNBNUh8enrWRnelx5s2q3EPq3nbpwt+YyU52acSLXzoYK1KfIbkFu
         nuTvcCpogEW3ay7FHQvPUy+i+V0MYrKAO9CotOEeXbKLIqrbDs+P8gRWPoCDJRRFrSel
         wu2lkq3fWXXrtMJd2+FuqiAKx6r/yn9GBBjt4eMBVNGSpI4bcLiHFa/mK1dSbPnQ9K7Y
         pyseOQ7TH0+pd9j3kJsUBiadT8HC64foJ/TyJ7rjKkqRNvk8Q0tpYDWo/TzA7H1PvYGS
         W1jjbVf2CAD4Xit+FXAQfz1Nxq4RlW6dGz9eHelp3hZh23SqPsIsxLDcu2K6Ai/SNQVf
         1Skg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424276; x=1770029076;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7YJRP+G3rcImUrxUFghhwl9H2MwKFHCz4aOODu5pyqY=;
        b=nUI2mYywOTuBYy0ebVqcSgcAWGSghdmoc51F4TV3Wza5xf9d8GfQScLqTmXGeJLSn5
         OJ55eRUaH0fAEkRW6FpYuMFKtJ+ItBH0P31itkRCi3ocToRuuf6ttivT1O3FCqhrOvRm
         IVMnmohxnGdj1dPjFKp8XmPkMSkXxFQEhozTqcFzr9YGmaCGxhQlktK3hT4hT6ler8fz
         HOfuWYH9HBFJQD3AFsewkUpxOASMW9mhYqZvtFSz4UGOSv+JyEIGwued9098X4SkGqf7
         MWr5II5qpaezl3rYpPopN6yBpf2Yl7s5WupxAXLBdgo/utreXIM0hoERfNp/ZtbEDWyw
         QROQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXZ1KBOeN28399ib1qj2YGw25qcEnY3acbLyDybTZo3wH5aX2m9/RtjIymv5Cs4Nz92vQ7E5dFy5CLCMUWxfk9@lists.infradead.org
X-Gm-Message-State: AOJu0YwU2+qPw+KwnJIivgDcjP7iuRgYWSONKFSWZpd6q/myIH0CDQe+
	pr1o6I7p9UVn9KMb7UC4gKAqrSsXT7g2ZPA8ygIwy2azdr4/z0cObcgkhp9beAvsHDwqjvtpFlk
	9vvKFsUnhhCGvABbAdZEVUg==
X-Received: from wrbcm18.prod.google.com ([2002:a5d:5f52:0:b0:42f:bb9e:9b09])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1449:b0:435:9336:21f3 with SMTP id ffacd0b85a97d-435c9a9c00emr6590304f8f.10.1769424275822;
 Mon, 26 Jan 2026 02:44:35 -0800 (PST)
Date: Mon, 26 Jan 2026 10:43:59 +0000
In-Reply-To: <20260126104419.1649811-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260126104419.1649811-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126104419.1649811-11-vdonnefort@google.com>
Subject: [PATCH v10 10/30] tracing: Add events/ root files to trace remotes
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
X-CRM114-CacheID: sfid-20260126_024438_636278_CF5D5E3A 
X-CRM114-Status: GOOD (  15.45  )
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
index 2d08dd326309..e28cc02d1a70 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -639,7 +639,8 @@ int ring_buffer_print_page_header(struct trace_buffer *buffer, struct trace_seq
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
2.52.0.457.g6b5491de43-goog


