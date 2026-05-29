Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAEECD6E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQKx64xQcW6ZDY2ZWUkqEvIbYSGgY2Fsos5YN6YfoOU=; b=yKcatVkXVxZNxuojPCLi+XN+lW
	ymZnZMKZzDCcOua9QuMQKtqmbkUxQnFqnNmi4TW1u3mSBrmgDHxGmXr9eNWCPsb05QTqKUfOimIzH
	dt4HfwhtzNPVbtrpmMcH6YNjp7SgsdZepR52DG59meV/YWRam8ENdeOouYQwew/4QNvQ8ox/W/99H
	aqssBbemWtqM8AYTL4CfkokV9cJbleSpjkMt4YOrJhd5ylvjSBYJnp+Ie2Y7wO99bLkLueTENoX7R
	+d2oZmVDuFLmbM9Hm3dNOhVWz5yaWz1+hZGH98V3pAjGs8a68ncPGkEo8EkSktt/2wB245vq54KmP
	Mn4eyBVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSykO-00000007coe-0bhP;
	Fri, 29 May 2026 15:03:40 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyjO-00000007bnm-3jK2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:02:41 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4909e29e78fso5072255e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 08:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780066957; x=1780671757; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XQKx64xQcW6ZDY2ZWUkqEvIbYSGgY2Fsos5YN6YfoOU=;
        b=VHxhSbBnKViIQ5cM0DAumm4f9uTc9ZdjfeRbelCda0TwJrlAG3QkGD+kODbelni2mE
         4y3F89bwLCkFY3cDvXK18Ig0+gPFYLj/ONqn+C+Bj6I7irEjpfIhuwOiQILqbsSK6fXv
         dbyRu/9e6isHDUBI6+FuPvxg1ds9Z1HTFbnnBknOrBiZ3yec7SG60Yk+jp7dY0VC4Ti6
         zZdz28/VbNm+oFXQeRA77mhA1PcnQb4N1mpow+Gc4NL9GXRa2NQf1zyRcewnFvUcQlwz
         T5lwxPGNDIP5qrn1J/PMoQt3XlmIV1tECQyZHBB8OZNhK1nXM4yBUzM5GTaG38MLq+1R
         3XMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066957; x=1780671757;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XQKx64xQcW6ZDY2ZWUkqEvIbYSGgY2Fsos5YN6YfoOU=;
        b=UWhHc/DArQWIYUajQocZHQMDUTSas0tVVu/W7+mtkYthKZpNr+IwUazefFoYByiUZl
         YVSWiZMl8cmyw+GizYR9OPMToVb5fDTY0fRQsdD7f4T7ComiN0lFCOdYRXc8mTE77xtV
         XiF7kO4E/YJ2dGx3+xLScDAmY4fTpuHaKQTQhdZXi/su0AR+i+D9Dou/DY/jaEeWN579
         XXPl/gVq5inRx0WYk59Su+jXT/3Go2cA3BYAtUkNj3pXEO94qnD44QFR4ti5wK2eiJ0C
         XNyhWNXY/bv3lEfLKqWMCZorm4rb0VpPXJOv54ngYZDJaUM4iyKq1TtFxD3vwM+S6f9f
         rW5g==
X-Gm-Message-State: AOJu0YzzCAa+ggTzDnY7lsvVd8Je4HkcReSw0QZ88xO3/7wG/A1C+62j
	jIrcTx29GHtfr/9t35lQhNY+K1fT8Lz6O9USF/gnyJ0XaUUlKaXfOHymwnxkwOBPFKgUlyZKH6a
	QTjz6ymjnadrb4jl1WDxXGD77ZGOmjehkEC1byEd2Z0TcRBGR2Iv4Y9o2kVUjI3n6JIEXGnwB9j
	PQpGyj5YT+6dXtFu5CyDlHoWoGb2zh6RXot2EKPHVlLcuo
X-Received: from wmbez9.prod.google.com ([2002:a05:600c:83c9:b0:48f:e3fc:d858])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4fd6:b0:490:5655:8d3f
 with SMTP id 5b1f17b1804b1-4909c0ed167mr56446625e9.28.1780066956218; Fri, 29
 May 2026 08:02:36 -0700 (PDT)
Date: Fri, 29 May 2026 17:02:06 +0200
In-Reply-To: <20260529150150.1670604-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260529150150.1670604-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3406; i=ardb@kernel.org;
 h=from:subject; bh=XSavLFKj4RYiFTOsx9dpbIASgaMnJejevEPNl4lZqhM=;
 b=kA0DAAoWMG4JVi59LVwByyZiAGoZqnCghcJA5fPW2Z72X9X37eu+fqYYMOTvKUc5VemCkE+q7
 oh1BAAWCgAdFiEEEJv97rnLkRp9Q5odMG4JVi59LVwFAmoZqnAACgkQMG4JVi59LVy8pQEA6HlB
 3WUW3N8HA9+DidOWBYQI1frKFGwVYEQ7O27c8DUBAJEH2JVQ9ldiz63/YvZsdSlPfdvNDLvL7Jf SNW10NGsD
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150150.1670604-32-ardb+git@google.com>
Subject: [PATCH v7 15/15] arm64: mm: Unmap kernel data/bss entirely from the
 linear map
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>, 
	Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_080238_952319_45B1385E 
X-CRM114-Status: GOOD (  20.29  )
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

The linear aliases of the kernel text and rodata are also mapped
read-only in the linear map. Given that the contents of these regions
are mostly identical to the version in the loadable image, mapping them
read-only and leaving their contents visible is a reasonable hardening
measure.

Data and bss, however, are now also mapped read-only but the contents of
these regions are more likely to contain data that we'd rather not leak.
So let's unmap these entirely in the linear map when the kernel is
running normally.

When going into hibernation or waking up from it, these regions need to
be mapped, so map the region initially, and toggle the valid bit so
map/unmap the region as needed.

Doing so is required because pages covering the kernel image are marked
as PageReserved, and therefore disregarded for snapshotting by the
hibernate logic unless they are mapped.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 45 ++++++++++++++++++--
 1 file changed, 41 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 7b18dc2f1721..07a6fa210171 100644
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
@@ -1056,6 +1057,29 @@ static void __init __map_memblock(phys_addr_t start, phys_addr_t end,
 				 end - start, prot, early_pgtable_alloc, flags);
 }
 
+static void mark_linear_data_alias_valid(bool valid)
+{
+	set_memory_valid((unsigned long)lm_alias(__init_end),
+			 (unsigned long)(__bss_stop - __init_end) / PAGE_SIZE,
+			 valid);
+}
+
+static int arm64_hibernate_pm_notify(struct notifier_block *nb,
+				     unsigned long mode, void *unused)
+{
+	switch (mode) {
+	default:
+		break;
+	case PM_POST_HIBERNATION:
+		mark_linear_data_alias_valid(false);
+		break;
+	case PM_HIBERNATION_PREPARE:
+		mark_linear_data_alias_valid(true);
+		break;
+	}
+	return 0;
+}
+
 void __init mark_linear_text_alias_ro(void)
 {
 	/*
@@ -1064,6 +1088,21 @@ void __init mark_linear_text_alias_ro(void)
 	update_mapping_prot(__pa_symbol(_text), (unsigned long)lm_alias(_text),
 			    (unsigned long)__init_begin - (unsigned long)_text,
 			    PAGE_KERNEL_RO);
+
+	/*
+	 * Register a PM notifier to remap the linear alias of data/bss as
+	 * valid read-only before hibernation. This is needed because the
+	 * snapshot logic disregards PageReserved pages (such as the ones
+	 * covering the kernel image) unless they are mapped in the linear
+	 * map.
+	 */
+	if (IS_ENABLED(CONFIG_HIBERNATION)) {
+		static struct notifier_block nb = {
+			.notifier_call = arm64_hibernate_pm_notify
+		};
+
+		register_pm_notifier(&nb);
+	}
 }
 
 #ifdef CONFIG_KFENCE
@@ -1193,10 +1232,8 @@ static void __init map_mem(void)
 			       flags);
 	}
 
-	/* Map the kernel data/bss read-only in the linear map */
-	__map_memblock(init_end, kernel_end, PAGE_KERNEL_RO, flags);
-	flush_tlb_kernel_range((unsigned long)lm_alias(__init_end),
-			       (unsigned long)lm_alias(__bss_stop));
+	/* Map the kernel data/bss as invalid in the linear map */
+	mark_linear_data_alias_valid(false);
 }
 
 void mark_rodata_ro(void)
-- 
2.54.0.823.g6e5bcc1fc9-goog


