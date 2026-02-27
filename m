Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E3EFD461F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 06:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtU5hK3AFCtp7e7ArBuMhyX7A6DwHWhZv3v1MOsSUw8=; b=zcpB3h37509ukqqf0D5yIwTl76
	24Fyz+5lknqyfDOtY/MjK/QXJIT4WhkgGHoWNko1OATXR0zRdszcs77anJZYmUHfqCm8vbhQTRceB
	Jc9iLa2PTshvrLpJnvk/VvOXyTVX+T0fgoBd+RHfE7jT0Tx0MQA9vYYxzdAZoUwlVsxh9Qgf6y44I
	PgDFKevs4NtjtePvZ0FW31oXUBsR+gnKfC/58sQCydpaIqZe/kUuDXoWIJToC8k+4hOXuy8xOvcjY
	ZUT1CMM2L1WHek2BMW59+0x98y/39vXRqOzo1eSwnqeOwgMYxckeOG0UBzDcmgHuBOeajn/DRkHub
	eabm7HeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrau-00000007nq8-0rZy;
	Fri, 27 Feb 2026 06:45:00 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrao-00000007nhn-0JYT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 06:44:55 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wtU5hK3AFCtp7e7ArBuMhyX7A6DwHWhZv3v1MOsSUw8=;
	b=JXAhG55Ye9xFA2tmKl7w6J4bqiKAv+vQ754S9WErM0VRyY3ANGBjK8AASP7xwooWFZ0Jn6
	o4Z4SPg7f7GdqkOYQ5z/Rn+MbKeNV4SCt47FNYK9tWE7DfNkCmlRkLQQ7aFOve9E3qnxm8
	jemC6tzAZuw5/ZMf6vAASYTukTZ569XDrYKGLOpBePlafepqe45YJjSgWXgIqFYsCrBbTY
	TmmPFf2N2HIDJQhthOu4yXAhXoU0pMX1LhDgaqXe0FCrJHZKZXGe0m3SaLh04KmnytBx2T
	3qKCcKdG1QaQou69/dMRg3TsC4MigquS484EO+uWk8GB+okebf0WZVCa+R1KJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wtU5hK3AFCtp7e7ArBuMhyX7A6DwHWhZv3v1MOsSUw8=;
	b=wmHm6p+dnm1/6UlQnhYWe7W3upLKAxVWFiiGhGzDo+78/bwR9mXpX/lAd/KTZRW/vZ7Iiy
	2qZjG7dDR6pJ+vDg==
Date: Fri, 27 Feb 2026 07:44:36 +0100
Subject: [PATCH v2 10/15] vdso/gettimeofday: Add explicit includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-header-cleanups-v2-10-35d60acf7410@linutronix.de>
References: <20260227-vdso-header-cleanups-v2-0-35d60acf7410@linutronix.de>
In-Reply-To: <20260227-vdso-header-cleanups-v2-0-35d60acf7410@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=905;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Z1rsUOjTxHpAm9idXz4lwom94XpR6Wby8PI4ObfdrdU=;
 b=/ihgwmqVGHSXOW2w9sDXnfI1fc+/Ms133fsL8i7XjeqF8wz/6chK3CLXrDji6enZnSnVKOJLk
 t/C/jHA7n8cCVYeqjm96zLj83lq+i7NypNhfwXehHaxlv/KRJlhOUMu
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_224454_289114_F8F81205 
X-CRM114-Status: UNSURE (   7.52  )
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
index 4399e143d43a..73b079eb4511 100644
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
2.53.0


