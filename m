Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6787FEB363E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 07:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stPu/Pg7Gwp256syBXoA2wyw5RrUxZ2jR6oZuDBIiJo=; b=pKys2UpsGVDcyTYXSMMx67cu9h
	ov15YwFMEItz9PQkJN30/ThkkkE1vXitmd64u7Q9XNFfP1jHz0wFCJl7J8qE3AtsXnzljyaRZCTuE
	1QWCizNkPJcJHIhVoFlAwbxAVoXx6fzHdCKcw90TEZmJjkX1KiH5OGSnUC663LfD7JrFqzrJwTnJ8
	JnELTGDzSI5zvGFhSysiytEhYZS/htXcxRGcf9NPwaCkZZqksOe4lS1rdGkooFUBGvR8E+ExLk2vl
	/jRVD/yyskYmoZp+UZveGquHW8WidiSW60zKzv8XfFhgCrr7+cITo5/GctNoW1nge4xT0n4j1BFtD
	TGLG+yBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgz3-0000000GeQX-07GJ;
	Wed, 04 Mar 2026 07:49:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgyw-0000000GeGZ-3MkU
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Mar 2026 07:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=stPu/Pg7Gwp256syBXoA2wyw5RrUxZ2jR6oZuDBIiJo=; b=QRiZlkKklO1XZaNKt6g1tnvlk4
	VfJKXx8EsLQR6IQ7/lNBuPgtsozdVHmcnrVf9MuEWcUGcI8PWywSQBQfYydEfN6anRCsS4Dtg3oqm
	IAKsmqdAjQMnVD/AVahKs+oGn/AJyOBf228Fs70Fskywp2n8Rl5dSvX47Vi20Kjd2esX7W8fMq4M7
	HbLaSl65c5AvTCOf3JhGqLcMYprPBMBs9GYMWidQtTAfrauRI0tQcX9h9xFvJ3muy/rAV1JEtjhIE
	EjXvXVg/4cCOvbSHvCktBrJ7dQYyCCXEkXMSyXes4qN4JIlLLXTLVWP6URRh2u1MkKDbRUHg5140A
	8cKURZBg==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgyt-000000042ZR-3nt2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 07:49:21 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772610558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=stPu/Pg7Gwp256syBXoA2wyw5RrUxZ2jR6oZuDBIiJo=;
	b=TUma8354NtDFrG+4mvtIyyxhQq+HbNOuW6P01b3HFq770OndKpi+KVGQjtmVZChDoJFHtO
	rUOAFUFIPaIf/I2+EMWQxhXlSF9RZaQQaQJsfIvxMaeZVdX5F8x+Vu5qrRs1QNSlmRbxXL
	xdX6cHqBHExnQzax2FZNXtcQZrSQ3JXCja5BO4C8fQ4jxbazWuPWYLlUAG1HOiM3FTIz8G
	c8QTT+NVgmeQjWAFu6XPRLH6xPEnguKx+eYf6l5C9z62UeGDgdZfPd+jkInI2Z84B41Slr
	7Z6S1bJi6Ay00ofBeqckEJyevjsjaROkKkvBwaE5NcOGCjfBZtVsWdT+FE+ncw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772610558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=stPu/Pg7Gwp256syBXoA2wyw5RrUxZ2jR6oZuDBIiJo=;
	b=TA4XhvsBc/Q0Yq6jgA1qHBG/SEgChu3ZoC5WbDRldbPdXp9yt2MXZe5nFO1AFXq5csFCDJ
	owQS7zApkrMG0UBA==
Date: Wed, 04 Mar 2026 08:49:11 +0100
Subject: [PATCH v6 14/14] clocksource: remove ARCH_CLOCKSOURCE_DATA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260304-vdso-sparc64-generic-2-v6-14-d8eb3b0e1410@linutronix.de>
References: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
In-Reply-To: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, 
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
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>, 
 Thomas Gleixner <tglx@kernel.org>, Christophe Leroy <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772610551; l=1674;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=9TopgYtPeKt3Ys7DxpwdywNMetiSuLHZh2lbdA88NxM=;
 b=KDIxPtrm+ydN9kSM9xMEmIzwIYBDq8jh59lJNtxjYHfiL1HmOTsC+gGTurS+pBQQ1s0H9GjbY
 onjpu6/WQ85D/1/+V1Td63v3IXx8HzglV4KTwC/Nx1uzM/E1ZG66gs4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_074920_127089_C9A52E4E 
X-CRM114-Status: GOOD (  10.26  )
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

From: Arnd Bergmann <arnd@arndb.de>

After sparc64, there are no remaining users of ARCH_CLOCKSOURCE_DATA
and it can just be removed.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: John Stultz <jstultz@google.com>
[Thomas: drop sparc64 bits from the patch]
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 include/linux/clocksource.h | 6 +-----
 kernel/time/Kconfig         | 4 ----
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/include/linux/clocksource.h b/include/linux/clocksource.h
index 65b7c41471c3..12d853b18832 100644
--- a/include/linux/clocksource.h
+++ b/include/linux/clocksource.h
@@ -25,8 +25,7 @@ struct clocksource_base;
 struct clocksource;
 struct module;
 
-#if defined(CONFIG_ARCH_CLOCKSOURCE_DATA) || \
-    defined(CONFIG_GENERIC_GETTIMEOFDAY)
+#if defined(CONFIG_GENERIC_GETTIMEOFDAY)
 #include <asm/clocksource.h>
 #endif
 
@@ -106,9 +105,6 @@ struct clocksource {
 	u64			max_idle_ns;
 	u32			maxadj;
 	u32			uncertainty_margin;
-#ifdef CONFIG_ARCH_CLOCKSOURCE_DATA
-	struct arch_clocksource_data archdata;
-#endif
 	u64			max_cycles;
 	u64			max_raw_delta;
 	const char		*name;
diff --git a/kernel/time/Kconfig b/kernel/time/Kconfig
index 7c6a52f7836c..fe3311877097 100644
--- a/kernel/time/Kconfig
+++ b/kernel/time/Kconfig
@@ -9,10 +9,6 @@
 config CLOCKSOURCE_WATCHDOG
 	bool
 
-# Architecture has extra clocksource data
-config ARCH_CLOCKSOURCE_DATA
-	bool
-
 # Architecture has extra clocksource init called from registration
 config ARCH_CLOCKSOURCE_INIT
 	bool

-- 
2.53.0


