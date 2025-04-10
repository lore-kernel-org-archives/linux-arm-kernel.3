Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E59C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 20:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kS8vY4y5fNjBDG1XCbo8zqqTmNANV4Y3M3y6uH8wf8=; b=wALVOEgPqVq8L3M0HkTMDYNArh
	KAvrCkY58uK+X0hTc7DIP/B+MFe6dgsfM3v6rdU1d3ljo1h3+PTRZPZOwB2t+QrgO1jD4MxIymXJV
	fBou2XsKw5Xs87ae+upw6Zfcu/EAgmKod9YIAJwri1iHdjKJ9WKg3sU61YgjOIQ+6CIQXLH9wRphk
	cQ1EMlOoLe/CG5gwuWGxg2YrLACE9Xc/megRrj3Qq1a+8RzxseY+w3N3ROs4UjVKCrLNkb8YYObEJ
	Ack4U2Cxj3/7zcTGgjQiatkXZUYIQD+OpgxHnXAn+Rs9l3lV+0FgYUbnsifCLE75AcNB8NDsyE/3g
	XTdSa5zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2yDh-0000000BkiL-21E8;
	Thu, 10 Apr 2025 20:09:53 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2yAD-0000000Bk16-3Avl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 20:06:18 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-afd1e7f52f7so746230a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 13:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744315576; x=1744920376; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7kS8vY4y5fNjBDG1XCbo8zqqTmNANV4Y3M3y6uH8wf8=;
        b=1Iwaw3BJeP/ImMvTC0NjEAQDFBu56P9IOelh/qUZHjqatQZQzpd6sp/PI3QRV7LAfk
         OSy/9d1IbGrAxZenTBUOgjCFpRqhRSW9ZPfmRU+Bplh2b1J8TwR0C4bY94G2fvRQV7dm
         x35ZfGgnMJS4IIAFl4npuEPwRAluRuq7yFLpFIIxjn90AX6CEXRN5GhjxgmneU6u6Q9T
         bDtoIJ/GIGOmBozClUBO3dEOcuina6P2URFWINSaIUgDC6TUBEM0bczmVkCxuz1J5hBL
         ggZLgk9Rf1EBIJdhbpVjiCnrOqXSU1e/uq1GFZc9CRGq7xNUiPCZcKHssB7zEaV8MF1h
         HEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744315576; x=1744920376;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7kS8vY4y5fNjBDG1XCbo8zqqTmNANV4Y3M3y6uH8wf8=;
        b=i3wbcbddMYCObIS5wGFw4N6JBqJzn64sWkFjBOa9h33hNqSZpsOrenEFT1O8oNFjTa
         5kNx1eT5tetpwqFy7Q6MB2F077oX3kLEwLwCur8Q/WBvS4KSmHSG6wjyogRJVdvA0Xsu
         3EtAhGka/rQ1jBqtdGf0xWiCFR/yflBhis22HuhlLAka4v4gNlIBz0LinEDya4ufnm3L
         wFUaLp77IiJ1/GSWt39oR7UgD2edtWmw33ymHPahzGJtpUBDPrZ+Timp6xjx2Zz8iSnJ
         sBlpbFmXa1JwHAf+MxI/Eg4V5mPp5EhRKtVBQb6HCVwsvg+DqKnUwohO4nBvr6SF+nNu
         moeg==
X-Gm-Message-State: AOJu0YzEIJbyMhOz14YK1XVmC53hdy7HSDckSKUwcAbu/kIsurxG9JT5
	N/AmpPh+cpZfdz+6l8O3C3ev5U4DbplHY1Tlu+0AqjJGYR+Mlq73rts1+34D1aUZH1fw19BQGME
	0J/UuC8lvD8YmqcpktuPekg==
X-Google-Smtp-Source: AGHT+IGQRaRiD7tN7okaIW2bRMXMvAm26kWqcBfhZ+Bflriw74pMndYmCVVrb+m1DAVrC3q+nit0w4aTmBZQpFpAig==
X-Received: from pglw29.prod.google.com ([2002:a63:161d:0:b0:af2:4e8c:1cc0])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:318c:b0:1f5:889c:3ccc with SMTP id adf61e73a8af0-201797a30b0mr320101637.14.1744315576290;
 Thu, 10 Apr 2025 13:06:16 -0700 (PDT)
Date: Thu, 10 Apr 2025 20:06:05 +0000
In-Reply-To: <20250410200606.20318-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20250410200606.20318-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250410200606.20318-2-dylanbhatch@google.com>
Subject: [PATCH 1/2] arm64: patching: Make text-poke src pointer const.
From: Dylan Hatch <dylanbhatch@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Song Liu <song@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>, Roman Gushchin <kfree@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_130617_797730_95DCB724 
X-CRM114-Status: GOOD (  13.28  )
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

Match the signature of memcpy() and enforce this envariant. Allows this
API to be interchangeable with memcpy().

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 arch/arm64/include/asm/text-patching.h |  2 +-
 arch/arm64/kernel/patching.c           | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/text-patching.h b/arch/arm64/include/asm/text-patching.h
index 587bdb91ab7a6..d61280238c81d 100644
--- a/arch/arm64/include/asm/text-patching.h
+++ b/arch/arm64/include/asm/text-patching.h
@@ -9,7 +9,7 @@ int aarch64_insn_write(void *addr, u32 insn);
 
 int aarch64_insn_write_literal_u64(void *addr, u64 val);
 void *aarch64_insn_set(void *dst, u32 insn, size_t len);
-void *aarch64_insn_copy(void *dst, void *src, size_t len);
+void *aarch64_insn_copy(void *dst, const void *src, size_t len);
 
 int aarch64_insn_patch_text_nosync(void *addr, u32 insn);
 int aarch64_insn_patch_text(void *addrs[], u32 insns[], int cnt);
diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
index 1041bc67a3eee..69494db3a578e 100644
--- a/arch/arm64/kernel/patching.c
+++ b/arch/arm64/kernel/patching.c
@@ -102,9 +102,9 @@ noinstr int aarch64_insn_write_literal_u64(void *addr, u64 val)
 	return ret;
 }
 
-typedef void text_poke_f(void *dst, void *src, size_t patched, size_t len);
+typedef void text_poke_f(void *dst, const void *src, size_t patched, size_t len);
 
-static void *__text_poke(text_poke_f func, void *addr, void *src, size_t len)
+static void *__text_poke(text_poke_f func, void *addr, const void *src, size_t len)
 {
 	unsigned long flags;
 	size_t patched = 0;
@@ -132,12 +132,12 @@ static void *__text_poke(text_poke_f func, void *addr, void *src, size_t len)
 	return addr;
 }
 
-static void text_poke_memcpy(void *dst, void *src, size_t patched, size_t len)
+static void text_poke_memcpy(void *dst, const void *src, size_t patched, size_t len)
 {
 	copy_to_kernel_nofault(dst, src + patched, len);
 }
 
-static void text_poke_memset(void *dst, void *src, size_t patched, size_t len)
+static void text_poke_memset(void *dst, const void *src, size_t patched, size_t len)
 {
 	u32 c = *(u32 *)src;
 
@@ -152,7 +152,7 @@ static void text_poke_memset(void *dst, void *src, size_t patched, size_t len)
  *
  * Useful for JITs to dump new code blocks into unused regions of RX memory.
  */
-noinstr void *aarch64_insn_copy(void *dst, void *src, size_t len)
+noinstr void *aarch64_insn_copy(void *dst, const void *src, size_t len)
 {
 	/* A64 instructions must be word aligned */
 	if ((uintptr_t)dst & 0x3)
-- 
2.49.0.604.gff1f9ca942-goog


