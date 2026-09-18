Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D41C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lo1KsoI1XuIoEcDs+Ce0ZXJLIqJlsl+upMRklAIDXKY=; b=eAjT9/ClexLp4U3+tRdinVy8tf
	yl217cVta2tGfYh6MGPUD+l033gLdJIBz7dKnk3/hMrzo5nf44h+ySvzKWHMMqD5qUUSTOufRciuF
	Tb2GyFD0C0BQ9iLpeIc6r0d4XS5krAZJ6hCRRU/oANUMPJ+TGyDeRZm2PJHWvRMPQftvFYfKsUQoR
	Ct9aCAaaGr/j1HO8OX8bK/ZWqnAVJ+Kcw3f2Cl2ZAuGPGX7zFkcJPDYam1aJo3x4J/d3ELo/S5HzA
	7M30CSbQKEgcUCc3viiYU4mXnE+DFQDRfMhwlGLVwywYNQ4f0dc/Ty9G0NJwJFytZFKxPtSU5Rjva
	alRZvwfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YUh-0000000EUEL-3gGy;
	Fri, 18 Sep 2026 13:19:11 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YUa-0000000EUAi-2PfO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:19:05 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-49ccfad90f1so5968615e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 06:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789737542; x=1790342342; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lo1KsoI1XuIoEcDs+Ce0ZXJLIqJlsl+upMRklAIDXKY=;
        b=GEyqG7xAIOhVEz0eyVqoK0Y+RdCfYxz/jPB1+hbatBI+gOOBGUqqYUcrIU9L8A/U/i
         z5VmwPcMrpImkkkhlSyMrUVndq1qDnTQ/UFIB5GWuw7GwHAy4wP3ZjXYiSlGNtQSV4KQ
         sVztF+bcmi4iuHQlBFrS+9czEaAhODo6sSgX7ZrEHN3Wl2V8xiRineynArXq5xs1IGNu
         AtDp5UOf6sNlqYf3tfeMnTpwN2IKbLm+KivIj3SD4gRThBCIIjSHbBKWJndW/P+OxpCM
         PovX9EER39Gr2jyAWt3KtsObnZ1FrzR2L6yfzzuFy0eeYWg4x4M/WF7qnLZPLsZS4H/2
         779A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737542; x=1790342342;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lo1KsoI1XuIoEcDs+Ce0ZXJLIqJlsl+upMRklAIDXKY=;
        b=k7fQiGg8g0MGqppzo0+AMNhgk8K7JBzG6tXdMwW4hUbfkj7tgxrJ5BmmYYRkq8wjta
         qNySg2YkKdFPH+7dHCo3pz+hKgwHnUH1TwH524ujE+ADNS6XZMpOeJqCGBS5lRh5YY/b
         o/1/p9n7Nk6coxglpKChqzE+6byHaf9bakeUI9QHE4J5fVGDWFEjWr8R97m7Bkiwq4hL
         Z8U5SgjTS2om+0AbTGw3hmz+X7fnrlZb1ZnMwtiVKAT7F2OH4+kPOx9dDLJXp1k8cPKS
         6TV4rEdQv2O2gggR0A9Fsjl5WolS0LJyKkojRaGFj/U5zWq/+ATXkaF+0aEkng3K3VkQ
         K4Bg==
X-Forwarded-Encrypted: i=1; AKwUvBxLgFpRqTTkUFWZk1fckHnd46fyWm4sm6zFnQfF3aLER0xQdx7YV0+063ykI6H4CdEuG/Pb2eWlq7MWDFYamUCV@lists.infradead.org
X-Gm-Message-State: AFuF++nD+fnvBfwMm18GqdJ2FiMDxUG63wUECHf1Mdtb1YjPwQdsf6qC
	f3V/8P3IuVp1ja8UDebCgzf3Mu2I50KmIlKIvGzi+f5skYnBmzhFfPgc7cUit6uAyWD9dJFXyLu
	DneS+iWB7wGapMA2gCO0sFg==
X-Received: from wmbje21.prod.google.com ([2002:a05:600c:1f95:b0:49e:6e7c:4200])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3550:b0:49e:7d74:7b7a with SMTP id 5b1f17b1804b1-49fc56db8f3mr33347175e9.6.1789737541522;
 Fri, 18 Sep 2026 06:19:01 -0700 (PDT)
Date: Fri, 18 Sep 2026 14:16:53 +0100
In-Reply-To: <20260918131656.3710047-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260918131656.3710047-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918131656.3710047-2-vdonnefort@google.com>
Subject: [PATCH v1 1/4] PM: hibernate: Add arch specific hooks for hibernate_map/unmap_page
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org
Cc: mark.rutland@arm.com, lenb@kernel.org, pavel@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thierry.reding@kernel.org, rppt@kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_061904_628577_2CEC08D3 
X-CRM114-Status: GOOD (  12.56  )
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

hibernate_map_page() is called from an atomic context. This is
problematic for Arm BBML3 systems where the linear map may contain
blocks and is allowed to split as splitting is a sleepable operation.

Add arch hook so arm64 can define its own implementation without relying
on the direct map.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 include/linux/suspend.h |  2 ++
 kernel/power/snapshot.c | 10 ++++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/linux/suspend.h b/include/linux/suspend.h
index b02876f1ae38..10fe2298d94e 100644
--- a/include/linux/suspend.h
+++ b/include/linux/suspend.h
@@ -401,6 +401,8 @@ int hibernate_quiet_exec(int (*func)(void *data), void *data);
 int hibernate_resume_nonboot_cpu_disable(void);
 int arch_hibernation_header_save(void *addr, unsigned int max_size);
 int arch_hibernation_header_restore(void *addr);
+void *hibernate_map_page(struct page *page);
+void hibernate_unmap_page(struct page *page);
 
 #else /* CONFIG_HIBERNATION */
 static inline void register_nosave_region(unsigned long b, unsigned long e) {}
diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
index b209712cb2c3..b41952f1de2a 100644
--- a/kernel/power/snapshot.c
+++ b/kernel/power/snapshot.c
@@ -85,7 +85,7 @@ static inline int hibernate_restore_unprotect_page(void *page_address) {return 0
  * It is still worth to have a warning here if something changes and this
  * will no longer be the case.
  */
-static inline void hibernate_map_page(struct page *page)
+void * __weak hibernate_map_page(struct page *page)
 {
 	if (IS_ENABLED(CONFIG_ARCH_HAS_SET_DIRECT_MAP)) {
 		int ret = set_direct_map_default_noflush(page);
@@ -95,9 +95,10 @@ static inline void hibernate_map_page(struct page *page)
 	} else {
 		debug_pagealloc_map_pages(page, 1);
 	}
+	return page_address(page);
 }
 
-static inline void hibernate_unmap_page(struct page *page)
+void __weak hibernate_unmap_page(struct page *page)
 {
 	if (IS_ENABLED(CONFIG_ARCH_HAS_SET_DIRECT_MAP)) {
 		unsigned long addr = (unsigned long)page_address(page);
@@ -1456,8 +1457,9 @@ static bool safe_copy_page(void *dst, struct page *s_page)
 	if (kernel_page_present(s_page)) {
 		zeros_only = do_copy_page(dst, page_address(s_page));
 	} else {
-		hibernate_map_page(s_page);
-		zeros_only = do_copy_page(dst, page_address(s_page));
+		void *src = hibernate_map_page(s_page);
+
+		zeros_only = do_copy_page(dst, src);
 		hibernate_unmap_page(s_page);
 	}
 	return zeros_only;
-- 
2.55.0.1082.g2b9226bbc0-goog


