Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210CEC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 00:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbWcMivrKMDK7TfrA20Mqe4AAo8+D5ZysqfxvmmnRek=; b=30Rdc9/zOKDamWVGzZJFyWIVZo
	y+MTyEhD/vI7fn1oP1CYuZRfPqv/HvZB3wPnxhfO6e8CoIYRP5I1QWQIKtZBzSmn9QIAnve0nt7Ul
	J+Q/3AeKbRZT9qs1yh9t6pPHAACHzyOCY4+7/RezRbADcYylke/k8CAl5T+X/t/3ONvSmXYL4uHeY
	qddXSXD0JSSmKTns3OAoKV9gt5N1WsFmje8HVNhDG/mhY6FSH8Vr2FdqaX+DZZmROCufTQtdMfKzI
	FPBkz5XZtqNmETdsR+S03SsNpG5+Ff6cCovh/ZSM6MjhQrftuC3wxbavyzem5jzOvXTHmgFx38RBm
	m9ldPixQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7kSa-0000000COv9-0Upu;
	Thu, 24 Apr 2025 00:29:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7kMl-0000000CNVX-1dyG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 00:22:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7406368461;
	Thu, 24 Apr 2025 00:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E19C4CEF0;
	Thu, 24 Apr 2025 00:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745454178;
	bh=rccSS05ssS2rf46bfeneK2x/JfdC1a/pj9EmN7hGOls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o2B0dh/DG8edBPHhL47uq8g33ExepNWr6h3LPHIZCuKmntMSr/mh8xBGoaCzeCIYz
	 ss0X/+nCSNljZQuvdx+/pPkkezIyuP5LflGCrevm+LNGeVaMyD2Bg6p2Da+9UM9Mx4
	 KIMbFYDHf8G5Up1Y78RwbPpfddi8F6XU3lykN13xvuYUnJupXwxOl1nMQA3Dp51vP7
	 iH3kpAnJrUwX3mmdSdb+ZbQQkvzajKh+TbEXfG5Fs3gexCvVC8F/d9Sg29inCjkDwM
	 EDPcg2qEEExXt3Dh3Gp/NMUGs3fC3hGtzesBe0Ebszy0b8o2TkzOhyB5MydePYwlG7
	 0/PFol/maj0BA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 4/7] powerpc/crc: rename crc32-vpmsum_core.S to crc-vpmsum-template.S
Date: Wed, 23 Apr 2025 17:20:35 -0700
Message-ID: <20250424002038.179114-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424002038.179114-1-ebiggers@kernel.org>
References: <20250424002038.179114-1-ebiggers@kernel.org>
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

From: Eric Biggers <ebiggers@google.com>

Rename crc32-vpmsum_core.S to crc-vpmsum-template.S to properly convey
that (a) it actually generates code for both 32-bit and 16-bit CRCs, not
just 32-bit CRCs; and (b) it has "template" semantics, like x86's
crc-pclmul-template.S, in the sense that it's included by other files.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/powerpc/lib/{crc32-vpmsum_core.S => crc-vpmsum-template.S} | 0
 arch/powerpc/lib/crc32c-vpmsum_asm.S                            | 2 +-
 arch/powerpc/lib/crct10dif-vpmsum_asm.S                         | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/powerpc/lib/{crc32-vpmsum_core.S => crc-vpmsum-template.S} (100%)

diff --git a/arch/powerpc/lib/crc32-vpmsum_core.S b/arch/powerpc/lib/crc-vpmsum-template.S
similarity index 100%
rename from arch/powerpc/lib/crc32-vpmsum_core.S
rename to arch/powerpc/lib/crc-vpmsum-template.S
diff --git a/arch/powerpc/lib/crc32c-vpmsum_asm.S b/arch/powerpc/lib/crc32c-vpmsum_asm.S
index bf442004ea1f2..1b35c55cce0a6 100644
--- a/arch/powerpc/lib/crc32c-vpmsum_asm.S
+++ b/arch/powerpc/lib/crc32c-vpmsum_asm.S
@@ -837,6 +837,6 @@
 	/* 33 bit reflected Barrett constant n */
 	.octa 0x00000000000000000000000105ec76f1
 
 #define CRC_FUNCTION_NAME __crc32c_vpmsum
 #define REFLECT
-#include "crc32-vpmsum_core.S"
+#include "crc-vpmsum-template.S"
diff --git a/arch/powerpc/lib/crct10dif-vpmsum_asm.S b/arch/powerpc/lib/crct10dif-vpmsum_asm.S
index f0b93a0fe168a..47a6266d89a8a 100644
--- a/arch/powerpc/lib/crct10dif-vpmsum_asm.S
+++ b/arch/powerpc/lib/crct10dif-vpmsum_asm.S
@@ -840,6 +840,6 @@
 	.octa 0x000000000000000000000001f65a57f8	/* x^64 div p(x) */
 	/* Barrett constant n */
 	.octa 0x0000000000000000000000018bb70000
 
 #define CRC_FUNCTION_NAME __crct10dif_vpmsum
-#include "crc32-vpmsum_core.S"
+#include "crc-vpmsum-template.S"
-- 
2.49.0


