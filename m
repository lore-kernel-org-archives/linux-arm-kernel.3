Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA9CC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 00:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4J2GUF2aL6ECJo0xVejy3pQfVI0BLjamnEzkKHY5js=; b=bTK65c4X3/+hDTEoCf43PSvzKv
	1Wq1afbEAyLIyyaCxFGLitZKufgcWDk8bU7Goj8hLske3y9rzbZTkQRgOsWDIeRWtTh7F/aZ2cssZ
	s9YQi5rJzyyVRtUk92pVtahEPw2HFxhfd92FA3zdFiyAx3LCvF+1YnyboDdg48rEhwdZnHmqUDvNq
	jWBr9EPwpP0azRq2Y00oaK5LPxmfGAw1We2Fk6zZzoy3E3Cz+QGvvJDcsKf4DBicwv/Wioz/0opfJ
	9zwxQ0aMDFoikpvv4p+VdcnpiLc5JltvOnw9F/iwwRPWzo3cQPnhI00Fh8uPqDYw96rGsvuOSxKoP
	1wzJGk8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7kaR-0000000CPh4-0NMJ;
	Thu, 24 Apr 2025 00:37:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7kMl-0000000CNVW-234g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 00:23:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8C44BA4BCAE;
	Thu, 24 Apr 2025 00:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF59C4CEE3;
	Thu, 24 Apr 2025 00:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745454178;
	bh=Up5/ryL8wH2Q6sqbHVYBM9bv82MTpfPmfOyPPhXlSTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=meb78kAZg/xXyofHK642o1nJilPUui1hWwQEiQcEAZp40YHq2X+2iFfOzuUmsuRi9
	 /3ffaGxEzDvJ+4CHOJL+uBQ6odaBfJuVxNhw+2MXAr0Jao1aTTVF7+CDM6Gu3kNc07
	 vdQ9diSFeZab1xfjE/0X2hR44LA7XGtyI1qsuafq+uRffibBIzSfwGVpBw5TVJuua4
	 QgDLXyUF11mB8KnDES3NoRHYmKLy5TeQMZ0GiXqGkPLwGhx+ngG1whg8WzeDDc1h8e
	 f0SpLtEG+ndGMrAYamUBqpo63QNSFe8fTHJQErtouHSb8QV8aPD+YkoTsNTHdQ52uw
	 CRjoZgSmWkOWQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 3/7] powerpc/crc: drop "glue" from filenames
Date: Wed, 23 Apr 2025 17:20:34 -0700
Message-ID: <20250424002038.179114-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424002038.179114-1-ebiggers@kernel.org>
References: <20250424002038.179114-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_172259_593080_5BDB7C2A 
X-CRM114-Status: GOOD (  10.88  )
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

The use of the term "glue" in filenames is a Crypto API-ism that rarely
shows up elsewhere in lib/ or arch/*/lib/.  I think adopting it there
was a mistake.  The library just uses standard functions, so the amount
of code that could be considered "glue" is quite small.  And while often
the C functions just wrap the assembly functions, there are also cases
like crc32c_arch() in arch/x86/lib/crc32-glue.c that blur the line by
in-lining the actual implementation into the C function.  That's not
"glue code", but rather the actual code.

Therefore, let's drop "glue" from the filenames and instead use e.g.
crc32.c instead of crc32-glue.c.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/powerpc/lib/Makefile                            | 4 ++--
 arch/powerpc/lib/{crc-t10dif-glue.c => crc-t10dif.c} | 0
 arch/powerpc/lib/{crc32-glue.c => crc32.c}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/powerpc/lib/{crc-t10dif-glue.c => crc-t10dif.c} (100%)
 rename arch/powerpc/lib/{crc32-glue.c => crc32.c} (100%)

diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index dd8a4b52a0ccb..27f8a01438603 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -77,11 +77,11 @@ obj-$(CONFIG_ALTIVEC)	+= xor_vmx.o xor_vmx_glue.o
 CFLAGS_xor_vmx.o += -mhard-float -maltivec $(call cc-option,-mabi=altivec)
 # Enable <altivec.h>
 CFLAGS_xor_vmx.o += -isystem $(shell $(CC) -print-file-name=include)
 
 obj-$(CONFIG_CRC32_ARCH) += crc32-powerpc.o
-crc32-powerpc-y := crc32-glue.o crc32c-vpmsum_asm.o
+crc32-powerpc-y := crc32.o crc32c-vpmsum_asm.o
 
 obj-$(CONFIG_CRC_T10DIF_ARCH) += crc-t10dif-powerpc.o
-crc-t10dif-powerpc-y := crc-t10dif-glue.o crct10dif-vpmsum_asm.o
+crc-t10dif-powerpc-y := crc-t10dif.o crct10dif-vpmsum_asm.o
 
 obj-$(CONFIG_PPC64) += $(obj64-y)
diff --git a/arch/powerpc/lib/crc-t10dif-glue.c b/arch/powerpc/lib/crc-t10dif.c
similarity index 100%
rename from arch/powerpc/lib/crc-t10dif-glue.c
rename to arch/powerpc/lib/crc-t10dif.c
diff --git a/arch/powerpc/lib/crc32-glue.c b/arch/powerpc/lib/crc32.c
similarity index 100%
rename from arch/powerpc/lib/crc32-glue.c
rename to arch/powerpc/lib/crc32.c
-- 
2.49.0


