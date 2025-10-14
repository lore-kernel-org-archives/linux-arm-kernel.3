Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92FACCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 06:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKFAR6pTteHeDNIXFD4VW70Ndlry08cGog9KlECLSuA=; b=DSG+V2raF/VZ08hGboxPDSn+Kh
	86vKY4F6KOoHvgSd9jFLF4RPJ+qip7iRkrBQ4ZWXWTA1q6h55aN2+nLwd6gSsJQZmhSVc+KhDFFlA
	TXB/72c2/SitiAdo6y8qMVEPPUBc0BvcQiMi72wss3e4DqYYMJ+ahCfiidPO8qIjBQLYQxR3h3xie
	fa9dUADTlmAh2eEnRhzD2XLCklWRvonf+RCSnPmYOH9iZC/umKRTiJ16IhhV3cFN+43NN4YeKkNnP
	c4Yd/+Z+6JR/sbmf8g4bP7r5igzssVzerS+2pNBtQS9/5jj+L8CPZaQ0h4F3MQLoXzapdELt4OMZz
	PjWfnBIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8YqT-0000000FJXk-2Az0;
	Tue, 14 Oct 2025 06:49:17 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8YqP-0000000FJSl-0wXP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 06:49:14 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760424550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OKFAR6pTteHeDNIXFD4VW70Ndlry08cGog9KlECLSuA=;
	b=aVyOhzFXfn/6Sklao9CQTvk+ikFPSP4E5e/x6X5/aBK51XERII6rwWaFWRIesuf/7Ibp3c
	62Tw9JYip6pMrX0T3+URNjJGAaQBYlfmFq5pv51B2dPnOkfVxHORFeAC/e+EYmtNHlwDsr
	Sz2uirxiPJjjbaJsUKltc2Xc4W+kfvXKE15yEPbPp0Oa9lyQfH8DiHM/zWIjJg3WvtK1h7
	g+reIaFCIYAktmc8/yQ3aJyGTfOB44Z4nCNEsCCvD+EsOrOFptllWOJ82C0Ag0+5nQTGkn
	u52+hbuCIjZhi2xP5c/9Nbv9b3DxAMICkbq92UtL4FmdSgpuDVvcXV78yzPhWg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760424550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OKFAR6pTteHeDNIXFD4VW70Ndlry08cGog9KlECLSuA=;
	b=93A0PupjU1m7nesioE1Tos0VwbAOr8oarXvpNc0kvfhHfw8TFUheof84DChW+FjWzqxT5a
	/bxDRXuuXaEXQ+AA==
Date: Tue, 14 Oct 2025 08:48:53 +0200
Subject: [PATCH v4 07/35] powerpc/vdso: Explicitly include asm/cputable.h
 and asm/feature-fixups.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-vdso-sparc64-generic-2-v4-7-e0607bf49dea@linutronix.de>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
In-Reply-To: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, 
 Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760424546; l=1151;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=gCxoA74I68jSl8hq9TPM97UMjmPrbJiPbnyKM8TAfkA=;
 b=ErSbWsbptiRFVQ2OuvWgIME8FbDtQqeR4bNDjcvIjX2tlqGeRUrUzaTyzk7W7+t5o6pzk/8s6
 bo01/vvS+uqAaz+1E3Td/IRTqKtYfwcyvWspCGwnull2AOGyPml55aO
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_234913_434986_ECA7CA77 
X-CRM114-Status: UNSURE (   8.77  )
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

The usage of ASM_FTR_IFCLR(CPU_TR_ARCH_31) requires asm/cputable.h and
asm/feature-fixups.h. Currently these headers are included transitively,
but that transitive inclusion is about to go away.

Explicitly include the headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 arch/powerpc/include/asm/vdso/processor.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/include/asm/vdso/processor.h b/arch/powerpc/include/asm/vdso/processor.h
index c1f3d7aaf3ee970699fa73731412137631da347b..4c6802c3a58083efc01b4759dbdaa3612903df6a 100644
--- a/arch/powerpc/include/asm/vdso/processor.h
+++ b/arch/powerpc/include/asm/vdso/processor.h
@@ -4,6 +4,9 @@
 
 #ifndef __ASSEMBLER__
 
+#include <asm/cputable.h>
+#include <asm/feature-fixups.h>
+
 /* Macros for adjusting thread priority (hardware multi-threading) */
 #ifdef CONFIG_PPC64
 #define HMT_very_low()		asm volatile("or 31, 31, 31	# very low priority")

-- 
2.51.0


