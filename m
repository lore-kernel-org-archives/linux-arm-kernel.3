Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70E3C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 04:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6LkxS33qnyE/6tqok/ZW8s+G6Ny9jOmY+DYEf5VvPts=; b=cE8+J5TN337IifGBKRla+wR1Qq
	6Az+GeHudL5OWDe5aaxAiWNSl+EP2kuaPlDWp+l7aAm8Vxm7c/sddQ3jpEYkP3RcMTM5wbioXdQIY
	Xna5XlKlZpZu5kyGCKxgvAynDW6ik75bGSLP9Ve9RoZi+UG2I4IuQeoiJHAKFtFyWuAYO0X29n6wA
	l/BwnE5+LnnCcnhOwbxHPe9fT0R8Tuth3iCdmI3vGTSn2giav1J5jcWBJZXbGCMnnESuJlClk8Ti5
	z5bt0b7/OsXPzUMPRWIL/VyF5OaoSo9Js/2NtCgLqtG7ioDKYVLv4OVX8y47bPOaeDxUX9/boMzG3
	bSNy3v1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6HV-00000003V5c-1vMW;
	Sat, 15 Aug 2026 04:46:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6HF-00000003Uzj-1FGh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 04:45:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A8F7D41AE7;
	Sat, 15 Aug 2026 04:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 067411F00A3E;
	Sat, 15 Aug 2026 04:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786769148;
	bh=6LkxS33qnyE/6tqok/ZW8s+G6Ny9jOmY+DYEf5VvPts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BLDRKPO2UAIfe9qZWTOKMzIBtGSupsM7I5UNXXkTscXGh4eLgd5aRLRk2KX5Jo9em
	 RqQGPZtUjoVXI7ylHlpW8LzTWmAN5wKggj2aGVJP6BnCloppuw7OTvjLVBQ34sPHb1
	 m2vlhihI3FNAeccKVL8GKESwDkGqmCdiaXWxmDw/AEETGuZnttpgiKD5Qdrc6Os9Zs
	 OcF2DovHma57YhbyvB5TncHDkq3gL+Yu5z0s+O5bS6Ha5fFIhDmPGIsiwWzeNXC67J
	 ZmDvvdmkEXE067zQSkVAvypdT3TL8RecUiVLt5eOE9rqN0MUaK1UlubbUz9ACME0xT
	 jwox+srVzRe8g==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	live-patching@vger.kernel.org,
	Song Liu <song@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-toolchains@vger.kernel.org
Subject: [PATCH 08/12] arm64/bti: Enable BTI in the pi/ startup code
Date: Fri, 14 Aug 2026 21:45:25 -0700
Message-ID: <5c25e0a625b4d16a6e91e63c8d82e33d8c043d74.1786768375.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1786768375.git.jpoimboe@kernel.org>
References: <cover.1786768375.git.jpoimboe@kernel.org>
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

The early startup code in kernel/pi/ is built with
-mbranch-protection=none and has its property note stripped, which
prevents the linker from generating BTI veneers in >128MB kernels.

Unlike the assembly objects, which only lacked the note because
SYM_FUNC_START*() already emits the landing pads, pi/ needs the real
thing.  Some of it runs with the MMU on, where the kernel text is mapped
PTE_GP and BTI is enforced: __pi_scs_patch() is called when loading a
module, and __pi_map_range() is called from create_idmap().

Add -mbranch-protection=bti.  The added "bti c" landing pads execute as
NOPs in the startup code wherever BTI isn't implemented or isn't enforced.

Also stop stripping the objects' property notes, as the linker only
marks the output BTI-compatible if *all* objects advertise it.  Keeping
the note as-is isn't enough either: --prefix-alloc-sections=.init
renames it to .init.note.gnu.property, which GNU ld still parses but LLD
ignores.  Rename it back afterwards so both linkers see it.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm64/kernel/pi/Makefile | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/pi/Makefile b/arch/arm64/kernel/pi/Makefile
index be92d73c25b21..2101d96d754e5 100644
--- a/arch/arm64/kernel/pi/Makefile
+++ b/arch/arm64/kernel/pi/Makefile
@@ -4,7 +4,7 @@
 KBUILD_CFLAGS	:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) -fpie \
 		   -Os -DDISABLE_BRANCH_PROFILING $(DISABLE_KSTACK_ERASE) \
 		   $(DISABLE_LATENT_ENTROPY_PLUGIN) \
-		   $(call cc-option,-mbranch-protection=none) \
+		   $(call cc-option,-mbranch-protection=bti) \
 		   -I$(srctree)/scripts/dtc/libfdt -fno-stack-protector \
 		   -include $(srctree)/include/linux/hidden.h \
 		   -D__DISABLE_EXPORTS -ffreestanding -D__NO_FORTIFY \
@@ -21,11 +21,14 @@ KBUILD_CFLAGS	:= $(filter-out $(CC_FLAGS_LTO), $(KBUILD_CFLAGS))
 
 hostprogs	:= relacheck
 
+# --prefix-alloc-sections=.init also renames .note.gnu.property, which LLD then
+# ignores, dropping the BTI property.  Rename it back.
 quiet_cmd_piobjcopy = $(quiet_cmd_objcopy)
-      cmd_piobjcopy = $(cmd_objcopy) && $(obj)/relacheck $(@) $(<)
+      cmd_piobjcopy = $(cmd_objcopy) && \
+		      $(OBJCOPY) --rename-section .init.note.gnu.property=.note.gnu.property $(@) && \
+		      $(obj)/relacheck $(@) $(<)
 
-$(obj)/%.pi.o: OBJCOPYFLAGS := --prefix-symbols=__pi_ \
-			       --remove-section=.note.gnu.property
+$(obj)/%.pi.o: OBJCOPYFLAGS := --prefix-symbols=__pi_
 $(obj)/%.pi.o: $(obj)/%.o $(obj)/relacheck FORCE
 	$(call if_changed,piobjcopy)
 
-- 
2.55.0


