Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8F2CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qi1oGcfy2F/V9hqGyvfMuBPdpU5/rEAVHW7aQyISR+Q=; b=F4ejBegrGQE9jOcDmePBF6UOMW
	WESPoQl/RP4KbCpl1elXJov+QrGtCuifzBeZtiQo4oSROLL/i5Cr7t7fjj9HPTllPKGg5axslfjUV
	j15aTFcDO2bR3u4Jooe4HTk0vT+n2JF2Ek8bvuq5MmAxagM9MmaJGV/AlRSJYhLvBA1qQLGJ6SYYa
	BgkptCj8fiHtsKjbn2vA5CpBk5MQxoMqm3kwNPJH8eNUKhqJSZunVd8vcO+HZ59+JJQw+h9limTbV
	Hd8u0c+U1pLBATr4F6vr792irjwL8gikbS0ZXkj2+tQOTF+8PYb3tXAqWSed+Qnxxw3Qgz59savgN
	uOPDZe0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMDd-00000001yzA-1rbv;
	Tue, 19 May 2026 15:18:53 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMDT-00000001yme-3Orw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:18:47 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-45aeac88af4so3096711f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 08:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779203921; x=1779808721; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qi1oGcfy2F/V9hqGyvfMuBPdpU5/rEAVHW7aQyISR+Q=;
        b=iHTjMj0pMLFhreq8eGLBCSIpI3wF/Du5u7PHyxrgiCkcQhVf4uHRvnD1AYz6jVBp0Q
         65fHniXEv6o39NWn9Bk7YjQlpMrJehkRHYEWpTH6vQbBfmkrQBm9x0CGETxRG7d6PbV+
         GNB+gkRdwEnWXFwfGUQlqf6NJN9H+93s/6lW31sm3QZ6z1d6b2WrJR5qXODnY4PltDNF
         6417hJ6qDO6RfM3cEg02BuM0p+obqpGgMhEG1/zn/tE0sLm16pL+7/KDC+pVJjDzBd5s
         jSKTYtpq3FVj6X6w5fm3LNtZc+SKdpWt9qurTXnZPf/OPXCAFokbeuNypvAynYuJjuue
         Bjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203921; x=1779808721;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qi1oGcfy2F/V9hqGyvfMuBPdpU5/rEAVHW7aQyISR+Q=;
        b=CrUgGrQpESrwLOYrMPvby65LhFPg47SMEIjJZyosywVr3MqcnJs1cEUuubeLRbNXmR
         gM0Ogy4I3MFMxshaN0od1h8pmxSrvCYxLSe21pSWjUasCtKP0yViZaFwRAr9L/bChMVC
         778F0LRe4dJdjn5FYW3z2Ehu09sRa8wo53WSdYAKXf8kqd4YT/pXvmif+xra9M6CSqCv
         FxSS7DRtJ6kCGBPFpIYRdStYlAPDmqIGK1SbvPlohru+DgaWftqoq5uY5MOqrhnAjPq5
         0HFiNcQFYdovj7rlz12g9r5XtiEXCh6f4FYrPd/4G0LnpHkjdJkjsefSRQipNy1sUnuu
         wf4g==
X-Gm-Message-State: AOJu0YyZTB7szrvSU9sU1znzzGdDsinbnFSIPUvHdX3R/JL4km1PVu8x
	+1dPd7s/VqWtPR5KGy+8yIZTJ4nm0BBM7rKgb1bSXSRZ/2J5W/PSoir3g9WkJnWXAhEORMid4qp
	l0KvSJZ82S6zwG4CXNFzwV2dThswrjhb9S7MhRLXaKompixhNGCGe21+1f0uPAMM+nMfdhjZBxS
	GkBmGIWtLG6B1zaufWu2WeSP/MoWfV+zlR2owNQB4EKYhO
X-Received: from wrsy5.prod.google.com ([2002:a5d:4ac5:0:b0:439:dad6:4846])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4305:b0:43c:fe66:43ec
 with SMTP id ffacd0b85a97d-45e5c5af3e1mr33968405f8f.14.1779203920289; Tue, 19
 May 2026 08:18:40 -0700 (PDT)
Date: Tue, 19 May 2026 17:16:30 +0200
In-Reply-To: <20260519151616.2557018-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260519151616.2557018-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3044; i=ardb@kernel.org;
 h=from:subject; bh=osZl6uzkZYEkcghfaazSssjo1b/cuYAKEwUCEYJfinQ=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIYun7uqNOWVWU5/UXRVfylrTJVR488jUvCfS7J8uTnXol
 rv8dKNpRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjIPx+Gfxa3bjaemqQ2QX2i
 +ikrecMj36z+NBrzXBW6mWT11rhKfD4jw9WmHq2SKWv6PLaLbc0reKxz6lHq+tMT8qoXvdRc/Ph gHBcA
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260519151616.2557018-28-ardb+git@google.com>
Subject: [PATCH v5 13/13] arm64: mm: Unmap kernel data/bss entirely from the
 linear map
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_081843_907974_0E95F582 
X-CRM114-Status: GOOD (  18.86  )
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

The linear aliases of the kernel text and rodata are mapped read-only in
the linear map as well. Given that the contents of these regions are
mostly identical to the version in the loadable image, mapping them
read-only and leaving their contents visible is a reasonable hardening
measure.

Data and bss, however, are now also mapped read-only but the contents of
these regions are more likely to contain data that we'd rather not leak.
So let's unmap these entirely in the linear map when the kernel is
running normally.

When going into hibernation or waking up from it, these regions need to
be mapped, so map the region initially, and toggle the valid bit so
map/unmap the region as needed. (While the hibernation snapshot logic
seems able to map inaccessible pages as needed, it currently disregards
non-present pages entirely.)

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 39 +++++++++++++++++---
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 136cfe0f7375..9b6d90deb6d5 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -24,6 +24,7 @@
 #include <linux/mm.h>
 #include <linux/vmalloc.h>
 #include <linux/set_memory.h>
+#include <linux/suspend.h>
 #include <linux/kfence.h>
 #include <linux/pkeys.h>
 #include <linux/mm_inline.h>
@@ -1040,6 +1041,29 @@ static void __init __map_memblock(phys_addr_t start, phys_addr_t end,
 				 end - start, prot, early_pgtable_alloc, flags);
 }
 
+static void remap_linear_data_alias(bool unmap)
+{
+	set_memory_valid((unsigned long)lm_alias(__init_end),
+			 (unsigned long)(__bss_stop - __init_end) / PAGE_SIZE,
+			 !unmap);
+}
+
+static int arm64_hibernate_pm_notify(struct notifier_block *nb,
+				     unsigned long mode, void *unused)
+{
+	switch (mode) {
+	default:
+		break;
+	case PM_POST_HIBERNATION:
+		remap_linear_data_alias(true);
+		break;
+	case PM_HIBERNATION_PREPARE:
+		remap_linear_data_alias(false);
+		break;
+	}
+	return 0;
+}
+
 void __init mark_linear_text_alias_ro(void)
 {
 	/*
@@ -1048,6 +1072,16 @@ void __init mark_linear_text_alias_ro(void)
 	update_mapping_prot(__pa_symbol(_text), (unsigned long)lm_alias(_text),
 			    (unsigned long)__init_begin - (unsigned long)_text,
 			    PAGE_KERNEL_RO);
+
+	remap_linear_data_alias(true);
+
+	if (IS_ENABLED(CONFIG_HIBERNATION)) {
+		static struct notifier_block nb = {
+			.notifier_call = arm64_hibernate_pm_notify
+		};
+
+		register_pm_notifier(&nb);
+	}
 }
 
 #ifdef CONFIG_KFENCE
@@ -1174,11 +1208,6 @@ static void __init map_mem(void)
 		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
 			       flags);
 	}
-
-	/* Map the kernel data/bss read-only in the linear map */
-	__map_memblock(init_end, kernel_end, PAGE_KERNEL_RO, flags);
-	flush_tlb_kernel_range((unsigned long)lm_alias(__init_end),
-			       (unsigned long)lm_alias(__bss_stop));
 }
 
 void mark_rodata_ro(void)
-- 
2.54.0.563.g4f69b47b94-goog


