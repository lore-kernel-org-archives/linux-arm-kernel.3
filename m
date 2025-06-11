Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C5BC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 02:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ofl6Xvs+SZI+IcwhjXPcJ9qRy25z7+9SkGFo0+urxZM=; b=38YAJaUWwP/SiU1Uz0pA/M0cU0
	WwxCgBGpTFmOSR+nbiEGf2DBpTrP4//4SrFL5L6rDnYPREkHO9b7b1qqkgVQ0Rd2UDMhbe2pbA6li
	2xTwukAlHm7Gn/iYwX8V6D061S/Dek2QT6Y+zJep4NyDWTYJa1bSGsujOueVvHTfZIIO/oqwtqoNI
	Rf2GGk9eDHMXB5TdLeHGHagNgm72KYhpa10QTjHZSAozvBrXiCmJ+Y36zno9LOwjs4KTEwNuRRQC7
	tqvajgnwE5nyFWcEvVyZGDKjo3gJLfwWLUsB6Sla1cm+DWOp8FnVu8h9WSTf5OBQ+P/R8+jGPl72Q
	NyEwQt5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPBN5-00000008fqy-45nA;
	Wed, 11 Jun 2025 02:39:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPAxa-00000008cSv-1Bgb;
	Wed, 11 Jun 2025 02:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ofl6Xvs+SZI+IcwhjXPcJ9qRy25z7+9SkGFo0+urxZM=; b=INwygZHdmcOxPwmH3zprU53RAH
	zfaklVG4W3oD/n2aPTfa0gXPdoIm8xh9nNAeMOVCMjCt7qmjhk0tQBEMdC0o1gMHIwZE6flIo1TXl
	LqFZEfqm4N5k0WJElqJvQBKTJncSnRPPvg3gjxgy6XotIuGPz3pndACNbR/ckO2wfla30S6bYgSgl
	Q2GJUXrDKqW5reuAWYde3Jn046oi3mEDfM5ib1mQAPO8ZFNSOE2cD5ZSzSuIzQp8BCK4ySKeFKbmA
	IRprE5JGDOBkf8GZEpIsnD6AFn/gVMrMLW05CEdhpa9qN6CQ/1k8/ECI+yjCzD8rz8ZkvmGRyzkAI
	sflYRajQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPAxX-000000024Om-01vV;
	Wed, 11 Jun 2025 02:13:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 23C91A512ED;
	Wed, 11 Jun 2025 02:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98137C4CEF5;
	Wed, 11 Jun 2025 02:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749607976;
	bh=/OUBebx8cR5O9HN1vrTP7fR+8DbcCfZAKgQbXYsaEr0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bp3lwm5pcF9m/zibKff3OP7oc+z+UwZYE89up0zk1T4vJcZ0dNmk9lbG8Lb/iI6ye
	 izHIsUChIGZfNVNgDpvL0TpTj+Y9NQ4feo2as/gximvuUYhgxKcIC4zaSXxXTFJTjp
	 ynE/rosN3PErEXQudIbIhObG6vg87PhIxfIEl/z2SPLAU66PhkE519xltdcm4e6L/a
	 Aq1acnNdJlIni/VmH5U+7cqtpruzwd2EWll1I0b+k92xy96iMwqBhfZaoLmR/cniT8
	 b1YvJHl4ZzNCYIpAq5jtYlCknXY/7j2Yf4UDKc/SVCk/bCJx9EJtZbzFRCaM6zvTC5
	 PpzRddCm81tfA==
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
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 10/16] mips: cavium-octeon: move octeon-crypto.h into asm directory
Date: Tue, 10 Jun 2025 19:09:17 -0700
Message-ID: <20250611020923.1482701-11-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611020923.1482701-1-ebiggers@kernel.org>
References: <20250611020923.1482701-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_031259_258114_126046EC 
X-CRM114-Status: GOOD (  10.91  )
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

From: Eric Biggers <ebiggers@google.com>

Since arch/mips/cavium-octeon/crypto/octeon-crypto.h is now needed
outside of its directory, move it to
arch/mips/include/asm/octeon/crypto.h so that it can be included as
<asm/octeon/crypto.h>.

Signed-off-by: Eric Biggers <ebiggers@google.com>
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
2.49.0


