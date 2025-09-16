Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD5DCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 16:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=KxCoyZ/tM4V5cgHJsb0XJboqFn+/1+M5A9xLVrNQox0=; b=K0WpLfVvQMY2c4
	eS+qXRvtd8/iJAPoOZ8hMogU/uWvkngGo5eAHZg6ab+w4DTgrPrYzRTtnfa+jSNKiIi7eU+1QvDmP
	qBRyEa+8bfX2mKujkJ4dmFHiy/3jLqDZv6NcO8gUPmPsOOb2unx6NHW/oinJ5vZ/AXEmcZ7LrzreW
	ZotyButWRpMjI2ZUzyDI2e/5vu4eM823s/4tTu5GqvQyxGhQKN4CKM2/1ygcAa6x23NDnjsxsBd9F
	XC1OltfzPsyxR2xTxX0C1Sk+ZPMQbYq0aLnc+1peBcnTkhCLP/utmfy4yeNWPrbetnl0DLHRcptvH
	K/WjZYABSBZaq6w7EHsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYcT-00000008Tfm-27ta;
	Tue, 16 Sep 2025 16:33:29 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYcI-00000008TX8-0QmL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 16:33:19 +0000
Message-ID: <20250916163252.227660125@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758040395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=KxCoyZ/tM4V5cgHJsb0XJboqFn+/1+M5A9xLVrNQox0=;
	b=yyzLGVu/ABVBavv4AsytaQMxKIbr+AZPJaqBpVX9jTg7rBhW2P8Ob/yOOhgtFvi47gf5oe
	Sm/hgmy1LtJbYcnJatHSo2nifHh5YzyrJuvrGgFg+YRY099DxREKmHP2lNEQt3gSgvXhO9
	FZXewu40o2mFTUDGRQEkaf+GZxYQbpBQJP0C/DPRJ3dn780vvHqjt9IkcwzKcMKlbIOh1h
	MFynsHg1iaGBfd37RGlFCgbCq7yP4xnzsD5vikVSD4lmda1+eJ0UN/KQYE+3AZDU0++hG3
	rQK/184E5q6BflBIYUE881Uw8p4yGoe3JBFAOUTijn3684OcWY4pC1YSV6lnsg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758040395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=KxCoyZ/tM4V5cgHJsb0XJboqFn+/1+M5A9xLVrNQox0=;
	b=9GyDKdnjHMYAG3ZLmNN2MzA1nbMshj2uBjzc0VA3S8FnFUJ7/BtFY6a9OLVNNtbnfmlflj
	b4MWhuriSCAu9DDA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Nathan Chancellor <nathan@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 x86@kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: [patch V2 4/6] futex: Convert to scoped masked user access
References: <20250916163004.674341701@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Sep 2025 18:33:15 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_093318_285831_58808A6C 
X-CRM114-Status: GOOD (  15.07  )
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

Replace the open coded implementation with the scoped masked user access
mechanism.

No functional change intended

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Davidlohr Bueso <dave@stgolabs.net>
Cc: "André Almeida" <andrealmeid@igalia.com>
---
V2: Convert to scoped variant
---
 kernel/futex/futex.h |   37 ++++---------------------------------
 1 file changed, 4 insertions(+), 33 deletions(-)
---
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -285,48 +285,19 @@ static inline int futex_cmpxchg_value_lo
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
+	scoped_masked_user_read_access(from, return -EFAULT,
+	       scoped_get_user(*dest, from); );
 	return 0;
-Efault:
-	user_read_access_end();
-	return -EFAULT;
 }
 
 static __always_inline int futex_put_value(u32 val, u32 __user *to)
 {
-	if (can_do_masked_user_access())
-		to = masked_user_access_begin(to);
-	else if (!user_write_access_begin(to, sizeof(*to)))
-		return -EFAULT;
-	unsafe_put_user(val, to, Efault);
-	user_write_access_end();
+	scoped_masked_user_write_access(to, return -EFAULT,
+	       scoped_put_user(val, to); );
 	return 0;
-Efault:
-	user_write_access_end();
-	return -EFAULT;
 }
 
 static inline int futex_get_value_locked(u32 *dest, u32 __user *from)


