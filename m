Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EB6CCD182
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ptOXAsK02KET+nuGM2NvZr5tn+Cruj7KUoPt2v9bC4=; b=N3MD9OOzhp84bo4EKZQ6tvQn8G
	vSDHb3QNd/8OcM/204HBfP5H0KtVvtChQYnwEo4j5OE1mawLA/KUPQfKyBtgI6OBVX+rhbcC06QY2
	gPNHtXqprt+qXZqfheljStzmkjNCZ0T9FmWpQX6DAvfQhUGUSmRwnzl6vEY0ulw4wJvD+ENJJ5xC4
	mJdBnN5GPcSw0VSQKHqo0tV/G+v+ssOUIvgT8KTL1YK54r7GNWYaKH8trAxs4tsyOroZVRQSYC84V
	LTSHX9D5g0OKrHchO1JfwgtzUMp37eDZFAO0fkSSCCBroRMAhPjJrZU9+0fVLe57+uKVafb8yAQhG
	k30AgtfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0R-0000000CQjf-1mrr;
	Fri, 03 Oct 2025 13:39:31 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0B-0000000CQH6-16h4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:39:17 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-637e3a27ddfso3018278a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 06:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759498752; x=1760103552; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ptOXAsK02KET+nuGM2NvZr5tn+Cruj7KUoPt2v9bC4=;
        b=DwPBEGZnvLBX4w5VmLr2Zg3SkpcDGU4csc5+BAO8FBFejCGltjnOiEuAcfWKLHhoEA
         tqNmmuwSQQm+MB5zZkpHonIPiOPASiSQOk6j4URsKQ+fP6+o4Wfy8exyARyTmoWglnjw
         USFQJRIRYBK5c6XbOwO6E5Mpk+HsoMpAUfd75ngXY99pDJMxOKqqDrwu9C0CbVm0Dl55
         lyCf9xmjwFCgSoiEzn5Ll59dLQZSktd2GsbqQMNgbZwijWXTiwWMXnbGgBdUcScnurAM
         8Xx8MMwC3e1dZnRkMdle2rYD579I0rZJeDIEm2a5sjIgFCZU5ZGpkh8nBAQ8hwC/Qvb2
         arqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759498752; x=1760103552;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ptOXAsK02KET+nuGM2NvZr5tn+Cruj7KUoPt2v9bC4=;
        b=DwCS4yIFItjhmWKXyq1NyswjEhtgkUKzmDSRxjmzqtT7Vp2EuCQJ44aFiSJKk5Cpjw
         U+EAbxXm7h0MGn96MTc9mWdUdbGsPq1k5KqFbP6/ekMYCtQnuiecTUNdqlE6oauewMQr
         DIIC84ITM3ntqkzAVgponE6Dv0SWZ5AP89UrAT3+WFWSLRIlia+krc67KXFY3ApifMjc
         Pa2kAdoonKVpqydJWCl1j1XG4i0nE7YiQ6f5w9M1RFSm7HfXY08qDAOg2r4g1vaMM7ct
         0nOHqNaAzM3i9D3gs1QMZbU/2CEKuQhQRj0W8taePCsykpBrTIgdIISCQQ+JEt0MlvMf
         evUg==
X-Forwarded-Encrypted: i=1; AJvYcCX3snI155OVNdMsC7UhTAJfbfhA2osBRFzVeg4qlfWejrvPG+yT2bU5iqatxr69UHNT9yeuGOgHdl0L7oJlqIiZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxzVGvAZ74/eUjvXXlkv0VSPO+u7QdJh7VlSr+0wOBwGSrp5GrB
	4H5DrVldydo8SatDhFKADoybdXCvmPEMA20yNdjNsmMzOEJcFpIePF7PP0pIaUj5tGpuWg75R0w
	DR7N++9Rsz7JRDpPj2nB7yw==
X-Google-Smtp-Source: AGHT+IH1xhwr98a1KjzKNYHcZRC7sH0MEyc8VNAbl5gX0uevl9b95kinJk1XW3eUNT+SGJ+58Lgd/woZKqcy9o+d
X-Received: from edwr6.prod.google.com ([2002:a05:6402:346:b0:636:640b:3c66])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:50c7:b0:637:e17e:1a9a with SMTP id 4fb4d7f45d1cf-63939c2df6dmr3356826a12.26.1759498752381;
 Fri, 03 Oct 2025 06:39:12 -0700 (PDT)
Date: Fri,  3 Oct 2025 14:38:13 +0100
In-Reply-To: <20251003133825.2068970-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251003133825.2068970-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251003133825.2068970-17-vdonnefort@google.com>
Subject: [PATCH v7 16/28] Documentation: tracing: Add tracing remotes
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
X-CRM114-CacheID: sfid-20251003_063915_348924_95C09AA7 
X-CRM114-Status: GOOD (  13.75  )
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

Add documentation about the newly introduced tracing remotes framework.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/Documentation/trace/index.rst b/Documentation/trace/index.rst
index b4a429dc4f7a..d77ffb7e2d08 100644
--- a/Documentation/trace/index.rst
+++ b/Documentation/trace/index.rst
@@ -90,6 +90,17 @@ interactions.
    user_events
    uprobetracer
 
+Remote Tracing
+--------------
+
+This section covers the framework to read compatible ring-buffers, written by
+entities outside of the kernel (most likely firmware or hypervisor)
+
+.. toctree::
+   :maxdepth: 1
+
+   remotes
+
 Additional Resources
 --------------------
 
diff --git a/Documentation/trace/remotes.rst b/Documentation/trace/remotes.rst
new file mode 100644
index 000000000000..e7fb3ee96c30
--- /dev/null
+++ b/Documentation/trace/remotes.rst
@@ -0,0 +1,59 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===============
+Tracing Remotes
+===============
+
+:Author: Vincent Donnefort <vdonnefort@google.com>
+
+Overview
+========
+A trace remote relies on ring-buffer remotes to read and control compatible
+tracing buffers, written by entity such as firmware or hypervisor.
+
+Once registered, a tracefs instance will appear for this remote in the Tracefs
+directory **remotes/**. This remote can be read and controlled using the same
+files as regular Tracefs instances such as **trace_pipe**, **tracing_on** or
+**trace**.
+
+Register a remote
+=================
+A remote must provide a set of callbacks `struct trace_remote_callbacks` whom
+description can be found below. Those callbacks allows Tracefs to enable and
+disable tracing and events, to load and unload a tracing buffer (a set of
+ring-buffers) and to swap a reader page with the head page, which enables
+consuming reading.
+
+.. kernel-doc:: include/linux/trace_remote.h
+
+Declare a remote event
+======================
+Macros are provided to ease the declaration of remote events, in a similar
+fashion to in-kernel events. A declaration must provide an ID, a description of
+the event arguments and how to print the event:
+
+.. code-block:: c
+
+	REMOTE_EVENT(foo, EVENT_FOO_ID,
+		RE_STRUCT(
+			re_field(u64, bar)
+		),
+		RE_PRINTK("bar=%lld", __entry->bar)
+	);
+
+Then those events must be declared in a C file with the following:
+
+.. code-block:: c
+
+	#define REMOTE_EVENT_INCLUDE_FILE foo_events.h
+	#include <trace/define_remote_events.h>
+
+This will provide a `struct remote_event remote_event_foo` that can be given to
+`trace_remote_register`.
+
+Simple ring-buffer
+==================
+A simple implementation for a ring-buffer writer can be found in
+kernel/trace/simple_ring_buffer.c.
+
+.. kernel-doc:: include/linux/simple_ring_buffer.h
-- 
2.51.0.618.g983fd99d29-goog


