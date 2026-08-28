Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCAEC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 20:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+X15T1fcpe3iI6rFk13FMG/iW6iRWR1lKoh9bfasM84=; b=5BE3wCDPEou3u9cFSUd4m8e4Vd
	+Q4LkTA9MsWYspmleznHxmW4ydbj5W3Tri7Pzflc2pmNQ1FBqfGXZe8udiLk2J9HAjXMgODAu6mbl
	c2VA0sP1Y6PUdD28RfTmfIQav7PTE7ObXP1lp5Ia1GUQA/kYmFUbpOK0JRG0Qe/dofPJp5KTfZdp/
	TxFIRA5aB2eRpGGdUGFVKW18dFsKGzvxragLyOOcuGsgphcFf2IOHNaJ8ySKkakSgKcmHuHM05WlH
	nkwQb1S9YfuTSfwuuOSKl6AZVs2kjNLpAb02NH7vzjs0iqbI3k54acUKDcWRxCTUGIGFVD1yV3AjP
	P2b7NsMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x03G4-00000006Oxu-2pOm;
	Fri, 28 Aug 2026 20:33:04 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x03Fs-00000006Ov6-1tNf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 20:32:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=+X15T1fcpe3iI6rFk13FMG/iW6iRWR1lKoh9bfasM84=; t=1787949172; x=1789158772; 
	b=w8ic720mPVDSy6nRLmEqPT9S09PznyxtAxl68X+RLCD1jwsQUKS9hJalrBRBGl/PVgKZqneE7r7
	qlH1C3kRCP/mdxMSWqP/MeiZ9hwzXCZOxo5/BEnUvJAila0ggLFY8IrltFW56vaf0u/r+30X4/zJn
	sHfdR9MX3Wm3SPI5db6EolpcgC76IrmF1r050LjtoZKcMjUqZGDSJcJaCW0SgqAgVWD6w21JxdNEc
	h16dTFNldtv7ZQzvlqdFbA49mu/swO2HU0X7Vvlw+0NHo1QuJIbLcIwMr+T0gJmpQ2kcQEHx1iGMR
	aT9M3UPBRoH0UgYPNf+3F1KpqzTATq2AN8hQ==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Fri, 28 Aug 2026 22:32:20 +0200
Subject: [PATCH v2 2/3] ARM: compressed: Bump MALLOC_SIZE to 128 KiB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260828-zstd2-v2-2-4d9ce7150877@kemnade.info>
References: <20260828-zstd2-v2-0-4d9ce7150877@kemnade.info>
In-Reply-To: <20260828-zstd2-v2-0-4d9ce7150877@kemnade.info>
To: Russell King <linux@armlinux.org.uk>, Nick Terrell <terrelln@fb.com>, 
 David Sterba <dsterba@suse.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, j.neuschaefer@gmx.net, 
 f.fainelli@gmail.com, Tony Lindgren <tony@atomide.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=+UrMNo6HSjDQ27FgGwmv5HaqBYMyLiKEYeg3oyNuDMc=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDFkTP6S9P3iq0d376Mv4M4/nBGmZ2N7PDAysjupRdFcoX
 OG+S6yho5SFQYyLQVZMkeWXtYLbJ5VnucFTI+xh5rAygQxh4OIUgIm8d2RkuJcTfOn/3tKp5wJa
 35cvFvnoYq0fEnfaTTwwfcryarkfLowMx3LOeR9tz79yPi56Y7LM9u3vH3/pW+WgzJo3o9+h8Zc
 5KwA=
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_133252_527974_390FC2DE 
X-CRM114-Status: GOOD (  10.69  )
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

From: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

The ZSTD compressor needs about 100 KiB.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/compressed/Makefile | 2 +-
 arch/arm/boot/compressed/head.S   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index e3f550d628578..fa6ee23cd72eb 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -62,7 +62,7 @@ ZTEXTADDR	:= 0
 ZBSSADDR	:= ALIGN(8)
 endif
 
-MALLOC_SIZE	:= 65536
+MALLOC_SIZE	:= 131072
 
 AFLAGS_head.o += -DTEXT_OFFSET=$(TEXT_OFFSET) -DMALLOC_SIZE=$(MALLOC_SIZE)
 CPPFLAGS_vmlinux.lds := -DTEXT_START="$(ZTEXTADDR)" -DBSS_START="$(ZBSSADDR)"
diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
index 9f406e9c0ea6f..23fbbe94da6e8 100644
--- a/arch/arm/boot/compressed/head.S
+++ b/arch/arm/boot/compressed/head.S
@@ -337,7 +337,7 @@ restart:	adr	r0, LC1
 		get_inflated_image_size	r9, r10, lr
 
 #ifndef CONFIG_ZBOOT_ROM
-		/* malloc space is above the relocated stack (64k max) */
+		/* malloc space is above the relocated stack (128k max) */
 		add	r10, sp, #MALLOC_SIZE
 #else
 		/*
@@ -629,7 +629,7 @@ not_relocated:	mov	r0, #0
  */
 		mov	r0, r4
 		mov	r1, sp			@ malloc space above stack
-		add	r2, sp, #MALLOC_SIZE	@ 64k max
+		add	r2, sp, #MALLOC_SIZE	@ 128k max
 		mov	r3, r7
 		bl	decompress_kernel
 

-- 
2.47.3


