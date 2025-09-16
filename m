Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06918CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 16:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=B/RhS9MNlGp3gsd3Y5Hcz+zwOUSn+KCGsE63faUFAJ8=; b=2ET5GddaldBIaT
	bYu7k62kGMQ4fHmfj3kj9bKJJIJoUG/Mk+VjF8ErUmk7thSLSOosyJzDhNgARAabap/k/5ph1tm2c
	LKo+cyMKE3D4PNXtqoj3ITFqVEmYY+aT8PHBClZB/eGWMDW7fzPwZmiRhHdLtq6ndIaL+VAMeiFrt
	qJSfCdgp2feTbr9LWXG3Ndr1KOHLSXWlGfNLhhCHkKBoPa7+h/OOR3C+/GXJmxKcKc1L1GSKVYkM2
	5IJ8/9OSJr8e3zu8bEK4SzAqrKI5SUIGuPlNGSdBs4nPSAEx0S8vNYzG1wV6pRTaghb8xhbV4xuGb
	bzK4QldZz/Fx1RMzBpaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYcJ-00000008TYo-4But;
	Tue, 16 Sep 2025 16:33:20 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYcC-00000008TU2-49Ys
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 16:33:14 +0000
Message-ID: <20250916163252.037251747@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758040389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=B/RhS9MNlGp3gsd3Y5Hcz+zwOUSn+KCGsE63faUFAJ8=;
	b=aAZOwPKMm4jwayUq+qDJ8DY/iZjvms9gmpOm+ct7FIi2qfXqO2u1fVe2YStaVUIzzWxt9d
	tA8sboL0MDk+yZHp4z5FYKjRwQm14cSPwYvVNV4cZphj4sO5MO0rxwwhUtwG1Phz3gxBVv
	ZFYIud/j3ahpmykVe1dpyXZxMl2FJfFxy+vZxH2rjLe5TRh7eOIG+/2awPBlH+L7wFaChL
	7hkPOhd7tSFEHwu622HJyBogkgSDWOXM+pL+8jvnvMcKRpMhn+0FBL6Y3MD3dkRfqsYCHT
	hf5xIyg4gcU0iS+UN7J6WeLF49JHHSFv2JnDsP9mfoQGUXRdms1Z8nZzc2UXZw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758040389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=B/RhS9MNlGp3gsd3Y5Hcz+zwOUSn+KCGsE63faUFAJ8=;
	b=/H9ENHojbyZCig4RCbcZB0AcR5KYCv6FUU8ji5Q7CeEhYJ1EZB4nUb9K7XrWSI/58jOkZC
	GD2DBAPopu7XXHDA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Nathan Chancellor <nathan@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 x86@kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: [patch V2 1/6] ARM: uaccess: Implement missing __get_user_asm_dword()
References: <20250916163004.674341701@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Sep 2025 18:33:09 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_093313_167381_E5148DEF 
X-CRM114-Status: GOOD (  11.10  )
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

When CONFIG_CPU_SPECTRE=n then get_user() is missing the 8 byte ASM variant
for no real good reason. This prevents using get_user(u64) in generic code.

Implement it as a sequence of two 4-byte reads with LE/BE awareness.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Closes: https://lore.kernel.org/oe-kbuild-all/202509120155.pFgwfeUD-lkp@intel.com/
---
V2: New patch to fix the 0-day fallout
---
 arch/arm/include/asm/uaccess.h |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

--- a/arch/arm/include/asm/uaccess.h
+++ b/arch/arm/include/asm/uaccess.h
@@ -295,6 +295,7 @@ do {									\
 	case 1:	__get_user_asm_byte(__gu_val, __gu_addr, err, __t); break;	\
 	case 2:	__get_user_asm_half(__gu_val, __gu_addr, err, __t); break;	\
 	case 4:	__get_user_asm_word(__gu_val, __gu_addr, err, __t); break;	\
+	case 8:	__get_user_asm_dword(__gu_val, __gu_addr, err, __t); break;	\
 	default: (__gu_val) = __get_user_bad();				\
 	}								\
 	uaccess_restore(__ua_flags);					\
@@ -353,6 +354,22 @@ do {									\
 #define __get_user_asm_word(x, addr, err, __t)			\
 	__get_user_asm(x, addr, err, "ldr" __t)
 
+#ifdef __ARMEB__
+#define __WORD0_OFFS	4
+#define __WORD1_OFFS	0
+#else
+#define __WORD0_OFFS	0
+#define __WORD1_OFFS	4
+#endif
+
+#define __get_user_asm_dword(x, addr, err, __t)				\
+	({								\
+	unsigned long __w0, __w1;					\
+	__get_user_asm(__w0, addr + __WORD0_OFFS, err, "ldr" __t);	\
+	__get_user_asm(__w1, addr + __WORD1_OFFS, err, "ldr" __t);	\
+	(x) = ((u64)__w1 << 32) | (u64) __w0;				\
+})
+
 #define __put_user_switch(x, ptr, __err, __fn)				\
 	do {								\
 		const __typeof__(*(ptr)) __user *__pu_ptr = (ptr);	\


