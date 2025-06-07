Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91603C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 20:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=puYKTOQx+60S8FYRlI93DdWC/zyBlmBk2s9q+e05u50=; b=ZmBU00qZ5FJ56xj/PXFzqyI++M
	WHM3fXI7JoenCh6uUFP6IDWhY4G8hBOMUKUo75kBm6Yxs4kEWgI6OY+aUi/N63jigBceJRpjon9Ch
	T1Nto6rypZl+xWdeCIpjwsNfAXtL9M2pxJt3tjjV9wyZy9d3mTDIZM4SPdohq5VVN+7FelQwkrPMi
	M6P1sQOCuKYQWOGItsRqOBGQNiwg88si5Jv66VvWiAv18eY6rWH9JPkSuQbcZMwOhTyLww9wfAoTe
	niuoHgx5lbpy3KVjdCdRR1t0DW+vJBFclJzhV/i3R/P4eXJsMOHp3/vqGTF5BHioKQNICRQ04v//b
	NPjNoxNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO0Ha-000000025Ah-2XS0;
	Sat, 07 Jun 2025 20:36:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNzpU-000000021e2-3Z0O;
	Sat, 07 Jun 2025 20:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=puYKTOQx+60S8FYRlI93DdWC/zyBlmBk2s9q+e05u50=; b=m+7Oejrm5DQO4e8xtaREiitFDV
	kZ8XwVXVGAruBoMtoPRJ/j42ffQWs/aROJ4AjCPJYNRImjHhfKac4w3QhMz6+Z1cgC5ZUiCszrogx
	QpwI3IIYvT9gJdd2PTBwnOzu5ZDs+9RG6Kdzo1HsqHQ8v6JHsz/ZUsGn5DnePjqBf4qezcDMtg7Un
	2FfCIt/dSvriHDNlv8RcKtYcABbd2fYUUHM3JTs+hN12ADPnSLoE2ZUevy+6I4Y7PqF53Xl7Qseq4
	2W6tX0/dTvuhSp+F9vbBkaBN0vMBYVQ2w/hhW815X01pf6Df1HYH/VY6hIXlsaVbPUT7szsDGvRJu
	PvCXtXbA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNzpP-00000001QHB-1d95;
	Sat, 07 Jun 2025 20:07:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1648C5C5AF6;
	Sat,  7 Jun 2025 20:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E744C4CEE4;
	Sat,  7 Jun 2025 20:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749326854;
	bh=ZDBXUza5mYKN0G+LEgQAmbkZEIUs7iZW79q0Idl2Apk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ajEhG5/8HVrfaad1n+slUIYvzE1FkTzDHcl7TWi7cGlPQnDlA04WdKniPoxYQOMYE
	 NFPprqJK5IW0ur0fiG3+y7GcPTyQuszc7j+8AfGYwPfJ+iPIu+ZTxAE0RYDH2G8FKm
	 BJJAZ7QkJFPdzFyT6dT+BjT8tLQ1siQLlN12X59hwHDp/q3vgGfG3SBu0/JsI+taKk
	 yOMBHSm3WUeEOXPURUAoEtz4nwBTplDDJdpMj/2dInexP90CK4TPNO12gzd+vmDwg1
	 x3S8BGN0sPA3MXigsw27iqzjq/8mJ/jiCprDcU9qVKaUU6hKLM3CwKWLsWamrSVvTN
	 6UALswZ1OpPdQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2 12/12] lib/crc: remove ARCH_HAS_* kconfig symbols
Date: Sat,  7 Jun 2025 13:04:54 -0700
Message-ID: <20250607200454.73587-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250607200454.73587-1-ebiggers@kernel.org>
References: <20250607200454.73587-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_210745_386670_18718018 
X-CRM114-Status: UNSURE (   7.39  )
X-CRM114-Notice: Please train this message.
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

These symbols are no longer used, so remove them.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 lib/crc/Kconfig | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
index de4b2182ae7ff..5858b3acc6630 100644
--- a/lib/crc/Kconfig
+++ b/lib/crc/Kconfig
@@ -42,13 +42,10 @@ config CRC_T10DIF
 	tristate
 	help
 	  The CRC-T10DIF library functions.  Select this if your module uses
 	  any of the functions from <linux/crc-t10dif.h>.
 
-config ARCH_HAS_CRC_T10DIF
-	bool
-
 config CRC_T10DIF_ARCH
 	bool
 	depends on CRC_T10DIF && CRC_OPTIMIZATIONS
 	default y if ARM && KERNEL_MODE_NEON
 	default y if ARM64 && KERNEL_MODE_NEON
@@ -61,13 +58,10 @@ config CRC32
 	select BITREVERSE
 	help
 	  The CRC32 library functions.  Select this if your module uses any of
 	  the functions from <linux/crc32.h> or <linux/crc32c.h>.
 
-config ARCH_HAS_CRC32
-	bool
-
 config CRC32_ARCH
 	bool
 	depends on CRC32 && CRC_OPTIMIZATIONS
 	default y if ARM && KERNEL_MODE_NEON
 	default y if ARM64
@@ -83,13 +77,10 @@ config CRC64
 	tristate
 	help
 	  The CRC64 library functions.  Select this if your module uses any of
 	  the functions from <linux/crc64.h>.
 
-config ARCH_HAS_CRC64
-	bool
-
 config CRC64_ARCH
 	bool
 	depends on CRC64 && CRC_OPTIMIZATIONS
 	default y if RISCV && RISCV_ISA_ZBC && 64BIT
 	default y if X86_64
-- 
2.49.0


