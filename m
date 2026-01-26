Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B051BD74EF7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 09:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZdZOMr7ZD3YwJoCt91zHhXUsqIB0kktLgOb3PAMNCk=; b=i5o8ymMohKOz1EC5fi5uXf8rzw
	ZiOQtvtx7x8RyAEfBOPDM3Yu+SfFHzONoT8TRohI79MHRj0yCT0rypjCVhCExs4q+ck88Sj/hwu4Y
	ZpqaHkQlcg70R5nM05Hnp97rh75sXeBLOn6xEQDomIPT2TV/fC/UbNnr0qb1OfqR3gkpQ6Vb5qjbi
	XAQpRRRG3u0vvb6joYww8VjpqU1yxFkCLfxeNWjeOmNkrUZCPsGI6xMElUmKPjWou0QWdtYboZCbf
	4ZvH7FX93jZeAc09e6lPfntfDLftkLMOxePyUCBngnuboEEPaJ4QHxG1T7GJyAzCJwE0NuloGwCc0
	UDTiFOxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkItP-0000000CCWL-2hz0;
	Mon, 26 Jan 2026 09:28:19 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIsp-0000000CC2k-1z6i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 09:27:44 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-4325aa61c6bso3282440f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 01:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769419661; x=1770024461; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yZdZOMr7ZD3YwJoCt91zHhXUsqIB0kktLgOb3PAMNCk=;
        b=ErwfcVPnNXCNai86aoQM5M2hM8bbVjmL+MruJZiqjZqoTa2iF/wQilUq3WQ2ztIA0x
         fNsgDpvi8g6mSJ3KG1ed6C4pJWba5E63h3lhBfQYdmU0pRmpUoKqV3BOlSQQJrTQRPJS
         BgjsJJRx85eCaCg/LsKVudOUCplOnbZXiSKVSLN3UZWfduxmod/0pzDbsaiES86VLudK
         96farn7XuIAZ8AeYcgpl21xEAfONmAJdt4K6+jIY7T1QWFuP1lKJ83xWGmOoxhHKiZcz
         9QaW6eZy7FvO4H5YvbIt1baVBeuUeGqTBAWad47mqgUoYRumO2CYrPyr3oI6Fu8I6opN
         q38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769419661; x=1770024461;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yZdZOMr7ZD3YwJoCt91zHhXUsqIB0kktLgOb3PAMNCk=;
        b=QYuZ3mEeazwFqRM0ocVblOSCZ+lL9Kogwx2SrrNVx/Sn0SYFf1Gic/dsqp2n8ZGFcb
         XKt0Z/a6x1WFxx50rXX7vQSI/zTP4OU2kN80pTcws9uVXE7m7fXgQ7PEItR5PtAnTGJh
         R6m33gPWnSHSd4my1DSGBIYdqHACZegHgW42S/bnhLacb3oKZ3p34iRfolzJHTnTyLJl
         8iBBckgUlTv/DAsiwI+hKPcDefCX3nME2ZzQUBUxARW3TFxF4ZpVvPEZ2SBdRNNHVNW8
         rq0RWzk42HIK7NRRjipT3gPiZPILAWObTlht/FObVINgbtl77BDeyZoHYj9jkatY/ITT
         v5CQ==
X-Gm-Message-State: AOJu0YxOOV75qbP+pVD3H9oJ4BiEC0AjnXR1eoUslk/HkRDTW2M9aLaJ
	blLXBBKXZoHZ0IbhDdPm/TprWIle2WRrwSiVm1Df/4ZqSDB4zRDYiSrj1qsfqucBqGx/+6h4Cw=
	=
X-Received: from wrzj36.prod.google.com ([2002:a5d:6e64:0:b0:435:9c10:fc67])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2404:b0:435:8aa1:ff4d
 with SMTP id ffacd0b85a97d-435ca0ef8a3mr5885706f8f.22.1769419660699; Mon, 26
 Jan 2026 01:27:40 -0800 (PST)
Date: Mon, 26 Jan 2026 10:26:41 +0100
In-Reply-To: <20260126092630.1800589-12-ardb+git@google.com>
Mime-Version: 1.0
References: <20260126092630.1800589-12-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3150; i=ardb@kernel.org;
 h=from:subject; bh=F75QV7Me+l51GTWjnCoV9En3fFQSXyPjTPLkcCDZb5k=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIbPc2Gemlo8A9wThkJRzGY6PJTzf2MoqLFcKrppoVuQhs
 NAstq6jlIVBjItBVkyRRWD233c7T0+UqnWeJQszh5UJZAgDF6cATKSohJHhc4ORyLascs43x3uf
 35Jr3LtsAV+q9K0/TMrOVoJ7G44kMjIsj5DZImpT/axLMlbhis6iO/Zz9tq5nVnIP9ko1zObxYY FAA==
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126092630.1800589-22-ardb+git@google.com>
Subject: [PATCH v2 10/10] arm64: mm: Unmap kernel data/bss entirely from the
 linear map
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_012743_770178_AAFED488 
X-CRM114-Status: GOOD (  18.98  )
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
map/unmap the region as needed.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 40 ++++++++++++++++++--
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index fdbbb018adc5..06b2d11b4561 100644
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
@@ -1027,6 +1028,31 @@ static void __init __map_memblock(phys_addr_t start, phys_addr_t end,
 				 end - start, prot, early_pgtable_alloc, flags);
 }
 
+static void remap_linear_data_alias(bool unmap)
+{
+	set_memory_valid((unsigned long)lm_alias(__init_end),
+			 (unsigned long)(__pgdir_start - __init_end) / PAGE_SIZE,
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
+	case PM_POST_RESTORE:
+		remap_linear_data_alias(true);
+		break;
+	case PM_HIBERNATION_PREPARE:
+	case PM_RESTORE_PREPARE:
+		remap_linear_data_alias(false);
+		break;
+	}
+	return 0;
+}
+
 void __init mark_linear_text_alias_ro(void)
 {
 	/*
@@ -1035,6 +1061,16 @@ void __init mark_linear_text_alias_ro(void)
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
@@ -1163,7 +1199,7 @@ static void __init map_mem(void)
 	__map_memblock(kernel_start, init_begin, PAGE_KERNEL,
 		       flags | NO_CONT_MAPPINGS);
 	__map_memblock(init_end, kernel_end, PAGE_KERNEL,
-		       flags | NO_CONT_MAPPINGS);
+		       flags | NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS);
 
 	/* map all the memory banks */
 	for_each_mem_range(i, &start, &end) {
@@ -1176,8 +1212,6 @@ static void __init map_mem(void)
 			       flags);
 	}
 
-	__map_memblock(init_end, kernel_end, PAGE_KERNEL_RO,
-		       flags | NO_CONT_MAPPINGS);
 	arm64_kfence_map_pool(early_kfence_pool);
 }
 
-- 
2.52.0.457.g6b5491de43-goog


