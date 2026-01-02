Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BFAE9410B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 07:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rUVfCdYU+P2/tuhq3RExnWJpGzo44bddZzASzjEowLU=; b=q2Zr6eD4HTeurLNvJORjYF6ElY
	SrcfYbfvVWuu++59rxiIDjiPEjsPWS6VanFgAXvxPagokNb66kZO+JpWyLHcdfCtrZnLZVXvhdX3W
	filemg/r1CsuGjjnfNQ2MXBOY6oWOpMXeMWvyZM74joWpTD5sdUMeRAv5KddWrUb+vTZleRxS2mRC
	B8rCoq5ApdTueejRhd73VsAK9UjOIH9dvIBCUjmb4diA4j2BFZi8t7TJMZB2iOthEH8twR58FhGTQ
	p77D/Ar2R9u3dLaAliNe7YJKiQVArVevGsvPoVYm3rj1mEVRILEYpSnw9a7kaZEwJXUuaYeMb3nIc
	etLWGZJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbZOa-00000007wzR-3fgN;
	Fri, 02 Jan 2026 07:16:24 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbZOX-00000007wys-05c9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 07:16:22 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767338174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rUVfCdYU+P2/tuhq3RExnWJpGzo44bddZzASzjEowLU=;
	b=4DXSF9WWuZcRtKVleaHmSt2nqwEqk0XeBwPTXfycL7khpkOtVy7PZL+IEkYJ+eNkamw8xo
	BV5LuE1BdaJ7cvM9EeqVqxaAMrLs+tUdalVb6Ye/l2hXP1fuuSyJI7ORq4cpUDlnZcMtNY
	SOb1L+UF0GHPdImIIuZdMCLrapGW8vCqsB44fIb9wHGckiZs2SvE4Sny3wFTVTklPLUnFu
	auEJMlqFFFORED4uZqzhD5kFFUFu5dJtrw61jvqCxARTKupo9+2wQD4gSrYB5OUxi3fcaK
	5Q5LaN6YFtjHirouZrUvTKh82vS6FyCbBDyAKBTrzawoNm9N2rfcO1J+LPEysw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767338174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rUVfCdYU+P2/tuhq3RExnWJpGzo44bddZzASzjEowLU=;
	b=Bsy8va++cov7ou85DSjmBzb+UqL3kuYF9dI8cJdbQmk4SG9e5lad3zeJptjL41PzpTIpAv
	80az9HoiU0mXalAg==
Date: Fri, 02 Jan 2026 08:15:46 +0100
Subject: [PATCH] ARM: fix memset64() on big-endian
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260102-armeb-memset64-v1-1-9aa15fb8e820@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAKFwV2kC/x3MSwqAIBRG4a3EHSeoPai2Eg2sfusOtNCIINx70
 vAbnPNSRGBEGoqXAm6OfPgMVRa07MZvELxmk5a6UbqSwgSHWTi4iKuthVRWG3SV7WEpR2eA5ec
 fjlNKH9hYpU9gAAAA
X-Change-ID: 20251230-armeb-memset64-01f2ae83f9ef
To: Russell King <linux@armlinux.org.uk>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Matthew Wilcox <willy@infradead.org>
Cc: Russell King <rmk+kernel@armlinux.org.uk>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, stable@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767338172; l=1275;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6IdQhWHRL8sxQR3hfcJIbaJ1RnY35D0jn+3c047cMJE=;
 b=vEVVWgHwwrx7iXQyo/+hyWo5gF0lLYQfBaL2JT9JVklqDQvWNqK5LsdnA7oyvXXXaS2ldaDjJ
 PEg1QMTO0LiBo5aDEQ3d1izbZj+4V/Dc/JYRHTdr+oRADmoZ+If3X+0
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_231621_231025_220EB965 
X-CRM114-Status: GOOD (  11.06  )
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

On big-endian systems the 32-bit low and high halves need to be swapped,
for the underlying assembly implemenation to work correctly.

Fixes: fd1d362600e2 ("ARM: implement memset32 & memset64")
Cc: stable@vger.kernel.org
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Found by the string_test_memset64 KUnit test.
---
 arch/arm/include/asm/string.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/string.h b/arch/arm/include/asm/string.h
index 6c607c68f3ad..c35250c4991b 100644
--- a/arch/arm/include/asm/string.h
+++ b/arch/arm/include/asm/string.h
@@ -42,7 +42,10 @@ static inline void *memset32(uint32_t *p, uint32_t v, __kernel_size_t n)
 extern void *__memset64(uint64_t *, uint32_t low, __kernel_size_t, uint32_t hi);
 static inline void *memset64(uint64_t *p, uint64_t v, __kernel_size_t n)
 {
-	return __memset64(p, v, n * 8, v >> 32);
+	if (IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN))
+		return __memset64(p, v, n * 8, v >> 32);
+	else
+		return __memset64(p, v >> 32, n * 8, v);
 }
 
 /*

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251230-armeb-memset64-01f2ae83f9ef

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


