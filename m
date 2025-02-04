Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01ED5C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 12:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSEVppF1Gm5ziuJXFG5LipW5KkS+Ijk0fNLsSAQPJ5g=; b=gcc7xuHSCZcu0WGMpk95HAdfbG
	ahfmcuirKWM0zZ4Lq9qFc4ABMUBrBRPRCP3wjBTISd77KKjNcXE8jIkLlAWzSFR2/YQ7ErbFq3Ndq
	24IPfCIoUDyTyL5poSo5j4gZD4BXfn9iOyOJV/yeHewFb/AOFRuRnxsKXuNNqAp6R0BQNI8o3buYD
	oyJ8bR5UxyrVhS2xuYp5TB7dplEl67m/L247gkBlhg0lNKe3bto6LbVt7G6Pz3PJsU6WNYsKpQJw9
	0CC/VAOo3uYwffmq96VXr81BJjYalRtUcWq9p/mQ5PLKOH+0gXJx3Juio2X4vzmUm3zp9ujGuQvan
	VchRpmdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHmW-00000000NAB-0Xp7;
	Tue, 04 Feb 2025 12:11:56 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHgw-00000000LIb-2vea;
	Tue, 04 Feb 2025 12:06:12 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738670766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KSEVppF1Gm5ziuJXFG5LipW5KkS+Ijk0fNLsSAQPJ5g=;
	b=WiuoD27YfIQhPqB14TKpjh3d0uax6gm8KDhTfiHXxzubBBdt3+udpSqmL6iRTicw2XQsu8
	htflKclSVldYQn5R451ZyiiixrQPdiwu8iPsBflyVVESVRE02JJaoFKGoQi7WJkRs95PvI
	oMYu0WEW2jmflonLCLbRmtFq5DBCdt7Uj770+xz0+7uS5rq6xxcEZ5a/b5XIsnAV9Zi//O
	CfV5DjgEwl1W3WYuVoFHk0HX4+/FBqLpCwBJou/xS/g8hx1TKBgnLxsd7fnLUtfDYTvw7B
	wRlzWx9iTL2fcFiz8X/6P79o0TShElUGQy6uQBiaeCB0DODGtj7ClMnZxX+NAg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738670766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KSEVppF1Gm5ziuJXFG5LipW5KkS+Ijk0fNLsSAQPJ5g=;
	b=6D9nwa07uFvFFtrDxMCt5rDQzyC1agoV37D9huY7aOJ+AlAQtM0pAVK7z/A0Ko/wLC/JDA
	W7giG4cW3PeRrdAA==
Date: Tue, 04 Feb 2025 13:05:33 +0100
Subject: [PATCH v3 01/18] x86/vdso: Fix latent bug in vclock_pages
 calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250204-vdso-store-rng-v3-1-13a4669dfc8c@linutronix.de>
References: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
In-Reply-To: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, 
 Guo Ren <guoren@kernel.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 linux-csky@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738670761; l=2531;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=++RnEfj/92zFnKlgUb3nngcBQdpnzl+wfBKatfuGrP0=;
 b=YA4guDz/Pam0VaVkky7/8Hr6xnvTVBjPHavC7j5wlnXmRhiWOT/7vUxdqd1d8ldqWwPWzu8iu
 xQTdvogxMLhDB6IbnxzFtePjP+SeWz5u1VWQ5R5y2qFQisTAf1iiPiz
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_040611_023217_F64E1175 
X-CRM114-Status: GOOD (  13.77  )
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

The vclock pages are *after* the non-vclock pages.
Currently there are both two vclock and two non-vclock pages so the
existing logic works by accident.
As soon as the number of pages changes it will break however.
This will be the case with the introduction of the generic vDSO data
storage.

Use a macro to keep the calculation understandable and in sync between
the linker script and mapping code.

Fixes: e93d2521b27f ("x86/vdso: Split virtual clock pages into dedicated mapping")
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/entry/vdso/vdso-layout.lds.S | 2 +-
 arch/x86/entry/vdso/vma.c             | 2 +-
 arch/x86/include/asm/vdso/vsyscall.h  | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/entry/vdso/vdso-layout.lds.S b/arch/x86/entry/vdso/vdso-layout.lds.S
index 872947c1004c35c006f7508eac7dff251c286aeb..918606ff92a988b14f5e64f984750ae04b3b6ede 100644
--- a/arch/x86/entry/vdso/vdso-layout.lds.S
+++ b/arch/x86/entry/vdso/vdso-layout.lds.S
@@ -24,7 +24,7 @@ SECTIONS
 
 	timens_page  = vvar_start + PAGE_SIZE;
 
-	vclock_pages = vvar_start + VDSO_NR_VCLOCK_PAGES * PAGE_SIZE;
+	vclock_pages = VDSO_VCLOCK_PAGES_START(vvar_start);
 	pvclock_page = vclock_pages + VDSO_PAGE_PVCLOCK_OFFSET * PAGE_SIZE;
 	hvclock_page = vclock_pages + VDSO_PAGE_HVCLOCK_OFFSET * PAGE_SIZE;
 
diff --git a/arch/x86/entry/vdso/vma.c b/arch/x86/entry/vdso/vma.c
index 39e6efc1a9cab760b8a65e4b02c624e8c75244b5..aa62949335ecec3765d3b46eac7f7b83be5efdda 100644
--- a/arch/x86/entry/vdso/vma.c
+++ b/arch/x86/entry/vdso/vma.c
@@ -290,7 +290,7 @@ static int map_vdso(const struct vdso_image *image, unsigned long addr)
 	}
 
 	vma = _install_special_mapping(mm,
-				       addr + (__VVAR_PAGES - VDSO_NR_VCLOCK_PAGES) * PAGE_SIZE,
+				       VDSO_VCLOCK_PAGES_START(addr),
 				       VDSO_NR_VCLOCK_PAGES * PAGE_SIZE,
 				       VM_READ|VM_MAYREAD|VM_IO|VM_DONTDUMP|
 				       VM_PFNMAP,
diff --git a/arch/x86/include/asm/vdso/vsyscall.h b/arch/x86/include/asm/vdso/vsyscall.h
index 37b4a70559a8228601203fe7b99b9ddfc3d94f1b..88b31d4cdfaf331d2d597981d3f8ee0c5a339085 100644
--- a/arch/x86/include/asm/vdso/vsyscall.h
+++ b/arch/x86/include/asm/vdso/vsyscall.h
@@ -6,6 +6,7 @@
 #define __VVAR_PAGES	4
 
 #define VDSO_NR_VCLOCK_PAGES	2
+#define VDSO_VCLOCK_PAGES_START(_b)	((_b) + (__VVAR_PAGES - VDSO_NR_VCLOCK_PAGES) * PAGE_SIZE)
 #define VDSO_PAGE_PVCLOCK_OFFSET	0
 #define VDSO_PAGE_HVCLOCK_OFFSET	1
 

-- 
2.48.1


