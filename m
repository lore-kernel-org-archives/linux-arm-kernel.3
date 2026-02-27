Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8B9FD460C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 06:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdFUUlU8YM0o6VyeNKRzp/DOfUbD4WRTS4ygszyQZTo=; b=ITLIncb8Dk5aq76Aza91sMZGPH
	mtplp08RxvR2cINxNHmxUPBuEOdsyNyyViyqbExzRcenS1UOMOB+p9TdXaTKQuFkpZhxkLfUbZi0u
	ObA+XWp3y0ptPHIjQpbFZZkc8bYm5J1OF3H+h1lahs7Ygu8dOo+hP9Tx5R2W1VgcVbjO51EHhtQtN
	35xs1PxtI0ZMh6EN2lA5QrmgDF+rctWhZLOeuCHzR635G0HKb8PLUCJq9I9VWCNUHm1X2kKExK818
	Y8HBnUIeAQn/PHlImCae77RygtOwgh8pGN0ITeO1mscSErj1EkDXLo4w/Z8xxxz4bKlw+cOaAp6+z
	PCXEE2Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvras-00000007nnF-2Q7D;
	Fri, 27 Feb 2026 06:44:58 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrai-00000007nfd-1Aym
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 06:44:52 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sdFUUlU8YM0o6VyeNKRzp/DOfUbD4WRTS4ygszyQZTo=;
	b=acXbSzclUrurp80PG0+fAyoUBWKSjXDVZqaEtoj8/RVPP+PLjt3GupUBLm3PILwGEDcmm6
	gmWi/+1jNyzdF+2sua8Q+R95D+RDd3PHW9wP/4vFUakNybRw4IJmUwJIuijbCOSu8qrWuC
	OX+b2BWAsQKuMCRMQraJ0m1p0psP86UgWSnAvf2UvZmmZUvyySDN+iwvZpY0O7r2/ZDwYK
	FCRfX5Yn8U/Oe21BUkcqS04TcsqWWw55ob8FZySl4dTnorTelm0ROWW8EfBvbTq/LkKJCt
	RwzHhuz634UZB6QRgbh3Kd9qbhl0kRB5IWvHp9LGIgUEaY4UM0fUgGGEZ6ifXA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sdFUUlU8YM0o6VyeNKRzp/DOfUbD4WRTS4ygszyQZTo=;
	b=64N+lwSNZac8Cf0Ey5PbaJQV7uGBG7blCdI+GkkIljVqGkR9CCp5iKvDa84caXy0u2IFPj
	MXM396HbFbJ2o+AQ==
Date: Fri, 27 Feb 2026 07:44:28 +0100
Subject: [PATCH v2 02/15] arm64: vDSO: compat_gettimeofday: Add explicit
 includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-header-cleanups-v2-2-35d60acf7410@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=973;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Eaw7e67Q2te9EZvmR96CdfmDp1KIfoTuR5UbP8dxulc=;
 b=3OuahSNReBiPRuqoaLBpLN/JEX8iDVn/BcKBSiE+DA//SxSqiQPPogs7Z07/0DvpuO59Q7uZF
 J8H2ZtJgBREA4Y4SXfmQMnWLVugQZQSFq5ODdBR0W+0eK3JdfsNyOwv
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_224448_494024_234CC3F3 
X-CRM114-Status: UNSURE (   7.63  )
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

The reference to VDSO_CLOCKMODE_ARCHTIMER requires vdso/clocksource.h and
'struct old_timespec32' requires vdso/time32.h. Currently these headers
are included transitively, but those transitive inclusions are about to go
away.

Explicitly include the headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/include/asm/vdso/compat_gettimeofday.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/include/asm/vdso/compat_gettimeofday.h b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
index 0d513f924321..a03e34b572f1 100644
--- a/arch/arm64/include/asm/vdso/compat_gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
@@ -7,6 +7,9 @@
 
 #ifndef __ASSEMBLER__
 
+#include <vdso/clocksource.h>
+#include <vdso/time32.h>
+
 #include <asm/barrier.h>
 #include <asm/unistd_compat_32.h>
 #include <asm/errno.h>

-- 
2.53.0


