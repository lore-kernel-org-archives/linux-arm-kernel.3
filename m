Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AD7CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 10:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AA1RaYevhVsm4UU0YhUEK/PYFHQA4HTGOnbLyC3tUCM=; b=wU9ncOyArtpGXtN5V6zbJtdqWx
	8NfpPNbD1kPsid1neZ4x/UFSErXLPbFFoDEX7USCfQupKCDrJ0DDRMjM+sOUxPFiZkzqRVRk2gplX
	dAc5oVtlzGyMGeORBQfULo8qonze2DsyoyKDJWsFIcHIQ5GRk6eshCFsB61/hn9MqAYPchQn5kiQb
	/+ENpSfhyiSnwCKEo1RZE1qAHTKu/VX+6LoEevbxYCok7Jleh5m3qLoYlrFCBm/v2OExTsvefA86W
	+etjpWyLfbB3FYtKz8FPRYqDKUmR7oRxD84kNB0YXBVSab2J0SIBD93wzZg2SUTcvROGD7id/KCwp
	jCI6FmnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwoq-0000000FEUe-2zZP;
	Thu, 06 Nov 2025 10:02:16 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwon-0000000FESN-29if
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 10:02:15 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762423331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AA1RaYevhVsm4UU0YhUEK/PYFHQA4HTGOnbLyC3tUCM=;
	b=tFcEZ+F2McnQR/yj4fr2Xzl/qH8/6ms9DrGJJEA7fL7kXcqCX8hv4zyKd2otBfY37FGEMv
	2KoqENjQKbobna/HhKzV0a13m+kQAUyNfbgCcNeMvJwrxOwp4UUkJ5GB31sKEvK26EuVcZ
	J2nsupkTFncr4BO3FtqqAHgRyL9zPra2lX0RBt7EvpZmeaeHQoP8DGBinFIHBZ9exbk2mq
	NylqCM6rngQh4QiSqsBmuIdgwx+l77BtrybXZDDzcxnTxiRrQxzTKsgC7LJWm4+DZEOjyZ
	Anyou1cfZ4co6SXagzJZoC5bQwao2fnYT4x/M9WSE8oOxNat5twRj+yM8uqeiQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762423331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AA1RaYevhVsm4UU0YhUEK/PYFHQA4HTGOnbLyC3tUCM=;
	b=dv4aXHzL1Xjk+ugiHKiKHn4Zai+gBXRbTJznV37UCpAZWEQ/PoCZgmqHL6C2cMjGwpvgUK
	J8M/KPUkt2+qRbBg==
Date: Thu, 06 Nov 2025 11:01:57 +0100
Subject: [PATCH v5 04/34] arm64: vDSO: compat_gettimeofday: Add explicit
 includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251106-vdso-sparc64-generic-2-v5-4-97ff2b6542f7@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762423327; l=1077;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=V9tDNcYgJIt9GytAgrSszi/+I+38Gq3Tgc4R1PI5n6s=;
 b=dCws47IlDG0vkiaRQIxj8kTBcuayHBXpMon0coy1Y4wHv/D0Q6Ui17Yiv8DDkmnY/1KURKs7c
 RGT4PVlUYpJAvwj7qQeBdadKVIk+g7V23dttIV94IhYzkt9QxeQF/cD
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_020213_692348_3F3D92AE 
X-CRM114-Status: UNSURE (   8.29  )
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

The reference to VDSO_CLOCKMODE_ARCHTIMER requires vdso/clocksource.h and
'struct old_timespec32' requires vdso/time32.h. Currently these headers
are included transitively, but those transitive inclusions are about to go
away.

Explicitly include the headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 arch/arm64/include/asm/vdso/compat_gettimeofday.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/include/asm/vdso/compat_gettimeofday.h b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
index 7d1a116549b1b98d6eb7a78d053958c6a71799ec..2eb116d91235fea8362a11f3644619dbeb8201de 100644
--- a/arch/arm64/include/asm/vdso/compat_gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
@@ -7,6 +7,9 @@
 
 #ifndef __ASSEMBLY__
 
+#include <vdso/clocksource.h>
+#include <vdso/time32.h>
+
 #include <asm/barrier.h>
 #include <asm/unistd_compat_32.h>
 #include <asm/errno.h>

-- 
2.51.0


