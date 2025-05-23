Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589B9C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 05:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JaXnETxdWqbmIbvIT6H5WRFYzJ05uVw7n70J2uUzaFQ=; b=gA2DATMUDvrimtxVkYSQi3yCfO
	GXJQKn53kU1Zf6AJcZeECrhulF6k2ehP3fjer2boST0FADbzYPyn203Eu0a2WL9nhDjei9IAAP5Eh
	/DaV18oimpC+fr5Or3buqEh3Qe96CDwkIzFoUhT7pW2H0G0zlD2EUHleVUmfElENVDTBmKtGaZAFi
	hH1oibMAv8lHFdJVy7BPNenLOkMOhfSXxYefE7zZM2m6JuA+I6ekmG/adIKf/m77ZzpPKV3blqLHF
	vMByUHRIrTRtzNFqOpsGTujg6AjRC9x1LPwQvGC61KR6aga1HBGzETdRyMx1WMhPtfmScrGLetEvW
	UdDbem2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIKeZ-00000002yOT-1Waz;
	Fri, 23 May 2025 05:09:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIKC7-00000002u2n-3qEz;
	Fri, 23 May 2025 04:39:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 59A3562A60;
	Fri, 23 May 2025 04:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 220CFC4CEEF;
	Fri, 23 May 2025 04:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747975183;
	bh=qfrc6vYarbMRQKv1a7xZvSfoxfkNIKlLJL8wJGuWS5I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fbUGodwJRuPFbGj2rmb07LimNKiilPja/Re2UpMZrtv+LFKGOsocK4ASzPYnRWGAw
	 h0UPFtLNzxHO+L/wp+cfVKPnCLznvwW696LzrGi8kwrTwrLK08IcXb6276wlGkceSF
	 TDV+KhMod7MFWrUddTu1iu76mFX6e2noD89w4oKerMRogRRPXyEm20oO1zZNDq0oEm
	 r3LyFDxJr6pfuSz0GIQzFfIlIWs82juw5aQvWE2KnLB1cbP4NsGPJl4m+29T1RmBvw
	 0JBNjoPjcg4yhzhjheddU3GoWMuoYxlZphPGvXkkf8Nxmo1qxKKg8KoTFdlh1sQ9k5
	 jZl4kmogyzHVA==
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 14/14] configs/hardening: Enable CONFIG_INIT_ON_FREE_DEFAULT_ON
Date: Thu, 22 May 2025 21:39:24 -0700
Message-Id: <20250523043935.2009972-14-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523043251.it.550-kees@kernel.org>
References: <20250523043251.it.550-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=961; i=kees@kernel.org; h=from:subject; bh=qfrc6vYarbMRQKv1a7xZvSfoxfkNIKlLJL8wJGuWS5I=; b=owGbwMvMwCVmps19z/KJym7G02pJDBn6v/+stliQLFcnI3MhNuGpqrXlscsrPuZ2Pphw9PPty JK/tZMZOkpZGMS4GGTFFFmC7NzjXDzetoe7z1WEmcPKBDKEgYtTACZy9jUjwz9r0T3FG5uDw0+4 eXQIht/dYufivG1V+fbJC4R/a1xouMvIsO2lyatle/N4Tq8Kn/e280RHCuP9s5s4OE3DpW5fOpL 9jgkA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

To reduce stale data lifetimes, enable CONFIG_INIT_ON_FREE_DEFAULT_ON as
well. This matches the addition of CONFIG_STACKLEAK=y, which is doing
similar for stack memory.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: <linux-hardening@vger.kernel.org>
---
 kernel/configs/hardening.config | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/configs/hardening.config b/kernel/configs/hardening.config
index d24c2772d04d..64caaf997fc0 100644
--- a/kernel/configs/hardening.config
+++ b/kernel/configs/hardening.config
@@ -60,6 +60,9 @@ CONFIG_LIST_HARDENED=y
 # Initialize all heap variables to zero on allocation.
 CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
 
+# Initialize all heap variables to zero on free to reduce stale data lifetime.
+CONFIG_INIT_ON_FREE_DEFAULT_ON=y
+
 # Initialize all stack variables to zero on function entry.
 CONFIG_INIT_STACK_ALL_ZERO=y
 
-- 
2.34.1


