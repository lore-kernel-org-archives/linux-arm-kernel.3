Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3405D31A16
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 07:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5s1E1yisqHJGGPTpys4I/1xezHpPYE2+zak8zKkm6YU=; b=GjTc+9/9CuLGHnh8MxeRLMBSgp
	gYWaPmL4BjdcoVlfifPddP6pa9YHOZ5gwHz03+NzvRZa9nyXsA4EQAp4PbMwmw8GJcAeYsFNDy2Oy
	fEBg73MxFotfdkn7vlptkGzPx2U6ro3UgnEZeiDdU8Zbeb7j4tmN5U6Ec35WY8EttPD9+xceVhwEP
	02zyHtij8CjpTHB7eq3lmcAtAcRoVP967y3x/xfKTLN95DDueEHUJBiqiJCasB7oVlmY+U8ESTt2i
	y1gLMLDqIw+fRoXa5Xs3RSlXlOmVobfLxsVrqXm/ANMRRS/m4iBQcxT93r4SBzcy6n96GTEySsya2
	JtEAd4eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvIq-00000008CEb-3jI3;
	Wed, 14 Jan 2026 07:28:28 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvIn-00000008CBR-28TD;
	Wed, 14 Jan 2026 07:28:27 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768375702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5s1E1yisqHJGGPTpys4I/1xezHpPYE2+zak8zKkm6YU=;
	b=4BbFAtdVbeRT7QbtXdm7bwd1qzzQzz3pXAwe++yn8h4N2z4yqZt7qIQUhAXU3dEJ7k2RqK
	rspzaRRTZEym0P4RUrwgcVmf9CncxjaxxHLHcuELoqDOdB3mhqMJpELLzpGOj/9VuMV0Ug
	a1sedRk8JNqjLqtaCzo4f2Ef6XTLvPOlsuP9Mec/+tabPFfbtMdDJJMADHB6Ew8JbYCkAN
	D3B3jbi/QIxjxDYzXOSLBtg7Fm4zVlwRQMkx2m5tAkJsyH8H9XaBWSUl1oTfiO4R2W4jFo
	pta9lRZETVcj69i9hI4nCuwwZA0pO8sKd6Kiu+vO0skOgOKUONscMrobzrtIFw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768375702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5s1E1yisqHJGGPTpys4I/1xezHpPYE2+zak8zKkm6YU=;
	b=bW0A42SfLtA7Amv19PyrViAn0Ddkpow0ImosXbhiOzuhGrK32qVLu8dHt4vjabxoNOyQpn
	w/fXAZilw5myHUAA==
Date: Wed, 14 Jan 2026 08:28:14 +0100
Subject: [PATCH v3 2/5] ARM: uapi: Drop PSR_ENDSTATE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-headers_install-config-leak-v3-2-c14cde735a79@linutronix.de>
References: <20260114-headers_install-config-leak-v3-0-c14cde735a79@linutronix.de>
In-Reply-To: <20260114-headers_install-config-leak-v3-0-c14cde735a79@linutronix.de>
To: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768375700; l=2940;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=fz1o/QC//id3SLCiEx9I+QB/CLj6vfH/ATM2HwtC2M4=;
 b=J8tj378LP5E6jN1LFUC1whqX29eQyRdeMxXOv8p2BckKLdfyfbJlXwKzRNYpu2PNBehdXAHwT
 PVdkbcvuBfFDzjLqp9UWLeUVPJttaCMJqqXnO2o4ztQre80S5Ba3IMF
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_232825_683031_706292EF 
X-CRM114-Status: GOOD (  12.51  )
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

The symbol PSR_ENDSTATE is pointless for userspace. Drop it from the
UAPI headers and instead inline it into the only two callers.

As as side-effect, remove a leak of an internal kconfig symbol through
the UAPI headers.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/lkml/d2ad12f2-3d65-4bef-890c-65d78a33d790@app.fastmail.com/
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/include/asm/processor.h   | 3 ++-
 arch/arm/include/uapi/asm/ptrace.h | 9 ---------
 arch/arm/kernel/signal.c           | 3 ++-
 scripts/headers_install.sh         | 1 -
 4 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/arm/include/asm/processor.h b/arch/arm/include/asm/processor.h
index 326864f79d18..bba83228bc22 100644
--- a/arch/arm/include/asm/processor.h
+++ b/arch/arm/include/asm/processor.h
@@ -73,7 +73,8 @@ static inline void arch_thread_struct_whitelist(unsigned long *offset,
 		regs->ARM_cpsr = USR26_MODE;				\
 	if (elf_hwcap & HWCAP_THUMB && pc & 1)				\
 		regs->ARM_cpsr |= PSR_T_BIT;				\
-	regs->ARM_cpsr |= PSR_ENDSTATE;					\
+	if (IS_ENABLED(CONFIG_CPU_ENDIAN_BE8))				\
+		regs->ARM_cpsr |= PSR_E_BIT;				\
 	regs->ARM_pc = pc & ~1;		/* pc */			\
 	regs->ARM_sp = sp;		/* sp */			\
 })
diff --git a/arch/arm/include/uapi/asm/ptrace.h b/arch/arm/include/uapi/asm/ptrace.h
index 8896c23ccba7..2ef917957005 100644
--- a/arch/arm/include/uapi/asm/ptrace.h
+++ b/arch/arm/include/uapi/asm/ptrace.h
@@ -102,15 +102,6 @@
 #define PSR_IT_MASK	0x0600fc00	/* If-Then execution state mask */
 #define PSR_ENDIAN_MASK	0x00000200	/* Endianness state mask */
 
-/*
- * Default endianness state
- */
-#ifdef CONFIG_CPU_ENDIAN_BE8
-#define PSR_ENDSTATE	PSR_E_BIT
-#else
-#define PSR_ENDSTATE	0
-#endif
-
 /* 
  * These are 'magic' values for PTRACE_PEEKUSR that return info about where a
  * process is located in memory.
diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index 79a6730fa0eb..7be9188d83d9 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -337,7 +337,8 @@ setup_return(struct pt_regs *regs, struct ksignal *ksig,
 			return 1;
 	}
 
-	cpsr |= PSR_ENDSTATE;
+	if (IS_ENABLED(CONFIG_CPU_ENDIAN_BE8))
+		cpsr |= PSR_E_BIT;
 
 	/*
 	 * Maybe we need to deliver a 32-bit signal to a 26-bit task.
diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index 727f7f82c2c7..4f03521f4026 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -70,7 +70,6 @@ configs=$(sed -e '
 #
 # The format is <file-name>:<CONFIG-option> in each line.
 config_leak_ignores="
-arch/arm/include/uapi/asm/ptrace.h:CONFIG_CPU_ENDIAN_BE8
 arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_NO
 arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_SUPPORT
 arch/x86/include/uapi/asm/auxvec.h:CONFIG_IA32_EMULATION

-- 
2.52.0


