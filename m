Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EECCD7976B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 13:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7Sypasz+bQGyNEk8DfMJjS2f0ZOWyjNay6SOTdco7o=; b=Bg5KlT6KqgIMntqcngjuhAOVul
	8SgvG2F6nNhS/Gw2flZq2UoJTowxUMXTZr+GHua2i9gR5MDC5/ptTUaUW6FOqb8ii0SvcU7HY3f+U
	5pEpljBZmtimvAQKiHtNlvxF6fkiPVQ1qdDtEDa2I/IcwyuWmUSKXSflr+RcuZ0GMoymdgD7R1wz1
	tE3brnMla4JPnvMdhDz1njH6oU6HrPOaxEJWNF4STSYzAQvqmAFSjhvWX7Ptw6OAvFN7TqtqdBLJQ
	RJGhDT5iurrkJgYgy17hToO9tOn2rUxl2xMZhAuwA2yrAuS5OWMZkfKGxn7r0/tMfLY/tDMQ1LDs8
	jCNrlCaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB3Z-00000002cZL-29FI;
	Sat, 31 Jan 2026 13:30:33 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB2g-00000002bus-44M6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 13:29:40 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4804157a3c9so36045285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 05:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769866176; x=1770470976; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t7Sypasz+bQGyNEk8DfMJjS2f0ZOWyjNay6SOTdco7o=;
        b=D3dpHR0MlcuuTQcjcvZ69Z30ZStTOVgjtde7RolmQhsBem1UumNOThR06F0srPOPdi
         yqf8YPbyOcIFScw1jL/zJfd6mSzhesx31oyoUYCezN6nM0Tt3IQfHzsg3jEUB0RrZyQX
         ykpYkwSz3A0akdYj29/eCd23l1FeqVjOYdkh5UuiCU9MV0l7kWGE4Qffqa4l+r+mgrwV
         LnYGKBdNI+uNEbniGMHNtw7ZSuQn0dXX74ABKIyp9uHc2eJkwHvr5OyMPOVXJUS5wRHN
         orFCUPWk8aTl/ZI2xZswvoIkhx/+IIVg11vcxV3kDnQJiK5gtYx/S5VZm/lgGkgTLKdH
         DT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769866176; x=1770470976;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t7Sypasz+bQGyNEk8DfMJjS2f0ZOWyjNay6SOTdco7o=;
        b=vFMBzTqeuxysXxWKUQEuPwWRh7ty42hGn+dgzoPgHSZb7scxwgb6W7V34pQt5eQ3go
         acH3bCDqw2cqgmXRa1ddbxESgEIp4CtupEzfbkNvrot7QxxxGQCTiX7KJdAyuqMFU+Nv
         4n3Fe/QOaXuFpDHPepWq6t9KVgO1cUhmqUZ9dp0X3sApSmBE5YqZoRPJIJxFS00yQr3Z
         p1OrXic9Fu1bCQQARpGokL+a/ADzQly2axcvFQG06QEwwiz8LegVGOGbe39mzInvyvKK
         lBMAIWHsuswpi/bnHHVlzMvc/Yg8vr1rqZDKq7E5IBTccS26lcZQHcLNl93cErWKOlPv
         SvrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR5OpYMUXRK8E36uvVUNiHn7L4d8d6MevaUgr5DLgu6bvTqCMSbDcoU1l+aA0eLNhS4dsCXUWvDgtprfqfYn0S@lists.infradead.org
X-Gm-Message-State: AOJu0YzuwaVEQLiqU7CwTN9UKjBmP12+TW04qQunQNddFil9LGr8R051
	m9WnzZX7wpz2RK9o4uownM3WRtgtPy2IfM4srxwODM6gcHdBe1ruj17d4WjWuyUWD6maWs2eSjA
	DZGRGGx00ZlW3+KvYaNraXQ==
X-Received: from wmot11.prod.google.com ([2002:a05:600c:450b:b0:480:6ccb:80fd])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:34cd:b0:480:1a3a:5ce6 with SMTP id 5b1f17b1804b1-482db46b665mr66755355e9.14.1769866176467;
 Sat, 31 Jan 2026 05:29:36 -0800 (PST)
Date: Sat, 31 Jan 2026 13:28:34 +0000
In-Reply-To: <20260131132848.254084-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260131132848.254084-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260131132848.254084-17-vdonnefort@google.com>
Subject: [PATCH v11 16/30] Documentation: tracing: Add tracing remotes
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
X-CRM114-CacheID: sfid-20260131_052939_030606_4A2E2831 
X-CRM114-Status: GOOD (  17.00  )
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
index 000000000000..1f9d764f69aa
--- /dev/null
+++ b/Documentation/trace/remotes.rst
@@ -0,0 +1,66 @@
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
+Firmware and hypervisors are black boxes to the kernel. Having a way to see what
+they are doing can be useful to debug both. This is where remote tracing buffers
+come in. A remote tracing buffer is a ring buffer executed by the firmware or
+hypervisor into memory that is memory mapped to the host kernel. This is similar
+to how user space memory maps the kernel ring buffer but in this case the kernel
+is acting like user space and the firmware or hypervisor is the "kernel" side.
+With a trace remote ring buffer, the firmware and hypervisor can record events
+for which the host kernel can see and expose to user space.
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
+Once registered, an instance will appear for this remote in the Tracefs
+directory **remotes/**. Buffers can then be read using the usual Tracefs files
+**trace_pipe** and **trace**.
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
+Registered events appear in the remote directory under **events/**.
+
+Simple ring-buffer
+==================
+A simple implementation for a ring-buffer writer can be found in
+kernel/trace/simple_ring_buffer.c.
+
+.. kernel-doc:: include/linux/simple_ring_buffer.h
-- 
2.53.0.rc1.225.gd81095ad13-goog


