Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D148CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zQyKMAlqw8k3oqLgK6HtkrvF0ImRnltnSaL5sRLX+4=; b=N2kGOOVhLv4XqIk91P/RbiW5N7
	JS2V5Q0AnOwRc8Rb6ganbvmYUkiaLEMRNwOc1EIoYjktxR1RFlnM4Ep44sW0a+99AFD/vGNvdX8CC
	OPTXR3VT9os/J/VOCckd1ndqOUhJnWZy7CJvPksD6FQQCewlGlOATBfiQF315XQ9uJ8BkZ7LRQDHb
	vn9SI/aqBwY9x2JNdtIiwwTqishIUFGIR1VP1t7bR8nNN49Nfj3vXeo9xn2Yu32idiROz7vj+4Jhz
	9esV16HCcgleCSsBr7gtQYKipJiohO0QSlLhtCairhIZC96jc8P+xtiCjcisxYlmDMBbtneWA9Dgq
	EzRvh0ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysja-0000000BxI3-2Dnp;
	Wed, 17 Sep 2025 14:02:10 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysjQ-0000000Bx0x-2oFn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:02:02 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4zQyKMAlqw8k3oqLgK6HtkrvF0ImRnltnSaL5sRLX+4=;
	b=JHj9kqTtZUFR3cWtZY7gPuXUU4CZ8futrwVBF9VzSwCF9pwAqfTgfGRu5VY91f6YPkVHxj
	I1lUUcTAwC4zA+F3XH4bE3yNMDgkJMd/mXBDYCs0TrfRLIm55KYb2ksEw4GOK9W0SdLKhh
	Dte28l3FBpdZTEQAop0pJZ2godqgvTg88RZirXvVHounWHiXl0kVUXT/32p4XiGsjs0z8s
	L3gmpMBaI8LqEVSkuBAO9rQWdqHvZBlK0cuC9VdJovudmiZ02nEwV8emU20m0bcUxtTGX+
	DNOcP9OH4NDQd7CJ0TyT49B4owDKUz4QnJ9QL7gohlj3zc3jvgfi6D/9EruIvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4zQyKMAlqw8k3oqLgK6HtkrvF0ImRnltnSaL5sRLX+4=;
	b=81FXpCMgBi24Rq9naMMQLcwodP8iwpiqu9R1BvVCorLiJIpQEXibH2WRSP4Im0EPJ2w1Y7
	ewD/ziPkjhzMBwCg==
Date: Wed, 17 Sep 2025 16:00:11 +0200
Subject: [PATCH v3 09/36] MIPS: vdso: Add include guard to asm/vdso/vdso.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-vdso-sparc64-generic-2-v3-9-3679b1bc8ee8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=970;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=XJIvS4hKYyCqGnzGQlj96dz+6puKI0zqLs0UVC+sM+Q=;
 b=RnyqXMeVjWK5cddJ4pHNKPevtWEjEUBFIi+DE8KaR4t2hdbY6GgqJCStBSmqEIe87u5wkUb9D
 0tjQCoweyBhC9WS6hPpQSgu4UexdyVUa/S3+kMAjO3svskGqbmKVNb3
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_070200_863444_9EB120CE 
X-CRM114-Status: GOOD (  11.07  )
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

An upcomming patch will lead to the header file being included multiple
times from the same source file.

Add an include guard so this is possible.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/include/asm/vdso/vdso.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/include/asm/vdso/vdso.h b/arch/mips/include/asm/vdso/vdso.h
index acd0efcd3d93ef7e71107302a40d24b4b51aae99..558d361bbf80afcdc61538543feced2f8a3c0347 100644
--- a/arch/mips/include/asm/vdso/vdso.h
+++ b/arch/mips/include/asm/vdso/vdso.h
@@ -4,6 +4,9 @@
  * Author: Alex Smith <alex.smith@imgtec.com>
  */
 
+#ifndef __ASM_VDSO_VDSO_H
+#define __ASM_VDSO_VDSO_H
+
 #include <asm/sgidefs.h>
 #include <vdso/page.h>
 
@@ -70,3 +73,5 @@ static inline void __iomem *get_gic(const struct vdso_time_data *data)
 #endif /* CONFIG_CLKSRC_MIPS_GIC */
 
 #endif /* __ASSEMBLY__ */
+
+#endif /* __ASM_VDSO_VDSO_H */

-- 
2.51.0


