Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B86CF65DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUro18mbSKiw5/VA7IRp/lLCcUE0ruHzOjVvSoVnLbM=; b=Oq6zDjCSBoW7oPpcuAuSCS0mjR
	gWfy3z7PJ1ow9sSFZkyTqVyowNB8MdsOe6X0rKCQeUrFtYSkouIB7VVN5mbVlT8KtsieICWxtBFUG
	xqqFNHwLu2F4dfkR8/V/hEZ4ls+S4isfD3f86+QXBgamg4ePsWex4RKWegHDMj3uTl64Iivn/taNf
	EfzyoDjguksS5K1fCcLYW932156OEC2OHswBeavKdmH895zg5dyaTCuaY2oxsa6sZsx3gcl1eD3qn
	GfLN5hBnA06o2/b1oBjNTrAQ+UAapC1vW626ycA05ZqIHCp1eeMWb3gnBfS6s+yrikvk9fMMdizLG
	8GCQhTvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5r-0000000CK1L-05EG;
	Mon, 26 Jan 2026 10:45:15 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5K-0000000CJSZ-3d4m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:44:44 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-47ee432070aso39429495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 02:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769424280; x=1770029080; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zUro18mbSKiw5/VA7IRp/lLCcUE0ruHzOjVvSoVnLbM=;
        b=V70JWewHhPhMJNNWJcRKJ744pKsLgM75NuK+NWWaqYsqnFW3zrcaypPX0+VsDVtwaZ
         Nc9ZaJI9/jI04qbzK14U8XAd/KnLuZVyAO/DV/HSfPX/KMYHXG/UYlpl+suzq+wcybsR
         1pmnKB+v458TlsDX6+jXFM06CbLi8T68ITXdZYj2Ier7ujWmmjVzzc1VnulFOYOOLPwL
         4q+UscMrKIhvx7cnGw9X/HVuhFVoH2eoYg125aUXpj5IrbsPw0EVyK2FhpQUxQDvLSBo
         ILHGPlgIggXfr3HQLMD5RHgK6xD162ux4Xnb91YF3tPgW7HAceSN/bZKiHNZF/dT4bq3
         UDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424280; x=1770029080;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zUro18mbSKiw5/VA7IRp/lLCcUE0ruHzOjVvSoVnLbM=;
        b=wF7d1PVEMv3KJX0wCHvClBn7v+4iu8C1YnpO2xi0Q1EfK0Y/BdhP8A8b26+spp0sZE
         9B1JxVhttDoIu1wN7+ddMrtjp7wJB65ZbbSGDsnIvLlRqYg6w5Y+hCsDnVVtu9IMX04G
         rCwtvTK/rtInrXjaNXnhEkDOTTsorEDCf0+xWdGXWzZ2OGmKI9+jd+UbPuwjQk3xvKhO
         ro7XNAN8o6V5MlH1YylJ17TZh+kvaB/Kq9leSgP62ecfFCYY5+VyR9TyPB7+KCTc8YGq
         Ze4wbNTNsC2kwEolK9jN6xZrpp3nEWkcO5lTrQSbLqsMRlc/a2pY17Yjw2MJtai3Vcgw
         4tKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVATnxJfHhpk9s/bgU5UklsiD/58Sz9L7grnBMxZQzcEkU0DcgelPHU/2Lwz1cYreNSgUG75HmrrVqlsjlzHrP8@lists.infradead.org
X-Gm-Message-State: AOJu0YwJAXdjicgyuwXSRh5fMTWJloSsmYGmaBIPpe07kWs4Kg8r4O85
	LFQPffCSITRGc07wfSHIqrtDKc4PyKmB4WouvplnC99dyGq65/lbFImB3KCa8BNOeIJhiYYRioL
	qzZGIsusvAkG0DrRm8MzVkw==
X-Received: from wmom18.prod.google.com ([2002:a05:600c:4612:b0:480:4a03:7b80])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:34c7:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-4805cf5ec2cmr63608005e9.22.1769424280511;
 Mon, 26 Jan 2026 02:44:40 -0800 (PST)
Date: Mon, 26 Jan 2026 10:44:05 +0000
In-Reply-To: <20260126104419.1649811-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260126104419.1649811-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126104419.1649811-17-vdonnefort@google.com>
Subject: [PATCH v10 16/30] Documentation: tracing: Add tracing remotes
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
X-CRM114-CacheID: sfid-20260126_024443_038793_6173CA91 
X-CRM114-Status: GOOD (  13.67  )
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
2.52.0.457.g6b5491de43-goog


