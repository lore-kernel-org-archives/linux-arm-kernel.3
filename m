Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2108CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 06:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/oLlHMS/fCP6P1KLSn+cvJJv6PKUv3DICeaKqETsd4=; b=XHC0+OVPSHdTSoM2N5ey55GjtX
	zS5sBwWEmoFeEDaajeRqahonqNy8xcWxsYJ/gdzw/ERnrIfzdQ0dwxkNhLesd7Q6Tw/M09iIqnXKi
	YQh2U1O7eF2PfnlWp4vpqi3ljJ3WBzCaQCTuBf602H+dcmARtGP3G/+O/NVe/c/Onuu08Yd6KUlEi
	c78WYk4LoxG8vJVJdSQfpDTeYCfLOX+zzbrUUXz2FYTT40xHz7lai+owBdVmwGOECrtU02EpNY4Sf
	AeBhfc/VtqbPA0CNEjMbKMOoM+8zDydK08VJWqFN7jae40kgSsGqc6X4zCFv7XdudEoZYAucbxFkV
	shGYaODw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnGv-0000000Aigh-1Ec8;
	Tue, 26 Aug 2025 06:35:09 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn0h-0000000AfBD-0LAu;
	Tue, 26 Aug 2025 06:18:25 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3/oLlHMS/fCP6P1KLSn+cvJJv6PKUv3DICeaKqETsd4=;
	b=vM/cvVQMAyhS92V8y5yVESyKxIqQ5R3zffJXNT39DFeEehqGvQ4cgcMYsWOtpmbyjLR+Jk
	we8S1VPZLk08HyevreXbtrS0WfURWLCD0C1udndZaGXsxcvNVQ2IAa/sI7wZ5EjfeBV3QB
	Xl1IBk2dQX2DHCg8P+mvsjehyFDzZ/AjK26U/WIM/Dx6E1r9CZ+xl3vYpcz/43dfXeL8zq
	t+0oYU9wuduujEn9b3gXCqd8/s4+brqyYCVM79YY7DmkOuCIKG5XnjOxrX8XloYENkIp6J
	frOXYpfPBh2KaqVqKhcgIbWwZ8GW0EG4XRusd22yhv2ylnUvt+X8LNumqRAcrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3/oLlHMS/fCP6P1KLSn+cvJJv6PKUv3DICeaKqETsd4=;
	b=vA9RQwkSkeW435dz89cXdm1JlqEJ1IVbHIFd6A9tNEpJZ0qLZJMeeSzlzAhq24mxpdVhVM
	OJzV+jwkYkep1fAA==
Date: Tue, 26 Aug 2025 08:17:08 +0200
Subject: [PATCH 05/11] time: Build generic update_vsyscall() only with
 generic time vDSO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250826-vdso-cleanups-v1-5-d9b65750e49f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=943;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=0FWlozWesIsQ0qQyaOP1bY0lFjVrbfKxBVeB1PCnS50=;
 b=9pNh5a5NaguFfKkfKR0EeNJ5Hqk/rS5JHEaeEmX/n8dUdZlkDqHcQrQvn3JOYAA8u+Wl7yvQz
 BQudoqsm8axAvusAQkTMXCgGoVnMLts+duG7XkK6Eop3MTQ6RNupbR9
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_231823_360015_29B202AA 
X-CRM114-Status: UNSURE (   9.35  )
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

The generic vDSO can be used without the time-related functionality.
In that case the generic update_vsyscall() from kernel/time/vsyscall.c
should not be built.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 kernel/time/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/time/Makefile b/kernel/time/Makefile
index e6e9b85d4db5f8dd5d9b574ef7bb0a281b9daa6d..f7d52d9543cc7a2d1a18db179229a8d7936317d3 100644
--- a/kernel/time/Makefile
+++ b/kernel/time/Makefile
@@ -26,7 +26,7 @@ obj-$(CONFIG_LEGACY_TIMER_TICK)			+= tick-legacy.o
 ifeq ($(CONFIG_SMP),y)
  obj-$(CONFIG_NO_HZ_COMMON)			+= timer_migration.o
 endif
-obj-$(CONFIG_HAVE_GENERIC_VDSO)			+= vsyscall.o
+obj-$(CONFIG_GENERIC_GETTIMEOFDAY)		+= vsyscall.o
 obj-$(CONFIG_DEBUG_FS)				+= timekeeping_debug.o
 obj-$(CONFIG_TEST_UDELAY)			+= test_udelay.o
 obj-$(CONFIG_TIME_NS)				+= namespace.o

-- 
2.50.1


