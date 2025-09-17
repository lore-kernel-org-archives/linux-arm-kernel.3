Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F027CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PxhHEOEcArK+oJF4kg6dLM0PhcqAsLM/pkrtwhzyU8=; b=ihFQRamUMCfeKCtY39m51bMDmA
	bOZmZfsbs8zS6jpZW18wX/Wbo5cBTd2XmqwHBNGGm8DO/pl7UsyTnkRJFsJDq1M2QhC6vFtjw/rMh
	ze2AqIWgZS9ReQFrKnWIl8TzKRTKiWJ9TTrTLUpsvjSlRp0fjfs/tUiSDIhuHXHMXk0jfo8B5u3De
	MOIoN7Ads6JPVHPk9izujmlF830XFtvY2AGeCctK/xPBQ/Hgu8XoGaUgYg3h62+1PgkcgmZSan9yV
	XrcL/0QBnBRow81o6kmzaiIkA8eRCe2Efl5f8zkYMyNaNUtz/lGVOeqZ9FKkoreGb2+lYLUvwMfav
	x9uuJ+ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyskQ-0000000ByYy-0jl5;
	Wed, 17 Sep 2025 14:03:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysjb-0000000BxJ9-3QQ1
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 17 Sep 2025 14:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1PxhHEOEcArK+oJF4kg6dLM0PhcqAsLM/pkrtwhzyU8=; b=KBt6OlYijAjRxCij/P6l5J9ef5
	0A1fiv9mhDH8+H2I84IqzjcrJC7Ez6OaOB2KekLX3MQ/Z5a9ks0vSNC3/0RcByB57r8XX9h9qex4/
	xRZfAfe2gEgI4RP/m/AUZz7uMH/iWm413yHdQfTdd7G0aDYK9veLFk/pb5udURP+AHpC34jgsgkEJ
	0a+i0kK9gGqp7+qjMEQJCqwCmD3DbsVZOLczyrZul1918EH9qPwSBNQhxyObcYgvp/8B8DkkXKQGD
	D5fcoNipcJ0lJshChsJmsIVFpkj3uJpQiI98VmKkhIb81JxwQUIdPM8KJrDl1EikJVSWKyB9RmPs/
	zCMd0sdg==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysjV-00000007Opf-3msC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:02:10 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1PxhHEOEcArK+oJF4kg6dLM0PhcqAsLM/pkrtwhzyU8=;
	b=KXVTzeB1RPlsTnQnJRl4Ug/KrfPZsvG/7GefSlXXdGzZPU2NWXWZ17UXnyYbJHVTLIBzF9
	xNqD33IxMIKd7qFYt/QyaJ1Cz1lV2HTsa4C5s2I6+cc8GaevZZX+rs1u3jHp0whbosvwwp
	d5Xht3DZB8t4GHY/QLVx3hf2DF2wBaKlUGJskffoX6UbLkn/0N6DOOKyJ0CxsJU8IQzGR3
	orUos3sGWZKnScCfAePyINI4o3Q0ovHjipVFdnmmf8Evq4qymgAy7/zHz4pKjlJYUEeDmu
	C4/SD24nM2ZWV/Udhmy4jj2LhD1tt0xjKwYSl9HLntnMHEz7l/EvaMSsL15X0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1PxhHEOEcArK+oJF4kg6dLM0PhcqAsLM/pkrtwhzyU8=;
	b=VdooGNZAtBORgp2YaI23hG/2RWG+89fRKztgrKPnovVzmaeSHKfMDq+ylT2vPWPRKLlLOp
	HSJLLkewZKoJmgCA==
Date: Wed, 17 Sep 2025 16:00:18 +0200
Subject: [PATCH v3 16/36] random: vDSO: trim vDSO includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-vdso-sparc64-generic-2-v3-16-3679b1bc8ee8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=679;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=RsrUyYXXhTUZc8iIYJpxbMPkDkRzyWPj4riAorZuqSs=;
 b=SgvOer3x6V6AsfjzAtnHiIEePa9HZbBySOmMf6JRPwGbZayEPl64z9BsrTOKb6v5I2oPrFKbb
 SdbYXypoVe+AASSQki04oVLoyanPliIPxU+NfCcimpnqM8g6PtscQTd
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_150206_157020_700860A7 
X-CRM114-Status: UNSURE (   8.44  )
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

These includes are not used, remove them.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/char/random.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index b8b24b6ed3fe436c8102968392278d5cb5544f06..3860ddd9527930780d5c13cd4742fbc3c27acc42 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -57,9 +57,7 @@
 #include <crypto/chacha.h>
 #include <crypto/blake2s.h>
 #ifdef CONFIG_VDSO_GETRANDOM
-#include <vdso/getrandom.h>
 #include <vdso/datapage.h>
-#include <vdso/vsyscall.h>
 #endif
 #include <asm/archrandom.h>
 #include <asm/processor.h>

-- 
2.51.0


