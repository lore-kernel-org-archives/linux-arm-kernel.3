Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D893E9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 15:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPhLrsaL6GHqnFz8k7XCh7wMYB+F4ptERk94umByGuM=; b=UYxpym/ZK5/Ke3CUk3Dn2Ttff2
	mtTHKMqEUKPMRVYgDm/XLNPaP8Bc40dLJiqBOK5sfyyoC6Hrm8PTUiZoHhesPu4jCckm/jv+p+pMQ
	Yyjkwbv62rUZWAAwvbLoYhzhGu1WjOGgB3OcgU9spoyMUpCEb1FvV8yUthFcRrmmFYRkU2bW6nfeD
	C3ECWXJ83ShhCwXwSfS36EO+qzmU1tTlp9dfp6o/oErf/2wMY0pVche/cBUAAF0O+QjIfwOoiqgUw
	pPZigC0TtOyC/8GDk71den9//1aW4M31VuKwDdhUroRPSDTrCbWYR+qS+KcpQmUtUCyw2MY5cFUHB
	bFmrEShQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5Za-0000000BVTj-0I0F;
	Thu, 19 Feb 2026 15:04:10 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5Z7-0000000BUqJ-191s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 15:03:46 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b8fa51ade75so106049866b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 07:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771513418; x=1772118218; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sPhLrsaL6GHqnFz8k7XCh7wMYB+F4ptERk94umByGuM=;
        b=WyM1aKKZ3Im6R5YReHfJ1Uokm8QSyAEHjwmxEDg6tzaybx2YgJ5lWYn7E8febBRJCj
         qtLxtpUMyuLzhk3HycYYl+OhGs9ct4J0GnrheN6FBGngeypMnuW5Tupnbce42pq/1klD
         cOgreqJk/hZ/ooFpzNLjPxfoD18OQmIdhAk3WexK5V3LAf1kd46SLy2egJI68Xorro95
         GYOds5yu3zldDCRZQ1qKfX8AZbFqyovCwF7zrM8cjbhdx/SbeX3nMfaWCUO4QCpWmfpV
         AWpzLZOnG8X8UqFVb+Xk2WvK/zI7IwOQ8+hhwv0woOSLrcigj0YpFJlSZQMWZksFnNTw
         PDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771513418; x=1772118218;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sPhLrsaL6GHqnFz8k7XCh7wMYB+F4ptERk94umByGuM=;
        b=K3WCggX69gNlnXCk0QUm25YJeOiryCoSxHBhuNFxFbaS1RfxRXrQwl2lIiEbD+MuNC
         ZX6DSIXuKxfauLnTUx8Q/F3ezi2UnG5DUgjYm/z2a4nkna1odC0c7fXZG8LpHYVQIomd
         31wPPOrreYs6LsUoAOr1VTJ5BH4fhSgESxhqJiObrUIUy5/GkYXGuDofuybZ5dmxQC/a
         BCNlfAV093T20M2+JNbXdeIhotRUvGgGWCMfJsojGgDP7ZhAFjgLIw9fvy+D0BGmTTGO
         MS4GTYjjUby8LmCSFPuAaUOdsfR3tJkJuoPId4gUZDrmGt544j/+iNq51DfYEzFpstbP
         +rug==
X-Forwarded-Encrypted: i=1; AJvYcCUpLo3crjdaPWhGzLBgofdC6cTndD4Gs8qmQ2K9o3fh4c4Xe1ecUKPGAArIdzxvQ05qInIRAviuzBpoueBxp2fk@lists.infradead.org
X-Gm-Message-State: AOJu0YyrG+3bFRD6orMsWGjlPrAqPsoH7KNrT+jKztwBKiO9olvmSfhG
	Hsoz42nr7GD7rRaJGDNlADI0Wz5oki9jOBIoU/IlrxDw+VFjt1JS2SuEwokcy8zqWNd8NZnsaj+
	uYLCG09PwhvYdp1jtrwioxA==
X-Received: from ejcyl14.prod.google.com ([2002:a17:907:bc8e:b0:b8f:943e:13b9])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:1c82:b0:b88:16dd:d835 with SMTP id a640c23a62f3a-b903da49047mr298923766b.1.1771513417420;
 Thu, 19 Feb 2026 07:03:37 -0800 (PST)
Date: Thu, 19 Feb 2026 15:02:53 +0000
In-Reply-To: <20260219150307.14538-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260219150307.14538-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
Message-ID: <20260219150307.14538-17-vdonnefort@google.com>
Subject: [PATCH v12 16/30] Documentation: tracing: Add tracing remotes
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
X-CRM114-CacheID: sfid-20260219_070343_390529_2D244B1E 
X-CRM114-Status: GOOD (  17.72  )
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

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/Documentation/trace/index.rst b/Documentation/trace/index.rst
index 338bc4d7cfab..036db96864d2 100644
--- a/Documentation/trace/index.rst
+++ b/Documentation/trace/index.rst
@@ -91,6 +91,17 @@ interactions.
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
2.53.0.335.g19a08e0c02-goog


