Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF21C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 20:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/keNu9YOo7zAzx95aDUptk6EtzUmbckhpZVCqPPVXs=; b=GJOqPHJ1jzyn6ii/olmxRoiUZD
	upmwQqkTZ5PtVHqjnJhg+twzBpErwtdPWXfEk/Yb+urvUYz+plagWkTbDItTe6a9PfCAdRwXs2Yr8
	GXfWjSltDldD7eerZvTwYIaOT5uKpde12DW1JSQi4Kmny1mphQCQwMyLrocktjO7MkB2IiuemKHkw
	4F5//4lSaHNbknK8FnPDOnQd9cRwnqQA+bais2aiMOEXIz1HAZpzx0GtvpV38PmZjSgJSUu7KAswK
	Rb5ipN8zzr8nzw602IehTlfsI9Bf4c5gqrUBvZNgItbm7sZTN1MV2blsD/xFZF43aCYSoKxwW3ZH3
	rYV4LfWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x03Fv-00000006OwQ-22AW;
	Fri, 28 Aug 2026 20:32:55 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x03Fs-00000006Ov7-1tDl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 20:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=C/keNu9YOo7zAzx95aDUptk6EtzUmbckhpZVCqPPVXs=; t=1787949172; x=1789158772; 
	b=J6GnBnX85xoprXYk0NaNvRiakCazrjXE+XL2jNQPM2FeN4+IPB/0uDHW+f0JeF4TzpZwRfi9Kjt
	StdRO1Z49Q/v9JMAXj/gKzAUsLDkRyU6t/lb8YblwBEc9TMo6W1q0TKcwGqheYqgkm4UJ3ywZ0pAY
	J5HE0wUbPgxvi+m2Vy31zdFdULCR+O1f/tRK4m7wIXsFo1BmW+wCkRWIWQzaUcNfyafB9lL9znaLo
	MuuBHPnYT6+3x0TaF0kFPCnBZZutty9WE8RHhtP+B4v466UXK9NVHuUJETnsDKIOQBXYa7f1MLTiG
	0FtWtZXOu92tsEvhjfDYeCCQ+OVLJUSVdqPA==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Fri, 28 Aug 2026 22:32:19 +0200
Subject: [PATCH v2 1/3] ARM: compressed: Pass the actual output length to
 the decompressor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260828-zstd2-v2-1-4d9ce7150877@kemnade.info>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3671; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=/L/veojh/62XQryZCdewjJj5pfYPoiKhGTtsVvoXBR0=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDFkTP6RterV32emUhIOB0b79nl5Rq+Ritp9OnRgiPeXLg
 UsNVvpOHaUsDGJcDLJiiiy/rBXcPqk8yw2eGmEPM4eVCWQIAxenAEzkszwjw/EU0f8bdxcp5ftn
 L1moxrTk/3uPnTetdXhyLn3MM2mcUs/I8I4hRSvd9ZdtZkPMqceWTt9Yo6duTP6S90Hikam3Ak8
 +NwA=
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_133252_524967_A70C2140 
X-CRM114-Status: GOOD (  13.99  )
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

ZSTD writes outside of the space that is necessary for the uncompressed
data, when it is told it has unlimited output length. To fix this, pass
the actual output length (the length of the uncompressed kernel) to the
decompressor.

The uncompressed length is already stored as a little endian 32-bit
constant before the input_data_end symbol.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Reviewed-by: Tony Lindgren <tony@atomide.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/compressed/decompress.c |  4 ++--
 arch/arm/boot/compressed/misc.c       | 10 +++++++++-
 arch/arm/boot/compressed/misc.h       |  3 ++-
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/compressed/decompress.c b/arch/arm/boot/compressed/decompress.c
index 0669851394f04..b0352f379277f 100644
--- a/arch/arm/boot/compressed/decompress.c
+++ b/arch/arm/boot/compressed/decompress.c
@@ -60,7 +60,7 @@ extern char * strchrnul(const char *, int);
 #include "../../../../lib/decompress_unlz4.c"
 #endif
 
-int do_decompress(u8 *input, int len, u8 *output, void (*error)(char *x))
+int do_decompress(u8 *input, int len, u8 *output, int outlen, void (*error)(char *x))
 {
-	return __decompress(input, len, NULL, NULL, output, 0, NULL, error);
+	return __decompress(input, len, NULL, NULL, output, outlen, NULL, error);
 }
diff --git a/arch/arm/boot/compressed/misc.c b/arch/arm/boot/compressed/misc.c
index 6c41b270560e1..58826885ccc82 100644
--- a/arch/arm/boot/compressed/misc.c
+++ b/arch/arm/boot/compressed/misc.c
@@ -22,6 +22,7 @@ unsigned int __machine_arch_type;
 #include <linux/compiler.h>	/* for inline */
 #include <linux/types.h>
 #include <linux/linkage.h>
+#include <linux/unaligned.h>
 #include "misc.h"
 #ifdef CONFIG_ARCH_EP93XX
 #include "misc-ep93xx.h"
@@ -128,14 +129,21 @@ asmlinkage void __div0(void)
 	error("Attempting division by 0!");
 }
 
+static u32 get_inflated_image_size(void)
+{
+	return get_unaligned_le32(input_data_end - 4);
+}
+
 void
 decompress_kernel(unsigned long output_start, unsigned long free_mem_ptr_p,
 		unsigned long free_mem_ptr_end_p,
 		int arch_id)
 {
+	unsigned long output_data_len;
 	int ret;
 
 	output_data		= (unsigned char *)output_start;
+	output_data_len         = get_inflated_image_size();
 	free_mem_ptr		= free_mem_ptr_p;
 	free_mem_end_ptr	= free_mem_ptr_end_p;
 	__machine_arch_type	= arch_id;
@@ -147,7 +155,7 @@ decompress_kernel(unsigned long output_start, unsigned long free_mem_ptr_p,
 
 	putstr("Uncompressing Linux...");
 	ret = do_decompress(input_data, input_data_end - input_data,
-			    output_data, error);
+			    output_data, output_data_len, error);
 	if (ret)
 		error("decompressor returned an error");
 	else
diff --git a/arch/arm/boot/compressed/misc.h b/arch/arm/boot/compressed/misc.h
index 8c73940b5fe46..ec8de2388f0ec 100644
--- a/arch/arm/boot/compressed/misc.h
+++ b/arch/arm/boot/compressed/misc.h
@@ -13,7 +13,8 @@ decompress_kernel(unsigned long output_start, unsigned long free_mem_ptr_p,
 void __fortify_panic(const u8 reason, size_t avail, size_t size);
 int atags_to_fdt(void *atag_list, void *fdt, int total_space);
 uint32_t fdt_check_mem_start(uint32_t mem_start, const void *fdt);
-int do_decompress(u8 *input, int len, u8 *output, void (*error)(char *x));
+int do_decompress(u8 *input, int len, u8 *output, int outlen,
+		  void (*error)(char *x));
 
 extern char input_data[];
 extern char input_data_end[];

-- 
2.47.3


