Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1814EFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 03:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKcHeQA5uvNd10m1hHtIJ14bIz+txaGUEIAFW4gCU0I=; b=HAJsaqa/Tr1bWPEmx1OyF0cZbJ
	VTwcQJG6l1N639Jfl2h1SXbiaRH9SIClGvtRZhPuHO4k7MNYvzGeUOmVvko7A6AiIxnAdbuNXi5Up
	MCDwa1xejdc3lXDYUtZ76xsLjiCqi7MeDN5IxBrYGr+Nxya+Y/lz0SBDv0MYiiaYjEP6z0O9XwUaw
	/O+aPy7gY+IHJ6ROjNcQ2rEg4n6yYulIVhhpJGhwD1Z1xRpQ3mGKyX89dj5nhceYCGzkHi8J4avKA
	qBaKwcev6dxRBFEQn7Vn5vSt1Y/VVltTiJWzZIhMINdmEa0hoi06buTLESQ8HksLdTzqEdoqnU0B9
	VBLQNjHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvA7-00000002ooU-2PGY;
	Wed, 29 Apr 2026 03:00:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvA4-00000002onL-24x4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 03:00:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D8FD434C1;
	Wed, 29 Apr 2026 03:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1340DC4AF09;
	Wed, 29 Apr 2026 03:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777431627;
	bh=1JdIJ9vb9jL455rjHOOqE3nIS6G4mkOnP3omecCdeRw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kJ3pLhdGN3XL6E75i+JKII54KfNjB0NOcy/Sr5jUvlmmcYstHGhL4lxCx7/U/Vt7B
	 EGggW68aq2ouGcWsaI16bBjezwPVA8Szbeyt6l6fiFaeE9WPwI0hpkIOoZ6pzFVwJf
	 uJhsAYkm2Qls+KUcRmG5XnpQv6GhpSNhG+zdNmdwXcT1rQqIT44aupOQ2PvxHWzAFz
	 b/Ii7tzN9Sj9x2P7lSYTDIW93cGs8HG+h7c/I2l59Gc0v54MfHys390tiBiMRV5ZI3
	 D4Xx3sQAsoew3DkR5jym2P7YHKza0FbtiUTYiwdLGbnRmAPfZGOUPBJeMUoWA4YsRh
	 pw8khPjWoak9w==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 28 Apr 2026 22:59:13 -0400
Subject: [PATCH 07/14] ARM: Drop tautological ld.lld conditions from
 ARCH_MULTI_V4{,T}
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-bump-minimum-supported-llvm-version-to-17-v1-7-81d9b2e8ee75@kernel.org>
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383; i=nathan@kernel.org;
 h=from:subject:message-id; bh=1JdIJ9vb9jL455rjHOOqE3nIS6G4mkOnP3omecCdeRw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkfS4wurXbq/2wgWbHk6oK5a2yEM+6wsHuHbQndd5evU
 WxWXYt4RykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZjIsXpGhgslufoeCQ7CT0yt
 NCyXcNW/cdTZHqV5x4snKuzwjqOnUhl+s/BNUK76a/ZbRDHNIubpr/yO2dUfNsw5O5eBY4rYUs5
 f3AA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_200028_564269_9326029F 
X-CRM114-Status: GOOD (  11.17  )
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

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, the '!ld.lld || ld.lld >= 16' dependency of
CONFIG_ARCH_MULTI_V4{,T} is always true, so tit can be removed from both
symbols.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/Kconfig.platforms | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/Kconfig.platforms b/arch/arm/Kconfig.platforms
index 5c19c1f2cff6..386eccc81868 100644
--- a/arch/arm/Kconfig.platforms
+++ b/arch/arm/Kconfig.platforms
@@ -8,16 +8,12 @@ comment "CPU Core family selection"
 config ARCH_MULTI_V4
 	bool "ARMv4 based platforms (FA526, StrongARM)"
 	depends on !ARCH_MULTI_V6_V7
-	# https://github.com/llvm/llvm-project/issues/50764
-	depends on !LD_IS_LLD || LLD_VERSION >= 160000
 	select ARCH_MULTI_V4_V5
 	select CPU_FA526 if !(CPU_SA110 || CPU_SA1100)
 
 config ARCH_MULTI_V4T
 	bool "ARMv4T based platforms (ARM720T, ARM920T, ...)"
 	depends on !ARCH_MULTI_V6_V7
-	# https://github.com/llvm/llvm-project/issues/50764
-	depends on !LD_IS_LLD || LLD_VERSION >= 160000
 	select ARCH_MULTI_V4_V5
 	select CPU_ARM920T if !(CPU_ARM7TDMI || CPU_ARM720T || \
 		CPU_ARM740T || CPU_ARM9TDMI || CPU_ARM922T || \

-- 
2.54.0


