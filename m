Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA191098792
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5a6/TT9mH0HWBhHsirKfDsnDlXwFBJ2biY25rPtLGE=; b=orW9YwhL6vRQyygw9UfVGBSWJ2
	nO9Ch/qQAaZ1VDfQXZj2BTxp4J6ztF8qCEBc7O7xU+5ZXLJI8WnM3kRaRKb7oee80kjdUD+qvRBKw
	zv+M6kMdXM+lJHyQp8bpoQE0few2zJkSdvzKKcOBe2S9CCdXEA5X741ZkKcRKdcVa7f6N+7i3SpP6
	HsPCeZwS32K/wKg7NHQyaPXiyl1URXMpXBSrHWhxJuQiKWm2eb+IfW3hSZSKnmg6gzbFbhfa+OFdz
	HZLy/e0DSxTdJRql7Q6InG7OkgmFSjdU5fl9kiSF2Gp9dEuHKpkz2zDeosri/jRslkuX9zEbHB9Dh
	VXwJb1FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKc-0000000CyWN-3oov;
	Fri, 20 Mar 2026 15:00:10 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKT-0000000CyNg-2uum
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:00:02 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4852cf0318dso19803275e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 08:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774018799; x=1774623599; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=r5a6/TT9mH0HWBhHsirKfDsnDlXwFBJ2biY25rPtLGE=;
        b=WQbP6cBEwK1Dw8sETiaWMavbS63vb0qJrrR78wshVdkCso2IIKsqloBHEb7H/yYpNB
         B/jHixTKGXi7LsDUJXQoAZR1nVpTt033C58XGhGuFmWW+Bb+o/ACBxccrB0Y56URubLN
         euvUxZnOdUGIV+4A3q8BWs0ip1z9sIVDHqJ2oTLkEFc6Md3iuBMQqcoVjnkFcdNktPBQ
         P5hZaRcrs/qMKDW90R/fjKZjxBy5h6ip3aHIJJQbRmYUOWX6r1BACRYlM2sf7BrkIUJQ
         y3Xf9LL+BaKVNX5M7b1s+SPyGokstqgH4RqvJKpXES80j+dhXdAO7oZ/bezBM3XV2v4b
         lxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018799; x=1774623599;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r5a6/TT9mH0HWBhHsirKfDsnDlXwFBJ2biY25rPtLGE=;
        b=Nrf52LMSMY+4x8bqfnzJMVlT3IdutIrCHSCmHPEELYlyW0TPgAqBTyxXzxRQ/2L1Br
         sD41Ov4mr7g3rwRC//CaM9JB2bC7a/GVfTWBl3/M+W8OuHKNazjC4rnpC8nz8WBxxZxH
         CewoweMh+79XWdQCY1R/mR8MrX0mHPM0yOnQrUFa0AEfCIyJpW0RJwV8D/QuofCr3bjl
         Fzp9xHKBq0RVEXbjzuQMvv9iNglAua/8+oIcGZqjNodvclML4VuCxMOxSOrGinn2ebJr
         YhJniGv6ozWwIV7I6YrhwvMQdHz+CXeEP7Odh47y4LUonRjJLVA2ScZShq3kouxmpeVo
         zfgw==
X-Gm-Message-State: AOJu0Ywk0Q4BljmFBjQZhnZF7ySYHCooR7nXzelEGt6JLmkH04fMdQIP
	LtSL2ksj/PHUWUSXoJ8wl5Fjl8Dtu619VH8wQmjyzksdgBqNs61knac+bUFCt+HmvecwOnARwQ=
	=
X-Received: from wmbha26.prod.google.com ([2002:a05:600c:861a:b0:486:fbd8:2af6])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e49:b0:486:f9a4:d487
 with SMTP id 5b1f17b1804b1-486feb6253dmr47950535e9.0.1774018798971; Fri, 20
 Mar 2026 07:59:58 -0700 (PDT)
Date: Fri, 20 Mar 2026 15:59:36 +0100
In-Reply-To: <20260320145934.2349881-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260320145934.2349881-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1378; i=ardb@kernel.org;
 h=from:subject; bh=RibIB1GLYG+hdvnhodqrMTwRdLcWjhU+FIfxTN8QGOE=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIXNvwg0NRZfn2x1sFK1v1Pz9rqZ67tSf5pz7BSbbI45lq
 r6JCj/SUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACYSe4Lhf4av44tX7XM2z5jP
 tiQteavvlcf7rP4+8/f/HWmS78DCrcjwT7fZMPfNT6PIiPcsKSeFWxb9ELqz5sr8wg1Z953NNuz 9zAcA
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Message-ID: <20260320145934.2349881-16-ardb+git@google.com>
Subject: [PATCH v3 01/13] arm64: Move the zero page to rodata
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_080001_830155_62F2552A 
X-CRM114-Status: GOOD (  11.56  )
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

The zero page should contain only zero bytes, and so mapping it
read-write is unnecessary. Combine it with reserved_pg_dir, which lives
in the read-only region of the kernel, and already serves a similar
purpose.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/vmlinux.lds.S | 1 +
 arch/arm64/mm/mmu.c             | 3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 2964aad0362e..2d021a576e50 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -229,6 +229,7 @@ SECTIONS
 #endif
 
 	reserved_pg_dir = .;
+	empty_zero_page = .;
 	. += PAGE_SIZE;
 
 	swapper_pg_dir = .;
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index a6a00accf4f9..795743913ce5 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -66,9 +66,8 @@ long __section(".mmuoff.data.write") __early_cpu_boot_status;
 
 /*
  * Empty_zero_page is a special page that is used for zero-initialized data
- * and COW.
+ * and COW. Defined in the linker script.
  */
-unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
 EXPORT_SYMBOL(empty_zero_page);
 
 static DEFINE_SPINLOCK(swapper_pgdir_lock);
-- 
2.53.0.959.g497ff81fa9-goog


