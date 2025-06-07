Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45266C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 10:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8n6QCw8D97hVVBa2EtoWRjTvGJAaNTdlW7Jb/t/b3YQ=; b=B/kVT4o3n/KPtWyumNgt1PqbKZ
	5ROusOEpo5O3AA0YXveaHFX7b5Ed8yllPWAmSF+PvZ6+eyTaKTZUykFPZwe81zQPL5nVxGehF28dL
	1H6PYYwE/4F+7WhNDArQi8H95h4g2niMZ9uIM6ECWgDS1bfiiVggLlCuiMTTQNmP0j/P05AijdTyi
	Ppx7KR8P+PrtJ6jTiu/7Ft5s7IcQblb62dYSOXTQct1a6VkE/7S2o/u0xXD9DedqiSbhtX6P0iXR4
	5haWwm8jiBrknI+bwnayB1v3GFZI0OKQTJGzSGSWm5490NAbyX+w3OCjaIPjRxF6X14xaPrSy8hLp
	QVB+ESCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNr38-00000001YoK-073C;
	Sat, 07 Jun 2025 10:45:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNqyo-00000001YOb-1rzX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 10:40:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FCCF4A996;
	Sat,  7 Jun 2025 10:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7580EC4AF0C;
	Sat,  7 Jun 2025 10:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749292848;
	bh=seEbax6Kj/wDy0jltE5arD5yjLJawRvF6eCE7MEEHNg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ic9U1aa1HtODB2LOg/RHMcUzLmZv4ZeVsPyrmRIg9rmeJaWssB5Uei7xwmOZeLRdf
	 3pF4ptrL85FfRdrtWlMT5f2TEUpEuqn7st6xg2WW05GC0aLvS4s11IKKjmk4tF5pW5
	 qUowIdbf9K8Aj5UODLubUF3pHTITS+b7bH4fIIHl/MSUu1iTVJ5IVZG8o3uj1wC4OP
	 Mc/CeV7VHGLT0//1n3G1BAKcP5WFr6hos5G316qtEoTSCd+X22/di0o8XJpCLe0dTe
	 2pN1TRMcgWUDK9Av18qQ5FhnTUOqGcGkEjl5TE1xb/raOC1LQ0Og3WGLfD80OGoHn2
	 owc5syW50yCGQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uNqyk-004o03-Mw;
	Sat, 07 Jun 2025 11:40:46 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>
Subject: [PATCH 2/2] arm64: Restore UL() use in alternative macros after binutils bump
Date: Sat,  7 Jun 2025 11:40:41 +0100
Message-Id: <20250607104041.1406771-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250607104041.1406771-1-maz@kernel.org>
References: <20250607104041.1406771-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, ardb@kernel.org, arnd@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_034050_525972_DDA0C8E6 
X-CRM114-Status: GOOD (  12.80  )
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

Binutils versions up to (and including) 2.27 are not handling L/UL
suffixes on constants, making it impossible to use the BIT() macro
in some of the alternative macros.

Now that binutils 2.30 is the base version, revert ba00c2a04fa54
("arm64: fix the build with binutils 2.27") and allow the use of the
BIT() macro in inline assembly, such as the alternative code.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/alternative-macros.h | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/alternative-macros.h b/arch/arm64/include/asm/alternative-macros.h
index 61c2cbe618b9f..7d80d488c7faf 100644
--- a/arch/arm64/include/asm/alternative-macros.h
+++ b/arch/arm64/include/asm/alternative-macros.h
@@ -8,12 +8,7 @@
 #include <asm/cpucaps.h>
 #include <asm/insn-def.h>
 
-/*
- * Binutils 2.27.0 can't handle a 'UL' suffix on constants, so for the assembly
- * macros below we must use we must use `(1 << ARM64_CB_SHIFT)`.
- */
-#define ARM64_CB_SHIFT	15
-#define ARM64_CB_BIT	BIT(ARM64_CB_SHIFT)
+#define ARM64_CB_BIT	BIT(15)
 
 #if ARM64_NCAPS >= ARM64_CB_BIT
 #error "cpucaps have overflown ARM64_CB_BIT"
@@ -76,7 +71,7 @@
 	__ALTERNATIVE_CFG(oldinstr, newinstr, cpucap, IS_ENABLED(cfg))
 
 #define ALTERNATIVE_CB(oldinstr, cpucap, cb) \
-	__ALTERNATIVE_CFG_CB(oldinstr, (1 << ARM64_CB_SHIFT) | (cpucap), 1, cb)
+	__ALTERNATIVE_CFG_CB(oldinstr, ARM64_CB_BIT | (cpucap), 1, cb)
 #else
 
 #include <asm/assembler.h>
@@ -151,7 +146,7 @@
 .macro alternative_cb cap, cb
 	.set .Lasm_alt_mode, 0
 	.pushsection .altinstructions, "a"
-	altinstruction_entry 661f, \cb, (1 << ARM64_CB_SHIFT) | \cap, 662f-661f, 0
+	altinstruction_entry 661f, \cb, ARM64_CB_BIT | \cap, 662f-661f, 0
 	.popsection
 661:
 .endm
-- 
2.39.2


