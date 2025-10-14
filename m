Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3510CCCD194
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 06:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p12DOEBsm2e1glAtpDY9DYaMx7+CHoNdHdo/bDc6SLA=; b=AFgXg0KnfwiYuIXQztl1GT2Ojx
	uUhSif/ub843b6Y27chogJlHNLBLDXE7rFZiufoJ0TIsCg65XJKnz9Ne44ubHXaHhhmlRn9OdjZFL
	uOrd1KhfNpRQcnjvh/elXKB4LFHmdJLxUeso1xSeE+uQaE2wQvCCbSCIFoxkJi7eGEkqQ2aXk2+NJ
	XjnZEQjc6B17zVlVg9UWIOMxi0bhKyJt8K5tQ8NEETlcMbiV+KpMo/3gILM5lFDGACl7MQFIwj8de
	1iyY2VccnLlLTeEaOcVJRUhIiVHPGHk0jDgfUbcFtK3KEj6pCLYhGaJfFAfpWfcOo5/U0w2ECu9Qs
	8kj+9/Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Yqg-0000000FJrP-073l;
	Tue, 14 Oct 2025 06:49:30 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8YqR-0000000FJUn-3s5i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 06:49:17 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760424553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p12DOEBsm2e1glAtpDY9DYaMx7+CHoNdHdo/bDc6SLA=;
	b=dhEocdc7MY+wAPpet+cbdtegsWJY51zdZwCGv7shBqji5WpZmFrJmAPX6Dusv+GQwmr8uU
	AwBkUzCS6e4V2yUtIqLOdogpjy8npAqnVM011Nens68T8ELDfSJ2VXuTSgJS57rp2ejCni
	p36WsbSxVcQM8cK+IoXmOBdCEcE58bcPhnAA8zMo5wcUS/X3lLO46Pr75KL8yZ9LlR3Tr4
	WBHLMSQOw9E9yB7gYea4F3IYV/+ZJ5Atu4drXrUsYP7GiDzkvHZhf1tmS3dzebv6hdU00g
	aNgQpbC4UyRU3Ru72VI36Jgmc31qH0LAYkQAJ7FX9XwJp0a6OAtkSLUI2rXSSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760424553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p12DOEBsm2e1glAtpDY9DYaMx7+CHoNdHdo/bDc6SLA=;
	b=iVLWTrB3MChLTuU1QKNzEkFFDGAbH4ZWC9LNbSzce/XnVoWIdnVU5CVvWv4jz6UKfncLDt
	/rO5Q1ptt8Yds1CA==
Date: Tue, 14 Oct 2025 08:48:58 +0200
Subject: [PATCH v4 12/35] vdso/gettimeofday: Add explicit includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-vdso-sparc64-generic-2-v4-12-e0607bf49dea@linutronix.de>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
In-Reply-To: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760424546; l=1063;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=8uLSosIzbxHtrLr9GBprNPDpJ3bKD05UahB9SGNPIJE=;
 b=KEWOQu+l3RDxBz3FEbiSku242I9OTnhNJVA7k1iPqCYrjzxHGX+GNFGJCEGz63dXM5zlCD9KA
 1axQz60n3qlCL3K7WHNynEsBBGahr7d8207LmqQ9Pe6IEm5SvxVjTRF
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_234916_106016_7761F76F 
X-CRM114-Status: UNSURE (   8.17  )
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


