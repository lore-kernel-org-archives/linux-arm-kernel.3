Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1789FCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPcBk3Jg2LwlT5ByMzu9UsOIiesB4Ql1GztQ2+qvXy8=; b=ixZvm5Vp5SY+1BpV5LXlScGIDu
	Bf/SnHt20CjmV/+75ocKdZEBoOZboNbx9Vf3afxhFVJxNvZusiyB1h5BuiVg87GjqbMMWHCUV6jnI
	Vp9DzJ1nwEgroS6G462p2w85mZ4rGNgvLkAhpEzhvstkslev4mrn0C8kgDjTvwBffTkcEHfJWjuiW
	BA6HpnLnj/Rq/+hxIvrUzXMfMDaidWrXSK6qHTeaP3S+T30JrRr9wfY9O0vr85S2Y4nsxQrqblXfe
	a26vL12J6bdqnWc9YAAEGw925r1VBFAmjCf2Wh//0iBcj47u3CZf6p3KIvZXR4QuhM2j9/bHyexAI
	sVpo8COQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIwQ-0000000Gz3W-28a6;
	Fri, 07 Nov 2025 09:39:34 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIvy-0000000GyXm-1TWn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:39:07 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-429c5f1e9faso429067f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 01:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762508344; x=1763113144; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nPcBk3Jg2LwlT5ByMzu9UsOIiesB4Ql1GztQ2+qvXy8=;
        b=ird1+HyX6TBBijMfb/lEe4cnd6EnqAtg281er3L3RkHs47lpFfCVwwcIj1G66oz0wB
         qn2bN0lndyJA+z885yHXXgAb+t4r7AnMTopcTVl1aMc3EynlVmzHpZq3UUnSCw+ghhQj
         jeZbwMoCM4a6JL+zrMP2eTk/FgtZpTVE5XIK4jvpZ2KE6zoi30RD5OxUfr+nlkXZQxJy
         xl3V8ibo73UOBZN425tIEwsbjFhuyfBkI5liT6zRhTxXgrYC9yamR20S9jghookIgDI/
         NFXv9oL6TjQMS13NOAcvMxLynJWLJ0d43GVNKO9w8yKR96UDUZ6h6levNqgihyQ1LOcn
         ITIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762508344; x=1763113144;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nPcBk3Jg2LwlT5ByMzu9UsOIiesB4Ql1GztQ2+qvXy8=;
        b=FY1yerDKpunuE28qjUa7/1aB44efk/k3Xu95o+jDL6OY5H50QFbIKZDsu/EY9TAmlt
         t89ezhMfyITd5KLO1lz697/w+2lWLbKh/33qztxD7YeoXI/puQ2rEb4QlS/xOMWnK9Y/
         G3kq8zM4KeT5fa8W2tYD2cJlIuQ44UlzJCVrwwJaWoI0ij/3t15n4aE2UY5xjSFNZqmX
         a66sa2q4nuLb46cHcv6sQuYEJof1iq7DNcLv01WB69aGehekt6jmRwIAylHnL+zIiBCe
         ynq0beeXLeDcuasjlrMt/gxPHWMOxp+JJPi7MsvQCs6iPO6T/nLBjnjegVbeuthLWBP6
         /UAA==
X-Forwarded-Encrypted: i=1; AJvYcCUwtKg1FehdoBS5SlzRL49S2GIb/RMDPjDMLUyJ2CoNG3jvM0ys+Pw//rrpYWfLVhrfFjRKAYCEvyxMcUouVfz6@lists.infradead.org
X-Gm-Message-State: AOJu0YyL5Hd1SbZyXEb3BTmw0ozL6rbaXp1Gkacf7eDJ5WLlEgQrcAN6
	2yVbf8F8Fcdk+WJ5uzA/mSM3e53OhzR1dBt1mH11kMiq8nocSyH8oIu41G701l5lJsvnsvcSTTu
	OTEkrt9jBKKB51DEJTXR8uw==
X-Google-Smtp-Source: AGHT+IGwE9ip6WqJGodYFNUEr25D59pPNmkTX5hMRAWuWBgUwmxO8l/KAXALHLOnFBHa62U4s3AVgtYL5Uhey6Tp
X-Received: from wrad4.prod.google.com ([2002:adf:a404:0:b0:429:d9e5:878a])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:22ca:b0:429:8b47:2f35 with SMTP id ffacd0b85a97d-42ae58d038cmr2260717f8f.26.1762508343746;
 Fri, 07 Nov 2025 01:39:03 -0800 (PST)
Date: Fri,  7 Nov 2025 09:38:28 +0000
In-Reply-To: <20251107093840.3779150-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251107093840.3779150-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251107093840.3779150-17-vdonnefort@google.com>
Subject: [PATCH v8 16/28] Documentation: tracing: Add tracing remotes
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
X-CRM114-CacheID: sfid-20251107_013906_436232_CC684EF6 
X-CRM114-Status: GOOD (  13.34  )
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
2.51.2.1041.gc1ab5b90ca-goog


