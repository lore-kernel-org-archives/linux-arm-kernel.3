Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37CEC5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 13:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kA/leMB5Bml9VvmxH4fPbAWvPl/SN0OCbc+8KnqiWlg=; b=Pftpr7ftwqrWlS0vtoaf8UXtnx
	llE8IkyZf4EI8VF26c+jMyyAKMCQsxgw8duIch6A9KDunGNt7A5t2kIAqTzpFiuJdRn2/ToBbiR+Z
	SgJuT8AlK10kYRaEsSnK/NniVET8+XXyhGuNGu5vIzLfXQIdABc40fU8kLUTcrLbFfCtJvhHtIYDQ
	bQXWGlv18hIhcHLHHpNlXDc3QQf623OdToc7el9Rs6BrC6zKvHYyL4xiA4LOI3cxLGMB0nPtVlICE
	n6QOotHxaJr9IpXcV3aAotmdOrhCsw5OcMHBA3Wb8qicc9bo82p/lbjBtzj1HKgkXaLPdZHHdt+5C
	cZ3xuORw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxmB0-0000000EYmT-2F2X;
	Sat, 22 Aug 2026 13:54:26 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxmAl-0000000EYaa-1u73
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 13:54:12 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-495529a93f9so17490085e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 06:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787406849; x=1788011649; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kA/leMB5Bml9VvmxH4fPbAWvPl/SN0OCbc+8KnqiWlg=;
        b=o9mj6dYlQV3L+VVuPcfckCy3eA+1hYs4+hkh0qYYrnGir3NKlWySZZ/St9qwSzViC8
         i3DN6HjnUAOcUzuGjBM6dj+O9TCyzFT4OPAKkJGxQKP8Qqwoar9yxMW/wCowSM8M5bTc
         nLEzS78m92cpRXaMagkkhsTipY9bz2MFpuGz7Y5PCEnksQeqKAbFMwE8ynBTyLzPgmlw
         K/fj0pY7CiSodanafOcQzXLxtm5HlrLQC/2hGmBGSk7KNU6EdQJwzS+KlsuwUmYpMOT/
         mIyQWEp3IxWcEML2oWvdfO+vpA2cxuk55UZJckU5NGZiowUmypj4kHAgh/t0JFzjSRK3
         HTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787406849; x=1788011649;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kA/leMB5Bml9VvmxH4fPbAWvPl/SN0OCbc+8KnqiWlg=;
        b=NtXsritfKN0p79fvw9mt1gei4yst3fINbO8s5ARUu53Vi/nh8V5Yo3y4aPggLpcqfq
         ZVdilchsNquCy9nYIBAe1lWfuP/fbndtteCJ24+LBJWmZoV0YOaCHIjZLA1HdWzQHFKB
         k6Qy9r4AZccCgLxfAlhVNVysy8AKEokKPsmXzcUc+L84ed9bsojfklWSieEsGofYVSaS
         +Koos1Za4Q5d/Pvt8yEVrNKvGIYjm6PCaIFtnfjRYVqDRshQvZuRgRh+uMZYK2KZoyk5
         ny8rzDEPxpby38UEwg01Ofc5uhOyAdpAQJyAg0Dr9fCXWmuvVHpd6Xe4LCbdc4xxW53C
         9arg==
X-Forwarded-Encrypted: i=1; AHgh+RpNcAL7Q35LKnSuq9XqtdpAM9tIg4iRvlWZLG1LuPs5DeupcMUUUxewbv1FJ+b/pqgwFbPVTdJPW5PXJn1S6k/H@lists.infradead.org
X-Gm-Message-State: AFuF++nPlJg7nZziYJUvDyjJA7qh5y5T/J42BSG8Pfx02puHEt1a2K9k
	hFp+/JvcKek0W4yfQoko+MRTMdZoPhEYW5Hj/nxeNxqWHFRNc1RqgGQS1Emn/OeJSth9NaCa2g=
	=
X-Received: from wmlu19.prod.google.com ([2002:a05:600c:2113:b0:493:ae35:2761])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3584:b0:499:8777:ccba
 with SMTP id 5b1f17b1804b1-499c19f3a09mr55389195e9.12.1787406848610; Sat, 22
 Aug 2026 06:54:08 -0700 (PDT)
Date: Sat, 22 Aug 2026 15:53:27 +0200
In-Reply-To: <20260822135323.795946-11-ardb+git@google.com>
Mime-Version: 1.0
References: <20260822135323.795946-11-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1748; i=ardb@kernel.org;
 h=from:subject; bh=plFvUlms3IX09TbA06fuB9Z3i2CHbmXiXP7osp2wqLc=;
 b=kA0DAAoWMG4JVi59LVwByyZiAGqJqduhaXhTLES9U3wa8QeLoLCFbLjTooS/ld4OUN8Ev+zVT
 4h1BAAWCgAdFiEEEJv97rnLkRp9Q5odMG4JVi59LVwFAmqJqdsACgkQMG4JVi59LVxbUQEAwLd0
 PDSvV2zyQlqIymz5n+L53p/Botvaje9PasDJEM0A+wcjClUJb3hpwyZuyoMYZ/HDrLzn0R7+g1/ X39juar4F
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
Message-ID: <20260822135323.795946-16-ardb+git@google.com>
Subject: [RFC PATCH 5/9] arm64: mm: Permit permissions changes on huge vmappings
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
X-CRM114-CacheID: sfid-20260822_065411_515172_60F33871 
X-CRM114-Status: GOOD (  14.79  )
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

Allow permission changes on huge vmappings in cases where no splitting
is needed (i.e., the region is aligned sufficiently), or when the system
has support for splitting live mappings.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/pageattr.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index bbe98ac9ad8c..20ff9cb273c1 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -169,8 +169,6 @@ static int change_memory_common(unsigned long addr, int numpages,
 	 * we are operating on does not result in such splitting.
 	 *
 	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
-	 * Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
-	 * mappings are updated and splitting is never needed.
 	 *
 	 * So check whether the [addr, addr + size) interval is entirely
 	 * covered by precisely one VM area that has the VM_ALLOC flag set.
@@ -179,7 +177,16 @@ static int change_memory_common(unsigned long addr, int numpages,
 	if (!area ||
 	    ((unsigned long)kasan_reset_tag((void *)end) >
 	     (unsigned long)kasan_reset_tag(area->addr) + area->size) ||
-	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
+	    !(area->flags & VM_ALLOC))
+               return -EINVAL;
+
+	/*
+	 * Disallow VM_ALLOW_HUGE_VMAP mappings unless the region is PMD
+	 * aligned, or splitting live huge mappings is supported.
+	 */
+	if ((area->flags & VM_ALLOW_HUGE_VMAP) &&
+	   ((start % PMD_SIZE) || (size % PMD_SIZE)) &&
+	   WARN_ON_ONCE(!system_supports_bbml2_noabort()))
 		return -EINVAL;
 
 	if (!numpages)
-- 
2.55.0.860.g4b6b3295ed-goog


