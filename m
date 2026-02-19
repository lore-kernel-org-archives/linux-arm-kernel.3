Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A38BE9A04C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 15:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPS7WRrkBIoNMvCZPX+Css0sPZz9dHMI7aeVzVXuEDI=; b=xJ5wvyuEGWE7DrX588sHhwYgpy
	jsyiPyThgkLBtZvKcgb8o5Ia7YYX4kK42tVZFiDJCmQ7pJZ3VeJstvK4OcSpuTOzVWes4N2eh4nRB
	+OWk06xCpy97AQSiBPHgWaGdfw0etv9IKa4pOAa/73pDjrpw481VMJIpdA2e7xNMz752OUQH+30ZT
	2zEkxdxDkllI3delgOKUaqdIrt70oOlEDmK14m1Hc/SALk1YdXocwlfaOYwL1XGiYz+hglxsjyy2X
	+3Hq6VtFKou3FirbLdZt7SvAZ2bpXIL9mfZHsFueJjH/3qOeorEGdvSGDOdA0JS0tQCjJb1E962oG
	ngsL+8YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5Z4-0000000BUqv-3ADL;
	Thu, 19 Feb 2026 15:03:38 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5Yw-0000000BUhG-0GyY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 15:03:31 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4836bf1a920so12125605e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 07:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771513407; x=1772118207; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jPS7WRrkBIoNMvCZPX+Css0sPZz9dHMI7aeVzVXuEDI=;
        b=lIBkwNGupRIRIWQogExzH8RTgXnMhrYrKr4CeFGuk61QlXzR3k3X6FN8mpafPeUoM3
         t5/ycn+65km+cAvnmYr9sJ/ci1olD/umppNCZf+ZS41xCncmcUMVUaEvlp6+TI/kZkMT
         i9HOaNwI9O2wP6hyQL5jSKQ3HRr9qdzihSl/RwdkhGhx0Qrl1/36SCCHbBtogxM0slQy
         iLjvN2iSrHBha+SADuG5V7pZ1PWs3hkrFRtFmyD1xkJZQOIh/7myMUsWWw280St7ZDwt
         6mP2eqhNK9FKbTpGL1fRCAgYFTpCPY+JdZ87AnjD34HiO5LLcELUkwLnaimMUmk9emTH
         ZFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771513407; x=1772118207;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jPS7WRrkBIoNMvCZPX+Css0sPZz9dHMI7aeVzVXuEDI=;
        b=Mqww04kS0lVMCjSmBqLewelts04obp35uKxye7BOiFOCvLBLCWuL+nl3Zie8mxPZzP
         Wh5aBKmrj5ZNGhSyN7Dr6msAAcTNJwnJX4RySZK5PB2p+JbuboHL249C4BTjxt7M3wU1
         8P4uamrxrdcwETs+uMlWkIkFc1ZElAotB5irSWT7pVAxTfQEY80K65CCXl9K9z5hvZJ4
         qIVbGuGlA9w7ow3Whokg2Xrk4z+U2HAzI5kaPKbZa8tls5/dYLqBLiL8TTnCbH2QDIUE
         RXFKT5MOmMYkHmnI+LW91CowKh8pq3WmbDuMiQcrvTgb8ppvGNZGBynNzGOAFyim3V8V
         oAyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9YYVg7ojhXhCYCXSLI4ngeW2kDUbSpNusryKCqx+wMdbWb63+3YuB05Hjx1pcULqz/W+vUPsJjAYc8sq6jDu1@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy91o6bLwds2P0K0cCERPxD1QWhVTplSWWhXkS4SaRdPz4f9os
	NFjNK85CC9/orhR/msbKXIj4S5a36fqoFRhViqORb/Gkxy4Qqi4jLefPggyLU03FsLAKfXVRPjg
	8RaRRmzofw5ktfG8mg2LmSA==
X-Received: from wmbdr17.prod.google.com ([2002:a05:600c:6091:b0:480:4a03:7b73])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:154f:b0:483:3384:a873 with SMTP id 5b1f17b1804b1-48379c15d86mr301886815e9.36.1771513406508;
 Thu, 19 Feb 2026 07:03:26 -0800 (PST)
Date: Thu, 19 Feb 2026 15:02:45 +0000
In-Reply-To: <20260219150307.14538-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260219150307.14538-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
Message-ID: <20260219150307.14538-9-vdonnefort@google.com>
Subject: [PATCH v12 08/30] tracing: Add init callback to trace remotes
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
X-CRM114-CacheID: sfid-20260219_070330_141782_429D197C 
X-CRM114-Status: GOOD (  11.80  )
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
index 5147ebe3f0bb..4e2f9259c814 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -863,6 +863,7 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs, void *priv)
 {
 	struct trace_remote *remote;
+	int ret;
 
 	remote = kzalloc(sizeof(*remote), GFP_KERNEL);
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
2.53.0.335.g19a08e0c02-goog


