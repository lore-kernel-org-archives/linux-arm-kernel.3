Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B95CC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 04:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fT44iHwShZYqHlrkVVc92252zfcCjw/uJmqte3KuCwo=; b=NvBzuqIWNCIsKO2MfHTCA1wLIo
	Ujass/fXqydPD2T6RMVQq/HJpObTVB66KaW0ETCa+ZWM8G5WYpvCCu42f/srBeh/aNn7IITxPAoRP
	xSWAmwbuu81znKJybqCSqAdTYXjehyxrKtyM1u2tQ4rZlFCiCaTzg0gLDl0iZ4pNkVsC2a53kEz+p
	U46MP7WXajdYUXin+GUr113Hyw+x9JvTRuyUnPj67Jr99b98LknQsaG6sEk/PUhENgek52bC5QO9R
	9IHcaNMaDKJndoE51NpRj4AtvxCfIPE4LkL/RTEQz8uEERCHPvBI2arPjebZNO3WEqDFWeu+6HhqM
	+lBSOJ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6HV-00000003V6m-4A9g;
	Sat, 15 Aug 2026 04:46:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6HG-00000003Uzo-0WQO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 04:45:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 91D6360DC0;
	Sat, 15 Aug 2026 04:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7BBF1F000E9;
	Sat, 15 Aug 2026 04:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786769149;
	bh=fT44iHwShZYqHlrkVVc92252zfcCjw/uJmqte3KuCwo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Hj47LVxoYM8DunlTEHRgvNdzoKlQ7WASQfHhhJxWXwHqpoDHdGy8+S3dlLQrhl38/
	 0o4HXCx9MeNuPPOObGDj4hFfRORTpVhf8bLYkjiTwoKbSJSuhCL3/2jkR8GhuqQID5
	 VX/xhmWTvAlNwYUtWswI/ij5FKVKt7ADbeD9nFzZupC5RNROOcOGlqgwqExuc3ad3l
	 1x3YhLIQQw76MIKoVvc17QYWvZtRQ1kX6vvOg8tjkzHKYHyqjMS43qtP4sPqpFBYEz
	 2/Ci+FiD/VvFcpkBSOijf1Xt1/kn98tzhfhxNVRG4AOafoWw9dP9JKfpDV6ndYoXpq
	 qCbdH7LWCgvfA==
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
Subject: [PATCH 09/12] efi/libstub: Preserve the GNU property note
Date: Fri, 14 Aug 2026 21:45:26 -0700
Message-ID: <0445b20df50894615ada70abb1e6238f33c78a2e.1786768375.git.jpoimboe@kernel.org>
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

With "-z force-bti" the linker warns (or errors with CONFIG_WERROR) for
every libstub object:

  warning: BTI is required by -z force-bti, but this input object file lacks the necessary property note.

On arm64 the EFI stub is part of vmlinux, so its objects are annotated
as __init at the section level by running objcopy with
--prefix-alloc-sections=.init.  That has the side effect of renaming
.note.gnu.property to .init.note.gnu.property, which LLD ignores,
resulting in the BTI bit getting removed.

That's only a problem for toolchains which advertise the branch
protection features solely through .note.gnu.property.  GCC 16 and Clang
20 also record them in .ARM.attributes, which objcopy leaves alone, but
older compilers emit only the note.

Rename the section back to its original name so the linker sees it, and
so the generic NOTES macro can discard it.  objcopy applies
--rename-section before --prefix-alloc-sections regardless of their
order on the command line, so this needs a second objcopy invocation
rather than another flag on the existing one.

RISC-V and LoongArch apply the same .init prefix, so key the rename off
that rather than on arm64 alone.  Neither emits .note.gnu.property
today, and renaming a section which isn't present is a no-op, so this
changes nothing for them for now, but it prevents a future silent
failure mode.

The note is still stripped by --remove-section=.note.gnu.property, so
this change is inert until that section removal goes away in a
subsequent patch.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 drivers/firmware/efi/libstub/Makefile | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index 77a2b2d74f3f6..b1c95f69e807d 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -155,6 +155,12 @@ STUBCOPY_FLAGS-$(CONFIG_LOONGARCH)	+= --prefix-alloc-sections=.init \
 					   --prefix-symbols=__efistub_
 STUBCOPY_RELOC-$(CONFIG_LOONGARCH)	:= R_LARCH_MARK_LA
 
+# --prefix-alloc-sections=.init also renames .note.gnu.property, which the
+# linker then ignores, dropping the branch protection properties.  Rename it
+# back on any architecture which applies the prefix.
+STUBCOPY_RENAME-y = $(if $(findstring --prefix-alloc-sections,$(STUBCOPY_FLAGS-y)), \
+		      --rename-section .init.note.gnu.property=.note.gnu.property)
+
 $(obj)/%.stub.o: $(obj)/%.o FORCE
 	$(call if_changed,stubcopy)
 
@@ -171,4 +177,5 @@ quiet_cmd_stubcopy = STUBCPY $@
 		echo "$@: absolute symbol references not allowed in the EFI stub" >&2; \
 		/bin/false;						\
 	fi;								\
-	$(OBJCOPY) $(STUBCOPY_FLAGS-y) $< $@
+	$(OBJCOPY) $(STUBCOPY_FLAGS-y) $< $@				\
+	$(if $(STUBCOPY_RENAME-y),; $(OBJCOPY) $(STUBCOPY_RENAME-y) $@)
-- 
2.55.0


