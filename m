Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DAFCCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=kgiZQ2LHnoAuUeU4bAPUZQG9DpHKgtV5g2vXbnxY3WU=; b=l7s0ofNX9vQQUS
	DMJTfVdJqTMHgHykvaHpFM1Zg21hl0AyhmLMi5kQ8rOsV8J3STLe7ZAjH4ZgoPfa1tOzItO6bKoUM
	RF+Q3XyuebmYJ8Qc5EZdZCD4EEDfCbeCk8Xs1c+2dXNqthnAnB9sANKkod3Qli2ijWL5yOF6Nz/96
	W+WY7XJJbNb70shrQe7RnhC66r6uLy3kQVbVoSzlaoE0swhV4zaihNKC3hkIGLnqrx44t90/jdg84
	tZa2qNYA1jIZ9ItOMrRWr+38MooGmOFadeuh8LqHaDbBT2/lRyfVr5K2EWBQF9YdzGXvD/8ON8kbc
	WMC1xa7WFg6RsUSAZXPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hOn-00000007SU6-09nF;
	Fri, 17 Oct 2025 10:09:25 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hOf-00000007SEV-22DO;
	Fri, 17 Oct 2025 10:09:19 +0000
Message-ID: <20251017093030.443142844@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760695755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=kgiZQ2LHnoAuUeU4bAPUZQG9DpHKgtV5g2vXbnxY3WU=;
	b=mpkjILJoMW+NxL7mj7Gkt8KfTdP8hlJpo2Od+7iroOPr22g6zAYrA6yUvqMmBvxNsIgubm
	CvGY3j5HuJ+GKdxHiPMjY9rCQ53bXOmVeodjH//fzeLUVju5Bb6VUVR8AgiWuur7rbvdkV
	gxn/pTETiDGuMBDkvtMVlTJDHVlPeeW33L6tqfdVc7PoE4GjPdtSjlMNaKd52hrDg2+tL7
	wUV768CPkGumlygCkw7AUUe6cdpax17aJuyAMZOir0K0ahKMAwQCDdK6KEUtEhAAp3+WlU
	17Zuy6C9rKn8fIYmyOjnpI4ODlq+tUAt8V9oX846q250RQEpr3Ctvv7+PvRq8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760695755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=kgiZQ2LHnoAuUeU4bAPUZQG9DpHKgtV5g2vXbnxY3WU=;
	b=tdhXCPyA4ZEVvsSHbhYKGj01qPJmkWPTgxxpK9M9rn0Kr9sE2FveZ1mXCHtQvUnuVlAgry
	ZcvdOvRAb0kTDZAw==
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
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: [patch V3 10/12] futex: Convert to scoped masked user access
References: <20251017085938.150569636@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Oct 2025 12:09:14 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_030917_840540_FF935973 
X-CRM114-Status: GOOD (  13.65  )
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

Replace the open coded implementation with the new get/put_user_masked()
helpers.

No functional change intended

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Davidlohr Bueso <dave@stgolabs.net>
Cc: "André Almeida" <andrealmeid@igalia.com>
---
V3: Adapt to scope changes
V2: Convert to scoped variant
---
 kernel/futex/futex.h |   37 ++-----------------------------------
 1 file changed, 2 insertions(+), 35 deletions(-)
---
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -285,48 +285,15 @@ static inline int futex_cmpxchg_value_lo
  * This does a plain atomic user space read, and the user pointer has
  * already been verified earlier by get_futex_key() to be both aligned
  * and actually in user space, just like futex_atomic_cmpxchg_inatomic().
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
  */
 static __always_inline int futex_get_value(u32 *dest, u32 __user *from)
 {
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
+	return get_user_masked(*dest, from) ? 0 : -EFAULT;
 }
 
 static __always_inline int futex_put_value(u32 val, u32 __user *to)
 {
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
+	return put_user_masked(val, to) ? 0 : -EFAULT;
 }
 
 static inline int futex_get_value_locked(u32 *dest, u32 __user *from)


