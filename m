Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8601DC02196
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 12:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=roEAdS7GRy2NoEBIGEVrgoE1SBCHacklusP7n5QqKZw=; b=vBHkatM0LtUENuUj5SRgUTQvWL
	o0HFxkwZEwO+bTUHWV9HXUycZVonteETTKk7wJX6AJgubW1yXqpveZhD/I5ggZAK4Ne7weCMTBQkP
	2YRA2o/OnZrugqIaGTCAyV9ogLRr2cCJMQ+Kg0eMYrI7Ha9XdXsjUJDesX2YrxF5xetjTXKxYUHXl
	nEeNb5I3onvVTNTjGDJpFvvUFPBfKobYMZDFvteWnTlllI+WrJ+EY3L06ALzFxVbz9b3d6tggjw0q
	z9E7fxZcFwnRshJ33sj0XRI6fwS2I97N9x/lbLNBrb+R5jNXswN6uh5Ep5Wlaf5RJNXOy/iCcfF8M
	XoNfoQ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfI67-00000000QjT-1o2A;
	Tue, 04 Feb 2025 12:32:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHh9-00000000LX4-1LKS;
	Tue, 04 Feb 2025 12:06:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=roEAdS7GRy2NoEBIGEVrgoE1SBCHacklusP7n5QqKZw=; b=j5u5Dgf3tIluh3vLuIx5zowGvp
	q1e7aMk1W18C+j9Z4k+YPhlU/hP7JlrcTK27T0EpU+pL3rkpq3dkW2PfmizyDclSXONYK+2YExT6z
	OkXm8SXDDIx5/uxMpX7VOq4wSdG1nOiZGouWZ6iCwUzzIlsdMG1iPQR3D/7MiUoc3j0ep5MEDGL3F
	AKCskBLdfm1tDJkeoDdt90DoQMa+BxiWB62RSo8IlzkgVBCkJC2c8sFAb3XJovVRMeZpa7t21ZSSe
	FBUjMsOGaOMVOCgCW9MsRCR6IYX7iOSnQLt+MUuTo71lBP2hq5yRMYVxjgp+VFKN43lNi2CPEAXW4
	b3+XmKqg==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHh6-0000000GIN3-0YwH;
	Tue, 04 Feb 2025 12:06:22 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738670776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=roEAdS7GRy2NoEBIGEVrgoE1SBCHacklusP7n5QqKZw=;
	b=wxK92Pp/r55qShjOBSU0exdyhKwvjhH/7KR82nwP3boIrWI8DOEcXNzmEI/GLTMuKG7f1x
	PkfpPhNlp694PQNIE9JxVVF0RpWJxqD5aD6dRJTgL2KBbo8+mjoASHji5u8OaqosLIhZYS
	I2WpvfYH8WEIAS9wTwTqnQ1ZQeUtq8sBWEr2MyVahakVyltRaNayKDqCym7YG/4nfSw//J
	jDeFgHHpiRWHn2Is5gVbkmGRrNzNZfoZVhXHD66WQ5mmpA0BX49BQFIK5vtjr3EN7X+E2o
	1ySk39mXl3dnbZHdIAb3DZtke3+Trc/kfWfTXMt0py/huHKrI8hV6DQZc87wzw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738670776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=roEAdS7GRy2NoEBIGEVrgoE1SBCHacklusP7n5QqKZw=;
	b=yQ4Xipxdi05s4pgfjTsItukvErNFC8tYL880xKiWzRwOe2Q1tERM9two9suuB4Vi5MstXN
	KvE5bLTn6wcq8sBw==
Date: Tue, 04 Feb 2025 13:05:49 +0100
Subject: [PATCH v3 17/18] vdso: Remove remnants of architecture-specific
 random state storage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250204-vdso-store-rng-v3-17-13a4669dfc8c@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738670761; l=1909;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=HgzmgdwkiaSDMiXf6XJkivPi1ft0DfM/ZF/QqgcCG+g=;
 b=yVdvyiouTW57SLrpHIPuIBmbt1VBsh4joVh2d8Xlt05DpEfmNT3KQwIdq5mEUqPx6MKl9Ku1M
 G3pd8yFEhW/CSALC2XFknkosOiA6chnJdCA+jrJ2s0Bn8d4Kmz2asPR
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_120620_387899_7EF12634 
X-CRM114-Status: UNSURE (   9.15  )
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
2.48.1


