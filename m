Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6182FCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 08:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=435+37KhAU0mhng1XnAbeS2nHoeU+rxEjwbVMsKftxA=; b=Z61r6gXd+FGHOy
	i3lYTR6yHhCRlhWCgLfq+j2T2uAjFoWJuUWyDj1H2SlRnrSyOyRuFTX0qHWYVdA2TFQ9hz0vsedqV
	oZXInVsDTDhQxLG6u9Y7E+6w1a3QDmKJiBThJxjtgyf8wtEeDqVgk/ah4iIaCKg45oSlW3PekI7Pq
	i8mYQwjqSmgK/jnYe7b1/BPC+BjlGHga5s/lOLrj1O0l29md58cgeQUU43wDweK79URxv9M4pEIK9
	6cJhWuvYb+Gh90t42SlzWWIglSdOXweSp4plCqKLvhpAVOfqBNw4Qo5K56SI1tcEn/+hI4ymMnWoY
	oUun8S8sqkJaTQVaxaSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIqL-0000000DP2J-2T13;
	Mon, 27 Oct 2025 08:44:45 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIpf-0000000DOBt-3gjw;
	Mon, 27 Oct 2025 08:44:09 +0000
Message-ID: <20251027083745.736737934@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761554641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=435+37KhAU0mhng1XnAbeS2nHoeU+rxEjwbVMsKftxA=;
	b=I4Kw5Ywek/IX9WMSt/JXEa6snrzGFocVq/IjZtkNm1ANMjiG+drhyzT6KMpNFoZ81+hpq6
	7eExgfokt10EBfmMcQQqV3fHS7o+tZ1wKnuLPw3dhoCmS+7DNc4GlQebCPGHmHeHNEXGGv
	dHUpqGVUsaIl7lhAhzePlzvZ9TZmCnQJkRaIhw6kSszp+Oe3T28gR/NmuCpMOdRMmdbgWK
	49R4Iz46M9aRnw8O5tqYDlJeRDC1t10xoiAaSTGN43wU0DwX72QRSrd7bLWPPaoJLnpDRt
	WsrcrnhgR+2dkKcsStXQmlVjHMHAgmZ8OHZztJdfAQhnJWROQZ2fWyeT4rsVLg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761554641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=435+37KhAU0mhng1XnAbeS2nHoeU+rxEjwbVMsKftxA=;
	b=5fUpbazZrmkMXN7jn9+9G33jFnKwKg6Vab+X7NXNyTTxhdWjb/TPTSoWsl2TtGRcijzTye
	9yPo5IrGwO3RP/DA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: [patch V5 10/12] futex: Convert to get/put_user_inline()
References: <20251027083700.573016505@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Oct 2025 09:44:00 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_014404_173639_2A9DEBE1 
X-CRM114-Status: GOOD (  16.63  )
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

From: Thomas Gleixner <tglx@linutronix.de>

Replace the open coded implementation with the new get/put_user_inline()
helpers. This might be replaced by a regular get/put_user(), but that needs
a proper performance evaluation.

No functional change intended

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Davidlohr Bueso <dave@stgolabs.net>
Cc: "André Almeida" <andrealmeid@igalia.com>
---
V5: Rename again and remove the helpers
V4: Rename once moar
V3: Adapt to scope changes
V2: Convert to scoped variant
---
 kernel/futex/core.c  |    4 +--
 kernel/futex/futex.h |   58 ++-------------------------------------------------
 2 files changed, 5 insertions(+), 57 deletions(-)
---
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -581,7 +581,7 @@ int get_futex_key(u32 __user *uaddr, uns
 	if (flags & FLAGS_NUMA) {
 		u32 __user *naddr = (void *)uaddr + size / 2;
 
-		if (futex_get_value(&node, naddr))
+		if (get_user_inline(node, naddr))
 			return -EFAULT;
 
 		if ((node != FUTEX_NO_NODE) &&
@@ -601,7 +601,7 @@ int get_futex_key(u32 __user *uaddr, uns
 			node = numa_node_id();
 			node_updated = true;
 		}
-		if (node_updated && futex_put_value(node, naddr))
+		if (node_updated && put_user_inline(node, naddr))
 			return -EFAULT;
 	}
 
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -281,63 +281,11 @@ static inline int futex_cmpxchg_value_lo
 	return ret;
 }
 
-/*
- * This does a plain atomic user space read, and the user pointer has
- * already been verified earlier by get_futex_key() to be both aligned
- * and actually in user space, just like futex_atomic_cmpxchg_inatomic().
- *
- * We still want to avoid any speculation, and while __get_user() is
- * the traditional model for this, it's actually slower than doing
- * this manually these days.
- *
- * We could just have a per-architecture special function for it,
- * the same way we do futex_atomic_cmpxchg_inatomic(), but rather
- * than force everybody to do that, write it out long-hand using
- * the low-level user-access infrastructure.
- *
- * This looks a bit overkill, but generally just results in a couple
- * of instructions.
- */
-static __always_inline int futex_get_value(u32 *dest, u32 __user *from)
-{
-	u32 val;
-
-	if (can_do_masked_user_access())
-		from = masked_user_access_begin(from);
-	else if (!user_read_access_begin(from, sizeof(*from)))
-		return -EFAULT;
-	unsafe_get_user(val, from, Efault);
-	user_read_access_end();
-	*dest = val;
-	return 0;
-Efault:
-	user_read_access_end();
-	return -EFAULT;
-}
-
-static __always_inline int futex_put_value(u32 val, u32 __user *to)
-{
-	if (can_do_masked_user_access())
-		to = masked_user_access_begin(to);
-	else if (!user_write_access_begin(to, sizeof(*to)))
-		return -EFAULT;
-	unsafe_put_user(val, to, Efault);
-	user_write_access_end();
-	return 0;
-Efault:
-	user_write_access_end();
-	return -EFAULT;
-}
-
+/* Read from user memory with pagefaults disabled */
 static inline int futex_get_value_locked(u32 *dest, u32 __user *from)
 {
-	int ret;
-
-	pagefault_disable();
-	ret = futex_get_value(dest, from);
-	pagefault_enable();
-
-	return ret;
+	guard(pagefault)();
+	return get_user_inline(*dest, from);
 }
 
 extern void __futex_unqueue(struct futex_q *q);


