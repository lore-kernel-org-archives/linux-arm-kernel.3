Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3A7CA5FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 11:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdnPjCTZFRIo6O5MYyfu9npWh/yGUWctau5xv/1z7VM=; b=LbkOTm2SPh8UznFtXzt92mN+Za
	HxsULGu8GPkXPworudQXm4lipK9zLyhOZZpnpZQsLeOHf+EpojqCFDYJ6cXHGvSCPv+4uxlzpSMEf
	S/xtr3VpzlXacGF2KSslRRw3moz5yC58Mt5gjNKRMy1iWh6tr2xsODuaec869YLBtnqTk4PU4OPDp
	ATSWRuDxhGYJi+HkRcWjJm+ALVXiPgsgjJyA5MwRR6cleMeuDoiLm6aHf8wndreBchzhzlFYq2Kxw
	IDtsd/Vd8Rzcv6+T7dPZ+zY7IErfyX0yxc6Jrx2ZhVk2T74a7GWWOb5qW3JqiIumL+h57DHuAT97Q
	oFnbtIFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgVd-0000000GIZ2-1VHe;
	Mon, 05 Oct 2026 11:05:29 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgVS-0000000GITs-32YP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 11:05:27 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4a165fb7beeso17254705e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 04:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791198317; x=1791803117; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fdnPjCTZFRIo6O5MYyfu9npWh/yGUWctau5xv/1z7VM=;
        b=hjVrubDBbD+D6x2GXGy/PU2nYuc1+YfRtr965sO31A2Kh/ltRfh83ag9m7EAr/YgcJ
         eoVeRg2vX+PvjN9SWEgGnppvuyzSLZEtHrgGWHBuQ/QA7KaAOrEDaw/4DloS0rX5ZU3X
         Iszu/46SP7AGd9SN2pVVRWmj+bSXSiJ+owZBZprfyq+1gkIS8VquPxZA5SCCkwBZDCbE
         DPkX8LVdRlVmEUQBMEofNk7lvJSUzsUjWwq9ZL0Ls03BPrQz38DNAYiqQdVKLETLs6z6
         S4WHDKZc7Nsz0MshYY+5D4sl54OqwkGo9LplOuoYKskrYetCmphSGS7UK3OWHiFM9zk6
         PgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198317; x=1791803117;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fdnPjCTZFRIo6O5MYyfu9npWh/yGUWctau5xv/1z7VM=;
        b=H4imrbsSuhrif4WkI43ZDoVA3jf1p1V0W8l05uVptqqpURQYKemnoyccgyWIJLlR66
         HrgRxlqI+UVf3toVAh3p6Ak5nSfQHFEFmpYO3yu20c3rK3PNvCmu4a8unpFkTOvKP5JU
         ao/stLzf8djUgH12Gfha5G45dJnmF6zzvwUaSSgtQ6uW+VyCMZBt39ovsUhxSNLZX0SF
         +kDb02N+ag7RogMGiWU64SXyIKRgZshbgKfXAT3JlwZrUI3hqhNaGmWLXgLROooBiJLQ
         YNN/8RJZaYfRokaJlIBcvsqcqVKkBT2vBwtiO1q6bnbDWKtJzlycc1iSQgJRsYBnPj40
         B7IQ==
X-Gm-Message-State: AFuF++mrRiYA2ZmgMtYSBsf04aZoQBnj74V0VX0Ryx/wzx8FUczlvwAX
	zZb5XVxuOKf69cPXhUIbbh3Xb6xNRONZ1rbmSnQuXfg1af/Oo1lccuedI+tLZUtzixdCZZPvx61
	U3zu8KjZe5FgiYNXZDOxUKLEye6/jq6oz/X3NTd5hDjfoS5mUM8nwRmbzh9HvJwHVno7/STOVCh
	mA+JL5GtZnt94MDDA1dnatAJq+oXCtXog4S6DDvs/PBuLg
X-Received: from wmbeu9.prod.google.com ([2002:a05:600c:81c9:b0:4a1:66a7:8b3c])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:46ca:b0:49f:fdca:c361
 with SMTP id 5b1f17b1804b1-4a0275790b7mr169835585e9.12.1791198316326; Mon, 05
 Oct 2026 04:05:16 -0700 (PDT)
Date: Mon,  5 Oct 2026 13:05:14 +0200
In-Reply-To: <20261005110511.157016-4-ardb+git@google.com>
Mime-Version: 1.0
References: <20261005110511.157016-4-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261005110511.157016-6-ardb+git@google.com>
Subject: [PATCH v2 2/2] DONOTMERGE: arm64: module: Test module for BTI veneers
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040518_782774_FB6CC915 
X-CRM114-Status: GOOD (  14.23  )
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
2.56.0.rc1.315.gc6ed9934b7-goog


