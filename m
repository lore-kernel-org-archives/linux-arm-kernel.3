Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1490DCCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=imtHkr/s1EgDhFpHdqDFKeA7fLJRHDRNr716F17Aia0=; b=abIN4cS8mb1ShL
	pMCI6N6y/67Wfg+XHTn+xv6tDLzmDeCk/dECMbcijId5A9fyF3EUbW9LcYFRxUQtuykBIVDdwuoFx
	yC5crf9scrBCOE/bXD3ybmpinZWF0MUSVOHmAlriBAaa6yYk4KsuThJ2PClALtPgZXrsfKm5jpfdA
	5qhwfs9PTNXw6KnASno7geZ13B5aWZWV2qMP3DfWOYdzK2yUwRFk9/fzrCFlFTJMtH2jlrVNjHqW+
	l6Oro8Amz4Sqr/Bg7/wb6a1gFx1lWnJ6+5LTfgMwCAH/VzpUsqTn92z4JDfNoA/MLasK6Ytkn088b
	7U1+4gIklDkevufYj1TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hOx-00000007SlB-3ySb;
	Fri, 17 Oct 2025 10:09:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hOm-00000007SRb-1XRb;
	Fri, 17 Oct 2025 10:09:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To;
	bh=imtHkr/s1EgDhFpHdqDFKeA7fLJRHDRNr716F17Aia0=; b=mxE/KCSor7Q0fJSUSJ5GFsyCBn
	acdbyIJ8Qs39dlNQQwVjiei+rAZDrd+rZ+iYQjtGI0LOXiMnz6L55IKex+hwLNYMKNNjRgztmNQD5
	qFtnxL2w8PvLRHvwQABeYOCX22LoOO1NzvOh1q9RAEQDijGFR/PIzbVyvxP6vGRRZU/Ez3oWEBn4j
	gAyfeLfIA2aBHcPVa3P0jsABdILyIful1XsTVFTHuSKsCvELsDFasRjmM1y292Xy2JehO/N7B9sgG
	QnElJ26+zK5RoL8EIOPsamRhHVEHAIs8K9i3aS9cM9N8X67XvOgb3MeaVu5bXgbGYpNhpC2siSfpn
	9o9OmuBA==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hOh-00000007Rqg-3qOW;
	Fri, 17 Oct 2025 10:09:22 +0000
Message-ID: <20251017093030.506939239@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760695757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=imtHkr/s1EgDhFpHdqDFKeA7fLJRHDRNr716F17Aia0=;
	b=IxmzYTBfKeP9PdlygwW7c3ZP9RsEre+9I9Ey2tCdF2r4gM5hRSxvZOgB2ZLVGOdPGXmKU1
	+c28eI+CQpneZgUdj/lriB9ag5dTOGtuqXD15nxa5UXlpIpMczCKiocdjT0TVrERWiHUyx
	B1W1XHif/HWSLsDJ1nx87OhoXNRPlg8O5YXz2UGSMHh3EdLm4J1Uj7udO1S/MhoJ2JUuwm
	YRwTS4vWjwKj+jetDYmTFxWTdSdvwVOj336LD4FgupH+XPVMUYSslfG3wlPbFb8EhUw/kW
	9X4Sd0io6pZfWY+0dDBIBCP78dmmq/qY+yUiuFO6HoBDI1YBYics9RbbUuLpQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760695757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=imtHkr/s1EgDhFpHdqDFKeA7fLJRHDRNr716F17Aia0=;
	b=tXLovSJd0rwq2r5yozTcKThhOnpAdq0BuaTsusGQM16gqfWgKUw8QGS1yKgXpz/pjSKgCv
	yXO1lDz+ddt6kiAA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org,
 kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
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
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: [patch V3 11/12] x86/futex: Convert to scoped masked user access
References: <20251017085938.150569636@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Oct 2025 12:09:16 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_110920_359834_71CE5A31 
X-CRM114-Status: GOOD (  10.58  )
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
guards

No functional change intended.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: x86@kernel.org
---
V3: Adapt to scope changes
V2: Convert to scoped masked access
    Use RW access functions - Christophe
---
 arch/x86/include/asm/futex.h |   75 ++++++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 42 deletions(-)
---
--- a/arch/x86/include/asm/futex.h
+++ b/arch/x86/include/asm/futex.h
@@ -46,38 +46,31 @@ do {								\
 } while(0)
 
 static __always_inline int arch_futex_atomic_op_inuser(int op, int oparg, int *oval,
-		u32 __user *uaddr)
+						       u32 __user *uaddr)
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
+	scoped_masked_user_rw_access(uaddr, Efault) {
+		switch (op) {
+		case FUTEX_OP_SET:
+			unsafe_atomic_op1("xchgl %0, %2", oval, uaddr, oparg, Efault);
+			break;
+		case FUTEX_OP_ADD:
+			unsafe_atomic_op1(LOCK_PREFIX "xaddl %0, %2", oval, uaddr, oparg, Efault);
+			break;
+		case FUTEX_OP_OR:
+			unsafe_atomic_op2("orl %4, %3", oval, uaddr, oparg, Efault);
+			break;
+		case FUTEX_OP_ANDN:
+			unsafe_atomic_op2("andl %4, %3", oval, uaddr, ~oparg, Efault);
+			break;
+		case FUTEX_OP_XOR:
+			unsafe_atomic_op2("xorl %4, %3", oval, uaddr, oparg, Efault);
+			break;
+		default:
+			return -ENOSYS;
+		}
 	}
-	user_access_end();
 	return 0;
 Efault:
-	user_access_end();
 	return -EFAULT;
 }
 
@@ -86,21 +79,19 @@ static inline int futex_atomic_cmpxchg_i
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
+	scoped_masked_user_rw_access(uaddr, Efault) {
+		asm volatile("\n"
+			     "1:\t" LOCK_PREFIX "cmpxchgl %3, %2\n"
+			     "2:\n"
+			     _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_EFAULT_REG, %0) \
+			     : "+r" (ret), "=a" (oldval), "+m" (*uaddr)
+			     : "r" (newval), "1" (oldval)
+			     : "memory");
+		*uval = oldval;
+	}
 	return ret;
+Efault:
+	return -EFAULT;
 }
 
 #endif


