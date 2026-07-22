Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D98FC4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzzp3V1NULRIcEaysPzAb8Zz8VZI2+Qui09INH6ftAA=; b=209fZk4E12iKRwoiKmIH5YIE9R
	8MEIYPBOEBRPCurn6VI0Me2CGzUaVgyW16N5UshenM2tuHno/MPER3SSCvxvGxuZAbcAyVtqHFqCT
	VKNGJsPNpl4s2BH/0h12CFR/OmhklzQgpnAGF21aNOkN6bl5FnTr3Ot0mTp5An9hhqVA7qaShKywl
	KQUWf2domt1Z5RmS3g9RLRf/hgC8/M1uiKr8Mu/1PbGPbbTMSn6SPe24/T7M0Agz6yD51LBdL/ReS
	2I5iOb6ibYxIkdVghwZ5bDiXM7Z6k1L4i74UXPyURvh/oxEkE6Cbvw9KFZJZ5KJnqwcR/9vv41PJZ
	ui3fJ+ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRmR-0000000BAPF-3Orl;
	Wed, 22 Jul 2026 07:54:15 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRmI-0000000BAG8-1Qad;
	Wed, 22 Jul 2026 07:54:07 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784706842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mzzp3V1NULRIcEaysPzAb8Zz8VZI2+Qui09INH6ftAA=;
	b=g2nG1VUDQ/YUv3S36y8SYF59i0yIpbzHC7ftklC+i7zZBT4eRMNNaj6XZXXAW9jEQWQ3HP
	2cdvg7rvUZGSwtcbf8ALdRLh+E5e6hd1Jry04eR5AA3iX/E4vkVLlSDor8V/iD9Z5kDbZe
	VUEmayb5vsI7QWoACDw+VKXr8TiiDlFgWzvqLUcRzd1aupaguAl5r96GvX/KxOsWuMv214
	0bqbxO005d/74RRGnSnD1wdVDcEjNTDM/Vx5Qq3RuguVESO2AM2AWINyCx3jI43KO88mov
	8qDH5y32PKEnne3kVDAqhTdPAd1BPKK0en6fBJLdox9EZZb6kHi2gdUp2YziRw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784706842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mzzp3V1NULRIcEaysPzAb8Zz8VZI2+Qui09INH6ftAA=;
	b=UJwBHtI04+Zi6XonNItsTUX9pubhbs9SxZEPH19ZCNQxtzi5xqViipAMmyTlXS3NDzoMwK
	+C3Ikmn1UjQUBsCA==
Date: Wed, 22 Jul 2026 09:53:27 +0200
Subject: [PATCH v3 1/7] kbuild: support generated asm-headers in
 subdirectories
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260722-vdso-arch-clockmodes-v3-1-4c5753191cc4@linutronix.de>
References: <20260722-vdso-arch-clockmodes-v3-0-4c5753191cc4@linutronix.de>
In-Reply-To: <20260722-vdso-arch-clockmodes-v3-0-4c5753191cc4@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784706840; l=1604;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=KQ1WIDNBrUDk8ykSofgmkt90oehDLy0q9zMVnaVz/hY=;
 b=1x/MuKisB5TM072YN94rjvbdb2TJ42U6YURtDiybLXfdQydzkV2y2qPt60l1nojy0LO144bsz
 6pB5H5mktKLBKl9da755reHZVf17Fe9Y00BKndIGJY+Un+rxUelY4Sn
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_005406_521436_2BBF201B 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message.
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

Extend the asm-header stub generation to also handle subdirectories.
An upcoming vdso/ header refactoring requires this.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 scripts/Makefile.asm-headers | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/scripts/Makefile.asm-headers b/scripts/Makefile.asm-headers
index 8a4856e74180..772b53ffdeb4 100644
--- a/scripts/Makefile.asm-headers
+++ b/scripts/Makefile.asm-headers
@@ -48,14 +48,13 @@ syscall-y   := $(addprefix $(obj)/, $(syscall-y))
 generated-y := $(addprefix $(obj)/, $(generated-y))
 
 # Remove stale wrappers when the corresponding files are removed from generic-y
-old-headers := $(wildcard $(obj)/*.h)
+old-headers := $(shell test -d $(obj) && find $(obj) -name *.h)
 unwanted    := $(filter-out $(generic-y) $(generated-y) $(syscall-y),$(old-headers))
 
-quiet_cmd_wrap = WRAP    $@
-      cmd_wrap = echo "\#include <asm-generic/$*.h>" > $@
+filechk_wrap = echo "\#include <asm-generic/$*.h>"
 
 quiet_cmd_remove = REMOVE  $(unwanted)
-      cmd_remove = rm -f $(unwanted)
+      cmd_remove = rm -f $(unwanted); find $(obj) -type -d -empty -delete
 
 quiet_cmd_syshdr = SYSHDR  $@
       cmd_syshdr = $(CONFIG_SHELL) $(syshdr) \
@@ -74,8 +73,8 @@ all: $(generic-y) $(syscall-y)
 	$(if $(unwanted),$(call cmd,remove))
 	@:
 
-$(obj)/%.h: $(srctree)/$(generic)/%.h
-	$(call cmd,wrap)
+$(obj)/%.h: $(srctree)/$(generic)/%.h FORCE
+	$(call filechk,wrap)
 
 $(obj)/unistd_%.h: $(syscalltbl) $(syshdr) FORCE
 	$(call if_changed,syshdr)

-- 
2.55.0


