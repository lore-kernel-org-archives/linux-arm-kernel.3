Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AE9FCB604
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6OW0CQFlfUo8gIs8zWJuy/R7hSbmdzTUEKNvWrAy54=; b=fvU4q4AEzhtrbah2YRevNkOCb0
	2k1GM7sl5GZTjmNBD356OzwqJQaQDlkTnEP2HnOYputOahXW2y4eZSAJFOF3/GFaSOqnj3qXKRIQS
	0vICk3/7GMgumw0K/79+m9BvyzvjmBLxmtz1GyBa7ehygKDfaNIDoFUhAySh9/uvzQze/vYqIdgkF
	sczxinxuV2x/v7Pc5OHcZM+0EJlmDdTtxgQRtV/lGUMexxrvx+d9q1VasZcL3tH7+5Ua5JnZuGio3
	hJ/c5ec9hYOMfH5avvxiOXxETS5BoUYOiCLR0UyCVgHFuZ8PKCeBfmMNZxsP11ErKLSQqPbtoN9s3
	tDiX9Z6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWI4-00000003vaZ-3lPR;
	Fri, 06 Mar 2026 14:36:32 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWHj-00000003v8y-1tYV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:36:12 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48378c4a79fso81381935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772807769; x=1773412569; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B6OW0CQFlfUo8gIs8zWJuy/R7hSbmdzTUEKNvWrAy54=;
        b=LsOfrMTi/kbeS80jNZ08f38Cl1lvosneAyuScRPkazGtvwEa2/txQKMug33EeE/8Qx
         fANxWVN9bvkHToNSJRS35vSJmnSTJB9apSIOU9D5PBBa95CpUKACE/FDlXhpBaqtmwO8
         lqQbHqyE6PTtzDBtKUO30xlUvdi7LmHBO9qrCyx5YT25crbQ/xOYGBsbSA6+ay6vB5as
         XR44Y8G+xlfmVfQW0z4YTLxZw3hpL8QZxtOJQKulvnNy9VOqWASLUyfhBhBnR3DSaWQo
         /jHwD01QjbkHXZ2tYs642S7k6yzO0iLbKvZrxPypsBn1PG0sDKpjiOMjZbBY10zGcRu9
         bJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772807769; x=1773412569;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B6OW0CQFlfUo8gIs8zWJuy/R7hSbmdzTUEKNvWrAy54=;
        b=F4WqBr5agvTB19DD+BoGKNZybZ6NsM99dYCEQ0hw2H7KrPZFO9bkOVQswwsammTctX
         LZZ1H/lrsyaUNISyQeIJ3+iKIHR/1YvqIfItUyskfZcl2rXS39Vp34pdXzg6MljNvlLY
         SEqHfz9vFClxWCOjd1NJYloZJzMKQMOeMrUNc8iuj9MGA+fab6wAGRctjgvgVExxvHnw
         I+hs/eR3R3q9dg38SZ1Msp1qi3meSRU7JgQOUed2d+CURntBXIzsEEZrbhD1d8V1FI7Z
         qqsNnyeLzyoXing6jSthumnL/tk0zNY/ppd8T8mpnYHBI2fyw/0IUYm5yCUukvkIO6bJ
         Koww==
X-Forwarded-Encrypted: i=1; AJvYcCUdN/4T1kQy8MkY9iN/YU2jZOMHBNjY9XX7vDqBRlZM8gqN5Dqrl21r1n/+aFXm/4AUdQuz5TWtvjZqOdgKpTBg@lists.infradead.org
X-Gm-Message-State: AOJu0YzDcU2XV1azu17yffwoSLR9k4sb6/Yn7cfpg67HXPKZMaNUiTri
	jBZ8S9x4kLTRCZc6rF1pWU69MK95CRpnNS69c55HhoswsJgmcWpm2Xpq0FpqbO0/QfyBy7FePPT
	1Ofr8w2EQUp2Pvoyk3sKZkg==
X-Received: from wmlu14.prod.google.com ([2002:a05:600c:210e:b0:480:6c6f:8c06])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4451:b0:483:bcff:7948 with SMTP id 5b1f17b1804b1-4852692427cmr37315825e9.10.1772807768794;
 Fri, 06 Mar 2026 06:36:08 -0800 (PST)
Date: Fri,  6 Mar 2026 14:35:20 +0000
In-Reply-To: <20260306143536.339777-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260306143536.339777-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306143536.339777-17-vdonnefort@google.com>
Subject: [PATCH v13 16/32] Documentation: tracing: Add tracing remotes
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
X-CRM114-CacheID: sfid-20260306_063611_521385_0B457515 
X-CRM114-Status: GOOD (  17.18  )
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
2.53.0.473.g4a7958ca14-goog


