Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364D3C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQ6ZZ42sEo0FMBMnZaDqvhvFmH70JPCseJfddupHf7M=; b=YHYPKjRuueEsic8X3R/oeKyTxa
	fz18bSLRYXx9sUypKYdJhRT1N07Xx32mStV62qD/IarjajUlEFgBy78QxOyS2VM6Ccb3VUhiTnYFV
	atNSGGyBKo5nAtPGypr+vBaMJN1RgsjHB2MDJjsWVfCZFPnH/FeD6jVjt/JJoL46ttnOM4+oOHOg9
	FgTJ/VsfZq8l4i3YXNsT+uG6azx6ky0HsxkYCTS+8JU/a8wEs4cQg2FXuBXbP7TdBVnFDpX8EGVpp
	QvnG2Igz84RrJk7p4r4Arq+Odnuqfg6aoKtaYUmPb9q1uRLzMQNmF7wm2YIFIbadczU0cNsnKefQg
	CdbfCcgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E20-0000000BAWq-2AXD;
	Wed, 09 Sep 2026 08:51:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1j-0000000BAEp-2vn0;
	Wed, 09 Sep 2026 08:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CQ6ZZ42sEo0FMBMnZaDqvhvFmH70JPCseJfddupHf7M=; b=OKxaVN09L6VQGWaL4/0wACANNt
	uDsX1wzVtTZuCBli/mntbbz4O4l4Ug1xmXOfzdU8Gv7joj7cp6rXfv6gjMJ3Oodj7BYOiKvJyT5r+
	6DQhH50CkrwHzzYlX+A0q5sSrw0COlkYY9ade5CbGz4fel5hu5uEenIEfhZzb3LUramencXbfSgzK
	UAIqeoNtmp9HSKFmGytKzDXvSKpOdtQ7Rewfg5Wgz8XldLVHUOJvrhnrKFwN7Dy8GMe+cGQdVsXHf
	K2lJ9CB+I2DSfbTYIlxfZzzy7Npb+gS8vftP8hnGiEZuL1K9MogyA3Dplq4oXmYgi8Xc1Exo2xRuX
	pDGdkBjQ==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4E1g-00000000wHY-3RTd;
	Wed, 09 Sep 2026 08:51:30 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CQ6ZZ42sEo0FMBMnZaDqvhvFmH70JPCseJfddupHf7M=;
	b=IdgLyGapCdf08hmIlLUWBy5AL4aW14xA2DS8OXFT1Zb3CfDnLbwZzDeXVhoDtbepPja8BN
	ryTtklMY2ERezCHSjJlc8z6NqAmiDSIy1DJogjFxpiZHuvKq7I5LB3MdZv9H4OozHj6Tng
	jbuQ4bPlOXu2wnT85khiyqOCKQBqOycEa8gaAjPIKxtVnd7LNbfnR49SgNv8Yl+pmxE0Ms
	s+Yl7j6gRiBR+fdcJhs4gs56Mczg7vk4/5aJnJbPl7DjBAqCEpkK7rppWwNbmLG9BrzDR7
	ChLjxpdfSnPxkp9jo/Sqv2fznf1ecuWEK6Jrcl1M/D7NpH6KpEFrKYbzuewvbQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CQ6ZZ42sEo0FMBMnZaDqvhvFmH70JPCseJfddupHf7M=;
	b=VVFeQNO/Qr/Vdm/q5BIomEtSc9i3kd9MK5TvsOwwjy2HYSUJfnaUQnR6L8aW7POLHXLm9j
	GGUXnc3tC3NpprCg==
Date: Wed, 09 Sep 2026 10:51:20 +0200
Subject: [PATCH 07/15] sparc/vdso: Move __VDSO_PAGES to asm/vdso.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-7-63ae856cc659@linutronix.de>
References: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
In-Reply-To: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=1764;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=VaPdauFQWLU0KJEV2a1f+WJtOXR8fxXaZFpswc0b434=;
 b=jH77Q51ITwUmOjNWzqUo9lEC+d/JgkdmQkYyv3oztNYP+7L0bV4RFQRJ0PdkZOHP7kKbcLVEn
 InKr6KCGEt+AhGlPxfVPXNdvyax8i9utdLhbRU/m9JgTxddcG4QStTx
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_095129_091825_9DA29DD4 
X-CRM114-Status: UNSURE (   9.51  )
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

Most architectures define the __VDSO_PAGES page macro in asm/vdso.h.

Align the SPARC headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/sparc/include/asm/vdso.h          | 6 ++++++
 arch/sparc/include/asm/vdso/vsyscall.h | 2 --
 arch/sparc/vdso/vdso-layout.lds.S      | 2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/sparc/include/asm/vdso.h b/arch/sparc/include/asm/vdso.h
index f08562d10215..b17c37c8075b 100644
--- a/arch/sparc/include/asm/vdso.h
+++ b/arch/sparc/include/asm/vdso.h
@@ -5,6 +5,10 @@
 #ifndef _ASM_SPARC_VDSO_H
 #define _ASM_SPARC_VDSO_H
 
+#define __VDSO_PAGES 4
+
+#ifndef __ASSEMBLER__
+
 struct vdso_image {
 	void *data;
 	unsigned long size;   /* Always a multiple of PAGE_SIZE */
@@ -17,4 +21,6 @@ extern const struct vdso_image vdso_image_64_builtin;
 extern const struct vdso_image vdso_image_32_builtin;
 #endif
 
+#endif /* __ASSEMBLER__ */
+
 #endif /* _ASM_SPARC_VDSO_H */
diff --git a/arch/sparc/include/asm/vdso/vsyscall.h b/arch/sparc/include/asm/vdso/vsyscall.h
index b08e0bd5e309..ff62b291e4eb 100644
--- a/arch/sparc/include/asm/vdso/vsyscall.h
+++ b/arch/sparc/include/asm/vdso/vsyscall.h
@@ -3,6 +3,4 @@
 #ifndef _ASM_SPARC_VDSO_VSYSCALL_H
 #define _ASM_SPARC_VDSO_VSYSCALL_H
 
-#define __VDSO_PAGES 4
-
 #endif /* _ASM_SPARC_VDSO_VSYSCALL_H */
diff --git a/arch/sparc/vdso/vdso-layout.lds.S b/arch/sparc/vdso/vdso-layout.lds.S
index 180e5d0ee071..920396203a2e 100644
--- a/arch/sparc/vdso/vdso-layout.lds.S
+++ b/arch/sparc/vdso/vdso-layout.lds.S
@@ -6,7 +6,7 @@
 
 #include <vdso/datapage.h>
 #include <vdso/page.h>
-#include <asm/vdso/vsyscall.h>
+#include <asm/vdso.h>
 
 SECTIONS
 {

-- 
2.55.0


