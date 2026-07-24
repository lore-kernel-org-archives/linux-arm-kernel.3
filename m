Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01D6C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 13:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k84lHI02AeLCB93IudPhY7UADh7YGZV8FCgpA+ZF7P0=; b=aKVbBl1NcgnLoOmqmnMame+69d
	h5Xjay4/EzTHsvj+hu4DOeyr03lk9BwAVSeBhjL9kjuK/tyKTkTDgyuPq9NQBOg70AwvPBbBjvsWX
	RBa0+4mIRBB8aJcle3+t1r0UECm3AperwKu+1MP2HqogIy4+02WadmnxxkMhfds3egGSxsDMLqagS
	/hC/gZ2LfngCWMcsVPAqdtkti9XG1sNOrlD3VB1CgtQUDJKCpj2wIdr8N4udMMef6YT+Ih/3DPwAV
	mFGwLgaXM8A3w7QzTs7k0xM1ngYGVwT+V86QOERVKyApUtJIPoyfgaubJm8byx6IlsHGNhNHLse3c
	SRy1ZvHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG6S-0000000GUIp-07o3;
	Fri, 24 Jul 2026 13:38:16 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG6P-0000000GUGV-1E0b;
	Fri, 24 Jul 2026 13:38:14 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784900288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k84lHI02AeLCB93IudPhY7UADh7YGZV8FCgpA+ZF7P0=;
	b=BrLLO1tjYhSGwyDAWasIuyNQDXJsuyGklSui5fMZONsKkP1m5sXLh5TEhyFkEwKd5+m3y2
	fzQAc+LlO7nGtNN0ss6VDCzqr3zg0hJjr2Pb7w/keysNILWib9LWJ+eidE8UnlW9VpDnX1
	Qlo7ri+aLG1aKgl6IngIkvzrqz5IFXwm2KRokPKWktQh8+PtJvPs9uzn9+YtK/0Ft/hZpU
	WfOxgGgAxQ1IT4euvdi9YJl9dB4bTtaD/+Z0FkT8cWxd5I2pKlHu1+YsXYRViVO0av0TZI
	P7XUKIxnKoTfjDHLRTJqeanyw4JJw9dunvC8WU2/02aGdPKYQwDeBBCuaV/3nw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784900288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k84lHI02AeLCB93IudPhY7UADh7YGZV8FCgpA+ZF7P0=;
	b=F1iGaQnCRfR4UqHuVk9ZmdTRJMF80i+Fz/zJGdx/+NAq/m/Y/2SFARDiSyIpBG4x5Ncxup
	Uxil6gsiEIbWfyDA==
Date: Fri, 24 Jul 2026 15:36:18 +0200
Subject: [PATCH v4 1/7] kbuild: support generated asm-headers in
 subdirectories
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260724-vdso-arch-clockmodes-v4-1-ddbe447be860@linutronix.de>
References: <20260724-vdso-arch-clockmodes-v4-0-ddbe447be860@linutronix.de>
In-Reply-To: <20260724-vdso-arch-clockmodes-v4-0-ddbe447be860@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784900286; l=1603;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Zev+SfOmyEH9fuyzl0FmsV9VVq9RYb3UzolE/5lna3k=;
 b=7LSqC528B3expK5DAr0ccLIPXQLZl0CZ+lRD0g98zRXGLp+iYu3EIKcskmML7CJrbWN3Eagwj
 y/hRMY88MKYAQn0vWRro12snAVO4gtR1Q/2LpUB8ZTb256tJSvFdE/x
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_063813_499818_C9274C1A 
X-CRM114-Status: UNSURE (   7.68  )
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
index 8a4856e74180..b38931314ad7 100644
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
+      cmd_remove = rm -f $(unwanted); find $(obj) -type d -empty -delete
 
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


