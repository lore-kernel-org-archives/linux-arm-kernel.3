Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17296FD4618
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 06:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Ry4+WibbULZID6m2Gq5rwGN2Xcc8vgpZAjqk8Y5/xQ=; b=brbgKbm6l7PpWt0B+O844TjymT
	I7Akiz2OZI+93X4hHWQI0tqcgxdvZg0GcLBQVLP4axUx4zGH5c8NycMPiu5/4PUmUnwIzdcieUlmy
	l7cxD92bDuPTnwSMoOp4u6KRKg6fOQXQMmAmz8O+uCuTaCieXRCvI90GqflDqYKZJ2es/WT2ik7Di
	H2EKMIqa64uYzeasZv5Ef7Cdb30ZP6oNUd574tlYkMpw3cZXYTomq8agJEfx+/V8ahD6L34pNT687
	hhrqdLJpTn4B1JLfAm+yXLwYGB8lqlL+ubmus7J+2Povuh3/TpoYyBYZ8c9wWUJy1ocypPV+aO9zB
	7VIVqBIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrat-00000007non-2JIs;
	Fri, 27 Feb 2026 06:44:59 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvran-00000007nhI-0ZmT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 06:44:55 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Ry4+WibbULZID6m2Gq5rwGN2Xcc8vgpZAjqk8Y5/xQ=;
	b=stdRMCHRvs0xeu82UFxyQcNCnPhyYkbXy3Fo2ZHSjDbGGRmIU26IulLEEC7iOn80gSRfYl
	JdWJa4E0AZOnDcjiSrIGmMgmTcP8wc3PJKIZ50EAW7jQ04b8tRt5lArZLzhL09e/agJpj8
	a8HGGfHa3tRakQCJKIxMJKCrDMAOI7dJRyJ++8cdaL8uYfUNcMlIXuDixyWEcdURwCnFy0
	a4T+vHkueg/QFZNrYSOn4utqmnjLuvjU2sILDk606jU/7beDwydO9a2/coWViQAsu/eEvL
	2DxN43XmoBlhoQ+I7KiLqP5PtvfHlXbnsDHSMnNph7nt7OiMVS9fYrmKSXvcpw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Ry4+WibbULZID6m2Gq5rwGN2Xcc8vgpZAjqk8Y5/xQ=;
	b=+WnbQ4wr/QXZezkGKV43XZn6mvZwovNgHtNtXxl3JgXt8BChHmKwcgG0Z9p9erF0KkIOne
	6tGT4Q4I+ksCavDw==
Date: Fri, 27 Feb 2026 07:44:34 +0100
Subject: [PATCH v2 08/15] MIPS: vdso: Explicitly include asm/vdso/vdso.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-header-cleanups-v2-8-35d60acf7410@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=696;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=sy5Iw83Mck3+k+fjmUT3MnQ1D2VXltvzXrUk++HeffI=;
 b=gexqOPTBO4Bt3KN2Hw80+zQ1Dm7PNP5n7sIAdmJPRveo0LnMUuplYuKy+W5bveU9pUDhtjgKK
 pk6GG2m6dQYCc7/5EXtBHbdyeNv2+zS74L0qzV37FLmkASdTF1Xw3IS
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_224453_367776_0297320E 
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

The usage of __VDSO_PAGES requires asm/vdso/vdso.h. Currently this header
is included transitively, but that transitive inclusion is about to go
away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/kernel/vdso.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index de096777172f..2fa4df3e46e4 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -21,6 +21,7 @@
 #include <asm/mips-cps.h>
 #include <asm/page.h>
 #include <asm/vdso.h>
+#include <asm/vdso/vdso.h>
 #include <vdso/helpers.h>
 #include <vdso/vsyscall.h>
 

-- 
2.53.0


