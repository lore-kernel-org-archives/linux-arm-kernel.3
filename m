Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A46C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 18:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=92VpszQeWU7JifUGtOrwdJo97oyAeIi7e4IDebGw7f4=; b=S9p/QQgIXxIXLCC/o7mKRq0FIB
	4KtuDoTKbJcOzZiQGa0234qyYkPnIxwRbfxNZu4JCApZUQiZQueCwGc/KIulGU0SKSBNjeyhr9V6T
	KDOht0JCk87hDl2wmhCtCnutR2Tv6zWtXpZsFxlRvNGLqCsMF7sRDIPqHNaeiNUlF5gHVrNdxlMk+
	wJj6H5cFFQK+eSrBzGC5WPAZSbxV9BINuHCMJkDFFRD6wK/P72YOau8Y/VMWtVPI/g4NRNLPQi6wQ
	jOmsVVNo1pCD63LsLosmcwf3C/oaZqKXwGgZVw/r15JWxW8EcWcyJo5vSIusDxhOCiFqrGTm1riy4
	F76YU+lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIAyK-00000001uQx-0NEH;
	Thu, 22 May 2025 18:48:52 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIAtD-00000001tQy-1lIR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 18:43:36 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-742a969a4d0so5747819b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 11:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747939414; x=1748544214; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=92VpszQeWU7JifUGtOrwdJo97oyAeIi7e4IDebGw7f4=;
        b=n7Eo6yITWigFGhxLnhskwh1s2VMU9xDW0H0W3e2gQdqwyXXNAyLbzxVvBzTQzCVvVY
         Y/aU1tcDNKakUW+3VtpPjrZ+WNx033YebMgm/NKiXZ/gTc/H26qHpZJzE23jxs1FMF35
         USnITEKfF1i9oFhRWhU+xmvHrdzUmVUjitbx3e76QOgQgUlx0vIJZZudvRPWkK+f3GxU
         akbYRSFCdKChJydC9OAMpHjHmj6GYkpO3B09MIYoi8vdouKEe4Kq9nnlMwbhpZpuz+O5
         Ng+LSS0fwywQ6K2SD2dJQiHU7eylgUkPHwKWlov0spK4DVR87YvIzZ14eraRfheHsXt3
         7lyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747939414; x=1748544214;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=92VpszQeWU7JifUGtOrwdJo97oyAeIi7e4IDebGw7f4=;
        b=IZ6lNQhpQmBGu+tJpG5SoZcRVLrNp717ZQPuvd0lK+HbccvjLgdydyeVlNdIyT7Z/R
         lqO1g20JhW5ZQYvCa9dXBjph6strF1BNZZMfs0lrqzked5Ben3z/nLXNTNgKEJpwCC7x
         NMFHAjioNjLgnTtsXQlXUR7/ZjxuE1GG5mBygWO2ZjSTHNFfMv9l6EgwaA143mUA4hnB
         22azugkhvMdHzIiHOTk2lNLtJpq7AODtyCReb4/prouoePHaxhnBLAvVj+TP+x59YJWn
         Jpi9CxecXkHfb0GL+IhPt57HIyHqJbHd06T/CkbTxSe84Ad6XsCG4CFLZb1ZnyuoNZGF
         wT1A==
X-Forwarded-Encrypted: i=1; AJvYcCX39NBlKniqaUFdgwIND0BqJoLLB2kF8bsQQCdD6Z0qVwXSVpRSRTceabEvbmZHycA2iOAbAUIvdf1rHUfKBTDa@lists.infradead.org
X-Gm-Message-State: AOJu0Yz243FFyk0JgxpAkhZrbgk57ysO8xjHxMu+agRGombvFWYu06g4
	tmjGlv2DIFbjq1LZnQ/5dk75tccs3CMBi5F7OgnVm8Zz3WzS7rbhawwk7XI6durYR7LAwDNmnH4
	icCnBSJT+bQM5yhJdsK9lSzJS3A==
X-Google-Smtp-Source: AGHT+IGKUcET+DAt6Z7npMzRM8aN3sJKBM05Fcb4AydPl2HZdYYbUgJFo+MDKjqDZlJXgFGLoq8r/15q55J3rGWQ/A==
X-Received: from pfbbd35.prod.google.com ([2002:a05:6a00:27a3:b0:737:30c9:fe46])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:130e:b0:742:a77b:8c4 with SMTP id d2e1a72fcca58-745ed847e76mr239264b3a.3.1747939414028;
 Thu, 22 May 2025 11:43:34 -0700 (PDT)
Date: Thu, 22 May 2025 18:42:48 +0000
In-Reply-To: <20250522184249.3137187-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20250522184249.3137187-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522184249.3137187-2-dylanbhatch@google.com>
Subject: [PATCH v3 1/2] livepatch, x86/module: Generalize late module
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
	live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_114335_459084_4BB54845 
X-CRM114-Status: GOOD (  14.85  )
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


