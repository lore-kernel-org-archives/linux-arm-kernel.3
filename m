Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CF9CD37AF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 05:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qYwQarOW9zq8U183XOBMYGnfwdJnswvfmG0VUWOUkZQ=; b=L12mDIxWx4XCOQTo5MDelJqDGM
	fEBAO/dRP+XO7+0q4zMEB3u5wvYpnFRYrDbfe5AM4BeyRRNer6RTyEtlL+z5ghFhZaetfeEygFXyh
	Mo98KMHM/OYeje3y52H/eZkMVbZ/FKTqh7PupjWXzsAN2E9A++vtZ9Aq8FeJEINOTFi7LvQG8dkuG
	Uiz0seO7/XbbtorNYVVJCHeaFKCWE2WVor0G+rg7Kp4nD8XDJCUXOqnzXqbLzq2ZscqCTwUcXSs8d
	ol9IVXmhLbXTCh0+AZOsFqaw3I8e7c+2VQKVNNFVpmj0qHDHGp/iNuzJpxW4//L3nl117MB4rMWHz
	5Yt4JuTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLwlR-0000000ADXI-1Yia;
	Sun, 10 May 2026 05:31:41 +0000
Received: from mail-dl1-x1242.google.com ([2607:f8b0:4864:20::1242])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLwlP-0000000ADWk-28re
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 05:31:40 +0000
Received: by mail-dl1-x1242.google.com with SMTP id a92af1059eb24-1329fc4bf77so1034885c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 22:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778391098; x=1778995898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qYwQarOW9zq8U183XOBMYGnfwdJnswvfmG0VUWOUkZQ=;
        b=Q0UJcdcfjprYWjzBDyhmo0Nxl1pUSiMHAvutzcVoI72y+N/gl+SiYRSwYAEfuic2q/
         22/IEC4XBtDhPD3Jr6AJrx9aIDf8El5Rof+oZZNHhj4mrct7k5I1BOWlr2XZfxN9y16D
         r3xRWmKdOfMANmRn3wo4+J9kxBEDn2UemFS/e+mqLIZUwGLgf641v9NCRNmjyyBRNvNu
         NdyJocusvVKjhnQGKd56O98p45vBt1GJGlre6llkakJdcLJOYP7XEnmG+SHepaQALHmf
         kOwhRLKlYOFHBUQ7mrHRkdAGsuq5cr+e+wq/kg8KKFCHp8EMYTZKq54GYes9PvQGfIo6
         op4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778391098; x=1778995898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYwQarOW9zq8U183XOBMYGnfwdJnswvfmG0VUWOUkZQ=;
        b=WvNJZDKKoG5y+TmQM+AX6KJSh5y7/cWwvZ/64pLyFHQv4O6pwhb+73KjTmRhNC5Kdc
         0KX0rguwOheIsH2mAJM65HSP5FfxwqxxtdrdKxVVaxOeNpqzLOQL2kDb1eBnEanRsDPg
         i4+l7zerfl/kxT2UES0dFuc2WXcAMqZgy/1u27EvN8w4PLrPcgFHMtRWr41ploGbFTyy
         jm7chyEb71fhomohQlhJY81j6ddfzO+EKi9XjzeAUh40UgRGsBpDWleMqSH3X9sZi2cV
         gWhSxp3XV1ZRkJKkz6tmZsNQr1HW1D9YqJRrfLtZen6UAVv/ZYNO+tDNzzKnidlh/KQB
         IU1g==
X-Gm-Message-State: AOJu0YxWcbECk42efBFkPXWw9/d8HCBZ78FVzI5mKCF1ev66hmQHn1fL
	Sj7Fs/k5vAE5Y9CQPkF0PlSAGBk9CsfdoUroelqhtkY/9LVB8IcHRKHoliGR/88wW8w=
X-Gm-Gg: Acq92OGBdwZx65gdkn5GzevZzxy/QwewivkkThnVPM9NA51z+Bsd3mQsyJnJTzkwkBt
	OWT5uyP6yVuaDhfcE8RbzhqablFOr3H03iaVG72aD5ZyuMLrFsM0pAT6bpGHrP80seHWuKELBk1
	EJ0I5o50fzj7n+9N8KsT/kCwR2LFee1sNY1QqHmsHnho55FqFS+VA23ge6sbRYPvNogB0ZaKKjM
	/xli07yfp6scvfXu+jgKfpk15mIryGfJ6Rhn4JU5MPfpWgVQ2bp4p/HZOoWw3BncZtpqUUVnxtW
	RpYaIrEcQja232AHKUOM4DPKylHNAD+GmJHOMhvcsuIjIFGQkC3+Gd4kFhtOuNtPtF3EYLJ4gcu
	QkCKbU/g0nXU/gjjo43IVWuoYb1m1ZPESAvZGrkxVIsQgCPCsdu+q8kX+7vOf5ntXg2ZICe1F7S
	bK7Dx82G/Z78KYFduzCosO9kYuNdY4Ac9mSamFN+YfqikKszzi+dgVbXqXb6fgvdtfulhAtfoyR
	v6tTj4jW6e9tm93yL3fSsu9m5tm0vZ4UmRfK4lZw+zv7AM+yS5KxDLlARr3z2S++hrF0q1J5i0L
	680VEOgaB0Px3QLDK1Epl/cVvgVk
X-Received: by 2002:a05:701b:220e:b0:132:2486:ace with SMTP id a92af1059eb24-13224860ba6mr4652719c88.6.1778391097952;
        Sat, 09 May 2026 22:31:37 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13277bb2b14sm11576716c88.0.2026.05.09.22.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 22:31:37 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>
Subject: [PATCH] ARM: remove code to support non-sparse IRQs
Date: Sat,  9 May 2026 22:31:15 -0700
Message-ID: <20260510053120.560874-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_223139_594332_4568E0A9 
X-CRM114-Status: GOOD (  10.72  )
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

Now that footbridge and riscpc have been converted to sparse IRQs, this
code is unused. Remove it.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
This commit depends on my previous submissions "ARM: riscpc: convert to
sparse IRQs" and "ARM: footbridge: convert to sparse IRQs".

 arch/arm/include/asm/irq.h | 5 -----
 arch/arm/kernel/irq.c      | 2 --
 2 files changed, 7 deletions(-)

diff --git a/arch/arm/include/asm/irq.h b/arch/arm/include/asm/irq.h
index 08589b88c3b9..449094a5044e 100644
--- a/arch/arm/include/asm/irq.h
+++ b/arch/arm/include/asm/irq.h
@@ -3,12 +3,7 @@
 #define __ASM_ARM_IRQ_H
 
 #define NR_IRQS_LEGACY	16
-
-#ifndef CONFIG_SPARSE_IRQ
-#include <mach/irqs.h>
-#else
 #define NR_IRQS NR_IRQS_LEGACY
-#endif
 
 #ifdef CONFIG_ARCH_FOOTBRIDGE
 #define irq_canonicalize(i)	(((i) == 2) ? 9 : i)
diff --git a/arch/arm/kernel/irq.c b/arch/arm/kernel/irq.c
index e1993e28a9ec..7458c529a489 100644
--- a/arch/arm/kernel/irq.c
+++ b/arch/arm/kernel/irq.c
@@ -148,9 +148,7 @@ void __init init_IRQ(void)
 	uniphier_cache_init();
 }
 
-#ifdef CONFIG_SPARSE_IRQ
 int __init arch_probe_nr_irqs(void)
 {
 	return irq_set_nr_irqs(machine_desc->nr_irqs ? : NR_IRQS);
 }
-#endif
-- 
2.43.0


