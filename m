Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4079CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lG79bLh+cxA30eAnxMz9ar91cT1e7icm6tLjmp9egkI=; b=YpDJ536pfoq98EYPVsiHmKZV53
	mVl+beQFpqIXGWyMT0vv8x49t5/4fZI+9R5IFYhcSHqYarbWzFqR/8XQxPu9HZklodjbMqBgFSKkg
	m8PPzjTq2ln/9WBlDMqPfTOpI9lxS5tOBZArtNJLcqGn+5CeenKmHcMDQdYNUqpNb1YLRfwKU4rBn
	BLxAisgTTBAItSHqMsr4SZov4PVrgxFdAG9ThYh7AdkrRGgPNm0Qg4xYQ6vNZGNRbwqNvIT/JLdv7
	pEsIjdXIlm47oNGErDLsRH55Yi3/kAGz9ygcSZTwZF9NDufTEuHWAmTpyPAAaFbNUZgPnSgcmmxWe
	KX5/y9SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysjY-0000000BxDY-0wLz;
	Wed, 17 Sep 2025 14:02:08 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysjN-0000000BwxE-2wPd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:01:59 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lG79bLh+cxA30eAnxMz9ar91cT1e7icm6tLjmp9egkI=;
	b=WHYnPho16WVmazVJ1lvT3HGDsshx9Il8OAkuEolbruZh4Ny0d4KSgQPTrq7enPUrIyvXCC
	3mu46hnoLdcaOP6QXEzeP1/bOShp0opEtnwHpLE4Ndyjl68sHzseUiFuPNf92OMy+MpkqN
	CCbaS1Kk+k1/yjWNxoCeytp07WVbQXoU1AO8yNsQNSF9p9UR/0fwSixfLh6WpfSXW793AS
	Jx9IDy/pNxy4UHsFERSUkcPCeuU3F4aa1Wb6xHVE9K4O34Q2+jaT+jI7c5msj0EChcPEhT
	G3xIwG10Gv9auSwUQ9Sgt5PJtZsYqgS0BuDBCHnDO/Nsp4vdNWxcoUFz/UGJBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lG79bLh+cxA30eAnxMz9ar91cT1e7icm6tLjmp9egkI=;
	b=TVYdGpoP0Rd1x9/Emq1moJrVednuB/6nvs8Ir5jF43pXIjfVt5hmggh0Aj4OSHkxBL15c9
	bnL5C6l7HCoFH+Ag==
Date: Wed, 17 Sep 2025 16:00:04 +0200
Subject: [PATCH v3 02/36] arm64: vDSO: getrandom: Explicitly include
 asm/alternative.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-vdso-sparc64-generic-2-v3-2-3679b1bc8ee8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=936;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=KXRCejb0NgpV0MbZE6TVVMP7UCeEr1qQ9jIjqhoS2Nc=;
 b=mYQ1H32ThBFXyyewa3im0FkaoCNjktKf+s/th6KEedWb5FldnJ5Cb2QFQ45WStq25QjVihVSQ
 OBAwVUiLvrNAFsA6CI/2VHgC+d6ew7CGbaw2FV6OhhoxxUG+0o2HKdf
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_070157_877489_6F83C323 
X-CRM114-Status: UNSURE (   8.79  )
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


