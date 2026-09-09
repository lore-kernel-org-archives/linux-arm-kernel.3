Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C77C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csWZa+FXPkZtKlamZnzOe5wDFOkHxV9+VSViUYlt1Zs=; b=xop3o8aQdbWAKWUIaeUFTfuwZN
	QgOpiTVEYvl3+ZR7oTdRT0QCtEdADNCbBCy4jk1moGsz5OxxxUuZUanV197rw1+528LKYyJB23Xbt
	c/H8obbXSgWS81zcqeoVcHTgpztq+VQeZcqUtrMk3bhDIVhB+2mzmC7ZF5i0bDFpG2KIirDhEKmwQ
	6SyaMRQBwoZPVAjqn5BednCUhswWJn4n03zambO94JhlEiQeqrdUsJNHUozFN0BqlCUvgRg36RT9Y
	zuOQHenFg0jSIsVwYYpHiTGd8G4irsLTxnay1Wz8PPVIBxdGzI6ivd2nictQWT+jaXXqfsKcyAk0w
	MQw2MBQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1x-0000000BARE-2K82;
	Wed, 09 Sep 2026 08:51:45 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1e-0000000BAAd-38Cb;
	Wed, 09 Sep 2026 08:51:29 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=csWZa+FXPkZtKlamZnzOe5wDFOkHxV9+VSViUYlt1Zs=;
	b=zLyb9Fwu7jbI0CwCPLxrGbMAjONAtXhsvd2aOXrsZeTIM+Vd6cAkXeT/9cSCtBgc6rUvND
	gGL505R+4si2jE3aeqnbSbLIG8k98l5iRxrDYXFAKQOWMVSkZxKFlP21c6TSMA2i/iy116
	/ylwRK8HcPiR9PgT8J7h2y8C76UQ6h/hhfKtVfvGj6xJZzmOon5VHgnFpIj7kux2X934+R
	88gvKVckykd4QMY7I4EvAl22PfX5GKMA8NcVnV99WfoKqT9h3DM3L6nfOz4IF1LXAzPclD
	t74OiDujJWbszZsh0qrw62upWw14+r6iyZ4jcroh7b+1fqc9tncGYHc7XAbHiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=csWZa+FXPkZtKlamZnzOe5wDFOkHxV9+VSViUYlt1Zs=;
	b=N/A0UM8L3DUA6/r4Ux30sANcZeIqXCYs4ZXEjCKOONRgT4pANRJ15Uu4BotsUrawfjPr6e
	4wH9FEacXhaQoNBg==
Date: Wed, 09 Sep 2026 10:51:16 +0200
Subject: [PATCH 03/15] vdso/getrandom: Define fallback
 __arch_get_vdso_u_rng_data() in getrandom.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-3-63ae856cc659@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=1595;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Inx1GMMAL9hTofIIG5CeNr2zKHZu0vdSWjUErNB5P+Q=;
 b=S5UXcl0xftPFhFxyzIYGTlv2hiN5xVRt8TcojCGkIIJlfpcJoQYHo8t1Vw1w+qVFkJDkfU+DX
 KiIc9K+4lvbCboRLbKhU8xLm4rTxtAlsgsM1YN6LzOWh2SHeS6QsfsX
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_015126_953957_EB55A35E 
X-CRM114-Status: UNSURE (   6.33  )
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

__arch_get_vdso_u_rng_data() is only used in getrandom.c. vsyscall.h
has become a dumping ground for different kinds of fallbacks.

Move the fallback function definition into getrandom.c,
similar to other fallbacks.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/asm-generic/vdso/vsyscall.h | 7 -------
 lib/vdso/getrandom.c                | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/asm-generic/vdso/vsyscall.h b/include/asm-generic/vdso/vsyscall.h
index fe12fb1fb442..cdf7b39cd349 100644
--- a/include/asm-generic/vdso/vsyscall.h
+++ b/include/asm-generic/vdso/vsyscall.h
@@ -4,13 +4,6 @@
 
 #ifndef __ASSEMBLER__
 
-#ifndef __arch_get_vdso_u_rng_data
-static __always_inline const struct vdso_rng_data *__arch_get_vdso_u_rng_data(void)
-{
-	return &vdso_u_rng_data;
-}
-#endif
-
 #ifndef __arch_update_vdso_clock
 static __always_inline void __arch_update_vdso_clock(struct vdso_clock *vc)
 {
diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
index 2851afa9154f..6ff46549281c 100644
--- a/lib/vdso/getrandom.c
+++ b/lib/vdso/getrandom.c
@@ -19,6 +19,13 @@
 /* Bring in default accessors */
 #include <vdso/vsyscall.h>
 
+#ifndef __arch_get_vdso_u_rng_data
+static __always_inline const struct vdso_rng_data *__arch_get_vdso_u_rng_data(void)
+{
+	return &vdso_u_rng_data;
+}
+#endif
+
 #define MEMCPY_AND_ZERO_SRC(type, dst, src, len) do {				\
 	while (len >= sizeof(type)) {						\
 		__put_unaligned_t(type, __get_unaligned_t(type, src), dst);	\

-- 
2.55.0


