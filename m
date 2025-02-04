Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291D9C02197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 13:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8C1ebuZ0lJP3y31bGxbPXbCHBk/S+qyapGPEltlOHE=; b=Wxa8qEou/ixt+AqHcnN76LhqLC
	hYqZgLwU+UlQdRDrWNn2J2Rc2XDvMKBZSqWTgTreBfKReiIuinfMQHLgP47sihJCTDO7xdaw7t9Ma
	c1WGxNHvXwOCzmbAMOZqGjxHrPf2DeKR2zHBj8zdf7G5WLGjTJdCoydbBvVAaqYj46hV4lNIzmbTQ
	WeDcM0SzcWQ+vn9jps/xPx9Z4ZmVRlPUYOgdcWEJD3Zvo6t+N8VRnGayvr2XaDeWrYA2xO54+AFtb
	Ih8daLjeC6B/fDhZPiRzc5ieBu3lVVSeT9ci6Q2zq3Urlz5NJmWJ5J/hDBgRnnKqSW7w+lRnJxnbz
	OoCpGDiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfJ10-00000000XKm-1K4c;
	Tue, 04 Feb 2025 13:30:58 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHh4-00000000LSa-1hYS;
	Tue, 04 Feb 2025 12:06:21 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738670775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R8C1ebuZ0lJP3y31bGxbPXbCHBk/S+qyapGPEltlOHE=;
	b=fi6cVuzjg4MLvcYaeTAoa6PBJxAXwGkCFxgSqCxnb4+NvWS85bFlVftgTJO5gaoWhYW8i9
	7635wXYUnTxr/wUOOBfvaDrER7sH/TbkoksOLy9giCeeC4qd3dh8mpeWX3JHS/XhYn0BRk
	BqLl9VknOnJ3kGTvQHkUCtpHBUCpxGOuGJY4bdWTVCFsbKECbzdfRLilge9rJWUtlyxKC7
	VBaspiMhh+kx9gqaw7LyUjiVleFMvapfpuZHPb6xkHMZC2VIi8F5XzCQ0DSAf0fn7B2O08
	1zk1jXDoUL2Pocq+at6WCtmg+ay55jEGBG5Jj8OE7K8uyUdcePWUINunuqG/Yg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738670775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R8C1ebuZ0lJP3y31bGxbPXbCHBk/S+qyapGPEltlOHE=;
	b=2eYUqzXZNGGnj5Wh23qEcRcuMeOUuGUGdOStZdCHtqG/RkcxKvkcU4aNH8ixEHYcc6KAJs
	/9dVQ/HrHShoSZBA==
Date: Tue, 04 Feb 2025 13:05:48 +0100
Subject: [PATCH v3 16/18] x86/vdso/vdso2c: Remove page handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250204-vdso-store-rng-v3-16-13a4669dfc8c@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738670761; l=3853;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=KrW27nKBFkTbdI5cLKoYeWIiY+efCrM238alit0fD+g=;
 b=zdDZFkIolBZYIjKWRZuJRMfq4CoiBuUv7c6wtv4Hs9U4Ltw3T91jpRe9dk3QOTK23hyGtUr39
 Yq1QUI7Wq44CTAg/ca7dKzXfjeOCKECnZPsmvD7/dIPLoNeIfUxRaFG
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_040618_730089_B4D6CEC7 
X-CRM114-Status: GOOD (  12.80  )
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

The values are not used anymore.
Also the sanity checks performed by vdso2c can never trigger as they
only validate invariants already enforced by the linker script.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/entry/vdso/vdso-layout.lds.S |  4 ----
 arch/x86/entry/vdso/vdso2c.c          | 21 ---------------------
 arch/x86/entry/vdso/vdso2c.h          | 20 --------------------
 arch/x86/include/asm/vdso.h           |  6 ------
 4 files changed, 51 deletions(-)

diff --git a/arch/x86/entry/vdso/vdso-layout.lds.S b/arch/x86/entry/vdso/vdso-layout.lds.S
index e5cecdb0fedf000516bb789d6aca4c952c3035e5..ec1ac191a0578e55dc72ceff7f5b5eb104042881 100644
--- a/arch/x86/entry/vdso/vdso-layout.lds.S
+++ b/arch/x86/entry/vdso/vdso-layout.lds.S
@@ -24,10 +24,6 @@ SECTIONS
 	pvclock_page = vclock_pages + VDSO_PAGE_PVCLOCK_OFFSET * PAGE_SIZE;
 	hvclock_page = vclock_pages + VDSO_PAGE_HVCLOCK_OFFSET * PAGE_SIZE;
 
-	/* For compatibility with vdso2c */
-	vvar_page = vdso_u_data;
-	vvar_start = vdso_u_data;
-
 	. = SIZEOF_HEADERS;
 
 	.hash		: { *(.hash) }			:text
diff --git a/arch/x86/entry/vdso/vdso2c.c b/arch/x86/entry/vdso/vdso2c.c
index 90d15f2a72055e37f2ef4292096dd780a051bc84..f84e8f8fa5fe6d1bc680895dfef28fe9251a7fe3 100644
--- a/arch/x86/entry/vdso/vdso2c.c
+++ b/arch/x86/entry/vdso/vdso2c.c
@@ -69,33 +69,12 @@
 
 const char *outfilename;
 
-/* Symbols that we need in vdso2c. */
-enum {
-	sym_vvar_start,
-	sym_vvar_page,
-	sym_pvclock_page,
-	sym_hvclock_page,
-	sym_timens_page,
-};
-
-const int special_pages[] = {
-	sym_vvar_page,
-	sym_pvclock_page,
-	sym_hvclock_page,
-	sym_timens_page,
-};
-
 struct vdso_sym {
 	const char *name;
 	bool export;
 };
 
 struct vdso_sym required_syms[] = {
-	[sym_vvar_start] = {"vvar_start", true},
-	[sym_vvar_page] = {"vvar_page", true},
-	[sym_pvclock_page] = {"pvclock_page", true},
-	[sym_hvclock_page] = {"hvclock_page", true},
-	[sym_timens_page] = {"timens_page", true},
 	{"VDSO32_NOTE_MASK", true},
 	{"__kernel_vsyscall", true},
 	{"__kernel_sigreturn", true},
diff --git a/arch/x86/entry/vdso/vdso2c.h b/arch/x86/entry/vdso/vdso2c.h
index 67b3e37576a64a29ecbdc6fd75e410fc52a82e58..78ed1c1f28b92b97973f57d3f65b9c4d4694f462 100644
--- a/arch/x86/entry/vdso/vdso2c.h
+++ b/arch/x86/entry/vdso/vdso2c.h
@@ -150,26 +150,6 @@ static void BITSFUNC(go)(void *raw_addr, size_t raw_len,
 		}
 	}
 
-	/* Validate mapping addresses. */
-	for (i = 0; i < sizeof(special_pages) / sizeof(special_pages[0]); i++) {
-		INT_BITS symval = syms[special_pages[i]];
-
-		if (!symval)
-			continue;  /* The mapping isn't used; ignore it. */
-
-		if (symval % 4096)
-			fail("%s must be a multiple of 4096\n",
-			     required_syms[i].name);
-		if (symval + 4096 < syms[sym_vvar_start])
-			fail("%s underruns vvar_start\n",
-			     required_syms[i].name);
-		if (symval + 4096 > 0)
-			fail("%s is on the wrong side of the vdso text\n",
-			     required_syms[i].name);
-	}
-	if (syms[sym_vvar_start] % 4096)
-		fail("vvar_begin must be a multiple of 4096\n");
-
 	if (!image_name) {
 		fwrite(stripped_addr, stripped_len, 1, outfile);
 		return;
diff --git a/arch/x86/include/asm/vdso.h b/arch/x86/include/asm/vdso.h
index d7f6592b74a94f6fecba59ce8f23eb3990843db4..80be0da733df43de7520bef69ad120ce05d37994 100644
--- a/arch/x86/include/asm/vdso.h
+++ b/arch/x86/include/asm/vdso.h
@@ -18,12 +18,6 @@ struct vdso_image {
 	unsigned long extable_base, extable_len;
 	const void *extable;
 
-	long sym_vvar_start;  /* Negative offset to the vvar area */
-
-	long sym_vvar_page;
-	long sym_pvclock_page;
-	long sym_hvclock_page;
-	long sym_timens_page;
 	long sym_VDSO32_NOTE_MASK;
 	long sym___kernel_sigreturn;
 	long sym___kernel_rt_sigreturn;

-- 
2.48.1


