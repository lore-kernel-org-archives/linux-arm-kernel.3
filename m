Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65033CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 11:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UeiQbqfd+7HFGphDDhTnjWkKTWOQraz9qW3YNATpZfI=; b=2rAfP+CqBW7a9/bxjULX9S+xRE
	k+sziE9YtxpbbKuySnp0ZbIol29zBo4mWKn1JaZfyHqFObnR+i+Y32oO8HWURnRlfxvL52HcLHD3Q
	5K8VxMW8q50Vgw//d9S1tRLkfQhXVTmHrZY0vd1CjzM99ZGN/7vHPYIJOONBpE44pQGxDh7xNR+SI
	uSdfAYNnS0251BsZPGbgTPsi9VJBaCsUKTVXv/7x1ZynIyfRZC8K5pGz05ZEVOigFJ6jarm4sp6Cp
	g53KvOmHltT/OQ17cwMJEFIoOe/k6Uw3U4hxkYOaqRIq91IqYJB74ms1imdqmg6dcw3TcMFgnExZT
	RDvkxvWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3D5-0000000GiDM-18Sy;
	Thu, 21 Aug 2025 11:11:59 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0RJ-0000000GCds-2JHR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:14:30 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3b9e743736dso469817f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 01:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755764068; x=1756368868; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UeiQbqfd+7HFGphDDhTnjWkKTWOQraz9qW3YNATpZfI=;
        b=FaEcvtafXSHbDeTUyRhzZGO+QoOao1GfwtJ/G8pV5i0CBID0Qo+B/LnNM8ApJ0XIKv
         9FQBSIakxoD8E393zlWp6tmdM3o5CmcI8kmNKgIpow8+I49ZVoEQ0FIIzB0KCwdUkgiv
         WBkoHiLk1ARCXlye0S/0qLBCA2daRPEbWbu6Rw8H+3ogauZ2qrFOm7jS27gy37zXg7Lc
         DcQyEY4wQm0/Cwl/RpiqhNOXEkCf/wGd9Gj3CnPXAj/SLXK1aDwyzE3EJpw5Kl4zycI+
         pmk/wvonrdD0aUwtJMmXuF2c7oZ4TjObodD5foLzjs6ipEdXcjy5671zVvJSx/kQMB4R
         r8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755764068; x=1756368868;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UeiQbqfd+7HFGphDDhTnjWkKTWOQraz9qW3YNATpZfI=;
        b=bPf9SLGiUql6Y+ACOcHNmAufuyZQBlKVgVMDhXG5TOLHkT1u6x9JJXxdQDt6lg7iLH
         xsjnfvycmQiI8A+F0OoKkECXYNRCwuEcHznBDKqKgPkvjNoymznQT4AEIz3YKtC52H2f
         8/DM5P3wL7ys8U3t+yYkMvUqC8M6PD6AYYkA3ckuGNIDLncfZ9aG3Va0qUJaTTsqcnU4
         rNTv0LIqtFMgKMP6FVHGP+nV1K1bFfUPpUn60YT0i8ylcTIIdLIZyEb2FBtyFOjkTPuP
         mIDUdiNF7FjEFANT2XSkVzaTcT2JfTV7QXJfFxHqIoBZVawjh2hSpVIP6iMXNEAi5a+P
         rkyA==
X-Forwarded-Encrypted: i=1; AJvYcCXeuiyccT0p4QD7MYbmRDYk84xH4MNvHqlxJdZHcZy+hUiGZWBKRZ1RiiogsRR3OCCt/iaCyYHR2JtxcpIG4ScX@lists.infradead.org
X-Gm-Message-State: AOJu0YwbOl/y2n9y1ZeRsgaxZDfyGUV7S6m9Ov69xXBKjtayNcNUrW8z
	gTXbyUFPKO0ID7MhQ7vdZYF9597vT6/rJ8wVQqhw2p9bkxk8iQQ6+6pUVHCKrMVN7mPZNBM71+P
	/2Ky97gvEACTsx3jmk9pNQQ==
X-Google-Smtp-Source: AGHT+IGPZ/UWfrK0SR54G2w2/hGND79Jxl9Aw93toJ+uqNkdy6qzcC80bA5lVYDqpW5CNdXw1Cx3m0UW7vJbU9iY
X-Received: from wmqc21.prod.google.com ([2002:a05:600c:a55:b0:459:dbaa:93aa])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2f86:b0:3b5:e714:9c1e with SMTP id ffacd0b85a97d-3c494fc5dbemr1259176f8f.12.1755764067796;
 Thu, 21 Aug 2025 01:14:27 -0700 (PDT)
Date: Thu, 21 Aug 2025 09:13:53 +0100
In-Reply-To: <20250821081412.1008261-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250821081412.1008261-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821081412.1008261-6-vdonnefort@google.com>
Subject: [PATCH v6 05/24] tracing: Add init callback to trace remotes
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
X-CRM114-CacheID: sfid-20250821_011429_633570_F263F36E 
X-CRM114-Status: GOOD (  10.17  )
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
index 1aa99da3c96a..82d26d97a536 100644
--- a/include/linux/trace_remote.h
+++ b/include/linux/trace_remote.h
@@ -3,9 +3,11 @@
 #ifndef _LINUX_TRACE_REMOTE_H
 #define _LINUX_TRACE_REMOTE_H
 
+#include <linux/dcache.h>
 #include <linux/ring_buffer.h>
 
 struct trace_remote_callbacks {
+	int	(*init)(struct dentry *d, void *priv);
 	struct trace_buffer_desc *
 		(*load_trace_buffer)(unsigned long size, void *priv);
 	void	(*unload_trace_buffer)(struct trace_buffer_desc *desc, void *priv);
diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 18b2930186cc..8f8eb1f1e889 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -482,6 +482,7 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs, void *priv)
 {
 	struct trace_remote *remote;
+	int ret;
 
 	remote = kzalloc(sizeof(*remote), GFP_KERNEL);
 	if (!remote)
@@ -498,7 +499,11 @@ int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs,
 		return -ENOMEM;
 	}
 
-	return 0;
+	ret = cbs->init ? cbs->init(remote->dentry, priv) : 0;
+	if (ret)
+		pr_err("Init failed for trace remote '%s' (%d)\n", name, ret);
+
+	return ret;
 }
 
 void trace_remote_free_buffer(struct trace_buffer_desc *desc)
-- 
2.51.0.rc2.233.g662b1ed5c5-goog


