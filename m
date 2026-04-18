Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E156F99C6E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 00:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byV7NB9IL1memoSsQz2/iUUpNMXGZbfmUV6QHbGPUlE=; b=Jv1Y4u8kRubkLZKGhHjDDKJpiU
	Hb9k3nOfAGTcbNQN/TzZUFyst3NbbQY1B6fM0iyZTf5MEflSeXhiIcxTlNxK/x8TiElQmTNIinpTP
	e+S5mD6v2RmBAEle745EppT4pwErumY9lSv/BN1Z7VtrVg7gmM/SbVKsgtZSHRqn8MgH4SCfdGy5N
	cfcU8b3cWqHclRandpFiwBzlSUv3WZsYQ0nFlZqfEsyFVCdJ4y+gBC9InVJtiQOMi6xDQHr33juqH
	WiLPOE+EVTuWC2SHKjk/4jg9OYGT/sO0oZvkAtuOpSuRTeZGlIuZOxIupipaE2j3qLbCbZ2DJ4IL+
	z+pt4rvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDtU7-00000004bwc-2N5t;
	Sat, 18 Apr 2026 00:24:31 +0000
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.68.102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDtU4-00000004bv3-0wPJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Apr 2026 00:24:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1776471868; x=1808007868;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=byV7NB9IL1memoSsQz2/iUUpNMXGZbfmUV6QHbGPUlE=;
  b=cS6QpZpdUc4Zr3vZarly/UeoyXJfiJFiZvBDWPBR6rwy1eOXh/l2qcsM
   v7PY7W8PFjb4HMm/uPbOSJe0jPKvkGoqDiwstkCLJBFzOqiMS7C59TT0E
   R3/5EDobUWq63Y6ElYcZYCi0kKuxPYoMnympreeteZKEFTyvBER6ScCKv
   kx8zJz58VkTXMfbdQ/wIF3J+8lxYljAQa73P3dPDWygOVhOlZzskldLTE
   a/qwYEL0FDE+8kWsNgMSTPvPxHxaAPBk8Qb426iUVqCU7yZQZFS0/CZbS
   9eEIPrTmIi+ixLCaO7g132tDlVE9i1WKKtHl1j+EJldAyc9xw4/kLzOlR
   A==;
X-CSE-ConnectionGUID: rXOSviXqQrKoFNQ3rSku9A==
X-CSE-MsgGUID: pO4nwcswRgyo5TZlxXhL0g==
X-IronPort-AV: E=Sophos;i="6.23,185,1770595200"; 
   d="scan'208";a="17612870"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:24:27 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:15293]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.17.68:2525] with esmtp (Farcaster)
 id e505477a-475d-40fb-861c-e9f890d2e32e; Sat, 18 Apr 2026 00:24:27 +0000 (UTC)
X-Farcaster-Flow-ID: e505477a-475d-40fb-861c-e9f890d2e32e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:24:27 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:24:26 +0000
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
Subject: [PATCH v2 15/19] crypto: fips140: add module integrity self-check
Date: Sat, 18 Apr 2026 00:20:23 +0000
Message-ID: <20260418002032.2877-16-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260418002032.2877-1-wanjay@amazon.com>
References: <20260418002032.2877-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D033UWA001.ant.amazon.com (10.13.139.103) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_172428_307908_A5A56704 
X-CRM114-Status: GOOD (  15.49  )
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

Add verify_integrity() function to perform HMAC-SHA256 self verification
of this standalone crypto module against pre-computed hash. This integrity
self-check is required by FIPS 140-3.

This patch is picked from Vegard Nossum <vegard.nossum@oracle.com> with
minor modifications.

Co-developed-by: Vegard Nossum <vegard.nossum@oracle.com>
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/fips140/Kconfig          |  2 ++
 crypto/fips140/fips140-module.c | 52 +++++++++++++++++++++++++++++++++
 crypto/fips140/fips140-module.h |  4 +++
 3 files changed, 58 insertions(+)

diff --git a/crypto/fips140/Kconfig b/crypto/fips140/Kconfig
index 7d8997aa10945..85d2c99579549 100644
--- a/crypto/fips140/Kconfig
+++ b/crypto/fips140/Kconfig
@@ -2,6 +2,8 @@ config CRYPTO_FIPS140_EXTMOD
 	bool "FIPS 140 compliant algorithms as a kernel module"
 	depends on CRYPTO && (X86_64 || ARM64) && MODULES
 	select CRYPTO_FIPS
+	select CRYPTO_SHA256
+	select CRYPTO_HMAC
 	help
 	  This option enables building a kernel module that contains
 	  copies of crypto algorithms that are built in a way that
diff --git a/crypto/fips140/fips140-module.c b/crypto/fips140/fips140-module.c
index 8767d98baacd9..1e68c509d2db0 100644
--- a/crypto/fips140/fips140-module.c
+++ b/crypto/fips140/fips140-module.c
@@ -16,6 +16,54 @@
 
 #define CRYPTO_INTERNAL "CRYPTO_INTERNAL"
 
+static const u8 fips140_integ_hmac_key[] = CONFIG_CRYPTO_FIPS140_HMAC_KEY;
+
+static int verify_integrity(void)
+{
+	extern const u8 *_binary_crypto_ko_start;
+	extern const u8 *_binary_crypto_ko_end;
+	extern const u8 *_binary_crypto_hmac_start;
+	
+	struct crypto_shash *tfm;
+	SHASH_DESC_ON_STACK(desc, tfm);
+	u8 digest[SHA256_DIGEST_SIZE];
+	int err;
+
+	tfm = crypto_alloc_shash("hmac(sha256)", 0, 0);
+	if (IS_ERR(tfm))
+		panic("FIPS 140: failed to allocate hmac tfm (%ld)\n", PTR_ERR(tfm));
+
+	desc->tfm = tfm;
+
+	err = crypto_shash_setkey(tfm, fips140_integ_hmac_key, sizeof(fips140_integ_hmac_key) - 1);
+	if (err)
+		panic("FIPS 140: crypto_shash_setkey() failed: %d\n", err);
+
+	err = crypto_shash_init(desc);
+	if (err)
+		panic("FIPS 140: crypto_shash_init() failed: %d\n", err);
+
+	err = crypto_shash_update(desc, _binary_crypto_ko_start, _binary_crypto_ko_end - _binary_crypto_ko_start);
+	if (err)
+		panic("FIPS 140: crypto_shash_update() failed: %d\n", err);
+
+	err = crypto_shash_final(desc, digest);
+	if (err)
+		panic("FIPS 140: crypto_shash_final() failed: %d\n", err);
+
+	shash_desc_zero(desc);
+
+	if (memcmp(digest, _binary_crypto_hmac_start, sizeof(digest)))
+		panic("FIPS 140: failed integrity check\n");
+
+	pr_info("FIPS 140: integrity verification passed\n");
+
+	crypto_free_shash(tfm);
+	memzero_explicit(digest, sizeof(digest));
+
+	return 0;
+}
+
 /*
  * Run FIPS module initcalls level by level, synchronizing with the
  * kernel's initcall progression.
@@ -85,6 +133,10 @@ static int __init fips140_init(void)
     pr_info("loading " FIPS140_MODULE_NAME "\n");
 
 	run_initcalls();
+
+	if (fips_enabled){
+		verify_integrity(); /* Panics if integrity check fails */
+	}
 	fips140_mark_module_level_complete(3);
     return 0;
 }
diff --git a/crypto/fips140/fips140-module.h b/crypto/fips140/fips140-module.h
index e95dac8eeda9e..b8968d54800ec 100644
--- a/crypto/fips140/fips140-module.h
+++ b/crypto/fips140/fips140-module.h
@@ -9,9 +9,13 @@
 #include <linux/module.h>
 #include <linux/crypto.h>
 #include <crypto/algapi.h>
+#include <crypto/hash.h>
+#include <crypto/sha2.h>
 #include <linux/init.h>
+#include <linux/string.h>
 #include <linux/atomic.h>
 #include <linux/wait.h>
+#include <linux/fips.h>
 
 /* FIPS140 synchronization between kernel and module */
 extern atomic_t fips140_kernel_level_complete;
-- 
2.47.3


