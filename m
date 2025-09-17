Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B259ACAC59D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDFmKfhenLWr00mS36YiukwI1Iz1vHXJ1zZmpXBWwyA=; b=2nNdCfx9AXYUVlb5xuSuq5PXRZ
	1jZbNXF0wJ4LURdDif/bxw2PRRmJWLLl9B6RXaPBqOf6ZM57pvflM0YjPM3DT44NOhXd+wuK5LUNq
	n75GkbVNxz1V52FgMKefStYdm9s448omMxKNuQY3MTizZFV+Fmpf2IzgNFidCG2nB7p/Fgc4we+gY
	8Nw3R938b9cUa3OE5wPsDHEHfD2dfG35TsRijFC1bBKOpb0b0VNli/w0fFhUQzTVDQjOGgK+ouQz9
	b6lFXfoFSlhhZr292svQ2XLDPY+mkyO2kLsLtr+JrOh/kErYaRSfMfA8WsNQjTUckYepkEoby7Mft
	E/FbUcnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysjg-0000000BxUR-2rwV;
	Wed, 17 Sep 2025 14:02:16 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysjU-0000000Bx74-17S0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:02:06 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qDFmKfhenLWr00mS36YiukwI1Iz1vHXJ1zZmpXBWwyA=;
	b=0rW3gOSZnpwoHVHd0utoedO31TLqxtfzceRT417g+fA1jqVYAP//UasbNOlRWZoYJnoIkb
	+eHHobJcI3zGiYYQjoGcBDcu7omVoWE6C0AuISF8O9BLfWZytBlRoTBZqx9Lh4w9bojy4v
	j/Ze7qGxOZtaKJ7nUWi2xpdSXhQVilJPDCwtA8qm/nXSK9dU/An4xckZUOJ6iOaT+q63c2
	7F70J5y7H7HYvXrohT10P2vR8E7ZXw45PA8bPMuFcRjNhWuJGRpyWLQ32oCSLPKveumV3p
	3KvLuACJxhdZAScr3r95srL93VnhYzLynRrLWu3hZM8eIh/UiC5wPIW5zkrooA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qDFmKfhenLWr00mS36YiukwI1Iz1vHXJ1zZmpXBWwyA=;
	b=cpHIHbMJCVLRPmUBQoiX3nJ1fwY9K2j+/H7gBc5kSHKOrZ16BL/Qny1rC/EkJDEmWhILTt
	u4o5yubPLJM8nQBw==
Date: Wed, 17 Sep 2025 16:00:17 +0200
Subject: [PATCH v3 15/36] vdso/datapage: Trim down unnecessary includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-vdso-sparc64-generic-2-v3-15-3679b1bc8ee8@linutronix.de>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
In-Reply-To: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
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
 Sven Schnelle <svens@linux.ibm.com>, 
 Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, 
 Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=1441;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=+wSjZbA7LHbVuqtEJxYjhM/ccLdUpCaA0YlsOOkQqEI=;
 b=XErtO8u+p9DkQu988NMV9LwxlAk3EkroXkOF7xHP4NqQA4O/zzEl+kvitYoCEiE2tqAJ7wpB/
 tylbv+rHRqjDhcMLMD+oxXhUU6A1mLkLUPQoAbFmQDND1+z14J44pga
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_070204_448557_532427A6 
X-CRM114-Status: GOOD (  10.13  )
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

vdso/datapage.h includes a lot of headers which are not strictly necessary.
Some of those headers include architecture-specific vDSO headers which
prevent the usage of vdso/datapage.h in kernel code on architectures
without an vDSO. This would be useful however to write generic code using
IS_ENABLED(), for example in drivers/char/random.c.

Remove the unnecessary includes.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/vdso/datapage.h | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 752856b36a3abf82b849451e5d5233b1067b86f2..9021b9580be229b2001dd17bfbdc236ebda1cee7 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -4,24 +4,16 @@
 
 #ifndef __ASSEMBLY__
 
-#include <linux/compiler.h>
+#include <linux/types.h>
+
 #include <uapi/linux/bits.h>
 #include <uapi/linux/time.h>
-#include <uapi/linux/types.h>
-#include <uapi/asm-generic/errno-base.h>
 
 #include <vdso/align.h>
 #include <vdso/bits.h>
 #include <vdso/cache.h>
-#include <vdso/clocksource.h>
-#include <vdso/ktime.h>
-#include <vdso/limits.h>
-#include <vdso/math64.h>
 #include <vdso/page.h>
-#include <vdso/processor.h>
 #include <vdso/time.h>
-#include <vdso/time32.h>
-#include <vdso/time64.h>
 
 #ifdef CONFIG_ARCH_HAS_VDSO_TIME_DATA
 #include <asm/vdso/time_data.h>

-- 
2.51.0


