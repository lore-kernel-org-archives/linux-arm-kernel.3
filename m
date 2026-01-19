Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB295D29C4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=STJgeRyQ9rhOeIpgNqhbFckDIyyYMzqEc78U5iILh00=; b=zVa/dcqW/GZAFdww9J0S6OAI1h
	qHYcKMEtS6omuA/7Zga67Iy2Un8ZX/CX4vWuczaIUIXG2ekSED91cGAFgHoRM9I9rbnYEXZuwPnbh
	tC3wBSIgu3dpsVS3BvZkD+jDMsTCx9D96kZNuZx5NnTjC13eLhcwA0RZn+3PoEc4bwQ966+KmtYdX
	Z0Kz/PMOErGXDayk5gBFAxwVi246OQSKRhqm5quHWPfQPHUZ5xKjF6ruYBQ5JR3MPXEAtPFrn5B54
	L9CO5bGv9oloA0JTtrvrYyyRaPECqx3z6tTEvRlo418BNOJFD8Y5pVNsbxyNWbSzz0yHFLgt6s9Ra
	mJa9OPNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsYL-00000002ZR8-1qhc;
	Mon, 19 Jan 2026 16:56:34 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsYC-00000002ZN8-10XE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 16:56:25 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-47ee9a53e8fso27683245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 08:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768841782; x=1769446582; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=STJgeRyQ9rhOeIpgNqhbFckDIyyYMzqEc78U5iILh00=;
        b=nDKdy+Fv+3lSqS8F4jLJ5k8LP1Ok79qZ9x50Fc1FjtOy2IAMcBvMnS8zjaeQY4Ac28
         ZXK+UM7x1dZi85swOyLIjM1t1WfvLTsYMsbV9WGCePtEi/PeyQF3IKmJk3o6p3fJPF31
         ee5Vo2Gz9iV7QqGG/6XPb5f/Nt3MjASREHXnScGTKVIYukq/yRJ4QQU7rpwNU+JYM/Zf
         RaxNrKUCcWweBNRju2pLSDX/PXhni7yG8GXKR8aoWPyixWre48gkRGQ8NpymOQaTHSqq
         1MgtBD4c4PxzoT74MR3FAi7UN2kBCzZcxf77Bn1G11xCLT+5S5558pppX7w9UEPW0gmO
         FfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768841782; x=1769446582;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=STJgeRyQ9rhOeIpgNqhbFckDIyyYMzqEc78U5iILh00=;
        b=Kp7b8niWSnN0KacO1m/PiOu4U/jD7IIt3dMk0k1W706tDPQKX8YqIiXcYhI7V91Fl6
         GDlDSiZanjzxK3qKBbVp2iR4S68hFkkaRpNzAGyCFyxJzFt+VSOirIL8K3/OZL9e0OIJ
         e+i2IFcm0SAGzfJjWyQiRmliCafNdjXKKO9Yrt+XQVRn8MnDUAk2aZ3XFWUXrPxWojgF
         H5bZuZ4SC404ikZka4xzNYcscrucBjRWAQA7kLe4K8vBSa38C980yWj5Xn+x8w8Hl/3G
         UoutKHXJakune0uZbBBl34yKUZuOtr2B+ukXXTj3bhAYsJITYV5t7AF6pm2BfE5bxlCU
         KlOg==
X-Gm-Message-State: AOJu0YzEpF8nI6mFhQigEDuDnnDtc/RhgXKER3Nn9yY9pKgQYIFDsIzW
	LJLJyA4YDJXhXgnvSrWDc+gd4Mx9hHHkjMcYLgGF9Q2E2BLTIxvPWPI9cn3VDzBAVJogoS1J8Q=
	=
X-Received: from wmpl26.prod.google.com ([2002:a05:600c:89a:b0:47e:dc0c:276f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1c28:b0:45d:f81d:eae7
 with SMTP id 5b1f17b1804b1-4801eb109e0mr143811185e9.28.1768841782028; Mon, 19
 Jan 2026 08:56:22 -0800 (PST)
Date: Mon, 19 Jan 2026 17:47:51 +0100
In-Reply-To: <20260119164747.1402434-6-ardb+git@google.com>
Mime-Version: 1.0
References: <20260119164747.1402434-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=ardb@kernel.org;
 h=from:subject; bh=ntHgf/B5rJ53w9Bpw1t4lvz9osH4/R661+iGUCVVrMg=;
 b=kA0DAAoWMG4JVi59LVwByyZiAGluYDWjUrFAokWqtXDSeMp+fXT75fRWyZSWbI99Ms6WNd75g
 4h1BAAWCgAdFiEEEJv97rnLkRp9Q5odMG4JVi59LVwFAmluYDUACgkQMG4JVi59LVxCrgD/Z9M5
 i4NwfvsUUSXv+UZafROf6v5ISFsyVqAdG/yUKToBAI84KHD/NB176E35kaZByGlx6nYy+/owAfj bvWNO+8YO
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260119164747.1402434-9-ardb+git@google.com>
Subject: [PATCH 3/4] arm64: Move the zero page to rodata
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>, 
	Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_085624_284865_BF22333C 
X-CRM114-Status: GOOD (  11.42  )
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
read-write is unnecessary. Move it to __ro_after_init instead.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 2a18637ecc15..d978b07ab7b8 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -68,7 +68,8 @@ long __section(".mmuoff.data.write") __early_cpu_boot_status;
  * Empty_zero_page is a special page that is used for zero-initialized data
  * and COW.
  */
-unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
+unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
+					__ro_after_init __aligned(PAGE_SIZE);
 EXPORT_SYMBOL(empty_zero_page);
 
 static DEFINE_SPINLOCK(swapper_pgdir_lock);
-- 
2.52.0.457.g6b5491de43-goog


