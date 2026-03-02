Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC906E9B371
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gk+DNY1FnX2Is9++3W7weFVsUWOyhOhif2Eu1mxTHc8=; b=YTPltSxeMCVvb+C+AGOEWqaWJ4
	ZZOgaMv4SI507zzApL6EebCCl4PDEznuHfML67pHeA+CL1yg1X9HzMicCimEtc2c3L6oFIoT1kvGe
	qVlays4fC/nj4oe1Ge8wG2SF6G8qgea6tnb4w2Cho1dtg5BnVyttRbWh53o96GfkivuvAYjdUFi7E
	7wmgJeAdQWtKIUYjG/us1uDbTSUHYbL4NxfaZQu3uLZNXKyBlODFLNEc/htY4ygtPjWVh3BKQuyBj
	C+nE1xfMb4mHcH2iWXJEgH4bBjg0a+NGIWDKsBHNwpZlDJJv2LKm0/3wbzgNcDFGst+E06lDmn84m
	6SYFEVzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2Lt-0000000CwlY-3Adw;
	Mon, 02 Mar 2026 12:26:21 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LT-0000000CvvS-0PzA;
	Mon, 02 Mar 2026 12:25:56 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gk+DNY1FnX2Is9++3W7weFVsUWOyhOhif2Eu1mxTHc8=;
	b=bjv0a6y3jCZ57+M0uFA88aCV5qSJ4Nd0obqTh1cZRZ6IaeWWNg/CTFwcAHwXw//lfMMUVu
	m1Mpa8otbmrWDJUuqL59FPydBljYCAaaGVif88nsL7FmUoVnPZ45eBu/dbmrRuw0f6Yo6w
	v9eNArcvNvWsTi5mM3dGszF37CncJy76utUKDIR7HGZiggCkaqipBC1lZDaBI2haLxXiKZ
	M35kORuqVQt+esRy8qf4cdpa+eJ/GDFoQkajHSv+QyO+Ky0KkAVVx8uVkOXMDX0AEguZXr
	nuJHkW7DK+/9SJ98zVgc7fjaR+AC8titmzEOvetbJ5VW1vSlFpSMgU0fO2yfFw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gk+DNY1FnX2Is9++3W7weFVsUWOyhOhif2Eu1mxTHc8=;
	b=BYfC3Fegaop1FFBF9oem1OjAUVs0XyTKiFOs56Iip+kmC013SL48mBu/X4JFdKO5qcaRVH
	9OQ9T+TEdCCCwCCw==
Date: Mon, 02 Mar 2026 13:25:39 +0100
Subject: [PATCH 15/15] auxvec.h: Drop fallback AT_VECTOR_SIZE_ARCH
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260302-at-vector-size-arch-v1-15-a11f03ba2ca8@linutronix.de>
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
In-Reply-To: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=730;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=3SgKzX2uaURwdk6BulOU26vMp194sxSrGIKk7+4gH+o=;
 b=vht2sJN2rUis/ZgzV++4P2sJ59ygy9DcT8yNfNbBA9oZ/PokJlfDEb+BAVSUMWrI8Um52Kvy2
 /R46rtq58zdC0ybNyXouxNGCbUYsNmMjl7tobyboz5eg/Pw0p7lpe82
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042555_297009_253561D3 
X-CRM114-Status: UNSURE (   7.27  )
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

All asm headers now define this constant.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/linux/auxvec.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/auxvec.h b/include/linux/auxvec.h
index 68c9d6b118a9..814f984726d6 100644
--- a/include/linux/auxvec.h
+++ b/include/linux/auxvec.h
@@ -9,10 +9,6 @@
 #define AT_VECTOR_SIZE_BASE 22 /* NEW_AUX_ENT entries in auxiliary table */
   /* number of "#define AT_.*" above, minus {AT_NULL, AT_IGNORE, AT_NOTELF} */
 
-#ifndef AT_VECTOR_SIZE_ARCH
-#define AT_VECTOR_SIZE_ARCH 0
-#endif
-
 #define AT_VECTOR_SIZE (2*(AT_VECTOR_SIZE_ARCH + AT_VECTOR_SIZE_BASE + 1))
 
 #endif /* _LINUX_AUXVEC_H */

-- 
2.53.0


