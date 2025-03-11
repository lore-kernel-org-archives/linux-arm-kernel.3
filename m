Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5071DC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 19:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+SpyETi/gYd8HkOBMRL09DevPQ5DM0VPD+wKvb5kCo0=; b=I/tsQwPhxChltlrodkXkcoz6NO
	Wd8HVIeQ1Lmgjz2Bm4xun8mxR5QdEwDkmCkaE8o9cWpxFkk5tVhEv2uDytBQt8azH5j1EWApx24pK
	pB2o2eq9XtDbzHki34A3s40LaeawPvBsVr5OLf92+XJCq9kdcSqvyqyR5GS0fyzzbyuuJvbN6xhpj
	LaIz3xayscqw6aaQkjiBOxBkDow+Ce5l9TUyW8fHhKGpAe9GueAUCtqxPeiZhjyA08qAfLq5JM8ed
	HjRiz0qOZ3JoPP26MQ9urPPbZ94UVtIkF2FfhxKYuVSq8/LsJRoXf9yPBqL5an5xPGSJGVI55VYnp
	TlpvaYHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5eB-00000006q9e-2Ngk;
	Tue, 11 Mar 2025 19:52:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5WA-00000006o2C-3xhR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 19:44:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6B4535C6882;
	Tue, 11 Mar 2025 19:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29AAAC4CEEF;
	Tue, 11 Mar 2025 19:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741722238;
	bh=s488wFx5aTMKVQsqgNol6mUlN0cq/CNqyWNbSJffAq8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mQhCeqyph82Cg2ZwpYdd1k7nkOUcXAegm3Ck1mJcGRLEmBJoxZ49UGDYQzkmtmlsG
	 7LUyW1tCtYTR7P6MKuZGulF+m8zAyHNjGUpDZZ9lOC579dX3TuAjU1mTPqe205kY8t
	 2E+bDZKZ1rwB+fmP0yv3Q6h7v2y/DhDA5g2+88vUYS3y7HGqi00w7aI7xxfBFFZWFl
	 zTFk5D4Wm7EV3xo4vomEbRC3d2s/vi7IiidUjKzXY2kxs5AkMbI6sXBz3kkky4CAo8
	 78ubUEW5qPeKmEODKZxzdktonaFfsztlHgsf9Qeko+5b/NhuCjxNw1n53rDZyahQ+o
	 pFzCZQ4CFhsMg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 11 Mar 2025 20:43:42 +0100
Subject: [PATCH 1/2] ARM: Require linker to support KEEP within OVERLAY for
 DCE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-arm-fix-vectors-with-linker-dce-v1-1-ec4c382e3bfd@kernel.org>
References: <20250311-arm-fix-vectors-with-linker-dce-v1-0-ec4c382e3bfd@kernel.org>
In-Reply-To: <20250311-arm-fix-vectors-with-linker-dce-v1-0-ec4c382e3bfd@kernel.org>
To: Russell King <linux@armlinux.org.uk>
Cc: Christian Eggers <ceggers@arri.de>, Arnd Bergmann <arnd@arndb.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Yuntao Liu <liuyuntao12@huawei.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2601; i=nathan@kernel.org;
 h=from:subject:message-id; bh=s488wFx5aTMKVQsqgNol6mUlN0cq/CNqyWNbSJffAq8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOkXJlV2GovpTBT86pTRJnX/AlvNY7+QFxmeUgf39bjuU
 U99Ib+uo5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEyE5THD/5jN38IN3Q41PXob
 WTvl9EcNozk9WYqH/jUurNrRHCs6eyvDP4WwnBQeodO7Dwg3PD9jvPG3zWb2heZtnjazLPbF7bB
 u4QEA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_124359_107538_C324F7E1 
X-CRM114-Status: GOOD (  12.66  )
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

ld.lld prior to 21.0.0 does not support using the KEEP keyword within an
overlay description, which may be needed to avoid discarding necessary
sections within an overlay with '--gc-sections', which can be enabled
for the kernel via CONFIG_LD_DEAD_CODE_DATA_ELIMINATION.

Disallow CONFIG_LD_DEAD_CODE_DATA_ELIMINATION without support for KEEP
within OVERLAY and introduce a macro, OVERLAY_KEEP, that can be used to
conditionally add KEEP when it is properly supported to avoid breaking
old versions of ld.lld.

Cc: stable@vger.kernel.org
Link: https://github.com/llvm/llvm-project/commit/381599f1fe973afad3094e55ec99b1620dba7d8c
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/arm/Kconfig                   | 2 +-
 arch/arm/include/asm/vmlinux.lds.h | 6 ++++++
 init/Kconfig                       | 5 +++++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 835b5f100e92..f3f6b7a33b79 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -121,7 +121,7 @@ config ARM
 	select HAVE_KERNEL_XZ
 	select HAVE_KPROBES if !XIP_KERNEL && !CPU_ENDIAN_BE32 && !CPU_V7M
 	select HAVE_KRETPROBES if HAVE_KPROBES
-	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if (LD_VERSION >= 23600 || LD_IS_LLD)
+	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if (LD_VERSION >= 23600 || LD_CAN_USE_KEEP_IN_OVERLAY)
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI
 	select HAVE_OPTPROBES if !THUMB2_KERNEL
diff --git a/arch/arm/include/asm/vmlinux.lds.h b/arch/arm/include/asm/vmlinux.lds.h
index d60f6e83a9f7..0f8ef1ed725e 100644
--- a/arch/arm/include/asm/vmlinux.lds.h
+++ b/arch/arm/include/asm/vmlinux.lds.h
@@ -34,6 +34,12 @@
 #define NOCROSSREFS
 #endif
 
+#ifdef CONFIG_LD_CAN_USE_KEEP_IN_OVERLAY
+#define OVERLAY_KEEP(x)		KEEP(x)
+#else
+#define OVERLAY_KEEP(x)		x
+#endif
+
 /* Set start/end symbol names to the LMA for the section */
 #define ARM_LMA(sym, section)						\
 	sym##_start = LOADADDR(section);				\
diff --git a/init/Kconfig b/init/Kconfig
index d0d021b3fa3b..fc994f5cd5db 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -129,6 +129,11 @@ config CC_HAS_COUNTED_BY
 	# https://github.com/llvm/llvm-project/pull/112636
 	depends on !(CC_IS_CLANG && CLANG_VERSION < 190103)
 
+config LD_CAN_USE_KEEP_IN_OVERLAY
+	# ld.lld prior to 21.0.0 did not support KEEP within an overlay description
+	# https://github.com/llvm/llvm-project/pull/130661
+	def_bool LD_IS_BFD || LLD_VERSION >= 210000
+
 config RUSTC_HAS_COERCE_POINTEE
 	def_bool RUSTC_VERSION >= 108400
 

-- 
2.48.1


