Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B743A1061B07
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ql45NE5CthOHwHr9fg67QiiXeydVU6k7DB1YpdTx9rs=; b=4MTCbemHIQ67mTsT7GPy4L1QI8
	/WJ0puCovitoF/X7Vi+Jk801Wsv1r79gjlJ7R8k/UAWd/QGDEPa0NqlM5bvgUixR4TZK7cPVmRAbH
	XdPzuSO6K79kx9xiRgublxH4pvWUdTMNGvRDyLQq0x9hQ1opcezUENZCWX6p5yaftindFpRcGZf57
	O7LnDKPBtehu7+DhRaUctZQ8oqD9V+FUyCZNXg9i/Q9nDBydfxtO00Wez+35rnN7KRlhMycu7s5O6
	JVdTpOZdYHqJc5ccj0prmNdArYJPc9sFdtXl5erulhrdiJuSqG3OvAZYMP1YjnWAGrrP8rdfIi8XY
	Pn9+KcEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DtB-0000000BS6Q-1GUp;
	Mon, 30 Mar 2026 14:46:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dt8-0000000BS53-2Klu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:46:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 77395600CB;
	Mon, 30 Mar 2026 14:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD61C19423;
	Mon, 30 Mar 2026 14:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774882005;
	bh=fAIBhC+LS5rsHZRLsEihWNrSlr1ZuUtu4ZmF07BHqog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NSwxlE1di3ozYoRomiji1GzZVuvPUlLR6iuQFkbfdRuRdfbZibnuNXm734/cII0Wg
	 9nOOxf7oSgUSiPQrqFjmsrqY72mxneS3Z5OP0Y8OPfppeJBrGNX+he/TvMxabWEKFg
	 VRVbKaTX0uQ+lE3os6fFA9A3HP2wEJG72SVdudX5fogoQGgr0krvQJsa681tX+LhgM
	 UkCW/GlgKZTPJwUbhbuH53wKXEa0jXhvbLEm03w404fuBhhkL+jaZU/wlPRC46Gr0N
	 t05GanApVtlUXBC1MlpYJWxryIljY9T6O+MHy37Jay8uuchWttilfOZNtRwrCKaj+2
	 NVfHIziIZ4mJw==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Demian Shulhan <demyansh@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 2/5] lib/crc: arm64: Use existing macros for kernel-mode FPU cflags
Date: Mon, 30 Mar 2026 16:46:33 +0200
Message-ID: <20260330144630.33026-9-ardb@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330144630.33026-7-ardb@kernel.org>
References: <20260330144630.33026-7-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=ardb@kernel.org; h=from:subject; bh=fAIBhC+LS5rsHZRLsEihWNrSlr1ZuUtu4ZmF07BHqog=; b=owGbwMvMwCn83sBh/rljoYmMp9WSGDJP9Ry/GXTvwAzbr+9l9S1qeJObxU/mKLG2LUp+/un3w mWmW5KMOqayMAhzMsiKKbLsVM7pfu0i+k5foTIHZg4rE8gQBi5OAZjIfnnGhtuqlZ+fZ76PDPg/ MZ7zhcmFjmsfLtv/+zJfL4vXKF3wt8pEuWrt0FsrE7VF9ixbmfZEjrHORkp3q+b7qxHKW19+nBz BUW/nrHTh9hFhruCkW59X8n4I2RmmfTAuXS7s9CnN23dm7owAAA==
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

Use the existing CC_FPU_CFLAGS and CC_NO_FPU_CFLAGS to pass the
appropriate compiler command line options for building kernel mode NEON
intrinsics code. This is tidier, and will make it easier to reuse the
code for 32-bit ARM.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 lib/crc/Makefile | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/lib/crc/Makefile b/lib/crc/Makefile
index c9c35419b39c..ff213590e4e3 100644
--- a/lib/crc/Makefile
+++ b/lib/crc/Makefile
@@ -39,9 +39,8 @@ crc64-y := crc64-main.o
 ifeq ($(CONFIG_CRC64_ARCH),y)
 CFLAGS_crc64-main.o += -I$(src)/$(SRCARCH)
 
-CFLAGS_REMOVE_arm64/crc64-neon-inner.o += -mgeneral-regs-only
-CFLAGS_arm64/crc64-neon-inner.o += -ffreestanding -march=armv8-a+crypto
-CFLAGS_arm64/crc64-neon-inner.o += -isystem $(shell $(CC) -print-file-name=include)
+CFLAGS_REMOVE_arm64/crc64-neon-inner.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_arm64/crc64-neon-inner.o += $(CC_FLAGS_FPU) -march=armv8-a+crypto
 crc64-$(CONFIG_ARM64) += arm64/crc64-neon-inner.o
 
 crc64-$(CONFIG_RISCV) += riscv/crc64_lsb.o riscv/crc64_msb.o
-- 
2.53.0.1018.g2bb0e51243-goog


