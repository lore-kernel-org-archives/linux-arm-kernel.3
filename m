Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B5EC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 13:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iy152RdCZfa3BuEh7IM6k3QBkRdl6kOpMlXoFvVNGkU=; b=JOyfyUK0GdtqySeiZVhxUc7ZBx
	ljpCwwxwiYhn1RcSWFd2zjTVkcVsyX2Whm0kpPGyz+ttJz/0G7q4r6C9bNIvw8OK2GOcnqYCMbI1V
	NAau5j7ipVvkkiuzus1uC05QyrURG2JsuLCzfi2RQXyw712ehp/G+3N059bJpO2CfVCWOSUwkqMoY
	WcjmDF2ABFnKSz43gwMm5SB3rREijksybneZvsI/HJ18hqYKlJsfg564LPrQzRJFiTueb1YxYRQb5
	mOlk9nU9BNDA8UNPDHcLH9reG18OIMhnlyfZdZtEfVxxqJIBzfUs0+aTGzUxkv57Yxwv7sng7DEw+
	6sFucQ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxmAh-0000000EYZU-3vdL;
	Sat, 22 Aug 2026 13:54:07 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxmAf-0000000EYYF-0HKZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 13:54:06 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-49953abe51fso10550345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 06:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787406842; x=1788011642; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iy152RdCZfa3BuEh7IM6k3QBkRdl6kOpMlXoFvVNGkU=;
        b=DEvRuWAroWFa44ia4TCf3UcrOJhe48Psmfd7D7zwf3uKBgo88bvtCRngsuzrZMKml8
         xV/a8+g2B8Z8ue49PkkGKrKl+HjPBRZqXskSGOqEhx5/OpChW7A7S8Mm296H9E7wI3eQ
         xivqtAuKXp+8L8UIzZDktBauMQMUTejEGZLoGVyJLvX1zYPv5brjAZ4hH0+CN97cNTMA
         tz9hHLWvSU3ZwvarDOUgGi8F7HCUwrsKFpTlSm/Szs+9e5x1wy1ReRcPhcFa+cj+XlOk
         Aezs5Ol5vla3+E0dPLiFJoY6r0J5tFy52HcCq2D/JoKvDGtyZrU5NQsZuftVdhNJ2b27
         caeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787406842; x=1788011642;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iy152RdCZfa3BuEh7IM6k3QBkRdl6kOpMlXoFvVNGkU=;
        b=ZzrcjlFhLDBkTMFRecxZk9FX3iknEMxrhpBb2GYbAkzVHD47sTb4Hm4rmzYnVU0KXK
         7zOVMBnt16GmKRrVG4ZRyb6TIy9+ElvIwcDpnMMCRa07cc1m6rSmnZ9Plp6PkIS19xct
         vtQWfwqI8HcWAP0SkU9qsK8y61+JSZB4JyMZ+8kD/KJeEisQ698cOrRMa5bmkM8p7puV
         aclFnrWgcPzJJIhAtgo1BPGggMlaTwm88LERLITOVuV+0lsz5PWJvlZjI8MGf58qLzd6
         HQoRF607gLysREN3kzsW0GAUcWzCSfW6Eku+wU8WPN6wxmpFN49Ni+xCwXEsOERlXPgE
         TQ4w==
X-Forwarded-Encrypted: i=1; AHgh+RoT4fql6HZ+cF/U6hyv1RdyDdmxltEYTfVnxAw8hmcridHmto8M6NdZAi2EdY3kX1Z71x71qORGRnrjjn/mgA0x@lists.infradead.org
X-Gm-Message-State: AFuF++mwHh4JezZZun7AlVh9nGvKLRJ0pBCY08oZDu/S+L12ZPAGUg+K
	2IxwLB6hEAKI4xfMaGbJ1IMsxbKJ0FASTpay2jrcTw9yelzaT5B5+V+ZYLnD0FWoFd1HbYG0Dg=
	=
X-Received: from wmbd17.prod.google.com ([2002:a05:600c:58d1:b0:499:c849:1518])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1552:b0:499:49f3:77b1
 with SMTP id 5b1f17b1804b1-499c19ad953mr53970335e9.3.1787406842383; Sat, 22
 Aug 2026 06:54:02 -0700 (PDT)
Date: Sat, 22 Aug 2026 15:53:23 +0200
In-Reply-To: <20260822135323.795946-11-ardb+git@google.com>
Mime-Version: 1.0
References: <20260822135323.795946-11-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2988; i=ardb@kernel.org;
 h=from:subject; bh=B9vd29okea5ocqXwmV5m+3LPo6WPI7iW8XzHP/zdLDo=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIatz5dVpa7gmF+04XHXv0Ldtx/jvSMk88RI+HWdutLtap
 Wi5rVx7RykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjIpTSG/xktVZWhn+fx1iX+
 bvjnnZkok/3UO9r1gvf07LoHPi0HXRgZDsyUzJr3gL341aYFm75+/P88IPjPqYkbik+7C0pNn/V YjA0A
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
Message-ID: <20260822135323.795946-12-ardb+git@google.com>
Subject: [RFC PATCH 1/9] mm: execmem: Add API to split an existing execmem
 cache allocation
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_065405_145621_772755A6 
X-CRM114-Status: GOOD (  15.75  )
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

From: Ard Biesheuvel <ardb@kernel.org>

In order to permit the module loader to allocate MOD_TEXT and
MOD_INIT_TEXT from the same chunk of memory, add an API function to
execmem that splits an existing execmem cache allocation in two.

This will be used on arm64 to avoid .text and .init.text being placed
far away from each other.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 include/linux/execmem.h |  9 ++++
 mm/execmem.c            | 44 ++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/include/linux/execmem.h b/include/linux/execmem.h
index 7de229134e30..59bd862cb061 100644
--- a/include/linux/execmem.h
+++ b/include/linux/execmem.h
@@ -178,6 +178,15 @@ void execmem_free(void *ptr);
 
 DEFINE_FREE(execmem, void *, if (_T) execmem_free(_T));
 
+/**
+ * execmem_split - allocate space from an existing execmem cache allocation
+ * @ptr  - the existing execmem cache allocation
+ * @size - the size to carve out from the existing allocation
+ *
+ * Return: the address of the carved out allocation, or %NULL on failure.
+ */
+void *execmem_split(void *ptr, size_t size);
+
 #ifdef CONFIG_MMU
 /**
  * execmem_vmap - create virtual mapping for EXECMEM_MODULE_DATA memory
diff --git a/mm/execmem.c b/mm/execmem.c
index 084a207e4278..6db0c1d82a9d 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -439,6 +439,33 @@ static bool execmem_cache_free(void *ptr)
 	return true;
 }
 
+static void *execmem_cache_split(void *ptr, size_t size)
+{
+	struct maple_tree *busy_areas = &execmem_cache.busy_areas;
+	unsigned long addr = (unsigned long)ptr;
+	MA_STATE(mas, busy_areas, addr, addr);
+	void *area;
+	int err;
+
+	guard(mutex)(&execmem_cache.mutex);
+
+	area = mas_walk(&mas);
+	if (!area)
+		return ERR_PTR(-ENOENT);
+
+	if (size >= mas_range_len(&mas))
+		return ERR_PTR(-EINVAL);
+
+	addr += mas_range_len(&mas) - size;
+	mas_set_range(&mas, addr, mas.last);
+
+	err = mas_store_gfp(&mas, (void *)addr, GFP_KERNEL);
+	if (err)
+		return ERR_PTR(err);
+
+	return (void *)addr;
+}
+
 #else /* CONFIG_ARCH_HAS_EXECMEM_ROX */
 /*
  * when ROX cache is not used the permissions defined by architectures for
@@ -459,6 +486,11 @@ static bool execmem_cache_free(void *ptr)
 {
 	return false;
 }
+
+static void *execmem_cache_split(void *ptr, size_t size)
+{
+	return ERR_PTR(-ENOENT);
+}
 #endif /* CONFIG_ARCH_HAS_EXECMEM_ROX */
 
 void *execmem_alloc(enum execmem_type type, size_t size)
@@ -511,6 +543,18 @@ bool execmem_is_rox(enum execmem_type type)
 	return !!(execmem_info->ranges[type].flags & EXECMEM_ROX_CACHE);
 }
 
+void *execmem_split(void *ptr, size_t size)
+{
+	if (!ptr || !size)
+		return NULL;
+
+	ptr = execmem_cache_split(ptr, size);
+	if (!IS_ERR(ptr))
+		return ptr;
+	VM_WARN_ON(ptr != ERR_PTR(-ENOMEM));
+	return NULL;
+}
+
 static bool execmem_validate(struct execmem_info *info)
 {
 	struct execmem_range *r = &info->ranges[EXECMEM_DEFAULT];
-- 
2.55.0.860.g4b6b3295ed-goog


