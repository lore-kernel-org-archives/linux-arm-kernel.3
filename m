Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68D4CA5FCD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUIvVU+0Or2i50OK5aEmy7zfuDDVyaBvx88xnEwYFu8=; b=AgjPz/1Hr4+kvqJBqwkG2LODWI
	YcOPq2ROSfChcxxdW+OAQSPlpmLAeabudDaSGfwbRmurX5ijM9vwLjGpq3V240rIiZaCet9etaSra
	NBSKcok58OgbxHS66qbgeKKB6BdkyN0dAHOJ6BLZem630WG++w5rqSWlAz5J5aSoc22nIe+/iwyfv
	+3pbPXnVkTjt7lqXy8yT/8E5oIiYYbFFoON53RvcavYCk1OGqWyQajAbKV4PoSPt7BjslEjmXLfDV
	pdb0kvizNzqNvEy/wqF9I1ydQFaQPqW9NKINSVG7nknjRb0J8nUT2TZuNdd4AUWDZXU1ZJmak/KTe
	iDqh/t1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwLJ-00000006XKG-2MlD;
	Wed, 30 Sep 2026 15:35:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwLD-00000006XHk-0ej4
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 15:35:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jUIvVU+0Or2i50OK5aEmy7zfuDDVyaBvx88xnEwYFu8=; b=bD9nszNkwSr7ZD8onXY8TUVW/L
	7Q2YN8Um7w+8r9ODTGeDZ9War4+CkD0hYVaAS7Kq1IGPDeJfcxEmi4jYxrRXpJu+3pVbc7CUEeTCA
	C9EOMBHRdIRWA68j3ukZc7anLZPAtPkPVD9IDvEklJ34n2zDg6OVc/Lr8aNuzAZLCNAiJdbHiJREp
	fSh8HKO9pMRMw1vARKc8WEBkGQOACcIHgJp/ObiLX4qHfeB4SxyZA5yy8Eh4bXKizHzR52q3FlbLW
	gBvjTBIFDPzCIu7oAKjWtXLMrWzh3ZSZvdxlcrGz+rQfq2sVmTkxFnuHutwwdzIYMjwJmW4ikXbnm
	/sqmjOKw==;
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBwLA-000000040YN-0617
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:35:30 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a0032846d7so2793515e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 08:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790782526; x=1791387326; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jUIvVU+0Or2i50OK5aEmy7zfuDDVyaBvx88xnEwYFu8=;
        b=e4EVKntuKPvA/DuSQ44d2TEymD3FFTbPJk6SY218ohofbo6Udz/Ghm1QqecLoCttcQ
         xv2wl5kCHgT4d5aHVcKi+4pK1S+Vw1liZYbxM9Afo2nbty6LSKfHAiV5QfVimmLh0KwQ
         3ukCwiov5nHzfGJ+nf1a3wQKzSHeQk34t4cdJ9wbQHR7vYD8MGM7vcbE8fxPwL7hYmqv
         mBvuL/h/F5Ex+azgVaw63gReaI7RvbZ0IYFWgIUx+DRcmD8GysKGW4CzGBALuRgtqUk3
         3ouh5GWwyNJUgE1Y5EYAJfqrt4SMaGZQ4WAFjn6BsQ3I8BLC/gDOz/tBc/hHF1w7Kuuu
         9z2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790782526; x=1791387326;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUIvVU+0Or2i50OK5aEmy7zfuDDVyaBvx88xnEwYFu8=;
        b=pmntdWWAC/KEuMZV0y1kUK6uW1zghbCqedGYUJyxdcBQv7yofahVPtr3HEh0u/b4ZF
         u/CADVHZIZwFXaqksq6fTzyCerYJV6dZk8LNsWI5XOryyJImGLVgZXEGkLjYOo0B9JTT
         l971c8gYwL9iCl4uBvk6D05+3QjWZaGr6YrjuCAHCwM8i+ZseoDddMjfxRsDETA/EYks
         znBXT0oBj0x1wCX0wF4Vh4ac3wTId8RK5bm4GxSsynFIWqw8ZVjTB2eWx+iWJY1vKvBi
         dIu6pvavm0CNqFrq1S9vIjdLIBY4lTnAewFIaZme7MKW1nCtA1efmsWpwni2+7EKdWEA
         Lb7w==
X-Forwarded-Encrypted: i=1; AKwUvBz2YnYikG6tEQ1UwplO+uzluE6P3hOXQD8W7a8xp33G03lcLgpvwH/2v3Qsbel4vxe2ZhimVjxkteUYqliFhVUg@lists.infradead.org
X-Gm-Message-State: AFuF++kRZuZdhNBEzfxC3eYgVf2Fkh4wdzdqkH0+8SbDxsdgRAZT9Eac
	AowRvJ4rVaUQ/iZNoFTgGIJAvLwOj2PlUre7l5l/xSbf/GIYdT7YfRHXg1FOcSlKy+sfnh95GyF
	cJdsl9XsjwbRSiBFovanV3Q==
X-Received: from wmep22.prod.google.com ([2002:a05:600c:4316:b0:4a0:626:c24f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f55:b0:49f:f0bd:1e40 with SMTP id 5b1f17b1804b1-4a01b11ded8mr34376735e9.23.1790782525939;
 Wed, 30 Sep 2026 08:35:25 -0700 (PDT)
Date: Wed, 30 Sep 2026 16:35:04 +0100
In-Reply-To: <20260930153505.2144559-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260930153505.2144559-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930153505.2144559-4-vdonnefort@google.com>
Subject: [PATCH v3 3/4] tracing/remotes: Add REMOTE_EVENT_CUSTOM_PRINTK() helper
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_163528_175914_07C075AC 
X-CRM114-Status: GOOD (  14.35  )
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

The current REMOTE_EVENT() takes as a __printk argument a string format
and a list of arguments, such as RE_STRUCT("foo=%d bar=%d", foo, bar).
Add a REMOTE_EVENT_CUSTOM_PRINTK() where the __printk argument can be a
function. This intends to support the creation of a "printk" event for
the arm64 nVHE/pKVM hypervisor with a dynamic prototype and by extension
a dynamic print format.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Acked-by: Steven Rostedt <rostedt@goodmis.org>
---
 include/trace/define_remote_events.h | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/include/trace/define_remote_events.h b/include/trace/define_remote_events.h
index 676e803dc144..4f4d58e37b84 100644
--- a/include/trace/define_remote_events.h
+++ b/include/trace/define_remote_events.h
@@ -35,17 +35,26 @@ do {											\
 
 #define RE_PRINTK(__args...) __args
 
-#define REMOTE_EVENT(__name, __id, __struct, __printk)					\
-	REMOTE_EVENT_FORMAT(__name, __struct);						\
+#define REMOTE_EVENT_PRINT_FUNC(__name, __printk)					\
 	static void remote_event_print_##__name(void *evt, struct trace_seq *seq)	\
 	{										\
 		struct remote_event_format_##__name __maybe_unused *__entry = evt;	\
 		trace_seq_puts(seq, #__name);						\
-		remote_printk(__printk);						\
+		__printk;								\
 	}
+
+#define REMOTE_EVENT(__name, __id, __struct, __printk)					\
+	REMOTE_EVENT_FORMAT(__name, __struct);						\
+	REMOTE_EVENT_PRINT_FUNC(__name, remote_printk(__printk))
+
+#define REMOTE_EVENT_CUSTOM_PRINTK(__name, __id, __struct, __printk)			\
+	REMOTE_EVENT_FORMAT(__name, __struct);						\
+	REMOTE_EVENT_PRINT_FUNC(__name, __printk)
+
 #include REMOTE_EVENT_INCLUDE(REMOTE_EVENT_INCLUDE_FILE)
 
 #undef REMOTE_EVENT
+#undef REMOTE_EVENT_CUSTOM_PRINTK
 #undef RE_PRINTK
 #undef re_field
 #define re_field(__type, __field)							\
@@ -70,4 +79,8 @@ do {											\
 		.print_fmt	= remote_event_print_fmt_##__name,			\
 		.print		= remote_event_print_##__name,				\
 	}
+
+#define REMOTE_EVENT_CUSTOM_PRINTK(__name, __id, __struct, __printk)			\
+	REMOTE_EVENT(__name, __id, RE_STRUCT(__struct), "Unknown")
+
 #include REMOTE_EVENT_INCLUDE(REMOTE_EVENT_INCLUDE_FILE)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


