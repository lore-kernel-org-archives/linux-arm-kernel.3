Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECB910706EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 17:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MceOidYJaHcKZ8OZiTpRENq1la6I2aa1Dj6FkLggYKw=; b=xssKbkIgaE8ZThRoY6fZ5YOBR1
	Y8igbPQs2C1OBYcACX0+lwPRKnhVDECmQq2AID0/Hbbm73vonBhfnV8j9PZS+SOoYsOvNzITZVGFe
	UKo32xTfjcRUzPOzEgrUS7qFVi8/Bt1nKEZ7EmIdcNB/FQcHpdOPWHBofE9BzyrrlqaZRsGnv8WpC
	x4ziWop4S5mveMOOgj9Wk0F8qDH6lzyLPyO1LgA5RlYQUvTyz1O8E4nGi876nIVL2RvsUoKRdRT8V
	iscbOixJsatqmZEB5tEcn2gg87dy8+2QTaGgG1ijDnjj8tp90RLmCOaRzDuGHYSOA255NmTs+aSBh
	5RZfeovw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1TGA-000000023an-3fJQ;
	Sat, 14 Mar 2026 17:58:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1TG9-000000023aG-0pDp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 17:58:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FEAF600AD;
	Sat, 14 Mar 2026 17:58:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5AA5C116C6;
	Sat, 14 Mar 2026 17:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773511124;
	bh=LywMY+JgQOoqvYnuILk1SbJlfvjgB43wfskpy5/iCeY=;
	h=From:To:Cc:Subject:Date:From;
	b=gOLq+2bSXKngpGELKWOh6uHJ9c4pUOvNi0cSGD3XfMSTZ/3u9CYQbpx6oG8EPQCu0
	 TSA2T/gyOITQi8r8D/E5l9/L1GYzN+LfGpqeZ/2WDMFiTW1c9+ngWYar3MNVg5fXO7
	 0ZJ/1OeL6huFICS7aBOYxnz/f5wgKxB2pvJhTTyboGEmOotpHK1/AJrAxnDdMwjXwF
	 WrUwbM+ISlcuiMpf3nS6GggTKwpyLlvWsv78JG5sU/xnM7wKMz0l21WU/rdPSx7Ntx
	 ETf9zel+3CRcSBQVP679j8o/zYf8KGW4LXlyz0OYgkEiNHOVsn4uJrxTJLW+XXqgCk
	 D5Enco2E+Ks2A==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH] lib/crc: arm64: Drop check for CONFIG_KERNEL_MODE_NEON
Date: Sat, 14 Mar 2026 10:57:44 -0700
Message-ID: <20260314175744.30620-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
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

CONFIG_KERNEL_MODE_NEON is always enabled on arm64, and it always has
been since its introduction in 2013.  Given that and the fact that the
usefulness of kernel-mode NEON has only been increasing over time,
checking for this option in arm64-specific code is unnecessary.  Remove
this check from lib/crc/ to simplify the code and prevent any future
bugs where e.g. code gets disabled due to a typo in this logic.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---

This patch is targeting crc-next
(https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=crc-next)

 lib/crc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
index cca228879bb5a..52e216f397468 100644
--- a/lib/crc/Kconfig
+++ b/lib/crc/Kconfig
@@ -46,11 +46,11 @@ config CRC_T10DIF
 
 config CRC_T10DIF_ARCH
 	bool
 	depends on CRC_T10DIF && CRC_OPTIMIZATIONS
 	default y if ARM && KERNEL_MODE_NEON
-	default y if ARM64 && KERNEL_MODE_NEON
+	default y if ARM64
 	default y if PPC64 && ALTIVEC
 	default y if RISCV && RISCV_ISA_ZBC
 	default y if X86
 
 config CRC32

base-commit: c13cee2fc7f137dd25ed50c63eddcc578624f204
-- 
2.53.0


