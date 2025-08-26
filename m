Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23355CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 06:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uszkh3lqv/KNmuDmi3U8LEjAUFp6txufWN65uYpGjyY=; b=tvMIJSS0JwI+GgM5Y8R8Df5Oc/
	BR0aOLk+E4Y45QlejQxe8YcNSbvacJmYCXZenDQDukhHfWsqt3tVCGmWQ0Nz+DT8Yo9g9mP6eVSLa
	Ei/Kx1nDpRfopJXykiffSTs36Su+CumVOqNKCTMdDvIzr6IE8LHhvpv59rWzXfdc9sGoi9j8bSvmj
	O+1wW/bGfdtm9loTTFftr4F+mLizLuCkHr5j82gRW6c9Z48GqKYcS2JFranEXnAEAGFEDobHmnwwc
	fw8hMCqDbk7vi9cQwN9CRhHtbAFMEqsj0BTJNcH3618WKvZTW0IAIpNhKyeSqRnMDGHsJs+M6Cz9i
	G1b6BfoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn8q-0000000AhUH-2mRV;
	Tue, 26 Aug 2025 06:26:48 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn0f-0000000Af9a-0Yxs;
	Tue, 26 Aug 2025 06:18:23 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uszkh3lqv/KNmuDmi3U8LEjAUFp6txufWN65uYpGjyY=;
	b=Y7BA+StBK859WKGDBThqNJzUURHkFFg61E0vffUNTCQF1VxCAHN6xIXKlyiHbm9eajvVvI
	Jt2GBaIF/pi7LvI0utN6sJQhfLqKDQPZOqDyCHKEfKrCO50+UW590sV1dM+eZn6te1RbF9
	PyeES+znaqYbX/ssIrN39kD3Kk09hoWNTLMrNZp3to3aZHXhrk/vJALCBcxIxdORkBp/am
	uLQaB0JAQI/GDq9oYJJEaiJmug7ASdO6OyB8IVh15jxqnnvzCkRVdctLGYZ4k8F1iN9Zvz
	muN/flVMNl5dCVqSsfywVPrbMq2Yg/EKUtf+JWnprwsvjdX/+lc9kWIeQ4TJsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uszkh3lqv/KNmuDmi3U8LEjAUFp6txufWN65uYpGjyY=;
	b=eX4ApMd4ziFJ+O7XtN9ONWYbWvF8LT00ruUQ8zsD0FgJE7m4FLwFuEe2Mo8xsi0CtiVh9r
	4pAcBkCmeL70n1BQ==
Date: Tue, 26 Aug 2025 08:17:05 +0200
Subject: [PATCH 02/11] ARM: VDSO: remove cntvct_ok global variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-vdso-cleanups-v1-2-d9b65750e49f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=2467;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=SraZm0ID4pbqm566wM3v0Ccba0fElQJFwVMRPDgnQv0=;
 b=gZMwdBr81Gd7SfGI9zA49QzosCdIhBKgEYiZOU6oZRlEUfUXED78+TGCO1Aix2Xt9rw5NrYMT
 tA6ghwW+GTLCIiMiWaHkprmyw7TLEyHTqzP7iQQA/CqwF/kDQFk1ywg
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_231821_340283_46B39303 
X-CRM114-Status: GOOD (  15.03  )
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

From: Rasmus Villemoes <linux@rasmusvillemoes.dk>

The cntvct_ok variable has not had any external user since commit
c7a18100bdff ("lib/vdso: Avoid highres update if clocksource is not
VDSO capable").

It also only has one user in vdso.c, once during init, so rather than
having the caller of patch_vdso() initialize cntvct_ok, just call
cntvct_functional() directly and avoid the global variable entirely.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
---
 arch/arm/include/asm/vdso/vsyscall.h |  2 --
 arch/arm/kernel/vdso.c               | 10 +++-------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/arm/include/asm/vdso/vsyscall.h b/arch/arm/include/asm/vdso/vsyscall.h
index 4e7226ad02ec4dcf88203c9046e1b320a10e7373..ff1c729af05f03ac5db86c28276db2e4a31c775c 100644
--- a/arch/arm/include/asm/vdso/vsyscall.h
+++ b/arch/arm/include/asm/vdso/vsyscall.h
@@ -7,8 +7,6 @@
 #include <vdso/datapage.h>
 #include <asm/cacheflush.h>
 
-extern bool cntvct_ok;
-
 static __always_inline
 void __arch_sync_vdso_time_data(struct vdso_time_data *vdata)
 {
diff --git a/arch/arm/kernel/vdso.c b/arch/arm/kernel/vdso.c
index 325448ffbba0c29895ea5d97e60d6f51e552cb2e..e38a30477f3d70939f6d57c79fad52eed73c49b4 100644
--- a/arch/arm/kernel/vdso.c
+++ b/arch/arm/kernel/vdso.c
@@ -54,11 +54,9 @@ struct elfinfo {
 	char		*dynstr;	/* ptr to .dynstr section */
 };
 
-/* Cached result of boot-time check for whether the arch timer exists,
- * and if so, whether the virtual counter is useable.
+/* Boot-time check for whether the arch timer exists, and if so,
+ * whether the virtual counter is usable.
  */
-bool cntvct_ok __ro_after_init;
-
 static bool __init cntvct_functional(void)
 {
 	struct device_node *np;
@@ -159,7 +157,7 @@ static void __init patch_vdso(void *ehdr)
 	 * want programs to incur the slight additional overhead of
 	 * dispatching through the VDSO only to fall back to syscalls.
 	 */
-	if (!cntvct_ok) {
+	if (!cntvct_functional()) {
 		vdso_nullpatch_one(&einfo, "__vdso_gettimeofday");
 		vdso_nullpatch_one(&einfo, "__vdso_clock_gettime");
 		vdso_nullpatch_one(&einfo, "__vdso_clock_gettime64");
@@ -197,8 +195,6 @@ static int __init vdso_init(void)
 	vdso_total_pages = VDSO_NR_PAGES; /* for the data/vvar pages */
 	vdso_total_pages += text_pages;
 
-	cntvct_ok = cntvct_functional();
-
 	patch_vdso(vdso_start);
 
 	return 0;

-- 
2.50.1


