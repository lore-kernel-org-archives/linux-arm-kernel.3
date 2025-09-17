Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F12CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXWzH3AvD69Q8lI5Y0llzQzfFSEhsuV9TmtXsx0N6Y8=; b=FcrtHA31DjCOYb7Cb7LjIgn7mO
	DiQNu+SjTI9YxCJe73I2HijIxaKVLrtEkw1MQXzLbztuTCVyJ8wzUmNotuui3Jyl4K5qXhxJAtnF/
	rfnWFdOfqdaqM1ZWAT1fSu/4vTmfsN30HGe3XBySxbye8dcrYl9UNF2q3j7M3GmVQMB1MO+1V/mx5
	1XB4rgmM0IhzjqW5iTh/j6kL74H9/DL3kzDt8J1uYi5iaTru+hGOs635wSwObPctWzp+l/R2oOcdY
	VlWGmEkXcbxYfcAe4dODFNaPbXWwes27zezBBrHVSgwVMbVcs+8daOp2m559w++9HafPZfGYR7KCf
	HEuOpLqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyslK-0000000Bzy6-2WF9;
	Wed, 17 Sep 2025 14:03:58 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysjp-0000000Bxgh-1Zjo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:02:28 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tXWzH3AvD69Q8lI5Y0llzQzfFSEhsuV9TmtXsx0N6Y8=;
	b=WyIEv5kNEj9kmZtWOWeZFCCCY1bKbOwpQLdESGYzHr8aG+JimbdpiPhO+pYGXJ5hXnUmOC
	nkDWFRp/Km9ncq1IUzarC6zSat13sCZFinKSZ6TJ4igvoAyZwcGPLFjc/X4xEPTO3btvvw
	ndMOpmuthbyZu7XIQM7yN5qCw+OiSniKzriW2W3IWdIhqreAChd7jTIp3RkgAMQEdnfo13
	Usp5z0uaapjAvRcSpMy6GjR0JEgkmOnr1+EedQA31VYdmhXb4xyImRuvHYPXAnOTtmZv3/
	OfordU9WHIWzFvZehPLEXkZGw/8cjzTTQnZtmNk7vyesWkqywAm3i6Q42mHY5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tXWzH3AvD69Q8lI5Y0llzQzfFSEhsuV9TmtXsx0N6Y8=;
	b=1Ov3WBkd4ndEaUkbAYesP5lZZeKZBCW6v/dv4t+5HpDa4vpaLTKURbGvN8xeVceJNb0Lkn
	HSsYPzwckq71LeCA==
Date: Wed, 17 Sep 2025 16:00:38 +0200
Subject: [PATCH v3 36/36] clocksource: drop include of asm/clocksource.h
 from linux/clocksource.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-vdso-sparc64-generic-2-v3-36-3679b1bc8ee8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=681;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=z6rw8gc2i+vXaJlg660yiQKhkDkj7a8Qr+J2EFiBq9A=;
 b=RhaONrS37dhEX8d1wSADLLwBV5kdoZ8JXoywKJrRNnTRBnqPjh/4TWSHyfP00DxiPUP9Nzz7Y
 EkydccSCII3B3rLLld2L+tAc2+T/EDPK/KlwsHTX3SAToBbrIuL3HqZ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_070225_802066_F048F82B 
X-CRM114-Status: UNSURE (   8.61  )
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

The same inclusion is already satisfied by vdso/clocksource.h.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/linux/clocksource.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/clocksource.h b/include/linux/clocksource.h
index 12d853b1883265cb47d93e33d8370e3957e7e695..afa03e9fb6f6c978099b33c07ec853b7a82fde84 100644
--- a/include/linux/clocksource.h
+++ b/include/linux/clocksource.h
@@ -25,10 +25,6 @@ struct clocksource_base;
 struct clocksource;
 struct module;
 
-#if defined(CONFIG_GENERIC_GETTIMEOFDAY)
-#include <asm/clocksource.h>
-#endif
-
 #include <vdso/clocksource.h>
 
 /**

-- 
2.51.0


