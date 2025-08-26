Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8161FCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 06:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8Qx8zdXwUDEN+QDzIjybGTquRbhLyER4hmo5HtXCS3M=; b=M7QL0ugQsWVC3/
	QtHFbNj28v6X+3QiQ13DpJiOvV2Y1QMoLeICLu2j7k8sTRfhGuStxhZdg48s0u9kruvRzTbSDMA1E
	q4BB6L9xdNNzHSKxVmEjl5hEo32ptfHhDvmf54tOhRRtoWxCsPJkcKyCgEcvguIqNN1YrViaX3dYW
	oc1ArCYKYKjAkU2VDvPds82Zf/i6O4N1rsmKGknmQhpx+68/0xh+FetTWo7kZzQYIoCJ7MoIYCSLH
	AzZ1y1qizO9IWxZ0xWhQjR3VTxOc1sheuF2r3wTMqeyZu5RfQlZaNkpH8eUdnzVL72IFW5utUCpPZ
	/2TIzd1lE4BOu0/N6BZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn3R-0000000Ag4T-00Qn;
	Tue, 26 Aug 2025 06:21:13 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn0e-0000000Af9L-1QqQ;
	Tue, 26 Aug 2025 06:18:21 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8Qx8zdXwUDEN+QDzIjybGTquRbhLyER4hmo5HtXCS3M=;
	b=EoHq8It+802uE8/W/ZgT+WU1MhU30ljvVJg6J8CsR2XdSCY1W8iKO/0yhuhlIWg93gjtVN
	yjsiguKOCe8MXqL7t5b5NeIYigkWxr9EZY2Mkn3x2W0dIf65A5h/s69Jx20ZLL24VmAnXl
	wWm91dlrX8UnePleqQexNGzu9SWDwlcPXJ8DztYUIGGk65aJetDl/MNeXhull8xcLDd2T/
	Xdhztn1zm0BL6qd7sdPVV8txFwrP1lt98FW2I+LmBrQOqG2Iv+EpggKyKaF35t2W+WDCO2
	x4LqgXrpkfrN62Egk6oQBRYWy9iOgErie977mytBr36Yc1c7jJeu3fV2/Qh79g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8Qx8zdXwUDEN+QDzIjybGTquRbhLyER4hmo5HtXCS3M=;
	b=eX2IPWAG+DvooY6YzvBNYPIk4d7JwL6SQGjcVcR/3nVRkZUD/9wZEdubuxvUX29zgYJ6tr
	+6ncwJ9ZGLDV8KDQ==
Subject: [PATCH 00/11] vdso: Various cleanups
Date: Tue, 26 Aug 2025 08:17:03 +0200
Message-Id: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAF9RrWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyNT3bKU4nzd5JzUxLzSgmLdtBSztKQkY6O0ZENLJaCegqLUtMwKsHn
 RsbW1AHxpxT5fAAAA
X-Change-ID: 20250825-vdso-cleanups-fd6fbb32fc19
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=3008;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=OKdbTtNFiNAfKDCNOTVL/ZRLmxAuqZzdXzmwBIqDanM=;
 b=xXLb28HhyOp2V5PAl7NV8Ih+DLTz+T0EwU3m8mTK7t+YdB+1/WbVwG3q2LXi/d5YbmXMM3lwS
 UE/A4xDXG50Ay40TUaB+Dz47MZKMYqchu5q89DYuvoo2r9Z3sDlnSRd
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_231820_523672_E54F54B5 
X-CRM114-Status: UNSURE (   9.31  )
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

Various cleanups to the generic vDSO infrastructure and a patch for ARM
which was never applied.

This series has one trivial syntactic conflict with "dso/datastore: Allow
prefaulting by mlockall()" [0] and a semantic one with "sparc64: vdso:
Switch to generic vDSO library" [1], which still uses the removed
GENERIC_VDSO_DATA_STORE.

[0] https://lore.kernel.org/lkml/20250812-vdso-mlockall-v1-0-2f49ba7cf819@linutronix.de/
[1] https://lore.kernel.org/lkml/20250815-vdso-sparc64-generic-2-v2-0-b5ff80672347@linutronix.de/

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Rasmus Villemoes (1):
      ARM: VDSO: remove cntvct_ok global variable

Thomas Weißschuh (10):
      vdso/datastore: Gate time data behind CONFIG_GENERIC_GETTIMEOFDAY
      vdso: Move ENABLE_COMPAT_VDSO from core to arm64
      vdso/gettimeofday: Remove !CONFIG_TIME_NS stubs
      time: Build generic update_vsyscall() only with generic time vDSO
      riscv: vdso: Untangle kconfig logic
      vdso: Drop kconfig GENERIC_VDSO_32
      vdso: Drop kconfig GENERIC_COMPAT_VDSO
      vdso: Drop kconfig GENERIC_VDSO_DATA_STORE
      vdso: Drop kconfig GENERIC_VDSO_TIME_NS
      vdso: Gate VDSO_GETRANDOM behind HAVE_GENERIC_VDSO

 arch/Kconfig                                      |  2 +-
 arch/arm/include/asm/vdso/vsyscall.h              |  2 --
 arch/arm/kernel/vdso.c                            | 10 +++------
 arch/arm/mm/Kconfig                               |  2 --
 arch/arm64/Kconfig                                |  3 ---
 arch/arm64/include/asm/vdso/compat_barrier.h      |  7 +++---
 arch/arm64/include/asm/vdso/compat_gettimeofday.h |  6 ++---
 arch/arm64/include/asm/vdso/gettimeofday.h        |  8 +++++++
 arch/arm64/kernel/vdso32/Makefile                 |  1 -
 arch/loongarch/Kconfig                            |  2 --
 arch/mips/Kconfig                                 |  1 -
 arch/powerpc/Kconfig                              |  2 --
 arch/riscv/Kconfig                                | 12 +++++-----
 arch/s390/Kconfig                                 |  2 --
 arch/x86/Kconfig                                  |  3 ---
 include/asm-generic/vdso/vsyscall.h               |  4 ----
 include/vdso/datapage.h                           |  9 +-------
 init/Kconfig                                      |  2 +-
 kernel/time/Makefile                              |  2 +-
 lib/vdso/Kconfig                                  | 25 +--------------------
 lib/vdso/Makefile                                 |  2 +-
 lib/vdso/datastore.c                              |  6 ++---
 lib/vdso/gettimeofday.c                           | 27 -----------------------
 tools/testing/selftests/pidfd/config              |  1 -
 24 files changed, 31 insertions(+), 110 deletions(-)
---
base-commit: 3cd1f6bc6aa056cfd32946f9ce0aa3eb3db180e8
change-id: 20250825-vdso-cleanups-fd6fbb32fc19

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


