Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B226E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 15:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NpJJBpExepilr1e2LDfuHty6WeJflNVwrGD4fcjF/+8=; b=Na226X055RbwqmvuCaioeTJFCy
	7s9G63y0l6YXmnFrY4sk6s4+Md/CNWQ/rwGbncxK5c00ALNfC+W4Lq3lDpz0USKh6Jg1oWjESV3by
	uwquUvczYNQYicoAgej3fPUN2TWx11p+MdBo7Yy4pjHkcEDXq7AvRiQj/vfeODYylYs4qVHuKDNZU
	/zmfOqI/uweU7jLwWuQo/dkbYjMP8LNf7Hp0JR/WY0ER4P0KpCUX+nQWOdLaoOLZjMTM0syVwtPGE
	YeMp8gt2cT0QoY0YVHLlSFXss+ZJVYXsWic9YcBJI7fqmnQ8/kIidHNTP1TrUoA3bTbQBLVsZs4dD
	8glep5/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHDQ-0000000G4N0-1lsq;
	Fri, 10 Jan 2025 15:46:28 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGrk-0000000FtoE-3nVs;
	Fri, 10 Jan 2025 15:24:06 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736522641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NpJJBpExepilr1e2LDfuHty6WeJflNVwrGD4fcjF/+8=;
	b=WNKGqavyPePiDg61FU1H3x/H8y3RjJi1u1HoBkEUUayQduQ3z96s99+3Vr0oOkE+XkV6Ic
	p+q9po91IlUb6D2P44CCEXV43soEj6r7dTZigibgsRLqK9HGVwr1lgE3RP0HHqIN9gmNFT
	ukIArHjKKvFy1SOiSlDQpXb20ViaiClRnxyejp+0vbIx0N78cbmLrhWy+wJGKBy2sCfm+V
	XT6rOKwlAAFAg4afID05I2HU0HBBYVjz+F6hNdouBYH/Fay/8RbXCyiALE1mwF4BxiINw/
	KQj2E/8BbWDsUWuGxUp0RGUYNRDctvYXP5QE+PT44e5gfirulIQUMIzdHXFbHg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736522641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NpJJBpExepilr1e2LDfuHty6WeJflNVwrGD4fcjF/+8=;
	b=KNQwmbhIFkev3kV3ZI1pztbVIIRhKfE1Z3u8tALSaFxLJgyPKNSjSTz4MaMRqgMtzsFlvz
	SulSEKg3Mge2EPBA==
Date: Fri, 10 Jan 2025 16:23:56 +0100
Subject: [PATCH v2 17/18] vdso: Remove remnants of architecture-specific
 random state storage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250110-vdso-store-rng-v2-17-350c9179bbf1@linutronix.de>
References: <20250110-vdso-store-rng-v2-0-350c9179bbf1@linutronix.de>
In-Reply-To: <20250110-vdso-store-rng-v2-0-350c9179bbf1@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736522629; l=1909;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ebVxN/FJGifv+RO3iXgSdQkCkRwa0yMwOEaRcM3+4TE=;
 b=4OgYlLAdlumC2HZPf6WpVDZ0oQlx07ye+dlpuiMf/+Yazg/+7P69RNR3Heeo9H6T28mxYF1hU
 3Vo0yL53jzkCVw9t4CjnFsMJ6T2ReF7nZhE8sTzBKOv3OdHS+5/tiL0
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_072405_252648_AE50BC10 
X-CRM114-Status: UNSURE (   9.44  )
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

All users of the random vDSO are using the generic storage
implementation. Remove the now unnecessary compatibility accessor
functions and symbols.

Co-developed-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/asm-generic/vdso/vsyscall.h | 5 -----
 include/vdso/datapage.h             | 1 -
 2 files changed, 6 deletions(-)

diff --git a/include/asm-generic/vdso/vsyscall.h b/include/asm-generic/vdso/vsyscall.h
index a5f973e4e2723ef1815c88a7846f7c477e3febd9..13e2ac3736ee9b4aea6800117997ee165a7e2b9d 100644
--- a/include/asm-generic/vdso/vsyscall.h
+++ b/include/asm-generic/vdso/vsyscall.h
@@ -32,11 +32,6 @@ static __always_inline struct vdso_data *__arch_get_k_vdso_data(void)
 
 #define __arch_get_vdso_u_time_data __arch_get_vdso_data
 
-#ifndef __arch_get_vdso_u_rng_data
-#define __arch_get_vdso_u_rng_data() __arch_get_vdso_rng_data()
-#endif
-#define vdso_k_rng_data __arch_get_k_vdso_rng_data()
-
 #endif /* CONFIG_GENERIC_VDSO_DATA_STORE */
 
 #ifndef __arch_update_vsyscall
diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 46658b39c28250e977f5a3454224c3ed0fb4c81d..497907c3aa11fcae913f62ef7373bbe6a1026bd6 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -152,7 +152,6 @@ struct vdso_rng_data {
 #ifndef CONFIG_GENERIC_VDSO_DATA_STORE
 extern struct vdso_time_data _vdso_data[CS_BASES] __attribute__((visibility("hidden")));
 extern struct vdso_time_data _timens_data[CS_BASES] __attribute__((visibility("hidden")));
-extern struct vdso_rng_data _vdso_rng_data __attribute__((visibility("hidden")));
 #else
 extern struct vdso_time_data vdso_u_time_data[CS_BASES] __attribute__((visibility("hidden")));
 extern struct vdso_rng_data vdso_u_rng_data __attribute__((visibility("hidden")));

-- 
2.47.1


