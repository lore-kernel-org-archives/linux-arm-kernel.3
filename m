Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5C3CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 10:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYjHCuW3ZXlc6zM24pgVvQhnKhBaDHM/f7Xd1AFH00Q=; b=DQBv7VNEWPpPo1/nFsJQQyCskY
	wQEXd3yQqcxCjRq1oDwBSD5L25I3VSdkiQutWE/FxbVBlLX6du2mcJVXVq56kUQNt8AT1lnYgNPVu
	G1whqRMdnpTqjl3deg/LAnkGxyO2IigftmcMiH6a6B2Pk/hMb7ojZm7z9m6L7v6Ei4b0WPCdDHWdU
	RmXMZP/eSREWSiSW23xQwfKpRMjIERKzwgentMyUI21xNLxsKAkxAjFdwB38HFU2mlv9mMcJ6CI2k
	d/WXRCpyCpwvLH0BwzhkDyg327DlUgBqky4jeMrVxI7QW+886D/x5tpr4507Oqu8oIYZITOFts4FA
	SzPSOgYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwox-0000000FEc2-0spU;
	Thu, 06 Nov 2025 10:02:23 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwom-0000000FES9-1slX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 10:02:17 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762423330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nYjHCuW3ZXlc6zM24pgVvQhnKhBaDHM/f7Xd1AFH00Q=;
	b=hm7jLjPZC3DNZd+mkVfN1lMzCb3u9kivIlsycw+gwfmiaCsYsN0ANrTxXLlpz5OhDS/4bh
	WqTGfyX9mGYLHMGKqDbVX/P3iESHlyihWmEGwhDSHW+WsOHGuTqxHlvYnZ3j3h7n9nvLln
	X9ifkX3o5r5rKMPzGTaXNhJwIp7/8LAlUIJMRbZvH4DgmVt+MVWs9CEEqzMEFIaTEXa6Iu
	JkYrVPQDma4I2SSoADQZyslE7YrabKx0HCtu4UXD7bT3nsz1J1NCJ+GYbzvZ2mbw6D15/R
	tbK5uAxCXPC+qTKS7CfH2ZYDmyqjkg/FDEYwypouUlsioepkOd/ygPZ/Q0/nAg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762423330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nYjHCuW3ZXlc6zM24pgVvQhnKhBaDHM/f7Xd1AFH00Q=;
	b=wfA+JYYxRMMV+QkT5tYVabNViCFlYaQ2lVXLrOdy8Ok91sBH9uMkSlWws9WuhFHg9Uc6sR
	LAo0Jb1ENdleDJBg==
Date: Thu, 06 Nov 2025 11:01:55 +0100
Subject: [PATCH v5 02/34] arm64: vDSO: getrandom: Explicitly include
 asm/alternative.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251106-vdso-sparc64-generic-2-v5-2-97ff2b6542f7@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762423327; l=1038;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=/RM2+eho8hCHlVVsxMDHxgwRFdNnaqJNQrWh/y7GNvw=;
 b=dZ7KLH36vebcT3Ftq2fW/Lbv53KxGB1dFjCDsdQBFAwF/tOHnrR386UTCh04Ib/bMdTzsbHFG
 hklbRXwhAROBU6PGi5meyVTV4jtwSlU0eRZ8hJB1KKxaJbs6V5UX992
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_020212_630483_D475762D 
X-CRM114-Status: UNSURE (   8.94  )
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

The call to alternative_has_cap_likely(ARM64_HAS_FPSIMD) requires symbols
from asm/alternative.h. Currently this header is included transitively, but
that transitive inclusion is about to go away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 arch/arm64/kernel/vdso/vgetrandom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/vdso/vgetrandom.c b/arch/arm64/kernel/vdso/vgetrandom.c
index 832fe195292b34e2029f593ea170347c98e06dac..0aef124c90899dc0c8956b0f32f54992aa3acf0b 100644
--- a/arch/arm64/kernel/vdso/vgetrandom.c
+++ b/arch/arm64/kernel/vdso/vgetrandom.c
@@ -2,6 +2,8 @@
 
 #include <uapi/asm-generic/errno.h>
 
+#include <asm/alternative.h>
+
 typeof(__cvdso_getrandom) __kernel_getrandom;
 
 ssize_t __kernel_getrandom(void *buffer, size_t len, unsigned int flags, void *opaque_state, size_t opaque_len)

-- 
2.51.0


