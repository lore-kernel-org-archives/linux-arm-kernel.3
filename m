Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD7AF99C6D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 00:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sC8zO7WisB/BVnpXYeCbasCeuuyH1ggPcPQwQiSAKEk=; b=hk95QLEQhJ5W1OdgQP7jfX5er3
	BeLvq876O63kMUY3k6mcgpEHYASqnA/80gltcd9PXEsal0P2iK1r1tZ3FSNpooXmoK8x4FBfwe0lH
	m/f3dgOfzoXqLg9lpWEZ77auSwn81ZapuC+QN8BnuTKtBQaozOYe0hKUDT0HsVInTnswWSP+i/H0w
	M9ROSjBZ1kOYw9+TBZwp8Owxv2OJhUp0pxVwzeQfHQK5iaeb+cgJBWm6UYxK29jIyV9YB4VCm/9p4
	uoNDCgY7VsBiT1yeXUAzvW4VKKBoKU+byKDkpkzHdxZ6LuuoEnUcu1k/vyrwdxkc062of9ucxE3la
	VOoqqXWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDtR5-00000004aVg-2LAn;
	Sat, 18 Apr 2026 00:21:23 +0000
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.13.214.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDtQp-00000004aP6-2nc6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Apr 2026 00:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1776471667; x=1808007667;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sC8zO7WisB/BVnpXYeCbasCeuuyH1ggPcPQwQiSAKEk=;
  b=p1TTkosnQhJP1UwfDxk3UYkLnFgD2RMZfGuPgHj0MJZEnk2yLfb0x+a7
   xHyXoEOjG9aPjh0bQBslQ3/yMooaBsNbzM8uwYZDECGXIwN/8Q4SuhCAQ
   eL5tPMAqRhuH/7WRQVlTXHcHVDx/WbXZicVkkJat9zXJuHeUdfyUpxLYx
   kZSAQNhUuc6J5ftSDGvKuFUnEMfAeZ1SXO/ybIY3FZAHFgli1SaXPTg/Y
   bLdn2U/jwZ7p3yiuJTN0enMTdRvXmzRWX2qvBsb8mxVFId4ReTvRN+UMv
   qLW9KvVF3DrsXtRSQKpG/DtP3x2nDyKmCm85HVobJY6++ZFTv2GQxbKXM
   g==;
X-CSE-ConnectionGUID: duxKE2eBSmq5n0oRXlLEGQ==
X-CSE-MsgGUID: bmvgKGJDSZ+60DrIR2R09g==
X-IronPort-AV: E=Sophos;i="6.23,185,1770595200"; 
   d="scan'208";a="17587111"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:21:05 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:7812]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.60.232:2525] with esmtp (Farcaster)
 id 563553b0-9fd4-4e32-be57-b68618a85df0; Sat, 18 Apr 2026 00:21:04 +0000 (UTC)
X-Farcaster-Flow-ID: 563553b0-9fd4-4e32-be57-b68618a85df0
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:21:04 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:21:04 +0000
From: Jay Wang <wanjay@amazon.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, <linux-crypto@vger.kernel.org>, Masahiro Yamada
	<masahiroy@kernel.org>, <linux-kbuild@vger.kernel.org>
CC: Jay Wang <jay.wang.upstream@gmail.com>, Vegard Nossum
	<vegard.nossum@oracle.com>, Nicolai Stange <nstange@suse.de>, Ilia Okomin
	<ilya.okomin@oracle.com>, Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>,
	Bjoern Doebel <doebel@amazon.de>, Martin Pohlack <mpohlack@amazon.de>,
	Benjamin Herrenschmidt <benh@amazon.com>, Nathan Chancellor
	<nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
	<hpa@zytor.com>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu
	<petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen
	<samitolvanen@google.com>, David Howells <dhowells@redhat.com>, "David
 Woodhouse" <dwmw2@infradead.org>, Jarkko Sakkinen <jarkko@kernel.org>, "Ignat
 Korchagin" <ignat@linux.win>, Lukas Wunner <lukas@wunner.de>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	"Andrii Nakryiko" <andrii@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-modules@vger.kernel.org>
Subject: [PATCH v2 02/19] crypto: add module entry for standalone crypto kernel module
Date: Sat, 18 Apr 2026 00:20:10 +0000
Message-ID: <20260418002032.2877-3-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260418002032.2877-1-wanjay@amazon.com>
References: <20260418002032.2877-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D036UWB001.ant.amazon.com (10.13.139.133) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_172108_551238_CA10DED5 
X-CRM114-Status: GOOD (  18.39  )
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

Add the module entry for the standalone FIPS kernel crypto module.
This creates the basic structure for fips140.ko that will be linked
with built-in crypto implementations in later patches.

The implementation includes module initialization and exit functions
and add into build system.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile                 |  5 +++++
 crypto/fips140/Makefile         |  3 +++
 crypto/fips140/fips140-module.c | 36 +++++++++++++++++++++++++++++++++
 crypto/fips140/fips140-module.h | 14 +++++++++++++
 4 files changed, 58 insertions(+)
 create mode 100644 crypto/fips140/Makefile
 create mode 100644 crypto/fips140/fips140-module.c
 create mode 100644 crypto/fips140/fips140-module.h

diff --git a/crypto/Makefile b/crypto/Makefile
index d9bec7c6dc417..b48017ca84cc0 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -207,3 +207,8 @@ obj-$(CONFIG_CRYPTO_KDF800108_CTR) += kdf_sp800108.o
 obj-$(CONFIG_CRYPTO_DF80090A) += df_sp80090a.o
 
 obj-$(CONFIG_CRYPTO_KRB5) += krb5/
+
+# FIPS 140 kernel module
+obj-$(CONFIG_CRYPTO_FIPS140_EXTMOD) += fips140/
+
+
diff --git a/crypto/fips140/Makefile b/crypto/fips140/Makefile
new file mode 100644
index 0000000000000..364ef52c190fb
--- /dev/null
+++ b/crypto/fips140/Makefile
@@ -0,0 +1,3 @@
+
+
+	
\ No newline at end of file
diff --git a/crypto/fips140/fips140-module.c b/crypto/fips140/fips140-module.c
new file mode 100644
index 0000000000000..a942de8780efb
--- /dev/null
+++ b/crypto/fips140/fips140-module.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * FIPS 140 Kernel Cryptographic Module
+ *
+ * This file is the module entry point for fips140.ko, which is linked with previously built-in cryptos
+ * to generate the fips140.ko module.
+ * At load time, this module plugs the previously built-in implementations contained within itself back to the kernel.
+ * It also runs self-tests on these algorithms and verifies the integrity of its code and data.
+ * If either of these steps fails, the kernel will panic.
+ */
+
+#include "fips140-module.h"
+
+#define FIPS140_MODULE_NAME "FIPS 140 Kernel Cryptographic Module"
+#define FIPS140_MODULE_VERSION "1.0.0"
+
+#define CRYPTO_INTERNAL "CRYPTO_INTERNAL"
+
+/* Initialize the FIPS 140 module */
+static int __init fips140_init(void)
+{
+    return 0;
+}
+
+static void __exit fips140_exit(void)
+{
+    pr_info("Unloading " FIPS140_MODULE_NAME "\n");
+}
+
+module_init(fips140_init);
+module_exit(fips140_exit);
+
+MODULE_IMPORT_NS(CRYPTO_INTERNAL);
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION(FIPS140_MODULE_NAME);
+MODULE_VERSION(FIPS140_MODULE_VERSION);
diff --git a/crypto/fips140/fips140-module.h b/crypto/fips140/fips140-module.h
new file mode 100644
index 0000000000000..ed2b6e17969fc
--- /dev/null
+++ b/crypto/fips140/fips140-module.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * FIPS 140 Kernel Cryptographic Module - Header File
+ */
+
+#ifndef _CRYPTO_FIPS140_MODULE_H
+#define _CRYPTO_FIPS140_MODULE_H
+
+#include <linux/module.h>
+#include <linux/crypto.h>
+#include <crypto/algapi.h>
+#include <linux/init.h>
+
+#endif /* _CRYPTO_FIPS140_MODULE_H */
-- 
2.47.3


