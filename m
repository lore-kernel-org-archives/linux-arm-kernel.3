Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB55C83029
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 16:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3TB+oadgdkQTBkjPHus/2OYs/F92Az+VyYNxlaP6js=; b=p6SPbxg1b9GTpW9/s66VAllCod
	0BbuZo01T0iYI4OOD7sTKTxQPsDBz1vj8Bk5tN2qfU4KE1tBt4BEkZwDTXRuO7HYzBCu3QHrTLyuf
	t85/gh1Xr9tDLKa1XuLT9bPofWB21gGjkY4Ww4gIJ9t5lEDIQFHivDM2PpLX+aufCp6NCEA93F1VH
	6AiI6zm/l6fpHggW6jidMG9FYHFjSAKLS2coSwS6KagY6G/9Ivbp4oH353WhifE0G6xUYpMr3r+TJ
	0xTdOybFcWUeCbAhwM9CzVHBlum4dvWk0il0CZDuI7l7x02/yi5IqoRNPH++zO3mPTUbP6l+azPFt
	C/VL1ceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWHXG-00000002xec-2w4p;
	Mon, 30 Jun 2025 16:39:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWH0Y-00000002ojg-1l4k;
	Mon, 30 Jun 2025 16:05:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F7AA613AC;
	Mon, 30 Jun 2025 16:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B72D0C4CEF5;
	Mon, 30 Jun 2025 16:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299526;
	bh=JG4DTgucZUrWoEuYJPtjg0ziG3DV7kKAWZi/WwQtPT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ApnEO8WUpJ+HKPFHeRZUHExWJBFUYzvVnT6VdNOePMw9WGwx8hz6EmDTiW70uLQ1D
	 JVwjyKEx1AEGxEvedB7Hsm1TGLFnWP+Iz1kWVUW13AlOPPasV+0VIpNabEw5Ztz996
	 gtgEP6gkKn8Lf+T7iqB71BKDIReiN/L0P5pUiEkmApW0eQ/JybpRt3W3xIAWXsjj8I
	 +DZuchFl4lzxIpizrG+v3v3higRcxF2I1ZGnPKWcatTcoMhuC6kA4jMZ8jLlFtjV52
	 vQePNePrSq1BSGwtEjjE7ygZUS1d1mJMEWQcscWCIIH5OcSga0/DyKYR5gH6Yazmws
	 FJ1WA8zdeA8nw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v3 09/16] mips: cavium-octeon: Move octeon-crypto.h into asm directory
Date: Mon, 30 Jun 2025 09:03:13 -0700
Message-ID: <20250630160320.2888-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630160320.2888-1-ebiggers@kernel.org>
References: <20250630160320.2888-1-ebiggers@kernel.org>
MIME-Version: 1.0
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

Since arch/mips/cavium-octeon/crypto/octeon-crypto.h is now needed
outside of its directory, move it to
arch/mips/include/asm/octeon/crypto.h so that it can be included as
<asm/octeon/crypto.h>.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/mips/cavium-octeon/crypto/octeon-crypto.c                 | 3 +--
 arch/mips/cavium-octeon/crypto/octeon-md5.c                    | 3 +--
 arch/mips/cavium-octeon/crypto/octeon-sha1.c                   | 3 +--
 arch/mips/cavium-octeon/crypto/octeon-sha256.c                 | 3 +--
 arch/mips/cavium-octeon/crypto/octeon-sha512.c                 | 3 +--
 .../crypto/octeon-crypto.h => include/asm/octeon/crypto.h}     | 0
 6 files changed, 5 insertions(+), 10 deletions(-)
 rename arch/mips/{cavium-octeon/crypto/octeon-crypto.h => include/asm/octeon/crypto.h} (100%)

diff --git a/arch/mips/cavium-octeon/crypto/octeon-crypto.c b/arch/mips/cavium-octeon/crypto/octeon-crypto.c
index cfb4a146cf178..0ff8559391f5b 100644
--- a/arch/mips/cavium-octeon/crypto/octeon-crypto.c
+++ b/arch/mips/cavium-octeon/crypto/octeon-crypto.c
@@ -5,16 +5,15 @@
  *
  * Copyright (C) 2004-2012 Cavium Networks
  */
 
 #include <asm/cop2.h>
+#include <asm/octeon/crypto.h>
 #include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/sched/task_stack.h>
 
-#include "octeon-crypto.h"
-
 /**
  * Enable access to Octeon's COP2 crypto hardware for kernel use. Wrap any
  * crypto operations in calls to octeon_crypto_enable/disable in order to make
  * sure the state of COP2 isn't corrupted if userspace is also performing
  * hardware crypto operations. Allocate the state parameter on the stack.
diff --git a/arch/mips/cavium-octeon/crypto/octeon-md5.c b/arch/mips/cavium-octeon/crypto/octeon-md5.c
index fbc84eb7fedf5..a8ce831e2cebd 100644
--- a/arch/mips/cavium-octeon/crypto/octeon-md5.c
+++ b/arch/mips/cavium-octeon/crypto/octeon-md5.c
@@ -17,20 +17,19 @@
  * under the terms of the GNU General Public License as published by the Free
  * Software Foundation; either version 2 of the License, or (at your option)
  * any later version.
  */
 
+#include <asm/octeon/crypto.h>
 #include <asm/octeon/octeon.h>
 #include <crypto/internal/hash.h>
 #include <crypto/md5.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/string.h>
 #include <linux/unaligned.h>
 
-#include "octeon-crypto.h"
-
 struct octeon_md5_state {
 	__le32 hash[MD5_HASH_WORDS];
 	u64 byte_count;
 };
 
diff --git a/arch/mips/cavium-octeon/crypto/octeon-sha1.c b/arch/mips/cavium-octeon/crypto/octeon-sha1.c
index e70f21a473daf..e4a369a7764fb 100644
--- a/arch/mips/cavium-octeon/crypto/octeon-sha1.c
+++ b/arch/mips/cavium-octeon/crypto/octeon-sha1.c
@@ -11,20 +11,19 @@
  * Copyright (c) Alan Smithee.
  * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
  * Copyright (c) Jean-Francois Dive <jef@linuxbe.org>
  */
 
+#include <asm/octeon/crypto.h>
 #include <asm/octeon/octeon.h>
 #include <crypto/internal/hash.h>
 #include <crypto/sha1.h>
 #include <crypto/sha1_base.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
-#include "octeon-crypto.h"
-
 /*
  * We pass everything as 64-bit. OCTEON can handle misaligned data.
  */
 
 static void octeon_sha1_store_hash(struct sha1_state *sctx)
diff --git a/arch/mips/cavium-octeon/crypto/octeon-sha256.c b/arch/mips/cavium-octeon/crypto/octeon-sha256.c
index f93faaf1f4af6..c20038239cb6b 100644
--- a/arch/mips/cavium-octeon/crypto/octeon-sha256.c
+++ b/arch/mips/cavium-octeon/crypto/octeon-sha256.c
@@ -10,17 +10,16 @@
  * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
  * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
  * SHA224 Support Copyright 2007 Intel Corporation <jonathan.lynch@intel.com>
  */
 
+#include <asm/octeon/crypto.h>
 #include <asm/octeon/octeon.h>
 #include <crypto/internal/sha2.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
-#include "octeon-crypto.h"
-
 /*
  * We pass everything as 64-bit. OCTEON can handle misaligned data.
  */
 
 void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
diff --git a/arch/mips/cavium-octeon/crypto/octeon-sha512.c b/arch/mips/cavium-octeon/crypto/octeon-sha512.c
index 215311053db3c..53de74f642db0 100644
--- a/arch/mips/cavium-octeon/crypto/octeon-sha512.c
+++ b/arch/mips/cavium-octeon/crypto/octeon-sha512.c
@@ -11,19 +11,18 @@
  * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
  * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
  * Copyright (c) 2003 Kyle McMartin <kyle@debian.org>
  */
 
+#include <asm/octeon/crypto.h>
 #include <asm/octeon/octeon.h>
 #include <crypto/internal/hash.h>
 #include <crypto/sha2.h>
 #include <crypto/sha512_base.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
-#include "octeon-crypto.h"
-
 /*
  * We pass everything as 64-bit. OCTEON can handle misaligned data.
  */
 
 static void octeon_sha512_store_hash(struct sha512_state *sctx)
diff --git a/arch/mips/cavium-octeon/crypto/octeon-crypto.h b/arch/mips/include/asm/octeon/crypto.h
similarity index 100%
rename from arch/mips/cavium-octeon/crypto/octeon-crypto.h
rename to arch/mips/include/asm/octeon/crypto.h
-- 
2.50.0


