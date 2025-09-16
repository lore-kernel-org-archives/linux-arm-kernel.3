Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60313CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 16:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=BmldD4A75BIJBF70pMggmackAjgs9KxvyTJlUqaikXQ=; b=mu2Vc8d0i//sgd
	vpbGi3jOQjuS/hW73FuZMN2NLmFOyuSKTOnElX8J9osaN6yuOS6UtI2EuE1NWnIDM7Gjso1HV2DZf
	5pTwds/PzQMWv7AHyGuq7xOFG/aRo3VsD1O6+0u0VP86lRncm07vgXeQxRDmSjBSiKXvFhSB4F4Cr
	LNM/aczVYTOSATi3QzmGOjrvWOGhfcohjlBWGc8GYcDckbZthmhwvhm1gFbwylL0yJS1rRicheJjH
	LhIi17qdoBqtOIZHvB/Pzel6eUM3ORJVWqqBt8CPFfrmUfifHWRPbiqnfxqoWiAGOVZhdGVxNTeEG
	45KE2IfulVhl5sQTBG9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYcT-00000008Tgd-3YSG;
	Tue, 16 Sep 2025 16:33:29 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYcK-00000008TYZ-10ok
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 16:33:21 +0000
Message-ID: <20250916163252.290994801@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758040397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=BmldD4A75BIJBF70pMggmackAjgs9KxvyTJlUqaikXQ=;
	b=QqI77ncKlEa6nB4I7sYOMDLEumijaVNglOlcMDNn1CMbhZHR0DuknAl6GECIu4yjb0g5dQ
	zHujwHWJZAXfYX515CXgxsR5I6amJZaRLi96MRgw7Xk3VA6P4QJdBFVN9BJcOd01IS73qp
	ePeKSm7d2MTSOAJ9CWxmJFgr2ArN+7ULtoBsBe5qaZSkAjss0ImuLTBHsMVIq8LOLSWG5Y
	69OpWDnQirfnM7HxgVFz2qsfW+oFVncr+d4J1zwdl5zQuhQwv2xoat4x2ncPasKEBWHduu
	l7vilSoxDEFhca/blMbRzCljO7LiUol9D3PiCtGZGe3BMATM7my+qfPnxpiQkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758040397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=BmldD4A75BIJBF70pMggmackAjgs9KxvyTJlUqaikXQ=;
	b=QJWEH9EOQbeyB3lz6nAN0qgvWiaE9w4s2qFhRBPAT5xIHc/ZWjWp6uRNQxioA+QCnNj/5N
	z504OvajCpPXBYAA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 x86@kernel.org,
 kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Nathan Chancellor <nathan@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: [patch V2 5/6] x86/futex: Convert to scoped masked user access
References: <20250916163004.674341701@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Sep 2025 18:33:16 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_093320_424155_67AF2863 
X-CRM114-Status: GOOD (  11.49  )
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

Replace the open coded implementation with the scoped masked user access
mechanism.

No functional change intended.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: x86@kernel.org
---
V2:	Convert to scoped masked access
	Use RW access functions - Christophe
---
 arch/x86/include/asm/futex.h |   76 ++++++++++++++++++-------------------------
 1 file changed, 32 insertions(+), 44 deletions(-)
---
--- a/arch/x86/include/asm/futex.h
+++ b/arch/x86/include/asm/futex.h
@@ -48,37 +48,29 @@ do {								\
 static __always_inline int arch_futex_atomic_op_inuser(int op, int oparg, int *oval,
 		u32 __user *uaddr)
 {
-	if (can_do_masked_user_access())
-		uaddr = masked_user_access_begin(uaddr);
-	else if (!user_access_begin(uaddr, sizeof(u32)))
-		return -EFAULT;
-
-	switch (op) {
-	case FUTEX_OP_SET:
-		unsafe_atomic_op1("xchgl %0, %2", oval, uaddr, oparg, Efault);
-		break;
-	case FUTEX_OP_ADD:
-		unsafe_atomic_op1(LOCK_PREFIX "xaddl %0, %2", oval,
-				   uaddr, oparg, Efault);
-		break;
-	case FUTEX_OP_OR:
-		unsafe_atomic_op2("orl %4, %3", oval, uaddr, oparg, Efault);
-		break;
-	case FUTEX_OP_ANDN:
-		unsafe_atomic_op2("andl %4, %3", oval, uaddr, ~oparg, Efault);
-		break;
-	case FUTEX_OP_XOR:
-		unsafe_atomic_op2("xorl %4, %3", oval, uaddr, oparg, Efault);
-		break;
-	default:
-		user_access_end();
-		return -ENOSYS;
-	}
-	user_access_end();
+	scoped_masked_user_rw_access(uaddr, return -EFAULT, {
+		switch (op) {
+		case FUTEX_OP_SET:
+			unsafe_atomic_op1("xchgl %0, %2", oval, uaddr, oparg, scope_fault);
+			break;
+		case FUTEX_OP_ADD:
+			unsafe_atomic_op1(LOCK_PREFIX "xaddl %0, %2", oval,
+					  uaddr, oparg, scope_fault);
+			break;
+		case FUTEX_OP_OR:
+			unsafe_atomic_op2("orl %4, %3", oval, uaddr, oparg, scope_fault);
+			break;
+		case FUTEX_OP_ANDN:
+			unsafe_atomic_op2("andl %4, %3", oval, uaddr, ~oparg, scope_fault);
+			break;
+		case FUTEX_OP_XOR:
+			unsafe_atomic_op2("xorl %4, %3", oval, uaddr, oparg, scope_fault);
+			break;
+		default:
+			return -ENOSYS;
+		}
+	});
 	return 0;
-Efault:
-	user_access_end();
-	return -EFAULT;
 }
 
 static inline int futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
@@ -86,20 +78,16 @@ static inline int futex_atomic_cmpxchg_i
 {
 	int ret = 0;
 
-	if (can_do_masked_user_access())
-		uaddr = masked_user_access_begin(uaddr);
-	else if (!user_access_begin(uaddr, sizeof(u32)))
-		return -EFAULT;
-	asm volatile("\n"
-		"1:\t" LOCK_PREFIX "cmpxchgl %3, %2\n"
-		"2:\n"
-		_ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_EFAULT_REG, %0) \
-		: "+r" (ret), "=a" (oldval), "+m" (*uaddr)
-		: "r" (newval), "1" (oldval)
-		: "memory"
-	);
-	user_access_end();
-	*uval = oldval;
+	scoped_masked_user_rw_access(uaddr, return -EFAULT, {
+		asm volatile("\n"
+			     "1:\t" LOCK_PREFIX "cmpxchgl %3, %2\n"
+			     "2:\n"
+			     _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_EFAULT_REG, %0) \
+			     : "+r" (ret), "=a" (oldval), "+m" (*uaddr)
+			     : "r" (newval), "1" (oldval)
+			     : "memory");
+		*uval = oldval;
+	});
 	return ret;
 }
 


