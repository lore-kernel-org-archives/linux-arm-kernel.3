Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38C7CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 11:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jqXM3IQFmwL7/KyPBrOmBEtNR7claVQSXPHpFSy3Pw=; b=4OetcGLMmzQCkHYXhYL7RWfqGj
	JOdvEr8J9qYNL/lRAwwZmnYrFBDuLjaYkzJiBYVA6Rb4HCcMgMah8dHpwEzBNGbmJc6ML2VNgmb7Z
	cLDfEtFkCXp07IolKUvFU1DoG525mPSq9J65I8tfUcdih4F+zqdxE8ENnsQ7b1HwvFc3Xvk1PlEMs
	NTPoQ68+JtEeMdp+I+kILGMxf5hJg3JE3uv848/BXcH27ifu444Dwnf62zR7DiLVkXLHwT6yWp+/h
	BwklNu1R+jUwSybL64n+rQ7ewUdOiCcGhxEqPyBQO6lUNRWa9r3jhv7ZIaHGLoV7nm5rnl1V0W1KW
	0WGaNjlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3IH-0000000GjH7-3YX4;
	Thu, 21 Aug 2025 11:17:21 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0RN-0000000GCel-2wgg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:14:34 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45a1b05d31cso3266965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 01:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755764071; x=1756368871; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7jqXM3IQFmwL7/KyPBrOmBEtNR7claVQSXPHpFSy3Pw=;
        b=BXrtgeZFSRE53Vcs2a8KulMbjhM2sqe8M1kBNsd+XVzDI5vcj8vz4JcdnJwNcSNSQ6
         D9TMGUHxL4b2tZgNBLxHUH6hr3urAAJUWoG6KuCQYu4EClD+GvgtgQaiCrDZWnd25ZFM
         QCLaa53GY26FocV/pZBTPSEQUjenByh+EuzPdDMnk+hPmErc0+cI+1pw65qVwXM/DbkP
         jQR3RDVy2e4Tqm1MsRjy3eZaRsC3Xq70z/1SE6+WNEzN0UIy/8JFk/gs72ky5taBcpQg
         Rxq6a5w9dJewrng7AdIc6dmX8B/HGrbMJrTCJ7CwS8wk7rnKLyyhwcl7fyn4AqWuOtrD
         WVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755764071; x=1756368871;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7jqXM3IQFmwL7/KyPBrOmBEtNR7claVQSXPHpFSy3Pw=;
        b=sqwLsag7SajGA2LaLUCY5i446i7RVdGW8uQ1UDZNhFTDaN3ZqRpUzfjk5WKysOBFMV
         tG3BnWftY1OMz2/bxoYbwwG9xoLjoAKO5edoKAHOF9HQxtTjYfH+b6M6UYnQf4IRWgke
         Johp0BGMbHtdSHnhcE3dCuHQdyaZ4+c0Uhse8VWGGDuY3q9591cSmC5BbFs7uIzUAg1Z
         bqC6lpKKK6QdxVEEmRv3+0el4tqjskYCw7yAB0VHXoJL7mWBdKV6sYMSCWhMy5IQ3axn
         KQK7aSYlQX/eLiOoGj8GZ9UYtGGJT+LEyAHP77bVbmCcXSQ8EkEo53wGKrjuEqNxNMH5
         YZPw==
X-Forwarded-Encrypted: i=1; AJvYcCUrlY0OBu9x+0XK8PfVDa8QlmOeLdKIacAaiYaH/lbiYGnuZz86KCYVtHz9DO+M7MbLd2nmJi1ifrHUeYSjQCtE@lists.infradead.org
X-Gm-Message-State: AOJu0YwnjtxY1UPTVVXEEAqRHESZ+bE44zb8URf3Y/eAdoPQUrdzd3hU
	hzWCDn+Hzb32WITkoRKhZDoHkeKqvlqAdc9+O/cNnQjX5EQWMNn/MCsmzMzUA9dGaJZvXzjzAYr
	YB0rVOtFkjmGYG2eni1250g==
X-Google-Smtp-Source: AGHT+IE+BeKNnnBgP2hFtel0lnCMgkmekl+cgM70ekcw14+86Zb79b7FW6ixmJANsDqQXBnK6UuwhPfLQJtGZ17a
X-Received: from wmti5.prod.google.com ([2002:a05:600c:8b85:b0:458:715c:51a1])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:19cb:b0:456:1e5a:8879 with SMTP id 5b1f17b1804b1-45b4d7da9b7mr13059725e9.9.1755764071698;
 Thu, 21 Aug 2025 01:14:31 -0700 (PDT)
Date: Thu, 21 Aug 2025 09:13:55 +0100
In-Reply-To: <20250821081412.1008261-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250821081412.1008261-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821081412.1008261-8-vdonnefort@google.com>
Subject: [PATCH v6 07/24] tracing: Add events/ root files to trace remotes
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
X-CRM114-CacheID: sfid-20250821_011433_741821_814FB944 
X-CRM114-Status: GOOD (  14.84  )
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
index 8044cb23ef88..17f77653b926 100644
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
2.51.0.rc2.233.g662b1ed5c5-goog


