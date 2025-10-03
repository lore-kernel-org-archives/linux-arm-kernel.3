Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8552FCCD182
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNuzwqo0SryxPVWfT4A633RiduwyoKQb5duSwc7WjqM=; b=MnbTHzzRpOdcAsrm2WhaRWv6Ua
	ivfiYiRtFwaXErELv6HT3RfyiEkTqgN2r5oARJ5qtPgvMXidYOzInRo2eHbqv+8bKRrNbMzuyZhty
	xFNvjWYKydYDOL2E1Aebzbl+uT6bp9elhP02NvK5yzAx0Lbr4h6fQMYkhMxfbs5zyEexqtS6D9ekO
	QwhlUhusbRfl6L/YwSfAbeOgsEWk7+c6512+kZMNsnR2z0u9JJJkEnM7wqjnT+a1m/m/0W0TTyXnI
	PhfrLylhTxBzW4sgpChu0yK1ZGWf35Z2afQglldZCR7bwKnfbVTuICZB+dOqv2e8yGI5uJFiQ4eUU
	J5ZKVgew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0B-0000000CQKe-0WRh;
	Fri, 03 Oct 2025 13:39:15 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g04-0000000CQ9Q-1m9M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:39:09 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-46e4cb3e4deso12173985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 06:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759498746; x=1760103546; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wNuzwqo0SryxPVWfT4A633RiduwyoKQb5duSwc7WjqM=;
        b=OZNvJsAEKHJdpZ0RnICKdzj1MdgSuMW1N79SrVjsI1UgV+NfluHqN+A0mkeoruRkpj
         Ntrj+Kfzy14/NFjqVWiw3g6Hh+dEBfL5NtoIBDz6pstaWl9ZSKX6yDCSNfy3MrCPC5Qg
         xCXboHiIzovq+/zkqmpaK4sjax96/dgbfTAKoyyyGNbcEDCyjCs+EK+XLR83VYwo6oev
         LaBJ1mjPe6DPvD1RUWpapwNu2U6FGPrvXCMlfd+GvxHs7N3c8Y7FQE9V7uOutm0olZch
         9QgViTUBtbDqaV199tn7bwYaD6Nd4JWTPvVGuG6VcYhKJNtv1iblzEJouFvqynCvUPjr
         BRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759498746; x=1760103546;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wNuzwqo0SryxPVWfT4A633RiduwyoKQb5duSwc7WjqM=;
        b=ZT1M12ONOngCR4H/MnIWlyZ9DrcbdZWRg8OFwqN1c6tbpnPtkmsKbGfqFCDSc+mp2R
         RPHAlssc/hRgasu++Srkj9E8+7dwnYsz5A/sIhQaITEgBqgVIJRw9AY6kRXacHMo2iy1
         tAp9e+iyaRPVwjKNL7gdLLAjaBc7XypVU8oc4Coo96321Ny1VmmUDd/frI5ygVW0MdxM
         3GGAzsH3GdVDCx+1nL/F4+SvqnWFKtO2DQ75Fb8QEAVrj/d44lpjw32XOFZG2Lviczfx
         5JqdMFY5GR8nM/1lYgN3RsMYlhTvN27822CV9aRY1qlPIjYPPNXAPdSVmh7JspX4T51C
         qQnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxv7G8DGAgzOA0lUZStN4dPbqin4RCFGTucHLPDr2wozRox2I/aMHtRTwewaBofTCFgFJepBJthfgRBTGf2wi4@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ02m32MPhu3wkLp5tZvM1RaiexFJBw3N6Zhch07iKHXX8KCcR
	CC0N8Y686sT9VlWvTaPe6HK6yWgMMfL5jd17/sy1WUgyimx7pVa9OI7xbq19AlZTLg25ytpFLUH
	KonNqc0lqBGcO0gwov3DEww==
X-Google-Smtp-Source: AGHT+IHdLlzmFSd/8uLT/n+RQpFrBV4OeFRePRaDs9j8FRUA3U3c+FD2rubzZ09J18jdk0ft6f5Qd0MP++kgD1NG
X-Received: from wmrk19.prod.google.com ([2002:a05:600c:b53:b0:46e:5ad6:9013])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:11:b0:46e:6d12:ee2a with SMTP id 5b1f17b1804b1-46e6d12f14dmr30146875e9.16.1759498746709;
 Fri, 03 Oct 2025 06:39:06 -0700 (PDT)
Date: Fri,  3 Oct 2025 14:38:07 +0100
In-Reply-To: <20251003133825.2068970-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251003133825.2068970-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251003133825.2068970-11-vdonnefort@google.com>
Subject: [PATCH v7 10/28] tracing: Add events/ root files to trace remotes
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
X-CRM114-CacheID: sfid-20251003_063908_501701_9C5B0B1B 
X-CRM114-Status: GOOD (  15.53  )
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
index eb556e691b5e..a26a6f537f87 100644
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
index 9504d9c04bef..1bc9c9a5197f 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -1075,10 +1075,145 @@ static int remote_event_callback(const char *name, umode_t *mode, void **data,
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
@@ -1094,7 +1229,8 @@ static int trace_remote_init_eventfs(const char *remote_name, struct trace_remot
 	bool eventfs_create = false;
 
 	if (!eventfs) {
-		eventfs = eventfs_create_events_dir("events", remote->dentry, NULL, 0, NULL);
+		eventfs = eventfs_create_events_dir("events", remote->dentry, dir_entries,
+						    ARRAY_SIZE(dir_entries), remote);
 		if (IS_ERR(eventfs))
 			return PTR_ERR(eventfs);
 
-- 
2.51.0.618.g983fd99d29-goog


