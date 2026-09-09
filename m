Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1D8C79FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8jERIZlzOiJ0igHK630ldoZDDzGvj3UyoNSXBhnm0Q=; b=QA7WV/aic80bq+vEtY7ncASinz
	B6G/5iDpV8Md/TPE9GB1i7HHkOOf9O2KGS8/RwvhjfplsPledy8+r56cTc9wLuTbxtDU9HYS/gBIM
	r5BArACUox6IpvurLwA8H1HbXvbdUgty2HlYy4B3skl3BWeQMJlk0PDdz0uMkGpQ4+qF3Cz+Q8C7M
	I0yoTAou2sqt96wGRD+QDN0qQv3jRjizEDxTvrAxtW21pk0LMeWn1DNgaC4Fic5H+BigI7u5ADMT6
	i4KwTkK1OrcAW3FE6/D/e1hoZCtwvl/LWu/1FiIEDJA6ZdSvmjZWgDH+JZCH/kblp8igAawLUjH7v
	3SYIxtDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E26-0000000BAjG-0ukO;
	Wed, 09 Sep 2026 08:51:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1l-0000000BAG3-2nbu;
	Wed, 09 Sep 2026 08:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=C8jERIZlzOiJ0igHK630ldoZDDzGvj3UyoNSXBhnm0Q=; b=F2S+YLPcQrkOY4md5JrFVEDtoL
	J7s/TSXOCWkI0/l+Va1kk8wTXJSbmkRReP5tk2fRz7q1bfx7oHzl8RW00Ky3pdxVQ2vviL3oPe/Kc
	2LIp6URPmDFCeGAvsa5tUCpBOUiD1zuh9deGOTXr5yAmhw0KsnnQqs0I+U3yjt9VFBjA8dI38yOCj
	t7JknNOLTYG4zFEXnI2TnNnI5fDAi0F/i1SNsVbTarOriFaqxE/EviT9gQb6a8/tp+Z4F/Vyw2X5L
	IWGz36DwgzqlYhWw8ZKjDPHwxwX7pu+1pbFAzhHo6ycFMuH4+oEd0ZgTPI6IYgfSjixI+3rjLGZff
	IX42PcLg==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4E1i-00000000wIn-0Xao;
	Wed, 09 Sep 2026 08:51:32 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C8jERIZlzOiJ0igHK630ldoZDDzGvj3UyoNSXBhnm0Q=;
	b=YV80N30gtg3Qo0+Nn5ZL14Uc4rxWQ913cXwBr24SAORpArv0rT4pLXYRBZmiU1XhVedhtm
	3gyANW09zc0AnJxdyhKpTxL570GrkaDpIprXpjRMCB0Q+lNtZiaZm58ZlxVzDicKRvrGpi
	w4/0MiHGowiYFT4LIjDgcSG2s9Rx8D2xwYHKUyVfl6NjAepsAWVAkrsjsiJ42saGd6Xbh9
	yfPekIScgoESbt7to4o0Y8ZggYTV62CbRHIJ2AJl/mS+ulCdUu7WTvsp4tsyim+fNDyfJy
	xlknZiyieERW87XvXKMAzRCm5R0mZ3L/DYRFqdklDPcVzg0WpkAa41ZQaCp3MA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C8jERIZlzOiJ0igHK630ldoZDDzGvj3UyoNSXBhnm0Q=;
	b=WnZhgM4C9TDIR2uFp2TfzuCBG6oPaXdRjbuiKfGJaM4UpnOVhuqvMp9qkQ5jtb3aWa2zG+
	xJdxOHztclSdoICA==
Date: Wed, 09 Sep 2026 10:51:26 +0200
Subject: [PATCH 13/15] vdso: Remove unnecessary vdso/vsyscall.h includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-13-63ae856cc659@linutronix.de>
References: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
In-Reply-To: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=3977;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=gna+NxAbuHUiPh7UeY3iJvOkIMhHRrEMbf8sWoWLNzc=;
 b=ytf6AJeQ2RRzfTAaVL5jTvw60PTKQTaUNnPB+n+rtyAnSCDKsJxnzPm4sW6CzyPlgy4A/4sb6
 frGknUkvvrgA53jsfF8DIulc1yisK5Evm8qLbONPtD1QywylGQrPYC4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_095130_429696_01D5881B 
X-CRM114-Status: UNSURE (   7.46  )
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

None of these files uses anything from the header.

Remove the inclusion.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/kernel/vdso.c          | 1 -
 arch/arm64/kernel/vdso.c        | 1 -
 arch/loongarch/kernel/vdso.c    | 1 -
 arch/mips/kernel/vdso.c         | 1 -
 arch/riscv/kernel/sys_hwprobe.c | 1 -
 arch/riscv/kernel/vdso.c        | 1 -
 arch/s390/kernel/time.c         | 1 -
 lib/vdso/getrandom.c            | 3 ---
 lib/vdso/gettimeofday.c         | 3 ---
 9 files changed, 13 deletions(-)

diff --git a/arch/arm/kernel/vdso.c b/arch/arm/kernel/vdso.c
index e306d0c5a21c..7be871f5eb9e 100644
--- a/arch/arm/kernel/vdso.c
+++ b/arch/arm/kernel/vdso.c
@@ -23,7 +23,6 @@
 #include <asm/vdso.h>
 #include <clocksource/arm_arch_timer.h>
 #include <vdso/helpers.h>
-#include <vdso/vsyscall.h>
 
 #define MAX_SYMNAME	64
 
diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
index 592dd8668de4..50596dab23f9 100644
--- a/arch/arm64/kernel/vdso.c
+++ b/arch/arm64/kernel/vdso.c
@@ -22,7 +22,6 @@
 #include <linux/vmalloc.h>
 #include <vdso/datapage.h>
 #include <vdso/helpers.h>
-#include <vdso/vsyscall.h>
 
 #include <asm/cacheflush.h>
 #include <asm/signal32.h>
diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
index 8ce8159c10b9..1edc8fb720de 100644
--- a/arch/loongarch/kernel/vdso.c
+++ b/arch/loongarch/kernel/vdso.c
@@ -20,7 +20,6 @@
 #include <asm/vdso.h>
 #include <asm/vdso/vdso.h>
 #include <vdso/helpers.h>
-#include <vdso/vsyscall.h>
 #include <vdso/datapage.h>
 #include <generated/vdso-offsets.h>
 
diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index 8165dd3fc1f8..8eb1760a8a9b 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -23,7 +23,6 @@
 #include <asm/vdso.h>
 #include <asm/vdso/vdso.h>
 #include <vdso/helpers.h>
-#include <vdso/vsyscall.h>
 
 static_assert(VDSO_NR_PAGES == __VDSO_PAGES);
 
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 0f42101ad935..e1ad8671137d 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -19,7 +19,6 @@
 #include <asm/vendor_extensions/sifive_hwprobe.h>
 #include <asm/vendor_extensions/thead_hwprobe.h>
 #include <vdso/datapage.h>
-#include <vdso/vsyscall.h>
 
 
 #define EXT_KEY(isa_arg, ext, pv, missing)					\
diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
index 9c2f5e442338..5666cec180ac 100644
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@ -15,7 +15,6 @@
 #include <asm/vdso.h>
 #include <linux/vdso_datastore.h>
 #include <vdso/datapage.h>
-#include <vdso/vsyscall.h>
 
 #define VVAR_SIZE  (VDSO_NR_PAGES << PAGE_SHIFT)
 
diff --git a/arch/s390/kernel/time.c b/arch/s390/kernel/time.c
index 161628f6906f..bca65bf1c8cb 100644
--- a/arch/s390/kernel/time.c
+++ b/arch/s390/kernel/time.c
@@ -40,7 +40,6 @@
 #include <linux/kprobes.h>
 #include <linux/uaccess.h>
 #include <linux/vdso_time.h>
-#include <vdso/vsyscall.h>
 #include <vdso/clocksource.h>
 #include <vdso/helpers.h>
 #include <asm/facility.h>
diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
index 6ff46549281c..e0fa10bbefc9 100644
--- a/lib/vdso/getrandom.c
+++ b/lib/vdso/getrandom.c
@@ -16,9 +16,6 @@
 #include <uapi/linux/mman.h>
 #include <uapi/linux/random.h>
 
-/* Bring in default accessors */
-#include <vdso/vsyscall.h>
-
 #ifndef __arch_get_vdso_u_rng_data
 static __always_inline const struct vdso_rng_data *__arch_get_vdso_u_rng_data(void)
 {
diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index b867c2301d5c..728fed1ae52f 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -27,9 +27,6 @@
 
 #include <linux/build_bug.h>
 
-/* Bring in default accessors */
-#include <vdso/vsyscall.h>
-
 #ifndef vdso_calc_ns
 
 #ifdef VDSO_DELTA_NOMASK

-- 
2.55.0


