Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC801CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 23:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKcHeQA5uvNd10m1hHtIJ14bIz+txaGUEIAFW4gCU0I=; b=ztrmcoClBMQ0kNKlVrQbV6lbZ4
	FX1TkzJnoZA+YNx+cOlIFKaYKHbTHPOupAuEE1pRuQf2cx8Mdsnoe4Qv1xHOj4m6W3ANMDP2P6iGu
	ldaTfH5LDrK7lYFFF6isb/IbOZZmFrH+iGAogDZIl0iOm77GbWT6tx41R9UWGLBONtZWnjOKtFiEI
	ZEVpqgGYpXf1m6hySr9MfowrpatsVQUwvArEMu+8R65AuuM20DhPoqoVTBmQnGqN733PWZ2I6N3AM
	Kqu4+EeSnSP1st//YTVx7KEWxPxI5r1r93qZHfvNPwIAgCbPPmKcGppj46UqoqmCaIvlFut88eLDE
	Zi+R3jNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOkYR-0000000Dczk-0CQZ;
	Sun, 17 May 2026 23:05:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOkYN-0000000Dcy0-46Va
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 23:05:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 54FA94352E;
	Sun, 17 May 2026 23:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22416C2BCB3;
	Sun, 17 May 2026 23:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779059147;
	bh=1JdIJ9vb9jL455rjHOOqE3nIS6G4mkOnP3omecCdeRw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=II85SHSVBGKfnV5vgFXTbKf9rEgp1YYAyEOs6BtGoj5be2aR6tvWwOd1Pumz4smzu
	 vm8Si0vaTQJF50m+fJcJx/93YPZyfFzKs52iRisLrIQ799oQ2SEv0Tgy30U8QfPWt5
	 +R6xbnPeajgcsHy811hZPd4erJu617fF/IpdqKOl0Qxr2o4qIJSHCXeTz8BjMW1Ff8
	 Vy6+5iAHanyi3H2e5ubFZ9OpOXXSrZDk8XDZyhNg3aFxMFFrGO7pCKTtch+mFrbxMQ
	 1mBIoJmZQ4mn22kPILRhxae5GJXhsbN5atq7zK/mYvW7leYFfN51KkKMJsUp5Hpycl
	 Z22ksK5WMxEFQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sun, 17 May 2026 13:05:10 -1000
Subject: [PATCH v2 07/16] ARM: Drop tautological ld.lld conditions from
 ARCH_MULTI_V4{,T}
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-bump-minimum-supported-llvm-version-to-17-v2-7-b3b8cda46bdd@kernel.org>
References: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
In-Reply-To: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383; i=nathan@kernel.org;
 h=from:subject:message-id; bh=1JdIJ9vb9jL455rjHOOqE3nIS6G4mkOnP3omecCdeRw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlcnhs/L49o7y4JNXJJv+iu5Lrqz3orziqeE1/m+s003
 Zt41zmjo5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEykfibDbxaj5IMfN5QeN9ZJ
 OFoWzvEotrShQEDsw/fJ3Pv/y7hKSzIyfEpZkj6n3ipjmnLGSXHnSMWKS8v23VH0Ewu/Yb5T6sd
 cXgA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_160548_049878_81750FFE 
X-CRM114-Status: GOOD (  10.30  )
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


