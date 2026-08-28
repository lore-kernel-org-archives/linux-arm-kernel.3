Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886DDC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 17:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VY/z5JBReRe7jugNdwruzvn3FKO8aDoyDfCYUNRNB5I=; b=OtA65/PUFv3x6GCxYYpsxHsxqG
	EyqvWTg8NlXV/L7KdyB9Le3sAow9nBYZhciWdIlcOtKBRlJaKT1CAfST+VbeAXVks0/Hti7Rgoz9U
	E3YnI90CT3VbRQkp7oT7HtVgAUtqgMUpsMyKYSPUYhgSJFVmYCbm7KYcqhoxZF7twsqU65dgPqhTu
	tRCX5qB5JNfeza6otwlKeNo6M1lLCVGdbQ48DOMpw4yuBO36+l99omZ99ygymiwpHQcapOyjoNiMm
	sRYYt9knbr0PhkAjTlQooJtltAoWFYx428OaVvUB2PjPzi58/VhF084FCzRel33X0/58aItzszHsZ
	AzdLAaIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x00aH-00000006H3e-21gj;
	Fri, 28 Aug 2026 17:41:45 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x00aE-00000006H3F-0sfj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 17:41:43 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso15371905e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 10:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787938900; x=1788543700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VY/z5JBReRe7jugNdwruzvn3FKO8aDoyDfCYUNRNB5I=;
        b=kVvp/yw/axGIVCXBI5lPRlf3FFRUYSMZAOFMLshmWcq9PJa0iAGsqYjvH/raU2XBU1
         ID+++1NdHL/jUngjg8bN/x92BJACTqy432hOOv4QawVmeM0kApMcGEFjucqjPLkCyDye
         kHw0G5B3UkJ+ggUXap2VH8u68MlYTAhwD/7NOzmbh3hcCeGvADT211XsfBvLosYIbx+T
         F760tsUd5lOATYJl79m0snU56R8N3Va1ohO2+aa9LGROCKDgJqKskPlX01voXQvn1d8a
         druhA9s12EFT+9er3yg5FXKfREGRHBkTBFTFjBCIPqzeKsKvNQDjrqbL2WpxuA2vUkyx
         W3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787938900; x=1788543700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VY/z5JBReRe7jugNdwruzvn3FKO8aDoyDfCYUNRNB5I=;
        b=LBd49SSpF/NvcSianlzIqZcIHrFWsys9QiALHeKkTvD1c2QtBm9TIChgXW9MSEebVA
         RuiILrC+UsezG7iw0mm/hi22QqsOVEOsIfzTWC8b23WCn8keeCJPOrBlZ4NzmUaUh2Y1
         cS0gvOAf26C9Ht3v76qEHd2fGBxW4qrBav+06t4Mn4EWOyAtplCF2+CWxxZt3gu57BUG
         xTP9dgSN5wUxFMXL0Pi1lllfQOMRMbAojCNDayPHF8Jb3QdjZjp4VEGVwmav9RsD3WVr
         iJCHJXMc7ugt2gNdBlNmyHr9NcnHISzt5Ftwke+hALFwieobalueGvb8C7QIhvDe/lXK
         1HXA==
X-Forwarded-Encrypted: i=1; AHgh+RrO/T9ozEApP45td5ivWTXVCXBVtf6z5ViQ0w+09SXIT+8+AY5PwJVnMiGOkWnuN1Zliv7mIiiRM0lnlYb+T0mv@lists.infradead.org
X-Gm-Message-State: AFuF++kGaHy0U94ETesixTCrLyZG5mc0TduNyox4Rh4UDH6jn2PxHYuT
	FhSjOi7UE+xGrLxs5jVLcNbe8jX9QOXKAElbGG7uhE4ksWZsN25v1ToA
X-Gm-Gg: AR+sD11BiLct+dynM2uZaKn5KyXvHLx0pARRZTnmaL0TqVFFby2QAEe7kTE5TQLk5dC
	3Ch9ZVj8fKhy4zG3zfvf9yIHTy2TiQ5YZIXDz4RU3v6AbaAapHWcLmKHJekwjvfGIjYzRIKht+4
	oS1KVn8x6xUW0abQHtffVok725EZm6VCLCaVsfuRJsPf7EwyVzHJAqK0UJ71OscSMgpfbnhcB6V
	gIPRaB2CVhmWc3hhLnfToNPpxoGOuNPdXQ6ipT4pRNlVwjuOqKVXegNY98grufr5S/UGUNcuv8M
	fV1F0Dkg2VMxE2of0fz2KI8VRctwfwTtXd46adExK5IMdr9N6CCFOQC19UD/yafOSe2FHqAmrwu
	EiAt8qJL/+waxWi8pYozLfFiOz64Yf2FOEm1qjOjo9rvkr8MDOHQUay7SuW7XH2+DfnEwxpDjSm
	S+IgcyHeJ787ac6gXLpu2dxgLIyfbjL1k6/PmHJ0U6EDUbsRmJ+zstpXY65QeuL99fuWdxWpKCw
	6vVR9FW/52D5WhJGHDB9rtTZiwh726f6OPOj8aVw+8SRKNSgZ30QBDxjncEVfA57E3VaEKG3cW9
	TEeROptC496BBL5EDMyPqGs+wm6IXlzSN2MA0daod1NjpshZGdg+k44MtEpJHVEoNdw9nTt8on0
	J4LLBN5LrLmyEiw==
X-Received: by 2002:a05:600c:a403:b0:49b:924e:9a28 with SMTP id 5b1f17b1804b1-49b924e9b14mr113822085e9.1.1787938899423;
        Fri, 28 Aug 2026 10:41:39 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-af4c-3c01-7c51-03f6-0452-bbca.310.pool.telefonica.de. [2a02:3100:af4c:3c01:7c51:3f6:452:bbca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91728319sm76193605e9.12.2026.08.28.10.41.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 28 Aug 2026 10:41:38 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: mm: Fix the lockless page-table walk in show_pte()
Date: Fri, 28 Aug 2026 19:41:31 +0200
Message-Id: <20260828174131.46825-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_104142_272120_15BA0C4D 
X-CRM114-Status: GOOD (  15.99  )
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

show_pte() walks page tables locklessly and can run with interrupts
enabled. A concurrent teardown can free a table page while it is being
walked. It can also clear a parent entry after show_pte() checked it; the
regular pXd_offset() helpers then reread the cleared entry and can derive a
bogus lower-level pointer and fault again.

Use the lockless offset helpers with the saved parent entries, as
gup_fast() does, and pass the saved PMD to pte_offset_map().

For task page tables, arm64 selects MMU_GATHER_RCU_TABLE_FREE. Disable
local interrupts around the walk to hold off RCU-deferred table frees and
block the tlb_remove_table_sync_one() IPI until the walk is finished.

Place the IRQ guard after the header print. This does not make the output a
consistent snapshot, but prevents the task page-table walk from
dereferencing a released table page or deriving a pointer from a different
parent value.

Fixes: 1d18c47c735e ("arm64: MMU fault handling and page table management")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Changes in v2:
- Move the IRQ guard below the header print, as suggested by Will Deacon.
- Use saved parent entries for the lockless descent after testing exposed
  the separate race in the regular offset helpers.
- Retested with GCC, Clang and Sparse; expanded runtime coverage to
  deterministic and randomized races, KASAN, 4K/16K/64K, PREEMPT_RT,
  and 50 native/KVM Pi 400 boots.

Link to v1: https://lore.kernel.org/r/20260815211316.974-1-kmehltretter@gmail.com

 arch/arm64/mm/fault.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 0b52557652be..75c3e463df2e 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -16,6 +16,7 @@
 #include <linux/mm.h>
 #include <linux/hardirq.h>
 #include <linux/init.h>
+#include <linux/irqflags.h>
 #include <linux/kasan.h>
 #include <linux/kprobes.h>
 #include <linux/uaccess.h>
@@ -154,6 +155,9 @@ static void show_pte(unsigned long addr)
 	pr_alert("%s pgtable: %luk pages, %llu-bit VAs, pgdp=%016lx\n",
 		 mm == &init_mm ? "swapper" : "user", PAGE_SIZE / SZ_1K,
 		 vabits_actual, mm_to_pgd_phys(mm));
+
+	guard(irqsave)();
+
 	pgdp = pgd_offset(mm, addr);
 	pgd = READ_ONCE(*pgdp);
 	pr_alert("[%016lx] pgd=%016llx", addr, pgd_val(pgd));
@@ -167,25 +171,25 @@ static void show_pte(unsigned long addr)
 		if (pgd_none(pgd) || pgd_bad(pgd))
 			break;
 
-		p4dp = p4d_offset(pgdp, addr);
+		p4dp = p4d_offset_lockless(pgdp, pgd, addr);
 		p4d = READ_ONCE(*p4dp);
 		pr_cont(", p4d=%016llx", p4d_val(p4d));
 		if (p4d_none(p4d) || p4d_bad(p4d))
 			break;
 
-		pudp = pud_offset(p4dp, addr);
+		pudp = pud_offset_lockless(p4dp, p4d, addr);
 		pud = READ_ONCE(*pudp);
 		pr_cont(", pud=%016llx", pud_val(pud));
 		if (pud_none(pud) || pud_bad(pud))
 			break;
 
-		pmdp = pmd_offset(pudp, addr);
+		pmdp = pmd_offset_lockless(pudp, pud, addr);
 		pmd = READ_ONCE(*pmdp);
 		pr_cont(", pmd=%016llx", pmd_val(pmd));
 		if (pmd_none(pmd) || pmd_bad(pmd))
 			break;
 
-		ptep = pte_offset_map(pmdp, addr);
+		ptep = pte_offset_map(&pmd, addr);
 		if (!ptep)
 			break;
 

base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
-- 
2.39.5 (Apple Git-154)

