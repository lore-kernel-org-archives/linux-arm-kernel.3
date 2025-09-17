Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA20CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsk6BN84ddctbJzCdXpVCW6zIirY84u04vAdSBECnGM=; b=D5T3C4NCAgSH0NiapmbaJxPSmK
	s25tVLGVCNf741VmMhpN9v1m+oNWQyE/6OBbyiH9Hx8rFQ+7BKhjA7CFsmu0EpS/TvFPjNblKNP+a
	5rd6Ens4Q5SbQZYuC4rf24fPBEP7RaxL4K3MwZDsuT1clN6hqpQwrFW/HNjECLV2MLPZgnLphAfIu
	TO4a8Mvzy000Wo1gvHPx3ogoXxOXw90qJqxYwNQvjZG5+mlils+gwCWQ6n4EB28rxgYsvlAA6smfD
	xS5WNwatFItQ/HHcQmNmZQYJ9QpoNx0XrGbxHn/gBGDwJV3FF+y5Ikl5mqDHgh/o3NJMSTQPHiIWc
	vdRYkJwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysjd-0000000BxPS-2VYL;
	Wed, 17 Sep 2025 14:02:13 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysjS-0000000Bx3i-0PG4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:02:04 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jsk6BN84ddctbJzCdXpVCW6zIirY84u04vAdSBECnGM=;
	b=ZukeN87klDjExD8slld5JQxyV/SN5xB2qs079PYdGp0wJLbsXzMLa2NocQB9JjhyT1Qz6M
	Nm30pEwq73gINM2HjxuJB5ck7LMh5tGKUQaVlA+qu1j8FYUWlNugQXsj6lvOYR2zQ3kZqo
	+RhBmbp/s5Mj6YmGOGy7k4W4/mL+kfCoHIJJgqRVi1qlfIW6+FpVg3F8k5uDGn7ACWQDX0
	jWaQGoeQPU/8TvXTp2ZlKWewZINW4DsuujVXmsurjEbUkJiSNkh2oYf/xaCnc6tHX4EAje
	CE1mWLgStfHXT0fl9e/My1KvIWZqKJapfA6bkfTENKuIg8KlJ83E1xynqiTSUA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jsk6BN84ddctbJzCdXpVCW6zIirY84u04vAdSBECnGM=;
	b=sKh/l4Q5pNZmlbwlVrzbdI4QMLDx74UYZJgtY7s2cKIHdT+XlzwjmO5fJcvmZI7xYmlwnw
	l2sIdtTl/HLereBw==
Date: Wed, 17 Sep 2025 16:00:14 +0200
Subject: [PATCH v3 12/36] vdso/gettimeofday: Add explicit includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-vdso-sparc64-generic-2-v3-12-3679b1bc8ee8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=961;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=XAdu9O1IsR5ZCEJ432tM/8+KNLyEAX5iVswP4BPpgzc=;
 b=GJstkDZ6n2VO/zY7O2rPtlwIbGB0r2uPtwC4OBQMHLRU7UPUNDT8gtrr9XEHeVMru9CmuEfk4
 bKqGS+iljNfCChtYcliMmLQIYgpZGLi7bxoeBRHyilzm5FPgq9ygJlf
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_070202_315331_51AC3F30 
X-CRM114-Status: UNSURE (   8.22  )
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


