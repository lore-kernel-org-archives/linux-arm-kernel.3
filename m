Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4551CC982DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dtOLc80ZchH1SrJFHNt1KR4Dm3KMyagivA2zXxrs1go=; b=ytWuRigvOvn3Oi
	RXPXV1tQ5LjtcE41CJWBE7vYOD8QRxIRQmeWeS8RnPjZYz4VohjVqYStscm636+EQ6D+Eaoi4MUVe
	+xqGbvaVZ4DwQ84gszWkCFWEauYmWjewzgxjwcsiVl5fbsJtd2XEfV2nYICkNOfnjZJnWrxvuL/Ii
	e7auFZ23lz55d7mLsYZCOh7NjB48eTfmM2HSVun+0C9pXWDJcuR37qRy8rW3Ef9k68IVQuLZtN/2E
	myviZ0RS696LQD4+ALYmHZ5u/0dzr/Gja1Ycs1bIjWm5xyFaTUMO838VRcMXsUmaeAFpvxOLbaEee
	kfC/1/+y2+C4YmMuqBkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bEl-0000000Ez6c-2uTm;
	Fri, 18 Sep 2026 16:14:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bEe-0000000Ez1p-0bqb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:14:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 95F786053D;
	Fri, 18 Sep 2026 16:14:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 650CE1F00898;
	Fri, 18 Sep 2026 16:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748087;
	bh=dtOLc80ZchH1SrJFHNt1KR4Dm3KMyagivA2zXxrs1go=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Qb0YxHlt3q2DkGZ8Sdf5eTPdlGv44KUoKGREksMF7S+ufmYvYiQYiXZeo/ew3aUr3
	 4BtWfDhb/8qtxjgh1uAA7jqIAUiCI3k1MCNgIQRA9D/zNy1p8vG9szNXJod811+iX2
	 ltFzvp0/byPOhWY9lnSUdbO0nKnElVNG1C4vEh3LqYbuZNVFemTx1ddedSqmccvTdI
	 mUXS9g5py+KBJnKBFbz+FQkejtujW0lysjn7/7mqKoSL2BU+dd+IvncGgSmOECsljt
	 dV5UihvAzdi+mCEBychIY6zIeobzLCtiwlsZZ181aUFQA8iolhFMhQJtp+Kftj2Wbp
	 HVOW7lca2e+YA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 09/21] arm64: stackprotector: Re-enable per-task stackprotector
Date: Fri, 18 Sep 2026 17:13:53 +0100
Message-ID: <20260918161407.2300-10-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918161407.2300-1-will@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
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
2.55.0.1082.g2b9226bbc0-goog


