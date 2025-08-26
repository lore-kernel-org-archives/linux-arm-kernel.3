Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC41CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 06:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0t+60eV41IKUZ9ezcmekgKTWqNgupDcJulsKXmUteXI=; b=gk9TBZLLnEHUpqgcnLKBJJLvOy
	TMhVa7UGhYlcFQyX7sFwcwMslddQ6dpnwAkdsS5hFEIL7eth3RK2QvN1zOBRfNO5o00gll6CwxQad
	RccjK6akJ4J06X9UOJWwM9Jbj6UKKxDwzVMTqfpnOPENxBZnxmL9tlbElnlAJHnAR9sSW1FT9hE+c
	KBtDaBHeSJhFGA3MvsaVlWKUgksGQS/T/gfen+GLf7mYm+m9t8TqvNDbG9qwQphlGHl+/48p0+b9/
	TQ1EB3/P90t5LahkdB5RzZvf4rwJjNZP4Lfar4VDyftQZQVsSI2wuymnIisF6uCisbd7r5gZmK0Zy
	LIzU9Lvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnOt-0000000Aji7-0nwf;
	Tue, 26 Aug 2025 06:43:23 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn0i-0000000AfDL-1b3k;
	Tue, 26 Aug 2025 06:18:27 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0t+60eV41IKUZ9ezcmekgKTWqNgupDcJulsKXmUteXI=;
	b=RgDlVbjO8jhuoPY4mfKuN7Slnu45ISnAWFOw/cSKuUrM166A5Xf4Erm/D2UDrSZRjb+TRd
	kgmua8gHOCLunG9wwz2DpSTBXdpmSEa71Lb0hP+HK5ysGZ4To/F9r9b4YwQ9GRjarwPVe9
	uS9AhT4Sz0+dbivk9lEzt4gd1nc4bK5HMZCjdAVtZW/0Fq3ATh+T7SGWw+DWsEEnez8l0S
	l+JOMfNCM36pb3xgaN/Xdoh5jXwrQ/yCb90R7Ig/RRuSEtYwhJZ6k4ETPQI7pdrgOQZwVs
	cqIUgd5QTF7ISENOyaqbvQpo+sHhZmxunt2tS6GEfzGIrgBnNf5Lv/0G9tlpGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0t+60eV41IKUZ9ezcmekgKTWqNgupDcJulsKXmUteXI=;
	b=8pcUg9DoAWVBxDLyXzgtGwnNadG0alezHP8Es7YoGFl4eRzHD98RNasRncD8HY+yHWoxjq
	+eUsVcLyCZNMQYCA==
Date: Tue, 26 Aug 2025 08:17:11 +0200
Subject: [PATCH 08/11] vdso: Drop kconfig GENERIC_COMPAT_VDSO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250826-vdso-cleanups-v1-8-d9b65750e49f@linutronix.de>
References: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
In-Reply-To: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nam Cao <namcao@linutronix.de>, 
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=1240;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=t5/9HDmyIs2t4g7FWEeD3BGuAZjUNxjgX5TY/5a0ZYE=;
 b=CNBKp7BJyz4ivh16tO14JDMhakvNZC/uzVXIEyWpElrKLVyg8TDExe/3LZIlXzjfpdnGKz/bi
 sJVuBe1Vf4yBKs8TudfOmPB/74FMQCcA5A/RjRFrYkYOWqYvHO0ISoL
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_231824_647443_92B9E843 
X-CRM114-Status: UNSURE (   7.50  )
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

This configuration is never used.

Remove it.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/Kconfig | 1 -
 lib/vdso/Kconfig   | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index e9bbfacc35a64d7ef1793a5d7f7ff8db138f2814..5c61b19ea9c80559ca3c4d1aa0732c6126494cb0 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1782,7 +1782,6 @@ config COMPAT_VDSO
 	bool "Enable vDSO for 32-bit applications"
 	depends on !CPU_BIG_ENDIAN
 	depends on (CC_IS_CLANG && LD_IS_LLD) || "$(CROSS_COMPILE_COMPAT)" != ""
-	select GENERIC_COMPAT_VDSO
 	default y
 	help
 	  Place in the process address space of 32-bit applications an
diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
index 76157c26931d28327750ad53bfcae5109a29d998..2594dd7185be762a4a94aa38ecec5db016776f85 100644
--- a/lib/vdso/Kconfig
+++ b/lib/vdso/Kconfig
@@ -12,11 +12,6 @@ config GENERIC_GETTIMEOFDAY
 	  Each architecture that enables this feature has to
 	  provide the fallback implementation.
 
-config GENERIC_COMPAT_VDSO
-	bool
-	help
-	  This config option enables the compat VDSO layer.
-
 config GENERIC_VDSO_TIME_NS
 	bool
 	help

-- 
2.50.1


