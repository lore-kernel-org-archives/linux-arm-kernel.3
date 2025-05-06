Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7AF8C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Jp1lLJLaGjaKoXy64OEgzLoF8SWUPuFbMZNzmgUGvY=; b=zbE69H1QlvAxoOrk3pZT1B7pLF
	ggsp8dQsXFSvho88U9shV1cr6ulcnBTb+lGHI95bYLTR6x/A/reTgc9fumidKLfhEpHMOwEVaIb6r
	/ewwYCN11lS5g8gX375yrfe1+6hw08zfVTe6wI01erwvCpKWikAS5ydx+Ym9ppT+3UNTjEvSX7xFV
	MPzFawjPtfuiZAWf0XkUWOPMiVZ4YjPsiaV11LCZIA5M9R1NLxUzhCT7rIuqUJKzP+18c4g3Mgq9v
	DATbPpecgxRoGWFJT0Jb+cRtCEwkkddqO1f8TwNq58kwVJ4V2A9KN2vACDdI7Ils7mMQNypsgsLiA
	zDPzxXzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQhk-0000000DYH8-22Nt;
	Tue, 06 May 2025 22:24:00 +0000
Received: from mail-lj1-x249.google.com ([2a00:1450:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLTZ-0000000Cjvs-3GHo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:49:03 +0000
Received: by mail-lj1-x249.google.com with SMTP id 38308e7fff4ca-30c0c56a73aso27855731fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 09:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746550139; x=1747154939; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Jp1lLJLaGjaKoXy64OEgzLoF8SWUPuFbMZNzmgUGvY=;
        b=LDZcozmkdkYLVhXH0zX6qzlrfZ1j5rfyU40nZB+ZU7YLIJi8b2HBDAZtNM9n1GxocI
         53iLeF5G+6cJemHLGVVGCLXIcEk8ZLGqNtUk2mSJoTkR8nzv6CIxImLJsurtPxy9YQ4H
         28yNgkTGI3hekoEmrw0EFGV7+UK+OxcYLeubCQgKfSLjFD4dpA29qZzzm6redGtZELYr
         qyB4AiZPqDGqXvVcEdnhL9qJI66DmeKUFYkNyZw75bjeCDnlv4JlLe2Yt7dwPrrJe2fk
         4edC9rXdSfZ0pWkn8v6nrdWI+CUiOB2OS+/N2wRRSoVEiYoLEn7s92JnMeM4lXm2nFcw
         i/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550139; x=1747154939;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Jp1lLJLaGjaKoXy64OEgzLoF8SWUPuFbMZNzmgUGvY=;
        b=TuUthJWHg3yn77GaK8MsHckqtCo6cD9IZCOyWSy7dh+ZHGRsCLedEt1ZqD4FVZLZwd
         9YSxVkohLRq6JWChhvBGOyovK43N3uFREC9a4ekqTDo7ZOIPlnXFsqyKOV1W/RGq3zAB
         UT5tIdrQx2MhgJKyf+eKR265hYLA+trn0n3Em1tCytGsJzvopUMbVn1wK2s+MBoMhkk6
         evFK/drAQmIsKnzpW0c3+qtOvOTeptoxCsdGoq4eluC/3Q77TgsDqWaIuaiPW5dyyBoy
         6b2yZqXsLtwd4x5dkJrVj5PTBb82IAtVgzONljQWiRhD3Gw7vteO2hGAU77Y+nrgNZlC
         OJPw==
X-Forwarded-Encrypted: i=1; AJvYcCX919NUnZ9OHB4arK6dvX+7SgtTGx2QHnZiH2kc1C4JSVPfZ2GfWulYsXMBaF59hC9GeL8prL7u8AyFysWqX/FN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0AumvV8GZx7FyAMIWD644lY/eR13vsiQbCjO80VV1kQ0Z1g8U
	rW+YLDP5304GJQouyFwKgz6n/tRmZ3tpB6DTc3QNR9etBBXVMsFDG4DROcTaxviXdZNnpYZ8sJI
	9pwBHZ0kUrR7/P08/lA==
X-Google-Smtp-Source: AGHT+IGiXAgVMRbfLIS8SOyIvtLGncb5XoCWTw3YHC2KCY3kpynNJbuNPStX2fauF3TpS7pG9j8sT4PCVtP6V84+
X-Received: from wmbdq15.prod.google.com ([2002:a05:600c:64cf:b0:441:d228:3918])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:1c:b0:43c:fda5:41e9 with SMTP id 5b1f17b1804b1-441c4933d05mr112672305e9.31.1746550129253;
 Tue, 06 May 2025 09:48:49 -0700 (PDT)
Date: Tue,  6 May 2025 17:48:02 +0100
In-Reply-To: <20250506164820.515876-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250506164820.515876-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250506164820.515876-7-vdonnefort@google.com>
Subject: [PATCH v4 06/24] tracing: Add events/ root files to trace remotes
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
X-CRM114-CacheID: sfid-20250506_094901_819555_EA414750 
X-CRM114-Status: GOOD (  14.52  )
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
index a96a0b231fee..cff1e700d4b7 100644
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
index 00ef80da043b..5c9f2b07941f 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -707,10 +707,118 @@ static int remote_event_callback(const char *name, umode_t *mode, void **data,
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
@@ -726,7 +834,8 @@ static int trace_remote_init_eventfs(const char *remote_name, struct trace_remot
 	bool eventfs_create = false;
 
 	if (!eventfs) {
-		eventfs = eventfs_create_events_dir("events", remote->dentry, NULL, 0, NULL);
+		eventfs = eventfs_create_events_dir("events", remote->dentry, dir_entries,
+						    ARRAY_SIZE(dir_entries), remote);
 		if (IS_ERR(eventfs))
 			return PTR_ERR(eventfs);
 
-- 
2.49.0.967.g6a0df3ecc3-goog


