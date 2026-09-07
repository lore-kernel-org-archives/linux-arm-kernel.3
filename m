Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6683C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=33ikSkJFX7Vey/KunqKuY1Z4p4KTCUzmgh5gA1LOfSM=; b=hJxV2aBzsWTfxw
	AUjCNIVZEzWa0ngN+F6/zxydq5Zd/H8ihDtbyOxIkA5pNUqtkuR3xNRj8REaQ05ggYB7u5mcYGPLT
	I4/LqZykKbnezhMvYdyP8bwj5SUXZHxYQth7Pc6AdfztzEoQv1AvzI2SEBCk9My29vaEVA9b6YzVe
	m2IGSsTzuOU0fojOBkqc4AIdN8dTqlOXBGURA+ObXSr5Ss8QOxqqRLx+eqemCyZuoi4AYce6ZYPGX
	jz1YWuq8cgrPxtftQDhw3pgRoVOwcq2quWLR7SvN5IqLfco2w82qEU8ZmZliB81estwK2Vys2e5vH
	y10YqdkzgsJ/JH53PYlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cRR-00000007NDU-1hIs;
	Mon, 07 Sep 2026 16:43:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cRP-00000007NC0-34dN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:43:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3129D6022B;
	Mon,  7 Sep 2026 16:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12ECB1F00A3A;
	Mon,  7 Sep 2026 16:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799410;
	bh=33ikSkJFX7Vey/KunqKuY1Z4p4KTCUzmgh5gA1LOfSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NTWw5g9EYJc4qx5bnJPDjgft6wRNu+H5aoJU2ti+7HObaCaoC+7/h4BrXra3BA0tL
	 IGPDCHxwjGtg6yc1AnPO5SxXZCewBIU7aPPnHJ6WoRp49HQyOO7QBUui3geNafL4ht
	 5Qqcma/fvoVwt3ipbTrTz7QpMmQZey0QO0dPRDxigxBw8mVBwz1y0Uzt8OGaOECGXY
	 nsdJtu7rPtzl2udDSFux6/TdsN7FgFwlIcXl191lBPX7J8I2JgqrwfKwmxAN14BKxn
	 uvrP7n9a9k/Uz1/ATlMWSHXCjHSmIZ/LcyAOmUFpD8dt8Ln5U/EOMErPWOHaNO12Ir
	 L7VoAuUET005w==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 09/21] arm64: stackprotector: Re-enable per-task stackprotector
Date: Mon,  7 Sep 2026 17:42:34 +0100
Message-ID: <20260907164247.17223-10-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164247.17223-1-will@kernel.org>
References: <20260907164247.17223-1-will@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Now that 'current' resides in TPIDRRO_EL0, update the per-task
stackprotector compiler invocation to use the new register.

Note that this requires a very recent build of clang [1], as (unlike
GCC), it historically rejected all registers other than SP_EL0.

Cc: Mark Rutland <mark.rutland@arm.com>
Link: https://github.com/llvm/llvm-project/pull/188054 [1]
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/Kconfig  | 3 +--
 arch/arm64/Makefile | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b8270b301809..020fcaf36b1b 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2450,12 +2450,11 @@ config RANDOMIZE_MODULE_REGION_FULL
 	  exhaustion, modules might be able to fall back to a larger 2GB area.
 
 config CC_HAVE_STACKPROTECTOR_SYSREG
-	def_bool $(cc-option,-mstack-protector-guard=sysreg -mstack-protector-guard-reg=sp_el0 -mstack-protector-guard-offset=0)
+	def_bool $(cc-option,-mstack-protector-guard=sysreg -mstack-protector-guard-reg=tpidrro_el0 -mstack-protector-guard-offset=0)
 
 config STACKPROTECTOR_PER_TASK
 	def_bool y
 	depends on STACKPROTECTOR && CC_HAVE_STACKPROTECTOR_SYSREG
-	depends on BROKEN
 
 config UNWIND_PATCH_PAC_INTO_SCS
 	bool "Enable shadow call stack dynamically using code patching"
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 6b005c8fef70..a293ab67818f 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -72,7 +72,7 @@ ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
 prepare: stack_protector_prepare
 stack_protector_prepare: prepare0
 	$(eval KBUILD_CFLAGS += -mstack-protector-guard=sysreg		  \
-				-mstack-protector-guard-reg=sp_el0	  \
+				-mstack-protector-guard-reg=tpidrro_el0	  \
 				-mstack-protector-guard-offset=$(shell	  \
 			awk '{if ($$2 == "TSK_STACK_CANARY") print $$3;}' \
 				$(objtree)/include/generated/asm-offsets.h))
-- 
2.55.0.979.g7e5102b832-goog


