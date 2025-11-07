Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59793CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=suZEunh3pTtEBOLilYte+fuuSjgEk7HCDOkHWJLiaf8=; b=a2CgX3WM6pMm1reHEcJYJiJmwr
	Hf78RowLTB5rgZgBY0THf/wZGn9VCeDQrv9hbXO+S0b+uJ+vuW7w1QrUiuA06IjL6xVGqZK+cinRs
	xkcypCH259M8jVqpn40UJnRhjlwd8mfbgHEMiP7M7woAWBGCi6mUCEXErDXx22YL7zj7Vc8+pFzNR
	OTJP1JA8PNSLMlh7joF1wShXdpBAc5Y2eAvFzlf9UEeNiZM1PvEBH9Bc2Gn7wKZfBiL+lIF75rqHA
	5pdrt6rrxEqYjbHtIRb63/kPPFpuhrDTL5zT8+jjwWWX9TERxLUlPemUIV2iumdKRfmcuESuZksbX
	QfUAKlGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIvu-0000000GyV2-30FI;
	Fri, 07 Nov 2025 09:39:02 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIvq-0000000GyOo-3Iv2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:38:59 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-47769a0a13bso5373825e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 01:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762508336; x=1763113136; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=suZEunh3pTtEBOLilYte+fuuSjgEk7HCDOkHWJLiaf8=;
        b=IsUF64OG+4glVNnmbTwKCqJVyaizrRru5rcI2QkAYRGKNtsMwOShDSi+qrEQwWZP3q
         Uhrw/tH4ptRBYGSFNcobO8Ckm48S64+znsG34BmCpZkyBQpOZ7o7Y5CF31Wq3y/Cg5/B
         eaPHvQAxT0nAf3GI8SCNB31xaCv/mN1aTWXwAZfhuSKe6H3xdu9YCBVouZ+lOMnoaOTJ
         x0hX1QRl45evE0MrY0cGWa0rgBkjZie7NytL+lvwLHH6IbBLhP6ubhA1uRPHhxcG78ck
         n4ZLC2lMkL4cka6C7qxzURET6nj7Zm6j+PtG8hscIi386oFupJpcRzPCZg/0f3xRHNKN
         A9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762508336; x=1763113136;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=suZEunh3pTtEBOLilYte+fuuSjgEk7HCDOkHWJLiaf8=;
        b=P5q7a+8W15Hw7bq53ECM46T389DDWD0/EvtxsIIydyvlOnO7vru8/OZFgmVFf8qnQH
         2+o/awTRHnJq0NPy+qKmu7ENsY6QTj8dV5wuPhSQbjeMeuEcbpVRR7+szwnzKgu9Fqw3
         ptJiZwapG79ZEdp7v4J6GCZOB8Hq+XlR1pPil016ulX4TujojqJI31gkFZh1LgT31NFl
         vxwHAcABkVgkn0Iwi6He+34ucGNjE/QIL+9J3n50nLRxYd89pC4VgTQ7Jf1YiKCZtkN7
         IxPOvJoBfb64Z4yPRRK6l4+HVZ3pum1M3ES5kYYEVYI+ISwbpmrAbjA3Cj1ROXTKnse8
         DFcw==
X-Forwarded-Encrypted: i=1; AJvYcCV2z1mKQijVhg04/rByQ1il3/MAXzgXCAlAEJL/2+hOLBz+jQjZzYO/nY9Jua3UI+eHrIeFrvjr8t7Sm8reeLsG@lists.infradead.org
X-Gm-Message-State: AOJu0YxY8GILhaifDJMf/0AxZpbUiSXtgbuWPplvkSZlQn6PQ0HwocMC
	UT5iruEnYVmbyit8UjqZlNczVMcwiPkS5tanTMHUUjy4sfK4G1l5YR0rDwwdBDsRJkeToP8BJth
	bW2K+jo17KPZwsVGweLsFkw==
X-Google-Smtp-Source: AGHT+IFHffzR9bK7OBL/WwnulG3E8M/4OTfY/jrO+spwvfaNmVGfgI9sjXyGDvIOLNbKB7bUdo0nTOhEXUw06yoY
X-Received: from wmtf12.prod.google.com ([2002:a05:600c:8b4c:b0:475:c1fc:f10a])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b38:b0:475:da13:256b with SMTP id 5b1f17b1804b1-4776bcca1ddmr18536495e9.38.1762508335761;
 Fri, 07 Nov 2025 01:38:55 -0800 (PST)
Date: Fri,  7 Nov 2025 09:38:20 +0000
In-Reply-To: <20251107093840.3779150-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251107093840.3779150-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251107093840.3779150-9-vdonnefort@google.com>
Subject: [PATCH v8 08/28] tracing: Add init callback to trace remotes
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
X-CRM114-CacheID: sfid-20251107_013858_845688_16A18887 
X-CRM114-Status: GOOD (  11.24  )
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
2.51.2.1041.gc1ab5b90ca-goog


