Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07227EDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5TcxFOujMNKd+EhcTS55Wh7sNEppRM3HytCIJcJW7pY=; b=5BgIE0qw7F90Rwh7wJhRUvzaCP
	oQTHZqODzeLGy/9KlZaKuMRK6SxpTQ/vvyr3r5y+ZofpGO74WARLR5yqOLb03XAujAvPTXorWlK0i
	HffeZ7QWCvrSRpyG0FxOPUwiMDr6Cy4djv35TNO5aGM0m8p5umvqEjm5IHUStYJRASq8axr5Hq5uL
	PRmmLEaUZpUqtcBmPC3wq8CBdPpzWeyHTTdtWKve+vf1yyGGU0ADICSxoc3zyDYo05SDpeXFzyUVb
	tPenC3jBPXjncpYSkXn7lBY07RFHfBMKpEJdb9/ZqyfBPLazjCHmZrLhXlFHKTN1y2IjFj2krJs5u
	EVIFv3Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMfa-00000001KOb-0QJh;
	Thu, 12 Feb 2026 02:43:06 +0000
Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.12.53.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMfX-00000001KNS-2wWa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:43:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864183; x=1802400183;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5TcxFOujMNKd+EhcTS55Wh7sNEppRM3HytCIJcJW7pY=;
  b=q2Q+4opu6M1TpTGN53FYjNwcA4Nzle7bT0MzCf58Z0vLFbYgqGNoHpsl
   5+vLWEpy2bjqJ3tcfsODq0Cax45CJrmRJO0vurRaIGb0j5aVrY5rVQVzO
   AFkVj0hROumErwmNNB9cSvAQ6my+Nq9W1pPNFlJYXgU2wLgqDymmSaPIK
   P53x0SDZVGO04BeGY2tu6IgSiMwdNo5AslaysGPouAmffqmeUAoJP/BDJ
   YRpILYFNPQbRatujJkacpox4FsxaYIPVLOLk3CZsOA5wqHDbw0hFCMD4f
   gkmEKd1/6BNVhSpTiLYhex0VQIgKFTsBujj85b5UQY2ztOgeEg84LrCPJ
   g==;
X-CSE-ConnectionGUID: rEPiPVOaSpOulun4sfYhSg==
X-CSE-MsgGUID: XhSxBxQWSeSFOkcx2BZiAw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12793129"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:43:00 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:8690]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.42.95:2525] with esmtp (Farcaster)
 id ea1035ec-9c4e-45c6-a808-5879060501ed; Thu, 12 Feb 2026 02:43:00 +0000 (UTC)
X-Farcaster-Flow-ID: ea1035ec-9c4e-45c6-a808-5879060501ed
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:42:59 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:42:59 +0000
From: Jay Wang <wanjay@amazon.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, <linux-crypto@vger.kernel.org>
CC: Jay Wang <jay.wang.upstream@gmail.com>, Vegard Nossum
	<vegard.nossum@oracle.com>, Nicolai Stange <nstange@suse.de>, Ilia Okomin
	<ilya.okomin@oracle.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Luis Chamberlain
	<mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Nathan Chancellor
	<nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-kbuild@vger.kernel.org>, <linux-modules@vger.kernel.org>
Subject: [PATCH 02/17] crypto: add module entry for standalone crypto kernel module
Date: Thu, 12 Feb 2026 02:42:06 +0000
Message-ID: <20260212024228.6267-3-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024228.6267-1-wanjay@amazon.com>
References: <20260212024228.6267-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D040UWA003.ant.amazon.com (10.13.139.6) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_184303_790707_49997B35 
X-CRM114-Status: GOOD (  17.82  )
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
index 04e269117589..5129be5e7208 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -210,3 +210,8 @@ obj-$(CONFIG_CRYPTO_KDF800108_CTR) += kdf_sp800108.o
 obj-$(CONFIG_CRYPTO_DF80090A) += df_sp80090a.o
 
 obj-$(CONFIG_CRYPTO_KRB5) += krb5/
+
+# FIPS 140 kernel module
+obj-$(CONFIG_CRYPTO_FIPS140_EXTMOD) += fips140/
+
+
diff --git a/crypto/fips140/Makefile b/crypto/fips140/Makefile
new file mode 100644
index 000000000000..364ef52c190f
--- /dev/null
+++ b/crypto/fips140/Makefile
@@ -0,0 +1,3 @@
+
+
+	
\ No newline at end of file
diff --git a/crypto/fips140/fips140-module.c b/crypto/fips140/fips140-module.c
new file mode 100644
index 000000000000..a942de8780ef
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
index 000000000000..ed2b6e17969f
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


