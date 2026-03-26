Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB06310AB82D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 22:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZF5QwTXW0it83BlX45eDb3Cus84yuaXHUnb6NVnQYmA=; b=Q2UveaoD8BOL64q1cuWIF66uyd
	mgpk7NaX0z94cCZdz9CIhfaitRTE+ZHIvXLW54ayOfcA1rDe50Ti9hYMQKk6ZP20YYF9BI86bKtkr
	5tfxJd6U7dxEZ0+pgTVUbzjW4FaoNdCjJdcYPICM8h6yOcPU4uGNpS29IFbdK9HzdknNSAqfqeyWg
	6qo8OVkNQX97T+WZ3+2Ids0ZJ08azfXHd3ZbKKm7kbk6LjYF5FznLp2rfwqUMx1UN4DbP4eYqkX4o
	pxrWm9Dwi8Cr6xiq/h7szp4pQKHkv4UZqpNxG8DOSs9eW9lI/D0Llpr8V6m03t9DmzlAYcT6rHkJ1
	2O9G1APA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5tec-00000006M1O-3yFW;
	Thu, 26 Mar 2026 22:58:18 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5tea-00000006M13-33c6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 22:58:18 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so15023005e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 15:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774565894; x=1775170694; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZF5QwTXW0it83BlX45eDb3Cus84yuaXHUnb6NVnQYmA=;
        b=mi/F1GP8sEWwBoCqbFIvSWydfPl5onabGKlfZRg2cKiUEIQWW+5NmtQ2U5tGw+xMbD
         XhKj9EBBAeCImfcwjhKcEcpPJBuDm5TVn3J4eC4UTkaONiJlZ9TMPyGpOZDdvDvdh98q
         EMF4riluK7jbtg2y8/0hSIEvFkf0sZU5Ww9uXxUVQLMr/yeMr7u2+/VsMkyVIUOrZ09d
         S8ZDhFJvDKE/U+cvIDqYqeRgZNOt7hP5RY0frlUrKCcQIqvFL0SEfee25oeiV1nBZajJ
         6AbyoERvapG7WVTFvM45wtqkEvJPHrI4K9fESZO9ZlY+SX7IEIBK7qiJwqtt29tfofXV
         nrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774565894; x=1775170694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZF5QwTXW0it83BlX45eDb3Cus84yuaXHUnb6NVnQYmA=;
        b=GFFUZHq0dPppX7UG8Y5ezL0XufC0bvXhLSpEXvTHtRgNCJVWB0Hdxkkt6MV3mBQwAk
         8n4Sz0ugoxxjwk80iJ3Hcp5pOe35P1mQ2aPzCIVUvU3EYkxyorbgoMWBb2tUUr090zjE
         BC1T9a6HhPeATmPpN25Q8m3vKkwOEEKdkRSeDcNIJUpheI7xKQm9PPlI8YkAeV2ZCTuN
         u/uzzRntbdv1moW5RcyXQxVKupotl1nv+8LOLLAi6oX2lpMj57wj8QvMObvmSoMXXGUi
         Odb7TqJo3RE4k41hak+M4GCqRvCRC7r6YcRwWeu35ZNlS8beR1HU7Z5Ktxx3FgYSQRkh
         nM+g==
X-Forwarded-Encrypted: i=1; AJvYcCWTbF2RHN1yhGETZhEvP6HBwliLeIZw4iJqsmUYCN2Cu8+3DzV1NzEwz8di7ZiEGcQWEs0+71pzc0VgbcYwU/KK@lists.infradead.org
X-Gm-Message-State: AOJu0YzodND7XeJXyO/+VOHBiwRWNzAsoifag1kNoNtxii/Bsis5+ON/
	aI+RnliR/iHf80UEfy3QDfjQXGqyDsTQynl7Dh8VDDKB/b02V1V72s7Z
X-Gm-Gg: ATEYQzxmFvJHaR2xvwqilnshGw4i25//0ZmZtVkhId8/eERJB+dFnF7BbE+RWagHxLF
	5r9DjhHetseouZYENjn97AxiTPlZ7HmHjjBuUs2jqctKPINPdTEZkroDW36VVBwTOUSyb4KqPKY
	QkDDZtObWJNoJxT8wek5PHqrwwMY1fY+JDiJotFsfdKRy66eyTkaMkTW8h4OAH2ApoCd2LzWYDP
	i4pdrNXUyKX46qM1fJqb84YDV0n1sMvjIvc8fZAELYAu+YAgFAV6M6six/3qJ8yy/xtWRIiCVZ8
	aooB5hur84dbiaQrqeVEiktqTQim8/G8S2/1Ezq8qNFbtH+nfEWwT6vRFR0VjQKYmodv0ISq+V/
	p3Ryx1dbSC5VPVXL1UMwXU5NuCjm8kzfphTK1uqNYZxiEO60LUzn8u0sawk6Vze/z3gi44ru0J3
	axx7gYtXGjuan9fN6AsLYMJogOG5T8KHOcRX+AuYJj9tv2Z3yJKc/OKAfyqrZG
X-Received: by 2002:a05:600c:c87:b0:487:338:b4eb with SMTP id 5b1f17b1804b1-48727ede22fmr5969135e9.28.1774565894147;
        Thu, 26 Mar 2026 15:58:14 -0700 (PDT)
Received: from osama.. ([2a02:908:1b6:8980:8cd6:6329:c43d:2fcb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725d9bca0sm5579365e9.2.2026.03.26.15.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 15:58:13 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryo Takakura <ryotkkr98@gmail.com>,
	Breno Leitao <leitao@debian.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: panic from init_IRQ if IRQ handler stacks cannot be allocated
Date: Thu, 26 Mar 2026 23:57:52 +0100
Message-ID: <20260326225755.50297-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_155816_790178_B68F419D 
X-CRM114-Status: GOOD (  11.94  )
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

init_irq_stacks() and init_irq_scs() may fail when arch_alloc_vmap_stack
or scs_alloc return NULL. Return -ENOMEM from both and call panic() once
from init_IRQ(), covering per-CPU IRQ stacks and shadow IRQ stacks
consistently.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
v2:
- Add return -ENOMEM from both init_irq_stacks() and init_irq_scs()
- Call panic() once from init_IRQ() if either init_irq_stacks() or
  init_irq_scs() returns -ENOMEM
---
 arch/arm64/kernel/irq.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
index 15dedb385b9e..9fafd826002b 100644
--- a/arch/arm64/kernel/irq.c
+++ b/arch/arm64/kernel/irq.c
@@ -10,6 +10,7 @@
  * Copyright (C) 2012 ARM Ltd.
  */
 
+#include <linux/errno.h>
 #include <linux/hardirq.h>
 #include <linux/init.h>
 #include <linux/irq.h>
@@ -32,34 +33,43 @@ DEFINE_PER_CPU(struct nmi_ctx, nmi_contexts);
 
 DEFINE_PER_CPU(unsigned long *, irq_stack_ptr);
 
-
 DECLARE_PER_CPU(unsigned long *, irq_shadow_call_stack_ptr);
 
 #ifdef CONFIG_SHADOW_CALL_STACK
 DEFINE_PER_CPU(unsigned long *, irq_shadow_call_stack_ptr);
 #endif
 
-static void init_irq_scs(void)
+static int __init init_irq_scs(void)
 {
 	int cpu;
+	void *s;
 
 	if (!scs_is_enabled())
-		return;
+		return 0;
+
+	for_each_possible_cpu(cpu) {
+		s = scs_alloc(early_cpu_to_node(cpu));
+		if (!s)
+			return -ENOMEM;
+		per_cpu(irq_shadow_call_stack_ptr, cpu) = s;
+	}
 
-	for_each_possible_cpu(cpu)
-		per_cpu(irq_shadow_call_stack_ptr, cpu) =
-			scs_alloc(early_cpu_to_node(cpu));
+	return 0;
 }
 
-static void __init init_irq_stacks(void)
+static int __init init_irq_stacks(void)
 {
 	int cpu;
 	unsigned long *p;
 
 	for_each_possible_cpu(cpu) {
 		p = arch_alloc_vmap_stack(IRQ_STACK_SIZE, early_cpu_to_node(cpu));
+		if (!p)
+			return -ENOMEM;
 		per_cpu(irq_stack_ptr, cpu) = p;
 	}
+
+	return 0;
 }
 
 #ifdef CONFIG_SOFTIRQ_ON_OWN_STACK
@@ -109,8 +119,9 @@ int __init set_handle_fiq(void (*handle_fiq)(struct pt_regs *))
 
 void __init init_IRQ(void)
 {
-	init_irq_stacks();
-	init_irq_scs();
+	if (init_irq_stacks() || init_irq_scs())
+		panic("Failed to allocate IRQ stack resources\n");
+
 	irqchip_init();
 
 	if (system_uses_irq_prio_masking()) {
-- 
2.43.0


