Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAADCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 10:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p12DOEBsm2e1glAtpDY9DYaMx7+CHoNdHdo/bDc6SLA=; b=p/3lGhmM7UUlnQx+nBtGD2I5kj
	XSkOV0DBR2QvLUU555s7ERl9xPm9GI1vFv3WAd5Sd+Hkqjr/ZKC+qYKA68eGVkJ0rF1sziTnsB1W5
	WG9ME4ekFgEEIw2aD7rkRvvuFq8IfaS3K/wu02evxA+FywYOUtCN9bzAh3N0Q8+pFFqORBlIMseDa
	35dclGeeePG+u1aMYEAOP1sFv+Na4Ycxf3ZbtOijYWcVNUrvUMjthm6jPGtevn6l2XLuwD8jd/f3o
	KaRLHDX83+vOXBJ90JPEQ5cQY1xZzmj1VIxQYMuydR1adhE4VIC6u9l7wiDHzE69DTkZS34xW2RYf
	0vjTDRxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwp2-0000000FEkV-36zb;
	Thu, 06 Nov 2025 10:02:28 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwos-0000000FEV9-1Xr6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 10:02:22 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762423336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p12DOEBsm2e1glAtpDY9DYaMx7+CHoNdHdo/bDc6SLA=;
	b=lHjDesxwezGMqrX0JmxEEV6Wl5mCtM0E+aKDVP2fSnlmlmeP/qWYuHrWNYPCfRvEzmltTY
	Xkt8XR17/NaZdJzpuiGhIrgQam+Wf6xqOvuTXfttbSdXCdHmpx8GcEGofn8/8x3Eymb/n+
	M3EvuoxQjpB/SW2XNA91oaoHTuZgPhc/SYdcw9jQbVJIe974cNuMQWg3Moks5pA78QJRHs
	GZmO/XeOFWC/1NXwPvSF1EUZfipJrPNqNuSDHywahsqj0d/ELByBTR0srhb06mh91veaQV
	vzIzgH3fFBmo5V+gQNFzPW+A45f4AjCE5gCXE27afHSPWO/zok3fSvjzRMplPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762423336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p12DOEBsm2e1glAtpDY9DYaMx7+CHoNdHdo/bDc6SLA=;
	b=OozrfdVpYKNWbjyfEfLh45UVZTd4dZ+V78mBGPpV+wIJfYGFCwNX6PFC1EnxSdfmzZyGDR
	2Vp0voJTDxMvO5Bg==
Date: Thu, 06 Nov 2025 11:02:05 +0100
Subject: [PATCH v5 12/34] vdso/gettimeofday: Add explicit includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251106-vdso-sparc64-generic-2-v5-12-97ff2b6542f7@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762423327; l=1063;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=8uLSosIzbxHtrLr9GBprNPDpJ3bKD05UahB9SGNPIJE=;
 b=UpYeRRD5i1K4tW3yL6iiwC27RDLs0kYe53cKq9z3nXOAP4u1QgYtR0o6LY/9ctc9gj32hcxUx
 In+uqtNh48/AVVfkKdtrXRym8u75jMT3Gmwy9sYNUyFwJocANXLp6Qw
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_020218_615044_5F78F6E4 
X-CRM114-Status: UNSURE (   8.27  )
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

Various used symbols are only visible through transitive includes.
These transitive includes are about to go away.

Explicitly include the necessary headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 lib/vdso/gettimeofday.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 95df0153f05ab41c871755e005762f3442ff3ecd..7b3fbae85544c2f2f6b9abd5437f130706fb6ec6 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -3,8 +3,14 @@
  * Generic userspace implementations of gettimeofday() and similar.
  */
 #include <vdso/auxclock.h>
+#include <vdso/clocksource.h>
 #include <vdso/datapage.h>
 #include <vdso/helpers.h>
+#include <vdso/ktime.h>
+#include <vdso/limits.h>
+#include <vdso/math64.h>
+#include <vdso/time32.h>
+#include <vdso/time64.h>
 
 /* Bring in default accessors */
 #include <vdso/vsyscall.h>

-- 
2.51.0


