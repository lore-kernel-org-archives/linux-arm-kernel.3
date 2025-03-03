Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D3CC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 11:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uY4A0H+/yXHEBsdmbGCdTr/QiTwADD1cYzSVXD6cRGg=; b=XlaQDzBX0sTYbrR+qwqzgb+qmG
	6Iwcl8fxo4ixHG+CCtCXyFDFIDBwZ87DZXAbsY5CrH6P/ClDKydniAxLUtxT7GZHYoQ0MqHpQIO5p
	3vbGzFGHzhiyjb0m4nhO2RUSZZuEIrexBpOmtx2LyQ1goIGKfmQ9GZV26Z/W4hUhMt5nFh7zhymH9
	AQy+r6EkyeW5hinwAKceaNewt2NmY8bQsaFetvavTk+ctRJnAWnhrx/wAj7lBK7QaXhfBVspEPi2I
	rPM40HbgUYR+C29iZBUM7ubKT57zkv8JJ5S0H8NcFwiitIhwtKhSe7huiaBcO0qCHy+Y16PXQpuQ+
	k0Tn05LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp42I-00000000Zok-260R;
	Mon, 03 Mar 2025 11:32:38 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3hX-00000000TmC-0hSZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 11:11:12 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uY4A0H+/yXHEBsdmbGCdTr/QiTwADD1cYzSVXD6cRGg=;
	b=2En2gryv8KFjGlwpTPafhFfDRNSmhcpEmGQwq4W1X7xGPlQYEGfajgK4J23nkcTFzAsH3G
	nerhaf4T8jW/arCzkNVebRrc38yLVH5FsQp8gTCI0Y5Zz2yQdXK6bzfq18+x+qSd85H881
	yDFM0kX98uWCtQinDsrdW75dsCehjZahArgBH2ODjHERe7NpIfLTkdG8Y0ejPtI+cwbK5y
	wC2p9FgP76oe+11PqrzQAnJqsbZ1TUHoP8trE7DEXNSjW4L26zpyRlMOkzd1VhH8ocEiXE
	SH4zl5jNdRNhxKoz/EtsTDyC8/Im56SYE1emomuTD7+ZMWAVgSFPwAzMO9B1sQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uY4A0H+/yXHEBsdmbGCdTr/QiTwADD1cYzSVXD6cRGg=;
	b=fMJ9NStByy0aoH300sXCDuvSmTKmPwN9oRCy+0LoPVQKid/pIMStDs5YY5V5hqyqvvSvkh
	RgcXpGDAy62Y4ZAQ==
Date: Mon, 03 Mar 2025 12:11:04 +0100
Subject: [PATCH 02/19] arm64: Make asm/cache.h compatible with vDSO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250303-vdso-clock-v1-2-c1b5c69a166f@linutronix.de>
References: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
In-Reply-To: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=1100;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=qO63nBGsfFZGS5UvPElZMjXJL0LBJQSO8+qHJeKx1PI=;
 b=EaqHkujR1rhytCCyC8BgQ0toXrLScUCDuVyGkAIyqqU3O/xruMDXNDdz9/q3f+NSwc3DVeTt7
 ZebywgTu1j6Amvsjq9J9UOSZovWCSoRrcwqe8z8X/2EK+MCrQmt4c3V
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_031111_346384_887A0CB6 
X-CRM114-Status: GOOD (  11.74  )
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

asm/cache.h can be used during the vDSO build through vdso/cache.h.
Not all definitions in it are compatible with the vDSO, especially the
compat vDSO.
Hide the more complex definitions from the vDSO build.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/include/asm/cache.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/cache.h b/arch/arm64/include/asm/cache.h
index 06a4670bdb0b9b7552d553cee3cc70a6e15b2b93..99cd6546e72e35cfbceec7ce0a0f64498dfadd38 100644
--- a/arch/arm64/include/asm/cache.h
+++ b/arch/arm64/include/asm/cache.h
@@ -35,7 +35,7 @@
 #define ARCH_DMA_MINALIGN	(128)
 #define ARCH_KMALLOC_MINALIGN	(8)
 
-#ifndef __ASSEMBLY__
+#if !defined(__ASSEMBLY__) && !defined(BUILD_VDSO)
 
 #include <linux/bitops.h>
 #include <linux/kasan-enabled.h>
@@ -118,6 +118,6 @@ static inline u32 __attribute_const__ read_cpuid_effective_cachetype(void)
 	return ctr;
 }
 
-#endif	/* __ASSEMBLY__ */
+#endif /* !defined(__ASSEMBLY__) && !defined(BUILD_VDSO) */
 
 #endif

-- 
2.48.1


