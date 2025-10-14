Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A58CCD18C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 06:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXnY5RDni4beXSbCleFNj0bRZgRx9ddsylJ7nscxaEI=; b=hd7xnRRVadGFvwIEbgTDcj6wTJ
	jKYHvzT5veZAUUw0LPVw/MzI8QjJQ23qNjX5R/+S3GjO2/cVXsmyq0vIpqkX7ug6LOJiaNz5M5Ghd
	Ui/8vqoAqrj2qQo4E3fSVH2X8pLn2U78VZa62k5R2P6DAjVlkS407F3arTmzb/xXjULBed5++X2Lf
	k9St4y7GKhNLI7DzRW6rVAZVUa8YtRPd5N9auWqhITiDmg1SWW7OY4qVEro42U+y1QkaVIe/CyNVU
	yVgGXpoDp69GGXgEvf0vPVn0nKFkXpwjrm4LZ4f+7YzpB17xDO62bkuIfOngc7VC/oQZSBLY2N3oP
	LlxWnjNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Yqt-0000000FKAn-0oq7;
	Tue, 14 Oct 2025 06:49:43 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Yqa-0000000FJh4-2nJX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 06:49:26 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760424560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXnY5RDni4beXSbCleFNj0bRZgRx9ddsylJ7nscxaEI=;
	b=ZQ0CyCv1WenXTHgZMKp/bzDmotlAcjP5bsSdAqA/LXlpr+FAjTg0nxel+makNXbfIneARv
	HuyT/guyKl0HzZD7zgtTTmsDBuuPis3abU0QfakQUh57efHQRg+FiJ6FvSXBeqBx6zRobR
	rU36ouOPur3ypyyoMhYn08Cw0yeVs3eKclUryWubUlukrIeTj0/FBFXRqL0C3+jMi/a9k0
	X078Vih9EDYeonFd83wbK0SpFw+40tACcGrCIMKKqNanOzUavjgns2y0NeefraMc6KhBX/
	y59GsaINWJs4XtTbiRrZdsIwPhhjja/eA+IdQcEFZKAooj1wEwLVE21Oc0wgKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760424560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXnY5RDni4beXSbCleFNj0bRZgRx9ddsylJ7nscxaEI=;
	b=lLzILQ6086Ns9BC3W/cwSHPVvrTh305P2V0mKp+PzeSEbKKdm7n1fd0Snjt0N9cgrKzY1z
	rhXJTpTBro2kU1AA==
Date: Tue, 14 Oct 2025 08:49:08 +0200
Subject: [PATCH v4 22/35] vdso/datastore: Drop inclusion of
 linux/mmap_lock.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-vdso-sparc64-generic-2-v4-22-e0607bf49dea@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760424546; l=869;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=T+uiAGc1CKmq8YVTkteEEzyKwhHBee7QKhXDO+NLJos=;
 b=03aN3q85VKM+A/8EJFoM6MGLfUSm8KAL+rYYl60MFXYALJNsNTZWO+3qq6gCMNS4G7Qdob9wN
 ikNxdnMFJIiCMshc2FJygl5nF+NQGnjZoaNd21066E5BOXNtCNLGw0n
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_234924_879135_34E93079 
X-CRM114-Status: UNSURE (   8.89  )
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
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
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


