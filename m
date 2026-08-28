Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786EAC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 20:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xD32YxabsHZLtPd2fWQoozGihUGIxltQHFZiqEPPor4=; b=HGjvrUDljqo2Mpo8Dm+w1wCK7V
	o2AfRjN+nDyNf6JS/iw9NyD9fcBa0Wd+hvLUA5QVcHCqzUCvS8NXBfkz9eDqcNaK9cPUbnnLP1ItV
	IcNxi3QlF8M7Xw9Fhj1sY9eAXDuEoaOHvPkomXlTp4Suo5rv/ZNLKRKuLr6aAfupiQV/K5mvAGjt4
	009JUH9hPKGCUeDuuCuU3/VbC/7DBY669JxikgSLWkpjqNTG2+U1I28cEww/A0OkTh2ZGZ8WBjj+q
	uVksjFI8ONrpo/OZtgGAX6xMgve/MbVABUINfKTymkxkJDMXoQzrxvXrKnF/nDLKJkuSvlyae/E9W
	VpjmDteQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x03G4-00000006OyC-3Cqb;
	Fri, 28 Aug 2026 20:33:04 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x03Fs-00000006Ov4-1u8M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 20:32:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=xD32YxabsHZLtPd2fWQoozGihUGIxltQHFZiqEPPor4=; t=1787949172; x=1789158772; 
	b=qTlvI6gqxl4j0dFEKIWDVINLWXoPPbkhllrjAcDvZ+P0lT7iDHUYDSvJ4u6TJ8HDE3GziTAkZf1
	aEr9/5wibtlAtQpLHJia5WddD49gQHQ8DcSEPWeUcyHCtAwOXdCvnyaa6GBddBVcHRebGGIX7zcFN
	QruKDb/a2psGXlQaNIbtuhJNA0nMM9pDhmas+rhE3kNTJ72d97LGYum3cIbYwJqjkj1fSSwnwWa/6
	zp28Iu02LkAJRxaDeU9Sb1nQdQOjvUe7oaZxMlJgtbWHfgGqSJg/R12oi5VcEhAw1Xg7beJlXfi6y
	q1P5D00UzX7fnO7flhHtQgN/D4OBGrAlvPkg==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Fri, 28 Aug 2026 22:32:21 +0200
Subject: [PATCH v2 3/3] ARM: compressed: Enable ZSTD compression
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-zstd2-v2-3-4d9ce7150877@kemnade.info>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2984; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=6pP3PP/XJQVJ+6OA0XXV7DTtOLM6WgYYELukGIdg+4k=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDFkTP6QVHBa0Ky0S3VbdYt0g6r1QyfeA+ZLo4O+++S3hr
 nN2mm/tKGVhEONikBVTZPllreD2SeVZbvDUCHuYOaxMIEMYuDgFYCK7LBgZji3fOHHJm4uxmq0d
 G/jnXvv2bIphY5FW1sV392pCGdOu3GH4p15ZLLCo5cHWGU47vpT/FLGR2bnF78yTOfdkr642V//
 7mQ8A
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_133252_525084_5837ADFA 
X-CRM114-Status: GOOD (  11.62  )
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

With the previous two commits, it is possible to enable ZSTD
in the decompressor stub for 32-bit ARM.

KASAN logic for XZ is extended for ZSTD, since
the affected functions are also in use.

Measurement was done with clang-19.
Setup was: starting a fastboot image via u-boot,
serial console attached.
Time was measured using ts -s %.s </dev/ttyUSBx | tee logfile
from the last words from u-boot still the first
kernel message. No early serial output was in use.

GTA04 (OMAP3) with something based on omap2plus_defconfig:
     zImage size	time
GZIP 7997 KiB		1.6s
LZMA 5794 KiB		4.6s
ZSTD 6774 KiB		2.7s

Tolino Shine 2 HD (i.MX6SL) with something based on imx_v6_v7_defconfig

GZIP 10499 KiB		 0.9s
LZMA 7611 KiB		 3.8s
ZSTD 8884 KiB		 2.0s

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/Kconfig                      |  1 +
 arch/arm/boot/compressed/Makefile     |  1 +
 arch/arm/boot/compressed/decompress.c | 11 ++++++++++-
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9187240a02db5..cf612ee4064c3 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -122,6 +122,7 @@ config ARM
 	select HAVE_KERNEL_LZMA
 	select HAVE_KERNEL_LZO
 	select HAVE_KERNEL_XZ
+	select HAVE_KERNEL_ZSTD
 	select HAVE_KPROBES if !XIP_KERNEL && !CPU_ENDIAN_BE32 && !CPU_V7M
 	select HAVE_KRETPROBES if HAVE_KPROBES
 	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if (LD_VERSION >= 23600 || LD_IS_LLD) && LD_CAN_USE_KEEP_IN_OVERLAY
diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index fa6ee23cd72eb..1c6638e1999ab 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -74,6 +74,7 @@ compress-$(CONFIG_KERNEL_LZO)  = lzo_with_size
 compress-$(CONFIG_KERNEL_LZMA) = lzma_with_size
 compress-$(CONFIG_KERNEL_XZ)   = xzkern_with_size
 compress-$(CONFIG_KERNEL_LZ4)  = lz4_with_size
+compress-$(CONFIG_KERNEL_ZSTD)  = zstd22_with_size
 
 libfdt_objs := fdt_rw.o fdt_ro.o fdt_wip.o fdt.o
 
diff --git a/arch/arm/boot/compressed/decompress.c b/arch/arm/boot/compressed/decompress.c
index b0352f379277f..5f82c0c754fa5 100644
--- a/arch/arm/boot/compressed/decompress.c
+++ b/arch/arm/boot/compressed/decompress.c
@@ -47,15 +47,24 @@ extern char * strchrnul(const char *, int);
 #include "../../../../lib/decompress_unlzma.c"
 #endif
 
-#ifdef CONFIG_KERNEL_XZ
+#if defined(CONFIG_KERNEL_XZ) || defined(CONFIG_KERNEL_ZSTD)
 /* Prevent KASAN override of string helpers in decompressor */
 #undef memmove
 #define memmove memmove
 #undef memcpy
 #define memcpy memcpy
+#undef memset
+#define memset memset
+#endif
+
+#ifdef CONFIG_KERNEL_XZ
 #include "../../../../lib/decompress_unxz.c"
 #endif
 
+#ifdef CONFIG_KERNEL_ZSTD
+#include "../../../../lib/decompress_unzstd.c"
+#endif
+
 #ifdef CONFIG_KERNEL_LZ4
 #include "../../../../lib/decompress_unlz4.c"
 #endif

-- 
2.47.3


