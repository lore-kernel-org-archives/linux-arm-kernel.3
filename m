Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA26FCB600
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/el005jPydhTNUS1hr5dgVCq32s5flSC0Li9+BCYSpc=; b=FqT5EZNG4+Mni+pPW5cNRZQiZ2
	8Yo64P764NBxGi8sIJY0i0et6TZ/7R1wulyZGl2JMo/tfM8OCQcuV9iPSBJoKc5gt4LK4uuy17PLL
	Ud/SwlkOAqzWQH7h/Q+klu73vFObIInrCIr3Y7W417iRoi8BAIP3CkYuHA9cP9KAtFTfAE7STb1C9
	eRvFuP58cFw+iaf1NQ0mWqX89t/OUyOjzQDSW/ww5jGLqoOvG3fu7FeXHmgBPaIOK8rTlewfuvQB6
	sVpccgn4CZZJsONBXadJIseS+iYaIOZGSHvQtQesWkS3kMvqDXa8hpGL+E4SgSzSxOBQfW1E4Jwpi
	G+/I6dlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWHg-00000003v7Q-2Pi9;
	Fri, 06 Mar 2026 14:36:08 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWHZ-00000003v0I-3Sdl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:36:03 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-439cbc5fb4fso2515308f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772807760; x=1773412560; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/el005jPydhTNUS1hr5dgVCq32s5flSC0Li9+BCYSpc=;
        b=A2gJYqDcGSvO72bSF0u7X7Ik4d/kX21LcAnhT5g7GspU0vFfJd8Eup+IABT1YXMhTt
         rOWJYaYvzJ7ukF+vwJPuZ9J86a37MnuP5f7feKeZ0bwRW7v2s8zXHSDWCDJvjV1SF25u
         T+5M2EF9LY6NkB/0z9TXiDrPneHQGIf9jX6EdV3YnTC23yY8o1J3EC3L3rZ+iYgURr5G
         9jLfvymmVQG4sSSvJeUZqsuCy7tvUvl8nTNASm9eUZzCKoZNgUILx3Mxha35+KUO9BWv
         jdVJ/XHGrMI2dBpiQIJFzCjnC6RrMNmMYjNwlQFR1pMXD3Mzbd9KrYwKbRVminpfBC+S
         eqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772807760; x=1773412560;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/el005jPydhTNUS1hr5dgVCq32s5flSC0Li9+BCYSpc=;
        b=ap/uoe9oRzH0oKJaCxCFaf9uE9sPNzyVFjjFpmHczPo+kCtvUpCjVORZmTF/aqP8m3
         So85v7EOFDthI4J+4YWsJP2d5bnTdazzYG3v1U1ipJBxCrtkfNHWCi1vs60w9ae7l/uT
         kYddgckHLthkCkWV36iK/pTIScN5aHrUB6XOCnnbG3bjv1jkirg1zCNxVyoBEWbC2soj
         wmAss5G/S3FXiI8573vGJizJauO6qtenLltyVZLYjJbKz/G+xEZHk8AxHUR3J4KlLtCC
         tVVCl0qNWXBMCnPY6Z9mrA7gVTeceSjCSUu2deTtFw9zccUKFp8ZYVHiGIbNAcTI8Swc
         vvWw==
X-Forwarded-Encrypted: i=1; AJvYcCVpY6tFKZ/jsct7KEQ6Dows5Y5Zc9XiQMLa4GbaBhWa9v/HUhsBORaUw9isa+ZCPMVlQrrNwhGsJSI4oBYAX4bg@lists.infradead.org
X-Gm-Message-State: AOJu0YzAE3qC9xoEori5vlEZknQjep5bJIAPD1N+t3I1jANKlH+T/B77
	M4yorAgcT56IR/v5D7mUTD8IgsRDebmUvlJ0ctpBho77VaeggNl4fxJqYwONQfBKcTZFlWlfIhE
	yb1alc+TGjkMO+/wLER3tXg==
X-Received: from wrph18.prod.google.com ([2002:adf:f4d2:0:b0:439:cb0d:43ff])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40dc:b0:439:c9d0:5fc2 with SMTP id ffacd0b85a97d-439da891b2cmr4112557f8f.39.1772807759879;
 Fri, 06 Mar 2026 06:35:59 -0800 (PST)
Date: Fri,  6 Mar 2026 14:35:12 +0000
In-Reply-To: <20260306143536.339777-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260306143536.339777-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306143536.339777-9-vdonnefort@google.com>
Subject: [PATCH v13 08/32] tracing: Add init callback to trace remotes
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
X-CRM114-CacheID: sfid-20260306_063601_906352_A9C09047 
X-CRM114-Status: GOOD (  11.46  )
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

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/trace_remote.h b/include/linux/trace_remote.h
index 10ca03dc192b..090c58b7d92b 100644
--- a/include/linux/trace_remote.h
+++ b/include/linux/trace_remote.h
@@ -3,10 +3,13 @@
 #ifndef _LINUX_TRACE_REMOTE_H
 #define _LINUX_TRACE_REMOTE_H
 
+#include <linux/dcache.h>
 #include <linux/ring_buffer.h>
 
 /**
  * struct trace_remote_callbacks - Callbacks used by Tracefs to control the remote
+ * @init:		Called once the remote has been registered. Allows the
+ *			caller to extend the Tracefs remote directory
  * @load_trace_buffer:  Called before Tracefs accesses the trace buffer for the first
  *			time. Must return a &trace_buffer_desc
  *			(most likely filled with trace_remote_alloc_buffer())
@@ -22,6 +25,7 @@
  *			new reader-page from the @cpu ring-buffer.
  */
 struct trace_remote_callbacks {
+	int	(*init)(struct dentry *d, void *priv);
 	struct trace_buffer_desc *(*load_trace_buffer)(unsigned long size, void *priv);
 	void	(*unload_trace_buffer)(struct trace_buffer_desc *desc, void *priv);
 	int	(*enable_tracing)(bool enable, void *priv);
diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 039ba71c3b3e..294d051dcef1 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -863,6 +863,7 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs, void *priv)
 {
 	struct trace_remote *remote;
+	int ret;
 
 	remote = kzalloc_obj(*remote);
 	if (!remote)
@@ -880,7 +881,11 @@ int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs,
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
2.53.0.473.g4a7958ca14-goog


