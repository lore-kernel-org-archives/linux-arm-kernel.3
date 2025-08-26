Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82144CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 06:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUyzbl96JnTO9V3eNt5MssqL9K7R8ZPYrzwmUDypjtQ=; b=h+NSsPJQwa+z1839KUt/c6Tgtw
	EQsa/fmEdVwlyd/vrdjJu10BSgIiLjMyI9UCg4Um3pyGLJZC2g7NqwcAj3qr+0lrOaNsUplN6Cdhk
	uyXc6rePr9dHvv1hnATrP6Ho/0t5vnuJwq3V24pQMCUHlabToFNbmlQW4p2UOHHnAVkVSkCs1/waF
	zQB/4O5VLDboE5ZrVFx70uUZ9ScdOv3vgghF0oFiJR1z2jxOrAeK+XyxnA9kOT3CcCAS7KXvX9MjK
	L8QX8yIM9IQFv/MEYF2tDOaYTXnjPl1JXa5xT5/achMN4cP/6jU4owW9iX4AftEq9BvNWIjzgN/kI
	0LLzCAPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnWr-0000000AkwH-0SIR;
	Tue, 26 Aug 2025 06:51:37 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn0m-0000000AfI7-0om0;
	Tue, 26 Aug 2025 06:18:31 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aUyzbl96JnTO9V3eNt5MssqL9K7R8ZPYrzwmUDypjtQ=;
	b=qff84UmwLm8iFQvqm09Om+iEel23vC9BJ1wHMhpnGuRjjiVtocG2gJc/efnzy7UGv0bqDh
	X4YctMH0aSIUxDd3i6X4JoDQFU5IM3b5mriVj4iiUX/4ke9TsrEXJU+QjgXN9L2Hvg/r1e
	gVrERdEyqsHFDbRTatoD2jUbrkzofjIHreOcsZGCDEtvBgy1C9OjuykTbsIoRwvmsiEo67
	TT3uKBDVEPfUk1K7JbyuNP89aqNk5szSg7Q98Esgpnao8uytgt5ztulcsAYjKovknEd1Gv
	DdfAb+Xqa/DsFSf6/Qptu/gAQ+92+1NXjLnQVTycTHPHpfQqUdNFtsZzBM1PEQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aUyzbl96JnTO9V3eNt5MssqL9K7R8ZPYrzwmUDypjtQ=;
	b=faCkWxdjd3FeEyW+rea8Q+WUcDNk36hjcPMaS1Mmo0pdEShLBn6gpn0pA+neXsTYaNOZIy
	GVnfWQSajoT7S0Ag==
Date: Tue, 26 Aug 2025 08:17:14 +0200
Subject: [PATCH 11/11] vdso: Gate VDSO_GETRANDOM behind HAVE_GENERIC_VDSO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250826-vdso-cleanups-v1-11-d9b65750e49f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=740;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=e70kJzk3rr3WiO6RHhXGvE8arznJOv7er7zNzG1lBZY=;
 b=Q6ersM0eWZuFWFRqw7St9QnfIHgjvUfXPslz3bmlle7dR6R1Tm8FlCD46/a/HTAHi+acl41TM
 HHiIuT3vNAnDyILoXrbvH+hSpTHjerUzqwG/UiWNkrt8K08Oly20NA4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_231828_408690_93E1010F 
X-CRM114-Status: UNSURE (   8.62  )
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

All architectures which want to implement getrandom() in the vDSO need to
use the generic vDSO library.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
index 3d2c2b90d193f984e3a202e701fa7f0bfa8f1938..db87ba34ef1928fac0d5c58abca86312687cc159 100644
--- a/lib/vdso/Kconfig
+++ b/lib/vdso/Kconfig
@@ -19,9 +19,9 @@ config GENERIC_VDSO_OVERFLOW_PROTECT
 	  time getter functions for the price of an extra conditional
 	  in the hotpath.
 
-endif
-
 config VDSO_GETRANDOM
 	bool
 	help
 	  Selected by architectures that support vDSO getrandom().
+
+endif

-- 
2.50.1


