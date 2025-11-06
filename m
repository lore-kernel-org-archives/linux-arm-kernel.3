Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAAFCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 10:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIeraRtAg206FkETryDgO1ccxuAvqFlxDc9eSmaYkEM=; b=sGEAa8ZFQoxlPrP9ucXLuQ1pOG
	39WGVNe00LWBsGbdqwRC5YJw2sWGcx8ykuD7jOVaY+cNj9cKFiIw/vQheXKjpKWX5rWoc/KOz0ijD
	wO9GSrpjB8ncBlXTaYiShqD8+Hv92AozSe9sfyvL6XDi3ZkFFLRXmvaLwlpZvkFBEyCJ/DSkqxxMv
	dXWqHPYpMmzkvis/dSN8iog1Eos/Tmv4++YkFb2IEfeDrpkcXVREQ6xMSsaoC2ngmQk9j+hMo6jAQ
	h1vVPEB4xrXtrYXki9vGX+1/KfQ66sR0qwFXbdqi9gTJU4APxPiQzzt42C1HH9BAMfe4jw7ZQNlKh
	9cJGEcFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwoy-0000000FEe0-1CH1;
	Thu, 06 Nov 2025 10:02:24 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwoq-0000000FEUB-3oqv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 10:02:19 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762423332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FIeraRtAg206FkETryDgO1ccxuAvqFlxDc9eSmaYkEM=;
	b=r9kzcBb9+YvtLhBZ2RS02DiToWWWbSYeZwRl8W1sHLCDhGfJnryMADIdaJekBNz1YvCCSM
	1AhODjNbwCTc4Xtf2Bngh4p6auUrgjRX7jtJL9zflCqX3CLFZSyqxPPlf2vZi+rOe+lNeJ
	etz/wCgZ3alj9B0Ttsg1BcK/z+FQcMkmbXtvQYlCSLovv1yDJvHE++/ulOV4tLT/WbXXTq
	pGqKOTefBfEdUI/mxYCWEVIY2lYRChTVyjnmS5PaIdd4q2Eh1HsXjmuSn39l0UI7gaWl84
	T6PJRYSD8rCYst/jdfiwtCMW0LmSdvx6FdWzghzqVKn86HfAtjvifWf273qF0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762423332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FIeraRtAg206FkETryDgO1ccxuAvqFlxDc9eSmaYkEM=;
	b=QT8pOm0xeKLE/BsI8QXhaK1N/TxtxS9ql/DDfYYgzdbTP91feBDAN1p/kYYNXwYwpMNMg/
	Ki6PLtVthWfvQeCQ==
Date: Thu, 06 Nov 2025 11:01:58 +0100
Subject: [PATCH v5 05/34] ARM: vdso: gettimeofday: Add explicit includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251106-vdso-sparc64-generic-2-v5-5-97ff2b6542f7@linutronix.de>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
In-Reply-To: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
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
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762423327; l=1057;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=tZGss8cb1z8/0WWBQUsSvBIRS+73IHhbGKdGrpAcpcw=;
 b=4TmnZudoivPgBuTFtxV0rPx1M5gz7LfAw/U75KxmtFw8e+BgnsF5QEPLLPGqy87T6Hl18fHJv
 aV30wu840YVAK804kEeGj7tVA2bb02xYGGs7mPZ3a9Pr8xnfrUEuV/e
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_020217_248158_13634742 
X-CRM114-Status: UNSURE (   9.38  )
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

The reference to VDSO_CLOCKMODE_NONE requires vdso/clocksource.h and
'struct old_timespec32' requires vdso/time32.h. Currently these headers
are included transitively, but those transitive inclusions are about to go
away.

Explicitly include the headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 arch/arm/include/asm/vdso/gettimeofday.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/include/asm/vdso/gettimeofday.h b/arch/arm/include/asm/vdso/gettimeofday.h
index 1e9f81639c88cc23cae7cf267bf4674c6d6acec0..26da5d8621cc938f9fdb57fc4b8d240c71e950be 100644
--- a/arch/arm/include/asm/vdso/gettimeofday.h
+++ b/arch/arm/include/asm/vdso/gettimeofday.h
@@ -11,6 +11,8 @@
 #include <asm/errno.h>
 #include <asm/unistd.h>
 #include <asm/vdso/cp15.h>
+#include <vdso/clocksource.h>
+#include <vdso/time32.h>
 #include <uapi/linux/time.h>
 
 #define VDSO_HAS_CLOCK_GETRES		1

-- 
2.51.0


