Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62F3CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 06:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nO2JL615du1jOF72APE2zhJ94ZRmncTq0i3UGNr5c1I=; b=iZ4IAb70xdDxa2bb9n4qxtW+0+
	1tlrC4drEYDuvwVfA4GYLO17RrL3tmdFIl4fXsiDTHi2gkauAEpzlmeSUy1mAM+fzsFGQjuwCskpp
	IangylW+Scpk9TQbkLi8Luf+YgMssELxjmaxOeRnduraVh9emL6n+QG608pqvkxZgHaD9sxFHrSKl
	AUV3xG+0WvkYwzDwp3bKYC1hfKxtLg7Qx2KvhDDfhxKrwo42ZtwFMhKBe1ZGT1ngchqus1vEBDBSP
	CFOO0q/O/ChNDFEr+L/HpLCYGDVDZyAxPwpth7oqu9jfbSO6Tsq0OH3K2StxOc9KO2zlepPB8RL+2
	a1H7ArUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnBZ-0000000Ai2b-0GvD;
	Tue, 26 Aug 2025 06:29:37 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn0g-0000000AfAC-0txz;
	Tue, 26 Aug 2025 06:18:24 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nO2JL615du1jOF72APE2zhJ94ZRmncTq0i3UGNr5c1I=;
	b=SkRWsNvTfHbckv53ywkAP2ElLQno6nL35GWoaL2ostie0fB8ZhIrtZ2GpuUn4Yog/ZqbRE
	7Ic6DelZ6GAsCv6r4UwjpNb7cBzSwuWnf7NOkczUv4NJuo6Lqe0iE9DBx6XOvzaIrOUWQo
	ZM0hBzR26cXTRvKvnkNUcchIelDhHzNqPoWVr5FtMu4Nudp2Z1D46OEL1XDCSKSmaZgXIQ
	GVPwi4kCLp7XohVVq/RWPsKA1Z9HMGn618o+O6/M1Ni8zE340s4Kit4LGTyA3C0Me8op4Y
	B3jPvpQhJwWgOn21qfbXuyhpqhYwaUwaTLAGms3NzzYcJcqF5v7lVsAOPnWVQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nO2JL615du1jOF72APE2zhJ94ZRmncTq0i3UGNr5c1I=;
	b=D/AJx/EsJAMGNOGXXQFrdYdT0ZJzLD/RNagxyHMRvN9hYL1zhSX7qy7lWuXYEwi6Dt8f0S
	27kxifT9iftB5EAA==
Date: Tue, 26 Aug 2025 08:17:07 +0200
Subject: [PATCH 04/11] vdso/gettimeofday: Remove !CONFIG_TIME_NS stubs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250826-vdso-cleanups-v1-4-d9b65750e49f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=2241;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=tJipNBF1mCJkcHD6N5bfKjS9Ac/LEi0lcuk3Tu4AjoE=;
 b=7HV/8pMpAQ+4eBDclWEwMfZrJXqv8psYox/k68u7tMzHASoMCDHXlEWrPcIR5Nm0+i+/zA6uc
 bGdBUfDn6tHATjO/gAnAN6QWWAGRNdzrTjLrH/04Nne7yZR3YZZBbeH
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_231822_402993_AA6225B1 
X-CRM114-Status: UNSURE (   6.90  )
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

All calls of these functions are already gated behind CONFIG_TIME_NS. The
compiler will already optimize them away if time namespaces are disabled.

Drop the unnecessary stubs.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 02ea19f671647e9a1b8c3e7ea0cbff33b4024711..1e2a40b8d2c6c2356cfc678a1ea441ec1bad181a 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -108,8 +108,6 @@ bool vdso_get_timestamp(const struct vdso_time_data *vd, const struct vdso_clock
 	return true;
 }
 
-#ifdef CONFIG_TIME_NS
-
 #ifdef CONFIG_GENERIC_VDSO_DATA_STORE
 static __always_inline
 const struct vdso_time_data *__arch_get_vdso_u_timens_data(const struct vdso_time_data *vd)
@@ -149,20 +147,6 @@ bool do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_clock *
 
 	return true;
 }
-#else
-static __always_inline
-const struct vdso_time_data *__arch_get_vdso_u_timens_data(const struct vdso_time_data *vd)
-{
-	return NULL;
-}
-
-static __always_inline
-bool do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
-		    clockid_t clk, struct __kernel_timespec *ts)
-{
-	return false;
-}
-#endif
 
 static __always_inline
 bool do_hres(const struct vdso_time_data *vd, const struct vdso_clock *vc,
@@ -204,7 +188,6 @@ bool do_hres(const struct vdso_time_data *vd, const struct vdso_clock *vc,
 	return true;
 }
 
-#ifdef CONFIG_TIME_NS
 static __always_inline
 bool do_coarse_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
 		      clockid_t clk, struct __kernel_timespec *ts)
@@ -233,14 +216,6 @@ bool do_coarse_timens(const struct vdso_time_data *vdns, const struct vdso_clock
 
 	return true;
 }
-#else
-static __always_inline
-bool do_coarse_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
-		      clockid_t clk, struct __kernel_timespec *ts)
-{
-	return false;
-}
-#endif
 
 static __always_inline
 bool do_coarse(const struct vdso_time_data *vd, const struct vdso_clock *vc,

-- 
2.50.1


