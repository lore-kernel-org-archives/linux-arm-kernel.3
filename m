Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4126CD29C43
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4EUsFWvfNG6jYO8IfY/OM++lXiUoY+wEqYUoCpTy24=; b=yPsmBk96X078G5Si9l7e7DQVtf
	vqLXsh+p+F+bCljSQLeCkPjjlyOugvLng1ERw1VGU9zWR3PHltm9cvbTkPydzaSqvw/zfY4kIboos
	bMkiplSYp+QagXBRH4pP4BPUc88VFRaHujzzPxJPwit+ZX0A6UnuPJHx9N4dOCkrGTZROl4PR29cq
	Zy00obrTvorXYPMXZGxJfYYbruZz/S47MQ3WNr4GCJXBpN+8f672I0MCn9HnfpeXlwkD5eyTXiee6
	NMGoqERA/BivHmogAFnjKFgIqUQ6zJ6Vqixtgu3JY2I2RZ29R5pXnChqwJrNjfdS6lCKwj8eGv/aq
	5pVYKY/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsYN-00000002ZSO-2f7r;
	Mon, 19 Jan 2026 16:56:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsYF-00000002ZP8-3XJF
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 16:56:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=s4EUsFWvfNG6jYO8IfY/OM++lXiUoY+wEqYUoCpTy24=; b=EBSvM0H3iwSK2bXfCMsTUlCL2h
	2jkh8jp/wEhl6Kn+8+8MTJ8nOjEpO5oGicC8rDS5s9s8lwWAaiusMmhnYp/k3ABy1f9OFSqFZqrDM
	JtRdZ8L3oim9R6f+5unwqxQsWVTjbsgX1H68JTndqcACuF1YAzne267/W+PTPbQQGiCAZc7jQaNkS
	tghfbfXxdVXi6/SnG9+mntWLjsN0wB4lSsHylesPZyqcISDjqMS4jePUmRU4L9ln9Ks9Jqy3vaSe0
	YXttPUyTfBbUzS406GL0gzKj8AnOyx65N6lUIS19NDSgt8y8db6F5FGIe0ZbIf7I9UxRIBGImm29z
	1y5ESHcQ==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsYC-0000000CbSf-2W7J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 16:56:26 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-477c49f273fso41848045e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 08:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768841783; x=1769446583; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s4EUsFWvfNG6jYO8IfY/OM++lXiUoY+wEqYUoCpTy24=;
        b=15sZaIO0JDk08AC/6PGUzvqiqilrAIyyI4Lqhzs5el5QSMFXCh5yG4vReNGjkJ9uvs
         B5V8xeqBeflJGygaweTbLUf+HqHW19SRF/6oWJ5sv3j8JbDxvhBvHaaccvwEMqNSleNw
         Wm99rKp1PYI18WoeCr60icSfAHxezgQ+VtwvYlePlOZkoR4125+wLPk9LpOLdLXj13kw
         cnRNSwrh5CfefeowrGaRthJ5KXO9MWAR4ocANcBCU4ePR1nUXuuITfRvUiuxewYRYQcS
         AOhiph3D+6koeLhg2mvEe2fiLgw/6U+ue5fy39ggvSS7kQCqNokfxbSOFoycrlIRbF5n
         T2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768841783; x=1769446583;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s4EUsFWvfNG6jYO8IfY/OM++lXiUoY+wEqYUoCpTy24=;
        b=S0Lij2l5iGgDZq6FppPrZRuNS6tYBckRFMm17G2qg+3fbZ8KpjPXl/YK6J5s9Z4RUo
         Q4Dd3a0/Snbw95AzvhFn120x4VbMVfl66ZvsVVpTxMZsWBVM+/RI3wWGnUrcis9uVi4Q
         A6PtKB7Yr++sw72W+RdpsRMQWIDF92Hmlr9oC5PYh7kkk5+ZjoSkDRitxX2/+IqdHUD/
         HuSmDkX0JKejZyUK5kObOXg9mxK3dDfPMm6fj46lf9kwHpzy4YgdbWF88PWyP+zaZErK
         zBcJGdkzkPwHEJfPglWPN7Hd23u1HUB7Xz3PAJU3zb5Z9Y93KFLxPC8gqkNSwj13uxQT
         syhg==
X-Gm-Message-State: AOJu0Ywb43wDzmFoUQIzcA9Y3qimwGhW91SmhkToYTgChV6q+DQcGyR4
	XKsxC8PBH2c7LfoIotDbZs+fFgfd5xbli6upbbIjDSQrhsBkU5iYb6/Ou2cLC+pB49A01QM3ng=
	=
X-Received: from wmbil25.prod.google.com ([2002:a05:600c:a599:b0:46e:1e57:dbd6])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c4a4:b0:477:7bca:8b2b
 with SMTP id 5b1f17b1804b1-4801e2fef34mr171303545e9.15.1768841782852; Mon, 19
 Jan 2026 08:56:22 -0800 (PST)
Date: Mon, 19 Jan 2026 17:47:52 +0100
In-Reply-To: <20260119164747.1402434-6-ardb+git@google.com>
Mime-Version: 1.0
References: <20260119164747.1402434-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2890; i=ardb@kernel.org;
 h=from:subject; bh=HeK0fa8eNZm3Eo/TOMdG37o/i93rJtICIBf0MiUiyLQ=;
 b=kA0DAAoWMG4JVi59LVwByyZiAGluYDagcqUCy3hpyhYgUZ3by359BPtdnqvGGIUf1J2q5Ky8V
 4h1BAAWCgAdFiEEEJv97rnLkRp9Q5odMG4JVi59LVwFAmluYDYACgkQMG4JVi59LVwiAAEAgPny
 UNC2NLOejTSjxWEADXgkQHtHk7sF7wOU/hyIz6sA/3fsOe3Kx6zKyfjmM753VqL6Q0RxK1tUOYJ IOcLB1eEB
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260119164747.1402434-10-ardb+git@google.com>
Subject: [PATCH 4/4] arm64: Unmap kernel data/bss entirely from the linear map
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>, 
	Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_165624_687390_314BA0C1 
X-CRM114-Status: GOOD (  16.67  )
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

The linear aliases of the kernel text and rodata are mapped read-only as
well. Given that the contents of these regions are mostly identical to
the version in the loadable image, mapping them read-only is a
reasonable hardening measure.

Data and bss, however, are now also mapped read-only but the contents of
these regions are more likely to contain data that we'd rather not leak.
So let's unmap these entirely in the linear map when the kernel is
running normally.

Only when going into hibernation or waking up from it do these regions
need to be mapped, so take care of this using a PM notifier.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 35 ++++++++++++++++++--
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index d978b07ab7b8..7b3ce9cafe64 100644
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
@@ -1024,13 +1025,13 @@ static void __init __map_memblock(pgd_t *pgdp, phys_addr_t start,
 				 prot, early_pgtable_alloc, flags);
 }
 
-static void remap_linear_data_alias(void)
+static void remap_linear_data_alias(bool unmap)
 {
 	extern const u8 __pgdir_start[];
 
 	update_mapping_prot(__pa_symbol(__init_end), (unsigned long)lm_alias(__init_end),
 			    (unsigned long)__pgdir_start - (unsigned long)__init_end,
-			    PAGE_KERNEL_RO);
+			    unmap ? __pgprot(0) : PAGE_KERNEL_RO);
 }
 
 void __init remap_linear_kernel_alias(void)
@@ -1041,7 +1042,7 @@ void __init remap_linear_kernel_alias(void)
 	update_mapping_prot(__pa_symbol(_text), (unsigned long)lm_alias(_text),
 			    (unsigned long)__init_begin - (unsigned long)_text,
 			    PAGE_KERNEL_RO);
-	remap_linear_data_alias();
+	remap_linear_data_alias(true);
 }
 
 #ifdef CONFIG_KFENCE
@@ -2257,3 +2258,31 @@ int arch_set_user_pkey_access(struct task_struct *tsk, int pkey, unsigned long i
 	return 0;
 }
 #endif
+
+#ifdef CONFIG_HIBERNATION
+static int arm64_hibernate_pm_notify(struct notifier_block *nb,
+				     unsigned long mode, void *unused)
+{
+	switch (mode) {
+	case PM_HIBERNATION_PREPARE:
+	case PM_RESTORE_PREPARE:
+		remap_linear_data_alias(false);
+		break;
+	case PM_POST_HIBERNATION:
+	case PM_POST_RESTORE:
+		remap_linear_data_alias(true);
+		break;
+	}
+	return 0;
+}
+
+static struct notifier_block arm64_hibernate_pm_notifier = {
+	.notifier_call = arm64_hibernate_pm_notify,
+};
+
+static int arm64_hibernate_register_pm_notifier(void)
+{
+	return register_pm_notifier(&arm64_hibernate_pm_notifier);
+}
+late_initcall(arm64_hibernate_register_pm_notifier);
+#endif
-- 
2.52.0.457.g6b5491de43-goog


