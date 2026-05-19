Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43B2CD5BAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EjHc0cb+NE/2F+UEf5a5kfxEL68f5+QTn7aAzw8hvjg=; b=D0ZcgWRXa6Ckr1tDxLsGoFMHxr
	pdZ2h14esSATmzNRpaRpl5ij5hS6Wcz9GNlqqqCI7bcb6CNwDY5n+3CBqN5GkVTpCLC/s9tEC0cO+
	kvH1tHBql01TmhoH2k0EC5u7zVsrD5HgLJy2par5BKvwkLKxL4s1OpXCjooA5U6IF1y5u0HDmTMXP
	9l39zrVjWRT3jPuot4/EB29DHnMdwYv+vfJentT88J0nYdPM1I8fdZj5cfpYddC/GK3urmWQi0lbM
	gr51RLXxjyS1v6J/h8eNrLm6AFQsblG/VgW4X2cneJQf9kRbQhrb935U+eXKbfwgOGnVEePQ5DPPh
	vTpAKeIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMDN-00000001ygI-2Sol;
	Tue, 19 May 2026 15:18:37 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMDE-00000001yXJ-0Bo9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:18:29 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-43d7b7bacddso2939797f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 08:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779203906; x=1779808706; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EjHc0cb+NE/2F+UEf5a5kfxEL68f5+QTn7aAzw8hvjg=;
        b=MbUVagf909ClhS23ZlccxwFM8MrhXJIfEj/z7z6k6HSLLWcF43zQQKsRpx8KuDhLGB
         DJIeNnr+vc7jSftBHSH1d+nx1QbGfXtVPGMFWOcfBcAWSkDwEa62XCjOU6Bw4BSueM+b
         bUXOr2Q1g8bNUjOFjVcyxoOJ8+2hoI91Hnpis9zYj5b9t3YQwHv32dpKVm3U6eaZDOa9
         pJ4wqjKhhRUmAZKmwVk2Spp8woQ9hcJplg2KGC1hvyEkylOgkluHsRoQcItqQPhhSy4t
         Us3cRYRLjjtAAIA77fUDOXUg7Rn/kfg3HXest+du+j8hWu3azKshc381zh8CI5b5/LwT
         gbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203906; x=1779808706;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EjHc0cb+NE/2F+UEf5a5kfxEL68f5+QTn7aAzw8hvjg=;
        b=RMPDxagGR/aiO5Ep2OTDeu0w56rCE1hUnZp9sjf9LCcSfOLMNKHWJ47TY+XrYRJbLP
         Yl2uffkqxPLRYP5SAXIUuaVuL0F9N2TO0ZC+K5l6+NQuQMZbnBI/83jDN75/fv+wbMr+
         qIJH8lM+Xj1tL8HMJz9a/MBegmyafjpLZcGZ97mxUEPB33VN4RT73SC8cVCUuS354gQh
         0Qo/H+yh82pe6eGRC5DMJn0HQE9ldm/j8Z4ggTQPzLk4bQcFtJjkGZST6epgjpyJ7qaM
         3ww4wP4W4/9PM5Ps/O7/gOeVKyuWhoiLvKsYbmTUdZFwmlsNSHxgK6r6McVEN23o+w8B
         f53Q==
X-Gm-Message-State: AOJu0YxhiwwUbQ7lmzRB+g5qGjZvEsghDM/wGf1EGrFtoKJ0RrIcNjtN
	RrTOftaQ6urZRwmZZFJvmFzp+eX899mZPwEsnIhQIopNIMafuJt3E9B82q7uXlSwv8WDzU32jnZ
	ENHRTEMYhf2/KycXe/sLksDQ7gsYOKPE0yY04SJRNuvLwHUw/0LoQM9T0Qyte4T0V+wQ3pMDwag
	OgQwmsR/GP7qQPgs4XFMFtqJ0wbGPvolOU6cNoZ9em6bmM
X-Received: from wrjb13.prod.google.com ([2002:adf:e30d:0:b0:45b:cad1:2df1])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2c06:b0:45d:4fc0:fe0a
 with SMTP id ffacd0b85a97d-45e5c5dd346mr33349921f8f.32.1779203905296; Tue, 19
 May 2026 08:18:25 -0700 (PDT)
Date: Tue, 19 May 2026 17:16:24 +0200
In-Reply-To: <20260519151616.2557018-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260519151616.2557018-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=914; i=ardb@kernel.org;
 h=from:subject; bh=DzlMi7mku98t808/4L/IevsaqNhHNBA7ZPaOWGTKp3M=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIYun7ozjx5JHO2c9Tvz2bbb1UYGuFVGxfyOk/Lcl39l/K
 H2HsKVMRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjI0z2MDCcD0w4yfjZVbdjI
 l/1mdYzWeoF7uf/65CXWOutIPTyn6s7wz/CboZoY8yGh2dyvFDVyd1ef1EtQfpqkvm298dz7pw+ +ZwAA
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260519151616.2557018-22-ardb+git@google.com>
Subject: [PATCH v5 07/13] arm64: mm: Permit contiguous descriptors to be rewritten
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
X-CRM114-CacheID: sfid-20260519_081828_094740_F2B0BE77 
X-CRM114-Status: GOOD (  12.92  )
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

Currently, pgattr_change_is_safe() is overly pedantic when it comes to
descriptors with the contiguous hint attribute set, as it rejects
assignments even if the old and the new value are the same.

So relax the check to allow that.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 0405fac18959..7cecd25aa83b 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -134,10 +134,6 @@ bool pgattr_change_is_safe(pteval_t old, pteval_t new)
 	if (pte_pfn(__pte(old)) != pte_pfn(__pte(new)))
 		return false;
 
-	/* live contiguous mappings may not be manipulated at all */
-	if ((old | new) & PTE_CONT)
-		return false;
-
 	/* Transitioning from Non-Global to Global is unsafe */
 	if (old & ~new & PTE_NG)
 		return false;
-- 
2.54.0.563.g4f69b47b94-goog


