Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE13DCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1k9lnCa35g0aTUreNVQa2rVX+IRvV+YbWj70G3JIso4=; b=bNtrB0vWX5eSWR/tpPTj372Far
	ecSFc11uolAafWPt/5wEsljuCHQia18t9/g99pjy+jWsWvNobi1BTirBPWVAWzEwlAkXSWopGB4M4
	laAFzlIkFeG/1cW3TYL7boZfaaQzQs4I7+ICYTdK17rt6MPXwRbw/O684GWIri55ZgxO2MikzANzn
	WSSHTp6Vv/XDtPBtEqzBGeK2UrD4cuIHN+ODb8Zx7XOGksQ1n4fd/QgcGT0zfpfFA1QJupwqvp/Hn
	U7G/rayBXbcXLE1WwdHtXoXNVy/m3fGcQJkXJAhWeca1yks5n4SP/ygBzyl1E0oMY+ThieuDocgvw
	uuQbK2tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMof-000000058RC-2o3L;
	Tue, 02 Dec 2025 09:37:01 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMoT-0000000587e-0d8P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 09:36:51 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b72a95dc6d9so176239266b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 01:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764668207; x=1765273007; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1k9lnCa35g0aTUreNVQa2rVX+IRvV+YbWj70G3JIso4=;
        b=vZFLomHMPdROL+tEurNnNgIms9c0VGGAayoaLLYDq4gKu/y12O3wlusGaExdoaAGhX
         rqKbPEqLJ/eYqCMD2zNdCe5ANKppByCtpsNLA0Sd8NGjyK8WtsD+27LIjUTsaJTpO110
         QmpImLk9yxDaEJctiuxX7Eh0WaXHX3xYQg69K0Dptmrn2d1c/VqOGx9Hv4vaJScNn6+A
         Ummrmfkqx/IQ1/J9LUbM9bkaHVA5CkMAeH7peQhOZYs2ctrRKO9NWOsXe+PuhGvHTt6o
         KDrlg3TwUVjU5Dn2pNKVcM+1tCNi6Ltu6XcdSAQPHVohX/GCpgi0pZTeUT40lZGb7hNY
         wwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764668207; x=1765273007;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1k9lnCa35g0aTUreNVQa2rVX+IRvV+YbWj70G3JIso4=;
        b=Y+Uogso2L+k75FOshJWxFhVEvsAT/7fLjmHC3GIkcATKKG5Ay13W5pRtyvo84iRcIR
         1TfHM4tPmgFdKLmmi+ckobUh/Lg0lXpMM6OyZG26+Vr21DHxPAA16tyE/s33eOoGpj+7
         CfLWQS/h43BzFoCL276H2y0WwuzrkCOxdodINI2CAkl/5ZgGAfQCl/01rxk6yu3AIGg0
         wPeSAFLaB67F+lLY2IW6mPIKdph7lg7SrYYlir/m9wfXRmiMJvXsNSqx8TEyvFlSPNeR
         IfYoJWzsb5uI+O6JSFTka5i2kPc/CvC+hV2z29IehbcWxiqm/OiVB4mDyx3t6dxcA3tR
         wDJA==
X-Forwarded-Encrypted: i=1; AJvYcCWdKRCPA4TK8m1+BKRIW0pNa7pcK/hI1Z15guHijV+RgmPmETGSHnxE3JIBVY8RpMaa9IX239UzZIX2bHXBZ0Wt@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu8YaR4BnOIXtBq6OGWKF4zun0EJamt6Abi6FJSl8K3NuATMaL
	khxRcDSCsN/1Gg9Q3eLT/nwO/PfU0qM7g8Qnud2rrJqiArW8n2pUyvruWiAUWkAZpumofSMQ/PK
	JOKtNvcxZdkrcrRy14muhSw==
X-Google-Smtp-Source: AGHT+IH6ccFpR0WrW+/F3kealA6pNGmuZbYCFARi/n7zyIqU+hpmNdIgKjNmor9NcQZqnGFg0KMHEyXXFtwtLCUK
X-Received: from ejcse13.prod.google.com ([2002:a17:907:a38d:b0:b73:580c:b277])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:eec2:b0:b76:69d6:f9fe with SMTP id a640c23a62f3a-b76c566bfaemr3010632366b.60.1764668207371;
 Tue, 02 Dec 2025 01:36:47 -0800 (PST)
Date: Tue,  2 Dec 2025 09:36:09 +0000
In-Reply-To: <20251202093623.2337860-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251202093623.2337860-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
Message-ID: <20251202093623.2337860-17-vdonnefort@google.com>
Subject: [PATCH v9 16/30] Documentation: tracing: Add tracing remotes
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
X-CRM114-CacheID: sfid-20251202_013649_285015_D1DFA31B 
X-CRM114-Status: GOOD (  13.58  )
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
2.52.0.107.ga0afd4fd5b-goog


