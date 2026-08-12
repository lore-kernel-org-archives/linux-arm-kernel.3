Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B51AC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 16:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IBI5WI/lAJafFgJ7Sy0DqBFi6pgrnyhinmb89eE1GpY=; b=GS7daEmXpaoQJENGs+B7fENrA8
	9dRF5npEn5o6k9tByoDcm81ILW9P4eyMcHNFcfIrx5jJVWxZwjTAP85kLIYSY66AeXtbisCjZqGdy
	nYS/yC1qPszYOxuwzI+T7IUjIR4fADOpJMbMILrY8kGiuqxs5ksgYlULSA0p01L9IiUBc+ZBHReg2
	qmtkYCFLgiDtmEAS6Z2ojgqBTDG8Hk8NxHUMhAIWSklJ/xXHXKLUTIpkfu7UcgMI1hHTzJYlsbah8
	kAO3FTs9JrWr5CqNTbCaSUZMBx1pC6gX76qRAtNyB/WxJRo50cHhrYdoNa8MBpeN8a2OMzjDk0vUN
	nHxBmiRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBhj-0000000GZee-03jG;
	Wed, 12 Aug 2026 16:21:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBhh-0000000GZdY-0D1w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 16:21:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A3578433CD;
	Wed, 12 Aug 2026 16:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA03D1F000E9;
	Wed, 12 Aug 2026 16:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786551680;
	bh=IBI5WI/lAJafFgJ7Sy0DqBFi6pgrnyhinmb89eE1GpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=F/onrWzqRC4xvmRq69jeVZIr9nMHor+y/MIcRRA00ZMKaNYP8M3jxBtpC3BRCbMVq
	 D6hwGMwpR3P1+DVN3cLqPXJdUK9dDYXJVnoqJSz30nkdBkh69scq1CFPTqQbPlJSNh
	 d6182f2VJ5T9x4bR+fzSJE/PQSmPXMdR5I2811lZUjftFvRAMaZC0rgAhyrL3GqdUZ
	 pCELQX9noOq39Jf2JLZVIC8gBbA9hkbOJYMJpc7QI6s0zsGfuvVLuw0v5wercUxsUK
	 J/0Xj/qLin6jk20Tyl7iNtwi0cDj7CO9yw/G5efCJmOl7oGk0TdqirXoYwTELOPn6D
	 uDwEmjtxb9Oeg==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH 2/2] DONOTMERGE: arm64: module: Test module for BTI veneers
Date: Wed, 12 Aug 2026 18:21:01 +0200
Message-ID: <20260812162058.612202-6-ardb@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260812162058.612202-4-ardb@kernel.org>
References: <20260812162058.612202-4-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2072; i=ardb@kernel.org; h=from:subject; bh=U9VKnlWYWUqNYLV5LzPacBbOScKTY/QnXgi2fcEyVDE=; b=owGbwMvMwCVmkMcZplerG8N4Wi2JIatmbv5Opml7uNO+Orx3XVMvZCc29duU/B/rftxsSi+6p eAluLqko5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEyk/xgjw6Ons6c2ndG0Pmpf bHLF6yTvnJUNW5wYfz+zmb5z2rQDck6MDEvj1GWT1yhVXVu7r/bJSo1NMrExsiY5/nKOj26+Dlr ByQEA
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Transfer-Encoding: 8bit
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

This module has a tiny .text section with a static function, which is
called by the module init hook, which is placed in a ~128M init code
section, which is therefore guaranteed to be place out of direct
branching range when CONFIG_RANDOMIZE_MODULE_REGION_FULL is disabled.

When CONFIG_ARM64_BTI_KERNEL is enabled, this forces the use of a BTI
veneer, as recent GCCs and Clangs will elide BTI landing pads for static
functions that never have their address taken, even in the presence of
cross-section calls to those functions.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/Makefile          |  1 +
 arch/arm64/kernel/bti_veneer_test.c | 26 ++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index d2690c3ec528..b74e2dbd2d5f 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -72,6 +72,7 @@ obj-$(CONFIG_ARM64_MPAM)		+= mpam.o
 obj-$(CONFIG_ARM64_MTE)			+= mte.o
 obj-y					+= vdso-wrap.o
 obj-$(CONFIG_COMPAT_VDSO)		+= vdso32-wrap.o
+obj-m					+= bti_veneer_test.o
 
 # Force dependency (vdso*-wrap.S includes vdso.so through incbin)
 $(obj)/vdso-wrap.o: $(obj)/vdso/vdso.so
diff --git a/arch/arm64/kernel/bti_veneer_test.c b/arch/arm64/kernel/bti_veneer_test.c
new file mode 100644
index 000000000000..62c20e960d8d
--- /dev/null
+++ b/arch/arm64/kernel/bti_veneer_test.c
@@ -0,0 +1,26 @@
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/types.h>
+
+static int noinline static_noninit_function(void)
+{
+	static volatile int ret;
+	return ret;
+}
+
+static int __init bti_veneer_test_init(void)
+{
+	return static_noninit_function();
+}
+module_init(bti_veneer_test_init);
+
+static void bti_veneer_test_exit(void)
+{
+}
+module_exit(bti_veneer_test_exit);
+
+/* Make the init code region too big to fit in 128M 'near' module region */
+asm(".section .init.padding, \"ax\", %progbits; .space (128 << 20) - 64; .previous");
+
+MODULE_LICENSE("GPL");
-- 
2.47.3


