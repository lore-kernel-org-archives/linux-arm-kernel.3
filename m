Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591E1CF65D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2udmx+4SJHsFMJWVRdW8n/HMzlAkQIzlTSPPm28eNE=; b=yIlR06bJgjyuqGVyUV8nIQV0BK
	2/0NhfWbtjGwck41HCBHsGrPxTFqa8ccVGi59fVQq/peaO2d1G/NJ13YzqZfCCRsiV0LERn9RNIWQ
	uDynxbZXsxp87KcjAl2lNf2AQh6IqVuudpsH68CVksLhOknFmEh8e6keJlxitJmyNuOXShXfgA0Gq
	7Wzl+YUPhgOeyhZZOEjPz/JjpeFyBh3vOmCcD+Iuwlz6sqIRckodM1HvKxhAg9TQHoYwC4GIV4ALm
	BqnQs88LRYjMLhEMyLfmpbtLmqKUZf/ag+sS79UkazFswJDFltE3AmS0J4gD9NIo0efj74GpNtmTi
	DmzBnkLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5L-0000000CJVR-0cFd;
	Mon, 26 Jan 2026 10:44:43 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5D-0000000CJMj-3Q2A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:44:37 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-47d4029340aso56591915e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 02:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769424274; x=1770029074; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L2udmx+4SJHsFMJWVRdW8n/HMzlAkQIzlTSPPm28eNE=;
        b=B/nLT5RPCkGnN0yCIsLFGQfKtrCWD+0t9e7DkxCI1iwJpWdyWwFfV/cOdqPhv2UJ+J
         A+kBOEXu67WWdAjzdjS3BHMnzIfFXluCrywNCcgU5IaBPB9F7KEAbgU7oSTm0E/2QnIU
         w6sNW52B+Y4se64M0UvxGXnJb70aAkQCESkiusWlWODmxRoS3oi83qYlXEO1bi57HGRs
         1XJ4v+HV5eGxZV3ht6hbj1BmNF5Rnart2+dwFZFUH8BQmhl+K3WZ5M2bZzZIThs2LE50
         3clEhlrQ7XMHDX5wpgTMbM7BR9dn1TPBjd3M7RkH9l6nvShw1bVM9ZXu/FXUABoCMPhS
         7ayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424274; x=1770029074;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L2udmx+4SJHsFMJWVRdW8n/HMzlAkQIzlTSPPm28eNE=;
        b=VesQVgBPdm4rqWxbEoCma7qriopzc0U70XcZqZ6bCJOi+PeOM89dA9FicKoMTQp57g
         OtoZ0RU6aNo7VEUOwtuHve+Obo8kLLOWApJtMM/spOotHlFeYcFCP39a9BuAwqPEvTyX
         HxVQuWcf9wHi1riwg6uo8zk0PJAVQ0rlr73yEdl0kvXeOprC4W8eYUujDQOcNrqFHd+c
         MNQzfwK3Ndeuxvac8Qs9I4EEXL+NhNIEXJPZJsvbYFUhUBDZi/6vxRH41K9nwN6k3HJa
         +/aNJB8uIQSSHvDo2YU0qnaldVSV209L/2n/EAsKLCWqJQisryl0cLTjRTO9m53iuA9z
         yQNg==
X-Forwarded-Encrypted: i=1; AJvYcCXpm+kGz5046sZIZACTyKL6w7E4gavP8e4151HPWvrOAOOvurWms3WCbYr9wRITCFe7PeIczw7stjzf1yy2Zk4L@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf74G+MKA+kikxMKp/TniRKgKJsxtN4hje4Y+gezNuHZeGHvqz
	U2fP6AehTjudo+qwNh8Coc501CqE2al677plFvayM9Xns+ptyz8t7G/t6sQNZMvgvNm5mkXfYx7
	emg9Su3DgsXoXOuf2j4ZBGg==
X-Received: from wmpk39.prod.google.com ([2002:a05:600c:827:b0:480:4a03:7b7b])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:500d:b0:477:7f4a:44b0 with SMTP id 5b1f17b1804b1-4805d06c44emr66099755e9.33.1769424273803;
 Mon, 26 Jan 2026 02:44:33 -0800 (PST)
Date: Mon, 26 Jan 2026 10:43:57 +0000
In-Reply-To: <20260126104419.1649811-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260126104419.1649811-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126104419.1649811-9-vdonnefort@google.com>
Subject: [PATCH v10 08/30] tracing: Add init callback to trace remotes
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
X-CRM114-CacheID: sfid-20260126_024435_914714_741BC1A3 
X-CRM114-Status: GOOD (  11.57  )
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
2.52.0.457.g6b5491de43-goog


