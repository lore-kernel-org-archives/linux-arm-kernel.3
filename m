Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D16CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iD5XRAIh8ZnG5RNR+0CHEjQTjHzJYwsVX6odeQU8TkY=; b=Uliaxos1+KmEO8ljmqOB4gRZuj
	QPdeZrfFrgWlVQc6LPRUP0qL7x2WutfWmzC79q6k2VyM+hnvzPvPGAJrg948IDzLiQ/b6zoP2Lsuz
	TvJbARgLMg4Ahbgn7TAdRRpW1myADu3a+T30k6iTFh4eFnBusgEfnRZgTCQZJbDmES19NcAGASegM
	KqtMuSr1852qNQF8fcCPP9OqWpPQLqyjKEadBFgvlSq73pnCIe/otCaa5dxlBzIOqEnl+r21oYOXB
	DPuaiyGNcfHeQCeZxb+XJf5agc5LyjRY5txfmkhU2WIXBtyiKV/EHVdRj9fp3uAkl2p+K74SsM1k6
	Rt/boKig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyskQ-0000000ByaZ-3YcW;
	Wed, 17 Sep 2025 14:03:02 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysjb-0000000BxHO-1ljw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:02:13 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iD5XRAIh8ZnG5RNR+0CHEjQTjHzJYwsVX6odeQU8TkY=;
	b=Fv+oJLZudSYYx0bKw3Rs8g4CNOG8TApAStMsQbjBjfOoOee1yYJ0a6qrkX6MJTdSoWHaAK
	QD+wmyYbK+gKiXYLJxk+WKuzCV6uHoCH8xXfbfANikSAwfRvsV7Wr+6x8rlGYJPv4oO9Eq
	Dh+UWkNzbmIGMBIL2ufc6/VO+b7toRgMPeYk+H+BmI2UFvm1yZwXSrNvFDLdTc+wLU9IsN
	MbMQjrs1ffkLuamKdo/n3CqGYIVzODCeTOKjsKLl5QYNu14ETmj4Lg23YOpjENF5iU+jxx
	BgQYKyAhAE0N1UNW0v5HOcgY3CehjETgZkQfmBJGUCr8zdF/wQs+pIE1SJD4WQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iD5XRAIh8ZnG5RNR+0CHEjQTjHzJYwsVX6odeQU8TkY=;
	b=H+/D/bbAGIqMUobSU/LyYlPC/D8u5ZzXijCtLrzXNcBiXxMNtlpDzVIVuyTn7WaMKyuujc
	4rL4w1DugwGV7dAA==
Date: Wed, 17 Sep 2025 16:00:24 +0200
Subject: [PATCH v3 22/36] vdso/datastore: Drop inclusion of
 linux/mmap_lock.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-vdso-sparc64-generic-2-v3-22-3679b1bc8ee8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=767;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=AbqD71g4iOTfOxEE3MjW4Dru2mugsjt5pocRndo4f0o=;
 b=jsqBFarezTjaKQ5mFQ58J1HNvxhOpJrKM6OIEXgDaDP5lqUn/+NOGqhdw7Tgx8DyJjJZ+B7RE
 8pgtQexE13iA2r5BphZq5aoH/AuZ+0U4vgHB+jrfVycDFPQ1X9311hQ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_070211_683409_4835643E 
X-CRM114-Status: UNSURE (   8.74  )
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

This header is unnecessary and together with some upcoming changes would
introduce compiler warnings.

Link: https://lore.kernel.org/lkml/20250916-mm-rcuwait-v1-1-39a3beea6ec3@linutronix.de/
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/datastore.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/vdso/datastore.c b/lib/vdso/datastore.c
index 2cca4e84e5b5e7686d6a2b42b41af4f399cc5261..7377fcb6e1dfe31d02ffcae371fdf9da069ae4c1 100644
--- a/lib/vdso/datastore.c
+++ b/lib/vdso/datastore.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 #include <linux/linkage.h>
-#include <linux/mmap_lock.h>
 #include <linux/mm.h>
 #include <linux/time_namespace.h>
 #include <linux/types.h>

-- 
2.51.0


