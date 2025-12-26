Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D087E8FDBA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 22:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XrpYuFgGuOqDarimfgNWi+H5QYEBWUzUVIbcnmljV6w=; b=4SMh8drk89sXrg
	4p5UoajmQ7ACPPASGuZ+MC+bSOo4vBbB37tqd4VkEkGZnO608f8977UOZH0MzpS32woT0MykA1jKw
	rvutHaA4RqnBwBwp410krIJXvSp4mYxXov9ZFnJOGwdHFpCICP+Erid26e00Qu5pkGATOZmeSmSG3
	6fRGs+bPjZOoWFf4MKZWK1G2qfMyerHUWcKPgqKJ8C8s8YhFoHbCY1zhJxx7icFDeUxiFAeSWhcCI
	0QO8rULYndVyYKAwFol3UgZrDSCULlowWW9FH32Cs7iDfD9Por05jCEYdd6nVybkpFxB5PPrwCE6y
	SKPDLzvJgFDmLRr2qj9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZGgp-00000001X8B-3ggz;
	Fri, 26 Dec 2025 22:53:43 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZGgn-00000001X73-1v4o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 22:53:42 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-34c3cb504efso8663770a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 14:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766789620; x=1767394420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrpYuFgGuOqDarimfgNWi+H5QYEBWUzUVIbcnmljV6w=;
        b=YjXt2nZJXTigJvShcRSAm3mlsFcgXUdjfJopRjFNJ6d4Iq3tTYTe3DWRwjryNgDx2E
         gcjiT5ra3g9XzL/TWQVX1Hxr6PnAgD9DDXqClmt5v3taCEwGyShGH5Tp0KhKpFlrh13E
         mYPWeQxQ1TA0WR/r4CYRcPqP9Yl/60/wF3lny4kbtuvtL0AAcEa+sC57LzEI+H/s2rx6
         DSgA09yJgCln01qKpaEvwLwjXFvCLaSrBsLKdBCCj2eODtqlw3PVmPEoFY0veC/Rk5+f
         QyqvRdThsBPcItNxFKDNUpsvvPfqzmUeonazpIqHVKJBpgp9XboP/bXzP/XFlnCNhT6C
         OfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766789620; x=1767394420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XrpYuFgGuOqDarimfgNWi+H5QYEBWUzUVIbcnmljV6w=;
        b=Y23mZ95R+ni9d0uFh8TJosW9FfaiAdONQAVGRKkH3Xszm51SNaykQIcUWKZD1aAjqA
         9DwFJowk2XSbgeuqrDYeo3QbYI1TynNpEwc2zCW6pL/uoApl81YJdVAekJ3M5mKDukoJ
         uzrgFwMDlHP0jNNM4YlkIuoE+C+nl6FVKqwMFizAWbjrxsUVQzJkiet+ns2PFKtWPPsO
         iZfRRpu7RrxK93c3xEznhvFt0K6MnudC5pXEFTLrTFrqC9DHtagA4wjMDN6tFGZfmD4z
         UmPJW6hjS7BZ5w9HobeJwFeiH84JU63E4psgGp5lc4nHQdeaMh2rORrTYGcZP35o3Mf2
         5E/w==
X-Forwarded-Encrypted: i=1; AJvYcCVI3y2wvcQ5+DNO/EolORilHYgCDjXcqkhzNCZNklFN1rj6xEOWjL1OeC81tmkcNZZJ2Rd+AST03DiOO5VLi4NB@lists.infradead.org
X-Gm-Message-State: AOJu0YzVem0GLzedvyAr6pJFMI0teSPkkaMNEeojANZ5sW/Yd8MosY5V
	550eDl5e/9YiEE+rStRJM6C6bRayqmK2uIvz/qmiShx78vwyjg0vAs83
X-Gm-Gg: AY/fxX4a6d7GLdtlE+b3+P8p80KAfD8BqOM70LFjwfDQNcWMAngwu4IutwRZ78W67cE
	PvdOIxqSCCWX/+aupMr2GkNh4TUuxaYyC3qxUNZITJfqnw6Y5V5sC0SWCxt5Y/ituzqHQP4QxAM
	KCKbVsX2qzJiIsvfP3cuFUh/hodyxxa7xK+piay2dWpkPoFIVoA1T9Fa7RMz7/T8xeLLyMQynbL
	4K76MkYNeFdPLRGGgLGtol+FOdX+j2HfBBATjg+Q22VDSrw2Iaqa5H5IKZjlOEqtwGv2wHWYQVr
	sW8uM89/oFq7CPszfg5/4hCx06gYpzBAzshVjoq+0zNZuUVKHG/kj8iYB8pfx8hK6AGkgjYcWlA
	boWC3nc0uG+iMN/D+LYGVP+68vc2FA/ZWtlWGO84R90NFV2MRbIud7HAmd82RIGxW6FbjpHBNf0
	D4Hvxcdo/BSZ1q
X-Google-Smtp-Source: AGHT+IGZAwVjw6Q14Ldbj2NnyfuDwpis8NstpDAoaBbm3hUZYJbQhE2SG8A3iUeExaHFKxkFLgGP9A==
X-Received: by 2002:a17:90b:528a:b0:330:6d5e:f174 with SMTP id 98e67ed59e1d1-34e921b05f6mr21341646a91.20.1766789620383;
        Fri, 26 Dec 2025 14:53:40 -0800 (PST)
Received: from barry-desktop.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e772ac1acsm9981428a91.9.2025.12.26.14.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 14:53:39 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/8] arm64: Provide dcache_inval_poc_nosync helper
Date: Sat, 27 Dec 2025 11:52:43 +1300
Message-ID: <20251226225254.46197-4-21cnbao@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251226225254.46197-1-21cnbao@gmail.com>
References: <20251226225254.46197-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_145341_520799_60FA65FF 
X-CRM114-Status: GOOD (  13.59  )
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
Cc: Barry Song <baohua@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Leon Romanovsky <leon@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Tangquan Zheng <zhengtangquan@oppo.com>, xen-devel@lists.xenproject.org, Suren Baghdasaryan <surenb@google.com>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Barry Song <baohua@kernel.org>

dcache_inval_poc_nosync does not wait for the data cache invalidation to
complete. Later, we defer the synchronization so we can wait for all SG
entries together.

Cc: Leon Romanovsky <leon@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Signed-off-by: Barry Song <baohua@kernel.org>
---
 arch/arm64/include/asm/cacheflush.h |  1 +
 arch/arm64/mm/cache.S               | 42 +++++++++++++++++++++--------
 2 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/cacheflush.h b/arch/arm64/include/asm/cacheflush.h
index 9b6d0a62cf3d..382b4ac3734d 100644
--- a/arch/arm64/include/asm/cacheflush.h
+++ b/arch/arm64/include/asm/cacheflush.h
@@ -74,6 +74,7 @@ extern void icache_inval_pou(unsigned long start, unsigned long end);
 extern void dcache_clean_inval_poc(unsigned long start, unsigned long end);
 extern void dcache_inval_poc(unsigned long start, unsigned long end);
 extern void dcache_clean_poc(unsigned long start, unsigned long end);
+extern void dcache_inval_poc_nosync(unsigned long start, unsigned long end);
 extern void dcache_clean_poc_nosync(unsigned long start, unsigned long end);
 extern void dcache_clean_pop(unsigned long start, unsigned long end);
 extern void dcache_clean_pou(unsigned long start, unsigned long end);
diff --git a/arch/arm64/mm/cache.S b/arch/arm64/mm/cache.S
index 4a7c7e03785d..99a093d3aecb 100644
--- a/arch/arm64/mm/cache.S
+++ b/arch/arm64/mm/cache.S
@@ -132,17 +132,7 @@ alternative_else_nop_endif
 	ret
 SYM_FUNC_END(dcache_clean_pou)
 
-/*
- *	dcache_inval_poc(start, end)
- *
- * 	Ensure that any D-cache lines for the interval [start, end)
- * 	are invalidated. Any partial lines at the ends of the interval are
- *	also cleaned to PoC to prevent data loss.
- *
- *	- start   - kernel start address of region
- *	- end     - kernel end address of region
- */
-SYM_FUNC_START(__pi_dcache_inval_poc)
+.macro raw_dcache_inval_poc_macro
 	dcache_line_size x2, x3
 	sub	x3, x2, #1
 	tst	x1, x3				// end cache line aligned?
@@ -158,11 +148,41 @@ SYM_FUNC_START(__pi_dcache_inval_poc)
 3:	add	x0, x0, x2
 	cmp	x0, x1
 	b.lo	2b
+.endm
+
+/*
+ *	dcache_inval_poc(start, end)
+ *
+ * 	Ensure that any D-cache lines for the interval [start, end)
+ * 	are invalidated. Any partial lines at the ends of the interval are
+ *	also cleaned to PoC to prevent data loss.
+ *
+ *	- start   - kernel start address of region
+ *	- end     - kernel end address of region
+ */
+SYM_FUNC_START(__pi_dcache_inval_poc)
+	raw_dcache_inval_poc_macro
 	dsb	sy
 	ret
 SYM_FUNC_END(__pi_dcache_inval_poc)
 SYM_FUNC_ALIAS(dcache_inval_poc, __pi_dcache_inval_poc)
 
+/*
+ *	dcache_inval_poc_nosync(start, end)
+ *
+ * 	Issue the instructions of D-cache lines for the interval [start, end)
+ * 	for invalidation. Not necessarily cleaned to PoC till an explicit dsb
+ *	sy is issued later
+ *
+ *	- start   - kernel start address of region
+ *	- end     - kernel end address of region
+ */
+SYM_FUNC_START(__pi_dcache_inval_poc_nosync)
+	raw_dcache_inval_poc_macro
+	ret
+SYM_FUNC_END(__pi_dcache_inval_poc_nosync)
+SYM_FUNC_ALIAS(dcache_inval_poc_nosync, __pi_dcache_inval_poc_nosync)
+
 /*
  *	dcache_clean_poc(start, end)
  *
-- 
2.43.0


