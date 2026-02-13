Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986BFEF48DD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 07:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3l+yKlSt1K5zuq02BNPpqerY/A2HiaOFFBT0RhhfwRg=; b=bMVgt4f86N5s+E0JnnmlKfwYHK
	WElU7ExAexFUpI1EkVrNKP4K4iogNBie37hCMeqC4HpI6och9H1rzU8OlI8+C+cRikmwfPd/36wc4
	hsJ1Qqy+xCurW2uhvFm7xUjoqMAgPIt58EeXt3aqyA5kZpCmM6ti1IDiVl5HbbdZpn1iKsJSRm2Xl
	1ubt3KxpmiFgfTZT4/RyDupiYMgS8GXpxnsIfGLC8/jnpAvi8Vm3n8f3jnM2b+TdIbiqJaTj8o/Z1
	xki/JM2C3XYG2NJHREdTh1p5ZH7txyVYIxxw280CvnuzJWDQ70vXhLesQJ/ORKrSYbo8OC5/rZ/Gl
	W2FkaU6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqnmH-000000037RS-01Gu;
	Fri, 13 Feb 2026 07:39:49 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqnmE-000000037Qq-2542
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 07:39:47 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770968382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3l+yKlSt1K5zuq02BNPpqerY/A2HiaOFFBT0RhhfwRg=;
	b=Z/4wc4QkGz0WIuiLzDOVoCoDKrlnjYyxKg6VRLl7sxSVwKIkHdxRGhRwCQYWBdXtEhiyhR
	FOeyRWiQBVg6l4H2ubRrNJ/CeGhwyDzJisTQYOjwiRrzG8xfCUGZMLrZyWg0pcY2p/Kgv2
	CBU54JPb6h4VznAdlNsNfjcsQhgSkFQRHSJ3o8abLXn4SPHu1gjpluv/+l5kPcGZMlgJqn
	YchAuybegDA7maBk3Vp6ppjoFGdteiIwo2aCZEjz4ONQBu1l5bvH7LTe7LcviFR5wUdKuB
	fLjfe1A7g/7Sd2bKHHVFiI+rAWttVAFDkI9H7bS1sG4EsDE+mnUaSYy/AOuLqA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770968382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3l+yKlSt1K5zuq02BNPpqerY/A2HiaOFFBT0RhhfwRg=;
	b=IueS1IOmxQxEyGEPQKt2zd6/uqqB4UrVk6i+6dgSx8G5zokptn0E3id9qDLSFR1SNSefzD
	kY6IdIO3kt/9vfCA==
Date: Fri, 13 Feb 2026 08:39:29 +0100
Subject: [PATCH] ARM: clean up the memset64() C wrapper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260213-arm-memset64-cleanup-v1-1-644a9735eeec@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0Mj3cSiXN3c1Nzi1BIzE93knNTEvNIC3WQTc4PENCNjo1QLcyWg1oK
 i1LTMCrCx0bG1tQDVRsTGZgAAAA==
X-Change-ID: 20260212-arm-memset64-cleanup-c470af232e87
To: Russell King <linux@armlinux.org.uk>
Cc: Matthew Wilcox <willy@infradead.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770968381; l=1659;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=j034vrbnVppCVaRqPOZKRQwx40dc39NXjppZYoTZ3t8=;
 b=e6IdjNcnXqRoTgbcQAEUukScuvnw8+9Pu/oa9jhaVZtMMX/aqZh/sYqSz7Q/ZP6+pcmVo2qhA
 /SAwScGKfuJAKQPNE29Ouu5RwUs3u5P3+Ypd5Ih5vgdGN2WAt0Q4oxL
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_233946_674764_7F63B63F 
X-CRM114-Status: UNSURE (   9.23  )
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

The current logic to split the 64-bit argument into its 32-bit halves is
byte-order specific and a bit clunky. Use a union instead which is
easier to read and works in all cases.

GCC still generates the same machine code.

While at it, rename the arguments of the __memset64() prototype to
actually reflect their semantics.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/include/asm/string.h | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm/include/asm/string.h b/arch/arm/include/asm/string.h
index c35250c4991b..96fc6cf460ec 100644
--- a/arch/arm/include/asm/string.h
+++ b/arch/arm/include/asm/string.h
@@ -39,13 +39,17 @@ static inline void *memset32(uint32_t *p, uint32_t v, __kernel_size_t n)
 }
 
 #define __HAVE_ARCH_MEMSET64
-extern void *__memset64(uint64_t *, uint32_t low, __kernel_size_t, uint32_t hi);
+extern void *__memset64(uint64_t *, uint32_t first, __kernel_size_t, uint32_t second);
 static inline void *memset64(uint64_t *p, uint64_t v, __kernel_size_t n)
 {
-	if (IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN))
-		return __memset64(p, v, n * 8, v >> 32);
-	else
-		return __memset64(p, v >> 32, n * 8, v);
+	union {
+		uint64_t val;
+		struct {
+			uint32_t first, second;
+		};
+	} word = { .val = v };
+
+	return __memset64(p, word.first, n * 8, word.second);
 }
 
 /*

---
base-commit: 37a93dd5c49b5fda807fd204edf2547c3493319c
change-id: 20260212-arm-memset64-cleanup-c470af232e87

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


