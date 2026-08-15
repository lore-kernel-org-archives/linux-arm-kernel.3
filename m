Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24F1C5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 04:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MPvOEc+5lf8H/6sumQoxrEWGP3CaWe5SGGeAIoQ2JNA=; b=0fu7CQk6quTtRiRzZOI4PxRygF
	aGltT0Jsj9mTCzU9KoAa9I981Qv/XmyJMkQMTyS/EqiuQ8/PA8xOks9qscUJZXjll+xcFj7QAfTjR
	ziyLkIh7v6vBkxxIWM2GNaXZei0e6tH6REgu+iDJDOtOQLb0lB59CLWyKd0nAeW9v7yK6kS4JqokI
	bof8kCepzHxtP26ivZ7v0Iq2Uuz8PZuNNntEhFpq2xrj/s8Aar3/alzHTyY0q+GyHyWxf/MSFUZPs
	/toLjjOsMAH7NYGaxOY7iKdalWWwT5uCQt0xKHsNX1B+k9NrvO8FUUa7UnO+9pUDbnZW5Bh0MNkG2
	8cCGJRMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6HV-00000003V5y-2fGl;
	Sat, 15 Aug 2026 04:46:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6HH-00000003Uzu-0Jqd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 04:45:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 87DE26136F;
	Sat, 15 Aug 2026 04:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7001F00A3F;
	Sat, 15 Aug 2026 04:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786769150;
	bh=MPvOEc+5lf8H/6sumQoxrEWGP3CaWe5SGGeAIoQ2JNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EWSVAKHkynKQFLG14e1B38tQtZLc06S4HFXzg5dSPwZvmr7ljXSJsg++F9olxojRK
	 jNv/cLfF72Mi2740XqAg82Yk4PFoiZx2n6avnLb8vTsAhoorDpgyABHPztmOco/mG4
	 FBntnAwwbAZkf7O1ngyOM4m+OPqaHSt2LRHzkIHC8YYMIfzPboYMIUySCHMASxrpVV
	 aP7UXvZO4OGscRC3xcjpaOlLsi7TfaQfqwZlJa4SRP7GZ8q/5VJQzL9Hu+OIS/FcF5
	 aE8UnGVd3ZVd2vhetg5nNEvv1AU3qJY9O1frMp44QsAgVLfeRpTgWbwFL6iFIGQauu
	 kNjRnpjiedOMg==
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
Subject: [PATCH 10/12] efi/libstub: Remove obsolete .note.gnu.property workaround
Date: Fri, 14 Aug 2026 21:45:27 -0700
Message-ID: <e5c957d816240e749a92588d4a9bb44da791f8e3.1786768375.git.jpoimboe@kernel.org>
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

Commit e2179a09ab08 ("efi/libstub: Disable -mbranch-protection") added
--remove-section=.note.gnu.property to the stub objcopy invocation to
work around a Clang bug where the note was emitted for code-less object
files even with -mbranch-protection=none.

That was fixed by LLVM commit a48f6079f288 ("[AArch64] Generate
.note.gnu.property based on module flags") which was released with
Clang 12.  The minimum Clang version is now Clang 17, so this workaround
is no longer needed.

On arm64, the stub also no longer builds with -mbranch-protection=none,
as it has inherited the kernel's flags since commit 8358098b9787
("arm64: efi: Enable BTI codegen and add PE/COFF annotation").

Remove the workaround.  This fixes BTI on arm64, and is a no-op on
RISC-V and LoongArch where the vmlinux generic NOTES macro discards it,
and the x86 and ARM decompressors discard .note.* explicitly.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 drivers/firmware/efi/libstub/Makefile | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index b1c95f69e807d..e18e124a89acf 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -106,12 +106,6 @@ lib-$(CONFIG_UNACCEPTED_MEMORY) += unaccepted_memory.o bitmap.o find.o
 targets				:= $(lib-y)
 lib-y				:= $(patsubst %.o,%.stub.o,$(lib-y))
 
-# Even when -mbranch-protection=none is set, Clang will generate a
-# .note.gnu.property for code-less object files (like lib/ctype.c),
-# so work around this by explicitly removing the unwanted section.
-# https://llvm.org/pr46480
-STUBCOPY_FLAGS-y		+= --remove-section=.note.gnu.property
-
 STUBCOPY_RELOC-$(CONFIG_X86_32)	:= R_386_32
 STUBCOPY_RELOC-$(CONFIG_X86_64)	:= R_X86_64_64
 
-- 
2.55.0


