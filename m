Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A7BD116FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6hDRr7zZJlL6+0BwYS6BtC3S7766siHfVTQT4bpz1c=; b=FiJ//mZB+qHT5SFwaeXGkFbRfn
	9g1PMyA7BJVeBQ/O0YFRn8yllUepA0o21e2cUGhOUDmphOxSDUOqqIzQlpCVLAgYf7MyJQqbAaueB
	vrsL4JpSu7vVvp2FwesH3iDYbpQRVf6R8VCi9/zB42c7BPoVFsQl8POYgHbU0YrFFzaXiawHgxn9w
	y368hMslGk0WwfBMP5zADD2TzO1su+VjG6wk/FvFsq6vcoIYBOAEC2tdOFwyo3DFZdHoPEbF/RHSx
	wCRpxgi5DIuevN/DrEub8AiJNhgOg4aXGWu2DKfTpsjtUk2tqc9RBp8NoCHsNz1k+F05DvJvq6Eok
	mZaY7vlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMoO-0000000581H-0rg5;
	Tue, 02 Dec 2025 09:36:44 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMoL-000000057uu-0oSu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 09:36:42 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-42b570776a3so2902766f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 01:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764668199; x=1765272999; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=C6hDRr7zZJlL6+0BwYS6BtC3S7766siHfVTQT4bpz1c=;
        b=q5FWn57wa+fHEgAW7pEdUeHOK8nrLoDoBAes7UVW2xamZ3Oq2GZZWF1CCIwCiwX0g4
         GN96dQouX0gAFoHJ294qTFLVi6CFxJKMjof26Q4/tUsgDq27Gv18MTe+y79/mQzkDccP
         1xPa+ZPszFrgunNJBcY3sVceIDjzVCZv5p5cAe/DwctHdXn8dWrCv9c6JMq/cuQnPr91
         6+6Qz+d8X+dW/SMD4jOzC+eHCYuCmm+6DrxZrHcXwwyMlXDnTDYU/9+rT4k34vmJ/Y4M
         +IRxZ7oK4ba9F9vPd1DqiW3O9uXen9O6urSJn/nyWxZi5vZa9zf3XjV2w0ROtSPvL8u3
         hhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764668199; x=1765272999;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C6hDRr7zZJlL6+0BwYS6BtC3S7766siHfVTQT4bpz1c=;
        b=NDPkSq0P/X0oG+1VBkIq31FbgMW6/1C/FwxYDI52/qq+h71lw6eFyY4BKLt0AB2+Y9
         lqnM0UA01Y4UlbEyOBd9rkxCc8XyzreIcOYOCA+a8L2dKT1qWk20jxm9sUI6LFJQok4v
         AgS56wl6gg0dd3IwZlBCNbYqWPrnKkBqBzgzTNaGY5nAHgxr+X/IEnDSXKt7B4LG98Rl
         YxbeJ8Oe6ogXcwQBNc1HuFP26b+66Tl9Xq1t1Cd4VVT2rJsCmI23j2PMdNXo8P1m4rXP
         mI26LSNzSKPmC/QcYHyzhzRrBkYAc5+zl/z3fdlYrvHPUpqX7DcRr32ta2xFBiquxObV
         Dodw==
X-Forwarded-Encrypted: i=1; AJvYcCVFgcn8KFq5w3HxfwLxmPxMVVsNPxaWunRa4xECAha5TIHguBJ46Dz+zdVcGGknbM4SBjNO8vkIPTAm/Q4YhJ11@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2RA2egOu0WK1OfN4x+gxwkOHf1z8BDVF4l5v8eVtMYXHgMPYx
	g2kaMqr0Ej/btlm3Q9RrQRM+FYc24CuF9lU0kZvIFEL1f+s03oZO+nZC6fqK3SsmrLMr+tqEceY
	ILpWDkfm9c4OrB17e2zs9ag==
X-Google-Smtp-Source: AGHT+IHwrvFhNppyviCL1Q1Q07XxwsMfPqHOqtUBea8U605YaGsdf4CkpCYK7lF/ypH0eslN4jrChDse/98GJevE
X-Received: from wrqf1.prod.google.com ([2002:adf:f8c1:0:b0:42c:c2d6:2a0])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5c89:0:b0:42b:3ee9:4775 with SMTP id ffacd0b85a97d-42cc1abe271mr45304466f8f.11.1764668198810;
 Tue, 02 Dec 2025 01:36:38 -0800 (PST)
Date: Tue,  2 Dec 2025 09:36:01 +0000
In-Reply-To: <20251202093623.2337860-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251202093623.2337860-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
Message-ID: <20251202093623.2337860-9-vdonnefort@google.com>
Subject: [PATCH v9 08/30] tracing: Add init callback to trace remotes
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
X-CRM114-CacheID: sfid-20251202_013641_288004_D5FAD75D 
X-CRM114-Status: GOOD (  11.48  )
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

Add a .init call back so the trace remote callers can add entries to the
tracefs directory.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/trace_remote.h b/include/linux/trace_remote.h
index 55754ef78104..15a579633123 100644
--- a/include/linux/trace_remote.h
+++ b/include/linux/trace_remote.h
@@ -3,11 +3,14 @@
 #ifndef _LINUX_TRACE_REMOTE_H
 #define _LINUX_TRACE_REMOTE_H
 
+#include <linux/dcache.h>
 #include <linux/ring_buffer.h>
 
 /**
  * struct trace_remote_callbacks - Callbacks used by Tracefs to control the remote
  *
+ * @init:		Called once the remote has been registered. Allows the
+ *			caller to extend the Tracefs remote directory
  * @load_trace_buffer:  Called before Tracefs accesses the trace buffer for the first
  *			time. Must return a &trace_buffer_desc
  *			(most likely filled with trace_remote_alloc_buffer())
@@ -23,6 +26,7 @@
  *			new reader-page from the @cpu ring-buffer.
  */
 struct trace_remote_callbacks {
+	int	(*init)(struct dentry *d, void *priv);
 	struct trace_buffer_desc *(*load_trace_buffer)(unsigned long size, void *priv);
 	void	(*unload_trace_buffer)(struct trace_buffer_desc *desc, void *priv);
 	int	(*enable_tracing)(bool enable, void *priv);
diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index a744bbf48e88..924e3f3ec6d2 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -837,6 +837,7 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs, void *priv)
 {
 	struct trace_remote *remote;
+	int ret;
 
 	remote = kzalloc(sizeof(*remote), GFP_KERNEL);
 	if (!remote)
@@ -854,7 +855,11 @@ int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs,
 		return -ENOMEM;
 	}
 
-	return 0;
+	ret = cbs->init ? cbs->init(remote->dentry, priv) : 0;
+	if (ret)
+		pr_err("Init failed for trace remote '%s' (%d)\n", name, ret);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(trace_remote_register);
 
-- 
2.52.0.107.ga0afd4fd5b-goog


