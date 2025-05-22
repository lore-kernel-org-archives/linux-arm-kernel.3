Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCDBC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 20:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTNsWaa+xXDWy+Z07MlUMIrgcNV8S+7CewyD0hTqQ8A=; b=tzgXEUsmpkC9LIvsmAS6ZZnlxQ
	6MlbBx+pduRjnqBb6tZsXeZlJvCbbNsUomG7rYSBrWcUXDys8Nn2/mkv8GdsR6gKJ0p5BBEyFwPIM
	4bSTfN3HDfMaE16n0QY1kxTTdLTccsdiatBA+Xb2XUXk1E84sGb1uPRCt8Uf+Efx7vrYXsXpGloQt
	tNgUBqR7ccctkIHYog1s3qC8MRlWjRe5bghXP5K1qHY0s5cLtGn8JNW0BQ5Use8wIxpfRZ3DWe5RN
	Ex39OVRWJLLzMiSU0Y6YNfsWlJ65KvJfInHPUJ26B+47//gPTDwgzr7iVpTS93UX6ckYSVuSCBd5V
	FjnHHYUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICxx-00000002ARm-29kQ;
	Thu, 22 May 2025 20:56:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICu6-000000029qp-0yM7
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 May 2025 20:52:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lTNsWaa+xXDWy+Z07MlUMIrgcNV8S+7CewyD0hTqQ8A=; b=IiGo9iqo4CIKeLD+jSZoZA0LXJ
	GWFmPcwdhknqnMuARDk1CmKpCIRR/FkkiIS+DLoyxUaYuM1rBuW7b7DKjwkgAFteHnDlhU9jC9Qqq
	xPU2GVVp2hCgxyzHkK5DP00EZM2QRfPqKMCmUm89apY9IbpmIH//vM1vuHTTHUZsi4ZoU9XeMJN6v
	1xGfJeb7JpUrhH57c2Bb7zoC8HQcjC8ihf+Ak/rfpHFvltSVT9/PjC9Kb6amHd2SWBZeLv9Y0Yfot
	5WA7LkMP2vG7byerFbyKdBUr4OeMlH65o8SAMIO5ThWR8vlN6YiGAIyfAOieszh3arBHSVHAHJ/7z
	wPyl3tdg==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uICu2-0000000156p-2bzj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 20:52:36 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-742cf6f6a10so6710662b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 13:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747947151; x=1748551951; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lTNsWaa+xXDWy+Z07MlUMIrgcNV8S+7CewyD0hTqQ8A=;
        b=vINur/d8FqVZoQMpRyXeyCXZi02TCtvC2ZRknhRDzprqY9N0XjxJMaT21OyvPakRVw
         f8J+Xn2kf5g4VG40pzqv0SQyI3jaC9zAjMMu7YHO+c2xLWC8EFlCCRchnt8MSzdG4MC9
         EZhD8axbEOCljyHYD8NVJjQNQpoeR04XzrFF/rmCWdYI2t0KK6E0zgNjt9liwqhklxpr
         J/iqJvVQhZ5pe59NTfbU6EApP1fLPLQK8xN2O/Uu1SM95CY2wdxSdFiHrBEAcgK5EZ2z
         SkCwgF7mHIEo6SLbaS1Z1DAkCRYh09l81uEyA3MLRgUfkUGMYu0Hc7nEQ1PBznRQRS2G
         sqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747947151; x=1748551951;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lTNsWaa+xXDWy+Z07MlUMIrgcNV8S+7CewyD0hTqQ8A=;
        b=ez9nHpW5xSBWk7OqF3sAqexn6uG/mze+EaoQRLnIADsJMVzBdEA/VrVVDSVtehQQmq
         hhUwsYz0XHXzPagqrwimeDtsa2rEqqUE509qIj+l5kFWQzzr4RmplyAbFAOWnJjZO3j3
         NS9CJB8gBpZ0V3yIwgjVFhdNB4abGes+R0ah6FHSLXdzR1NU2p9TcKdCOaTk9XBbyiA1
         I8/SPRCJr4+ZPMu6piJp/i7eglgY1Fk2PlkyemAYCBC3zCjR6U/7UzdiE8GfOAV4eTt6
         Ib4nxiYHkG2DjBdEnRT+T2HBrPnEHYFVFu4PG1TE30OnMFEkHOFAnR4u3QZ6TCd0Piuw
         Zzwg==
X-Forwarded-Encrypted: i=1; AJvYcCXQZL+jWQx4s002v9NtXYF83eui4UshwhlUjHr3YbF/soyPzgxqXi3AIZUlvEH7VtMGgGQY3i/Uo/5aq/MnHI4R@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc2lyVQmitoWLEoNQSagPvy3X8IwS2TdVF2VDDHnnwx/yTkMgi
	57DSBYKXNXTHv/TBKwu1dSHQnOABIme0MxRxaPRk9nbhPObhEGywZLzbtrF2S7Yv6o/SruwKdeF
	3t8zWl5q3vCpmkclT2WXUQQDFWA==
X-Google-Smtp-Source: AGHT+IHLdqAzTz34viFnps5+L1k4uqKuPTmizbaw4PZVV/o+hYa+CWaACxRXdV6L90Y51rrMf50EFhy74KUBFkj1Ig==
X-Received: from pfblm17.prod.google.com ([2002:a05:6a00:3c91:b0:739:56be:f58c])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:138e:b0:73f:f816:dd78 with SMTP id d2e1a72fcca58-745ed8f7a7bmr630155b3a.15.1747947151473;
 Thu, 22 May 2025 13:52:31 -0700 (PDT)
Date: Thu, 22 May 2025 20:52:04 +0000
In-Reply-To: <20250522205205.3408764-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20250522205205.3408764-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522205205.3408764-2-dylanbhatch@google.com>
Subject: [PATCH v4 1/2] livepatch, x86/module: Generalize late module
 relocation locking.
From: Dylan Hatch <dylanbhatch@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Song Liu <song@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>, 
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_215234_865625_9A7A7FDC 
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

Late module relocations are an issue on any arch that supports
livepatch, so move the text_mutex locking to the livepatch core code.

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
Acked-by: Song Liu <song@kernel.org>
---
 arch/x86/kernel/module.c |  8 ++------
 kernel/livepatch/core.c  | 18 +++++++++++++-----
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
index ff07558b7ebc6..38767e0047d0c 100644
--- a/arch/x86/kernel/module.c
+++ b/arch/x86/kernel/module.c
@@ -197,18 +197,14 @@ static int write_relocate_add(Elf64_Shdr *sechdrs,
 	bool early = me->state == MODULE_STATE_UNFORMED;
 	void *(*write)(void *, const void *, size_t) = memcpy;
 
-	if (!early) {
+	if (!early)
 		write = text_poke;
-		mutex_lock(&text_mutex);
-	}
 
 	ret = __write_relocate_add(sechdrs, strtab, symindex, relsec, me,
 				   write, apply);
 
-	if (!early) {
+	if (!early)
 		text_poke_sync();
-		mutex_unlock(&text_mutex);
-	}
 
 	return ret;
 }
diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
index 0e73fac55f8eb..9968441f73510 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -294,9 +294,10 @@ static int klp_write_section_relocs(struct module *pmod, Elf_Shdr *sechdrs,
 				    unsigned int symndx, unsigned int secndx,
 				    const char *objname, bool apply)
 {
-	int cnt, ret;
+	int cnt, ret = 0;
 	char sec_objname[MODULE_NAME_LEN];
 	Elf_Shdr *sec = sechdrs + secndx;
+	bool early = pmod->state == MODULE_STATE_UNFORMED;
 
 	/*
 	 * Format: .klp.rela.sec_objname.section_name
@@ -319,12 +320,19 @@ static int klp_write_section_relocs(struct module *pmod, Elf_Shdr *sechdrs,
 					  sec, sec_objname);
 		if (ret)
 			return ret;
-
-		return apply_relocate_add(sechdrs, strtab, symndx, secndx, pmod);
 	}
 
-	clear_relocate_add(sechdrs, strtab, symndx, secndx, pmod);
-	return 0;
+	if (!early)
+		mutex_lock(&text_mutex);
+
+	if (apply)
+		ret = apply_relocate_add(sechdrs, strtab, symndx, secndx, pmod);
+	else
+		clear_relocate_add(sechdrs, strtab, symndx, secndx, pmod);
+
+	if (!early)
+		mutex_unlock(&text_mutex);
+	return ret;
 }
 
 int klp_apply_section_relocs(struct module *pmod, Elf_Shdr *sechdrs,
-- 
2.49.0.1151.ga128411c76-goog


